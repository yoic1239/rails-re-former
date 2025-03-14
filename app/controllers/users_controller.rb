class UsersController < ApplicationController
  def new
  end

  def create
    # @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    # @user = User.new(user_params)
    @user = User.new(username: params[:user_username], email: params[:user_email], password: params[:user_password])

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
