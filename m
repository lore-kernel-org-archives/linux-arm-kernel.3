Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6F8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV+gJB5ebBMdY4lrxfExKBx0DMSngEYrND59Gya7WaU=; b=Tv98OXCpGVsminyIdtDbIYzket
	7i9RHVZwaoTtmYGZlHKhaRMCBej/FjNQcMqqnjlduC4dqvydBeVBEIaaxFWGvIcjZ63uzrBCTVMEv
	0G13GZjTT4djL1x/DgnfEpkQnQ1KqiYW/rNL6uvNNv5LyJVSXJVgBCAUTSs1/aBENMwlTSQfFNMd2
	up5LT/nGGxcMm1SUxKuXFMPO0IoBC3f4k3NY/bME6rpZsoF78un8sl9cdxNNoKgNNWoEdAaSgTBa3
	/Cp+tXRbVFG6uY2Kj9aszb4ilV1MKRpWeYe9a7vDRMZ6I7ES+xZHdecMpJTLQNhQAnAIx/Ls8Uy5f
	/C8qmXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3v1-0000000EqYp-1wXo;
	Tue, 07 Jul 2026 11:24:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3uz-0000000EqXk-1Icb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:24:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b8d99342so25055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783423487; x=1784028287; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV+gJB5ebBMdY4lrxfExKBx0DMSngEYrND59Gya7WaU=;
        b=KtNBEyrFRIRvv2elxczXjIzG0jH6gIOkeOlUO8fboXrbFLcg5VfuQrMtLR7euDntQp
         aPyZpwKiCzbXLuQ9cigVUaGjkoqppZYNNXm5PbRTErmbr/PMMa85g8ReOzQog4r5FCfe
         UZMoMS4tcc06DkxppE4iIArzuOeyvi+4aKYIHVAONf0uRmkMc+Btsd9SmKHFrleYP3hH
         IqnXDE6hlR8mlA0vRJRrvED24BYu2TsARb/1jMcNfGlDXGHSqkhOsbXFGe4YhAVadMB4
         KgHtVWzALQb76S39JkMMQ+MkNmquMbwSFZwnx9Eo2RNEkfBhZdbZ/rdL+LEOjjucwHhD
         R4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423487; x=1784028287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VV+gJB5ebBMdY4lrxfExKBx0DMSngEYrND59Gya7WaU=;
        b=Hw/7/0oFSYa4LCIFpXsfwRAzAkG8Ikqj/uSGb4vSiilPiOlwWMJrJ1hG4C2iWolT5Y
         YDx19hm1QknlDig5VjqOtGsGLT9zxVbeeAN478yA7vZ7/zBganXqLPn7TiCnFtUfYTt7
         I1+8QFgMeJRTNva4CXAyhXgqklGyqB9rlD7+K27Ga9pRpGPLcVYvqlOth/T6NVNS7qJj
         OGMiOEMPXS7XSPREYL2YXRFfiY5IS8MxQfPPYQLuNYz0Ns1YKNjbin+4TaH9vEhGRrzW
         3H6sZ1diKyRqfbSbUxXFoMhjTh8DIlKVvJUO3NoiFK1uF1Q2mVHgJG3fe15A0JxSFbfC
         ekAQ==
X-Forwarded-Encrypted: i=1; AHgh+RotMfF+3MzbcBJLSILkApqxkI9qULisrlJrV/bsfLldBXU3oGxQjrsVEcK5zueslRF8CmedlO+Tu9kPuQWI6QAy@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDTPTg2g/ZJkd8wM5vgIupqQKnuRUuEMH49ByOwjtjiLvFqX/
	NYVM2wykpt19mjqO7SS9yiM66OSs+zrV/f6TYchJULKy/k1l6O9XfetRvs+guM5tGA==
