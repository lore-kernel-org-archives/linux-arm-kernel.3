Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0533FCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqJrUsfEO14skXwVHw60ZeSAxfYi13UplTdLpgZgptc=; b=X5+HJVr1UoE2ya6p+bwSMB7uqy
	rlV2+QI6O0mb2yaa7gAACWH8Aft/tcxWKNK92qlBQ3gYhCo3wv/WMddHpBPk6PoWRlGMDGfiNaoP3
	+ZPj794t1DbcqN7Hmgo8a3eluuvDbm3T8ADVvNRbgSqQEbLClD3SX2u+xfPnPXs4WX2bP7WR+yGL1
	dq2PU54jlTPfdVAz/KklHfiPwJ7nBUy5NROxoQnddt0mLiIDxLdDSewujdsSs3fw9x00DJObkwJAJ
	6P978UJlqildBnJpMQDP+TBsjA8sPDJzP9hjfrFMPzlytwU1uGk1yzgOwpOHFayV3ObCYi5ZBPzlV
	JnWBg1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulanR-00000009Glz-1dv0;
	Mon, 11 Aug 2025 22:15:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulakp-00000009GSU-0UbA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 22:12:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76a3818eb9bso4446729b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754950350; x=1755555150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqJrUsfEO14skXwVHw60ZeSAxfYi13UplTdLpgZgptc=;
        b=OlH8r+jEUGF129+HkLWoo1pG7DEd91uNKBajq33COA+l7k1M7jwYnlZbOY5CTMLcj7
         wBRhzaRSJt4ivFLyC01Lik76CnTJkGeorHuwlAULCbTu9QB6W6vKIhC8CCh8nU3kEu65
         FC54WKKcbIi2qzykZJAs1G3JuJowLWZ4hToRLCjnbDP2XgSK0Lzggzmw0waTqgQ7p3ME
         9Ssxc005MNFOhV1CdL+D6ZyiMoRwaQcw9oBrfSVD1F6/7TCh+CU0j3/Exz3AwCPSmHmm
         Ag9X0CCnXkAicaG3e0c9zwNnD03HWVEaGk6UnSJJN6l12LUHxsBrei3xMy3/yOV62BI0
         442A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754950350; x=1755555150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqJrUsfEO14skXwVHw60ZeSAxfYi13UplTdLpgZgptc=;
        b=VypBcfwnH6ma2tL1s+UZ9mk125sFsd3i31jZxFbvrj3P4C+SlzuWB5Kw8cOCLmDle/
         ONZldXeEVr26qZILSepw81NcZh4cH8SSCAHoopqNOfoh17D4+WHcDk+NQWZSOJvfz9x2
         4NwYYacReEidQ62mWNB0JWO0Yy/bYuETT3pcaQyRQ8RhcoIH3XtVz6AGpoLU7bZChQpy
         e/fcc3nxraA5gGEnNrMD7U3FqTZJwBsYYOOBHdN8OKaB2fPMZV0Xsy5bz4ghDGEsdBBX
         HAFcPZVFPcu3J2O9M20i4KPv0m4iABY6Yyn18EwgiraaRa5Pij0GxLyNgY3Wo07DlOCv
         BocQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG5uuWs9vFwoydVKy+yZFvyg0gSEpyw+w4g8UZunBL5Gy9e5JHJnqr2Ew7SQV0OkHGi6W4cJE/hpRU0ggKzw8D@lists.infradead.org
X-Gm-Message-State: AOJu0YyVHLIvo3fOJXSaZ/z8aq4A11e78/XYfT9jpMKNLFxoPSVQQUc/
	F0MwEwmxUuOKdR0X4eVPRqFOjUcmNC4ORWG+AMce/GAkv4wtuHXJtd8T
