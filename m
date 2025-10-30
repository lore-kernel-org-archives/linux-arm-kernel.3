Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920F7CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOErGZpwLMOb7PwfNc34LT3iVngAjXuP7cLtNkH6Fno=; b=f6HbYJ8OMYMDKDaA/Ipas7WtP3
	pLAvNHmsj0B7qBMaVD9qB1ccQSI9CvsEsbHP333LO2EYOTWns52kKLyYSME/x5rLlB+yjtwGkptGv
	u7ZWRW8ohLttLxo1ACDRemxNjoOAjRBXX+BSsydlT2WXUQemumS51J2FyDNZt19+iG7uxx0y352NN
	B9Tm9ej6K0OVoNUI462CKk5/z/4i2HSTrHFgxyANmQ4RBh1X+Tf6v6psYxdZYa/10j5+OghjupsRa
	1+tRNcRSeXyIL0EPTk9zgunxdKVNTgwTcEatXsJ28wnlKXhWJ5JFa86FPtGGUoA0K77gUeSZPZyD7
	vsipgOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ8m-000000040wy-2Vtb;
	Thu, 30 Oct 2025 10:44:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQ8k-000000040wP-2AIL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:44:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso245843566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761821060; x=1762425860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOErGZpwLMOb7PwfNc34LT3iVngAjXuP7cLtNkH6Fno=;
        b=yFZnjknTXaqy0ezSPekeCLhWFZ96Ryj4KIBMH8Vdp+prh7vXoLLuC7lOVJsSCeT3Rl
         ZlekJQ+FZPyewmm+8XqCUy7ORb3h/ru4qmLCxZRZi9rU1plej+rDf5gEESsAn1xkiMpR
         dgsy3Og9JyA8QI7oSDyXr+kwBlxg2/t6MyUd+feF6qQg5caFfuT54d5YiRqeSj7e0xB8
         CpTjIOPkBU3buP7dEthsoBZw2hTn29jo8DeZaNO+cSkuXKGPeVVM5MzLGxAAIXvU7wiN
         r2fU6E0AtBI4FsIL4/NpqnMeo2SF1vpYOYfz1YaBwE8PMOPh2i/amkhCsxZ5461hfJWF
         p0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821060; x=1762425860;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOErGZpwLMOb7PwfNc34LT3iVngAjXuP7cLtNkH6Fno=;
        b=HAgOVw4jDORLOssrL6KiZH0W64O9SxbwcVbfbf6R8QVHjRhdngWJzhi9BcJ9sC4bGe
         Dqlx+hA33Ig1FB6o0Dg5S87cwUkI6Zo9w15UitfAhU37YqmDVnc2GbxLJcnu4//sGvLq
         Voi8xqwzIsIaS+EDzrPhRwl/UceNQXrk1/LfWcgADxv2qs4+/oTnIrRe3s+2Txk8aXM1
         b9xvrfAivFA4RpbhUbvsr8eyz8Er9p/oxpqJetD9r262iaANmldnk7pqDvhM8NMGKLcM
         XkFI8TaBNe+zoFLEyTU3qSIU/icNHGywGKuzMSQf4y2NxTNAULEIL0rCejAlFaKW2Gi0
         LJQQ==
X-Gm-Message-State: AOJu0Yw4O4e65r6yIwpg2PO9blJUaDEf4ItMS02OlbOVn5tSoVAH4Yd9
	21gK4mhfb/kLk5liuKnCHw31BYGEjO4rRQRbfloBLeN+3AkY3JV35VdNmt4cm9b7O+E=
X-Gm-Gg: ASbGncvGas7i8l40txg7HvP5ZMOxNBURBmaR3OCxQIGtICdpFSd74nd4VhDIwcwgPFY
	WCfCeO2Z6n22JAisWETNvnEJ1KFGcmLpKHfER+nZScwAsOb6RIkrlMHZj0pOHnl9HLDjrxeJeSy
	Mn1hzqYgjAtDoTRgP5iojzZk/aI8nvD1ceIALt/OeMysYlurqSwHc/HEBWrdExCagj2DAdER2CE
	JnVmtrnCewJk24HC7oWNCFNRJh2jEaNar3FAhpnxaOu2myXDnJOIVpJLO7b5LQURUMSD7nM3PGT
	aiDR1piDYV/pieI4zVI7YwzLsGw5AUTCro7fm8k+8NSKnkm6uS3GIoFEn09TUFe8VdJ6jm2soud
	aDKZvrMcqfIsKhvEmE4DhkI4N+nyi1Aqj8jt/8lpZU0XOjFsprMxHiZp1I4F/Gol12RnzFcsWb9
	Dlwuusfnf4+OZWdRLRIxzH1eYeAVnhofmD/5+3DZNNRkfs8mBUPwiuSqqt7Mi+Rdo=
X-Google-Smtp-Source: AGHT+IGtYVJD/Y/pHf4k9CBt97P94Orn8JwMiP/b+9frzwAxKr8mPjQLaIEcIupT/9ucSIpkO3DApA==
X-Received: by 2002:a17:907:d1a:b0:b70:4f7d:24f8 with SMTP id a640c23a62f3a-b70520e4069mr289801566b.22.1761821060521;
        Thu, 30 Oct 2025 03:44:20 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85445e81sm1710205466b.64.2025.10.30.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:44:20 -0700 (PDT)
Message-ID: <9b6b1427-9712-4934-8b0c-ab0a8ae97b4a@linaro.org>
Date: Thu, 30 Oct 2025 10:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_034422_591256_61869ADF 
X-CRM114-Status: GOOD (  17.44  )
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

On 15/10/2025 14:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
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
> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;
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
> +
> +		ldo-avdd-pins {
> +			pins = "gpio74";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

