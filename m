Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C959C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYEj0yKZwB/DJtVSwa2XkeCzAfCYSyeO+hU4UeJV7oU=; b=lxQ/nKjqWTK0i5pXdlDKIlQ5o7
	0yAAaIMa+/uwdskTEZIeG3i9vO402vQ7678cgswmkN6E/uKikYGAa6OzpqkQNHECYp8WognAfst6c
	dx2AXFgJuFsxXpCPOlc/Mm5fx3hfXM4qHxtSnINdfQvs2CuVIK6XUjHU7sFGLuib8UelIhRt0AeOv
	U2qEmgXi35jrOR3e6Mnsc06RF9WjzOsmNfyV0vD+YLu7GgT5wzs3QjmPUFWMaknwXbhG/gTmCnPEk
	rIeNBnTVYT+iTRcgd/ZBSIsHpCx9CljFe9r5UBQSD1/yELBFoSwiDN9m+ycLvoTGNL9DvO7sByQJh
	Yhn5Ooiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUl-0000000DTXf-13XO;
	Sun, 28 Jun 2026 23:00:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUg-0000000DTVA-0IsZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9b1db4964so23255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782687652; x=1783292452; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eYEj0yKZwB/DJtVSwa2XkeCzAfCYSyeO+hU4UeJV7oU=;
        b=h7F2HPT+gZwICFupm72SODBOJYTAYLG0gs0/OgvJr1JEzStg6lFmqUxier7amoDakg
         Q6Rn82irnuZLx1LEOuGa9DmDDrI/dKEfXs0C41CpapKGa0THFqbHimBrzQgD4n7LvDjB
         YyuehzKLqv+DaUt0A2KtlpHSSfWc2pgUPf7PUfDuMYUH0OrUpZeDb56L6A1L5WenwXDP
         h0QIaO8tqumdV6lXldVpt3zfVHKzJd4kckdh/INxE6l+esHZQkOuQGDhU5IQgrBLPlaE
         m9vEmCwsciXdGqjwq4g6URQGw0CAPCgFw7p0mOTIxK5PG1sPX5NVJ/bWPnk7JCTs0eiV
         2YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687652; x=1783292452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYEj0yKZwB/DJtVSwa2XkeCzAfCYSyeO+hU4UeJV7oU=;
        b=gWPT6LmgsZt5iDi01aiTrKgm0Ps28lw39Q+SutrjL3rTZfFBh7SHdiytL2uky646v3
         DT0X/36ZGcE4h6WUh1rl2DD3Lxz4JteLU/QoRl3beAjEbIy9mxO8MpQMPOcbLAem4tYa
         5pQ06HbRVQ1orXEOIf/1idMb4lFYJOY6/GuDAky1bXsyZZEmxLg4bSYGxguuBktLE6p0
         Ah1mlI9ABpWt3G5FwdUQXkxe/SWmhKlHH6RLXlP8mJbgTV9Hc7qhERAnzcRPgkSOMF1Q
         aR8qx6lLVpAAi7VLBeBfL01yfU816rA/I529XtZOnUwKQD7cZihneuytR56KWA9p7vQC
         0v8A==
X-Forwarded-Encrypted: i=1; AHgh+Rox9WHu315VkLTlxBHC2IctZL2L5Wp5paTeLBOZBobl9GsL84Qcnk1TlY/1FFiEJs7JV/EPBq0B5a8imlmUsDzC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2COwUzAqfTAY9dvG8UU4eJnemivy7rXRlE0MFA7YUvfJKQegw
	CTkWY/mIheyT6pDJ0jLcr1Be5bEYXmur2eMU/2kGpYiY2rVptn5fwSLWDYnBIGJzwg==