X-Gm-Gg: AfdE7clWPN9MeiQmAvvHLddZVqmtAu8qvD1mLb4LD7g0+WjB0Xdu4ujcWePmK7qeG7N
	yumZMEhtsIvFEFdar0vdLvCIihafsgGT+PaYQr1MLEL9ltDb5klUXK1Du/7pHDoKZ448blATsZ0
	c2hHyNJzAgPhTo/dcoxxgTKIgyKL9WVJqDSa/cb9rKZUQ67ypuRm25P1ESsTO0/RW7CE3dIpOMI
	6mqwu06RKL1Gp1JvSAH53vzNyU/0qB0eOs4nkp6TAgni69KSzsbJHBudWj27mYDgXp2aZ4y/Ku0
	W02yVr2aDmba0QIA+Gc+AlKaON0jL65E+TNj8L49RnpDAcmlsZ6AUq6crMKVJ0LYIeBtV3UyLt0
	x8Fp/trpqHTg+40nvY3/klIyqcrbkmO0PKhh12zqq+ga4DVeW5YHDXWZdrwidYj5Ro5+49D4WR2
	drlSTWD1LF7jz4ps7uC+5J4tRBQDyUSR/PSCsTgqXvNXtyiR6U
X-Received: by 2002:a05:600d:6409:10b0:492:668f:410c with SMTP id 5b1f17b1804b1-493e122aa8dmr648535e9.10.1783423487138;
        Tue, 07 Jul 2026 04:24:47 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm53005485e9.0.2026.07.07.04.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:24:46 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:24:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v2 2/8] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
Message-ID: <akzh9qFEfi2umwDW@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_042449_421542_06A0265B 
X-CRM114-Status: GOOD (  29.36  )
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

