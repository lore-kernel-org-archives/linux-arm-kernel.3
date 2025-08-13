Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355BDCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R0PLr1UJ15LH0yUiipvHzrelupSAOLxlwfOAUkKpZE=; b=gV4oMVrhotAozd6N/3o+4wjRp6
	pY5RDDAsZYIZz1LdIuJ/Oy581+6gEGV/AT2e3Ih7973mWoHZL3egL5F/AKlLvkZcmmpBICm8MT7+T
	bV615HkOgXUwk56OA+KxBR+KHJBEIuOPabtP4nm3/Z+FjpHs9nsv3OpFoPPCc76WRwn2X2Ftzusyo
	O5+0b7mIClUUfDC8Xwqdx8lUVth/+uVD1s1M2ez5g9fWHX4b+qW8SsF4H1crNu24GaqXSGVKK/HM7
	/uYX5R7j4IGeXd3BAfdbb6HqjCbBr8jMxmDq53iwArBiN15ULdrZ+mAIh6c7aaphfZFMrZRaD9ThS
	iNmsS9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJGU-0000000F3zk-00xk;
	Wed, 13 Aug 2025 21:44:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJA9-0000000F2yq-3MVp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 21:37:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso229626f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 14:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755121056; x=1755725856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/R0PLr1UJ15LH0yUiipvHzrelupSAOLxlwfOAUkKpZE=;
        b=edn+pVyREljRWtOL77fzyia+B3EcsGRu9H64Bu0ZvKHwdW7364w6qOMgmCPv1HOXe5
         Lvzp8RBVPfsSNUMd8kXLlEOBFbxzdZb33v/vPX3+/m7+KzIOwB3yt+6py1MvXKYFulyl
         WfuB12qYXbrXb6QySE0I3mIvUtqB6JWb223T0Q7T1h7Tx9y5k1hJr8Qd4kIRC8K3UkEn
         MFtdngUbKbqBtpDMzJUhdhYdA8/RAf+HnXZX6FOKAAg2uiQiiAiUSLUMp5OX26pBxUqH
         Tq5KCAjbZHP7GeSWefq8+hbejzrADOelsaVgDglyEb7huYoDscinxTn7OM+iIT9AT8v0
         808A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121056; x=1755725856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R0PLr1UJ15LH0yUiipvHzrelupSAOLxlwfOAUkKpZE=;
        b=cgPvjGXIPkbOsRl6VgCzMpxkyAuuoIgmUvRXAFqzTT0ZXLfqXxjogQwQBrtp2BkWvT
         NYXzq7MA/UHRkHrQ9VcP0pkfEDxWU6YHco3+jOcuusAoITgNSJkai2xL1EWL0mAJtd0j
         PbnCq0JszmgHSx7mcdN4DUPL2ENX+9ZcR46gN7AZAS7Dvi8Zqalewlk8SNABfDXmp+9h
         KWHh2/r7FIAimaNC7CXtMIz2nBu/VrlJX1fF7yJR3Dd73YgMWUhXdNR9XYsJa8W9yBM6
         hhLNkTpxMaDan8ZgIwBVx7pWDzylzhSZ6vkyr+S/AIRRYSQFinGmz3uYu7b3nqinf3mi
         +GAQ==
X-Gm-Message-State: AOJu0YwRw7wx4SEv/IdnVfAYaWo3fbdaQHK3CZbSWHGVs/yy9rezw8yy
	g/xKGeCw3EohCfuUM09wr1b6EJbDwPCgV7G2yq2g/jnO9QgKokDQsffxry0FDhdNS14=
X-Gm-Gg: ASbGncvRx9nnsCy7QjvP8VdlTyrFoE4LkgsFB35GRimUxPVzUGUDZADpBkPK69vt9DS
	kWKLk8UwHRGVT7vp3VZ1gZWauQ2LCR3mlvG8fx/rM/pyuhiwW+hz5/0iOq7rxncDvyAywDhPrwb
	VhqHcmTqJ2FllRy27MOiYSWskyVmxZOHgeOb8o8joSe/NhyCILKaXUrNYCF+YG0D1OBAzP6Cvlc
	tMw15vF+zi2Oj56Zj9ysYn7ecWt/0oN4HoT2J8Oj7FOa/pC5AvsYTsOTEEZIi2OM9K0z27+M78z
	AnjVomsojWj7VbGeqY0H9Y0MMioaWrnkUg1FG91ZD/jleMQQnR8/WHNhaR657XT0WxXvSNnig+2
	+G5xQJ73xzu8chSG/CBTwM0CGxC+FOsdQSEYhNVpvicMn/lb3ElW1fwoEL+kHnz4A
X-Google-Smtp-Source: AGHT+IHDgkAiDoUCfIGsD1JHcyl15RLIs40KyXWWTRPJ8npwc6pR4KZc9S2TTnaRFinIsu9wVY/smQ==
X-Received: by 2002:a05:6000:400b:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3ba506624edmr206323f8f.4.1755121056198;
        Wed, 13 Aug 2025 14:37:36 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a540945sm15247815e9.26.2025.08.13.14.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:37:35 -0700 (PDT)
Message-ID: <03947c1c-1d60-472b-883f-c9875df20245@linaro.org>
Date: Wed, 13 Aug 2025 22:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-8-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_143737_847213_2ADCED3E 
X-CRM114-Status: GOOD (  14.33  )
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

On 13/08/2025 06:37, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>   1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 3cf1d4bc7e4a..538b55a89f28 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4641,6 +4641,177 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0x0f00>,
> +			      <0x0 0xac7c000 0x0 0x0f00>,
> +			      <0x0 0xac84000 0x0 0x0f00>,
> +			      <0x0 0xac88000 0x0 0x0f00>,
> +			      <0x0 0xac8c000 0x0 0x0f00>,
> +			      <0x0 0xac90000 0x0 0x0f00>,
> +			      <0x0 0xac94000 0x0 0x0f00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x0400>,
> +			      <0x0 0xacad000 0x0 0x0400>,
> +			      <0x0 0xacae000 0x0 0x0400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0x0d00>,
> +			      <0x0 0xac89000 0x0 0x0d00>,
> +			      <0x0 0xac8d000 0x0 0x0d00>,
> +			      <0x0 0xac91000 0x0 0x0d00>,
> +			      <0x0 0xac95000 0x0 0x0d00>;
> +			reg-names = "csid_wrapper",
> +				    "csid0",
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
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
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


"Eat recycled food, it's good for the environment and okay for you"

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