X-Gm-Gg: AfdE7clFqrsYb8kAoZ1SgpCnwH8Qh1lyBavPaRfRzjm2peTSlvbrCdlC4F8G7ZqBkUB
	wfdrtp1A1v6KeePf2NCkksJ/rrLMogbSdwWyp24pcy8CDvFwHdLmaZ2Pb35jv2O9iDmnNIpLaAC
	qQCkV8lAy1TMCIl2Ca47nhFKE8/a8HBzM+PC5HGwyoeTfTzd0QrPZ1b2mJoKuJ7cdqBhMmOcTe9
	+qnfFJyFykY5sJqmIETIWyIinbNRAZlDywlFcexq+A5yhL6Afv5nD0gTWH8f4jSAU3E/5fIwlYf
	daL4VTq9sGVSDLMDycWfFp3AKkBDklEoTI+YtS79nk1k8zD209d/4YLgicq3HP6Uu1zdpuGCk8Y
	5a/KhI4w2bSGO6kgyWmVDCd65RBBAToI6SPcFhY2UihWQtDhDPnR87AFZmYEpkCztzfHpGNIqo0
	m++we/fjIh07XXzKfM5ME2Kc8aQDoyRfypBaR5X4bHekvrXcA=
X-Received: by 2002:a17:902:cecd:b0:2c7:f688:f22f with SMTP id d9443c01a7336-2c9ae676218mr2550725ad.13.1782687650355;
        Sun, 28 Jun 2026 16:00:50 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9878aca91sm41025365ad.79.2026.06.28.16.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:49 -0700 (PDT)
Date: Sun, 28 Jun 2026 23:00:43 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 1/7] iommu/arm-smmu-v3: Add
 arm_smmu_kdump_adopt_strtab() for kdump
Message-ID: <akGnm_dzvoapjwoI@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <f3d1f938a9b4d540f67d9c1ff394bd62735a4f5c.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d1f938a9b4d540f67d9c1ff394bd62735a4f5c.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160054_178704_E48AD658 
X-CRM114-Status: GOOD (  46.15  )
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

On Wed, May 20, 2026 at 10:03:18AM -0700, Nicolin Chen wrote:

Hi Nicolin,
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> To safely absorb in-flight DMAs, a kdump kernel will have to leave SMMUEN=1
> intact and avoid modifying STRTAB_BASE, allowing HW to continue translating
> in-flight DMAs reusing the crashed kernel's page tables until the endpoint
> device drivers probe and quiesce their respective hardware.
> 
> However, the ARM SMMUv3 architecture specification states that updating the
> SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> 
> This leaves a kdump kernel no choice but to adopt the stream table from the
> crashed kernel.
> 
> Introduce ARM_SMMU_OPT_KDUMP_ADOPT and adopt functions memremapping all the
> stream tables extracted from STRTAB_BASE and STRTAB_BASE_CFG.
> 
> Note that the adoption of the crashed kernel's stream table follows certain
> strict rules, since the old stream table might be compromised. Thus, apply
> some basic validations against the values read from the registers. If tests
> fail, it means the stream table cannot be trusted, so toss it entirely. To
> avoid OOM due to a potentially corrupted stream table, the memremap for l2
> tables is done on the kdump kernel's demand.
> 
> The new option will be set in a following change.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 254 +++++++++++++++++++-
>  2 files changed, 252 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ef42df4753ec4..cd60b692c3901 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -861,6 +861,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_OPT_MSIPOLL		(1 << 2)
>  #define ARM_SMMU_OPT_CMDQ_FORCE_SYNC	(1 << 3)
>  #define ARM_SMMU_OPT_TEGRA241_CMDQV	(1 << 4)
> +#define ARM_SMMU_OPT_KDUMP_ADOPT	(1 << 5)
>  	u32				options;
>  
>  	struct arm_smmu_cmdq		cmdq;
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f03..aa6837a5daa88 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2040,16 +2040,70 @@ static void arm_smmu_init_initial_stes(struct arm_smmu_ste *strtab,
>  	}
>  }
>  
> +static int arm_smmu_kdump_adopt_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +					  phys_addr_t base, u32 span,
> +					  struct arm_smmu_strtab_l2 **l2table)
> +{
> +	struct arm_smmu_strtab_l2 *table;
> +	size_t size;
> +
> +	/*
> +	 * Only a coherent SMMU is supported at this moment. For a non-coherent
> +	 * SMMU that wants to support ARM_SMMU_OPT_KDUMP_ADOPT, try MEMREMAP_WC.
> +	 */
> +	if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_COHERENCY)))
> +		return -EOPNOTSUPP;

