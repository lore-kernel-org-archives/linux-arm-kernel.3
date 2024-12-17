Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C1EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YMcdH8avPXNZfQXLzQwJPKuLvhjYfkBvWblo32XnJE=; b=EJjpb0V4h3pH0rsyKn3V9+Jo77
	HiHh+AJZLhHWM71sWrl9tX8A0pv623fl7ckuIAzYKk1gJMXQVnXsB61wn2am2KbY54AN0WvjIoU/I
	DQmNzuorMalCs5fBe/GMJ4jyuTMJe6P0JicudPMWKlufbZI5BacKN5lCUIJGMNfMjrC6Xcl9WKrQO
	m1jrD0iGbBD+qbJk+jZUMRGv401BCKGFMh27UyMjbBq++QuacRkyhRT2qHZ20859svvepmkhoUoHd
	v5o7qmnZiWrdKt/oDht0nWQmk8Mtr+NJpmoKmcjwEdQE943F1VsBhux9c0WHQa6GH0/LKENfr6t5f
	ODzMiMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYm3-0000000Do3P-0z04;
	Tue, 17 Dec 2024 14:42:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYkC-0000000DnUV-0Gfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:40:17 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e15299724so910378e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734446414; x=1735051214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YMcdH8avPXNZfQXLzQwJPKuLvhjYfkBvWblo32XnJE=;
        b=NhgaLXIQlygwm0ASSdGY4s4REZrXNsPKxR+GTPQZ9RTh+4C83OnWJ8/+nrNyDxsRtw
         3iN2ktRbXe1ip9FTSll+Ig/Zg+7ONCtqSEDlie76SC8ec4Xp6+bcRZEFg1V6jj/YozEX
         vdOwHlEQnBSiC4GeiF7K/lazDxYpNDbroNI9Prj4YPHk+xZcPqT5P7C/HO87xXnryIzJ
         VZR0gmVW5zaF5lwhfnKEqqsWQZ3SgwllwJ3xeK0n5kMWdfm/Us730QXRG7IRHqhRXNtS
         T6tHWljoAPtnsO+dMA5Dco4lmYGSk4Ev34yN7DtAHdrYxz4O6eqNuGAxtffgWqJSfoMp
         vkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734446414; x=1735051214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YMcdH8avPXNZfQXLzQwJPKuLvhjYfkBvWblo32XnJE=;
        b=DQr8eseTJNoOuU36f+xo0ps9ERMzByh6+IFIrfpoDC2sC9E13kNSwu6FnFzTPehwJE
         ecgSA1c2hB56bnQVKSK78obXhddx1z0shm7dugHMTO02C8IGiuX1Poaiel4AfqjJpL+h
         1eWPqOc+zN17StXAFIHuQFolj8kBkAEiehvPtOJZuSlUZBgRgHRGJug75VwJKXrE4yPR
         Ag9LI7/EUXnc/mSVYX9DWu6/DzM6ac2OU7fLeZHEyz7cg5aynLP0SDGoIc+HDkH5sXZl
         s5ygMCl5VGOxSuDvu4OJV6WyZ9gHWDD65EILppOIWSBWO+Sia7vabl4lDhgPgeI3dyS2
         3Rmw==
X-Gm-Message-State: AOJu0YzgxiWjaz2OW55qlIi7sE0P8Nukunp/rg4M//mRuk9oi8Ywv3B+
	xA3B8dc3H69z2r+ywb3ZoIqhym0L6HvPY+GX7Pl+qMOZmjKgMyRRpWjgabVHb8k=
X-Gm-Gg: ASbGncviCt9QG1vRg8RD1yP9LdGRkHZaEqy4zxA31lxO7Zv61p5/tB50ngmwieP+FAB
	tfCSEUbo556+EeRnFZSOqKv3fqd/+wh+FQs9ttGQF/uqUL8ZcbJUkMbQT/ZazK7TGDAfJzQv7et
	Pzlgk+IdDR0qsIjpjPzIjqVIPwoZFYazYsD3YEuzzfGgvA/SjhCiEiBgc7aoZo8cjI9nfcKUdi2
	0qRRXjv4+39db7hosddmy2HJqWUqta53h+pjLB3TUDFQWjjmCJ3sPQJAK2K3PcAfpolJpZX/UbB
	ZpCxx5JRapy/Bi91ORdLLlDxjPT3VKrAcGw=
X-Google-Smtp-Source: AGHT+IHOWR0Y5fR+2uxPBxCjytt0LUgJIVwtzY4VhNEtFXNjP9j8AdE4VL7hkzuX+HhMism2gVrkcA==
X-Received: by 2002:a05:6512:68c:b0:53e:3756:80b4 with SMTP id 2adb3069b0e04-54099b6d711mr1779475e87.12.1734446413951;
        Tue, 17 Dec 2024 06:40:13 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120baa73csm1180366e87.101.2024.12.17.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:40:13 -0800 (PST)
Message-ID: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Date: Tue, 17 Dec 2024 16:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Content-Language: ru-RU
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241217140656.965235-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064016_134235_D8D9EF60 
X-CRM114-Status: GOOD (  20.12  )
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

On 12/17/24 16:06, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 109 ++++++++++++++++++
>   2 files changed, 113 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4686f2a8ddd8..a7e88fcabded 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -115,6 +115,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..7782c4aee576
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of rb3gen2 core kit.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>

Please sort the header files alphabetically.

> +
> +/dts-v1/;
> +/plugin/;
> +

Please put these two lines right after the comments header.

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
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply  = <&vreg_l18b_1p8>;

Please remove double space before '='.

> +		avdd-supply = <&vph_pwr>;
> +		dvdd-supply = <&vph_pwr>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				clock-lanes = <7>;

It is an invalid property/value of the sensor, please remove it.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

data-lanes = <1 2 3 4>;

> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio78";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +			output-low;
> +		};

I have doubts that it's proper to embed a reset gpio into driver's
pinctrl suspend/resume power management.

Konrad, can you please confirm that it's really accepted?

I'd rather ask to remove this reset pin control.

> +	};
> +};

--
Best wishes,
Vladimir

