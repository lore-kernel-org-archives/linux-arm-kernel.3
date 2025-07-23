Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hb0/7yMT9K2SX5uLjkUISpIiyNMkZYnJ5i8nHLSmhqw=; b=hFK+DlfNF1YxX4a/WGz/BqyWFT
	/kq3RgeyNQYU4rA5kGb96wSmjtJdNFdkZvgOJY+PJPmZyQtwfXKqgKnQOUHQwK8+IPtD1wN2VaVCO
	Jk24aRl5OHi/e1/JETPnh4q/YD4jo3kvKsa5cZdYVAXwKduDSA2Gn3ktnPRAjNU6Cng4toklvs8j0
	tkDOTH14vJ0l3ev65+GDaP81JkVl15z8bR2gV81IR6krw9fE4l66/xCq5m8CGDoefh7327SeLGb+m
	LaBwimrDJ1btTPZISPkH8WdiJSsgi5cLTdeDA3pRNV3WJdTo37mmXcOcAoEO9udPdsk5yS7Bf4V/o
	NLSiwnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaKM-00000005BAj-2VeP;
	Wed, 23 Jul 2025 14:20:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZNl-0000000528o-0ful
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 13:19:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-237f18108d2so177095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753276779; x=1753881579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb0/7yMT9K2SX5uLjkUISpIiyNMkZYnJ5i8nHLSmhqw=;
        b=EUNktv9FM649uLdlyyBGNIR+V8Ft9ZvALobCY43vIoPV6NJRS5GG7p1wRY5kaAsrjZ
         r8l+eMLQchOi1yrpktO4yU08AWohXgtH27VyGgR4noCSWh4tHmgx2DzAf/L1LZLJ3su3
         21uayNWZserjOvHVDZXSAc50/TMLG70hjNwbaAVj+VCwg+maaxUGwxVKLF1qZHf7+5Pk
         vJ3+pCrZw2Ztx2WIG2hyqHsR0vdxKju31chOzjxUa3ezZ4Bjsz7LS1NS/CfV0X5fvKFz
         UGXEUdGDy8kYJCI456Zoo3rX3b80vPdWo+4REi02CqsIXjC95JpsQLOD+k/cjuIm5B5a
         UXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276779; x=1753881579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb0/7yMT9K2SX5uLjkUISpIiyNMkZYnJ5i8nHLSmhqw=;
        b=cGM+Ovp4j/O/1Heo+ckzekGUvI8f0uaMwR3EMn26jrcEGk42diTucdvskO9pIECnER
         qvrUYTcg34OP6OF6LqM45n88tAGyAJfvkb7ZOeFRBsI8/7xb8jbv2wDsPXxlTFwQFgqm
         FuSQ4Ek8AVPFa12MfVi6G224TGQEjnG6A7TNWZ9AEjkAeBI8CQFnAQF7eKrXJvaVDBcA
         y1phbekw2sKuR/Jjmlr1rP9HLxxS4Dy2+ogbDRkQvdlTCyO0h20dm8Itu5jmyqF+lOlY
         QXunLTUMDMzhm34uuFfrLYWBEABElfFqGzkxYOujUpwHwN7MdhBB35qvOQRG40Fg2z8P
         Icog==
X-Forwarded-Encrypted: i=1; AJvYcCXSSS1aheYqK9bysEnG/NJnk3uOmQiU+qyv1qhN9J/iu7QzPDHaGn3A3E4gOgR8RdemDvwPoRDxzB5hkPPXh42y@lists.infradead.org
X-Gm-Message-State: AOJu0YwrV5To2NkxWq86to1E8sf7w4ovu/6c9FzL17aC2L4yQsyHCX/w
	qda8kE9rCAehcsuIj5HjPYoL6W1wU0iTQH+GLa78zy3KCcQDVeTpbGcnzr4MlAoNPA==
