Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E064EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=; b=HjFzAsOx64Um4CYTfLgUvxCBm+
	SCAU0zWsQe296w3krhcHy2MxTl9Vf+nmByDyKGHNeOUQv3A0FNn1FeChPV4jSTjw/BilN6COIxqGY
	IXgpqTW985xFUOI51PN/p49wUtE7XW8SaRPbzVx6YLoq4yDPKceWXXYMmE8Yobu0pGSvKUDajrIAf
	yOfuKVOG/2pto97HcR2iCvElgMVtlapv861ZOCf3MdEcnPZ4hA5YKO0mPnFeLQHoPCGCMZZz6REvz
	TY7UO6SWnaeNbmDj5KReGjcF7J0b4GAt5oEZlytwV6EC4j1IadRcA1KNHgTfJN85r58QV96hmx5Ri
	M6xvEkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9shQ-0000000At0f-2WOk;
	Tue, 29 Apr 2025 21:41:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9scn-0000000AsNy-1KRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:36:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2263428c8baso80845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962580; x=1746567380; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=AldOlRmzdMsxfxSs7dhcC2Mp/4RkE66BMDyu9GUyS1Kq7RNXKjZHuHmw/2aNBSvYq+
         y2jg89Z+F8EEFpisDmqYiIwKjFJTJfLjfnIdHEv2XyA157gZYPNDPkLMEJdhTiv/+bav
         O/2XITrpNg1JM8dnCbzwZLhdWBdhKefR9W0Mbc/9SKgZbaUL2BK/NIVKqxSggUSb8IVM
         DvD3IZk1tokz9CyYqf2Oq6tw8TWyXSZxo4takt3xmHzpOI+e7m3lnojiO2ECYURaT0jp
         IM5R/jPwG1s0UQJxFyCIxvIFxs6A7PICk3yrRlsBhs37VbSCgzG9OHBUo5jQuEoIAdcY
         GnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962580; x=1746567380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFHhD4L18F4DbheB1ANr+oLMK0ky8CpJtw12v2WCTVo=;
        b=l2rEPz6Xbo0gcJaXDtReJ006lMxTwprLXtTqS0lyxJP0kd99bIV+rMSHyjOcPvh/9b
         azaCV+omNtsHdIn78u+EOqy2yp4deakfBTvd47qpllFvZ4giL5mCbBizZIrSm7Cvo6MZ
         /3ci5RkmRYz5xcTReeFGA+Qi9Ny5dqWf1j6s6gIwB46DkzrIhJ03Xo9uhqmUR1d0aIzc
         ssaCvwiO1Sexts22L8Ue8HcSSx1l8b1qZ0k/yQlwkqGxpbBeuszVasoFt2CFO1aonCa7
         /O5JsqrJgnNin1POuTf2t13RxQMVyIbfjhr0RKYz5zBZVtp4v+4uKCN07z2ljGHM7+wE
         BrWg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+8PPGDJkzqPU1+ry+eOrNMfN8pCcq7zVJ+Y7yPqpXY5cc/HkkHtajN4TOOjqxjKoQqisSwOaOZVYp54OHLbo@lists.infradead.org
X-Gm-Message-State: AOJu0YxssIk+QmIt+5I+hM0xx8F/O+2aP4PXgEV4CEp0mU3LdJ0Qog2A
	rFuk2tOwoy6EYlbLPglyJBvEaveiAn5HQ2GbasqdODr0Sk86YQOtfIkCbSDTLg==
X-Gm-Gg: ASbGncumvKn5aqEwN7RyNZsfibkSKVIB6r04boDA8fFEdq0eOUwgqi6MstANv/Fyvc0
	veNIFoHkdKoaXvLbUZ0DMLWKLcvj79JcfLYgCto3ddYciUaAd8ZifB9bmeisx0bDzzZ6o7njP7R
	NiO2Ds0Rn2xG600jIj4u4/f8BZb0sWwh+eODrIV1BhbrkdkNjP8gIzuXj0913V8UI/fykkFEY5W
	ur4VH3Y5T2qc3Hn7c36dUR0ovgFtHl6Fee9wFJOCsiZ2CPfG/K9+jIsZQdJxGJ2UnVMd3nvJZvq
	shf2HNBJPVZseS0O8aCBpNIKoNnmQKyXkidPSA8xOYqLKDU1BmLbnfMw3s6wNt1R/tv1IRk9
X-Google-Smtp-Source: AGHT+IHMqNgjircjCmAkmKl5VbBskPIbU47nTYxADS2hK6tD9L6Ge4YAR4USLtbPpDWqfiuVVAQ0lQ==
X-Received: by 2002:a17:903:144f:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22df3dda537mr1044155ad.0.1745962580224;
        Tue, 29 Apr 2025 14:36:20 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76d34sm108297185ad.39.2025.04.29.14.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:36:19 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:36:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 16/22] iommu/arm-smmu-v3-iommufd: Add vsmmu_alloc impl
 op
Message-ID: <aBFGSRGcIsCDU1Zj@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73b1fc34b07f2ac42d542dd996c7119ae5f8939c.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_143621_347436_33DAB3D9 
X-CRM114-Status: GOOD (  21.36  )
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

On Fri, Apr 25, 2025 at 10:58:11PM -0700, Nicolin Chen wrote:
> An impl driver might support its own vIOMMU object, as tegra241-cmdqv will
> add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.
> 
> Add a vsmmu_alloc op to give impl a try, upon failure fallback to standard
> vsmmu allocation for IOMMU_VIOMMU_TYPE_ARM_SMMUV3.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewd-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  6 ++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 17 +++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 6b8f0d20dac3..a5835af72417 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -16,6 +16,7 @@
>  #include <linux/sizes.h>
>  
>  struct arm_smmu_device;
> +struct arm_smmu_domain;
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -720,6 +721,11 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	struct arm_vsmmu *(*vsmmu_alloc)(
> +		struct arm_smmu_device *smmu,
> +		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
> +		unsigned int viommu_type,
> +		const struct iommu_user_data *user_data);
>  };
>  
>  /* An SMMUv3 instance */
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 66855cae775e..a8a78131702d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -392,10 +392,7 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  		iommu_get_iommu_dev(dev, struct arm_smmu_device, iommu);
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  	struct arm_smmu_domain *s2_parent = to_smmu_domain(parent);
> -	struct arm_vsmmu *vsmmu;
> -
> -	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	struct arm_vsmmu *vsmmu = ERR_PTR(-EOPNOTSUPP);
>  
>  	if (!(smmu->features & ARM_SMMU_FEAT_NESTING))
>  		return ERR_PTR(-EOPNOTSUPP);
> @@ -423,8 +420,16 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> -	vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> -				     &arm_vsmmu_ops);
> +	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> +		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> +			master->smmu, s2_parent, ictx, viommu_type, user_data);
> +	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> +		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		/* Fallback to standard SMMUv3 type if viommu_type matches */
> +		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> +					     &arm_vsmmu_ops);
> +	}
>  	if (IS_ERR(vsmmu))
>  		return ERR_CAST(vsmmu);
>  
> -- 
> 2.43.0
> 

