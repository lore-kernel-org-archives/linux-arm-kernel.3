Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB642C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6IJ44fHla9q8jik3/kgaIVLbHkWW80AbYg/MgWLN94=; b=ji7rQlf22+SwNSsUDUE9/LcMEf
	rfUSyp8LCQX3kTfhSfPBGdxlav+zPsCgImgeKa7pCEyy1EdBw00iuMmzpe8OLYdgW2MKAstnRlghs
	2+7FptRuH8Jc7l1/96UpRbPYS04RmA2eQQ5FyZ1Pp+OFT8ALb/Qjc6/osCsyl33YUVCx7pSQ6/Ice
	A+FSEtN3erl2gsXw8dzn4T3HERqrO3NsTsR/hSXac399PUsrwn3DvFoFiLw8z9e73QbX1urySSsqd
	XXBVGzL8AU3Lcpf6YXooG9jbyeifiroBKjS/+2XuGxHrCuPg8NZuF8F41w31bmYD9woP7zYFk0TSe
	PXBozAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3ox-0000000EpuQ-1JN6;
	Tue, 07 Jul 2026 11:18:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3ou-0000000Epta-34Nf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:18:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso27445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783423110; x=1784027910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6IJ44fHla9q8jik3/kgaIVLbHkWW80AbYg/MgWLN94=;
        b=mekyIuFIZRLoJ3IhD5vNsIa6yR82O+58EQm6gLOuvHfXG6Emhr0+qqUW8PA3Jtdw7w
         HrpA24ZeFqTPZ5boo4q27UzSlsriw3xw0KYECT9DZ6RLOwkUPu/8kiO1rQ2saeccxrfy
         Ih7SzzMfqxbJCNuh+x7yPSfn5BhzmZpHcmohQxYEH3P3kmNw0mBKY3pCa2037ao20uUr
         yL3yavFf4EzukXvHugo1jNiROKKy4hWQRW7oDqCvjY+4m11fkJqhQwqySg829IIlVH7y
         5cP0D8jAUylIehzjBTH3kexbmQunIKL+nKm2A896jiPM6ttNB/DVquueHZMS8fKHbZDj
         yndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423110; x=1784027910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6IJ44fHla9q8jik3/kgaIVLbHkWW80AbYg/MgWLN94=;
        b=mPXc+49ZoYe4p4PbJ67MO3CFTVydxMAcgMeDLHsk2IYW+TqQMFzWmrU837RBXgChTj
         Z5FBMH07HRe4WkXeMtQz3jiaCSGCbdEo+WG12UWlUYGkQq9NJBgHhAaMGBsnpoMRJ1N5
         R+L2ibH3n0gX+t2CSnLQXBr34VYoCkCU8bMJr+INL4+gltVZ+LVdA+/pcfG1jv3LQYa/
         678T+wcmt4+6P/fikfMAWd5qNjwxGhGUn9VYM05yqJmxep1rk1UdIuG4gTOKmk4HOkfw
         0ARLEjEVjj5DkG47c6B68H0GXrbaWq+Bd/sOXGFz5qxqzZFJzxz/bxjsfwgOF4FpdM3T
         Qt8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6d3pR/BIsJH+6YlyAlF+Zp5zAuB1DYmKaPkLRq2Gw3TVBlNLmtR+/JzAPmGEW5WuuUud/GQMCymSxEAIxbWmS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ezuoiDlOkrShSXa4KL0OJdklfCthUSAd0tHSJr3LgjspiG7u
	tVglWr6x9VqkrRQQefy7/F8ALa0AfbucZFLcrrkTjqg6H8/q9tDnGixou8JCmGOrcg==
X-Gm-Gg: AfdE7cnG5YZ6wHcS/63INobh0jax9h1tfNanwLZGoCBXXDxSD/pTozCURvaddU2tgI8
	XYkLcA2vCGBWD3YNv1YMTWmaqYKZbNlb0IOViq9D5kHOsKJdBanied1BvLJr568XsXr3jZKePS4
	KT1GUQxy5v1kBPVIdlRxgN+BlDmGZLsDE4qwWNI6qgf2Jy/E9krxeGNMOZyhuVYiLZ/fLXCmC8v
	0JZuholqVv23oNzQjdbXc6c117T5sK1SLjpssyzUZg+Z2bLsgwFMicDyjUBgtjyJtCX4L2+1fBT
	3MGooLHSVhmgFpZXgz2I4hjCiKspUzbS/I/oTrqxMDpigplZcxL0+RXv1da4MtfAcGiaxItceat
	lgxWkpVvA47K8OJCCEEz77Qk9IFY6jsZR3x4NcS4jtLE2IlwSHK3bN+AyoN4jgP0CnOVhGi0OrP
	zvowjFAKaXXeQfOmO9pJReN9y/DblA/8hPhpNb8rz7JjYesm32dcl5WofP2Rc=