We already checked this in arm_smmu_kdump_adopt_strtab_2lvl() can it
change since?

> +
> +	/*
> +	 * Retest the span in case the L1 descriptor has been overwritten since
> +	 * the adopt. Reject this master's insert; panic or SMMU-disable would
> +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> +	 * would break all other SIDs in the same bus (PCI case). The corruption
> +	 * blast radius is already bounded to that bus range.
> +	 */
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev,
> +			"kdump: L1[%u] span %u changed since adopt (was %u)\n",
> +			arm_smmu_strtab_l1_idx(sid), span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}
> +
> +	size = (1UL << (span - 1)) * sizeof(struct arm_smmu_ste);
> +
> +	table = devm_memremap(smmu->dev, base, size, MEMREMAP_WB);

Why do we use devm_memremap() here but memremap() in the rest of the
functions (even for the L1 ptr)?

> +	if (IS_ERR(table)) {
> +		dev_err(smmu->dev,
> +			"kdump: failed to adopt l2 stream table for SID %u\n",
> +			sid);
> +		return PTR_ERR(table);
> +	}
> +
> +	*l2table = table;
> +	return 0;
> +}
> +
>  static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  {
>  	dma_addr_t l2ptr_dma;
>  	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>  	struct arm_smmu_strtab_l2 **l2table;
> +	u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
>  
> -	l2table = &cfg->l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)];
> +	l2table = &cfg->l2.l2ptrs[l1_idx];
>  	if (*l2table)
>  		return 0;
>  
> +	/* Deferred adoption of the crashed kernel's L2 table */
> +	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[l1_idx].l2ptr);
> +		phys_addr_t base = l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
> +		u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l2ptr);
> +
> +		if (span && base)
> +			return arm_smmu_kdump_adopt_l2_strtab(smmu, sid, base,
> +							      span, l2table);
> +	}
> +
>  	*l2table = dmam_alloc_coherent(smmu->dev, sizeof(**l2table),
>  				       &l2ptr_dma, GFP_KERNEL);
>  	if (!*l2table) {
> @@ -2061,8 +2115,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  
>  	arm_smmu_init_initial_stes((*l2table)->stes,
>  				   ARRAY_SIZE((*l2table)->stes));
> -	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[arm_smmu_strtab_l1_idx(sid)],
> -				      l2ptr_dma);
> +	arm_smmu_write_strtab_l1_desc(&cfg->l2.l1tab[l1_idx], l2ptr_dma);
>  	return 0;
>  }
>  
> @@ -4556,10 +4609,204 @@ static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, phys_addr_t base)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	u32 split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, cfg_reg);
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 num_l1_ents;
> +	size_t size;
> +	int i;
> +
> +	/*
> +	 * Only a coherent SMMU is supported at this moment. For a non-coherent
> +	 * SMMU that wants to support ARM_SMMU_OPT_KDUMP_ADOPT, try MEMREMAP_WC.
> +	 */
> +	if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_COHERENCY)))
> +		return -EOPNOTSUPP;
> +
> +	if (log2size < split || log2size > smmu->sid_bits) {
> +		dev_err(smmu->dev, "kdump: log2size %u out of range [%u, %u]\n",
> +			log2size, split, smmu->sid_bits);
> +		return -EINVAL;
> +	}
> +	if (split != STRTAB_SPLIT) {
> +		dev_err(smmu->dev,
> +			"kdump: unsupported STRTAB_SPLIT %u (expected %u)\n",
> +			split, STRTAB_SPLIT);
> +		return -EINVAL;
> +	}
> +
> +	num_l1_ents = 1U << (log2size - split);
> +	if (num_l1_ents > STRTAB_MAX_L1_ENTRIES) {
> +		dev_err(smmu->dev, "kdump: l1 entries %u exceeds max %u\n",
> +			num_l1_ents, STRTAB_MAX_L1_ENTRIES);
> +		return -EINVAL;
> +	}
> +
> +	cfg->l2.num_l1_ents = num_l1_ents;
> +
> +	size = num_l1_ents * sizeof(struct arm_smmu_strtab_l1);
> +	cfg->l2.l1tab = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->l2.l1tab)
> +		return -ENOMEM;

