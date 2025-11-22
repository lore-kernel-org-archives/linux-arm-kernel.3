Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFCCFC53E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTyNC1+UYoKVAcGxt2SVHOhb/Uf0xrNXGcZihp5xtts=; b=OCoX4Hvx9zs5HV/MF0cs6MrgDC
	RV7In44wZZDnmse02haSq3Otm1Y/RDTSwIQ5tL4cKyZxbBcqhpnpCVyBYOOWj7/BaXeC/9DT9h0aQ
	PfzzU4bh9XwKbOmeMSOkbhgXRN1QoorepMG0+YZs14hhJ0UlG6kiZA4M8rTrtbbAcQIqKxqzkxKXm
	PMBoUZejOVXBbIHmeQcfRstyX/WqpjO7DWPHsaRA9AuYIgJyiJmJlNorm83SovKopEfYq7+8P6YpY
	pl0sEBXwhbpHw7vYcPNgRr1NFstZrp1U+QK6soK6lmdbG3Q/kB7Y1TIfefUPYiRNWkHaWp7MS7b+f
	p4z30Opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpgB-00000009hNA-2Xf4;
	Sat, 22 Nov 2025 15:37:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpg8-00000009hMT-1A8a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 15:37:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47774d3536dso23131115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763825854; x=1764430654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTyNC1+UYoKVAcGxt2SVHOhb/Uf0xrNXGcZihp5xtts=;
        b=QGRWZ5Dkx3yUnV//B3/k7HhXr3diqu87CcBqvuu1q85FpTa+jNd8ZxmxqETIh/5WOa
         d1OfCDamKe72Wqsa7Z1P83O6kxSVuEaY8IdcV7r8w1n5I/U76ubGdV30OBV+n8DJRKDq
         Q5HWZ2Jb3HoqzLruXLrEtKmdvGZzZ5Z9wUu3YcZuQou31YSNkkhSkKZATFzzrwS3vtTe
         twq1TMq524lhVfroYMCaboPqCkFpBCntBxHj1vCvVoWXb+FmLO8e26N2sxR4PTQX3x5A
         Sae8ffDK13S+4qCEX8EZNHr1fbt95P8fIdJdQbYqFhKLs+YhsHoguVI7fFFr3zpUv79t
         Rx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763825854; x=1764430654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTyNC1+UYoKVAcGxt2SVHOhb/Uf0xrNXGcZihp5xtts=;
        b=gUdjfaKY8zw2tZkL81h3ax4xQMEQc4F04emThFMJ5z6EjifCJgrr0NQS4e7SCtaff5
         0QB0MsS1vkImQJwULJKzdOFyLLfH5TD/amYzq8e4X6njpp+S3adAJ3Wv5+Ue0zAiCyDA
         JuOOj9Al90l9+jYdzCYRLc+HSSb9qDeD3/iutvOxo/FPpAYn3lj2hyyD4bjb1oBanDrC
         n6o/3632h+FpKa5N3glGYgBVv+Xn3vCFEFKF9V0rnaoYDA29A+GYn970FDn+ig/tYbSI
         nCtuIiij6QyBjIK1AA1XYdzLQxuNDTpnHw7y0TiT5yRzMBEfgH7KjMjB+wDwNThu8qCp
         UanQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Iw9HEJTXqHCyuiBD0csZ6mo4ZNsrTmWbvpdEtrr8wMqqfAFb0WSH+RqjvmBT85IbDZa58vYoy+Htt+M0n0v/@lists.infradead.org
X-Gm-Message-State: AOJu0YzmCZlkk1S5nYvfEFnYi1GOI7XyrmrjOX64xF5UUVCaml2i5uqS
	cKH4N+rPpil1LNCupHpSokMGGsMqYyFr1mvu6t9WiTb+Gc//LIC7vjHfOlGcJ1IipsA=
X-Gm-Gg: ASbGncsA/IB5sRaTqLUa6y0fTpJsYhvN0cCs/RMUDUJY96WNDuWjk7x0Lyi5Mn7T1gr
	EA7RJaS4hq7FPkekw8LxvsIy5yLUMQYwIIxXn+t/Fs4LR8sneSZWMgrzlPE1ShfoUg6qiuHuvil
	VtCGnujjKLsk8UOA+gmoq1DuFp4sJIBh/M234eIa7JhorP+/pqloMPXgnMP/IpE+LoF7JBPXwom
	PbbzA0jFUykpcAdtUO5lpmJDpnEQw2PYn6q1XhnK9VWQU/AT7GkUY47yvMQW365jHzOcs0dPOpv
	eBFx/aZkVWC3jRKE468nkX7uyHLigbJ4PcPQ5hv6iySXTuRV1EptJEOp9u8tbGKrVNpLcGKW2A1
	Z52wb0eqLcVD6Rf+kz1FKcLAHwzaoQxRz7L5TGJNBV/y2qlDr4L3FlUU7WDigBuyxU6AZvy3g09
	mT86ypw1rVkESN1XDsYZ5ZbgkeHsgShA==
