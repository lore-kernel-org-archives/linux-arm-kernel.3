Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648D7C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptWJ7zdNtWBMDj+P9H5d/yhoNBNJZeSvROVnxn8+Cy0=; b=ugQ2l22hb5FgIYGq6LFGtjAbJk
	qBItC4reYAj7PatwGHvZMDIsMErgMmiDeH+Mx7Ukr46H9gRaQoybgtqbZG57CPB0koiMtHzg7H3rc
	WIinU/i9B3GaMvO/3orIedx7hqLjLXarBH5T9FgQNZe2jS2QKLw4DJ5Mu9aRUNTM3/v7ZbUKaLKSJ
	oHAPxb2dMlZOq6anoLys5rZzq4kB1vNKyjQ26Ll+rm3WPkbXYsfbELqFK5+OETcF2a+eH/AfFf2/4
	vDDU7JAVQs/rgwOChoBe1BYN2Eb2CgyqbM3hB1X5YHNOVsrD2WAO+7kZUo3ir/dqBfNLsm2OzLGWc
	QI/n9BsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKoW-00000000oH6-2gDR;
	Tue, 04 Feb 2025 15:26:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKi1-00000000ne4-10My
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:19:30 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-540218726d5so5558015e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738682367; x=1739287167; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptWJ7zdNtWBMDj+P9H5d/yhoNBNJZeSvROVnxn8+Cy0=;
        b=I6mCuKXWs6vLee9EWvAgt10kmN4Rh+NJH+A7dkGPovo08jrSZhkumyUXqoDDHthGxf
         VKzdsdimQfDB+Et17mYH2S089MwtoSlEzVicj+f45hbcLiAxLxcDi/QapgmBzNxakIsL
         HBVCanTkhu9K8p60pGmDZO+O/gZRxQ85Hyym5hQYMjNCq/IIRFiq5i7dnau7Ee6Y/LzV
         Cdsur3uDpZVIE/ql30ShzLgZiakzgtzyfeaoOKHX75T8JmRVuDjWW28kwh6PDvYdt/HL
         l9/SA5k8y4DVBZ4ciqFdZB9w4nlRE7jJy2ZcdNJbkaaSpkHJe3Lzl7XJZ5GLRXaZMr5b
         s0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682367; x=1739287167;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptWJ7zdNtWBMDj+P9H5d/yhoNBNJZeSvROVnxn8+Cy0=;
        b=JeXCbBqEgGK8TcHl2BgXohBf3XWReZncyPrOQEHJqNrDUHlXKWd4Ol8zwwVmS7CxyV
         SulcbYDLcPq7agI2yZMUCMNY6gr98oz7snmPdSlJ4DKE+GZZHQy8s1uohoQbEpe8go8I
         3uYNR+3alDapfdjf6/MD5ySSthwTs6EMtKF6leX+hM2OuID/ivt50suhn2viEZDL6aj9
         ZwpMJUUQR0/NJUWfilb+Us4nKBaTKr7URlhzhCuXHFUn9nPKncn8LfCezRvCZofH+Awa
         UK6uhb6meSY5Uq+aKJDOtDtPLvLGz7wUgoLSfVYevuVO+cbR7C5e3WHmH/ycYF900Wta
         Uf2g==
X-Forwarded-Encrypted: i=1; AJvYcCU+GIe4wez9oSOpJ4n+8uTK5w2CQcQpEolrQnOGr3VJ3g+tZ8eb+zxlxxoW7WgGLuBF7RZM3owOdArtvztDD8+z@lists.infradead.org
X-Gm-Message-State: AOJu0YxJCpDO6Cf6LeI5BcRDJeTVIQ+hlO9pOadMOJgYqpAh4sF//XYj
	dqIc9i36UABvk4K9MV5S/cCq2Jk5HxDR+FGoXuDRRg8l9D3meioa2yOk2acC6pE=
