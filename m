Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283DBD72365
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WduvPbclkt+XJxEjDiSJE0UN6koAij5CYcDCN1IFG3k=; b=rbMpJm8FVov3eoBM7LR3lGu25b
	WRycUnORniiRYLjwcv8rapBeIaAd/xDj1iK2c+mlh0r0J732sc0jpB7wzOluOPUGOVnN+yv2U8eHo
	2+Rbmuv//b/WNEQRbJcK7Uv5nBkpWTWJttEDGsBkAxXuOcIXU0DziUBcw1MxBsUTdqYzvEyvLlvPr
	7PvE8/J2LGvS6GrLCZyTZv1/0ysQEIXRotwIruDiSWcciOxrKIuhod4XLmR2W6dF+ZwMyWOclDt+H
	KZgjaSME1BJECKzEEf0dFTA2VxZaO+uJ9b4VGBjWDcfe0NJBr3q1nLsIhKrBYpF3j8niSDVmweany
	pNc7bVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDma-00000008cBV-3MuS;
	Fri, 23 Jan 2026 09:48:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDmY-00000008cB8-21It
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:48:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a76b39587aso95435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769161725; x=1769766525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WduvPbclkt+XJxEjDiSJE0UN6koAij5CYcDCN1IFG3k=;
        b=2w0Y+bNGVizaOaCblexWsN/18YMauHbmKhFZ+U+PFApcVokoJb1qD6nfcJD9uoeFls
         nyCMYxGAHlX3SwhlJgztARGXOsm+qeO3AlyLZBq5h1UiiuWUuANg2E9Rb189IMauQdOs
         oPj/7ufLFIHVSsNf13qe0EoJ1EoAz43Su8UVf/xMI/08Li7L4qjs2D7tskpR/2xeAVk4
         c1xRYAOVCjvJSPgaqu/b4MwYrWv7ca9WXcWGxPCEWp9RyDgg5eiZOaaUAxmVN/rP5IEU
         gggwOaYPCKd3LkzShVGmDAvHNuVFQwC/ufRdCvDZ77/VXb+8f+HZuMxXOoaw+fc9d6FY
         q8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161725; x=1769766525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WduvPbclkt+XJxEjDiSJE0UN6koAij5CYcDCN1IFG3k=;
        b=dferjuI9Z7UZ71l91IMMbT32kLS3AvBERGqdgBgUEnGau42omtQoOqb+7nG8r3ghcX
         +DRfOj2NL6zggHNBE72HcBHzzVEWHqBhvS4VBWehrhnSm/v9ZEf8sHU+qc3hrnj5w71i
         AOeou8EnO/LCUaxef6ZuOE8pJ0wZamNe/IBbHM+8dxfNsttFE1i591vkDnbeag6v1DaH
         en/4B5/y4Cb4Whbgd29Xb6N+q2iRWazNhsXG6oGTn7veoPTwGBTYXdvtGDNDfLZ+fpok
         oFNsbMu/2c8448+R7DCVKISQe315MuF7w1ycuowFfXRw8OkkGCurlydK368YeBZ9B4KO
         eTZA==
X-Forwarded-Encrypted: i=1; AJvYcCUnRATseLv/fZuT41cJIgRZ2kazHKi/lvefuEZRrV4QQucoimu+9S8RH16BXtSqB1rmfVAjoaVtv7u67bVdUT9j@lists.infradead.org
X-Gm-Message-State: AOJu0YzrZoET2srFKMG5zJQyrFQWqvW5BT0arUhgJoT1UI+H4NzRg3Yu
	cW6n7tu5CbN11qPLdRFLEK9CSacMlTfOB0FPKBgCL93lR+aw96jzI7XXsPoBBlLKPQ==
X-Gm-Gg: AZuq6aLHzYdmj9EnkxphZ2gB7o/wZmTpiNV8PVJldZ/a2jHtzG9qLqtHFkBTvN1cOXv
	dwXvxBNYvXUZY7CBI5fHglmPYODZZu0ggfGPaZDxzklIbR7sT/2mnsZ/w73nhQnjXC03Trnk2uE
	9g5phg7/Ed7mvemZMyNVKc2hqHo2rjceKc9bzjn1REz3/tEIZNNi5KAk3ts8gPYNhQC+uts0ih2
	+CD3Ns808RdtV+PmagJEiuhJ3+A15fLdRbb4jaVjiJ9EF8ojEht484cs4GvrwVq1hkmuCMHM8+s
	oeJ+4bUACzo9uWoPgLhkJ7oJRdYT1j75lVb8dURJ/q4pqWKLiza6buph7erKNlYBA4tcvmu/ohs
	gbubViuMhe+WMBRd9MS40hd0Gcj3VpbU/PsLNaUG2zGVn5Xh8AB9BxHx4lbJSvC8YuHTR8WoUQu
	OMAZO4aK7BZn/SI7vwT53hRAGEy2pDtEnWrpNMnQX4Eb/EVqZWVA2ilLadBtU=
