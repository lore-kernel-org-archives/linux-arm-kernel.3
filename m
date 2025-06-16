Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5E0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymL8Mqhb7MuXq62tfegfyenrSBgHaY6RdOOoY9Vdrxo=; b=mf32X3l+izrG0MvgoS1kXer34I
	vHjNd7jxK3nap2F2ff9VJ5b1dnuDmTjfgVtmz3NIdjLoSh6cmSoisjnDHgQlfU3i7LSoKWjJQAHVX
	hwpNrOqJld5m08/ca3CAIU/0GdQ4Aatwvn7fF4o/4mM1vGVm8g1lHxK5MUur1B4J46YUT0zz3LTfd
	TvA3FRYwyZKspKABcaoS7BVedsLFIBq8q+QoOZIOyFLsroBzOxT8WEkQLx1B+6RB6nNxYlWydLzme
	lSfq3x6lVWxSFmgG7j5uRDSJ4LYDCpjK15pzjCduIT3paIxhCrqxW1NMB3ZMzOQTHNzCNdj+Uq3Dg
	KYS66EGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIbz-00000005jzy-14A6;
	Mon, 16 Jun 2025 22:47:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIY8-00000005ixc-18jL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:43:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2357c61cda7so26635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750113811; x=1750718611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymL8Mqhb7MuXq62tfegfyenrSBgHaY6RdOOoY9Vdrxo=;
        b=yfc62pciguEcBwLsam2iyGpaZXNOGAz4zBp3m0Aq4FznHV4b0SmDuY9QiuH9GoMDUV
         CdkiTCFmydtvoX2hpMpV1cM7EeaRmT3bLlfD6P7wL5VrbmlBbuk5k+sxmpcq8t5Lr5Qn
         3b9fYhJCbdDD7e/RTDXddzcaUXvSx+qJlSzdJIHTwJVuOUb/4rQ0PVOvis1aJHr36Kma
         /O9Lndo2MQgl6tFuuxD4/n+KcEWvhHsRH75j32QL8X1AfIX9VlLlkweiaQ1XOZN5rvs3
         0jyiVEsS/idgvBog9kcVfZ+Zhbqqq19vttVU1RbjIn0B5+b8HbTQW6MZw6VmpLeBRZBT
         meYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113811; x=1750718611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymL8Mqhb7MuXq62tfegfyenrSBgHaY6RdOOoY9Vdrxo=;
        b=G3OzOXwfOKlCurgeTybw+wZkYTjpYWn66Z3UVKfZnfKOm2Ay9i6PV/019mi8aG07DB
         jMTX7Ispyq0VpCEwjSmSQsy/Ztdda4DJrs1d9RrMmQ10EUykrndHYQ85afzHuJquoHM/
         ACty2CwdYhrkqyIVlUAMStl+PeI5Yxm/ecJbdWJek/kUzwHZdhjLHIMn9L52Ful2iYG8
         xt/BINw/5DUYzeSIwZfSDfdKS/YdktQNh0An3H/tDYiFFjLZzOC/V7bhXSvj1qorFU6x
         Af5qdACEKRy6r1yYF6wnYArii9TRA/gy4dJ+vluXjTYjp0U1DmPMSf2RDqqdCe3xW05w
         C8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyt7kpYmvkyI78DUX97GFhBRVZn42aWVdnoAixShRz41LIIAlGhTKX1Ny78zTox7V7VKMpGr0D37sCdx2CuypS@lists.infradead.org
X-Gm-Message-State: AOJu0YyekZzQ9ai1wBOTll6Lu+XlJ4FsjSVMe3wtDK7wCrsJjDyMrfsH
	Lqdci1f90MAU3O93TY4Y+q/Hp3kNRjhT8oIpJLfIg3uxreCxlUJsJzSD8dmqNMD/Tg==
X-Gm-Gg: ASbGncsbRZxQkiq4+v+jBOHF32Z/mdmBhVHWRXzv0hkSvLTlcz46RU2GjALRt74Cs6d
	jkoOW7YIXEzsaVsX+/Rzm08WjjKfrMIoYGC1GmBPpl8RUhz26t/IU7XnynzOC7+p+wNb0WpE3R6
	m/khr+WxNLqdwMhH0HBrS6JttnGn19MgrlWDGYwzIjLUooGI8bUNkK1u+R3wrz5QJmHodh8Jg3V
	2Rctpjg8Rp+isnrba/PegvNhhSJZ58xoNf/txWKevIiu2vPtGkjaRL9VE00HaFCX/kHSn0n0kgh
	bzfTbmZZjSU4JdRZz9yKHwAnWInklkcvwQtc7vJ4JBUYNNI04JCE+P/HYTmORmVsd77vio6aP+G
	KbxNddpt5lrH0688ZHt+W
X-Google-Smtp-Source: AGHT+IEkufL7OuATbKkyQmUkhfoeOlW/ZVbGbDv9YqSYwYKyZQFbECA2k6ko4G5Q+boO/eTGgvXo1g==
X-Received: by 2002:a17:902:d2c6:b0:234:a469:62ef with SMTP id d9443c01a7336-2366eda3363mr5460125ad.3.1750113811264;
        Mon, 16 Jun 2025 15:43:31 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900829f7sm7357692b3a.87.2025.06.16.15.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:43:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:43:22 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 10/14] iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with
 arm_vsmmu_init
Message-ID: <aFCeCvKkm1MvT3xP@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_154332_329691_38FDAFF9 
X-CRM114-Status: GOOD (  32.41  )
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

