Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7C0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asF3D2ihOKbd8HNb0tatN9FktDeMCIWfujlxMxgR2Jc=; b=0v5D7SEtAD3h/VL1jquTFJ9u7y
	BBHA1oYbc8c7Uq7iQM8cRWiyVZvT3n3i+CaB5WLZNj5O8MPrFO9msRVdb+eUnD0me6VU/DxnFU1kl
	SdRdBy0ksY5sW3MCUMCLTfZoXeNnLX+fZLbsCojoPZELpWaE11HYPEzexvJYSes3hJg7ABUmUIlqb
	Gosr79EnCLvYfT3pyTBwjB5vcQQOC8VpcANTWVwMsJ+/ubUFpD2oXiv3r0XajLpH87YWEj6fdshBl
	mdic7I8Usc8Sh/KS5KVluWfHFz2nbo3PLCzbpmRqjtbIFBEkyuBnecb7crlKBJCIhgUy5ko54sxWt
	vi4A6pjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZT-00000009Afo-25qf;
	Wed, 02 Jul 2025 17:48:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1Ip-000000098Tz-1Rci
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:31:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45363645a8eso50452835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751477481; x=1752082281; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=asF3D2ihOKbd8HNb0tatN9FktDeMCIWfujlxMxgR2Jc=;
        b=fGO9C1Gve0GbnXkevCzErqhlZazJu7T71ceiIKzLsVrttAAFd+eYR1FXPj9jZJDHsi
         dNuAJDgCev/+/WdiK5tAOAkFOIkryK30xZX5zhsKCn5zE4v4ZIp1PhRMfhOMjdNORvZb
         mxohKDKVK4rAljW7bV57xl4qs8bFEb1ZuLPIojqGOqMqKgGDAnq5YbRMPzwPxvkLRyVj
         tCG1Slm7cDrjTSL6Bfb9MDU4zk45qWXh4aOhG27eKotaDWY6qUAxy95omoHue+RzNbhV
         ITtPPQGPKiCmcZ6asMIMAKU1XKXU9+pP7Ufh7IFg2w/+Z9WUF4nwCPHGxL1zWSEYFmkT
         +fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477481; x=1752082281;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asF3D2ihOKbd8HNb0tatN9FktDeMCIWfujlxMxgR2Jc=;
        b=dXy1wk0hr2Q60VonTA3SfeunjnMafgwpQSkpMxXWJWaqx7Edz7MXZww+Ld18Nk53bM
         aB6llhNYL0V3Acsnz/+OBOGQciU00tTce2NxYNpkPzkIOTLwVuGAOLJ+VYbBv28IK2lG
         9XZRoi9QQ6awW+dj7MrBbJjKSm9BxM5FSdxRCfnfiVo01xMoZ3Pay3D8VaWRQw2lRDR6
         yoExQ3SgiR8iBtgvu0UC8SHtWoZH/hLP9UrwUuCQipj6onLuS9UmpsI47eD4DaNybdIP
         xz+7R3aLkdgQr8O65MfQa9wE+kFdeCOJ8zmmqi5gOChpCqax0AwUJAW1SDr3o/BNKfOX
         PY4g==
X-Forwarded-Encrypted: i=1; AJvYcCW6bZMhTwJiEAZbl3iaoWt0S4xjZp++frLUdDAt72m0hJWbXlFM5lIzESODbG+cjYY9F4UOmBdirnYVr9X4BAZ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy71BMxFU9qB38zRMk03+fWXhJE5zbueeKRit3n3fyTdo2mMwdd
	UmFFYrWWNln0xWE/uNMkJbu9gYvLzrwHyCwvfJ2QqInDj9Is4Yl0nWRt
X-Gm-Gg: ASbGncs8NhufB0BOl42XoDmh7BYR2vinv5UdlubGN65rZdLUTJ7APUV6uWdPHSsE2T4
	HO2CD6zhqivER81UTALvvNxpzjcpioDggy73dK+ZoNjWAu67gb13Y6WKZ5t7XWaLNF6XnNU43Ge
	L8omamEhmeYWF+M3d3hYIM13Uty1Nk09L78B41CjMinpf2sgHFmWeGVP4yCSV8lVVlDiBYYlzvM
	NQDpadR+GNOnu+UyFOf+2BmSzd7+zb4KRgyoi3drwxsydnBNey2+wI85e/KADdfavlplbw6QoUg
	SNPFJFIfKHKG7fu2jr+12xdZPRAHEFqN/T6vRu/fYlGgDgzHgr0CQs2Ehnu13pEyAqsajnB6WTw
	KrXQmbHF5/jEOy869uYcPGt61a/6nH9fw1Xhxu+icucjYoeiT30AV
X-Google-Smtp-Source: AGHT+IEy0lczmqisRYiq55PfynlMUAy8/Mwfp/b6dz/a8xMr1aLb26ndDyLOvjuXrp6A/iZDlNiYZg==
X-Received: by 2002:a05:600c:4745:b0:445:49e:796b with SMTP id 5b1f17b1804b1-454a9cc478dmr6992135e9.17.1751477481011;
        Wed, 02 Jul 2025 10:31:21 -0700 (PDT)
