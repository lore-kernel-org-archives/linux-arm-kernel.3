Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83AFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYMPELcVaISMPo8LK5uoTYd/MIXJATV+1x3V+joTCO4=; b=eGsaZOHsTKYrObjP9lPlc5mJyi
	M9esh31zDeGaQ2MDVJV9ClDcVNwRDwD7Hr5CeLOKV8p6RAAL3J5hoRaLIeo8NiIQgd+AFwxrY0MyB
	FqKYYh01uoFq0wbi52bEADo64fpCT1lNxj0T2K1E1PMi3QtuHRiy9AGTXxdLwHK6NSTly5fOLRTuf
	vC7b5dspz17gOlyriUE1wuJxQp+jr1jmWfSAVcIER9Ew30gNDmJOEKCbsatecDxK3dgJROHoH7IR6
	4IEqzFw0hvH45wKHrTopiuRe/l0oRnu6T7pnBL3QyLD0jZNyz4kwSUDhVCVFfQz/9lve+KXwgjoMS
	vgOmEFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96y7-00000002hTj-2Y34;
	Wed, 15 Oct 2025 19:15:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96y5-00000002hT7-2Jwi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 19:15:26 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so1032308e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760555723; x=1761160523; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYMPELcVaISMPo8LK5uoTYd/MIXJATV+1x3V+joTCO4=;
        b=ukSBKfkTk0HGNA9LS3q01YMcb6PxOi+r9ZlBYFT8Yxb5PvJiCyTlUk0N2h3Fp21FjA
         zV2KbRmmHVd8ZxoEfeEj4H8s7spm/fr59EaMD+W104A16MEONfSi+ad3cp8nPt3MwgoB
         GZN/BHP27wBd3dh0Oyv+u1uk97SL2mhkD42I+WMmBGK2uhO28G71bvXw4ZSeY6mgsuBw
         ylM5YvfSmBSK2s0LXEL9pA3ydDG2Rr5mek7t9x2MSdrjkdtYJuTdr6146n6q3bYSb3fs
         IXP7ROoGEc5IhPU6uMXJp11dopCOfRns+AzgY/8mSrxi52d7dMrk5kvFfQxg/rrfTOrr
         kNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555723; x=1761160523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AYMPELcVaISMPo8LK5uoTYd/MIXJATV+1x3V+joTCO4=;
        b=jN7IlSFq+wttWrysGh/KJ3ltbljglANoJuLs16i0c51vL42C7g77TPJNdLqw7OUJKH
         Ft46oZ64RxEAchIm+QJliN31guikT0CUSMQdnBy/U1aEO/irTgb+gTHdyY/WXzoexu2l
         ir0nHzHdmLDU05/lspt+334QDAuSzG+lG+5HX1O8CgLQHyKUXSCwBO7ti4vV22kqZ8UP
         Cxw/kvm4bip50q1flWvi/vR/ULgeJsL0p/G0BYtP1lJZos5EGZ8Aisv+4cA3S7+Qp1SU
         9rH6swhqab9nZZdp14P6usxOcPpesbRISv2oZ0rOBdej/rSErK8FvjIfT1e1LR0bV3Pg
         Rx2g==
X-Gm-Message-State: AOJu0YwD45iSrWtm7gA+F+NuWde6IQDNo+V81VefgCgmpQCBOCZFojuB
	IEp0wJ00krwxjPH3fCrR/8DKMMoG+DW1gy+wP0+ZmcQFqRzUx5y7XEO99eYOG+5TyJ4=
X-Gm-Gg: ASbGncsN0nk0+o+ECcQskNqzdjpONmvDZOTuC/WPHhXjj3gxDslJTkYsLuSK1GtGUFO
	1cjnIHedjVagWN2vIVCckhYOK0l+KS9qT7sfGiGoQXhD2GfBnwU+DvDTFTPDogvST2oy3NhSanW
	1V718N65l19CjO9oBoRdplKJdSwFfmsA2sfHbHs0IM3mLP/rx7hRKgLK8x4SFMKEdIyQtKZS0wH
	BwVj259bsM44iiAQx9hEn7RfbgBlnSvbBKiRSS7Y2R9onjwAzGaFkMbEACMEK/HcfOLWVKRgTaB
	mpX7spIIvtiKNVVal1WQWcODoieSC3M+R6kGXDw/eRKdVZl6j9SlVJR0iANALR4DOwX0eYH4Tpt
	DRAAk9QwN/1fD3gxVb65kb1xwbgFDRXedtbmaVv2VtJzugkq9/MZbd/tITZBme4XAKzPw6X/KZG
	MeiwF754UxnwR4nsJUitnStcJT
X-Google-Smtp-Source: AGHT+IFgzACMuHh1h6LF8dPmcEJiKNFPz6aoHpNx1WbuO3O96mp7uLNPRB6iBtFq+qytOvveTnYOOw==
X-Received: by 2002:a05:651c:1547:b0:36b:d9d2:7357 with SMTP id 38308e7fff4ca-37609c974damr44742481fa.1.1760555723317;
        Wed, 15 Oct 2025 12:15:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7b8f8bsm49637231fa.25.2025.10.15.12.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:15:22 -0700 (PDT)
Message-ID: <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
Date: Wed, 15 Oct 2025 22:15:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_121525_652361_0F2B4259 
X-CRM114-Status: GOOD (  20.77  )
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

On 10/15/25 16:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional

s/Introducing/Introduce

> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>

The first expected Signed-off-by tag shall be from the change author, and
it is not.

> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 96 +++++++++++++++++++
>   2 files changed, 100 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..4df3044639a4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -36,6 +36,10 @@ lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx5
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> new file mode 100644
> index 000000000000..2237f0fc4a14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Year is missing.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_2p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l5a>;
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
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_i2c0_default>;
> +	pinctrl-1 = <&cci1_i2c0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_cam1_2p8>;
> +

Please remove empty lines between individual properties.

> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;

Remove 'clock-lanes' property, first of all it is non-configurable,
and definitely it's hypothetical value can not be equal to '7'.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_default: cam1-default-state {
> +		mclk-pins {
> +			pins = "gpio68";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

I'd suggest to add a description of pins with MCLK function in a separate
change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
and gpio69, so here it's a MCLK1 pin for instance.

> +
> +		ldo-avdd-pins {
> +			pins = "gpio74";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

