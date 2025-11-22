Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968BCFC539
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbgH1togCEu70x2vN5bqkQ02nuE6gEO0wQ/tYHMUFhY=; b=Ks69tA9XgXga2HTwqq/HTYZqfh
	PuLx1zaaW+RNndjGQvTFouFqE1LdZDMA5sfXGDFbgQ6H7oUanLfpcp49CYfN7Bdhp8StKrcbYuPr4
	qbVtSSEi0r51qGqgnxRAiizni+XNKFyeO1g9w0Ea8jj9jmrADlx+NaXd0rDHEleQE76aaSYFoi9kV
	bRjeR3Emj+hjTU6SmymCL5xJlZxl0epy/OvzSpXPdYIZkuhIVmed720vK6qgTynHi/VL0mFG62CA2
	nm82dLvNpSV3/69iM58KN1lit6n2WqHSytWFcB6Wl3j80Vt5dZgcmSLxTuARyJgEZQaHeAk36rE/M
	s3V2PCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMoV4-00000009etn-2ECh;
	Sat, 22 Nov 2025 14:22:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMoV1-00000009etL-1B4d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 14:22:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1727697f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 06:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763821321; x=1764426121; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbgH1togCEu70x2vN5bqkQ02nuE6gEO0wQ/tYHMUFhY=;
        b=YNHMFjzanYUEnSiBiiRKVgODOtbKqrCKSu/yj31FROb3b+36yJb/cBTtvWIuth8PEk
         KRLccJ+db5SP0XyVYOKaUv6XOItN0pFryiOoDIC4k3C3zUsxu5Ym+jizLUOhueM6puT5
         9yIDCEtLkDC0rSj18wQSRo9l/zMImrlCG6CLqaUbNNh4COjsSocJKDw+y1gJ6HDbHn7C
         RZ7DeXQJJpA+iUKjQO8SIwwccS4HMjA4uvPQB2/9MYp2xRooMnbrp7elRvl+CaqIMcvQ
         kN8SAfAiD+C+z1fJu+fYFhZT/SdZ7vqoIbxQwqo5fObpgP5mWyL5whhyI9/VlHJieVir
         3wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763821321; x=1764426121;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbgH1togCEu70x2vN5bqkQ02nuE6gEO0wQ/tYHMUFhY=;
        b=PO+lSLZQRd5/NJbhREcLI52YXMaTBB4TjqW9wkja+0pyPu5RE4+lOHsDMIzjWdBb56
         tOV/j2LXO1Y6cIElNxWtA7EVN7wPJ8ic6e1uRet69tm2VxEHxwI5PpSUUG1LIEP6xe7m
         WO6BykvUdXiTr5Jnrnj+6b5p8zvL+KQkbna8J+Bz5UX/Oe0G3dM99R1OZoY3fGsxkj7f
         UQqdtg/XLmM4j15NOQlAtuTovyaKMPFonoT74T6FxpXvmKVwpQa74anVRNtobr/bMCKE
         y2V7vH/19fcjFHPvb7iZVtzSXu6hESqtSJRw1ILP9gbraMyZqQ8G00CKxQc0ULOaAq/O
         UDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVUH3wizY6lDY6EgV8d6V//sPOrJ7sBtaLe/jGWgmEzsjeHsm09Oy2mn1J+oQFJo2uEifp2sTZ896Kk3WSQ9N1@lists.infradead.org
X-Gm-Message-State: AOJu0YzqtnIwz149lTQvTkINkYx2X+L8CUj53IN5pq7XzsgtlofHxD5O
	x2G/XabPnGCLunhXJai8gs46XIKr3+gQGT7X1gCrBeTmk2jYYWPi+Zc1V+3HGoZfl6k=
X-Gm-Gg: ASbGncsMw4hdhpTZfDd/nI5UeykZnVQR9Pfr7E2Rer+unxZrvaSM0wXwobCjGtAp9tA
	iRH5+aD5UunjMPtEgDKMsYsITRJM1zjt5nDbls2lcBoaL1VYoMGtaSt7+zf5EjYa1os9/sfcaNh
	ACnu9RL6BAQWJ6Z6a+A8bElY1L6oAS5f9he9eAntaCYLh4Ur2RjwUtXgfx62/wCQWMyGdhnm1S0
	Gi4Ban2kSLD/I7Et4omQIVnaTJOeF0daet8jLPH9U/s8FhEVjo8gWpvSrj7JphaqGXdkdo1p5v9
	jY04Jrc5B8jkiVyalqxkvHEg5dY4P/WsgKEJ/FIpJCM1Ea4flfr8EJ+rHaEzrO/xOSQ0qgBnF4K
	pJ47esypnNcnmYjuTHK1n33Ld/zzozxv1CbMBWH1YQSud82QucnlkTtgPWjq+U7tg8VmKQPWIJQ
	NEGE3b4RpOMbKMNgqj21A=
X-Google-Smtp-Source: AGHT+IFqel5FKG4mPclsUJOqrx9rHT/z6E4W3n3TtUFun9s++jfXNrwVrDGfd3VnkelnXn+GP4CMhg==
X-Received: by 2002:a05:6000:40df:b0:42b:40df:2338 with SMTP id ffacd0b85a97d-42cc1d22c88mr6452923f8f.52.1763821320827;
        Sat, 22 Nov 2025 06:22:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm16341540f8f.21.2025.11.22.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 06:22:00 -0800 (PST)
