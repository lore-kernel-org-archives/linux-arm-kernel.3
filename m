Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E05E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNN7B9q2J4hdcvsmifk7w5aJJJisTFxNMJ5KcojNYOk=; b=lqtOxCq1GfMcRdxsYZkGYQsk0Y
	KvjqyxGRW0lJ8e9AtfEYs80US73KBzl/rFMfFKAs8wwcRnEQjOlG8fLm21Pi8e7UogMhHoDEjMmXv
	/Ek46YZJ/ajV6ONcLnrfcy1Hnl20eYnDLi6ymG6KpgaqjjOQq2J3O1YCs+V4qiOpU9EliHTcj1wCv
	TB0cHgu0Iu0ICxhVzzhDBx327pWYVclESyXIRxEau8XeG1TvcXb7jrx+WVimUytG6TFj59rQ6soMt
	YaKqvo9SpN4J58IcDvc241Rty27Mn44U1FbsLu0KNm+KtzfSsw1fZS5Y3WU71X7IoSUO4LNVbRru/
	eUG64e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeOd-000000088jp-2zbW;
	Tue, 14 Jan 2025 10:43:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeJX-000000087nt-1ql1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:38:28 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so50667961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736851105; x=1737455905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uNN7B9q2J4hdcvsmifk7w5aJJJisTFxNMJ5KcojNYOk=;
        b=oyw+Ohzk6ZnuUeXy/AmfYNS3Wu8sCzxfJn0cAapWwN9VU+CL7rsrk/efOEcBy4gouE
         naZJOWi9coLTfVRRQiLBHtSThmTUuorOAW5Ka2w5jystE7sGMgDAU79k7mbVcX65x5p9
         mH/pKzjSWlTYABjcIgfzIPojENeRcE1Ey2Zf1EV63yNePZRHrAqsUV9XLtrL8mZWzgY2
         RYGEXauYLcJhlsLlpThSxEwB12qdp9f2GngUaE1Z8l/zeAzW0/xzuykHM+d+2l6Y32qn
         AFqT3meNfs3zWmojgNqlzjpvPmCF6PORv0pclJQADH1ndp82QEIG1UF407H7350o8q6P
         kW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851105; x=1737455905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNN7B9q2J4hdcvsmifk7w5aJJJisTFxNMJ5KcojNYOk=;
        b=K1/p+aEKpGJa2hR7UsXvs+GUFzYaXK+1uyFO3gCD9FL18YKne4i1x8VqxRJOrOBK0r
         2vZOQJET8GwcPYsoUu9n96/L35iBIbIwXg5YtsEve3HAMZyaWvgkJqIWc4R+8o/dt7TY
         bJqNMwA2ETGrpJPyCEw02Bzq0/IZ4GLPAZxbnWcB51ejV3EABNS/iwFFxOIcUe5nZTdJ
         DdEqLCcTvUvCeOP0DWyqy/9hrgE0641n6k//g8LAlilqBj9w/7xVU3DkYNzvA2vD+AvP
         H0LRMAlnWzg2fynj+C+Jfd4CAxqsG87AGcNpTqxIraJDnV86SfYsl7v61oE8cSvVZUXA
         EHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCb8wIB+PJZ+GMsZHJu/erA3Q17BlYUmc59MyzzdsztHjCbzendbwyG3UADJFgNDoqbNGM9nF58EKsexuR2PRl@lists.infradead.org
X-Gm-Message-State: AOJu0YzzdjErC/Lr+kUb58Q/W3WPiC1Js0/q/xzxeNmovaKKCUqUDgbH
	A8Xte6gsw3/JI5UuLGI5bpwrE6fMzlVcL2tUPnBZKy5ElV8H8a/0KzPgK6/6b/g=
X-Gm-Gg: ASbGnctKx6kJ52mCjR4vejayFDjuinrlcZv169FmW1O00nQXRXocOa/geRnVT9NBoFp
	2sTYzU3fRb+ss2mZzjcS+stCvH2sxrBDhR+2sWCXojWMWU8dQThWniZw8BFcYMPtOKsPGd8IhG0
	av1Y97adQFD5LkzcWquzPlT0u6fIfJtauhqMsynOdQb4iI/z+zJn92a6K7RhUOKzrLFITHmHmn3
	vYi0xNuY7KRFhXqXWEv6qUsttfJWxtfJ61CBt8BylkPUX4IqOrlLFCxPuVT9QT1x6xpdveKt0jm
	rFlv1a0il3IejnWXgFdFDkvRTjgnZYDp/mp3
X-Google-Smtp-Source: AGHT+IH9mYReL6tlrIcgo5opzWGTvKgKAIdX/HKYiCEzoUfpZVvDTRHMg3q7JMHy6gADKHC6a95e6g==
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cc65:68aa with SMTP id 38308e7fff4ca-305f45ebec5mr63982821fa.31.1736851105153;
        Tue, 14 Jan 2025 02:38:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec12bsm16951771fa.110.2025.01.14.02.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:38:24 -0800 (PST)
Date: Tue, 14 Jan 2025 12:38:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
Message-ID: <lk26ltslmijj7tj2kst2wsvd6d2hyj3zjzcwavwl63evjhcgdh@ewqliiijispu>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023827_489289_B3F53F88 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++

Separate SoC and board patches.

>  3 files changed, 182 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..059eccbbc3fb05fc8806e36d35dc469d44443a26 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -792,3 +792,27 @@ &tlmm {
>  &uart7 {
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l2d_0p88>;
> +	vdda12-supply = <&vreg_l3g_1p2>;
> +
> +	phys = <&pmih0108_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index f77efab0aef9bab751a947173bcdcc27df7295a8..01c0af643626917614fbd68cf8962ef947ca6548 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -790,3 +790,27 @@ &tlmm {
>  &uart7 {
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l2d_0p88>;
> +	vdda12-supply = <&vreg_l3g_1p2>;
> +
> +	phys = <&pmih0108_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..54522fd3d0e11c3cff02beaf1d249fe654cacc0f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -1966,6 +1967,139 @@ lpass_lpicx_noc: interconnect@7420000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		usb_1_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x3000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;

Missing orientation-switch and ports{} description.

> +
> +			status = "disabled";
> +		};
> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
> +			usb_1_dwc3: usb@a600000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x0a600000 0x0 0xe000>;
> +
> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				iommus = <&apps_smmu 0x40 0x0>;
> +
> +				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,usb2-gadget-lpm-disable;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,is-utmi-l1-suspend;
> +				snps,usb3_lpm_capable;
> +				snps,usb2-lpm-disable;
> +				snps,has-lpm-erratum;
> +				tx-fifo-resize;
> +
> +				dr_mode = "peripheral";

This goes to the board files.

> +
> +				dma-coherent;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						usb_1_dwc3_hs: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						usb_1_dwc3_ss: endpoint {

QMP endpoint.

> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