Same here (as below, sorry reviewing it as the code flows), we should
populate cfg->l2.l1_dma here to be consistent.

> +
> +	cfg->l2.l2ptrs =
> +		kcalloc(num_l1_ents, sizeof(*cfg->l2.l2ptrs), GFP_KERNEL);
> +	if (!cfg->l2.l2ptrs)
> +		return -ENOMEM;

We shuold ummap cfg->l2.l1tab before returning -ENOMEM here

> +
> +	for (i = 0; i < num_l1_ents; i++) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
> +		phys_addr_t l2_base = l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
> +		u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l2ptr);
> +
> +		if (!span || !l2_base)
> +			continue;
> +
> +		if (span != STRTAB_SPLIT + 1) {
> +			dev_err(smmu->dev,
> +				"kdump: L1[%u] unsupported span %u (vs %u)\n",
> +				i, span, STRTAB_SPLIT + 1);
> +			return -EINVAL;

We leak kcalloc'd mem (l2.l2ptrs) here, also we should unmap cfg->l2.l1tab

> +		}
> +
> +		/*
> +		 * If the crashed kernel's l1 descriptors are deeply corrupted,
> +		 * blindly memremapping every l2 table here could lead to OOM.
> +		 *
> +		 * Defer the l2 memremap to arm_smmu_init_l2_strtab(), so peak
> +		 * memory is bounded by the kdump kernel's actual demand.
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, phys_addr_t base)
> +{
> +	u32 log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, cfg_reg);
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	unsigned int max_log2size;
> +	size_t size;
> +
> +	/*
> +	 * Only a coherent SMMU is supported at this moment. For a non-coherent
> +	 * SMMU that wants to support ARM_SMMU_OPT_KDUMP_ADOPT, try MEMREMAP_WC.
> +	 */
> +	if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_COHERENCY)))
> +		return -EOPNOTSUPP;
> +
> +	/* Cap the size at what the kdump kernel itself would have allocated */
> +	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
> +		max_log2size =
> +			ilog2(STRTAB_MAX_L1_ENTRIES * STRTAB_NUM_L2_STES);

Looks like we'd never hit this if condition because we'd never support a
"linear" strtab if the HW supports ARM_SMMU_FEAT_2_LVL_STRTAB. Please
see arm_smmu_init_strtab:

static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
{
	int ret;

	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
		ret = arm_smmu_init_strtab_2lvl(smmu);
	else
		ret = arm_smmu_init_strtab_linear(smmu);
	if (ret)
		return ret;

	ida_init(&smmu->vmid_map);

	return 0;
}

> +	else
> +		max_log2size = smmu->sid_bits;
> +
> +	/* cfg->linear.num_ents is unsigned int, so cap log2size at 31 */
> +	max_log2size = min(max_log2size, 31U);
> +	if (log2size > max_log2size) {
> +		dev_err(smmu->dev, "kdump: unsupported log2size %u (> %u)\n",
> +			log2size, max_log2size);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * We might end up with a num_ents != sid_bits, which is fine. In the
> +	 * ARM_SMMU_OPT_KDUMP_ADOPT case, arm_smmu_write_strtab() is bypassed.
> +	 */
> +	cfg->linear.num_ents = 1U << log2size;
> +
> +	size = cfg->linear.num_ents * sizeof(struct arm_smmu_ste);
> +	cfg->linear.table = memremap(base, size, MEMREMAP_WB);
> +	if (!cfg->linear.table)
> +		return -ENOMEM;

We seem to skips initializing cfg->linear.ste_dma (it is populated in
arm_smmu_init_strtab_linear)

While the comment notes that arm_smmu_write_strtab() is bypassed in the
kdump case, leaving cfg->linear.ste_dma uninitialized seems like a 
ticking time bomb if any other part of the driver ever uses it.

> +	return 0;
> +}
> +
> +static void arm_smmu_kdump_adopt_cleanup(void *data)
> +{
> +	struct arm_smmu_device *smmu = data;
> +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);

