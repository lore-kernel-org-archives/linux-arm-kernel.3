Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F8DCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=; b=PBifXY5A8czLTan93wfClcK+e+
	eT5DXjXXO2CmntjjQPZu/1Ryg8dxZm7jZgdL5fS/oCnFDVpod1mUNzDvxfXMOJ0LqyrVm8tB1tVSw
	mIz4xud/E6uBjq1+DDPyOJY4rFQEXQudzPtr5njr+HSPX4BMd/NUBO3YlUkSMu3TWyiIFFweBrUah
	GhZ3yq1DblJfN9nFOq7ya93yIllduDXkKD+6bO66nwuUcH6weK6Tu60dyV4hr8Yv3zz7NhH4uXV3h
	nOh8oOH7S32/WmP2nAPg3tKGNV+Wg/6vOlrlUPqsiScrj+ZKkTHymISaEk5E6sWxz2sg1zkJXRHbp
	sbtHPTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwxy-0000000AYI9-0aNH;
	Fri, 12 Jun 2026 08:10:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwxu-0000000AYHM-1HDu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:10:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aa64cbb08fso84652e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251808; x=1781856608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=T71G7yt2sbquOMGeh8AX+K+erV04AjFf1e/+mLYUDjMosUtB7t/DrRu7aIJW+T2VZ4
         Yq+SYR2M8eNHkg+ZY+UnZtleSwZLtx57bO7KY1Hlex8u44SPbY5tFpo0aY0ll99+klB2
         3MUmNUdrsLfabruFvVr2sTmCtVkDR2EH3HLEOApuyNIQEzT0gCVHmkftIvzMJbhfIqp/
         ZDCHTyZy8zoACbSfDrV8uKI9cY481php+tEpPjSi61oYNFVpP4tGq5MbVWhcKDUC4I5r
         4xlKD9/5V6hVmVUb/pyWWHf3tnVAk5bFKPpJILvzkR2NhNjvaNdTcXuvPlu+xTu964US
         YZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251808; x=1781856608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qzqd0JGS+LvqWWHcM0Pu7KnmR8I/e+6J9UGxu+nu8iA=;
        b=NZ0Xkhnxt1KtamdKHuqbEHYAgYJlrW0mGkokavNdcznAyFjD4iJufVYzClw4h8G1Hw
         4Uwh2WhPbEL1qhxBrJvICL2IFXBHzS5e9iCgesm7NN9SI2qLe36/Jk1gJqmAsw/F5Mh0
         zODsRGWkwmHVvEzV/19Vv6WczQTvy+nd4HPwblElMNejLxxWFbwC8QaWCUBcfe2bMGpt
         Fn77VDNbyXJ1wteEGVnU6wSrjSGOiE59qR/aLFHE8wPmmLYjtYR2ajuvsG14MdQQcJS6
         4iAOaz6vaKRGnzuzrP9jbVBdIwmUBazUWEdCTu7apna2XSx5EksWaVj6JRqKyr9cEsqq
         3rpg==
X-Forwarded-Encrypted: i=1; AFNElJ+RIqdlq7U7BIn64iWs0ukXdhgw7OS0oRolR7FLTq3Mkog54Mi08hjf/cmwImuX/+20rq+/mY5iOcjtlwl3u85d@lists.infradead.org
X-Gm-Message-State: AOJu0YxvHT2LQWspCV1SKUKT5y/GimvVvQ2HXKZi39REMIpqlmKptwVV
	AvRwu382GTYtDW1VvSDwosyY3B1FuXVpgXUYCBORcT41Kb0ykuQUbn2+GHqLyqTYor8=
X-Gm-Gg: Acq92OFbVX0MPXxSy63rsFnu3EAPxgOo46BKkKdphHEneOshx+m31LUM03+TVs1ipsL
	U8zZY5KnqzrRVlPckuqjxbg3IPNLUqod4MNXb5r2EgiBdEMhUFdHJMwkIQ8UM/WeJS/IeOSuZaY
	BvxIdPEgUnBSUzeCU2fHjtqRFsDh6w8avoxnANgpwRkWDn8KFRvnTeTd5x+7sKSQBC5Hq/PTWHu
	DMaYAmlIhtvE2SYOG3mfCI/FXNbrP8JRKJnPdGUZrO6rFAEJFIngyGIT0K6CsyPsv6mT5QESOqX
	P7T3yQk9eaDF+Mve9ZvQr+lqThINEUoj04r6MEav5+9uEoI8xPJfk7wFnQCdbt9+Od27YTQyejt
	SagV9lAu4j5d4ldDB5ZaNWKaRCyZCe0mRxIJPjxw6XB0PMnZHNN9rlXPuNmfLZexe4c80fgfRiS
	oFYGk/NY+PnI015sKJDvld4fKYc53t9L2hUMQ4AwFzmZj8vGgkCRGQzuQp+z3WawAPly6wo5Zy7
	aR5Yw==
X-Received: by 2002:a05:6512:3b0a:b0:5aa:6ba4:46f2 with SMTP id 2adb3069b0e04-5ad2db189d7mr289426e87.1.1781251807831;
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm332575e87.51.2026.06.12.01.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:10:07 -0700 (PDT)
Message-ID: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Date: Fri, 12 Jun 2026 11:10:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011010_393130_8589AB1B 
X-CRM114-Status: GOOD (  24.16  )
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

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
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

The numeration of data-lanes shall be started from 1, this has to be fixed.

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

Since it's a mezzanine specific pinctl assignment, it shall go to the
correspondent .dtso file.

It's a concidence that one .dtso file is good enough for describing the
mezzanine for two diffferent boards, but let's exploit it by keeping one
dt overlay file as it is now.

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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

