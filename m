Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2165C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgcSfmx8QyNKOcVQ38dAm0Xv0CbPNNiIYif2A76z1vQ=; b=FK23PIJshqH46omCvBIP5FDl0a
	qHCRkqY52XW3k9XFbktmJx1xWLaBtlF33xGXH5EJezeOZPh7nsJZzvzFKFLtDwvlqbe+0pTNI2kYE
	qWUiuiBowm19K2iRYkQUehQwP1OlDjget7bPdr7ZkQZYaqXjwqg0UihcJfYtLk4BU5YBOCHEEAg++
	KuvkHk3Wb5UwRsltbezpJ1ZbMM7NCmwfPggiDkojI0NhdRcuzy4MowM5laOpUemHWJ+qPPtn/YVmr
	q79lwBkME8Xahl0PtCzpuZUOT+273qWFUFsTbDFVrDtESfUPYldN3Qiu4lIMevyYz9mw3Swj+O63o
	NNbbsSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeuc-0000000CrnJ-0vZ8;
	Wed, 22 Jul 2026 21:55:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeuZ-0000000Crmg-3Uay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:55:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954dff6536so13705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784757329; x=1785362129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgcSfmx8QyNKOcVQ38dAm0Xv0CbPNNiIYif2A76z1vQ=;
        b=dFDBvJiYefkZ45H6fHbjtgDukaymgGVlr2BAWH8b3JrZjfgGvE2iGUvzKy9q/3nvtq
         S8BvCXWyHxinQU6kqwbgtVkweyDEBrmIdt/xO2BEq/7BgI7t8Jn2JZmGnjSbXdhxwPSk
         rkbHd+YObJ4jb2FWLRI5m9XuRpyUh++8k1AO1CqtW3mToO/MBWgMQyChvCMKbuC3a7Yj
         D4Vv9Wt1jn7UGZBT1OUnLoSd7Te9cKzNO+ty96KTq+YGPeRN3OqPprekNLPL5ZCFrZkx
         aIxLYA4Rm6upuG3gsf/EwH7/75XJCg/FAbcDSefwm+19Eg7goxg0eett+E+NeXTN18Sw
         Hk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757329; x=1785362129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgcSfmx8QyNKOcVQ38dAm0Xv0CbPNNiIYif2A76z1vQ=;
        b=MuDYYAOSXJDww2m5qpZH9cK2FyavfoTawUZXg+olo3OwrTcYgL02FseDdV7UBgNLfg
         ZU0DsYJxIJlwrxNmrbUYoPgBgHyv1c2MWWuEXj996FOEX8PHsuwh6DgMShVJBY2Tu/ap
         NlxS3l7CeML0sjQfueaxP2TTkbthhXbnRvJyU0VsU9GLbTK5aYiUWWFliprPeLb3ueOf
         TTRJfItvpvH12OWF8esFc9IYApo/CvvLqhvcqRKQmzsV2woJZH9Vo/kA2Lu5edEDLiyy
         V6kfylA/iJfwdLN6QVnkR4acaoDEUaW5GLzdSamEswPW3rgirFn6r4UmCn3rq3Pb1RaZ
         aKSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpga0IFlV/1vYkN8cVHBfg8mR+T+a/Vcmlk/7HH46l3REN18F0PXBt6FIuZKUMLnPyR43TdEgBmTbMAM7IQiX9M@lists.infradead.org
X-Gm-Message-State: AOJu0Yycw5AxScairPgk57kUXrL5AMv7iKbMdAn/lpMilo7cmg231Q/9
	1HBA/m00txzDnnwWkZK0S7obXwnMu6dpUdfDf1uHxBPmj9LusYxfJWluYPduzdW7pJo=
