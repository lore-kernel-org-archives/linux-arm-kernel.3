Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575C6CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=; b=UTtuh2hMn+iFadA8c+45DjNes6
	z9rPiGnyLLFbR3O5g2MiySmBq8w5vHgedf41mDIZCHB8IZbsIavhM2yDtYlsrKkxIoc22yiA3ynBX
	IPy5DM5DGwGv2NO5D6l1PvySIncid14prDCNpMX6qLW37lJX2YkYDfGsgjx54Bw5UXKOv1Zh5E81t
	yF9XxUkuu1KIhquKQTFzSVoOefM3y4WATTcd8x4IB1uRZ8ARf7Tln2ES08wH1C54BlsZ7Y5YZFI0s
	jJKW2m9f34P/s+OpswKN/culded+NUy2ctL3pyJ3fKKhKbiZ8Zx2VbALuCvJQ7yGwbfK9GQHKpeFo
	j597qN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsFZ-000000057MO-3UJl;
	Tue, 09 Jun 2026 08:55:57 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsFW-000000057LB-2J38
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:55:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bec354815b9so530610966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995353; x=1781600153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=dT67yHoqHtO+ys+ywpViO0JlvzaNzwLv8JTb94sDC8f5McI6w6AXl/SA4SZfXAWQo3
         p+Evhpv+dZx1Byp0M/+qnJnDpsz/tcu0H5ST+KdaQSs6EOeF/UcTODxFE+B13xEW4KP9
         O+Za1zFL+JxPvEFFop9KQJiMR88EgighM/JY/tfRW4xF76iFq9CUiY+R0OUGD++Vev2G
         PY7PPPMTwcZweeimteBPp268PCpLufvLID6QJCIUowQ34Lo1GBUsCXYXRCyvIfRjSMAM
         sRnHZWMSTC9+IIqfapPgn4wnM2zfCXSuyELSdP0VAhny2fxvAdpiuT0smt9Ts7WI+EaQ
         mp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995353; x=1781600153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=Is8I9euwamX3Qkl7TmpYovw+2aGrr0knxJ+DQJnamkKeETOj2PVKO5OngFdgDw0hvT
         wfkJYlHWzXTdbmQ3wbi03APSY52TcUnCdWyJdLpmpKL+Ksu/LsT9jJVYI4X7ctzrs9aq
         lfb2Wdc1SLaE8NRhm+7GyvnXMMpIBxhr24DsvK3wmERQbAfn5PTD5MdosoKnHWId86YH
         4sO3pzLXTpwWOfOc3u2iyrZ1p0TH7GQGNsRziA+40Um8gtmpTk4l48uQ0oUPF7Yn6lfk
         X/d2h100q4lK57p6jQshG81ucfjZ5+vhUIKhBhBUxHslrP/yGxfLVRptUisRDJTYDLDn
         RY4A==
X-Forwarded-Encrypted: i=1; AFNElJ+tpBAVXQbBU4y4YUtAnmPus2/8iXSJcT5hwb6ZrnostIfgkf3A3WcbEj2evZQHfIT3id7KoMdp7I7USigS7E8/@lists.infradead.org
X-Gm-Message-State: AOJu0YyN5/s1VEWdj+Y+syvaeBqKBdfX9IFCFoHGBQeaA0yLUIL93goi
	C9VHDS+bP8TYzu4iOtX+I1HmyrzDGJOxkNZHb6CfRD5NznwFxaeyx3kPI3Zmw+VGNIs=
X-Gm-Gg: Acq92OFb+srhXmBfE1Z9GhXRWgA4nMwUYQ86vy83K78+E6cO7EG5KX9eeRi5JgSxL/O
	yZOsjgXH0oDA/75e/5m9wW2Y/uQTkdQBJOa9B0pDnWMemlAqrlcyjpkpq3k2ZpUT9xwCLUjokup
	01KO+N0yzrJkVIPsYD50d1orjGgoGyDnh/omEGSfL3qVA1zd66P/sFKksuG3pp5bNQMqEdD6zeL
	rnemW5myHI7cX8kUE1ptDXzCNr2pZqHX9ABGa8qdzA1N+V2ZeLXWz7+bCBkqAHhEIhdZUVgcfQe
	AuHA5JAOHdPg7dRfQsRGk13n/2YW/SlA9POqFC0qnQ6sStu1PIqltiGaDnY7w8aBd1Tfmk8hIPg
	Z7nk2Srzp7/lh7HvDmOdEFv4pJnFLOEZN6wt0Jmqg1mZOkD4p7Pv0hppe2PzRf6mD5emF2ifBsW
	d6N1H6qbqLavcWaLILxwTcEPdyoPl13kKYCibW7v+wptF+SRXAUajPnnM=
X-Received: by 2002:a17:907:da9:b0:bed:8f7e:d84b with SMTP id a640c23a62f3a-bf373902d8bmr939406866b.43.1780995352597;
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1012233266b.2.2026.06.09.01.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Message-ID: <20ea3aef-99af-4185-88c4-0b0d96c865f0@linaro.org>
Date: Tue, 9 Jun 2026 09:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_015554_622522_886973E5 
X-CRM114-Status: GOOD (  19.76  )
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

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>   
>   shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
>   shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
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
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		/*
> +		 * avdd and dvdd are supplied by on-board regulators on the
> +		 * IMX577 module from the connector's 3.3 V rail; they are
> +		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
> +		 * level-shifter that translates CCI I2C and reset lines
> +		 * between the SoC and the connector.
> +		 */
> +		dovdd-supply = <&pm8150_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,12 @@ &sdhc_1 {
>   
>   	status = "okay";
>   };
> +
> +&tlmm {
> +	cam1_reset_default: cam1-reset-default-state {
> +		pins = "gpio33";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

