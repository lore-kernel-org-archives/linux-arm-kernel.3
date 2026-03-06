Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE97F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBIID2C3tYCLC3ROIp9HZ27Vwpuc9s7YKBLnBBIirXY=; b=UQf5xzilp6hNLHZ9ZG3KUbDxnW
	KnA8pEqylY+srrZRxK/h72p3l1rNgUB7kc5trf6toS3iBmBzVnp294QDhjNpMMcxvQhBNSdgRyZNF
	2ApqO+BWN2yoQwMq+Fbb8iJAr32M0FJU8wwXp2ojmIf/VxusQZYYApbpTUvda1rLVPCn/bB3/9/VH
	WghJ06KqibQva+FuBeXQK7yBxDNAyF/377Azr8Qaqle+alNUfMUB4ds5bN6+fwARh4OZZw6gVuiol
	WqIkHj44bkrdT1BcUHqCBu+ZKT8tqmFSOS0nARaJTrwPlhJAGkCr0opaQJPuNuX6ABr+baimdbVJy
	f87H8mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJJP-00000002nSI-1BqB;
	Fri, 06 Mar 2026 00:45:03 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJJN-00000002nRw-1jGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:45:02 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae8177446fso1473065ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 16:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757900; x=1773362700;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBIID2C3tYCLC3ROIp9HZ27Vwpuc9s7YKBLnBBIirXY=;
        b=aMqqA4beZlBX+SadfeDJHGPSWqpOyGDttjN9weaW0pZ6V5dRi9WJvdLSBF0KLdu3eq
         t6PNwwW0ZJSW+oBF6Sk4XtIjGr6kcBOloUR+/HTQ3fio4BRZq/X+3t1GpZOEwwjpHl/G
         1qGQYlIbbu1Z5RuSOoXcoS2tBggOocrCPV2t66VSuzo4tyg1InBOTvAB04B3ju+0khDh
         uJZuQo1tJq1AZNqE/xff5qKbuwJ+4xhV25iYok4rXlibl9jY5ZI4my4VZMxY+XEsoo06
         bESF+LpDxcGq3PlFyC4a0pyFQ81O7C6N16L+wYtcuw1yEIly5BAkQ0Gx/FdnPYQlFlfE
         DMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPOaslUCddQMQMdeazQ2n+rlwAx8ICTHiUGgUChwCjea9alDU8Yu1j5bOn9BB2yBiWAE3HxLKKSZLM6lAuThyl@lists.infradead.org
X-Gm-Message-State: AOJu0YyQCkRtfENlSEBn3lfP1MEju6KqVeNML810+BkvQeI1ejsXHhnY
	olbK1fywLUoOSCBYXQpAFlFtmoxYizB7eyFwXaWKuu6Gyp0M12isEEjeRkxDBw5jLz8=
X-Gm-Gg: ATEYQzzPSdRomTlOkDoyXwbeefLERC9ySunlitgnq5P5665Q1/Y/fLPnQiJ1lbNAFDn
	n61BbAFnTgTxAmP9j+DwuQgyYxs15DjOtGKy3Nke2DLUzHmSTUd9Q5JuSZ0FT31dLSMgdE4Qisf
	s+mg8pHxi/5+Qm0fRlpqWgoV/DgWRLIu+QIHn6E/pGzSsSpVvjT6Z7ipxTa2BV0flfy/ZG1nH3V
	ZnRUSm+7WS75rCprwMF5yf77eOU9UYKTYz43SFrN27l2VgnTeJ+VkIgRFwkzxJabvffvlnLaowJ
	VaOfm3X8l9+qwIcfuGiNrzbbEVYBU/V+g6bVDiV/aXIE0tiqZnyjTMLp6iJBgnmFalYxeoq39zs
	9w9wv7s+SR3PbDHAuXWJjkB27DU9jhcXtmnloAH2+CzPdPhhuRxiw1w12XCIWIn3eqQu4BYq0Bk
	iHIMsYXGUTjXui8qQCg1b9
X-Received: by 2002:a17:903:18d:b0:2ae:5eee:7a5 with SMTP id d9443c01a7336-2ae8241df4emr3858265ad.12.1772757900350;
        Thu, 05 Mar 2026 16:45:00 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4651e409sm180143885ad.44.2026.03.05.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:44:59 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Frank Rowand
 <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] ARM: omap1: ams-delta: convert GPIO hogs to using
 firmware nodes
In-Reply-To: <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
 <20260305-gpio-hog-fwnode-v1-4-97d7df6bbd17@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:44:59 -0800
Message-ID: <7hy0k5okfo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_164501_454341_A975DAE6 
X-CRM114-Status: GOOD (  17.04  )
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

Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> writes:

> Setup a software node hierarchy for the latch2 GPIO controller defining
> the required hog and stop using legacy machine hog API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 16392720296cd224732450c85419c35bbab506f6..1bec4fa0bd5e8bfc58103d1f24b22176707fd26f 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -556,10 +556,30 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
>  	&ams_delta_nand_gpio_table,
>  };
>  
> -static struct gpiod_hog ams_delta_gpio_hogs[] = {
> -	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
> -		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
> -	{},
> +static const struct software_node latch2_gpio_swnode = {
> +	.name = LATCH2_LABEL,
> +};
> +
> +static const u32 latch2_hog_gpios[] = { LATCH2_PIN_KEYBRD_DATAOUT, 0 };
> +
> +static const struct property_entry latch2_gpio_hog_props[] = {
> +	PROPERTY_ENTRY_BOOL("gpio-hog"),
> +	PROPERTY_ENTRY_U32_ARRAY("gpios", latch2_hog_gpios),
> +	PROPERTY_ENTRY_STRING("line-name", "keybrd_dataout"),
> +	PROPERTY_ENTRY_BOOL("output-low"),
> +	{ }
> +};
> +
> +static const struct software_node latch2_gpio_hog_swnode = {
> +	.parent = &latch2_gpio_swnode,
> +	.name = "latch2-hog",
> +	.properties = latch2_gpio_hog_props,
> +};
> +
> +static const struct software_node *const latch2_gpio_swnodes[] = {
> +	&latch2_gpio_swnode,
> +	&latch2_gpio_hog_swnode,
> +	NULL
>  };
>  
>  static struct plat_serial8250_port ams_delta_modem_ports[];
> @@ -684,7 +704,6 @@ static void __init ams_delta_init(void)
>  
>  	omap_gpio_deps_init();
>  	ams_delta_latch2_init();
> -	gpiod_add_hogs(ams_delta_gpio_hogs);
>  
>  	omap_serial_init();
>  	omap_register_i2c_bus(1, 100, NULL, 0);
> @@ -693,6 +712,9 @@ static void __init ams_delta_init(void)
>  	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
>  
>  	platform_device_register_full(&latch1_gpio_devinfo);
> +
> +	software_node_register_node_group(latch2_gpio_swnodes);
> +	latch2_gpio_devinfo.fwnode = software_node_fwnode(&latch2_gpio_swnode);
>  	platform_device_register_full(&latch2_gpio_devinfo);
>  
>  	/*
>
> -- 
> 2.47.3