X-Gm-Gg: AR+sD13xOPybDSgRUEcec2kGS6qrlReW/Nv9g+s5/QwrPeI4mGI4p7dVpUFhgAGwvYn
	Hzfv7hupr/Xs1e0/s+OAXkHLzlaw2IUlL27hrT30Jf4WADfnvX5CS7hn7Su+xMzWsMcU/eye2t3
	nAgPkouyPqYP3sNHD8uhvRmD4kK94Bakf4KcPvuQBgqxW8EZrvyCoW76YVdNcsbmy8t1sygJKfS
	thYeZBKaOrQ3QEP4GpUhqf5odgUq1mEYQOgzxj65GPY6WgVbg0gdW8K8GJAMFjxacw5g+3kTXnR
	igidEiwohLOHbfU9mt7RjI/uZkY0bTBZn/IU4JvmwAx7iuSbAvtm/1RWieMX0WWwIDHkeTCMmA0
	QRdHP9QdCu6q/1Oo99YoFP4KK7JNaClOcalA6jR6qXZA+f8WZ0b49ol0pCJ9pureBB+f891XGIl
	cDGQ8YLiGaWn+7sw==
X-Received: by 2002:a05:600c:19d2:b0:495:4815:2c54 with SMTP id 5b1f17b1804b1-49573d22bd0mr4042055e9.34.1784757328712;
        Wed, 22 Jul 2026 14:55:28 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm9015260f8f.17.2026.07.22.14.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:55:27 -0700 (PDT)
Message-ID: <a6da0734-a753-4ea9-adf1-4a520b3edd0d@linaro.org>
Date: Wed, 22 Jul 2026 22:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <oj6Uto0EvMI0bfZBF5H5aR0yqM-icUN-2cpVSpKffQlJVo5RXBvA4fUy4iva2Pf7LVfq7t8OSRSbXS71dKW-iA==@protonmail.internalid>
 <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_145531_950627_37E15EF6 
X-CRM114-Status: GOOD (  19.12  )
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

On 22/07/2026 17:12, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and the three sensor
> rails derived from the switched 3.3 V connector supply.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
>   .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 117 +++++++++++++++++++++
>   .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 117 +++++++++++++++++++++
>   3 files changed, 249 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..89c1d12ed299 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -185,6 +185,21 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
> +
> +qcs6490-thundercomm-rubikpi3-cam1-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo
> +qcs6490-thundercomm-rubikpi3-cam2-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
> +qcs6490-thundercomm-rubikpi3-dual-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo \
> +	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam1-imx219.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam2-imx219.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-dual-imx219.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-vicharak-axon-mini.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
> new file mode 100644
> index 000000000000..620b4b3463b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +&{/} {
> +	cam1_imx219_clk: clock-camera1-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	leds-camera1 {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam1_privacy_led_state>;
> +		pinctrl-names = "default";
> +
> +		cam1_privacy_led: led-camera1 {
> +			function = LED_FUNCTION_INDICATOR;
> +			function-enumerator = <1>;
> +			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam1_pwr: regulator-camera1-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera1_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam1_imx219_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";
> +
> +		port {
> +			cam1_imx219_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <456000000>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_privacy_led_state: cam1-privacy-led-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	cam1_pwr_en: cam1-pwr-en-state {
> +		pins = "gpio57";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
> new file mode 100644
> index 000000000000..80479fffcdcb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +&{/} {
> +	cam2_imx219_clk: clock-camera2-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	leds-camera2 {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam2_privacy_led_state>;
> +		pinctrl-names = "default";
> +
> +		cam2_privacy_led: led-camera2 {
> +			function = LED_FUNCTION_INDICATOR;
> +			function-enumerator = <2>;
> +			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@4 {
> +			reg = <4>;
> +
> +			csiphy4_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam2_imx219_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci0 {
> +	status = "okay";
> +};
> +
> +&cci0_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam2_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam2_pwr>;
> +		VDIG-supply = <&vreg_cam2_pwr>;
> +		VDDL-supply = <&vreg_cam2_pwr>;

Fully weird higher case names but consistent with the imx219 apparently.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

