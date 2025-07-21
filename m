Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB86C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbuDmtARaahF+x2i2F6WIhbiZhdhdVHlj+euc6z86R0=; b=lkeopKh8bmR3zPnm0paUKsUsIA
	/zUczQyYy3t1cOy7YTyN4CF5ztiTCu6EXoQ8FYSetz2HORxKPgT6uwmGwL9WrLQUJUe0t9jV/iL+L
	TmpjX86Uw6g33/0rMzI7n2ZigqNax6e9/8jFSeI/xZ6nIUAcaVczKzXQPy8dkqeg3e6uOQwPyyhIJ
	2nRpemAd/N6mnIgsYeVmmoAg+sw+t4OYshv73p4JPcvm49VjsQfssMunVj5NvCUWYPnSlj5PJT98P
	3n+ogkosFJLOlFeL4kNx5A7NhLKJoe1CpL6KiCm9GkLBas4bN2GEykqu7pRzZpdqQgWgKyS3Hr9uf
	h/YFGA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udroK-0000000HaXb-3r10;
	Mon, 21 Jul 2025 14:48:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqS8-0000000HNNv-1xPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B72D5C4C84;
	Mon, 21 Jul 2025 13:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBC6C4CEED;
	Mon, 21 Jul 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753104071;
	bh=+Rs7u8kTc1dBhO1Z31VFKO/SHgaW/BFajAQvzqyjiYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqQj/Jki5T+/WgNKZRIa4TjprbZLIziLodKspyeiIB3vvvz4xTHhcFphB/Evp1c6/
	 UQK6T5FrOvRqR1RUAlsYkk4TfVbpyrlCMvBLZVud5w4i31n0snbxU9nJJsAmvzhDtU
	 5FHKvNPQX6Kt47DzhLdPKoTPL1Dxxg0ftR9G8FofdOWGtSejYaz7/3WWUN5zemfxlp
	 xDwgtBeo0J1sQ1k7JnZcIWA+GXEAMbt5ddmLnWw4z8t+XrCTc8CSdjIXIyiNrLNB+n
	 tsGKYbcZnUtQYKXl6ThksZR/UlpaDbsYSTSGShp3J45wsooZuTL8MQ0mvW67wVc4X7
	 0LTfRhUvJ+YBA==
Date: Mon, 21 Jul 2025 14:21:06 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if
 IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Message-ID: <aH4-wuIjtjyo3aOo@willie-the-truck>
References: <20250718234822.1734190-1-nicolinc@nvidia.com>
 <20250718234822.1734190-2-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718234822.1734190-2-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_062112_580966_AD2884A5 
X-CRM114-Status: GOOD (  21.12  )
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

On Fri, Jul 18, 2025 at 04:48:21PM -0700, Nicolin Chen wrote:
> When viommu type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, always return or init the
> standard struct arm_vsmmu, instead of going through impl_ops that must have
> its own viommu type than the standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Given that arm_vsmmu_init() is called after arm_smmu_get_viommu_size(), any
> unsupported viommu->type must be a corruption. And missing a pairing impl's
> vsmmu_init should be a driver bug too. Warn these two cases.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 30 ++++++++++++-------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index d9bea8f1f636..0b2acb80f41b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -420,14 +420,13 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
>  		return 0;
>  
> -	if (smmu->impl_ops && smmu->impl_ops->vsmmu_size &&
> -	    viommu_type == smmu->impl_ops->vsmmu_type)
> -		return smmu->impl_ops->vsmmu_size;
> +	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
>  
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +	if (!smmu->impl_ops || !smmu->impl_ops->vsmmu_size ||
> +	    viommu_type != smmu->impl_ops->vsmmu_type)
>  		return 0;
> -
> -	return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
> +	return smmu->impl_ops->vsmmu_size;
>  }
>  
>  int arm_vsmmu_init(struct iommufd_viommu *viommu,
> @@ -447,12 +446,21 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
>  	/* FIXME Move VMID allocation from the S2 domain allocation to here */
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
> -	if (smmu->impl_ops && smmu->impl_ops->vsmmu_init &&
> -	    viommu->type == smmu->impl_ops->vsmmu_type)
> -		return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
> +	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> +		viommu->ops = &arm_vsmmu_ops;
> +		return 0;
> +	}
>  
> -	viommu->ops = &arm_vsmmu_ops;
> -	return 0;
> +	/*
> +	 * If a non standard type was supported in arm_smmu_get_viommu_size() by
> +	 * an implementation, a pairing vsmmu_init op must exist.
> +	 */
> +	if (WARN_ON_ONCE(!smmu->impl_ops || !smmu->impl_ops->vsmmu_init))
> +		return -EOPNOTSUPP;

It might be cleaner to check the impl_ops in arm_smmu_impl_probe() where
we're in a slightly better situation for failing gracefully and
deterministically.

Otherwise, looks good. Thanks!

Will