X-Gm-Gg: ASbGncsD0RbI2aD1pPEDnrDTOkxyVl7nvSVgQ8Q9I5NJ/3t9HqOE9MOR99tQUX8Icug
	5kJeqXrsHybYm+J/Af+MNCuJPZGOR9KLcW5gDK+tH3cvWI/uTdmN0CKhFRSSxXmVGqXomu7RiKO
	jGt6LPorV807RJu10tKaG5Z01DvCz+GKlxlSLmMTdxO64Cb/tyu4Mwx6jByIMgG2pq9obvaRyd2
	Kdvjc7jMY1ejOJ3HsZzra77g0Xdn297x4+knUP/CFLjlBOKf+Q5eDFqJKEdBoq0mqiuM6tgF5YS
	/g0kFWoPAbKmrNb5BWla/D90LskZvadLxZc4VvZ9RFrpJAg4s/WfEi1oRYxovJFbwCb3aGGGa8L
	dgIhI5XbADvTIGRJZf/b4c/4GWI9BJ7LSW2kbvZbCOKB9rs5yRrnjwA4+SGmngf5kLWE=
X-Google-Smtp-Source: AGHT+IHbupigD7UyWy96X++uPcWs3IP3RJjiuOFwsDzZsLXWJ+ydnHjuzs1Cy05YPmOdWDc6ThTsAg==
X-Received: by 2002:a17:902:d4cf:b0:23d:d290:70c with SMTP id d9443c01a7336-23f9774ca0amr3106875ad.6.1753276779019;
        Wed, 23 Jul 2025 06:19:39 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm96942565ad.23.2025.07.23.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:19:37 -0700 (PDT)
Date: Wed, 23 Jul 2025 13:19:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if
 IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Message-ID: <aIDhY3JTaT3JC9T4@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-2-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721200444.1740461-2-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_061941_203200_36F4B0D1 
X-CRM114-Status: GOOD (  24.88  )
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

On Mon, Jul 21, 2025 at 01:04:43PM -0700, Nicolin Chen wrote:
> When viommu type is IOMMU_VIOMMU_TYPE_ARM_SMMUV3, always return or init the
> standard struct arm_vsmmu, instead of going through impl_ops that must have
> its own viommu type than the standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Given that arm_vsmmu_init() is called after arm_smmu_get_viommu_size(), any
> unsupported viommu->type must be a corruption. And it must be a driver bug
> that its vsmmu_size and vsmmu_init ops aren't paired. Warn these two cases.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 24 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 14 +++++++++++
>  2 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index d9bea8f1f636..c034d6c5468f 100644
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
> @@ -447,12 +446,15 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
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
> +	/* Unsupported type was rejected in arm_smmu_get_viommu_size() */
> +	if (WARN_ON(viommu->type != smmu->impl_ops->vsmmu_type))
> +		return -EOPNOTSUPP;
> +	return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
>  }
>  
>  int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 181d07bc1a9d..9f4ad3705801 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4703,6 +4703,7 @@ static void arm_smmu_impl_remove(void *data)
>  static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  {
>  	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
> +	const struct arm_smmu_impl_ops *ops;
>  	int ret;
>  
>  	if (smmu->impl_dev && (smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV))
> @@ -4713,11 +4714,24 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
>  	if (IS_ERR(new_smmu))
>  		return new_smmu;
>  
> +	ops = new_smmu->impl_ops;
> +	if (ops) {
> +		/* vsmmu_size and vsmmu_init ops must be paired */
> +		if (WARN_ON(!ops->vsmmu_size != !ops->vsmmu_init)) {
> +			ret = -EINVAL;
> +			goto err_remove;
> +		}
> +	}
> +
>  	ret = devm_add_action_or_reset(new_smmu->dev, arm_smmu_impl_remove,
>  				       new_smmu);
>  	if (ret)
>  		return ERR_PTR(ret);
>  	return new_smmu;
> +
> +err_remove:
> +	arm_smmu_impl_remove(new_smmu);
> +	return ERR_PTR(ret);
>  }
>  
>  static int arm_smmu_device_probe(struct platform_device *pdev)
> -- 
> 2.43.0
> 
> 

