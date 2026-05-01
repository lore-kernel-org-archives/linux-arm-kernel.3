Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9FECD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDMlaTUNGVqmc1jmP6u4TfGXv+GXsCG3iAN8BRJBeOs=; b=OyUG4iBzxaUb/mKY1l8R9SHcEE
	CzbxtnPMj421FdxpzryHWGrtGyJWVXirt5nlJ0tLIAvN+KBpYlZww5/PgOt6SumEbDdca/KHfz4XK
	lNIsPZk6Vj/5RfCCuHjr5hSJywsmp3bMj79Phj0vE6AqW80g30qrPX0MOzopRkDEKKmtQzci04PHu
	eys96cOUpeiFat920lw3ez+N5hzQ/pJzSXwQF9hsuWnjvgxY0jFzaO4Q6gniSBM5/UO5bxcO0wOeQ
	+/lRHhvvvuuIS8q3usExyOtH8j/PsQI1p7As5rspKaPEJ1KaUafIuRibw1umEmpql/AUJZAXPS3a1
	9VFS9vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInLW-000000078eL-0DTM;
	Fri, 01 May 2026 12:51:54 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInLT-000000078du-1EB4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:51:52 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8e8c0c2d2bcso267075785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777639910; x=1778244710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDMlaTUNGVqmc1jmP6u4TfGXv+GXsCG3iAN8BRJBeOs=;
        b=VA+e81iQRNWs+jD+lPeFLoqzJW4ZO837NTs0asR/saycVY+rfsGpbMz1ANc4/KYoKs
         dr07V0ldiNSU6xMRh1Fbxj+hj5uZY2tMxB0Aj6j7T/ef6K3MaYyC6lsd4JXMNTg2XnJT
         /CnR0D/cRQfyMg8ye3oE2bPOiisHqp0hey1sA769NP9OoOnlzXJ9dgM4+EkK+JZvUhSZ
         Br7I66eE7mWZk5btVvGu4sasosIQrFJ2HL5zE0fYqOgPdYn7FmABAMKv3Dcigy7zBrx1
         8Xc7kRnv6+3n1+llAbJesgGJDAyeSbAKRfTJRNmAjBMAc6FSY2AK0aEOcYjB3JJNW6KZ
         c/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777639910; x=1778244710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDMlaTUNGVqmc1jmP6u4TfGXv+GXsCG3iAN8BRJBeOs=;
        b=OWvFyLP78eWq3xEJc2utp2N4/AOUlWSeVv648velin8XEK3bQyKDjpRa0wi1//0vX/
         cil5Add+qbqxSRUCoIggvh2TlEV97T0UkYMu8vUA5okgrZpf0gMHdw/FdzTwTBKVTOew
         /QJu0uz6AbJVntrLGBfk9pyOo4pDK8gXO5zL2gYy49+JJtqvN19dmLytgxbBZW6upaOT
         Qp2VHx/O0ESGFzqGzSYOijRsDNXaxB2XghZjfzpNdvlIuSPLNwnqn5gU3iu94eWy5MCs
         LHMtrNZKX+xo0GY1++/mDQrAgFypOudPDKBzbUoftd+58X/4Ni8TqdcqHONikR4gfHw8
         60Nw==
X-Gm-Message-State: AOJu0YzjtctEBREWlPB1o5KniRJrX/iT1DDG0tSyHt8kzgb51qr8x6Vh
	H/j1+TxukOklUc2wVyxMQYJZa41Acw5ySvEoQA5OtiEOG2TG1LcIq59IWEKp/KUVPx0=
