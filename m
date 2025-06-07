Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DCAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpUIHwpdzY2CZpI6afE7z92XFQ6X7B6sr22AD7rh7/o=; b=SN9ENhThMFkp0viy1cmtNe+SWr
	tVk+MUjqsJw3T8v2BPLVVj0DtfZIh/RsqF4SskzwSbZ8vwVDHjScuI/0tvIGFWw0MCg792o3GWkrV
	8XJu6NCJpMYTMDFnHDPESnTsl/aeXPgmkXNQEICMDSOP01zaaIAKJnmeMXwGybNqC2QGNpa6bMJpR
	At0dX3KXoZfnBnOBlMQf57IUQr5yP6f2rcGo09sTyIo+AtxYqhlzdDpalODlKeku16jE/JGNOasRE
	n6IB/WztYBACeiiwJ1bUWnu+KhDl7gto4Vy5gUXiM2XXnVMhECfqn0LCX1Aa76OvKxfIJGLt14gV1
	8V79OTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrzG-00000001cpt-0YkP;
	Sat, 07 Jun 2025 11:45:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrvq-00000001c8A-2zqi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:41:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so4668384a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296509; x=1749901309; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpUIHwpdzY2CZpI6afE7z92XFQ6X7B6sr22AD7rh7/o=;
        b=PoK7jPR2YJE91fOIz2TiqZ8hMRv3iDSZCPWTDHhUOoOGYyOBQiL/eqmrKOrjKpVuaT
         99EOp5S6z9vWYvh7Lc3klp11JblTcys9ivNvRgN58ZKG1dWIxjm7mWdvuXBjxG/qSr8y
         QIm/XfotSIrlLlp0StYdgtF0F9p4XcsflgdytLweEm+JYyc1fzGGQ2hPTkf7qHy18qBT
         /IwsMlIjuyUoY9TWvQ04IlxhqUHVwzNkxUbLD3GyuBQm86sj/fl0U4ny7I6H+DexTgip
         xOZshZNCvGBKkR3HbyQTAzDr1sWjwB1TsSJQVglbh/Xm8Vef3JMyKJvcDReORASEUNSw
         2oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296509; x=1749901309;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpUIHwpdzY2CZpI6afE7z92XFQ6X7B6sr22AD7rh7/o=;
        b=QdqoftfHA51Z1OxIiApq4XtPj38sXqwej1v6Z+di1AhjrKmdX9yAVts/0d/hKF+Hjp
         t26Q9sZFtZj+ZdESa2L5iWJ8LS3q8oV65+LGaILyA6GGDepRkqySKD5fTt9D4JZFAcAK
         FXi24uMLIr6b0rjwF3l/kTXBra8iUUwlGYVX43h1Kk45KN6df2IhL36vlQwTDVEr+nqm
         IojM9w6dhGmXJp+zXy+EbeeAfJFM0BjJrQ0kAOQmsPlG/KPKDR9wQaUqj7swJa4QrDPQ
         nDtUZbHnYGuDXrjikTajan4lnyTntVRFvYT2irjroRMCiM2wFFX+u/zs/YibVyrHGpd8
         KU9w==
X-Forwarded-Encrypted: i=1; AJvYcCUrhTuNVq0XmMK9BKz9awrd8FyNiuxolsKmRsIWK8fRSJEIM61GZikRqYuVZqQHTFuLE8YZpMe4054CeJzSxvjg@lists.infradead.org
X-Gm-Message-State: AOJu0YxAWPIQYs6BVbEOXrlQrcTZJvGGOeBrH3/YQGXTTNbMSVJsroAc
	nLTetE6yelDexNYV/wOedC7pLk9KlFNM8yryrAuXn0EKe4bV8zaS+DfkRKjRb1l2a5g=
X-Gm-Gg: ASbGncuIL26UKGvMzq3sY8B3R94C5N1zZEcN24r9lvV9N6DXXbdyC8MX6Pgof1COl77
	T1LPJV+5zpNqBZYF8Je3vOIUAxmZi3t+Nir7OpCLIu8s+R5CfD9Phw+Q1w0U1NOwS5a1uynUUol
	IYgIOXrq9GVro5DWQ2NBD04fCi1uacyM2X6r+S1FvVTl7ZYaQyZGoSj0uQ4dnqqPeZc9b4Nxgaz
	S2qQOSdWfgwOcTkZAhx7g/jdXOwMP+1OKYb1FLzN0HQnCxxhXC8f9e8x+JNgg9KLmdmKT72S4q0
	KtxSTVfHbFgSrf4uKUiqT/wg7YDspEDhY9Kasp41uM4KZ06ciPr51hDxX8wG
X-Google-Smtp-Source: AGHT+IF+6xpy8Lxdm6lC66+KC/dopAh/IjXL4qdeSW+s29AFBKWuEN5NwskU3wTPxVH1rP+CS4zbfw==
X-Received: by 2002:a05:6402:13cf:b0:601:6c34:5ed2 with SMTP id 4fb4d7f45d1cf-60773ecbf9amr5548576a12.4.1749296509159;
        Sat, 07 Jun 2025 04:41:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077836ff44sm2281966a12.8.2025.06.07.04.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:41:48 -0700 (PDT)
Message-ID: <c150550c-bba6-48d5-90c9-d52db1f039d5@tuxon.dev>
Date: Sat, 7 Jun 2025 14:41:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ARM: dts: microchip: sama7d65: Add crypto support
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <5d045fc3be18fcd6644f14b9568f1f8d7c8d75a1.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <5d045fc3be18fcd6644f14b9568f1f8d7c8d75a1.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044150_757745_6F41BB88 
X-CRM114-Status: GOOD (  12.32  )
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



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add and enable SHA, AES, TDES, and TRNG for SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 39 +++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index d08d773b1cc5..90cbea576d91 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -186,6 +186,45 @@ sdmmc1: mmc@e1208000 {
>  			status = "disabled";
>  		};
>  
> +		aes: crypto@e1600000 {
> +			compatible = "microchip,sama7d65-aes", "atmel,at91sam9g46-aes";
> +			reg = <0xe1600000 0x100>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 26>;
> +			clock-names = "aes_clk";
> +			dmas = <&dma0 AT91_XDMAC_DT_PERID(1)>,
> +			       <&dma0 AT91_XDMAC_DT_PERID(2)>;
> +			dma-names = "tx", "rx";
> +		};
> +
> +		sha: crypto@e1604000 {
> +			compatible = "microchip,sama7d65-sha", "atmel,at91sam9g46-sha";
> +			reg = <0xe1604000 0x100>;
> +			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 78>;
> +			clock-names = "sha_clk";
> +			dmas = <&dma0 AT91_XDMAC_DT_PERID(48)>;
> +			dma-names = "tx";
> +		};
> +
> +		tdes: crypto@e1608000 {
> +			compatible = "microchip,sama7d65-tdes", "atmel,at91sam9g46-tdes";
> +			reg = <0xe1608000 0x100>;
> +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 91>;
> +			clock-names = "tdes_clk";
> +			dmas = <&dma0 AT91_XDMAC_DT_PERID(54)>,
> +			       <&dma0 AT91_XDMAC_DT_PERID(53)>;
> +			dma-names = "tx", "rx";
> +		};
> +
> +		trng: rng@e160c000 {
> +			compatible = "microchip,sama7d65-trng", "microchip,sam9x60-trng";
> +			reg = <0xe160c000 0x100>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 92>;
> +		};
> +
>  		dma0: dma-controller@e1610000 {
>  			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
>  			reg = <0xe1610000 0x1000>;