X-Google-Smtp-Source: AGHT+IGNsCW8GaBWE80eC552ADlIIeLb1DFaNnNWkr5NJ5EoHsoPa7vEmJGXkXIjZpH3a0KG8muD6g==
X-Received: by 2002:a05:600c:4f45:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-477c04db9a0mr64162485e9.8.1763825854228;
        Sat, 22 Nov 2025 07:37:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3aef57sm93496025e9.11.2025.11.22.07.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 07:37:33 -0800 (PST)
Message-ID: <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
Date: Sat, 22 Nov 2025 17:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late
 hook
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_073736_351561_BDC24819 
X-CRM114-Status: GOOD (  15.80  )
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

Hi, Rob,

On 11/20/25 23:37, Rob Herring wrote:
> Move the AT91 PM init functions to .init_late hook to ensure driver
> dependencies have probed.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

'From: Rob Herring <robh@kernel.org>' != 'Signed-off-by: Rob Herring (Arm)
<robh@kernel.org>


> ---
> v2:
>  - new patch
> ---
>  arch/arm/mach-at91/at91rm9200.c | 3 +--
>  arch/arm/mach-at91/at91sam9.c   | 3 +--
>  arch/arm/mach-at91/sam9x60.c    | 3 +--
>  arch/arm/mach-at91/sam9x7.c     | 3 +--
>  arch/arm/mach-at91/sama5.c      | 2 +-
>  arch/arm/mach-at91/sama7.c      | 3 +--
>  6 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
> index 4f8186211619..2ac564eb8bbb 100644
> --- a/arch/arm/mach-at91/at91rm9200.c
> +++ b/arch/arm/mach-at91/at91rm9200.c
> @@ -17,8 +17,6 @@
>  static void __init at91rm9200_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	at91rm9200_pm_init();
>  }
>  
>  static const char *const at91rm9200_dt_board_compat[] __initconst = {
> @@ -27,6 +25,7 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
>  };
>  
>  DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
> +	.init_late	= at91rm9200_pm_init,
>  	.init_machine	= at91rm9200_dt_device_init,
>  	.dt_compat	= at91rm9200_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
> index 7e572189a5eb..cf07cba4ee5d 100644
> --- a/arch/arm/mach-at91/at91sam9.c
> +++ b/arch/arm/mach-at91/at91sam9.c
> @@ -17,8 +17,6 @@
>  static void __init at91sam9_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	at91sam9_pm_init();
>  }
>  
>  static const char *const at91_dt_board_compat[] __initconst = {
> @@ -28,6 +26,7 @@ static const char *const at91_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
>  	/* Maintainer: Atmel */
> +	.init_late	= at91sam9_pm_init,
>  	.init_machine	= at91sam9_init,
>  	.dt_compat	= at91_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
> index d8c739d25458..a31beaaeffcd 100644
> --- a/arch/arm/mach-at91/sam9x60.c
> +++ b/arch/arm/mach-at91/sam9x60.c
> @@ -18,8 +18,6 @@
>  static void __init sam9x60_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	sam9x60_pm_init();
>  }
>  
>  static const char *const sam9x60_dt_board_compat[] __initconst = {
> @@ -29,6 +27,7 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
>  	/* Maintainer: Microchip */
> +	.init_late	= sam9x60_pm_init,
>  	.init_machine	= sam9x60_init,
>  	.dt_compat	= sam9x60_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
> index e1ff30b5b09b..0c73f7fefd4f 100644
> --- a/arch/arm/mach-at91/sam9x7.c
> +++ b/arch/arm/mach-at91/sam9x7.c
> @@ -17,8 +17,6 @@
>  static void __init sam9x7_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	sam9x7_pm_init();
>  }
>  
>  static const char * const sam9x7_dt_board_compat[] __initconst = {
> @@ -28,6 +26,7 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
>  	/* Maintainer: Microchip */
> +	.init_late	= sam9x7_pm_init,
>  	.init_machine	= sam9x7_init,
>  	.dt_compat	= sam9x7_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
> index bf2b5c6a18c6..efae697ce29c 100644
> --- a/arch/arm/mach-at91/sama5.c
> +++ b/arch/arm/mach-at91/sama5.c
> @@ -33,7 +33,6 @@ static void __init sama5_secure_cache_init(void)
>  static void __init sama5_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -	sama5_pm_init();
>  }
>  
>  static const char *const sama5_dt_board_compat[] __initconst = {
> @@ -43,6 +42,7 @@ static const char *const sama5_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
>  	/* Maintainer: Atmel */
> +	.init_late	= sama5_pm_init,
>  	.init_machine	= sama5_dt_device_init,
>  	.dt_compat	= sama5_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
> index bd43733ede18..3e28727f2a8e 100644
> --- a/arch/arm/mach-at91/sama7.c
> +++ b/arch/arm/mach-at91/sama7.c
> @@ -17,8 +17,6 @@
>  static void __init sama7_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -	sama7_pm_init();
> -}

} was dropped as well.

Thank you,
Claudiu

