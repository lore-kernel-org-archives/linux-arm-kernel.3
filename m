Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF4C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=; b=jyT6z+CtMSYFurxq5xBF68Px1F
	pqdfkO0spnAmkfhnsf3J3VKW3f22RZiwDPffObg2BR3MUsYvC8ZJnpzkwh4aETWYnzyQBSs3laKAF
	kw+WQqfGG1KywM+Z8lO985Y5TSqlGkKvlpDxYOPCJqyh0rDfac20ruCLwfGtENSX8YTyUJqLUcXdA
	IM1fTl5puKZOuZXdnlYpLI2o+xh0JCv2x2aUxIQEI9At6yiQ7BDanyC7yJ0snzr0XQQCyZNXnXYGv
	4P7KAijWqJCaGELS++OqtTZv5cAPokuM0MYCMbFIrkydZ1Jh5OckgX3OvbcXgyisO8RPuCRr2Fxzo
	BUHXPlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeyw-00000006qYA-3XaI;
	Wed, 05 Mar 2025 02:59:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpexO-00000006qPI-10CD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 02:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=; b=Jiir7HGqieRUXRZnXm/3ZhPr/3
	ub4I7awZA2yTLrIEM7iEQQ6suJEkeikXJeGFfM+CosEZvuiLCXJlIsAbY1OXUDfVR0U08uEmM0RGE
	WJBGKH351hQJ8B/9SyRc31PNpKyZtOJpDBHQhA5ASmZqlEnzGrho0yKSDKcF/qpFGUoUS4TDA+9nW
	4bJ+24HwrIdy1xC4ffsAnjAmTPGpbYIidzozmS/vE4g3ET7x/O8mdDAqfhF9ruPOKkZBw8+xHJwAg
	q0Mv0Xpy7swT0PNv8YskfEbLdfAMPjydbipJAzA8Z0oqCNSFSXCpoo0KQnT8Ekzue8qMRxRWX4iGM
	gLHceeVw==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpexJ-00000004aXf-3A1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:58:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-549662705ffso3380402e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143473; x=1741748273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=;
        b=pcpj7Wr5IKvfh1o8yaBGhdLSUUKWvHKD+C0988wzDXQwxmjGxescY5vNAI4b4ZmDGV
         br06J/fJik6KjhHuxLgyiUUQ3ALVS+rUJ2xkcAn7hNNwKOZr4AzuzzsbXgNxyIYmAPnG
         TFYLGXRzdjAqK6o5R9P+m/WZN4moUuLxqff7Hxz7yTOpCBeb1OBAKsPBTDzEkT8w+n3K
         ZHPoBUQfbgS+euiofjwosntSKZq0rAZx8Y12Q6sv07DHV6SXwrNLV9Deno5ObJQjOThH
         PO4ahM5nd7q85c5XxpwwlV3MIj7NUGFE4wG+4upJLeTZZzdNpxxjTW5MoDNtPcUVG5LW
         pAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143473; x=1741748273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=;
        b=j3KGFGAmhagzngyZJeoipgMjejPiDkSaGbyX9kH65a2XXT7Spfkqhf6Sa9jfKk7RUH
         zTTT+w0LBXCOq3h9WnvjFSa/T38K1Jkb10h8i6SKSWfEXkI3mCpqoHl92MNs2+MfeS7P
         GI4kAd1PFZLCiXkN1LICl7gHmKaWQ4adJzLCAwTH7e55dVQ2bBgUtklfqyquCWT97eaf
         UiC4Xw1z3W7be8eBKLXIxS0FpAYv+q/a7hApPo5N16Af9FmJu62+i8taa7VFSrdCyo2g
         5fFP9lQMOyR0mDZwF3mQnFaDHA7NlhQrUa/iNdyE3QhzDHY4SqegJsLP23aQEOFvLEHU
         tQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5g593fpkwpNZARRt5Cv32r/ijKaQvYtXvNMarixBweXeBWbZNGFvEf68InjZA3MQFk8agg8f7E6MHCdFOUZLW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8tQBeUVIwPG3VpV4h42LxpSfU4zRAOuSfe+40hneXufSwGW8r
	5nC+9qB2QdJFBWkymVHDXX+sAJlQfJxfYk+yh8njZjR3Qftmp93mxLXA1ro0cjs=
X-Gm-Gg: ASbGncvZh17GDhi4jCDUAhm+ogDy/yKQbeORQJ/gl8O75Ef8GyN8j7TyF3Vj7jLfBTJ
	6FW+frhuTGTUx4bhILrimgofruoakzq4lspnBSnC9b90cMc6huAGqMmqLJStk5UPLYaWBZhtOeI
	Ay+cJCs7WL4dMFyoQ5jaGpsRKC/EMl8PM7XV+DCoqwPovqM+/GL7uhnTLCUwnVH8x0wTLsTsBAc
	kLDAiqLyrdRqc/zJGNpYeXrnPhB/wOP1r6YtlI9Y2GeWcsAEJqtv8cgDTzAeEkGBgeQ5Yk/b0mg
	qoJvAbOIC9rKNjdMaP2wqpBkm9hQnPHi4PT2Xn2sv4GrirdCDVFA52Do3O5Rv0Ob7HxTJT3dDWy
	FSotI0SAV2XWeFj3JKmEjckdz
X-Google-Smtp-Source: AGHT+IHGOGwNINTW4ac1tC6VSgjqBJC0+1KyVOaHFcHtINPFKwdR1g09IOAfwlXr5N6PwikUjAqrUg==
X-Received: by 2002:a05:6512:ac7:b0:545:2335:6597 with SMTP id 2adb3069b0e04-5497d383726mr462845e87.50.1741143473438;
        Tue, 04 Mar 2025 18:57:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494efff26esm1486481e87.73.2025.03.04.18.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:57:52 -0800 (PST)
Date: Wed, 5 Mar 2025 04:57:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <qr5vsq5b4pf5po3uq4esrozfjkmzq5q55tqlxxc74fh2pcygzi@vb7txcm5wpst>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_025757_996128_C64A7B5F 
X-CRM114-Status: GOOD (  19.41  )
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

On Tue, Mar 04, 2025 at 01:56:40PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 163 +++++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..e543e65c7aba3213ca0b8a8f6dbaf1371ed8317e 100644
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
> @@ -1966,6 +1967,168 @@ lpass_lpicx_noc: interconnect@7420000 {
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
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
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
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			status = "disabled";

Status should be the last property

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

Misaligned

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

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +

-- 
With best wishes
Dmitry

