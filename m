Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+JLK8o3lT0td/MYczWJEZnb2L8d00AyuRGacnswf14=; b=SeD10Gylry9zx2y07bF6UMhP1G
	5GBWMM9vcB5HEuAAdP1vbtEycmCwP7mKInV768ZzyCcImlOTC6+yk+5qBZX5VNy8TQ9BJ8S3Pcmmc
	atKO7H3q6D0Ic2Qi8aXlQshULTcrGv7xFVjN4gHmRR2C0UMa9MSf6nHy8q6zMmO8zSrcGl5Kg47b+
	XPr4gmmmWj760JD2wKS9Sj0v8S4NrfCzdHZrxj35Ugh+R58X4m05Spwlj83AcYHjXLx+WFjaLsjxz
	2OOA1UBqnhpc8oPpQOIgOZkIslvke+j70la51XGt4NaHeVVFaynQ4Ow6cROjQi4OXmCLDdCM9xw6K
	i0awyx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaPK-00000005CCL-0t61;
	Wed, 23 Jul 2025 14:25:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZfU-000000054z6-0nAh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:38:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235e389599fso213765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753277879; x=1753882679; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+JLK8o3lT0td/MYczWJEZnb2L8d00AyuRGacnswf14=;
        b=eN8RgMLg9w/t+UwCap/uucsHo/H6V+f2XkGL9gaA8/qynphielvmVA/10jB2EJFYoF
         WarBQ3gSR1iYFRAULpbxmJU0+zp0JIjABRvAyXEkmfZJNB8Jnaa5vLmQmxtUrT/LQnuc
         nU88wm38URa9ARNOeJ/QIXU8vDKXeHsW+yB6Pc01qi8IGIEw20t1ckudZy427NjlPNnp
         srLQ6kvRYEd22ZKCllHVbBd19mdfvAr0P9tzCHX+32I7qdiqOGHwz5yycf4cmcVgp05C
         NeBJPOWU58wK0+l4JDMqTa2Apo+mkee0SRsM6q9GlegritPsa04uY09t4CQPQvNXdVfq
         rfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277879; x=1753882679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+JLK8o3lT0td/MYczWJEZnb2L8d00AyuRGacnswf14=;
        b=OZVQ9Feq2Rcl/fSYAZxYScS6p2IEAXKWlB+8s/+7lrqCcUtvc3d1yoE3a5dMsU6ku2
         ZC+uu5U30OtWVAcMsM+y4MuMH+uUm1jtCle0qWCyw7q2+peVKNKyafY2rruJU4Ho1vmJ
         pQEpKw9ICOqSHkuQlVY3lG5pXsN9Cw4pMHQWDdNfV+//X8FVnaXwBKVcGnCmVVmPBv7Y
         g7mBg2v4zNVqoQ4CtrjIehGSmoS6vzV8WN90B2l78Q6mNQ0bP5PP85WJPaDJuAwimgTj
         UB+kjzoZYEw1rM2eO5pFp9aj0rMdSRcsHzcjYTMsbzTOZUZuOD1iqMT6ET2+EHd9F+8K
         aO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0BYemlr3ZhSCTjC/+3z91/+HTYjUCQcc0MTYjv5d0ZtY13PYm1mkloJoq1yIidKV34qbRRDhua8yvVHuwk8qn@lists.infradead.org
X-Gm-Message-State: AOJu0YzIllGjSB+bl1awwcSbDSjY/D2BR8p4Ep50ZdLt5Yl8N+FRHgOF
	8sQ/C8qnPltdQ97B4f5Q5n1tKRW8jfQahcTLUAh7wZ6AAW0rMOj+md5ve298xUntSw==
X-Gm-Gg: ASbGncuUNrIePz97BZmoCTAs2xIIPAaFgEGNdFdxqml4ROCM4LWr51olr74mOQnhf4Y
	KzHZwepjeh5dBEWKdrN0ZYy7OBg1N84jiJYzWxtVoRbgMkSRNSoDOv23ZQ4WRves0e1xKUVw80V
	PkSpjJtfK9c1g+NVR6ho2Tmaosjn4kdc1w8Wmk6lZFU5M3bYz2t6rWEGh4oP6ZO5R42nlQyuf/S
	ol2Ar0G6mcpT5JWJbvZK4hu1qbNdZ435CGlZGhPsUPlQs9DELyRoKjYyxbSP4A4GLnEr0CvN85U
	CzO7Rdt9aNUsw3QeJ/VyIORe74Npb4e26YGNuDphQrZDe2FpDPMbs4RFMrH0yXU+NvV62rqFWT9
	tMNxx4xdi0zRWRojsLURg4ndclXFGtiAI4O/5CZEdNl+N+MGHGt+uFVZxhtyeU/yh9Ys=