X-Received: by 2002:a05:600c:604a:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-493e14ef934mr536545e9.2.1783423109000;
        Tue, 07 Jul 2026 04:18:29 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm52669675e9.0.2026.07.07.04.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:18:28 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:18:22 +0000
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
Subject: Re: [PATCH v2 1/8] iommu/arm-smmu-v3: Pass the parameters for the
 invalidation in a struct
Message-ID: <akzgfisqFzfLGW51@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <1-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_041832_849577_E2E79284 
X-CRM114-Status: GOOD (  29.91  )
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

On Mon, Jul 06, 2026 at 01:26:38PM -0300, Jason Gunthorpe wrote:
> These parameters go to a lot of different functions and the next
> patches will add more. Put them into a struct to keep things tidy.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 75 +++++++++++----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  7 ++
>  2 files changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index a10affb483a4fe..0c875771b46d2f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2298,8 +2298,8 @@ static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static struct arm_smmu_cmd
> -arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
> +static struct arm_smmu_cmd arm_smmu_atc_inv_to_cmd(u32 sid, int ssid,
> +						   struct arm_smmu_tlbi *tlbi)
>  {
>  	size_t log2_span;
>  	size_t span_mask;
> @@ -2321,8 +2321,8 @@ arm_smmu_atc_inv_to_cmd(u32 sid, int ssid, unsigned long iova, size_t size)
>  	 * This has the unpleasant side-effect of invalidating all PASID-tagged
>  	 * ATC entries within the address range.
>  	 */
> -	page_start	= iova >> inval_grain_shift;
> -	page_end	= (iova + size - 1) >> inval_grain_shift;
> +	page_start = tlbi->iova >> inval_grain_shift;
> +	page_end = (tlbi->iova + tlbi->size - 1) >> inval_grain_shift;
>  
>  	/*
>  	 * In an ATS Invalidate Request, the address must be aligned on the
> @@ -2397,20 +2397,23 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  
>  static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
> -					  struct arm_smmu_cmd *cmd, bool leaf,
> -					  unsigned long iova, size_t size,
> -					  size_t granule, size_t pgsize)
> +					  struct arm_smmu_cmd *cmd,
> +					  struct arm_smmu_tlbi *tlbi,
> +					  size_t pgsize)
>  {
> -	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
> +	size_t inv_range = tlbi->iopte_granule;
> +	unsigned long iova = tlbi->iova;
> +	unsigned long end = iova + tlbi->size;
> +	unsigned long num_pages = 0;
> +	unsigned int tg = pgsize;
>  	u64 orig_data0 = cmd->data[0];
> -	size_t inv_range = granule;
>  	u8 ttl = 0, tg_enc = 0;
>  
> -	if (WARN_ON_ONCE(!size))
> +	if (WARN_ON_ONCE(!tlbi->size))
>  		return;
>  
>  	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		num_pages = size >> tg;
> +		num_pages = tlbi->size >> tg;
>  
>  		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
>  		tg_enc = (tg - 10) / 2;
> @@ -2423,8 +2426,8 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  		 * want to use a range command, so avoid the SVA corner case
>  		 * where both scale and num could be 0 as well.
>  		 */
> -		if (leaf)
> -			ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
> +		if (tlbi->leaf_only)
> +			ttl = 4 - ((ilog2(tlbi->iopte_granule) - 3) / (tg - 3));
>  		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
>  			num_pages++;
>  	}
> @@ -2462,7 +2465,7 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  		 * command and something would be very broken if iova had them
>  		 * set.
>  		 */
> -		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf) |
> +		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
>  			       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
>  			       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) |
>  			       (iova & ~GENMASK_U64(11, 0));
> @@ -2472,13 +2475,13 @@ static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  	}
>  }
>  
> -static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
> -				      size_t granule)
> +static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_tlbi *tlbi)
>  {
>  	size_t max_tlbi_ops;
>  
>  	/* 0 size means invalidate all */
> -	if (!size || size == SIZE_MAX)
> +	if (!tlbi->size || tlbi->size == SIZE_MAX)
>  		return true;
>  
>  	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
> @@ -2491,19 +2494,17 @@ static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
>  	 * invalidation feature, where there can be too many per-granule TLBIs,
>  	 * resulting in a soft lockup.
>  	 */
> -	max_tlbi_ops = 1 << (ilog2(granule) - 3);
> -	return size >= max_tlbi_ops * granule;
> +	max_tlbi_ops = 1 << (ilog2(tlbi->iopte_granule) - 3);
> +	return tlbi->size >= max_tlbi_ops * tlbi->iopte_granule;
>  }
>  
>  /* Used by non INV_TYPE_ATS* invalidations */
>  static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  				       struct arm_smmu_cmdq_batch *cmds,
>  				       struct arm_smmu_cmd *cmd,
> -				       bool leaf,
> -				       unsigned long iova, size_t size,
> -				       unsigned int granule)
> +				       struct arm_smmu_tlbi *tlbi)
>  {
> -	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
> +	if (arm_smmu_inv_size_too_big(inv->smmu, tlbi)) {
>  		struct arm_smmu_cmd nsize_cmd = *cmd;
>  
>  		u64p_replace_bits(&nsize_cmd.data[0], inv->nsize_opcode,
> @@ -2512,8 +2513,7 @@ static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  		return;
>  	}
>  
> -	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, leaf,
> -				      iova, size, granule, inv->pgsize);
> +	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi, inv->pgsize);
>  }
>  
>  static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> @@ -2532,9 +2532,8 @@ static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
>  	return false;
>  }
>  
> -static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
> -					unsigned long iova, size_t size,
> -					unsigned int granule, bool leaf)
> +static void __arm_smmu_domain_inv_range(struct arm_smmu_tlbi *tlbi,
> +					struct arm_smmu_invs *invs)
>  {
>  	struct arm_smmu_cmdq_batch cmds = {};
>  	struct arm_smmu_inv *cur;
> @@ -2564,18 +2563,16 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
>  		case INV_TYPE_S1_ASID:
>  			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
>  						     cur->id, 0);
> -			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
> -						   iova, size, granule);
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi);
>  			break;
>  		case INV_TYPE_S2_VMID:
>  			cmd = arm_smmu_make_cmd_tlbi(cur->size_opcode,
>  						     0, cur->id);
> -			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, leaf,
> -						   iova, size, granule);
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, tlbi);
>  			break;
>  		case INV_TYPE_S2_VMID_S1_CLEAR:
>  			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
> -			if (arm_smmu_inv_size_too_big(cur->smmu, size, granule))
> +			if (arm_smmu_inv_size_too_big(cur->smmu, tlbi))
>  				break;
>  			arm_smmu_cmdq_batch_add_cmd(
>  				smmu, &cmds,
> @@ -2586,7 +2583,7 @@ static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
>  			arm_smmu_cmdq_batch_add_cmd(
>  				smmu, &cmds,
>  				arm_smmu_atc_inv_to_cmd(cur->id, cur->ssid,
> -							iova, size));
> +							tlbi));
>  			break;
>  		case INV_TYPE_ATS_FULL:
>  			arm_smmu_cmdq_batch_add_cmd(
> @@ -2617,6 +2614,12 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  			       unsigned long iova, size_t size,
>  			       unsigned int granule, bool leaf)
>  {
> +	struct arm_smmu_tlbi tlbi = {
> +		.iova = iova,
> +		.size = size,
> +		.iopte_granule = granule,
> +		.leaf_only = leaf,
> +	};
>  	struct arm_smmu_invs *invs;
>  
>  	/*
> @@ -2657,10 +2660,10 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  		unsigned long flags;
>  
>  		read_lock_irqsave(&invs->rwlock, flags);
> -		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
> +		__arm_smmu_domain_inv_range(&tlbi, invs);
>  		read_unlock_irqrestore(&invs->rwlock, flags);
>  	} else {
> -		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
> +		__arm_smmu_domain_inv_range(&tlbi, invs);
>  	}
>  
>  	rcu_read_unlock();
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index c909c9a88538bf..a364d847c22a92 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -802,6 +802,13 @@ static inline struct arm_smmu_invs *arm_smmu_invs_alloc(size_t num_invs)
>  	return new_invs;
>  }
>  
> +struct arm_smmu_tlbi {
> +	unsigned long iova;
> +	size_t size;
> +	unsigned int iopte_granule;
> +	bool leaf_only;
> +};
> +
>  struct arm_smmu_evtq {
>  	struct arm_smmu_queue		q;
>  	struct iopf_queue		*iopf;
> -- 
> 2.43.0
> 