Message-ID: <0d21cf40-3614-48f4-86e0-69c7a87458e9@tuxon.dev>
Date: Sat, 22 Nov 2025 16:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: Add support for pcb8385
To: Horatiu Vultur <horatiu.vultur@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wsa+renesas@sang-engineering.com,
 romain.sioen@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251117125709.102013-1-horatiu.vultur@microchip.com>
 <20251117125709.102013-3-horatiu.vultur@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251117125709.102013-3-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_062203_446091_5CBF59C7 
X-CRM114-Status: GOOD (  19.60  )
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

Hi, Horatiu,

On 11/17/25 14:57, Horatiu Vultur wrote:
> Add basic support for pcb8385 [1]. It is a modular board which allows
> to add different daughter cards on which there are different PHYs.
> This adds support for UART, LEDs and I2C.
> 
> [1] https://www.microchip.com/en-us/development-tool/ev83e85a
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |   3 +-
>  .../boot/dts/microchip/lan966x-pcb8385.dts    | 137 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 79cd38fdc7dab..08986c24a4700 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -102,4 +102,5 @@ dtb-$(CONFIG_SOC_LAN966) += \
>  	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
>  	lan966x-pcb8290.dtb \
>  	lan966x-pcb8291.dtb \
> -	lan966x-pcb8309.dtb
> +	lan966x-pcb8309.dtb \
> +	lan966x-pcb8385.dtb
> diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> new file mode 100644
> index 0000000000000..f4817cee93436
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * lan966x-pcb8385.dts - Device Tree file for PCB8385
> + */
> +/dts-v1/;
> +
> +#include "lan966x.dtsi"
> +#include "dt-bindings/phy/phy-lan966x-serdes.h"
> +
> +/ {
> +	model = "Microchip EVB - LAN9668";
> +	compatible = "microchip,lan9668-pcb8385", "microchip,lan9668", "microchip,lan966";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	aliases {
> +		serial0 = &usart3;
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
> +		open-source;
> +		priority = <200>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-p1-green {
> +			label = "cu0:green";
> +			gpios = <&sgpio_out 2 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			linux,default-trigger = "e200413c.mdio-mii:01:link";
> +		};
> +
> +		led-p1-yellow {
> +			label = "cu0:yellow";
> +			gpios = <&sgpio_out 2 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-p2-green {
> +			label = "cu1:green";
> +			gpios = <&sgpio_out 3 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +			linux,default-trigger = "e200413c.mdio-mii:02:link";
> +		};
> +
> +		led-p2-yellow {
> +			label = "cu1:yellow";
> +			gpios = <&sgpio_out 3 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +	};
> +};
> +
> +&aes {
> +	status = "disabled"; /* Reserved by secure OS */
> +};
> +
> +&gpio {
> +	fc0_b_pins: fc0-b-pins {
> +		/* SCL, SDA */
> +		pins = "GPIO_25", "GPIO_26";
> +		function = "fc0_b";
> +	};
> +
> +	fc3_b_pins: fc3-b-pins {
> +		/* RX, TX */
> +		pins = "GPIO_52", "GPIO_53";
> +		function = "fc3_b";
> +	};
> +
> +	sgpio_a_pins: sgpio-a-pins {
> +		/* SCK, D0, D1, LD */
> +		pins = "GPIO_32", "GPIO_33", "GPIO_34", "GPIO_35";
> +		function = "sgpio_a";
> +	};
> +};
> +
> +&flx0 {

This would go after aes node to have them alphanumerically sorted. I can
handled it while applying, if any.

> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> +	status = "okay";
> +
> +	i2c0: i2c@600 {
> +		pinctrl-0 = <&fc0_b_pins>;
> +		pinctrl-names = "default";
> +		dmas = <0>, <0>;
> +		i2c-analog-filter;
> +		i2c-digital-filter;
> +		i2c-digital-filter-width-ns = <35>;
> +		i2c-sda-hold-time-ns = <1500>;
> +		status = "okay";
> +	};
> +};
> +
> +&flx3 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
> +	status = "okay";
> +
> +	usart3: serial@200 {
> +		pinctrl-0 = <&fc3_b_pins>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +};
> +
> +&i2c0 {
> +	eeprom@54 {
> +		compatible = "atmel,24c01";
> +		reg = <0x54>;
> +		status = "okay";
> +	};
> +
> +	eeprom@55 {
> +		compatible = "atmel,24c01";
> +		reg = <0x55>;
> +		status = "okay";
> +	};

Any reason for not keeping these above under "i2c0: i2c@600 {" ?

Thank you,
Claudiu

> +};
> +
> +&sgpio {
> +	pinctrl-0 = <&sgpio_a_pins>;
> +	pinctrl-names = "default";
> +	microchip,sgpio-port-ranges = <0 3>;
> +	status = "okay";
> +
> +	gpio@0 {
> +		ngpios = <64>;
> +	};
> +	gpio@1 {
> +		ngpios = <64>;
> +	};
> +};


