Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A612ED0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n55Op3UqcWWU67N4sB49bAMgh41vNphv9As8fpaG8HY=; b=MShnaB1FaqzSkcf4WGM1joGoUW
	wRQa2rFygAQSHOIoIB97N9j4b9QqkRNSza7jW0hza8xsslX6jPfRo3rrt6/skBIs6K93Sz9qgCvun
	CMjCypMJ0mv7Eo25wd86qtzWycnIe9jf3c6Ke0P/2E2y2EgV4Yq8RYGAS7PDKDDFXxZP2lF5GHFzJ
	7myGTMrpLo2Rh6Pbx4bGwl4pwQ7OeaNL6/vTKG/4h0iuLYkslThPj0/Gfwvm6FhOx5jJQRKZ1OayO
	UPCtgOJeCGF9aR/TN0XeYWQ1qa81v8+Pi3t7hIzxs1yF9BdX+JZNfSUnAHqH/svEBEROh1tdTYzB/
	rgkxtbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KAv-00000003n5V-2Kyq;
	Fri, 25 Oct 2024 13:16:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4J48-00000003bV7-3F9i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:05:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so273543966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729857914; x=1730462714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n55Op3UqcWWU67N4sB49bAMgh41vNphv9As8fpaG8HY=;
        b=MFFpEnE48aOiQqe5MAwieK+G0TyVepERS0NltVwAIGyQ7g87UO5a4kFJb+YdXGuvwf
         BZVj1SbNFG/28jPQ8JbsGGy9iVnNGkTiqHEoLXMKmvgz6cy0PIP5hIxNHzBXb+aV5J9x
         WvzYlvuxRHiGvazdEGQF3jKQEd3Bhvk3mhh8TxvQuAt2tYtTyV4rW4A45qAoxbdb6c3w
         oFlbNrytoDZ9ysxF3kl49pB9MpYxOJl12NCaQUu3BMNV+Xfb1akiuf8XrdBZ6dh5T68q
         9WutJ9drGiAnXOb5EQ8t/5f9pjq+hSFpjEAwiWg7EwJJ7B10l36qPCENIVuodKywvb9D
         YUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729857914; x=1730462714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n55Op3UqcWWU67N4sB49bAMgh41vNphv9As8fpaG8HY=;
        b=EOBEIDUIFmJ9aThiOOjUn1Mlr9g9TyvoeTSdWjPS1Afp2rfyxpvRR5S5/FqsGNIdG/
         bzWepKUGREyiU+vI08Qj0eYifU7HliommNvVD/8n949fkLd1acYVYH47eOzBH9Lhn5t9
         URcSFN8a6pYoXgZFmhE8pf8VDTaMQPJf+8toyFMoiIeZhWkVxFh09sdNE9TxFkXndaeN
         Csu3SiPMb9C/DtPpD3ebuDWgtC9aajf/oayNmyVz7m5UN8GSWCbyfNLGUuosgfoueT2i
         soUoOVxpKQOHAbIAO3gToovHrs1PH2yfg0metXepkjEGpxZczKXoqn1S275MwaSe4jqJ
         9oVg==
X-Forwarded-Encrypted: i=1; AJvYcCUjUKHFfgDHmcSyQwtsmm23gr9KHAlDVN5smKzi8o3IMllAhLrcegwtCOmYWJQxX2/ekcWlyB3HhSX2urFUbsQk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0UR6gQWrbYGc93n5ZewZT57h55BTMpyg+ryYsJvMwHe7As8S
	JcrZynWJbQ5lGN7u+xL4dYq7SH28hu331N+Xp0KvG6deYA/ETTa+
X-Google-Smtp-Source: AGHT+IEgxndYncmXIKU0ddfgTEva136EAcXhqGZWyYOw+Fz1SxoHJQFDKEucO2k00JnM5YuW4D7XDg==
X-Received: by 2002:a17:907:3dac:b0:a99:ce2f:b0ff with SMTP id a640c23a62f3a-a9abf8a4f1dmr912091766b.33.1729857913759;
        Fri, 25 Oct 2024 05:05:13 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30d6fdd1sm64153366b.170.2024.10.25.05.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:05:13 -0700 (PDT)
Message-ID: <77e2f191-3a40-4282-ac1e-d1a9069043d4@gmail.com>
Date: Fri, 25 Oct 2024 15:05:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
 <20241025-exynos9810-v2-12-99ca3f316e21@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-12-99ca3f316e21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_050516_858906_B740B765 
X-CRM114-Status: GOOD (  20.36  )
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




On 10/25/24 14:24, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
>
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
>
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile               |   1 +
>  arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 120 ++++++++++++++++++++++
>  2 files changed, 121 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b235892eef38cd926905e02f0ce08278..6760b3d59e819fb52bc8cf4dc6877a0b9db9ce47 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
> +	exynos9810-starlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..7e01118e591284267f155883c236ed811d5c629a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S9 (starlte/SM-G960F) device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +/dts-v1/;
> +#include "exynos9810.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Samsung Galaxy S9 (SM-G960F)";
> +	compatible = "samsung,starlte", "samsung,exynos9810";
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* In stock firmware used for assistant. Map it as a camera button for now */
> +		wink-key {
> +			label = "Camera";
> +			linux,code = <KEY_CAMERA>;
> +			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3c800000>,
> +		      <0x8 0x80000000 0x80000000>,

Sort these.

> +		      <0x0 0xc0000000 0x20000000>,
> +		      <0x0 0xe1900000 0x1e700000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +

Drop empty \n.
Otherwise looks OK to me.

Best regards, Ivo

> +
> +	key_wink: key-wink-pins {
> +		samsung,pins = "gpa0-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};
>