On Mon, Jul 06, 2026 at 01:26:39PM -0300, Jason Gunthorpe wrote:
> pgsize is a constant property of the domain, it is the base translation
> granule of the page table (4k, 16k, 64k) in log2.
> 
> Store it to the struct arm_smmu_domain based on how the page table was created.
> 
> Add smmu_domain to the tlbi and just get tg from the domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 27 ++++++++-----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  3 ++-
>  3 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 1ed8a6f29dc445..5d4dde3d1cfe87 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -334,6 +334,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
>  	 * ARM_SMMU_FEAT_RANGE_INV is present
>  	 */
>  	smmu_domain->domain.pgsize_bitmap = PAGE_SIZE;
> +	smmu_domain->tgsz_lg2 = PAGE_SHIFT;
>  	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
>  	smmu_domain->smmu = smmu;
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0c875771b46d2f..d22012466e3965 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2398,14 +2398,13 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
>  					  struct arm_smmu_cmd *cmd,
> -					  struct arm_smmu_tlbi *tlbi,
> -					  size_t pgsize)
> +					  struct arm_smmu_tlbi *tlbi)
>  {
>  	size_t inv_range = tlbi->iopte_granule;
>  	unsigned long iova = tlbi->iova;
>  	unsigned long end = iova + tlbi->size;
>  	unsigned long num_pages = 0;
> -	unsigned int tg = pgsize;
> +	unsigned int tg = tlbi->smmu_domain->tgsz_lg2;
>  	u64 orig_data0 = cmd->data[0];
>  	u8 ttl = 0, tg_enc = 0;
>  
> @@ -2513,7 +2512,7 @@ static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  		return;
>  	}
>  
> -	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi, inv->pgsize);
> +	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi);
>  }
>  
>  static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> @@ -2615,6 +2614,7 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  			       unsigned int granule, bool leaf)
>  {
>  	struct arm_smmu_tlbi tlbi = {
> +		.smmu_domain = smmu_domain,
>  		.iova = iova,
>  		.size = size,
>  		.iopte_granule = granule,
> @@ -2870,6 +2870,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
>  		return -ENOMEM;
>  
>  	smmu_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> +	smmu_domain->tgsz_lg2 = __ffs(pgtbl_cfg.pgsize_bitmap);
>  	smmu_domain->domain.geometry.aperture_end = (1UL << pgtbl_cfg.ias) - 1;
>  	smmu_domain->domain.geometry.force_aperture = true;
>  	if (enable_dirty && smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
> @@ -3104,15 +3105,13 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
>  
>  static struct arm_smmu_inv *
>  arm_smmu_master_build_inv(struct arm_smmu_master *master,
> -			  enum arm_smmu_inv_type type, u32 id, ioasid_t ssid,
> -			  size_t pgsize)
> +			  enum arm_smmu_inv_type type, u32 id, ioasid_t ssid)
>  {
>  	struct arm_smmu_invs *build_invs = master->build_invs;
>  	struct arm_smmu_inv *cur, inv = {
>  		.smmu = master->smmu,
>  		.type = type,
>  		.id = id,
> -		.pgsize = pgsize,
>  	};
>  
>  	if (WARN_ON(build_invs->num_invs >= build_invs->max_invs))
> @@ -3164,28 +3163,24 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
>  			   ioasid_t ssid, struct arm_smmu_domain *smmu_domain)
>  {
>  	const bool nesting = smmu_domain->nest_parent;
> -	size_t pgsize = 0, i;
> +	size_t i;
>  
>  	iommu_group_mutex_assert(master->dev);
>  
>  	master->build_invs->num_invs = 0;
>  
> -	/* Range-based invalidation requires the leaf pgsize for calculation */
> -	if (master->smmu->features & ARM_SMMU_FEAT_RANGE_INV)
> -		pgsize = __ffs(smmu_domain->domain.pgsize_bitmap);
> -
>  	switch (smmu_domain->stage) {
>  	case ARM_SMMU_DOMAIN_SVA:
>  	case ARM_SMMU_DOMAIN_S1:
>  		if (!arm_smmu_master_build_inv(master, INV_TYPE_S1_ASID,
>  					       smmu_domain->cd.asid,
> -					       IOMMU_NO_PASID, pgsize))
> +					       IOMMU_NO_PASID))
>  			return NULL;
>  		break;
>  	case ARM_SMMU_DOMAIN_S2:
>  		if (!arm_smmu_master_build_inv(master, INV_TYPE_S2_VMID,
>  					       smmu_domain->s2_cfg.vmid,
> -					       IOMMU_NO_PASID, pgsize))
> +					       IOMMU_NO_PASID))
>  			return NULL;
>  		break;
>  	default:
> @@ -3197,7 +3192,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
>  	if (nesting) {
>  		if (!arm_smmu_master_build_inv(
>  			    master, INV_TYPE_S2_VMID_S1_CLEAR,
> -			    smmu_domain->s2_cfg.vmid, IOMMU_NO_PASID, 0))
> +			    smmu_domain->s2_cfg.vmid, IOMMU_NO_PASID))
>  			return NULL;
>  	}
>  
> @@ -3208,7 +3203,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
>  		 */
>  		if (!arm_smmu_master_build_inv(
>  			    master, nesting ? INV_TYPE_ATS_FULL : INV_TYPE_ATS,
> -			    master->streams[i].id, ssid, 0))
> +			    master->streams[i].id, ssid))
>  			return NULL;
>  	}
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index a364d847c22a92..2fc695817671fe 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -734,7 +734,6 @@ struct arm_smmu_inv {
>  	u8 nsize_opcode;
>  	u32 id; /* ASID or VMID or SID */
>  	union {
> -		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
>  		u32 ssid; /* INV_TYPE_ATS */
>  	};
>  
> @@ -803,6 +802,7 @@ static inline struct arm_smmu_invs *arm_smmu_invs_alloc(size_t num_invs)
>  }
>  
>  struct arm_smmu_tlbi {
> +	struct arm_smmu_domain *smmu_domain;

The smmu_domain is only used for the tgsz_lg2, can’t we add that
directly instead? Decoupling the invalidation form the domain would
make it easier for KVM to re-use the code.
I see by the end of the series the only difference would be
arm_smmu_domain_tlbi() which need to the domain for the RCU, but that
can be passed instead as all the callers are have the domain already.

Thanks,
Mostafa

>  	unsigned long iova;
>  	size_t size;
>  	unsigned int iopte_granule;
> @@ -1050,6 +1050,7 @@ struct arm_smmu_domain {
>  	spinlock_t			devices_lock;
>  	bool				enforce_cache_coherency : 1;
>  	bool				nest_parent : 1;
> +	u8				tgsz_lg2;
>  
>  	struct mmu_notifier		mmu_notifier;
>  };
> -- 
> 2.43.0
> 

