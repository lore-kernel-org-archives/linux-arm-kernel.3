Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C1ED1CA2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 05:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKFlu1rGSsQukvkT9KeloJW2B0c6Ugz4QlXCY6/YUKw=; b=gSRxBs6IRlXrnZSAM+1g65fz7i
	BXXS9Q3woUFV8JfQnKcI8JaFMtIcwOpvTXivoDUYQ6WUeLPbBazPoXaCMTTUQiUn3i0iiTRfnomfq
	jrp2EiNUf2plw80U5nagYWOQOHgBI9dV2sqiiXtRPX808m1qaMklRNsG8zg0m3P9i+3byX7g7qiNC
	yOjeUCew28KkKmfuJSuzhVSSikwFg03Bg3o2eEqT58aKUaEjnU0u5X5l9A4CrUS8mDj549sTfKI/u
	z2c8BLceRartDm/90sA7Qn97I7Xq7/uzexzVBMcO7LYslLY7gR02vl8kC6yPAGy14puM8fmh9ABmi
	Jppfug+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8COs-0000000Fxou-2q8J;
	Tue, 05 Nov 2024 05:46:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CNA-0000000FxcH-1M8K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 05:45:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so3480551a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 21:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785499; x=1731390299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKFlu1rGSsQukvkT9KeloJW2B0c6Ugz4QlXCY6/YUKw=;
        b=mIEJAcuUnI9P4vddA1lYA22VGS3vvTCQ1PKKRbyT9A7298REtqNniic4CD0sRu0MOC
         4kEHlacA5mO67irCxEXE/EInQ9zj5rRLRMNnISwPERXsSJFcHGnmifFwgxRPzqpP0njx
         KM98ft8AzvOF9AdpYqGzq2FItT3KzBgbQvKBMN3VyxJSp7q8DVEGjydFl9pRr+4x7BXy
         KoOEjlw21yIz3W6C6nPEsTWMLvq0c1Na14JsWbcD+zvNnwgMbOrvsuliisi2NuDS2t6D
         PSlMvlw4lYTZBx251x9A96SMeurOxVdJKSyLj0rd2p//nNVk5jEhGJGVYETY7jCh2aJ+
         90ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785499; x=1731390299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKFlu1rGSsQukvkT9KeloJW2B0c6Ugz4QlXCY6/YUKw=;
        b=cTmZd7NXueuQSD1jm1Rz8BeiSRpjsqb8iMFhP4Ds4mBYxtmfjnn0e1Z4/k1dgNk1jZ
         2Af5b5Z5PrlUAORdrCQQLy9aRpbP3b7bQXPbLgM0ohubk7LYSl6dygUKOWhhgA6dvijz
         dx9ySYqJ0XCw7Qhbin6OpBy6XDewxnZRbRLBD4adoHsU2eeSX4WnS14GwH3x64ZwI33n
         6pkfc1aJT3Ik47mGY5Y2L/VQWf1Wj7ChPciYClC0gVKccNjd5iD+VS6TU2VlNO7gzzQN
         oA/lV2Ov90xW28TJ9no6uzjT15J8MsiiAlf35kmCVocAFgK7NHo0eKKUnPIdl70aPB/3
         O47g==
X-Forwarded-Encrypted: i=1; AJvYcCVRo1e3ml6SUVyouBLywQolrwiJ2tiWUuPm2s3lWbtuUOb6M7E2z8Mu4+2wqgxjkPJPy8hJ/UGuKEYi/HsDbxld@lists.infradead.org
X-Gm-Message-State: AOJu0YwXe2Smh33i4OcuY7LJFTYGWqS33v+OLYAQdbSi9rSGjcEMtvV0
	TYDn+NXdaZuGxW4MUs/jn+UvN+Jh8RSc+wlmzVKBFyi64/Wp91lD
X-Google-Smtp-Source: AGHT+IFfGfuB66JHWO4NcWfWxC0I2kdjg/uIghAr5FZPGpr7sHO9jl2rgL06JW1h83pKw8joHp3FzQ==
X-Received: by 2002:a17:90b:4a91:b0:2e2:c423:8e17 with SMTP id 98e67ed59e1d1-2e94c295063mr21438945a91.7.1730785498509;
        Mon, 04 Nov 2024 21:44:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8c7sm70499875ad.53.2024.11.04.21.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:44:57 -0800 (PST)
Date: Mon, 4 Nov 2024 21:44:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zymw17NOSw2zciO9@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214500_385525_EF399B80 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, Nov 04, 2024 at 11:34:19AM +0200, Andy Shevchenko wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/gpio_keys.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 380fe8dab3b0..5eef66516e37 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -531,12 +531,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  		 * Legacy GPIO number, so request the GPIO here and
>  		 * convert it to descriptor.
>  		 */
> -		unsigned flags = GPIOF_IN;
> -
> -		if (button->active_low)
> -			flags |= GPIOF_ACTIVE_LOW;
> -
> -		error = devm_gpio_request_one(dev, button->gpio, flags, desc);
> +		error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN, desc);
>  		if (error < 0) {
>  			dev_err(dev, "Failed to request GPIO %d, error %d\n",
>  				button->gpio, error);
> @@ -546,6 +541,9 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  		bdata->gpiod = gpio_to_desc(button->gpio);
>  		if (!bdata->gpiod)
>  			return -EINVAL;
> +
> +		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
> +			gpiod_toggle_active_low(bdata->gpiod);
>  	}
>  
>  	if (bdata->gpiod) {
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Dmitry

