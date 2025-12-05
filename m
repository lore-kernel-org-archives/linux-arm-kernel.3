Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C44AD374A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 20:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9Wo+1Se6lY8DvFwqqpCqBwocypMRWU88O6342NNI7E=; b=WhCqEGexUIgaXyCHZjdssHYw28
	X+lD8lf+HsvyeNxN8ubmjdZQCpcZGXgn2Z2Pxc/j6M8ybeffdfyIjDFruUft1g0XqWO2lvP22DGGB
	xSnS99COFoHIPybuRh+Vtk5GW8RqdQ2cr8Xyj3/eu7oroHZKOPwFAUR9Qz3y4WtdhrcgEvm4vnU5N
	R61GNM5AJlTuJaILNtAfCfzzYmniO6W6n0qS/+V2PjVopjE3Yg1MV9DKcPd59HPQNedCmIMW+uzCo
	p5UPabNbUiflBh862+WM1DJdSoP0r9CS3aEgVlTkkICHxt7teY5cFuA3zF6/3D10CbwUIj6ZwDPXw
	Am5sJOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcu6-0000000A2ll-1C6U;
	Fri, 05 Dec 2025 20:59:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcu3-0000000A2l6-1ex7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 20:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21C7D418D2;
	Fri,  5 Dec 2025 20:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACFFC4CEF1;
	Fri,  5 Dec 2025 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764968386;
	bh=tbb3U8kOAoHb8MsB6UGWfD69DI4c9U+yWj1wihPESnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQnoPjMrtPyGbXHPebBcsdossaJhpr5gXDEQ6rn3pLSRs15/F3tvYoMsaAOdqOfBX
	 v9YDbHIUAV1zgUTMy+bDGUV+AJO/FyqAFTseqXc1Ryo8X/6dybwIUMeSGCpa+BAaJ6
	 Z+nNgS5DohoJFpdvrOKXjw8Onanu/jbXrIqUvvRL7428rUNdO0eVe60QyPKeZgdFid
	 VwMUsaJaAovA2OSp7MomJq1ts0/bZtBbKLrLtnCWih6wC4VRVNbujyHSqdlGAwpr7Y
	 xU1maY+N4+38vL+pMrYwr/06vOVD2ug/Aa6Yg3EgVoE4MhPKfTXQwA3DPywPU9prxG
	 nFjxl2m26wbLQ==
Date: Fri, 5 Dec 2025 15:06:04 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g>
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_125947_496513_64517472 
X-CRM114-Status: GOOD (  20.74  )
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

On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:

Based on the other changes to this file, the subject prefix should be
"iommu/arm-smmu-qcom:"

Regards,
Bjorn

> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V3:
>  1) Add actlr setting for missing sc8180x & sm6115.
>  2) Improved commit message.
> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
> 
> Changes from V2:
>  1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>  2) Improved the commit message that explain why different ACTLR
>     settings
> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> 
> Changes from V1:
>   1) Added actlr setting only for MDSS and dropped for fastrpc. --
> konrad
>   2) ACTLR table is updated per alphanumeric order -- konrad 
>   https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c21a401c71eb..149da53091de 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,qcm2290-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-venus",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8180x-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8280xp-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6115-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6125-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8150-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8250-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8450-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible = "qcom,sm8550-mdss",
>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8650-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8750-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,x1e80100-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 
> 

