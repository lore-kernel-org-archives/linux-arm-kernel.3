Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210A6D44D46
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlsNJTCn9Mf4MJaj9q8X/JQzNmVwwA36CrFFcpSA1Vo=; b=ZHZw6BJTVpl8Nu0y+I8Un4hpwT
	JwlutYSIUfGwxu74wpqADq98aCi/a09BZX1WZCZuOeq+CadONAOn0crrFOUd+mSCpypIbrZsdsXlJ
	qLWhOddE7/EMNo3kP7FIWZulP4rRde2VGDC0c6B9R2xPqc0WEx78DvJO11bCgaWLlNL+C1AHvCmpE
	3lhnos6JX+e376OvR+ssOmPRdkTmpCrOJ0ToIoFxILrxWTq3lQIph3mzMvdsc+Gfrph6wTABR1qEh
	zElfKlXhQHnToCDw3tJozEYgyZNCUfIoqpIGSgKCQyxYTTK/g+c1rOGzjqziJsXKZUl9gUW5rNs/Z
	w4mkK/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dV3-00000002mf3-3mLD;
	Wed, 06 Nov 2024 10:42:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cl5-00000002dl6-26er
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E2D9A42B64;
	Wed,  6 Nov 2024 09:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AA9C4CED0;
	Wed,  6 Nov 2024 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730886926;
	bh=RZivVHsX1p8dULP9mNC1LUxwiEF+L/SLxiNfZZN1qRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBIWBSwtMF1lHVxk8kFv5Ld+3FgvQU+Up3RYG+nPrJeI/7oWIsTpH3o1OKU+Q0qqh
	 vsMy90fYuiQWNfhssG0Rx9/yYjW7pD0Tv3uMuO0zU9KilM7TJbeEaq5wkI7Ql+kWIi
	 4uegJ1Az4kcKGYXINFG2SoB6DPzEaEj/iL+E4UdImwZdlt22kUwGGFu54ut7HBl3sc
	 inlNY4wajw6+u43BLb15PKxBapCMh4TnVptbaEbkxrZXdnKXcyw/NuMF5jCunwOKLJ
	 8+PleglAX7gZs3yWnHS8UMAlmH518P7zcXhaZOgXrEhgpfyNmAx06ZpLLgup08EAQu
	 V0AY4hi5o/INA==
Date: Wed, 6 Nov 2024 09:55:20 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <20241106095520.GM1807686@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_015527_629258_8496D676 
X-CRM114-Status: GOOD (  17.81  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 04 Nov 2024, Andy Shevchenko wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-gpio.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 0d59b0bbc002..a3428b22de3a 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  					    const struct gpio_led *template)
>  {
>  	struct gpio_desc *gpiod;
> -	unsigned long flags = GPIOF_OUT_INIT_LOW;
>  	int ret;
>  
>  	/*
> @@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  	if (!gpio_is_valid(template->gpio))
>  		return ERR_PTR(-ENOENT);
>  
> -	if (template->active_low)
> -		flags |= GPIOF_ACTIVE_LOW;
> -
> -	ret = devm_gpio_request_one(dev, template->gpio, flags,
> +	ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
>  				    template->name);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
> @@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  	if (!gpiod)
>  		return ERR_PTR(-EINVAL);
>  
> +	if (template->active_low ^ gpiod_is_active_low(gpiod))
> +		gpiod_toggle_active_low(gpiod);
> +
>  	return gpiod;
>  }
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Lee Jones [李琼斯]

