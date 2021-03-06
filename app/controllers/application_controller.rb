class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = User.find(session[:user_id]) || User.new
  end

  def logged_in?
    !!current_user
  end

  def require_login
    return redirect_to sessions_new_path unless logged_in?
  end
end
