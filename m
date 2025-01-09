Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47444E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVwMK/eoLRZqZimy4jMPY+H4Af5hsLKL/OPymphu+WM=; b=P/d6YCwsfCFn7NqlhlthXET+LD
	pNxFRQ44cQAReWaX+yFrH2D1EarDRox9muGbtQKkoepjR8Qb6GIgw2dMO1O+joZAuKR6UEeuvdEKD
	6c2rCV1WV41JtKqy98PGYryT3EKD4VLfZOVmrSROEZSlUIcrN85W867LJ1lWZQ8vr7xUBK3RTD+s4
	YQjevC8awvgONNv5YJXvuCqh1OPU9HNQkcKlaMA9QDJNZvBZx71M+lW64Y1nIqneXNHyriSsKGRjp
	i4PAKlaWltTlz7n4CS6+oXblY5CXeEo2YLIVkw30dpzCJT/vWyW4g0M4EMxgmJh+2ZdH5YEFFWZiR
	ePXP5KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoc8-0000000BINN-3j5i;
	Thu, 09 Jan 2025 09:14:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoVV-0000000BH0y-2PEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:07:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso642842f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413632; x=1737018432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVwMK/eoLRZqZimy4jMPY+H4Af5hsLKL/OPymphu+WM=;
        b=fhvbR/BAIUyhABjOQstIo2Rb14AlENau6sEmgxnb6mUvGt75balUmk9ao+jx6RnGVp
         DwScczgBQNYLgP+qJU+EyedD1bWlG3Oukfr7Jl4BE8CduCLlAMH4GuHjiui4yvxelQpH
         7B4ziXeL7wLe8+2ZGVbif2eNpTns9izTXCZBXziM5sP1ox3flJqEVbYMTFtlkH2INdU5
         utz6shpj77XNdwUWF+5rCHt9UeK93VkDplSHNuLm72o8af6kGXx2nIMU6uipxyalkNjX
         yC19DDE496zdvQJsRZ5Xt1Xi1xytC2kOFoF7me7aw1x8ZBHvRk62yMc/EO1FND+0hKxp
         gpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413632; x=1737018432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVwMK/eoLRZqZimy4jMPY+H4Af5hsLKL/OPymphu+WM=;
        b=EBXTBvGk2sWCos+vfx1+O1/iv1SNVSg3Jf7ED2DBzH/10KlkNLUtbUy3uFQkrdjwdw
         BNJJdRsWnagvy0asqjFXb7/3F46dXPwTczSdzFVzKDn3Qu+DwFIBkwbBQaKDMPomAryp
         /JvdfTAyT6wChDMWiNHptrCu7fp3OHOSFLNQoJK1ILFyVjVHsrU0wAUcjJ6AShorpE9N
         10zaKQyMwbfmMczGntCwUAVT3Qj6gC8fIogN0n5dGdHPEIbWUCy1BUHdUiOKg1mvT4gG
         Ic9c9YuBY7w9NCFmNuBr1CPfKdIhQLZeGJvccE/N5lLP7hJu+RInqAQTETbCVQd0Xlz1
         kWHg==
X-Forwarded-Encrypted: i=1; AJvYcCWx6WKWKneHro7iTVVCJux66Cbn/O02L5XerE22/5Kw7lAbYGzWhzPgahj3bP4MYr/Ph5xz7c5yl6cPeftFyRd+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0YCL162BCYjGKfXH+81g78M0KojqaUJlOm9za6deixQlccA2k
	4zp9m0F5ZaJc+YiIkx1QPNbQfmZ6w25ntJFh4JzNax46jQ9qPrAPIHg8mGa3Pso=
X-Gm-Gg: ASbGncuS6m4DQrz//792AnXUjTQ9mabKRHlz6YkijO6tV98jmM+KDwGnh1R9Pcb47SV
	7+TrbkVX4RluRb1tgmH0bzb5LddkmKGTC5XAUJQRdeIrW7iLaCgwjf/ONK6FM8HZqujjO7c5Dtt
	VTf8ztA34iYzbnCCmQI/1FXU5097BALUvNf70iU56XAnup09XauyoLbZ4ZuYLL2jx4meKDgp2dW
	gEZKnA2zBv53qcUR/XRIjgQq5eFVL8w6vykPT/1LiC9qow58nZwehMAsqXUjXzEpw==
