Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBDBD5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=; b=4mPMKqY2GrQPSD9Jorfq8RTVnX
	M6hZvMtULcaIsSpo/DZU730kP3gR4H7kpiCybKSXocX9yPRUxntspVHjjoTSK6h++bZVhafhrDhEx
	N5MwZlY4P/EMr2POvl+DdpeZpWPyI24n7f0sMwu8+GTt27L9p9EddLIB5Mg2E6J+jzVCaLPnoW4VG
	twU3paTa9ejH7g71MTe2nTtIvmlvMHcgyz/73KrW10Hx12ZrdDYtXH+Vtc1nSdVPcIzKqglIhdoUg
	MJpbyYfyvYAt2RAnw62JH68I19A7TquKVdkDSDHzOs+ILYfASNx/C+8OnG/EM0tuk8raH4YbfzOuZ
	fACKHPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPbG-00000004rhD-0cNQ;
	Tue, 16 Dec 2025 07:36:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPbD-00000004rgb-3Frw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:36:00 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37ffd64f478so1514061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 23:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765870558; x=1766475358; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=nLVzUl5AjZtxlTsjkoINGPhmSlZMsfddaVxe+gxeYtp/OlXda2tEyEPECjx5vAYJkt
         RQiy6ukASh0SBDjpCfHHDeYWrEnsviS6fXshfGanBsvlYeE/ukZmujnCtsZIJgBfbwfs
         ECPoSTgj7k5m36ZDaiopa6pT7U0v/eQaMXrCOk6AJmf/2a6ZEigtNKUgaFKv2Js+ut+6
         N260T+i4guPsksILsmDc95B63A8QD82S9ozvsfk8XOQNOeO0XJ058trF2iX70qiATwp+
         //tnDpJQHwonA0EfoAnHfONASfYZFoBxWV4NjNiCN3emIu9ZQv6aBaEci82XeCzPseVr
         bNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870558; x=1766475358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=mSDY2URBYiTR5utI7JP88j+9AETDgITu5wWegQYENh6vNd26Mfw40B/X+rKfBJOyNW
         Jed91lx0RCk+NU6CMif/n4NApu2HTT4UPn+MjpzkBBzyYryJUqO1eASZeepMGlsHz30z
         haLtCdhyVEnC6u0EjtaaLaeORkMw9bnj709UyNBYad2jyKAV5D8EkFFWOi42QUAbuy+h
         f0JV1pqFxb/f/hPcatIO2cwgvXQ/43Kq23x1n31uowJ0+wfze7Vu/eQBUo0x33tvNEAq
         fAOs2ZlWlypGwL+XwvyM2NXP7fvH7MxV8stxsm5hUOIiI28q1q5IUWdxS5cXQ1htBF7Q
         3IYw==
X-Gm-Message-State: AOJu0Yz7pm97gdaZdK76PU26p5+YbYcXoX8JYKxxocxv0nniVSu4B2UG
	XK4AaLSPZ/6iTmVEon6lL3J51ap/ux4pv5Y7UVygfRbqUd8wIeiCn63GFdaBHQ2EOJg=
X-Gm-Gg: AY/fxX6OW/TgmFl1uDC1wkrgfkAbZV+TqMU4Va/rg/A5PaYug/gkY9sGw7mijXxwuiV
	SU6Z+5VHInKhyEgHm0sHE1n7BbPv3ojuhkErrxioBD+hNzP1DRaFRvIgga1LTFamruiGacbuubq
	RBdfQ+ZP68T1osDlZEZaMNzL5SwWIPYppFsubX9Kol4tOtIK4n7tZEmuz7PNSvmzsRBSHc/yvts
	0oeH0VJYvJ9QTfyDamgtgfX7XkZuuNCh0zga7YGMixaDZgfDZmhYF9ruOJvalGYG9qmzKbr0LWJ
	RC8eC7ALzXP3ZnjgxKCsdfDKCus6QlrxTsq4LVNL5vvhwYVF0ikPqZV2WIdWY3aeIfx6vVU7cQm
	u8GnwiohlAOue84fT2m2vG9reisnfQ1I0OubriPecytkEcE+FzGX23Ki5+oUrbQqcKZTS7WNyLe
	1VX0+x/X7kHQ0zb6QzQ8mNLoNC9ExZJroKJCF9zYHP/ozdmq2fJME40JXXzbZpLj0fFw==
X-Google-Smtp-Source: AGHT+IEA3Aizumvo2C29apLGRfL5f4cmKkJaCe7dpJMQ1br+YvsIHx4NhcZQQJWEH/cY0jbWIL6pIw==
X-Received: by 2002:a05:6512:3e27:b0:598:e3ed:b43e with SMTP id 2adb3069b0e04-598faa98e36mr2872191e87.6.1765870557425;
        Mon, 15 Dec 2025 23:35:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5040bsm639372e87.65.2025.12.15.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:35:56 -0800 (PST)
Message-ID: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Date: Tue, 16 Dec 2025 09:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_233559_851652_DADFC840 
X-CRM114-Status: GOOD (  18.83  )
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

On 12/16/25 08:22, Nihal Kumar Gupta wrote:
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
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 67 +++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..b1ba182a0d8d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -38,6 +38,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
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
> index 000000000000..351eb5ee70ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,67 @@
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

Please remove 'clock-lanes' property here.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
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
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

data-lanes property value should be '1 2 3 4>', 0 is for the clock lane.

On CAMSS side this cannot be changed, unfortunately it's a lingering issue.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};

If only one of 3 defined from 4/5 regulators is used, do you really wish
to describle all 3 in advance? You may consider to remove 2 currently unused
GPIO controlled regulator descriptions, and squash this change with 4/5.

-- 
Best wishes,
Vladimir