X-Gm-Gg: AeBDietD97rMaC8yyhQIEGr0EXX5MtROkHIUnM1h3OqcHzCFUmpZ0WW79Ue9dSNHacK
	35XU+R2jtxy0VljJOQ8KJljzDFETiRsfijNdwxQ7bHqntEvA49owSmyP6wN9UZNHxwV5LRkrgOy
	kkYPv0iLaw+FzDmRVYdBEW1Xbgdd/FsY6o+ZqWRWI34QlamxFiZNvHWrdmFoKGG+v1LS3SWa01f
	pmvDrYEfdNFkJ94dZvbpGZfQA7K86EYslnPPWbgJUngIaXQGmK7MthaHP4t/ZGbuM4SL6gtfOTJ
	Z9u/zNscpAeo71paEsPpfNJyR8O4kE9hA7danoPUH7DoVG6tp9Oef5vCPPjKVRD12YqF9xvTyku
	ShsDc6Tx2hUqImsag7xYyRlvhvuFjcjbtLKQIsEytZecil79Ua84si4oT0GVsZDKcqeBuOl4wW1
	8oEbTb9EPGwzS0M3NGLjFveZwGPJF5pynn20Kc/wYX0uCEHd7r1RUkY974/LWe4HPsftDP5/3IM
	6I+rZOXPHO4X2ix
X-Received: by 2002:a05:620a:25d3:b0:8ed:d906:a8da with SMTP id af79cd13be357-8fa86fa6765mr1113897585a.18.1777639909805;
        Fri, 01 May 2026 05:51:49 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2667d5cesm157094985a.0.2026.05.01.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:51:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wInLQ-00000005BDs-2rAu;
	Fri, 01 May 2026 09:51:48 -0300
Date: Fri, 1 May 2026 09:51:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 13/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <20260501125148.GE6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-14-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-14-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_055151_365649_6C7C337B 
X-CRM114-Status: GOOD (  19.25  )
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

On Fri, May 01, 2026 at 11:19:15AM +0000, Mostafa Saleh wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 61e6ab364086..157acde0436d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4738,12 +4738,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> -#define IIDR_IMPLEMENTER_ARM		0x43b
> -#define IIDR_PRODUCTID_ARM_MMU_600	0x483
> -#define IIDR_PRODUCTID_ARM_MMU_700	0x487
> -#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
> -#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
> -
>  static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
>  {
>  	u32 reg;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 64618299d03a..f904f4d19609 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -84,6 +84,12 @@ struct arm_vsmmu;
>  #define IIDR_REVISION			GENMASK(15, 12)
>  #define IIDR_IMPLEMENTER		GENMASK(11, 0)
>  
> +#define IIDR_IMPLEMENTER_ARM		0x43b
> +#define IIDR_PRODUCTID_ARM_MMU_600	0x483
> +#define IIDR_PRODUCTID_ARM_MMU_700	0x487
> +#define IIDR_PRODUCTID_ARM_MMU_L1	0x48a
> +#define IIDR_PRODUCTID_ARM_MMU_S3	0x498
> +
>  #define ARM_SMMU_AIDR			0x1C

Lets put these hunks in some earlier patch to migrate out the
functions/etc

I think all these pkvm/arm-smmu-v3.c should just be building up the
driver.

> +static bool smmu_nesting_supported(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	unsigned int implementer, productid, variant, revision;
> +	u32 reg;
> +
> +	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
> +	    !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> +		return false;
> +
> +	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
> +	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
> +	productid = FIELD_GET(IIDR_PRODUCTID, reg);
> +	variant = FIELD_GET(IIDR_VARIANT, reg);
> +	revision = FIELD_GET(IIDR_REVISION, reg);
> +
> +	if (implementer != IIDR_IMPLEMENTER_ARM)
> +		return true;
> +
> +	if (productid == IIDR_PRODUCTID_ARM_MMU_600)
> +		return variant >= 2;
> +	else if (productid == IIDR_PRODUCTID_ARM_MMU_700)
> +		return !(variant < 1 || revision < 1);
> +
> +	return true;
> +}

Why not share all this errata stuff with the idr parsing code too?

We already have ARM_SMMU_FEAT_NESTING that has the above calculation.

The two drivers use the same ARM_SMMU_FEAT system, I would expect one
chunk of shared code to compute the FEATs, who cares if pkvm doesn't
use all of them?

Use the same errata logic and so on to get to the feat bitmap.

Jason