On Fri, Jun 13, 2025 at 11:35:22PM -0700, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced.
> 
> Sanitize the inputs and report the size of struct arm_vsmmu on success, in
> arm_smmu_get_viommu_size().
> 
> Place the type sanity at the last, becase there will be soon an impl level
> get_viommu_size op, which will require the same sanity tests prior. It can
> simply insert a piece of code in front of the IOMMU_VIOMMU_TYPE_ARM_SMMUV3
> sanity.
> 

That's what I was wondering, so we plan to replace the impl->vsmmu_alloc
op as well?

> The core will ensure the viommu_type is set to the core vIOMMU object, and
> pass in the same dev pointer, so arm_vsmmu_init() won't need to repeat the
> same sanity tests but to simply init the arm_vsmmu struct.
> 
> Remove the arm_vsmmu_alloc, completing the replacement.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 11 +++--
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 46 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +-
>  3 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ea41d790463e..bb39af84e6b0 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1034,18 +1034,19 @@ struct arm_vsmmu {
>  
>  #if IS_ENABLED(CONFIG_ARM_SMMU_V3_IOMMUFD)
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type);
> -struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> -				       struct iommu_domain *parent,
> -				       struct iommufd_ctx *ictx,
> -				       unsigned int viommu_type);
> +size_t arm_smmu_get_viommu_size(struct device *dev,
> +				enum iommu_viommu_type viommu_type);
> +int arm_vsmmu_init(struct iommufd_viommu *viommu,
> +		   struct iommu_domain *parent_domain);
>  int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct arm_smmu_nested_domain *nested_domain);
>  void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
>  void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master);
>  int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt);
>  #else
> +#define arm_smmu_get_viommu_size NULL
>  #define arm_smmu_hw_info NULL
> -#define arm_vsmmu_alloc NULL
> +#define arm_vsmmu_init NULL
>  
>  static inline int
>  arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index e4fd8d522af8..9f59c95a254c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -382,25 +382,14 @@ static const struct iommufd_viommu_ops arm_vsmmu_ops = {
>  	.cache_invalidate = arm_vsmmu_cache_invalidate,
>  };
>  
> -struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
> -				       struct iommu_domain *parent,
> -				       struct iommufd_ctx *ictx,
> -				       unsigned int viommu_type)
> +size_t arm_smmu_get_viommu_size(struct device *dev,
> +				enum iommu_viommu_type viommu_type)
>  {
> -	struct arm_smmu_device *smmu =
> -		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> -	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
> -	struct arm_vsmmu *vsmmu;
> -
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	struct arm_smmu_device *smmu = master->smmu;
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
> -		return ERR_PTR(-EOPNOTSUPP);
> -
> -	if (s2_parent->smmu != master->smmu)
> -		return ERR_PTR(-EINVAL);
> +		return 0;
>  
>  	/*
>  	 * FORCE_SYNC is not set with FEAT_NESTING. Some study of the exact HW
> @@ -408,7 +397,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	 * any change to remove this.
>  	 */
>  	if (WARN_ON(smmu->options & ARM_SMMU_OPT_CMDQ_FORCE_SYNC))
> -		return ERR_PTR(-EOPNOTSUPP);
> +		return 0;
>  
>  	/*
>  	 * Must support some way to prevent the VM from bypassing the cache
> @@ -420,19 +409,32 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	 */
>  	if (!arm_smmu_master_canwbs(master) &&
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> -		return ERR_PTR(-EOPNOTSUPP);
> +		return 0;
>  
> -	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> -				     &arm_vsmmu_ops);
> -	if (IS_ERR(vsmmu))
> -		return ERR_CAST(vsmmu);
> +	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +		return 0;
> +
> +	return VIOMMU_STRUCT_SIZE(struct arm_vsmmu, core);
> +}
> +
> +int arm_vsmmu_init(struct iommufd_viommu *viommu,
> +		   struct iommu_domain *parent_domain)
> +{
> +	struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
> +	struct arm_smmu_device *smmu =
> +		container_of(viommu->iommu_dev, struct arm_smmu_device, iommu);
> +	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent_domain);
> +
> +	if (s2_parent->smmu != smmu)
> +		return -EINVAL;
>  
>  	vsmmu->smmu = smmu;
>  	vsmmu->s2_parent = s2_parent;
>  	/* FIXME Move VMID allocation from the S2 domain allocation to here */
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
> -	return &vsmmu->core;
> +	viommu->ops = &arm_vsmmu_ops;
> +	return 0;
>  }

Seems much better now that the driver doesn't need to callback to the
core for allocating viommu. One quick question though I see we've 
removed the following too:

        if (master->smmu->impl_ops &&master->smmu->impl_ops->vsmmu_alloc)
	                vsmmu = master->smmu->impl_ops->vsmmu_alloc(
			                        master->smmu, s2_parent,
						ictx, viommu_type,
						user_data);

Not sure why don't I see that in the diffs.. do we plan to split this
into an impl-specific size and init too?

>  
>  int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 10cc6dc26b7b..181d07bc1a9d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3688,7 +3688,8 @@ static struct iommu_ops arm_smmu_ops = {
>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>  	.page_response		= arm_smmu_page_response,
>  	.def_domain_type	= arm_smmu_def_domain_type,
> -	.viommu_alloc		= arm_vsmmu_alloc,
> +	.get_viommu_size	= arm_smmu_get_viommu_size,
> +	.viommu_init		= arm_vsmmu_init,
>  	.user_pasid_table	= 1,
>  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>  	.owner			= THIS_MODULE,
> -- 
> 2.43.0
> 

With that, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

