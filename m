Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED4CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHqp/FC+SQglvNjASGPOgYZdND2iT6RhKVqihV+i3z4=; b=qJ/9hsZxGE9To3PCJ4fyr3rGLk
	lfcbAbaJFlBq0H0XYdfylsUTkNJr4O/5o+VVztMyGo8JYEI4uOh8Fw6jtyzoEmacsiYPGCOVpPg6e
	vsXBO1+SuZPZw2y7x05NRUpAEoqPm/whB0g/cddhEPo9913r6gLdaaYS0O+2p/dlVSvm+M62Iwwd3
	M23RQBohBkeCqbtXZYnkopQ2ctI9vB8H9o496aO9hyMy8oznSETVV/WKUkdSqaZE+XWItQblVg3I5
	iLaFVgLi4on+yOLaKgT5LyllfAYyd07S7MYcLIF0+a3OkYFJNAEiIhVq7uTJPVebg/KPuecDQNYzK
	8ENAeHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsEL-000000057Bz-1rpw;
	Tue, 09 Jun 2026 08:54:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsEI-000000057Az-1vKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:54:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso1052529266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995276; x=1781600076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHqp/FC+SQglvNjASGPOgYZdND2iT6RhKVqihV+i3z4=;
        b=gy2m2vCAVzAxq2iQrQFJumZc/uF8kOlT40FMOV0OoyvchLfXnl88ql8qixQrM2CRhj
         TIA+M4+FssHwEX6U/cjGGBsSUss5bJ1qNYG7WMWmcNvNqth/3bVpIo7b6tl61Gn+HgoO
         Wfu+MpGcMe6P2+9m15V5N+KgwSFAu1X1zHVNbLl48VzZDXyFjySzfNaLCqD38t4a1iS4
         txl0BJOPGp4zJx2C81VbJYiDGGv9VZIEtw9UZ/z25ABMUJCd9xduYJPKUY9BWVWbB12O
         BY2nbQLoWlrziZUH0yeUa0luLq6l2x3t5aZ90vv/scjPYVzrHIXNnJAQVrBo3/9SsrQC
         c1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995276; x=1781600076;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHqp/FC+SQglvNjASGPOgYZdND2iT6RhKVqihV+i3z4=;
        b=rqgN/sXjejEoFUBuIfxBzLNxewtwqFU+kexeZNECUWAHEBFYrS/RH+Zc0NS39NKgUJ
         gpUBceu5nmQg+WF8mL73UEufiOLcGqE+muPZtmzplJKvs4JxJQj34KceVK4B60ZvJt97
         jn7ozYSY99RBnM03RfDnVC3yRbTj9RY3tgoHWCc4MUZ0/P3RmGbAXnnxB6Cx0RVtXUyr
         FTWF74qD2paJ5XVYw+f6rJxhewWC7qW180s48G6BZCmz8UlLLFE/gDRfeUbkYxBmzdZ2
         PeIbJ1GUs0Xy3kfSvwKDHO022HrtOhkL2zTDDlIg78HsR+RZaR+YN/1OX0FvgqFMGYW8
         4kUA==
X-Forwarded-Encrypted: i=1; AFNElJ8ocUsv33BqvOoR/p21gY89+GIPUgb+1AUaoPmNhaSLVzJ+Nt9cqsuxRhxuqa5oUsdEFDZe90QGSv1hOzs2ALIk@lists.infradead.org
X-Gm-Message-State: AOJu0YyGE5xOVi/r7SAWEyi2hiy3KrhMYFjpP+Nl6ZEw6nh0cNbbhUr5
	I5nn5O/zcIgymqgRyrw6l6OJgufKhRy0vR0BL6QHKWDZoqHjc24ZrxWPpxb/qXTarJk=
X-Gm-Gg: Acq92OG6/+wNXP9n6Vsi62lpU7rx4APVYzOBUeFpISExLIbXF2xeD7Sx7bey+FAmT8q
	vfCC54tfOZmhjkQxA7jMHoP43Ti3iyLPd4ysjayz2nPDs3tSj+Atkh2lGy7Gr0/hJaGUZYJgmW4
	FVsGYdDXzbpotpbhFYGLSA4Ma3woSRT4sJgZikmUrteav9gLR5/J6GGxFffLAF8SWnpQMgGxuHu
	UWAgU1c8VZAmra9UIEceUvpGc6iquSVjU+Myu5gYAgMnw4lsUGqUSW+rgtMzwcTFr8J2pj7kZEx
	T7sykUzS0OWZsq6C+jxjMWjLPnZikUWZ5DkSnmS7u7elE1erhRYzV6sy2DUX/dLZ3cp8/+0PJEi
	Xlt7n1nmwvF5oJHzQfIFBK2HI9uZmgjGUcgTJzkP29jFkpRqx6DZl7OlcISIAh+w4TM1AjtMAPo
	/dN+3tWl8JseaSFN9uRZbkfY6ABUah6BHwp9ANzo70GuP1
X-Received: by 2002:a17:907:c486:b0:bea:2fbc:4ef5 with SMTP id a640c23a62f3a-bf3737ed373mr949595466b.44.1780995276043;
        Tue, 09 Jun 2026 01:54:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03709sm998477166b.30.2026.06.09.01.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:54:35 -0700 (PDT)
Message-ID: <dd1f8bdf-6a73-4b40-9694-9c6a6d952c63@linaro.org>
Date: Tue, 9 Jun 2026 09:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
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
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_015438_533406_B227F15D 
X-CRM114-Status: GOOD (  20.47  )
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
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  9 +++
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  9 +++
>   4 files changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3dad7c81e5e8aeb1061c784b5b893965f914a6f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
> +		dovdd-supply = <&pm4125_l15>;
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
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0d5c3e31b1f613157d4d2ec6947c630f1031b73b 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
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
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed3121ef092df684b19a4de39b497..515af370ca014a668dc035ff944fb82b6e09ceeb 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
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

