Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71952C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cKiypGlQlNh3QGjj5r76b5/2a735Mu54ttXf9R8rE4=; b=o1xMBK75LHRyb/6aAoKYm5Gwcr
	gvKp7S+dzNVfcfrwo4xv/ErZOuI0NlSXAofCedmWeHe+P/75kXBtqKojzk6EQ/YQEoqLab7zVUUKf
	HWUiaL/+EjmhsohQMoCZNeYrtx5azvHavG0Jd9BpuhPIybNFeFxoXVOnWI4HjAkt5endLlReBsiUU
	CyW5wUHGjhdBYLAknLTyzkv6Pwb5jHjkSInV9NXeL6NXj5w0EEh+6urfIqZzWVI7xIWKRAQfj0rbq
	reOTVkVmy2h8e1dSpNt2V9x7jKllzr3yU8GLWTtqey5ovFEnDi5ryrkiLLMrxANV0hZ2bBh7LjM+r
	/owqgG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfEw-0000000F7e9-0VNa;
	Mon, 24 Feb 2025 20:39:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfBQ-0000000F6ym-2XdV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:36:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22117c396baso2575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740429368; x=1741034168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cKiypGlQlNh3QGjj5r76b5/2a735Mu54ttXf9R8rE4=;
        b=DU3ALU3U1RiSlMEWgugc2Nruj+tlQBp1d0vSw0boxtFprCDSLVG414q8Xz1rhIJHwj
         CyIUgiSO725nSZfl39vq18L82fh0NXcOvCq1ysz+U0gI85jX9i5o3+ic7w4zwv20qOqj
         ylyzVgfHs5iZ3NfgL+kAnA99S98noe10VANVQ7thI1lNdxygEhNpKAiSwjFK9+Vmrvy6
         Lqc1rUKZ5MuH7YmZ7Is7RjJCb6Xd8j5p91vsBSfAnvrit512qN1WhE/xITk9DS13DRHj
         n3YFlJbvPAxTVsNtpNndgcaAvt2vbUmF+daa96/iGDWa3XpQvPJc61xjblqR4AJEbPJ9
         Blxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740429368; x=1741034168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cKiypGlQlNh3QGjj5r76b5/2a735Mu54ttXf9R8rE4=;
        b=EN7PGQxPVG0auNFUz0Lz4TesYWgDCuS8z7zqAHgjfZ3luwj9a998WL2vmZndRHeOgZ
         flFD0uzxno2yPz7DolWD/ejcpKClS+EUdkcSx0yxpKTu/9j7D4QZZJxfKnlCWTCDFs8y
         2IbLdb/MI4yowL6CxmsEsTwjvchguPV2WdMR8XPtZoAj/WaxeoB9PnyrsO+OCOM/jFaq
         4+d6sDQsFz/eAMVQ7Gt4WWoYlDxoEqfpRQFQhmmT7+MgT/uPw4/g600knQ2wNyFKL3Hp
         s48rGl8FJjyckUJ8lgUcXCTg5H1MC5Gil1JQaPSzYHyMBqzlxf4uGQ4qmKSjYWkQy4ER
         ZU8g==
X-Forwarded-Encrypted: i=1; AJvYcCX5sSNRHQf2RLGaeBuBoylu7Z9K0Da4RAh8SCz8NY06OAbiYMC3M9kyi43rRa7UWd8ZzEAc6U649LmzWEYsVrYc@lists.infradead.org
X-Gm-Message-State: AOJu0YzXX8ExJ7FoWSHtxYeahe9dPDJwiQP0eoUhKOspGeMUdRL3gL5m
	6+T4IcrXRaptsn7zXiOPPSxapvt6e5BmsV8wYuxQKDu523VcgKqwaP9zSKkO1w==
X-Gm-Gg: ASbGnctygWWHXaU7PXys21FgHN37cCe/ud13dfnQ1i4Feba9vTpCrRJ0LyAW8NBcqp+
	YeuaIH4VBJTOjSVhq9oBiVmWEaLdBczT//ryOtTVfuaYswwcBYBF40G65gw/YYhz1oZd0L8a2OR
	7s+j8UjvmZrqw4KN6qSTGmIp3D6qXt3KaRHfwTQfM0Fr/DEkfmWt7a50gRKbQEjcmtkaoyjNc0z
	ywzApB6J3LcfJQw3oaEiHVnVK4cwfL/mRgMRkZAoemrKmJ6LQFjbUEWmVXl1KvNBHpVZNb79QwG
	7AD+2Snkb3CVqTVA7N2sM8sBA4vHXI9e5tGeLsPY3OoVOKS5iWNjcu5+ciri8/k=
X-Google-Smtp-Source: AGHT+IHaH843HTFlex9kiZqcHpRgOavmlHObIcSN9r1RcQ8QKdI50gtE2lb4j2DGqAQRh59wKV6n8g==
X-Received: by 2002:a17:902:ec90:b0:216:607d:c867 with SMTP id d9443c01a7336-22307aabb1cmr843455ad.29.1740429367405;
        Mon, 24 Feb 2025 12:36:07 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a43cb81sm101015a91.38.2025.02.24.12.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:36:06 -0800 (PST)
