Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC7BD1CA30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RDLe17+douEMkUYt4Wjjg5zMXictGIxgKdWzTriDi8=; b=a8DJxYiQw7TyndDv48ij6c39HZ
	XKIV3SapURVJGMw+aXkfoPdDm4sY3i3uBS+1BzXtKOdZ372A0BHtiDsD9FrzpdhQTxE7ILVTQ7K0U
	fGvkWTSsGI0ilzEonftVcl/FN5A0ncGJqV5tlfkKxzEDBz0YSvpZKPrBmxyo2S0vCHFAYx8ySAthP
	mPxe5f+12MsNXflsvVDmkbFjS/AwmXGDpbweXGGUbiVP0+9X1uth3J41Vr82D+EpUlmWZKeGL/JCG
	5ratD4As3KHkvQ/o2W4VyD6TofEkagSPJH1A08kwIMgxf2IWEqyVFMOT+TrysJ8iAQkHcEwxMJFef
	y1DaAfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CQZ-0000000Fy8R-08Sw;
	Tue, 05 Nov 2024 05:48:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8CNW-0000000FxgO-0Bxz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 05:45:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ee386ce3dfso3975788a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 21:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785521; x=1731390321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RDLe17+douEMkUYt4Wjjg5zMXictGIxgKdWzTriDi8=;
        b=BqDuwFXR7uYsEPcgFcoS7AmyZL55gnNFQLUev5PfG9BiXWs/I97nukI52xbqHsZoHK
         A1/jU71SySC/QcW1YQ1oDn6UL6+4O2XyKMIf5iuOO9UggckYqJeE8WdCDzEJwcomDnc7
         k3ptZj2AglQ1py/i1f+PT0WEcohmWKZvRH5XG87CeOxLiZa/KXvrzdpIuS1WETm8Pmrz
         lxEs1z0oBLDywCg408o5TGEXJ6jFDgNVNdkgx479gqLF7A0jdDkmoNcMSRneSh3FFGrG
         dG4q1iXxl36Pb4zfZubzO5UCgWnyZyoUeq16fsEp8HQy1CwHqBiBKi3YVn01LFB1G52I
         9Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785521; x=1731390321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RDLe17+douEMkUYt4Wjjg5zMXictGIxgKdWzTriDi8=;
        b=qcM6J9ww+cTOlL/qntpGL/3LO3YGk2TQm2OsNPS9Rz6Grky+y2mxUHSysDvj0Qlxml
         4Sx5qs0Qb9jntYwMeYtnSfup6vJRmOM8lV+0lLrSYfvF7ouPQON0u3L6KWqTuTohvaQz
         +rVCFOMWyNQJERAWFA2ycA80myK+wXyhIHc/niyAqxXHwPbIQuOgULJz1pNaQH60IjO9
         n/UBRU6itZv2dbadO/Fcq/rTeSCacXsQeKkMY1girs3V9SSgALsBmkM63gqmgPnhbdxs
         vUp24ttoOqXK0xcLpb/S9YqSw3OkP2OU3xbhJcca3icpwM+2LYHY1IiFPSU7p2cb4OXJ
         IWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8xCLzoaxFUVVL2TNN3cBLQQemDfDK+exsR9MYla83Ek5gEjTOCQBdAraa51AURkoJh14w6VXi7sX1zQ+36kfN@lists.infradead.org
X-Gm-Message-State: AOJu0YyDoJ8vS8JAX0fhuGMakNgKl8TPYK4iWMfBCUCX/SRv/p5X3BEO
	Sh7TauT3aVASSGRj++jM3TckoGjAgzJ5nZmUN3vFKjI1DGVMuW8H
X-Google-Smtp-Source: AGHT+IGc+nG1wt+DMP+moaC/TTecbd98DJcbFy/BYzWTbFGMHiYt+g49EqO/yY9xHvXO/9A1wYjT9g==
X-Received: by 2002:a17:90b:3ec9:b0:2d8:b510:170f with SMTP id 98e67ed59e1d1-2e94c23344emr19375465a91.20.1730785520437;
        Mon, 04 Nov 2024 21:45:20 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a60d6sm69822985ad.124.2024.11.04.21.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:45:20 -0800 (PST)
Date: Mon, 4 Nov 2024 21:45:17 -0800
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
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using
 GPIOF_ACTIVE_LOW
Message-ID: <Zymw7fduuSyCCdeS@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214522_106880_F39B98AF 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, Nov 04, 2024 at 11:34:20AM +0200, Andy Shevchenko wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 41ca0d3c9098..e6707d72210e 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -306,13 +306,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  			 * Legacy GPIO number so request the GPIO here and
>  			 * convert it to descriptor.
>  			 */
> -			unsigned flags = GPIOF_IN;
> -
> -			if (button->active_low)
> -				flags |= GPIOF_ACTIVE_LOW;
> -
> -			error = devm_gpio_request_one(dev, button->gpio,
> -					flags, button->desc ? : DRV_NAME);
> +			error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN,
> +						      button->desc ? : DRV_NAME);
>  			if (error)
>  				return dev_err_probe(dev, error,
>  						     "unable to claim gpio %u\n",
> @@ -325,6 +320,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  					button->gpio);
>  				return -EINVAL;
>  			}
> +
> +			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
> +				gpiod_toggle_active_low(bdata->gpiod);
>  		}
>  
>  		bdata->last_state = -1;
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Dmitry