X-Gm-Gg: ASbGncuH40g/2OvDCRZDP/Yqnt5Fpjrz+w2e05Wpsi5m5m01ABW9HjCbMvDV2qAzsOR
	AFT2ngmpu5QT4IGJpWRfCe8p1nTnJYQ2BFVLYQHr2QPodfLfOQC9JlVOJBEbkDcMHpXTX2eLY8I
	36LQLZX+qdPQntYcckjrAaPtAUMNz+TidlQrZxCI/uy+TUvxC/ICeAWCfCf176fwyRLn5uZD+0D
	rGpyNONmzhEtbwb6TuINnp5HHQCdGc68G7qvLdYCwd0AiRphTu9gc4JBZ2liBjdVMKMGezIS4lz
	vGwhGmLJzX8R39zWhhJwVHWWuPw+CupqJe/gCx9wl1psJqGMjvwm858AFF5xVRR6uVvZaNE=
X-Google-Smtp-Source: AGHT+IE2qVzH17AZUiAiSfRIP9fn/n6qJoeyUN6d/KnBt+D7ZA4ynyd5JH2BepJz0FL+EGOxxpTguA==
X-Received: by 2002:a19:ee07:0:b0:540:206b:c355 with SMTP id 2adb3069b0e04-543e4beaca5mr6791855e87.19.1738682367068;
        Tue, 04 Feb 2025 07:19:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0b40sm1604056e87.112.2025.02.04.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:19:26 -0800 (PST)
Date: Tue, 4 Feb 2025 17:19:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add USB support to SM8750
 platforms
Message-ID: <flwitkfqnrrz7kq7qwzxfjauxvysegpxhxtftofalfmgdde57t@cwtoj3s2676z>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-7-09afe1dc2524@quicinc.com>
 <lk26ltslmijj7tj2kst2wsvd6d2hyj3zjzcwavwl63evjhcgdh@ewqliiijispu>
 <4a18ddb1-a7f4-41ae-b115-516b1710cbde@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a18ddb1-a7f4-41ae-b115-516b1710cbde@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_071929_280021_4E62B2E5 
X-CRM114-Status: GOOD (  26.36  )
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