Received: from dell.localnet (2a01-114f-400e-9dc0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:400e:9dc0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm16687615f8f.58.2025.07.02.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:31:20 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT v2 4/6] ARM: omap1: ams-delta: use generic device properties
 for gpio-mmio
Date: Wed, 02 Jul 2025 19:31:18 +0200
Message-ID: <12693741.O9o76ZdvQC@dell>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
 <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5899106.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_103123_388692_99A0DB82 
X-CRM114-Status: GOOD (  27.76  )
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

--nextPart5899106.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Wed, 02 Jul 2025 19:31:18 +0200
Message-ID: <12693741.O9o76ZdvQC@dell>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-4-ebf34d273497@linaro.org>
MIME-Version: 1.0

On Tuesday, 1 July 2025 13:49:38 CEST Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The two latch GPIO devices in ams-delta are registered with struct
> bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
> remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
> also able to get the relevant values from the software node. Set up
> device properties and switch to using platform_device_info to register
> the devices as platform_add_devices() doesn't allow us to pass device
> properties to the driver model.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -19,6 +19,7 @@
>  #include <linux/mtd/nand-gpio.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regulator/fixed.h>
>  #include <linux/regulator/machine.h>
> @@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
>  
>  #define LATCH1_LABEL	"latch1"
>  
> -static struct bgpio_pdata latch1_pdata = {
> -	.label	= LATCH1_LABEL,
> -	.base	= -1,
> -	.ngpio	= LATCH1_NGPIO,
> +static const struct property_entry latch1_gpio_props[] = {
> +	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
> +	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
> +	{ }
>  };
>  
> -static struct platform_device latch1_gpio_device = {
> +static const struct platform_device_info latch1_gpio_devinfo = {
>  	.name		= "basic-mmio-gpio",
>  	.id		= 0,
> -	.resource	= latch1_resources,
> -	.num_resources	= ARRAY_SIZE(latch1_resources),
> -	.dev		= {
> -		.platform_data	= &latch1_pdata,
> -	},
> +	.res		= latch1_resources,
> +	.num_res	= ARRAY_SIZE(latch1_resources),
> +	.properties	= latch1_gpio_props,
>  };
>  
>  #define LATCH1_PIN_LED_CAMERA		0
> @@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
>  
>  #define LATCH2_LABEL	"latch2"
>  
> -static struct bgpio_pdata latch2_pdata = {
> -	.label	= LATCH2_LABEL,
> -	.base	= -1,
> -	.ngpio	= LATCH2_NGPIO,
> +static const struct property_entry latch2_gpio_props[] = {
> +	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
> +	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
> +	{ }
>  };
>  
> -static struct platform_device latch2_gpio_device = {
> +static struct platform_device_info latch2_gpio_devinfo = {
>  	.name		= "basic-mmio-gpio",
>  	.id		= 1,
> -	.resource	= latch2_resources,
> -	.num_resources	= ARRAY_SIZE(latch2_resources),
> -	.dev		= {
> -		.platform_data	= &latch2_pdata,
> -	},
> +	.res		= latch2_resources,
> +	.num_res	= ARRAY_SIZE(latch2_resources),
> +	.properties	= latch2_gpio_props,
>  };
>  
>  #define LATCH2_PIN_LCD_VBLEN		0
> @@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
>  };
>  
>  static struct platform_device *ams_delta_devices[] __initdata = {
> -	&latch1_gpio_device,
> -	&latch2_gpio_device,
>  	&ams_delta_kp_device,
>  	&ams_delta_audio_device,
>  	&ams_delta_serio_device,
> @@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
>  	omap1_usb_init(&ams_delta_usb_config);
>  	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
>  
> +	platform_device_register_full(&latch1_gpio_devinfo);
> +	platform_device_register_full(&latch2_gpio_devinfo);
> +
>  	/*
>  	 * As soon as regulator consumers have been registered, assign their
>  	 * dev_names to consumer supply entries of respective regulators.
> 
> 


--nextPart5899106.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmhlbOYACgkQ2WqSnlts
jBqrFAf8Dn8vIXOgPM71DorIvYxA2dblFx/ioM03kGPEIyBdo9u5oreR8gnbeJ0M
6nL5gblHZVjt8w24qn5cS+Y2CE1hERe9+2H27nbeBUt8jR1i+oH6lMNWTxEqcARB
a6t639w3mfDggBfB6ylR/Figq2vACpInNkOMATa0czpIlHks8j/hg4we3HM7ikv/
i8+Yq5lBagufNyl4T2qtAMyR7TLvYommOqsIDJgXd5WwknQSs8doQtQUKjPh9+DF
MBYbY8jYcv6s9LeaUAjbRCXriJm6ja36+fayWHxmrHXdOZyXYxFfrUp3y9JrEZZO
ej3300qSjoZkFgKR/vnA4rJxJP6m6w==
=taj6
-----END PGP SIGNATURE-----

--nextPart5899106.DvuYhMxLoT--