X-Google-Smtp-Source: AGHT+IHNDySI/nH+OMkMv0ChQEdtb4UFgDV0ZT5tuGjSaRubSm3kOT/oocHqF0dfxqVXTEfR3wYujw==
X-Received: by 2002:a17:903:15c3:b0:234:13ad:7f9f with SMTP id d9443c01a7336-23f978e398cmr3323895ad.22.1753277878789;
        Wed, 23 Jul 2025 06:37:58 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23f75d13bdfsm77086475ad.51.2025.07.23.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:37:58 -0700 (PDT)
Date: Wed, 23 Jul 2025 13:37:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIDlsUvF2Xbdelvx@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721200444.1740461-3-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_063800_234525_0DF76E81 
X-CRM114-Status: GOOD (  26.80  )
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

On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> It's more flexible to have a get_viommu_size op. Replace static vsmmu_size
> and vsmmu_type with that.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    |  8 ++------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |  4 ++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  3 +--
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c     | 14 ++++++++++++--
>  4 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index c034d6c5468f..8cd8929bbfdf 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -423,10 +423,9 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
>  	if (viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
>  		return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
>  
> -	if (!smmu->impl_ops || !smmu->impl_ops->vsmmu_size ||
> -	    viommu_type != smmu->impl_ops->vsmmu_type)
> +	if (!smmu->impl_ops || !smmu->impl_ops->get_viommu_size)
>  		return 0;
> -	return smmu->impl_ops->vsmmu_size;
> +	return smmu->impl_ops->get_viommu_size(viommu_type);
>  }
>  
>  int arm_vsmmu_init(struct iommufd_viommu *viommu,
> @@ -451,9 +450,6 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
>  		return 0;
>  	}
>  
> -	/* Unsupported type was rejected in arm_smmu_get_viommu_size() */
> -	if (WARN_ON(viommu->type != smmu->impl_ops->vsmmu_type))
> -		return -EOPNOTSUPP;
>  	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
>  }
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9f4ad3705801..f56113107c8a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4716,8 +4716,8 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  
>  	ops = new_smmu->impl_ops;
>  	if (ops) {
> -		/* vsmmu_size and vsmmu_init ops must be paired */
> -		if (WARN_ON(!ops->vsmmu_size != !ops->vsmmu_init)) {
> +		/* get_viommu_size and vsmmu_init ops must be paired */
> +		if (WARN_ON(!ops->get_viommu_size != !ops->vsmmu_init)) {
>  			ret = -EINVAL;
>  			goto err_remove;
>  		}
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 3fa02c51df9f..e332f5ba2f8a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -728,8 +728,7 @@ struct arm_smmu_impl_ops {
>  	 */
>  	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length,
>  			 enum iommu_hw_info_type *type);
> -	const size_t vsmmu_size;
> -	const enum iommu_viommu_type vsmmu_type;
> +	size_t (*get_viommu_size)(enum iommu_viommu_type viommu_type);
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
>  			  const struct iommu_user_data *user_data);
>  };
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 4c86eacd36b1..46005ed52bc2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -832,6 +832,13 @@ static void *tegra241_cmdqv_hw_info(struct arm_smmu_device *smmu, u32 *length,
>  	return info;
>  }
>  
> +static size_t tegra241_cmdqv_get_vintf_size(enum iommu_viommu_type viommu_type)
> +{
> +	if (viommu_type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV)
> +		return 0;
> +	return VIOMMU_STRUCT_SIZE(struct tegra241_vintf, vsmmu.core);
> +}
> +
>  static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>  	/* For in-kernel use */
>  	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
> @@ -839,8 +846,7 @@ static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
>  	.device_remove = tegra241_cmdqv_remove,
>  	/* For user-space use */
>  	.hw_info = tegra241_cmdqv_hw_info,
> -	.vsmmu_size = VIOMMU_STRUCT_SIZE(struct tegra241_vintf, vsmmu.core),
> -	.vsmmu_type = IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
> +	.get_viommu_size = tegra241_cmdqv_get_vintf_size,
>  	.vsmmu_init = tegra241_cmdqv_init_vintf_user,
>  };
>  
> @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
>  	phys_addr_t page0_base;
>  	int ret;
>  
> +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> +		return -EOPNOTSUPP;
> +

Nit: I don't think we'd expect a call to this if the vintf_size returned
0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:


        viommu_size = ops->get_viommu_size(idev->dev, cmd->type);
	        if (!viommu_size) {
			rc = -EOPNOTSUPP;
			goto out_put_idev;
		}

And call ops->viommu_init only when the above isn't met. Thus,
if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
I'd rather have the core code handle such things (since the driver is
simply implementing the ops) and BUG_ON() something that's terribly
wrong..

I can't see any ops->viommu_init being called elsewhere atm, let me
know if there's a different path that I missed..

Apart from the above nit,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

>  	if (!user_data)
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
> 