X-Gm-Gg: ASbGncsP8q2L8JseWLHBOpDItMsDwfZZjpiozz+8OrD/KuWzjUCFI7FF1oPtO+34mOL
	rk3ShShPv33nUMfGIkoLYznMxrWrl4Rs3jyNS0ZK40FXulOly1P+4UWq5Zfz2nWnyZZWt5N2ro3
	+aOmbmFnabGzV6Z8QV5BkokP/vTmLET2pcYF6TAe9kmFSyeMSm3dCUe4FTEHFsir8JCk7RK/M6n
	YA9v1VhlfNZtq1oHmbE5Gx5pSGCIoCMbD3k7oM2bjXuiVsAAemU5IJg5wF7Ri6D5BceQUeRB9Zb
	TK18SlNZNBTtvOEITyYNn128+4oPSukJywIdzp5lWzhIBZEJ5L/GEmYXh/PaakQJSWnUlsmwwb+
	gfokeL52Ffpc8BXFnQkn5pF/S3Lcoq5tLgA==
X-Google-Smtp-Source: AGHT+IHQ0wKiPFm7cQpdNNp8qTVDuZceywWB+nCRVoQFGfyGYnmGBMcF0PmiZ748OX9kCYU59/mZzg==
X-Received: by 2002:a17:902:ea08:b0:240:1bdc:afc3 with SMTP id d9443c01a7336-242c225a785mr207173445ad.44.1754950349923;
        Mon, 11 Aug 2025 15:12:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976a1csm285249835ad.78.2025.08.11.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:12:29 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:12:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 19/21] usb: udc: pxa: remove unused platform_data
Message-ID: <jlhn73mol2g65mnbfya7w4ejtkddkkus4miii6js44x7rni2x4@54tm5dblenk4>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-20-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-20-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_151231_160462_738C8FA1 
X-CRM114-Status: GOOD (  30.88  )
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

