Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB4CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWXrP1biBRVYfhrhl3Fs6qE0BQgKKe9yf0UVNL2tW0Y=; b=ViOs2gZiyykhkgcF9lU1TZ0XBN
	nmeH2lxl7AOAHuHdujNNFldn3Axo2wjoab6sznpggn9cw/BtuYmuw0+qnIuK9vf4QQ3rthLrmxD8k
	u6TeOskDpyMmpqkd3I9+YSKBWoubATocSKE4K5QBnKQmjkcZ0YjgVI4QWREOsOpwvmwyWdMlrvA/k
	QXO+lORcNhchebGNdvFbeiqn88780yXIGsgzSTg5fGMvQeYy8gDQtH3RJ6sg2OYv1l/tN4z/tPGEB
	2/jKYDiN3bOcgDE1Nm2YCWICoHQ8O5j56Ys5WWa24GwR68gaX1Go1syAto483jeR7d5/Euuh7iXvq
	DLr3h6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUjt-0000000AItH-1vt8;
	Thu, 13 Feb 2025 08:38:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUa7-0000000AH4M-1gEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:28:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso77603266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739435302; x=1740040102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWXrP1biBRVYfhrhl3Fs6qE0BQgKKe9yf0UVNL2tW0Y=;
        b=N14zex2aQT6T5PblmrFApeGER8uSvlqI2pfbzsx6t375PIvDDj2D7/YJ8jul2cj0sw
         mCMWrGolnpIm5L40XSkC+FxCjGOiBaWObC4TRvM7JWE14VDTXAm6IHPSmTB9OgS9KToP
         JOqKUw9jkwEntuWKAYHpJRmuD0Od+5lOu2yc8rG+t5sedMbHxJGX/Zxwb03S9onqqf7F
         5J/M0sMFZknOtf07z7O87m4RNWVJMzOuGITL5V0EhdLyzxpNQIXBq6+JN/VLd2lmVLjb
         SL4oSOTLo8OThveZ3ho7pGrDKVO5O/5Ruv2uCw1c+ClWM8PgmagirOEbDGIJYMsnnkWo
         xfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739435302; x=1740040102;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWXrP1biBRVYfhrhl3Fs6qE0BQgKKe9yf0UVNL2tW0Y=;
        b=crXzFOywRdRi/c0HPZIteqDbmahrvcPOvftWGqXx1jUL41Proe1WcGTnCuAQu8PiWq
         OUWZZeisr5w2kPOCd5FvejL3L9YaOgY7tYi6kZ5IH5diAPo2uQ7jWlA6rz71PquUdiss
         UqppCV3z8sn3uqVunU6M1jYcSe25B0MM4SiOJe/ZWClZLBGMOYD+sbVlGupbfXxGU9fu
         aZi7l6oYPFSDYiBEV6MlaiPNkT1jzUP1Oi+Vk4uNmebR8ifaUJRtoARqwcTbJcZmeS+O
         oK5X4djsll6PjyNH5IPfNqLkh7n+kVUPnELu4PyQS+VkiQqRHo/qxGK7kU9uLOFNYw6N
         2Myg==
X-Forwarded-Encrypted: i=1; AJvYcCWdcQt64xyebC3G/JNCblU1zCiq0I9G/Hcox80wJVytBvnj4AZ6RHpwcEh42r18lTAc6q+48HHDK0Z74y6J8RAO@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQNDaJ7SbTki/N6bzGrWQXKj12R8QicCNgM7AATBV+mwDnnRM
	zU8GenMbbhqcJc6kMHWpMgxe1S9cEuKICDohAF0ud9utEDtGqYWdBlSnHllo29k=
X-Gm-Gg: ASbGncvW5hdrUmCPj/cuxogvb/KCFyRlib3oXYO5v6aD4JXJx7df+A5tqZ/O2GTNfQF
	XbiqCU8szIRxV76xoZxUL8PCF5NlXXyJg1m9TMH/mN+AVOhAv1tAqnhbtqNNgMApiQ9/px4qTa/
	aEXMRh/ljtXV3s+IIasulvH2VV3ARQpQmTfXx6vbbc+A7k81wKJGG6ko2pne79lbe7OKtk9CtRd
	8vEF2U/oXy1S7zmt3MJ7+/xkcFuurNO8D7Yo2k+JIAwa19bGD6QqLMhGZWcP2EIsU63FHpk/bVE
	knqmkLrntyDBzF3Jfnzl6m3+
