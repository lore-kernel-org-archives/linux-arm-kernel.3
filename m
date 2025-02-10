Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DE6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=; b=d/3BVpgMYv2jApvlRGc5v7cxFU
	UOs7I4TFQFhjr88aOGTNnFwToN7pp28WYgBVz53YB+bpDaifI0PfBjEGKPfsrx3e9JhqL4dB+k3Ct
	919fo+umEwe9sPxGA2YxjzHxMHHW91krKuqhYuQzK3IDwHl+gfgxPCqt9neipRnuRcMOGWL6r/DZf
	lsrchRKxKC82JhGp7YtNONcsvLTuwzbvBVs5Bu2jMnS/UGIjF8Uxc6TtD1t7W0XhwX87mqHs4S0d+
	7LDBnu7T/4kZ/aAtYG80A1YBBvYJCxGrLzv9YA7ayt1r3RNoRV2T4v2d7ZbarFbYCNPn2Vr/fRvw9
	yoSt3beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRr8-0000000HCCJ-3K0C;
	Mon, 10 Feb 2025 11:21:38 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRXf-0000000H7lu-1VQz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:01:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-545097ff67cso1121950e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739185289; x=1739790089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=v+g+mjWSenueBQgyn5ouB1GwAHzuwzUchm4uWMsOhZqH6MU7z5woS3ixCUiMTiO5Zr
         a26OOIS0CH1VocwUJNnSh3HdY9fqZ/DarUImoIYXdeD2uofojgpxpGyZp+3nWO2iK4cF
         nOg2zL097JgMcy9aOpM0R0rZWE0Q7fsHAT/K2aQt4pCWwZqRAAtnTTWOVb7zuGxUae1v
         HUXVuyf7R0gOXBHWVIDl3RtKZg6QDZFu4rhRmFZ15BSM0FnGHldImsHxHmH/dZKoI+ND
         fz5VOEBzylMUM03n+LV36j7ctnUBGxEM4BIzoHTkCoDv7D5uQo5OV4DwmYhg8H9TEYyL
         1r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185289; x=1739790089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtTBVwp4J9apExhc56rvDYwcShHHaMo1N7lDCxauzzY=;
        b=kQYLxSOf2ppQSHenMrmQ6gEOJiMYgRvimO5xA7rp1NzhJaL6kDYhbJiS9J7A7MilqB
         APQOu01GVrYLTmafm5auLKEq+29NzG/EQh64PIYAS4+/IhMWwaeuCd5hJIYSAVdsNh+9
         ETw8Zxd0x0KXLA9/inofX0lbhLFU1GClrGFI03FSMfReLLaqtIuBa8iIFxjzVhehP/Tg
         Kp1kKVK/8UYtXahtwetcXSdx+fhPrLjugV9FqUARyfRxqKxLLc93Nho6Id5pCVpduwE2
         zzT592xtZJjmanx54J21UsDtGYp7fuMuvt680PgCSsppU9TnxqB0qgeYXFXDyKWJY3Ks
         77rg==
X-Forwarded-Encrypted: i=1; AJvYcCVnX/QC9JdbdQYETZLdTchp+C3gcwt5hn96MFu5d4dqy8qgwod4+zESZMACC4z1c9e3hSxp7WGlU07YvfQMR7bU@lists.infradead.org
X-Gm-Message-State: AOJu0YwJz1Ps1PJGHmaHYs+wFhvLpzl15JVeC+eWhiKrl30CZ3yg5mY6
	o1ZT/OuJUqkiQGKzUVisuFwNuW84e2HJe3H85RX/LsqUnMgMrsCv2eUUJ5hspkw=
X-Gm-Gg: ASbGncvw4M6YlrDe9g8gFDwyWaFdwr8gMYTzngjieVyHdWqtN/SRMUNV2dlHiPf5DZw
	iiS2F/bAeFSlsxtiE+8L9+opJHulHIEq9bDwSDMOIpG2vNmdQ8no08Vc1sxEFZ2Et/CEJpGNlap
	Zz++awbBjuRqHqLix0ASlms+8GADDLlaLeLG/cTW9MDFImJHy9Sxt1+7Spv0Y5IVmdexz+aqXRo
	tn2EeYLSxpc02WApSpQzvTO5q+Gtxyln3szVCIKNX3U8/wA82AEe4hxtIzGN55EfTxlzVgktlr7
	g57RlwFOIPf1JPr+UlfdWnidqKdlfHai1TtQkbo6we/aJIrczpc30/CjfGxd1xNGJIKp7X8=
X-Google-Smtp-Source: AGHT+IESGWlTJg2cuv8Kgo6v/dDQZjg10SE7StQf8S4vcvj1tAiGKln4CJ/xT6Y54Ae/tQTmSnk31g==
X-Received: by 2002:a05:6512:4022:b0:545:ae6:d740 with SMTP id 2adb3069b0e04-5450ae6d79amr1090753e87.41.1739185289056;
        Mon, 10 Feb 2025 03:01:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450c0823acsm321386e87.118.2025.02.10.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:01:28 -0800 (PST)
Date: Mon, 10 Feb 2025 13:01:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Message-ID: <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_030131_403512_660047FC 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Feb 03, 2025 at 11:17:02AM +0530, Pratyush Brahma wrote:
> Add the device node for gfx smmu that is required for gpu
> specific address translations.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..7a8211bec139375b5aab939f123d88fca7aceff2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x3da0000 0x0 0x20000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +
> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
> +
> +			 clock-names = "gcc_gpu_memnoc_gfx_clk",

Stray whitespace after the Tab symbol

> +				       "gcc_gpu_snoc_dvm_gfx_clk",
> +				       "gpu_cc_ahb_clk",
> +				       "gpu_cc_hlos1_vote_gpu_smmu_clk",
> +				       "gpu_cc_cx_gmu_clk",
> +				       "gpu_cc_hub_cx_int_clk",
> +				       "gpu_cc_hub_aon_clk";

clocks and clock-names do not match.

> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +			dma-coherent;
> +		};
> +
>  		pmu@9091000 {
>  			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0x0 0x9091000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