X-Received: by 2002:a17:903:1b2b:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2a80221cdf3mr2939255ad.6.1769161724232;
        Fri, 23 Jan 2026 01:48:44 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978d2sm15529995ad.52.2026.01.23.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:48:43 -0800 (PST)
Date: Fri, 23 Jan 2026 09:48:37 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, jgg@nvidia.com, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXND9YJTwm6om689@google.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_014846_577081_3B504FFC 
X-CRM114-Status: GOOD (  40.85  )
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

On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> Each smmu_domain now has an arm_smmu_invs that specifies the invalidation
> steps to perform after any change the IOPTEs. This includes supports for
> basic ASID/VMID, the special case for nesting, and ATC invalidations.
> 
> Introduce a new arm_smmu_domain_inv helper iterating smmu_domain->invs to
> convert the invalidation array to commands. Any invalidation request with
> no size specified means an entire flush over a range based one.
> 
> Take advantage of the sorted array to compatible batch operations together
> to the same SMMU. For instance, ATC invaliations for multiple SIDs can be
> pushed as a batch.
> 
> ATC invalidations must be completed before the driver disables ATS. Or the
> device is permitted to ignore any racing invalidation that would cause an
> SMMU timeout. The sequencing is done with a rwlock where holding the write
> side of the rwlock means that there are no outstanding ATC invalidations.
> If ATS is not used the rwlock is ignored, similar to the existing code.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   9 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 258 +++++++++++++++++++-
>  2 files changed, 254 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index f8dc96476c43..c3fee7f14480 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1086,6 +1086,15 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
>  int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  			    unsigned long iova, size_t size);
>  
> +void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
> +			       unsigned long iova, size_t size,
> +			       unsigned int granule, bool leaf);
> +
> +static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
> +{
> +	arm_smmu_domain_inv_range(smmu_domain, 0, 0, 0, false);
> +}
> +
>  void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
>  			      struct arm_smmu_cmdq *cmdq);
>  int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index fb45359680d2..6e1082e6d164 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2516,23 +2516,19 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
>  }
>  
> -static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
> -				     unsigned long iova, size_t size,
> -				     size_t granule,
> -				     struct arm_smmu_domain *smmu_domain)
> +static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
> +					  struct arm_smmu_cmdq_batch *cmds,
> +					  struct arm_smmu_cmdq_ent *cmd,
> +					  unsigned long iova, size_t size,
> +					  size_t granule, size_t pgsize)
>  {
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	unsigned long end = iova + size, num_pages = 0, tg = 0;
> +	unsigned long end = iova + size, num_pages = 0, tg = pgsize;
>  	size_t inv_range = granule;
> -	struct arm_smmu_cmdq_batch cmds;
>  
>  	if (!size)
>  		return;
>  
>  	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		/* Get the leaf page size */
> -		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
> -
>  		num_pages = size >> tg;
>  
>  		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
> @@ -2552,8 +2548,6 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
>  			num_pages++;
>  	}
>  
> -	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
> -
>  	while (iova < end) {
>  		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
>  			/*
> @@ -2581,9 +2575,26 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
>  		}
>  
>  		cmd->tlbi.addr = iova;
> -		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
> +		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
>  		iova += inv_range;
>  	}
> +}
> +
> +static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
> +				     unsigned long iova, size_t size,
> +				     size_t granule,
> +				     struct arm_smmu_domain *smmu_domain)
> +{
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct arm_smmu_cmdq_batch cmds;
> +	size_t pgsize;
> +
> +	/* Get the leaf page size */
> +	pgsize = __ffs(smmu_domain->domain.pgsize_bitmap);
> +
> +	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
> +	arm_smmu_cmdq_batch_add_range(smmu, &cmds, cmd, iova, size, granule,
> +				      pgsize);
>  	arm_smmu_cmdq_batch_submit(smmu, &cmds);
>  }
>  
> @@ -2639,6 +2650,193 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
>  	__arm_smmu_tlb_inv_range(&cmd, iova, size, granule, smmu_domain);
>  }
>  
> +static bool arm_smmu_inv_size_too_big(struct arm_smmu_device *smmu, size_t size,
> +				      size_t granule)
> +{
> +	size_t max_tlbi_ops;
> +
> +	/* 0 size means invalidate all */
> +	if (!size || size == SIZE_MAX)
> +		return true;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV)
> +		return false;
> +
> +	/*
> +	 * Borrowed from the MAX_TLBI_OPS in arch/arm64/include/asm/tlbflush.h,
> +	 * this is used as a threshold to replace "size_opcode" commands with a
> +	 * single "nsize_opcode" command, when SMMU doesn't implement the range
> +	 * invalidation feature, where there can be too many per-granule TLBIs,
> +	 * resulting in a soft lockup.
> +	 */
> +	max_tlbi_ops = 1 << (ilog2(granule) - 3);
> +	return size >= max_tlbi_ops * granule;
> +}
> +
> +/* Used by non INV_TYPE_ATS* invalidations */
> +static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> +				       struct arm_smmu_cmdq_batch *cmds,
> +				       struct arm_smmu_cmdq_ent *cmd,
> +				       unsigned long iova, size_t size,
> +				       unsigned int granule)
> +{
> +	if (arm_smmu_inv_size_too_big(inv->smmu, size, granule)) {
> +		cmd->opcode = inv->nsize_opcode;
> +		arm_smmu_cmdq_batch_add(inv->smmu, cmds, cmd);
> +		return;
> +	}
> +
> +	cmd->opcode = inv->size_opcode;
> +	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, iova, size, granule,
> +				      inv->pgsize);
> +}
> +
> +static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> +					   struct arm_smmu_inv *next)
> +{
> +	/* Changing smmu means changing command queue */
> +	if (cur->smmu != next->smmu)
> +		return true;
> +	/* The batch for S2 TLBI must be done before nested S1 ASIDs */
> +	if (cur->type != INV_TYPE_S2_VMID_S1_CLEAR &&
> +	    next->type == INV_TYPE_S2_VMID_S1_CLEAR)
> +		return true;
> +	/* ATS must be after a sync of the S1/S2 invalidations */
> +	if (!arm_smmu_inv_is_ats(cur) && arm_smmu_inv_is_ats(next))
> +		return true;
> +	return false;
> +}
> +
> +static void __arm_smmu_domain_inv_range(struct arm_smmu_invs *invs,
> +					unsigned long iova, size_t size,
> +					unsigned int granule, bool leaf)
> +{
> +	struct arm_smmu_cmdq_batch cmds = {};
> +	struct arm_smmu_inv *cur;
> +	struct arm_smmu_inv *end;
> +
> +	cur = invs->inv;
> +	end = cur + READ_ONCE(invs->num_invs);
> +	/* Skip any leading entry marked as a trash */
> +	for (; cur != end; cur++)
> +		if (refcount_read(&cur->users))
> +			break;
> +	while (cur != end) {
> +		struct arm_smmu_device *smmu = cur->smmu;
> +		struct arm_smmu_cmdq_ent cmd = {
> +			/*
> +			 * Pick size_opcode to run arm_smmu_get_cmdq(). This can
> +			 * be changed to nsize_opcode, which would result in the
> +			 * same CMDQ pointer.
> +			 */
> +			.opcode = cur->size_opcode,
> +		};
> +		struct arm_smmu_inv *next;
> +
> +		if (!cmds.num)
> +			arm_smmu_cmdq_batch_init(smmu, &cmds, &cmd);
> +
> +		switch (cur->type) {
> +		case INV_TYPE_S1_ASID:
> +			cmd.tlbi.asid = cur->id;
> +			cmd.tlbi.leaf = leaf;
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
> +						   granule);
> +			break;
> +		case INV_TYPE_S2_VMID:
> +			cmd.tlbi.vmid = cur->id;
> +			cmd.tlbi.leaf = leaf;
> +			arm_smmu_inv_to_cmdq_batch(cur, &cmds, &cmd, iova, size,
> +						   granule);
> +			break;
> +		case INV_TYPE_S2_VMID_S1_CLEAR:
> +			/* CMDQ_OP_TLBI_S12_VMALL already flushed S1 entries */
> +			if (arm_smmu_inv_size_too_big(cur->smmu, size, granule))
> +				continue;
> +			cmd.tlbi.vmid = cur->id;
> +			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			break;
> +		case INV_TYPE_ATS:
> +			arm_smmu_atc_inv_to_cmd(cur->ssid, iova, size, &cmd);
> +			cmd.atc.sid = cur->id;
> +			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			break;
> +		case INV_TYPE_ATS_FULL:
> +			arm_smmu_atc_inv_to_cmd(IOMMU_NO_PASID, 0, 0, &cmd);
> +			cmd.atc.sid = cur->id;
> +			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			break;
> +		default:
> +			WARN_ON_ONCE(1);
> +			continue;
> +		}
> +
> +		/* Skip any trash entry in-between */
> +		for (next = cur + 1; next != end; next++)
> +			if (refcount_read(&next->users))
> +				break;
> +
> +		if (cmds.num &&
> +		    (next == end || arm_smmu_invs_end_batch(cur, next))) {
> +			arm_smmu_cmdq_batch_submit(smmu, &cmds);
> +			cmds.num = 0;
> +		}
> +		cur = next;
> +	}
> +}
> +
> +void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
> +			       unsigned long iova, size_t size,
> +			       unsigned int granule, bool leaf)
> +{
> +	struct arm_smmu_invs *invs;
> +
> +	/*
> +	 * An invalidation request must follow some IOPTE change and then load
> +	 * an invalidation array. In the meantime, a domain attachment mutates
> +	 * the array and then stores an STE/CD asking SMMU HW to acquire those
> +	 * changed IOPTEs. In other word, these two are interdependent and can
> +	 * race.
> +	 *
> +	 * In a race, the RCU design (with its underlying memory barriers) can
> +	 * ensure the invalidation array to always get updated before loaded.
> +	 *
> +	 * smp_mb() is used here, paired with the smp_mb() following the array
> +	 * update in a concurrent attach, to ensure:
> +	 *  - HW sees the new IOPTEs if it walks after STE installation
> +	 *  - Invalidation thread sees the updated array with the new ASID.
> +	 *
> +	 *  [CPU0]                        | [CPU1]
> +	 *                                |
> +	 *  change IOPTEs and TLB flush:  |
> +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_new_domain_invs {
> +	 *    ...                         |   rcu_assign_pointer(new_invs);
> +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> +	 *    // load invalidation array  | }
> +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> +	 *                                |   STE = TTB0 // read new IOPTEs
> +	 */
> +	smp_mb();
> +
> +	rcu_read_lock();
> +	invs = rcu_dereference(smmu_domain->invs);
> +
> +	/*
> +	 * Avoid locking unless ATS is being used. No ATC invalidation can be
> +	 * going on after a domain is detached.
> +	 */
> +	if (invs->has_ats) {
> +		read_lock(&invs->rwlock);

Shouldn't these be read_lock_irqsave for all rwlock variants here? 
Invalidations might happen in IRQ context as well..

> +		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
> +		read_unlock(&invs->rwlock);
> +	} else {
> +		__arm_smmu_domain_inv_range(invs, iova, size, granule, leaf);
> +	}
> +
> +	rcu_read_unlock();
> +}
> +
>  static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
>  					 unsigned long iova, size_t granule,
>  					 void *cookie)
> @@ -3285,6 +3483,23 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
>  		return;
>  
>  	rcu_assign_pointer(*invst->invs_ptr, invst->new_invs);
> +	/*
> +	 * We are committed to updating the STE. Ensure the invalidation array
> +	 * is visible to concurrent map/unmap threads, and acquire any racing
> +	 * IOPTE updates.
> +	 *
> +	 *  [CPU0]                        | [CPU1]
> +	 *                                |
> +	 *  change IOPTEs and TLB flush:  |
> +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_new_domain_invs {
> +	 *    ...                         |   rcu_assign_pointer(new_invs);
> +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> +	 *    // load invalidation array  | }
> +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> +	 *                                |   STE = TTB0 // read new IOPTEs
> +	 */
> +	smp_mb();
>  	kfree_rcu(invst->old_invs, rcu);
>  }
>  
> @@ -3334,6 +3549,23 @@ arm_smmu_install_old_domain_invs(struct arm_smmu_attach_state *state)
>  		return;
>  
>  	rcu_assign_pointer(*invst->invs_ptr, new_invs);
> +	/*
> +	 * We are committed to updating the STE. Ensure the invalidation array
> +	 * is visible to concurrent map/unmap threads, and acquire any racing
> +	 * IOPTE updates.
> +	 *
> +	 *  [CPU0]                        | [CPU1]
> +	 *                                |
> +	 *  change IOPTEs and TLB flush:  |
> +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> +	 *    ...                         |   rcu_assign_pointer(new_invs);
> +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> +	 *    // load invalidation array  | }
> +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> +	 *                                |   STE = TTB0 // read new IOPTEs
> +	 */
> +	smp_mb();
>  	kfree_rcu(old_invs, rcu);
>  }
>

For INV_TYPE_S1_ASID, the new code loops and checks size_too_big 
via arm_smmu_inv_to_cmdq_batch. However, for INV_TYPE_ATS, it issues
a single command for the entire range. While this matches the current
driver, are we confident arm_smmu_atc_inv_to_cmd handles all massive
sizes correctly without needing a similar loop or "too big" fallback?

Thanks,
Praan