Date: Mon, 24 Feb 2025 20:35:56 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z7zYLBLZGKim-5UL@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_123608_662766_93E8E846 
X-CRM114-Status: GOOD (  21.31  )
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

oN sAt, Feb 22, 2025 at 07:54:09AM -0800, Nicolin Chen wrote:
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 5aa2e7af58b4..364d8469a480 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -85,6 +85,59 @@ static void arm_smmu_make_nested_domain_ste(
>  	}
>  }
>  
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +				    struct iommu_domain *domain)
> +{
> +	struct arm_smmu_nested_domain *nested_domain;
> +	struct arm_smmu_vmaster *vmaster;
> +	unsigned long vsid;
> +	int ret;
> +
> +	iommu_group_mutex_assert(state->master->dev);
> +
> +	if (domain->type != IOMMU_DOMAIN_NESTED)
> +		return 0;
> +	nested_domain = to_smmu_nested_domain(domain);
> +
> +	/* Skip invalid vSTE */
> +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +		return 0;
> +
> +	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
> +					 state->master->dev, &vsid);
> +	if (ret)
> +		return ret;
> +
> +	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
> +	if (!vmaster)
> +		return -ENOMEM;
> +	vmaster->vsmmu = nested_domain->vsmmu;
> +	vmaster->vsid = vsid;
> +	state->vmaster = vmaster;
> +
> +	return 0;
> +}
> +
> +void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> +{
> +	struct arm_smmu_master *master = state->master;
> +
> +	mutex_lock(&master->smmu->streams_mutex);
> +	if (state->vmaster != master->vmaster) {
> +		kfree(master->vmaster);
> +		master->vmaster = state->vmaster;
> +	}

Does this condition suggest that we might end up calling
`arm_smmu_attach_prepare_vmaster()` multiple times before __actually__
commiting to a vmaster?

> +	mutex_unlock(&master->smmu->streams_mutex);
> +}
> +
> +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> +{
> +	mutex_lock(&master->smmu->streams_mutex);
> +	kfree(master->vmaster);
> +	master->vmaster = NULL;
> +	mutex_unlock(&master->smmu->streams_mutex);
> +}
> +
>  static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
>  				      struct device *dev)
>  {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 358072b4e293..9e50bcee69d1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2803,6 +2803,7 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  	struct arm_smmu_domain *smmu_domain =
>  		to_smmu_domain_devices(new_domain);
>  	unsigned long flags;
> +	int ret;
>  
>  	/*
>  	 * arm_smmu_share_asid() must not see two domains pointing to the same
> @@ -2832,9 +2833,15 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  	}
>  
>  	if (smmu_domain) {
> +		ret = arm_smmu_attach_prepare_vmaster(state, new_domain);

IMO, this adds a little confusion for folks not using iommufd.

I guess it'd be cleaner if we invoke this below within the:
`if (new_domain->type == IOMMU_DOMAIN_NESTED)` condition instead of
simply returning from the function if the new_domain->type isn't NESTED.

> +		if (ret)
> +			return ret;
> +
>  		master_domain = kzalloc(sizeof(*master_domain), GFP_KERNEL);
> -		if (!master_domain)
> +		if (!master_domain) {
> +			kfree(state->vmaster);
>  			return -ENOMEM;
> +		}
>  		master_domain->master = master;
>  		master_domain->ssid = state->ssid;
>  		if (new_domain->type == IOMMU_DOMAIN_NESTED)
> @@ -2861,6 +2868,7 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  			spin_unlock_irqrestore(&smmu_domain->devices_lock,
>  					       flags);
>  			kfree(master_domain);
> +			kfree(state->vmaster);
>  			return -EINVAL;
>  		}
>  
> @@ -2893,6 +2901,8 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state)
>  
>  	lockdep_assert_held(&arm_smmu_asid_lock);
>  
> +	arm_smmu_attach_commit_vmaster(state);
> +
>  	if (state->ats_enabled && !master->ats_enabled) {
>  		arm_smmu_enable_ats(master);
>  	} else if (state->ats_enabled && master->ats_enabled) {
> @@ -3162,6 +3172,7 @@ static int arm_smmu_attach_dev_identity(struct iommu_domain *domain,
>  	struct arm_smmu_ste ste;
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  
> +	arm_smmu_master_clear_vmaster(master);
>  	arm_smmu_make_bypass_ste(master->smmu, &ste);
>  	arm_smmu_attach_dev_ste(domain, dev, &ste, STRTAB_STE_1_S1DSS_BYPASS);
>  	return 0;
> @@ -3180,7 +3191,9 @@ static int arm_smmu_attach_dev_blocked(struct iommu_domain *domain,
>  					struct device *dev)
>  {
>  	struct arm_smmu_ste ste;
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
>  
> +	arm_smmu_master_clear_vmaster(master);
>  	arm_smmu_make_abort_ste(&ste);
>  	arm_smmu_attach_dev_ste(domain, dev, &ste,
>  				STRTAB_STE_1_S1DSS_TERMINATE);
> 

Thanks,
Praan