I'm worried about reading the HW register here, since this is a devres action, it
can run after arm_smmu_device_remove() or arm_smmu_device_shutdown()
(which would call rpm_put()). Please see __device_release_driver[1]:

	pm_runtime_put_sync(dev); <--- HW turned off

	device_remove(dev);

	if (dev->bus && dev->bus->dma_cleanup)
		dev->bus->dma_cleanup(dev);

	device_unbind_cleanup(dev); <--- This is where devm_release runs
	device_links_driver_cleanup(dev);

Thus, even if we call rpm_get() here it would make no sense as the 
register contents would've been lost. Can we rely on some SW state
here? smmu->features & 2LVL or maybe add an fmt in cfg? 

> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> +
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		kfree(cfg->l2.l2ptrs);
> +		if (cfg->l2.l1tab)
> +			memunmap(cfg->l2.l1tab);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		if (cfg->linear.table)
> +			memunmap(cfg->linear.table);
> +	}
> +}
> +
> +static int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
> +{
> +	u32 cfg_reg = readl_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
> +	u64 base_reg = readq_relaxed(smmu->base + ARM_SMMU_STRTAB_BASE);
> +	u32 fmt = FIELD_GET(STRTAB_BASE_CFG_FMT, cfg_reg);
> +	phys_addr_t base = base_reg & STRTAB_BASE_ADDR_MASK;
> +	int ret;
> +
> +	dev_info(smmu->dev, "kdump: adopting crashed kernel's stream table\n");

Nit: Should this be dev_info? If everything goes right, the user doesn't
need to know. dev_dbg seems more appropriate. It should only be a warn or 
err if adoption fails (which is in place).

> +
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		/*
> +		 * Both kernels run on the same hardware, so it's impossible for
> +		 * kdump kernel to see the support for linear stream table only.
> +		 */
> +		if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)))
> +			ret = -EINVAL;
> +		else
> +			ret = arm_smmu_kdump_adopt_strtab_2lvl(smmu, cfg_reg,
> +							       base);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		/*
> +		 * In case that the old kernel for some reason used the linear

Nit: This sounds a little judgemental, what if the HW only supports
linear table? Let's drop the "for some reason" part.

> +		 * format, enforce the same format to match the adopted table.
> +		 */
> +		ret = arm_smmu_kdump_adopt_strtab_linear(smmu, cfg_reg, base);
> +		if (!ret)
> +			smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;

IIRC, this should NOT be set if we selected the linear format.
Looking at arm_smmu_init_strtab(), if the HW supports 2-level tables,
the driver unconditionally selects it. What is the expected scenario
where the previous kernel would have allocated a linear table on 2-level
capable hardware? IMO, it is a bug if we see linear fmt with this
feature set. Am I missing something?

> +	} else {
> +		dev_err(smmu->dev, "kdump: invalid STRTAB format %u\n", fmt);
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret) {
> +		arm_smmu_kdump_adopt_cleanup(smmu);
> +		goto err;
> +	}
> +
> +	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_kdump_adopt_cleanup,
> +				       smmu);
> +	/* devm_add_action_or_reset ran the cleanup upon failure */
> +	if (ret) {
> +		dev_warn(smmu->dev, "kdump: failed to set up cleanup action\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	dev_warn(smmu->dev, "kdump: falling back to full reset\n");
> +	memset(&smmu->strtab_cfg, 0, sizeof(smmu->strtab_cfg));
> +	smmu->options &= ~ARM_SMMU_OPT_KDUMP_ADOPT;
> +	return ret;
> +}
> +
>  static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
> +	if ((smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) &&
> +	    !arm_smmu_kdump_adopt_strtab(smmu))
> +		goto out;
> +
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
>  		ret = arm_smmu_init_strtab_2lvl(smmu);
>  	else
> @@ -4567,6 +4814,7 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
>  	if (ret)
>  		return ret;
>  
> +out:
>  	ida_init(&smmu->vmid_map);
>  
>  	return 0;
> -- 
> 2.43.0
> 

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/base/dd.c#L1350

