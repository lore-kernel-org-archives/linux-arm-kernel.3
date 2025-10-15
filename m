Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D92ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=; b=gKBEuEQfnrivQDVkcjOPTfK6B1
	a0rB6QTrrqD1PH9v4Pf+vv5g7fVZH3IjlJ64w3ubf4fWBLi2Ale2riaALcn9ZFj6Dz2X4wzF1tWqv
	sqPc9LbLPh/1XNKRM/AZShzfT8nXLqwOtupzMZyK/Ktyd5WA3KX9+5A3hQizO253PVDXgPSMEe+kW
	pazwCkus/OCSY4wAga62UZ8Pu888blyU9ioY1EzfzkHuOkAqpKANw8SqBIoHtLowTyoQb0c94bSou
	ye0ol5cHYnXc9AbnxVUe0N50F0q0iLOcjXq2b2awOd6OAAyluQe8yc7hntzv/wYdACFu8xtguOg1G
	wYcgU2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96ZC-00000002eV0-3dgV;
	Wed, 15 Oct 2025 18:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96ZB-00000002eUD-1ene
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=; b=Fo2+QXiVZWLzhaTWFJlt42Vhuw
	/dXEYFZVTJ/5xTyPf50kKdk93astYjy5j/PXOQXFU5L5REn6E3FaSQTy+OvZ/mwNemSafiR6b1OKX
	KpqakGJ8O3DiRSaM8f9L/JxFE7Zdlj4m+EPi16ZyGbRsEZoB4ykj7/9XsffKMtAIk1NPrNnFu/Yyb
	xCW/tXMaSxTiqoostIID6KpxkK92iUrYTDUtU3F1RCVhv9vWfALXGQ1jwBK6GLjuyOKPe9w11iOVz
	sJjJCDcEsgIScNa9fJAVzi1MVSzjRky1Grjau8N/OvZGUMmUtD2NS9Qq1fkAHzrusx08j/HLCzHxc
	LKeNN86w==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Z0-0000000694Y-1AI5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:49:35 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57b35d221e2so1132966e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760554165; x=1761158965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=;
        b=IZ77R3rqak+ZPoudv6oQNMThlLLs+i02HvHVXUavsA0vsybKIanT3SlD2Y8hOrpNbN
         TEdwBfCL+a4R1bGL57VZjdZohxu+RvSDcfCUf5WXMGU1ZuJ/966ZN8FZHrfWFVhwazsA
         lxMZA5260bdTlk6a3fHFvNczE6B5Xfg7f4iiT2ZgYJRbhfT34PAHKF5U5Zpe1E+5zXL6
         OFIRtKNgtjiwhU6+s5z12hs2JX9ZXHGsEoMd36gnQ3hK2SdEAdatHGLPTa0GUHdAecNz
         Mym0N/yvl3ULn1bkCMYvWd+smA9KxC/YEYwStqZLPjBJhsV39vyGIHJjJga1qAubC1p5
         36lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554165; x=1761158965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzWJncyHzn0swQi7I4nmNemTnnfZkUzy+RF1ph+lVak=;
        b=YQEiupYh4NvknW8dv/3cUCSnkNARX3S3DLF6vGUf8ccDR9Sa/LijSMIm55FDcFUusE
         xRR8byiywieAt3h+n5vHbhYKe3OCNpZATxdFACP5UGD//f7MNrTx6DHKHTkqb26u07Lw
         2nnoPSo7qJY2ujeR9e0DFSCXOqrpw/Gidt4mxdAi6mFzYNDkf0GuXqSQtuhqO4t36ttD
         TGHgp6rQCxJ45K19wlUnUczbzFJAHmqaGJ6lHQNF/B4tWQSoR05uevRV+VFjn7R1uOJs
         xFmRQ+2bsxqMudHFXOmyGirZlexHE8m81azaQeortM2uIQmx7Jo/0mzfcZYBN1krIJsV
         0dTA==
X-Gm-Message-State: AOJu0YxltsgQZwCgJXyB3fRcNCtj/K/oaM815bCgaTcZxbBp0cl3pB3c
	F0xSMp2a9g4/k78Q4BvGgI9+dpGb4I8mWkG2tCjeUAOFa7/IjzhdBl3dwvXMtC29e5M=
