module RoutingFilter
  class ResultWrapper
    RouteWithParams = Struct.new(:url, :params) do
      def path(_)
        url
      end
    end

    attr_reader :url, :params

    def initialize(result)
      @url = result.path(nil)
      @params = result.params
    end

    def update(url)
      @url = url
    end

    def generate
      RouteWithParams.new(url, params)
    end

    def sub!(*args)
      if block_given?
        @url.sub(args[0], yield)
      else
        @url.sub!(*args)
      end
    end
  end
end
