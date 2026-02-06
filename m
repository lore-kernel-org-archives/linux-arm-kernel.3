Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A37EE20B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=; b=2VgbG8FS6FGJAWi5oq4lHOu06x
	yiaq5/4h19Ps0/6ZwR/4Ipfo89O68On02R1mNtLilhTlExkQOJH+NgFXQA1JRFvv3edBJcxZ7MlcY
	LseyM3XMbnkuykYV+dKQ2XzN9xuEssW/fOFsrc+v70PwM7mvDOCaBSZRkv17PJRbZqLxAi7nnnHFf
	+VL7GpOyOlpGgcz3Kjl2c+fUS/aCI4ioOuuZCOmntGNRZ2NFb9nWe5AsswUgGXoYNKaJhCIvN5bZw
	mx+hWy3iAHNYcpZdf+Lk74od8yR/GFDG4AlqaQAlHgyoL1aMlYnzzmW88OPW0q12twfHbtkAPPzUV
	kSiFRF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOea-0000000BYdV-1Ffq;
	Fri, 06 Feb 2026 16:25:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOeX-0000000BYd5-2CVt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:25:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b6d004bd2so348817e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395150; x=1770999950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=p3/45cqz2loxTCPX50Wnf7io7MWIxC7LD+dltOP1KriFKopuqHtXtZ87yDsJ1wTasw
         kpK/Lt30oXs9cxQzOYEsCVqtFfJypaBnJ7VrKzCSBJf60vlmzsQH3EHBllQ1zudyeJIx
         /DfK2GZd1SeagsBD2Ys8r8TMNZx9MNKAdF83x83XOfU7kMUugUSYAvJv0243O154h9Nt
         PZ9VRXUZBGo9Hu06whyrYUuWNdbQp6MjppmLuaH+a/emnwGAkPDxA4CsraYnVajQuNM2
         O8F0rVAazjfvDjRx1I+KPt0MtBQ9gogAPrKUmMmraH+C/PevKUb/TfAMdo6zV+8QqvlG
         kPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395150; x=1770999950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=dmGdjuw5lhygzAsxqXpRDCuJr9eujaN/WHFRwWmWngtkW62tI9NiXNZUjxRMoaUDJC
         lF1FZpYDE/DSfewmRoamKBsqCvV1ZUDBcOvSCpyxaXeNEaKH3B9kBEXsQ8jT6JZyKkhG
         WhTSqcGlN7YStYwf7urBLpc5rEQyKsJByzE949Y5kuctFoxk+PMzRhTErHmmLVQIcU1w
         Nzt1Zipeexgn8g1eejvXUKKLn49sz0I10R2LB/dQAZ/CiAu657EdpcGnMPufwiX4rcD/
         DFfGshOtvNopbxjQoOUTEVZV2f1lUKCdmRMwjWvBW/89cvW9i0oNPUE3WYiMutXv3OC6
         7zOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEt95ByEUkDUNIOyEDoUV13LZyYw0nBqFHI22Sp+gS97PViMLJtK19LYzHfAJe1U42AOsIDP69reTLP/5cSDb/@lists.infradead.org
X-Gm-Message-State: AOJu0YwuP8IcIcjZiltoudHFPz13q4U5ky9RTk3TMCEB0OjHyuvIWAts
	euUg63DUew+ITXoZ1PoKYZNWe+6+ZgmRRHImv6kSd3ppURzjKHRYEOW5mYXpKW/I9G8=
X-Gm-Gg: AZuq6aLUs11mavl/FTGhXd9MbCR2QBRiEVHm/k0NO25MUHU9zIX90bvvVhfJeG2sbw7
	3pYeN2APzfR+vCquSLUJkuUmhoD1c+ii9MVQfytFI6ZUQ3ioL6842UwMQJvceiRIqWCY0w7W1v5
	r5nMr7xNZGlk8Qu+womShjGh/HUQOGGJVlwS2Tv6NCSv5/2hV752JsHbFN1AaNREnIqh9qoqlIF
	5r1jjURc6jOSDIEW81/gbTPAuJB9r7a4emi/H/q+mVx3ExyUIm5XfW6yekRRraxPwhWbfhpiG8o
	dK8vJinDUW883268hIz2YJl3JZ4Duy4VPJrNcYGkBxODpSN7TZ5wFh17vdRUf5fmAv3RHZ9nwpY
	4KXHO0nsBaucc5w2U2DVQJu5wbQNtFTdD5C8EYSOmcPss70+4dMYRioPK+Ab0k3CLpq956b3gK3
	kWaTyOTWQkKNPN0w6DYCjfiF+8VdWz5WmbeCx5EYh3xAxEyKL1jN0wnEcVrkMrCBPjOQ==
X-Received: by 2002:a05:651c:154c:b0:37a:7a9c:5c0f with SMTP id 38308e7fff4ca-386b51d93cemr7758311fa.3.1770395150443;
        Fri, 06 Feb 2026 08:25:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm6346741fa.3.2026.02.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:25:49 -0800 (PST)
Message-ID: <e0969b37-8a7b-416a-9789-8662ce7f3307@linaro.org>
Date: Fri, 6 Feb 2026 18:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_082553_606153_A6F4B93B 
X-CRM114-Status: GOOD (  16.86  )
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

On 1/22/26 12:48, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.

Typo, s/Taloss/Talos/

> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
> +talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {

I'd suggest to rename "imx577_ep1" label by dropping the '1' at the end,
it brings more confusion than meaning, at least in 'csiphy1_ep' name it
means the CSIPHY id, but here "imx577_ep" would be better.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

-- 
Best wishes,
Vladimir

