Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DFEC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+65O/Mn9btfawvfMn+qubKzpEX/dBj5nAHgdBd6jOu0=; b=xYclzJ8acJfTqSx73VaiV2kip+
	12F4v1ZWKdAtFCm0VvupgeBLAmogF94Hqj8+4K6It7xXL4BZOlgTR1AROEv73rhtTG/2oPzk8BSec
	Sbx4UvlUKyuq7bs3lQY40rNAOpWvq1uX3PXSfAeqvte0SchscJA6rSDZ5YXBsrM/4RqdDwrSjjiVK
	OnmlqZvMwxqj14KsVokbC/FQumRG/Xz90MsATyujQcdmWAgBp6rrEVO39CHdisdi8kr9D25kVE+z2
	gYkw1iv4vTj//ZPMb91giA4N/48C925D00oICMDXeJGSKogPXJQ2tHbOMA3zjS3glG11NE+S7Fvj1
	pfThr/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aEo-000000072KZ-28gR;
	Mon, 07 Sep 2026 14:22:22 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aEk-000000072Jd-0nlN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:22:21 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so15189a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788790936; x=1789395736; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+65O/Mn9btfawvfMn+qubKzpEX/dBj5nAHgdBd6jOu0=;
        b=kzGrBI3UzrABIQjlpUeg5ib+ynF+8/QfSapNPs80aZHmAHWwVKlSgZKExhumrYcZyX
         lSRi7oppq8f5+yhMDa+aY/PQrLaqNR/cSv1OgfoPl5DpbYi29wX+olMzLYm0ix3oPzyc
         WnbdLNS1++8S16we41jUQEXW6qmHda/nsJDK1AOX9D945J90b6lKmoIz/kt288JZ0tmC
         5MChMcwDAmP9YBCilGrU5f2/meGEFTyeAYsNMuddT1doElc4qxu2MxxeEMUFcyij0vbt
         qgcyO4Uz2ws4A9xFpJ3AWFrbvizuo0e/W0jD6TZQf+xXaT50ex1BTR9CLdMAnogIGUu8
         ajuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790936; x=1789395736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+65O/Mn9btfawvfMn+qubKzpEX/dBj5nAHgdBd6jOu0=;
        b=i1mkOFs0gcBOwR5h6EyoRVmcky8NKCpuxppJ3GtCgG2qdKbOJ4sWNuw14eKo83e9u0
         MQfqKHxyp+o9/j1cK+ckFKcO6qh8f/akizymeJX/5Fhk5WNYOBlL8Q9BMM/KN06MfbL9
         MUW6HeHg8c1mQo4cUFvzY/1NmHeD5KQiKOJkCC44/xs6daBIX0Hn+slD2vA/b3QJpjPv
         lrOBQLdEYYVWO7RfgpuqpMQTPgTz7r1ddovZ8Tgn9Wq9toyGH3Edjbxvm+O61c1uXhqQ
         cvEyBNH49hbu2qkVZVJB1fR1ms/ZV4nCNeSchkeTmHAVwawIZCHzFHb1+wSgvfsF6qQF
         BgfA==
X-Forwarded-Encrypted: i=1; AKwUvByQKxRw8CTnwUgCflRksOevMj4r85+xmEIdJZ/u2r0M49XysxT6lQf1XOVTMBQj8XpYc1vQMYBpVBrRjlB+1oSV@lists.infradead.org
X-Gm-Message-State: AFuF++lwXSQrMpeiwwfR9svcGnVH5xSGwlMY8O4nJZv715YRXU6WsirB
	RbuhTDhvSkanHfAjt2Hy7LxZDVvxt/qxT3pdTxxLOMGrPyJSeaBU3W0+RS77+QlSrQ==
X-Gm-Gg: AYBFou3OmcufZiFDEP+syaZn7QUu1v0hcfy1FTKnYmUSnxGNkn2M7WnssdcvYGd4Aus
	iZ6P5bU0NaFohXxsUpRWE0RKzaMP40ND47XQIWBz+R/uma6qaVIfNcxkHq+cdahGikkPpvAeNRw
	C1qgeQVDGhXe0s4X3zdLlpd58PoRN3mANjg7JtU3QvXUk8CSbOKarJdrvIWYDjj4ty9s2zeg/p0
	GLJ+sPUcMjxMwpBk/FITOE27O5I11BziWyeFKxpmpaX93DUVEwRwLT5ERhX/eTfwbvoH15+0sDG
	PXGR27YPh0A3r4C8OIksD12grdvIDri8hlfW4kZ6Ras9cd7nzTOpkfUuM8qDGuIh+hy8wnGexFh
	DOChOovETb2YMslSHKjAehWpAoIe0+OmLWZ+lIWgGroJLR8DStdmzpKv8SkLGMkJJteA/dr49PP
	1e91dgVQq81b9nwh2TekZrHNhr6rCdvwuWyJYB64Rnjf/avEHrB4aPKLFVvS8CjfLacCIWgUnRF
	bjiUCmwMmd/OUfkhsVJpZdSpqAIVw==