On Fri, Aug 08, 2025 at 05:18:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-pxa/devices.c              |  7 ----
>  arch/arm/mach-pxa/gumstix.c              |  1 -
>  arch/arm/mach-pxa/udc.h                  |  8 -----
>  drivers/usb/gadget/udc/pxa25x_udc.c      | 41 ++++++++----------------
>  drivers/usb/gadget/udc/pxa25x_udc.h      |  2 +-
>  drivers/usb/gadget/udc/pxa27x_udc.c      | 35 +++-----------------
>  drivers/usb/gadget/udc/pxa27x_udc.h      |  2 --
>  include/linux/platform_data/pxa2xx_udc.h | 15 ---------
>  8 files changed, 19 insertions(+), 92 deletions(-)
>  delete mode 100644 arch/arm/mach-pxa/udc.h
> 
> diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
> index 7695cfce01a1..edad956a1483 100644
> --- a/arch/arm/mach-pxa/devices.c
> +++ b/arch/arm/mach-pxa/devices.c
> @@ -11,7 +11,6 @@
>  #include <linux/platform_data/i2c-pxa.h>
>  #include <linux/soc/pxa/cpu.h>
>  
> -#include "udc.h"
>  #include <linux/platform_data/video-pxafb.h>
>  #include <linux/platform_data/mmc-pxamci.h>
>  #include "irqs.h"
> @@ -83,10 +82,6 @@ void __init pxa_set_mci_info(const struct pxamci_platform_data *info,
>  		pr_err("Unable to create mci device: %d\n", err);
>  }
>  
> -static struct pxa2xx_udc_mach_info pxa_udc_info = {
> -	.gpio_pullup = -1,
> -};
> -
>  static struct resource pxa2xx_udc_resources[] = {
>  	[0] = {
>  		.start	= 0x40600000,
> @@ -108,7 +103,6 @@ struct platform_device pxa25x_device_udc = {
>  	.resource	= pxa2xx_udc_resources,
>  	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
>  	.dev		=  {
> -		.platform_data	= &pxa_udc_info,
>  		.dma_mask	= &udc_dma_mask,
>  	}
>  };
> @@ -119,7 +113,6 @@ struct platform_device pxa27x_device_udc = {
>  	.resource	= pxa2xx_udc_resources,
>  	.num_resources	= ARRAY_SIZE(pxa2xx_udc_resources),
>  	.dev		=  {
> -		.platform_data	= &pxa_udc_info,
>  		.dma_mask	= &udc_dma_mask,
>  	}
>  };
> diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
> index 1713bdf3b71e..6074815a4bca 100644
> --- a/arch/arm/mach-pxa/gumstix.c
> +++ b/arch/arm/mach-pxa/gumstix.c
> @@ -39,7 +39,6 @@
>  
>  #include "pxa25x.h"
>  #include <linux/platform_data/mmc-pxamci.h>
> -#include "udc.h"
>  #include "gumstix.h"
>  #include "devices.h"
>  
> diff --git a/arch/arm/mach-pxa/udc.h b/arch/arm/mach-pxa/udc.h
> deleted file mode 100644
> index 9a827e32db98..000000000000
> --- a/arch/arm/mach-pxa/udc.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/*
> - * arch/arm/mach-pxa/include/mach/udc.h
> - *
> - */
> -#include <linux/platform_data/pxa2xx_udc.h>
> -
> -extern void pxa_set_udc_info(struct pxa2xx_udc_mach_info *info);
> -
> diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
> index b97fb7b0cb2c..bad151aedec1 100644
> --- a/drivers/usb/gadget/udc/pxa25x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa25x_udc.c
> @@ -12,7 +12,7 @@
>  /* #define VERBOSE_DEBUG */
>  
>  #include <linux/device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/ioport.h>
> @@ -261,24 +261,12 @@ static void nuke (struct pxa25x_ep *, int status);
>  /* one GPIO should control a D+ pullup, so host sees this device (or not) */
>  static void pullup_off(void)
>  {
> -	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
> -	int off_level = mach->gpio_pullup_inverted;
> -
> -	if (gpio_is_valid(mach->gpio_pullup))
> -		gpio_set_value(mach->gpio_pullup, off_level);
> -	else if (mach->udc_command)
> -		mach->udc_command(PXA2XX_UDC_CMD_DISCONNECT);
> +	gpiod_set_value(the_controller->pullup_gpio, 0);
>  }
>  
>  static void pullup_on(void)
>  {
> -	struct pxa2xx_udc_mach_info		*mach = the_controller->mach;
> -	int on_level = !mach->gpio_pullup_inverted;
> -
> -	if (gpio_is_valid(mach->gpio_pullup))
> -		gpio_set_value(mach->gpio_pullup, on_level);
> -	else if (mach->udc_command)
> -		mach->udc_command(PXA2XX_UDC_CMD_CONNECT);
> +	gpiod_set_value(the_controller->pullup_gpio, 1);
>  }
>  
>  #if defined(CONFIG_CPU_BIG_ENDIAN)
> @@ -1190,8 +1178,7 @@ static int pxa25x_udc_pullup(struct usb_gadget *_gadget, int is_active)
>  
>  	udc = container_of(_gadget, struct pxa25x_udc, gadget);
>  
> -	/* not all boards support pullup control */
> -	if (!gpio_is_valid(udc->mach->gpio_pullup) && !udc->mach->udc_command)
> +	if (!udc->pullup_gpio)
>  		return -EOPNOTSUPP;
>  
>  	udc->pullup = (is_active != 0);
> @@ -2343,19 +2330,17 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
>  
>  	/* other non-static parts of init */
>  	dev->dev = &pdev->dev;
> -	dev->mach = dev_get_platdata(&pdev->dev);
>  
>  	dev->transceiver = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>  
> -	if (gpio_is_valid(dev->mach->gpio_pullup)) {
> -		retval = devm_gpio_request_one(&pdev->dev, dev->mach->gpio_pullup,
> -					       GPIOF_OUT_INIT_LOW, "pca25x_udc GPIO PULLUP");
> -		if (retval) {
> -			dev_dbg(&pdev->dev,
> -				"can't get pullup gpio %d, err: %d\n",
> -				dev->mach->gpio_pullup, retval);
> -			goto err;
> -		}
> +	dev->pullup_gpio = devm_gpiod_get_index_optional(&pdev->dev, "pullup", 0,
> +						    GPIOD_OUT_LOW);

I think this should be GPIOD_OUT_HIGH: you want this to be active and
GPIO is likely "active low".

Thanks.

-- 
Dmitry