X-Google-Smtp-Source: AGHT+IHp0wFc6lnyAccZeSIcOl6s43d7ybkx0g4TFeTVLObl1F1VkXxMGejHB9/VvyPpzOW9TCX7pg==
X-Received: by 2002:a17:906:3652:b0:ab7:f92c:9015 with SMTP id a640c23a62f3a-ab7f92c9331mr374928166b.4.1739435301467;
        Thu, 13 Feb 2025 00:28:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d94asm82747366b.143.2025.02.13.00.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:28:21 -0800 (PST)
Message-ID: <2885fac1-edb3-4251-8e4a-3da92d3b3974@tuxon.dev>
Date: Thu, 13 Feb 2025 10:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] ARM: dts: microchip: sama7d65: Add Reset and
 Shutdown and PM support
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <d8578cb635ff5b01e42132bd40a12b31c8638800.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d8578cb635ff5b01e42132bd40a12b31c8638800.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_002823_445344_20AE67F4 
X-CRM114-Status: GOOD (  15.34  )
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

Hi, Ryan,

On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for reset controller, wake up alarm timers, and shutdown
> controller.
> 
> Add SRAM, SFR, secumod, UDDRC, and DDR3phy to enable support for low power modes.

Can you split it in individual patches? E.g.

1/ add reset controller
2/ add shutdown controller
3/ add rtc support
4/ add rtt support
5/ add PM support


> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 77 +++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 854b30d15dcd4..1d40235bdab0a 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -46,12 +46,42 @@ slow_xtal: clock-slowxtal {
>  		};
>  	};
>  
> +	ns_sram: sram@100000 {
> +		compatible = "mmio-sram";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x100000 0x20000>;
> +		ranges;

Please follow order proposed here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n112

That would be (for this node):
- compatible
- reg
- ranges
- everything else

> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		ranges;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  
> +		securam: sram@e0000800 {
> +			compatible = "microchip,sama7d65-securam", "atmel,sama5d2-securam", "mmio-sram";
> +			reg = <0xe0000800 0x4000>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 17>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0xe0000800 0x4000>;
> +			no-memory-wc;

Same here with regards to order and dts coding style.

> +		};
> +
> +		secumod: secumod@e0004000 {
> +			compatible = "microchip,sama7d65-secumod", "atmel,sama5d2-secumod", "syscon";
> +			reg = <0xe0004000 0x4000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		sfrbu: sfr@e0008000 {
> +			compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
> +			reg = <0xe0008000 0x20>;
> +		};
> +
>  		pioa: pinctrl@e0014000 {
>  			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";
>  			reg = <0xe0014000 0x800>;
> @@ -76,6 +106,31 @@ pmc: clock-controller@e0018000 {
>  			clock-names = "td_slck", "md_slck", "main_xtal";
>  		};
>  
> +		reset_controller: reset-controller@e001d100 {
> +			compatible = "microchip,sama7d65-rstc", "microchip,sama7g5-rstc";
> +			reg = <0xe001d100 0xc>, <0xe001d1e4 0x4>;
> +			#reset-cells = <1>;
> +			clocks = <&clk32k 0>;
> +		};
> +
> +		shdwc: poweroff@e001d200 {
> +			compatible = "microchip,sama7d65-shdwc", "microchip,sama7g5-shdwc", "syscon";
> +			reg = <0xe001d200 0x20>;
> +			clocks = <&clk32k 0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			atmel,wakeup-rtc-timer;
> +			atmel,wakeup-rtt-timer;
> +			status = "disabled";
> +		};
> +
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>  		clk32k: clock-controller@e001d500 {
>  			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>  			reg = <0xe001d500 0x4>;
> @@ -83,6 +138,18 @@ clk32k: clock-controller@e001d500 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpbr: gpbr@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};
> +
> +		rtc: rtc@e001d800 {
> +			compatible = "microchip,sama7d65-rtc", "microchip,sam9x60-rtc";
> +			reg = <0xe001d800 0x30>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 1>;
> +		};
> +
>  		sdmmc1: mmc@e1208000 {
>  			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>  			reg = <0xe1208000 0x400>;
> @@ -132,6 +199,16 @@ uart6: serial@200 {
>  			};
>  		};
>  
> +		uddrc: uddrc@e3800000 {
> +			compatible = "microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc";
> +			reg = <0xe3800000 0x4000>;
> +		};
> +
> +		ddr3phy: ddr3phy@e3804000 {
> +			compatible = "microchip,sama7d65-ddr3phy", "microchip,sama7g5-ddr3phy";
> +			reg = <0xe3804000 0x1000>;
> +		};
> +
>  		gic: interrupt-controller@e8c11000 {
>  			compatible = "arm,cortex-a7-gic";
>  			reg = <0xe8c11000 0x1000>,