X-Gm-Gg: ASbGnctKOSPjoyVpSxsTfCcs2JsrgDKHrQRApcTVayJlAQAIb6p8KHYD4fucXQk+O4V
	4UnmGSrpRYGyWb2Kuifg4RuxWbDmVBEn71JNDNH7W7gSMaUDvij9LFqL/fH+1qD1BzbgWbWHSuE
	OxiYZJsMZ4HyFB6zTuYjpspBNI+nyHwUHebLGgwonNHoVwt5mkJuH87YGUByRWWgynTDfAidFhC
	OOuNbP1xY1gNvl0lSHdzzvvzDP4YyaIvA1ZLS/y2pb26aL3j5UOQHkfc2XCH5bht41VIzzTuyu4
	w4zgoTJBTjEa+PPuI3r1faLQ1huOUZDWJmFn2u19+sJSkNq7ZwqcBaWoudWa4QeWhtedEmEbHL5
	fDjnqODEzTRwcc4hyf4sPstj+I5EhVWHLk9csj15kDN4ylPuNDh1/UzsguMuCPtLBf7NVW780KX
	NeKiG7oEDMsEQ+Nh6Mf7PK3LT3xJb4N9R08SCBkrOxRMcPhJAA707Q/S2827fvo7YP3WFEqvD4H
	9sRC/sZ
X-Google-Smtp-Source: AGHT+IEZp9j24Q6VxXUOyr7mVBGBzy2hOIza1xmN7Uf+Xn9oo37+2SzKCXeek/w8Yj5QVPavcLsMqA==
X-Received: by 2002:a05:6512:1054:b0:57f:5f3e:84bd with SMTP id 2adb3069b0e04-5906db0ccfdmr4378907e87.8.1760554164814;
        Wed, 15 Oct 2025 11:49:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591c2bcc26asm1728266e87.46.2025.10.15.11.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:49:23 -0700 (PDT)
Message-ID: <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
Date: Wed, 15 Oct 2025 21:49:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_194932_884571_BEF7CCAF 
X-CRM114-Status: GOOD (  17.80  )
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

On 10/15/25 16:01, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>   1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 8d78ccac411e..acd475555115 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0xf00>,
> +			      <0x0 0xac7c000 0x0 0xf00>,
> +			      <0x0 0xac84000 0x0 0xf00>,
> +			      <0x0 0xac88000 0x0 0xf00>,
> +			      <0x0 0xac8c000 0x0 0xf00>,
> +			      <0x0 0xac90000 0x0 0xf00>,
> +			      <0x0 0xac94000 0x0 0xf00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x400>,
> +			      <0x0 0xacad000 0x0 0x400>,
> +			      <0x0 0xacae000 0x0 0x400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0xd00>,
> +			      <0x0 0xac89000 0x0 0xd00>,
> +			      <0x0 0xac8d000 0x0 0xd00>,
> +			      <0x0 0xac91000 0x0 0xd00>,
> +			      <0x0 0xac95000 0x0 0xd00>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",

The list of 'reg-names' is not alphanumerically sorted, this is a newly
introduced sorting order pattern of CAMSS 'reg' property values.

> +				    "csid1",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_lite2",
> +				    "csid_lite3",
> +				    "csid_lite4",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "tpg0",
> +				    "tpg1",
> +				    "tpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "vfe_lite2",
> +				    "vfe_lite3",
> +				    "vfe_lite4";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb_clk",
> +				      "cpas_vfe_lite",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "csid",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "icp_ahb",

Please remove the ICP clock, it has no users in the driver, and if needed,
it will be added later on.

> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csid_lite2",
> +					  "csid_lite3",
> +					  "csid_lite4",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "tpg0",
> +					  "tpg1",
> +					  "tpg2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1",
> +					  "vfe_lite2",
> +					  "vfe_lite3",
> +					  "vfe_lite4";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_0";
> +
> +			iommus = <&apps_smmu 0x2400 0x20>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "top";

'power-domain-names' property is redundant, since there is just one power domain.

> +
> +			status = "disabled";

There should be no empty lines between proprties.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

There shall be an empty line before a subnode declaration.

> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,qcs8300-camcc";
>   			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
Best wishes,
Vladimir