X-Google-Smtp-Source: AGHT+IGhNi5rl+/Gx7bgxS1n90tfV8FC+iCZg9Ho0HrN4Il/VGHgdUNthAtV4OGyQQ++lThng+djbg==
X-Received: by 2002:a5d:59ab:0:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38a8730db6cmr5443481f8f.26.1736413631641;
        Thu, 09 Jan 2025 01:07:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d040sm1218431f8f.6.2025.01.09.01.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:07:11 -0800 (PST)
Message-ID: <6e14b7c5-90cd-4d26-9494-610e248267da@tuxon.dev>
Date: Thu, 9 Jan 2025 11:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] ARM: dts: microchip: add support for
 sama7d65_curiosity board
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
 <20250107160850.120537-6-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-6-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010713_620032_D3961A8D 
X-CRM114-Status: GOOD (  18.05  )
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

On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add device tree support for the SAMA7D65 Curiosity board.
> Update the Makefile to include the new device tree file.
> 
> uart6 is related to flexcom6, hence not sorted in alphabetical order.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |  3 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 89 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 470fe46433a9..79cd38fdc7da 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -12,6 +12,7 @@ DTC_FLAGS_at91-sama5d2_xplained := -@
>  DTC_FLAGS_at91-sama5d3_eds := -@
>  DTC_FLAGS_at91-sama5d3_xplained := -@
>  DTC_FLAGS_at91-sama5d4_xplained := -@
> +DTC_FLAGS_at91-sama7d65_curiosity := -@
>  DTC_FLAGS_at91-sama7g54_curiosity := -@
>  DTC_FLAGS_at91-sama7g5ek := -@
>  dtb-$(CONFIG_SOC_AT91RM9200) += \
> @@ -90,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
>  	at91-sama5d4_xplained.dtb \
>  	at91-sama5d4ek.dtb \
>  	at91-vinco.dtb
> +dtb-$(CONFIG_SOC_SAMA7D65) += \
> +	at91-sama7d65_curiosity.dtb
>  dtb-$(CONFIG_SOC_SAMA7G5) += \
>  	at91-sama7g54_curiosity.dtb \
>  	at91-sama7g5ek.dtb
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> new file mode 100644
> index 000000000000..ef6a56db8acb
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  at91-sama7d65_curiosity.dts - Device Tree file for SAMA7D65 Curiosity board
> + *
> + *  Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries
> + *
> + *  Author: Romain Sioen <romain.sioen@microchip.com>
> + *
> + */
> +/dts-v1/;
> +#include "sama7d65-pinfunc.h"
> +#include "sama7d65.dtsi"
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/pinctrl/at91.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 Curiosity";
> +	compatible = "microchip,sama7d65-curiosity", "microchip,sama7d65",
> +		     "microchip,sama7d6", "microchip,sama7";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	aliases {
> +		serial0 = &uart6;
> +	};

While applying this, I switched chosen and aliases to have it
alphanumerically sorted.

> +
> +	memory@60000000 {
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;
> +	};
> +};
> +
> +&flx6 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
> +	status = "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6_default>;
> +	status = "okay";
> +};
> +
> +&main_xtal {
> +	clock-frequency = <24000000>;
> +};
> +
> +&pioa {
> +	pinctrl_sdmmc1_default: sdmmc1-default {
> +		cmd-data {
> +			pinmux = <PIN_PB22__SDMMC1_CMD>,
> +				 <PIN_PB24__SDMMC1_DAT0>,
> +				 <PIN_PB25__SDMMC1_DAT1>,
> +				 <PIN_PB26__SDMMC1_DAT2>,
> +				 <PIN_PB27__SDMMC1_DAT3>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +
> +		ck-cd-rstn-vddsel {
> +			pinmux = <PIN_PB23__SDMMC1_CK>,
> +				 <PIN_PB21__SDMMC1_RSTN>,
> +				 <PIN_PB30__SDMMC1_1V8SEL>,
> +				 <PIN_PB29__SDMMC1_CD>,
> +				 <PIN_PB28__SDMMC1_WP>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +	};
> +
> +	pinctrl_uart6_default: uart6-default {
> +		pinmux = <PIN_PD18__FLEXCOM6_IO0>,
> +			<PIN_PD19__FLEXCOM6_IO1>;

Missing a space here    ^. I already added it while applying.

Thank you,
Claudiu

