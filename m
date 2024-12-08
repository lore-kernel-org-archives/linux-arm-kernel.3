Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813CCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NqubRXx7yB7hllGexLKx/eAFws2OmJDZVjdgSdgh80=; b=aPxZc1V9oPm5xNR6HTETSDzbs7
	zQibGQGczhs+GRVMHwQZcD4n8QVi/J0ze59P24+VtRW2lX2VXSSP3Lk6hA32o/A+gRD4sxH8/pDi8
	ZfPil2FRTbLqKc0fehY341jxKu9xrVbFkQ/vY6LbybTc0f5+AeFsxbJxsD+LjNojhmjQHa9Z17V6k
	UkKWK3Yl3tSSGpOHNvRdHqsbrLLx6K8lf/vCjioEU7KizDXYgB7pd5lgveXAzXE1bFouoBSHZWqO1
	1t1EGAZ4rm5YcuuW25u+KidvB5LALv1VBI3QbpoM4mblMkcT+Wcc6fwM2Se4oxWbFm+ly0yWA3yPm
	NkoNBl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKEH-00000005Yud-3QRv;
	Sun, 08 Dec 2024 16:33:57 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKDF-00000005YnB-1mXt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:32:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9ec267b879so691250366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675572; x=1734280372; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NqubRXx7yB7hllGexLKx/eAFws2OmJDZVjdgSdgh80=;
        b=LEjRHWXy6Iu3u1Uv+2/DG6/dCBvL8/awAMnuTY1RLrWqn9m4asCaG33lSGG5Js27Ga
         +QxOXtg1sHMUQi2Uhxf0vwx7dViLY4yK5Im9bMLNgtmJoemf7KLy37WlV6Jj3UYVuHoQ
         fc3S+IGYbtcns4xv6DSiFdquaRFV+dW4VHZROOUiWbZj1uD2SrR20JxBAC66r38RhI2I
         qbCOIbpaRmumBO1ozp1m1sxU0FXjxrys7IHcQosZFsFz7WlmKOAUwqxhsOAYIa/jQl+U
         vXaOgsw9W2OpXiS9zfGCxrE7sMvqCAmrBKSwD90nX+a7CUp5rdZnGtNQLYBYu7v1teyK
         F05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675572; x=1734280372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NqubRXx7yB7hllGexLKx/eAFws2OmJDZVjdgSdgh80=;
        b=SFsVOXzV2fDlndf0+9KBCdNIrEyt1TNHJEswiIAtABpk30DvLPaT3IYmjmSe/E4HJ7
         0Qo5uqczNsPJW7qJTj8WqIk/oafkPwaQklyOnh1ha5rxmlxwm5ChpanYlv3/LitKei0s
         T/uH78AZsZZVfnca0tnw8kiKJqpek2yhiNWay0yxio1/UiBsB6I7k0xyUs9WVxqIAo+b
         eneQUr4ogNvL/U8eMOPUeMumFpg3k5WJ8Y+j2eRVWjdwnG0zD+PiCGGugX4l+Sro7784
         lN92JhVA1W7yBRQitLtrFY8/9M/8SDRqj+bOT88+E+mkTymCoi3+az1Ik06lBYP1zFbo
         KpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWw0IFY1vhh+5arWFLNnDXC6xaPeg/d4VCRV4al40adYvI2MerC0qj3+r3pWS+ffN3fmnbIS2er0SaMGWVCrtZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ln/M23HfNDLEUkKXL9IJAJXQ4WaUrchkbg+wDDijMPxCIMr8
	Ixw9v8wZIp+QzcfDMfSZGSQ2Aiyek4prcwZGgXNKib+GJfO1PWzRpPuW03TNLeg=
X-Gm-Gg: ASbGncsIy4I5GPMhWEASH0iVpFW9CCJKYDqZUwfu3vo1X4I81I2MADRIJ44s8911CVd
	1fHQ43W6VmsrHIFyUZg34GQrhr0Yb8nM4Aaxi3n4nqic2D1nO1M/vFxhOFRd8JLqATVNcl2m+2R
	V7zgqjZWok16zTVbCc89vQ7y+w35QB8r6V0ac4Q8Wgxh10YxZBiM9IaEX5uG0I89sViwS7uW3iT
	arLV0QfxnEupP8ZqIyiVQP4CbBjiBbYIC/mMgJ4/mI0nOtKaJOQXzeVeos=
X-Google-Smtp-Source: AGHT+IEUKJnEgo2CRNB3itUfMNJATZ2OLCvbnr9j7GstLcYIkSd9q+ba/XoJW8mC6JiCchqLDbOmSQ==
X-Received: by 2002:a17:907:9556:b0:aa6:6ece:8eb1 with SMTP id a640c23a62f3a-aa66ece9010mr420788466b.54.1733675571952;
        Sun, 08 Dec 2024 08:32:51 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67a4f8dc2sm113804466b.179.2024.12.08.08.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:32:51 -0800 (PST)
Message-ID: <81c686e4-2671-4237-a4d4-cac6cf269d9f@tuxon.dev>
Date: Sun, 8 Dec 2024 18:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: microchip: add support for
 sama7d65_curiosity board
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e47d8c8cdaec834ce080ef8c34b9976228223c8f.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083253_472505_A0778007 
X-CRM114-Status: GOOD (  17.28  )
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
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
> index 000000000000..3aab2c542d98
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
> +&pioA {

Compilation fails for this:

Error: ../arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts:50.1-6
Label or path pioA not found
FATAL ERROR: Syntax error parsing input tree

Thank you,
Claudiu

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
> +		bias-disable;
> +	};
> +};
> +
> +&sdmmc1 {
> +	bus-width = <4>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sdmmc1_default>;
> +	status = "okay";
> +};
> +
> +&slow_xtal {
> +	clock-frequency = <32768>;
> +};

