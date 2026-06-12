Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F0CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=; b=AarPAgTPkMsKZkT0aIYxxrw5Hp
	cfKBRlZky6m40jxEodpOmDlcupdjvb1P0IsQLaUrQt5PCIe+3rQABh6egrZ3vbYDn9J55V8mBjbt8
	/DRf4cHbaw84PWICJmEDIxbox3R3GO/Th2vPdOkCioZ+/6aUW5KVlJBZDyi8RRm00GAnDkUhlnK0K
	H7Rhil+z1ayIHX52yj9rYYRcvZEqctJbDMGzyWCOp7W2TjKYRYJ60FBSju9IDTh9l8r87R/fKsYp4
	/V0RVMdW3JsXw06UyHrafw6STF11af69tDcu7n5NYowySvbyFLs8YBHPFCztJkQ7xtqYWj1LSAGtA
	wEYd13Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwzi-0000000AYby-2bsN;
	Fri, 12 Jun 2026 08:12:02 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwzg-0000000AYar-10lV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:12:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5aa6091635aso96634e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251918; x=1781856718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=kTdEvZigvRGpOYYnqCIew9CgHD+ji7pTWo+kjx2IpnKK0QbR+Sfx3Bi0jJ7QSIjnKZ
         nfnYYK93KhO7XH8ovxdsV+nsCcUWUCxAxMsKnIa7EcNkhOfzWlihGoSziPgPQQDP2kct
         guJ8W2t0Yt48hS/SqXKyJOoxOXAHSuKGavybUGIuvJIYoPT8BP7uQejBJACjHq3nAJ7i
         8bKEPZl8CntwZ2U+HAuvd2WpMv9XHdcI6eABPg95O+W8bexnxeT/HuxR0+YGxT8Vubnb
         xMP9kvNrTMtn60QBsOt7xoNOHMJ6s1UOm2p3HFca7VDUGvMpz67/gkVPssvfrZAEsQX4
         ZUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251918; x=1781856718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=Xgxar+DPy+CNEgt8/pqOEYE3nZPnZORfBqaYt4RQEscU0fry07HHGRj7tBZoe/JwoX
         fNLmeH5/qE46+JAs7HZQUdEAL9UF7UPPMdMdUJBfzjchxSPY/QPIHqRJds/vpBu4PpE9
         0Ia/CGS3G8O5SOXF1y6vmw+iAuAgOR907zboEdcsngpsG2qPkzdbxrqgl0bGYmUuwXsC
         dNZgVlkEVgEX0FtEdiOEBOI4soCf1CoiNs+cdN0ytYmok1S9sQsk7ogGnLvHDR2Bfbx2
         h67cPrEqEv/Ht6ib8Wu4llT8m8vPDjePohXAmI593y0lcNZb8QW2gLks8n1FI9RW+ZVK
         oHOA==
X-Forwarded-Encrypted: i=1; AFNElJ9aw30QNsK9MNG70Q0z6iXCdMsUujCN/MjgEFgnqq53kWZseKGqAqnLbMPS+D/jEkGCIcrCq/LUklbOG+4GYbZP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhe4cvdEEDw6IkbSk0N3MbvslNVz5O+EmLeqBZxbWegoLgcLLK
	GsomGc0EX8og0mvZXQt1XRvyMkukr0nbLTrW0dJbhJQqfaPRrKCTXz+A1aVnfGZOyGI=
X-Gm-Gg: Acq92OFEskR3MxE3Z5bKnun0TdNT0H+jdqfYBCzD2DcxKL70muzrUmcJRWMVIPi/pC8
	KhzkNWSp1xafITndSf47VyMm1DUTj9z4NRESg95hZC5I7h8UvVT9TezXtwZ5uTX1VxOE92BL6Sp
	iIVXfBNw4LFx9RWfoWBLagkrNhoL1Ts39gjelOWCo8iWkqjtDsnIF85dZa0s9Y4+irKVKkqX3Ty
	S8mRadDYJHEbf8R5PgcrF1okqFcN8gTX2z5bOaBvGrsPyuC1kd/IGiG5+lXb3cUglCzT4dnX2aJ
	Kyo7heGm0VJ73Z/hBfXHzijvzGLUjEjTgd9AJqyvBO2qRqQfE/dSTwzykHN2M+rogybQDuWEGbC
	ADLH1skAtLSyEefN6vnSaZ+NCEfJI51X+C6IfkqQxIwD+2o7nyakihgkzG2zOYq+0DjWwmJsPmc
	CC+Buz1GEp6Ro9ac+C3IEAxnnqj7lhQn8hbsTkJuEjBWtsTXLv5QpsV9sW8cYRqMID8O8Z5t6Jj
	H6RaA==
X-Received: by 2002:ac2:5f19:0:b0:5aa:6ba5:9a58 with SMTP id 2adb3069b0e04-5ad2db30090mr185209e87.1.1781251917979;
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm324070e87.84.2026.06.12.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Message-ID: <6ec25a28-9d0f-4c87-a4e1-85d8e410eaba@linaro.org>
Date: Fri, 12 Jun 2026 11:11:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay
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
 <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_011200_322867_AEB5D929 
X-CRM114-Status: GOOD (  20.56  )
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

Same as before, the numeration of data lanes starts from 1.

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

This part goes directly to the mezzanine .dtso file.

After fixing it,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