X-Received: by 2002:aa7:d8d6:0:b0:6a6:6ded:b4b6 with SMTP id 4fb4d7f45d1cf-6a7f689d0femr62664a12.13.1788790935870;
        Mon, 07 Sep 2026 07:22:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26263cb042sm348714166b.47.2026.09.07.07.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:22:14 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:22:11 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/9] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
Message-ID: <ap7Ik0c5xQi647xy@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <3-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_072218_269725_5E04D047 
X-CRM114-Status: GOOD (  28.41  )
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

On Tue, Sep 01, 2026 at 02:49:52PM -0300, Jason Gunthorpe wrote:
> pgsize is a constant property of the domain, it is the base translation
> granule of the page table (4k, 16k, 64k) in log2.
> 
> Store it to the struct arm_smmu_domain based on how the page table was
> created.
> 
> Pass it around in the tlbi.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 29 ++++++++-----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 10 ++++---
>  3 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index a0c9078646fb55..7acb70d060ec4e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -345,6 +345,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
>  	 * ARM_SMMU_FEAT_RANGE_INV is present
>  	 */
>  	smmu_domain->domain.pgsize_bitmap = PAGE_SIZE;
> +	smmu_domain->tgsz_lg2 = PAGE_SHIFT;
>  	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
>  	smmu_domain->smmu = smmu;
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 03723bb00de412..6413eb4021ce22 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2463,14 +2463,13 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  static void arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  					  struct arm_smmu_cmdq_batch *cmds,
>  					  struct arm_smmu_cmd *cmd,
> -					  struct arm_smmu_tlbi *tlbi,
> -					  size_t pgsize)
> +					  struct arm_smmu_tlbi *tlbi)
>  {
>  	size_t inv_range = tlbi->iopte_size;
>  	unsigned long iova = tlbi->iova;
>  	unsigned long end = iova + tlbi->size;
>  	unsigned long num_pages = 0;
> -	unsigned int tg = pgsize;
> +	u8 tg = tlbi->tgsz_lg2;
>  	u64 orig_data0 = cmd->data[0];
>  	u8 ttl = 0, tg_enc = 0;
>  
> @@ -2609,12 +2608,12 @@ static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  	    (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RIL)) {
>  		if (!arm_smmu_cmdq_batch_add_ril(inv->smmu, cmds, cmd,
>  						 tlbi->iova, tlbi->size,
> -						 inv->pgsize))
> +						 tlbi->tgsz_lg2))
>  			goto full_inv;
>  		return;
>  	}
>  
> -	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi, inv->pgsize);
> +	arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi);
>  	return;
>  
>  full_inv:
> @@ -2722,6 +2721,7 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  			       unsigned int granule, bool leaf)
>  {
>  	struct arm_smmu_tlbi tlbi = {
> +		.tgsz_lg2 = smmu_domain->tgsz_lg2,
>  		.iova = iova,
>  		.size = size,
>  		.iopte_size = granule,
> @@ -2978,6 +2978,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
>  		return -ENOMEM;
>  
>  	smmu_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> +	smmu_domain->tgsz_lg2 = __ffs(pgtbl_cfg.pgsize_bitmap);
>  	smmu_domain->domain.geometry.aperture_end = (1UL << pgtbl_cfg.ias) - 1;
>  	smmu_domain->domain.geometry.force_aperture = true;
>  	if (enable_dirty && smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
> @@ -3217,15 +3218,13 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
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
> @@ -3277,28 +3276,24 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
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
> @@ -3310,7 +3305,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
>  	if (nesting) {
>  		if (!arm_smmu_master_build_inv(
>  			    master, INV_TYPE_S2_VMID_S1_CLEAR,
> -			    smmu_domain->s2_cfg.vmid, IOMMU_NO_PASID, 0))
> +			    smmu_domain->s2_cfg.vmid, IOMMU_NO_PASID))
>  			return NULL;
>  	}
>  
> @@ -3321,7 +3316,7 @@ arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
>  		 */
>  		if (!arm_smmu_master_build_inv(
>  			    master, nesting ? INV_TYPE_ATS_FULL : INV_TYPE_ATS,
> -			    master->streams[i].id, ssid, 0))
> +			    master->streams[i].id, ssid))
>  			return NULL;
>  	}
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index d3e81056f24afc..3e7f94339ab60e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -736,10 +736,9 @@ struct arm_smmu_inv {
>  	u8 size_opcode;
>  	u8 nsize_opcode;
>  	u32 id; /* ASID or VMID or SID */
> -	union {
> -		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
> -		u32 ssid; /* INV_TYPE_ATS */
> -	};
> +
> +	/* Only used by INV_TYPE_ATS */
> +	u32 ssid;
>  
>  	int users; /* users=0 to mark as a trash to be purged */
>  };
> @@ -810,6 +809,8 @@ struct arm_smmu_tlbi {
>  	size_t size;
>  	/* page or block size of the leaf iopte */
>  	unsigned int iopte_size;
> +	/* Base Translation Granule of the page table */
> +	u8 tgsz_lg2;
>  	bool has_cont;
>  	bool leaf_only;
>  };
> @@ -1060,6 +1061,7 @@ struct arm_smmu_domain {
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