On Mon, Feb 03, 2025 at 07:21:52PM -0800, Wesley Cheng wrote:
> 
> On 1/14/2025 2:38 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:13PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> >> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  24 ++++++
> >>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  24 ++++++
> >>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 134 ++++++++++++++++++++++++++++++++
> > Separate SoC and board patches.
> >
> >>  3 files changed, 182 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..059eccbbc3fb05fc8806e36d35dc469d44443a26 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> @@ -792,3 +792,27 @@ &tlmm {
> >>  &uart7 {
> >>  	status = "okay";
> >>  };
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +	dr_mode = "peripheral";
> >> +};
> >> +
> >> +&usb_1_hsphy {
> >> +	vdd-supply = <&vreg_l2d_0p88>;
> >> +	vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +	phys = <&pmih0108_eusb2_repeater>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_dp_qmpphy {
> >> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> >> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> >> +
> >> +	status = "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> index f77efab0aef9bab751a947173bcdcc27df7295a8..01c0af643626917614fbd68cf8962ef947ca6548 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> >> @@ -790,3 +790,27 @@ &tlmm {
> >>  &uart7 {
> >>  	status = "okay";
> >>  };
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +	dr_mode = "peripheral";
> >> +};
> >> +
> >> +&usb_1_hsphy {
> >> +	vdd-supply = <&vreg_l2d_0p88>;
> >> +	vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +	phys = <&pmih0108_eusb2_repeater>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_dp_qmpphy {
> >> +	vdda-phy-supply = <&vreg_l3g_1p2>;
> >> +	vdda-pll-supply = <&vreg_l2d_0p88>;
> >> +
> >> +	status = "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..54522fd3d0e11c3cff02beaf1d249fe654cacc0f 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> @@ -10,6 +10,7 @@
> >>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >>  #include <dt-bindings/power/qcom,rpmhpd.h>
> >>  #include <dt-bindings/power/qcom-rpmpd.h>
> >>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >> @@ -1966,6 +1967,139 @@ lpass_lpicx_noc: interconnect@7420000 {
> >>  			#interconnect-cells = <2>;
> >>  		};
> >>  
> >> +		usb_1_hsphy: phy@88e3000 {
> >> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> >> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> >> +
> >> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> >> +			clock-names = "ref";
> >> +
> >> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >> +
> >> +			#phy-cells = <0>;
> >> +
> >> +			status = "disabled";
> >> +		};
> >> +
> >> +		usb_dp_qmpphy: phy@88e8000 {
> >> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> >> +			reg = <0x0 0x088e8000 0x0 0x3000>;
> >> +
> >> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> >> +				 <&rpmhcc RPMH_CXO_CLK>,
> >> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> >> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> >> +			clock-names = "aux",
> >> +				      "ref",
> >> +				      "com_aux",
> >> +				      "usb3_pipe";
> >> +
> >> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> >> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> >> +			reset-names = "phy",
> >> +				      "common";
> >> +
> >> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> >> +
> >> +			#clock-cells = <1>;
> >> +			#phy-cells = <1>;
> > Missing orientation-switch and ports{} description.
> 
> At least for this initial submission/series, we haven't yet defined the PMIC GLINK connections yet, so does it make sense to include these now?  Basically, even if we define that connection, since I'm not aware if the enablement of PMIC GLINK has been added, it would be nil, as it would be the one responsible for registering the type C port. 

Note, I haven't said anything about PMIC GLINK. The QMP is still an
orientation-switch, no matter if there is a PMIC GLINK, native TCPM
implementation or any other external Type-C controller. Likewise the QMP
still has 3 ports, one going to DP, one going to USB3 controller and the
last one being empty.

Also, please wrap your comments, it's hard to read them otherwise. The
recommended width is 72-75 chars.

> 
> >> +
> >> +			status = "disabled";
> >> +		};
> >> +
> >> +		usb_1: usb@a6f8800 {
> >> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> >> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> >> +			status = "disabled";
> >> +			#address-cells = <2>;
> >> +			#size-cells = <2>;
> >> +			ranges;
> >> +
> >> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> >> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> >> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> >> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> >> +			clock-names = "cfg_noc",
> >> +				      "core",
> >> +				      "iface",
> >> +				      "sleep",
> >> +				      "mock_utmi",
> >> +				      "xo";
> >> +
> >> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> >> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> >> +			assigned-clock-rates = <19200000>, <200000000>;
> >> +
> >> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> >> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> >> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> >> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> >> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "pwr_event",
> >> +					  "hs_phy_irq",
> >> +					  "dp_hs_phy_irq",
> >> +					  "dm_hs_phy_irq",
> >> +					  "ss_phy_irq";
> >> +
> >> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> >> +			required-opps = <&rpmhpd_opp_nom>;
> >> +
> >> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> >> +
> >> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
> >> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> >> +			interconnect-names = "usb-ddr", "apps-usb";
> >> +
> >> +			usb_1_dwc3: usb@a600000 {
> >> +				compatible = "snps,dwc3";
> >> +				reg = <0x0 0x0a600000 0x0 0xe000>;
> >> +
> >> +				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> >> +
> >> +				iommus = <&apps_smmu 0x40 0x0>;
> >> +
> >> +				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> >> +				phy-names = "usb2-phy", "usb3-phy";
> >> +
> >> +				snps,hird-threshold = /bits/ 8 <0x0>;
> >> +				snps,usb2-gadget-lpm-disable;
> >> +				snps,dis_u2_susphy_quirk;
> >> +				snps,dis_enblslpm_quirk;
> >> +				snps,dis-u1-entry-quirk;
> >> +				snps,dis-u2-entry-quirk;
> >> +				snps,is-utmi-l1-suspend;
> >> +				snps,usb3_lpm_capable;
> >> +				snps,usb2-lpm-disable;
> >> +				snps,has-lpm-erratum;
> >> +				tx-fifo-resize;
> >> +
> >> +				dr_mode = "peripheral";
> > This goes to the board files.
> >
> >> +
> >> +				dma-coherent;
> >> +
> >> +				ports {
> >> +					#address-cells = <1>;
> >> +					#size-cells = <0>;
> >> +
> >> +					port@0 {
> >> +						reg = <0>;
> >> +
> >> +						usb_1_dwc3_hs: endpoint {
> >> +						};
> >> +					};
> >> +
> >> +					port@1 {
> >> +						reg = <1>;
> >> +
> >> +						usb_1_dwc3_ss: endpoint {
> > QMP endpoint.
> 
> Same as above comment.

It is independent of Type-C integration, so it should be linked to the
QMP PHY.

> 
> Thanks
> 
> Wesley Cheng
> 

-- 
With best wishes
Dmitry

