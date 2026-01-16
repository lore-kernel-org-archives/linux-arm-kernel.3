Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AE4D4A615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=; b=2CXNn4FH9BXYZSdIuH6Zb/xbrg
	bzO9ommc79xJ8ocwEMchiv/PXD6SWMvUFeVzsUbV6jzZddMJmrbHGpTDVIWkD81HxBUq2dqQ2/pCD
	GdW6kPqm7zCUVPdBmflZczSgdWKa07wlpZASdrPhSECRWMREg//t8bToij01OhTJJuHxdm/A572jK
	Wuye64Oi/kIm7ZLUOIFFgvDPieykS9akOkLEngdkLymDRct8jsHmhStdZjVyPKLeYJJLY20ssM3hp
	IeOv5qYCUOnm/0qo0kEMH0DruCjKXjsPktVSu6s3Q12pnh3++8T51SM3PByltbmVRac6668mIUAs7
	Y+2m0UzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfsN-0000000DpgF-2Vot;
	Fri, 16 Jan 2026 09:12:15 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfsK-0000000DpfW-1jIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:12:14 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38316b89455so2576681fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768554729; x=1769159529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=ku97Jno0o22/9fYMHX+DVhGIRCrdokTmOqLQyNqltJ6tqFtBCTYLtVHzapJzHl2pKE
         6uQLKKH8h2+u38FBwa7jnw+FriyiYNpzHNJAiAI+f9krq4a7J6Snp4M9zBcv+h+S0Ztb
         9Gw5W4HrEsJfF6u56i9wVNJBVwkpUHBQ9FVVU8MlCgtemXiHSxPsHcKHhfTuJ4Be8YxG
         DkGH3XZIftBGC2jtJyCnQ2QfiACqJDVbflteE9C7rdrJezWoUJZWiY8BSPtJfUFtM/lF
         kV4wueMrlxrhTfCDANzzb5YzG5r72J53Y/jyz1tw60WEbN8awaOqug7klQFZIU3MQkRL
         apwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554729; x=1769159529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=K6QXavbIpEXJMXTOTsTnxxmJhYqnKYLq4ps+rYDK19LeCIPs63zeK4JylR7BcBgWJ9
         PYGSo62MyQJ2F2mOXYc839oIINzmE000ay8qvgpHx1B4SueExGOIXu/84nnFv0PuJPQO
         ZDa0GCeLMIyZ4uV+iWw4k3idUivWc9YHVtD0ioNxeXQdO5166MB29mWl6EyfHxhx8pWZ
         3e4w/y7+v6vi59yG0mGuQ2s2zMLTq09QLdJdN2RfiWXJtIszRHUsm37pc+yaG6ueFHYK
         FkAG7kAjdR6APZyGuhtOAwqRH8zkO099hS/MZQY0qAbzKN42YgASKveZm+0NEsrVN0gK
         /XJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf7GpxVu5ZcgFAbS5cvbZ6ABwMwlwKs8p21NjYq3YGpoiOTyJJGA6EVVKJtHhXiSFTs9rxRCruI4yhDso5rojR@lists.infradead.org
X-Gm-Message-State: AOJu0YwXjB1asulbw2G7JNGWBUavthwW48z+W1DxRkiopvPU6VvjK9Oh
	2qzHv2YZ2Wq7UWOCa+WkTkhqyUn/FtQsvuiTp4MJNESz2f54uaebX+p7alEi5wO6oGg=
X-Gm-Gg: AY/fxX75UA4DtIDgIaSWP6OT2wKQUB7twnzcTmudAAlGaeUedDb9/iE1CyVLyfNCdPy
	ZTUOuccIrN6wvyS/fdeogy6hIQDtli56o3KMKmVjz8/FPs488TyuMCPlcBAgx+MPFJshmqIdwSZ
	W2g+N9cwPkVfB7I+SpZG+s3YyF6Bi1IdaMwPuM0UVYrmrs2vx17eJpaqd3irgaKWEF3qs8JWNba
	QRKXNaFu777/7pE7Cw6Omi0yTjvy7VEktk4b4SCe+CxEGEdNmtp1RKQvJYxsauKdV1aH2vU0FlU
	vUQp6qVdd5O+Lh+rdqEX99pExBgkP3UQJkcppiRcz4ABHQO4NTvZcZ5xrwUpQOxCvQrzHLfjRtR
	GKq4mZgiBnm2DJ9hj35MsDijquOPGp1lVmyJtPQ5c4wIQCFZGt+ZqfhZo6HXhZ3KK+HQyzHasvx
	UjXdt8GVEnhDpmfMbTTET946gOnH8+zYLExxLiNUpxt0OukExxTJyRdTCBuQSb2zEfDw==
X-Received: by 2002:a05:651c:991:b0:380:a1c:7039 with SMTP id 38308e7fff4ca-38383fe5fbemr4683611fa.0.1768554729185;
        Fri, 16 Jan 2026 01:12:09 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e0e5sm5608701fa.17.2026.01.16.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:12:08 -0800 (PST)
Message-ID: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Date: Fri, 16 Jan 2026 11:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
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
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011212_491656_21B6486E 
X-CRM114-Status: GOOD (  15.97  )
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

On 1/15/26 12:12, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo

Please remind me, what does dtbo-y Makefile target serve for?

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
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

