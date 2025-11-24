Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625C5CFD356
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWQ3CPlMU8CD7FIgTWhT1gTiOnJ1WAl/bUjQU4VDYKU=; b=nEoeqJSFi8z8Cst2OgTKQtFs4E
	WAPiZuPKLdXGSxYbWTOhrv7EPS1AP5W9FWPfzd9sODqproww2NbUmv8ukh67CyWZuDSL3nsJM9RMC
	kyBJbsccCcizEjV5eDTWOWScHopb+ch0tvTiLZQse3ALRsjE/of7whoOsPic9zWtvlp0C2z+4pWmJ
	2t4QetS2I7EuQT61ylsvzGvqS59gjMT6w3ejuxlDxR1wKEzLIRcnaAY6/nSAxxGlQwhwzRSveulPO
	ZYsFUGuz1H1nOzjr5/KCpUfzAf8TgkILgrkDkgidQ9O4TKbSNNl1shzeR7izRnUFHdwftw2NueDiF
	pRqCenNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeLG-0000000CM9h-2EnV;
	Mon, 24 Nov 2025 21:43:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeLE-0000000CM8V-0Vq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B19084039F;
	Mon, 24 Nov 2025 21:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DDBC16AAE;
	Mon, 24 Nov 2025 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764020603;
	bh=/HI/3G8PZC5PSdjygFMc0+oN1va7/g8zNAfvPSP/dts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJreQDV4O5WgiuFKyz16QwBC9D04BFi5S+dduKtGkrzzBL5PdS7+nYlFJv8mL0qnv
	 /mhRPBMiunVTxrYDzNzywHqHQ+sJ/134kafQvqQtSjCLwiV0gCFUT89V+Chqd5kN4u
	 I5ZAnAyBqzKll4okCkgijzOAQvOrMaraZzYQnbS8OfxGAfT9MkgOD8hMnwWHkJGqba
	 gmIDYikgtmefym5WFxNL5UNmBBuXfQBY/AfO4f1kXQ5qITDYL7O0YJlVCCntQVORSi
	 RP5OnA6NCt7CrDcs3IYDOmsXnkgfiNr0HNnxJ2W/tWknRsBa97yof2m3deGwWs8+Tb
	 /QlVdXnWVyNuQ==
Date: Mon, 24 Nov 2025 21:43:18 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <aSTRdltJpMeFLDN8@willie-the-truck>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <ebf35fa1b2025be736475950503f0dc0612371f4.1762588839.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebf35fa1b2025be736475950503f0dc0612371f4.1762588839.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_134324_228454_E1B74519 
X-CRM114-Status: GOOD (  46.48  )
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

On Sat, Nov 08, 2025 at 12:08:06AM -0800, Nicolin Chen wrote:
> Update the invs array with the invalidations required by each domain type
> during attachment operations.
> 
> Only an SVA domain or a paging domain will have an invs array:
>  a. SVA domain will add an INV_TYPE_S1_ASID per SMMU and an INV_TYPE_ATS
>     per SID
> 
>  b. Non-nesting-parent paging domain with no ATS-enabled master will add
>     a single INV_TYPE_S1_ASID or INV_TYPE_S2_VMID per SMMU
> 
>  c. Non-nesting-parent paging domain with ATS-enabled master(s) will do
>     (b) and add an INV_TYPE_ATS per SID
> 
>  d. Nesting-parent paging domain will add an INV_TYPE_S2_VMID followed by
>     an INV_TYPE_S2_VMID_S1_CLEAR per vSMMU. For an ATS-enabled master, it
>     will add an INV_TYPE_ATS_FULL per SID
> 
>  Note that case #d prepares for a future implementation of VMID allocation
>  which requires a followup series for S2 domain sharing. So when a nesting
>  parent domain is attached through a vSMMU instance using a nested domain.
>  VMID will be allocated per vSMMU instance v.s. currectly per S2 domain.
> 
> The per-domain invalidation is not needed until the domain is attached to
> a master (when it starts to possibly use TLB). This will make it possible
> to attach the domain to multiple SMMUs and avoid unnecessary invalidation
> overhead during teardown if no STEs/CDs refer to the domain. It also means
> that when the last device is detached, the old domain must flush its ASID
> or VMID, since any new iommu_unmap() call would not trigger invalidations
> given an empty domain->invs array.
> 
> Introduce some arm_smmu_invs helper functions for building scratch arrays,
> preparing and installing old/new domain's invalidation arrays.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  17 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 242 +++++++++++++++++++-
>  2 files changed, 258 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 7b81a82c0dfe4..5899429a514ab 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1094,6 +1094,21 @@ static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
>  	       IOMMU_FWSPEC_PCI_RC_CANWBS;
>  }
>  
> +/**
> + * struct arm_smmu_inv_state - Per-domain invalidation array state
> + * @invs_ptr: points to the domain->invs (unwinding nesting/etc.) or is NULL if
> + *            no change should be made
> + * @old_invs: the original invs array
> + * @new_invs: for new domain, this is the new invs array to update domin->invs;

nit: typo "domin"

> + *            for old domain, this is the master->build_invs to pass in as the
> + *            to_unref argument to an arm_smmu_invs_unref() call
> + */
> +struct arm_smmu_inv_state {
> +	struct arm_smmu_invs __rcu **invs_ptr;
> +	struct arm_smmu_invs *old_invs;
> +	struct arm_smmu_invs *new_invs;
> +};
> +
>  struct arm_smmu_attach_state {
>  	/* Inputs */
>  	struct iommu_domain *old_domain;
> @@ -1103,6 +1118,8 @@ struct arm_smmu_attach_state {
>  	ioasid_t ssid;
>  	/* Resulting state */
>  	struct arm_smmu_vmaster *vmaster;
> +	struct arm_smmu_inv_state old_domain_invst;
> +	struct arm_smmu_inv_state new_domain_invst;
>  	bool ats_enabled;
>  };
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 26b8492a13f20..22875a951488d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3058,6 +3058,97 @@ static void arm_smmu_disable_iopf(struct arm_smmu_master *master,
>  		iopf_queue_remove_device(master->smmu->evtq.iopf, master->dev);
>  }
>  
> +/*
> + * Use the preallocated scratch array at master->build_invs, to build a to_merge
> + * or to_unref array, to pass into a following arm_smmu_invs_merge/unref() call.
> + *
> + * Do not free the returned invs array. It is reused, and will be overwritten by
> + * the next arm_smmu_master_build_invs() call.
> + */
> +static struct arm_smmu_invs *
> +arm_smmu_master_build_invs(struct arm_smmu_master *master, bool ats_enabled,
> +			   ioasid_t ssid, struct arm_smmu_domain *smmu_domain)
> +{
> +	const bool e2h = master->smmu->features & ARM_SMMU_FEAT_E2H;
> +	struct arm_smmu_invs *build_invs = master->build_invs;
> +	const bool nesting = smmu_domain->nest_parent;
> +	struct arm_smmu_inv *cur;
> +
> +	iommu_group_mutex_assert(master->dev);
> +
> +	cur = build_invs->inv;
> +
> +	switch (smmu_domain->stage) {
> +	case ARM_SMMU_DOMAIN_SVA:
> +	case ARM_SMMU_DOMAIN_S1:
> +		*cur = (struct arm_smmu_inv){
> +			.smmu = master->smmu,
> +			.type = INV_TYPE_S1_ASID,
> +			.id = smmu_domain->cd.asid,
> +			.size_opcode = e2h ? CMDQ_OP_TLBI_EL2_VA :
> +					     CMDQ_OP_TLBI_NH_VA,
> +			.nsize_opcode = e2h ? CMDQ_OP_TLBI_EL2_ASID :
> +					      CMDQ_OP_TLBI_NH_ASID
> +		};
> +		break;
> +	case ARM_SMMU_DOMAIN_S2:
> +		*cur = (struct arm_smmu_inv){
> +			.smmu = master->smmu,
> +			.type = INV_TYPE_S2_VMID,
> +			.id = smmu_domain->s2_cfg.vmid,
> +			.size_opcode = CMDQ_OP_TLBI_S2_IPA,
> +			.nsize_opcode = CMDQ_OP_TLBI_S12_VMALL,
> +		};
> +		break;

Having a helper to add an invalidation command would make this a little
more compact and you could also check against the size of the array.

> +	default:
> +		WARN_ON(true);
> +		return NULL;
> +	}
> +
> +	/* Range-based invalidation requires the leaf pgsize for calculation */
> +	if (master->smmu->features & ARM_SMMU_FEAT_RANGE_INV)
> +		cur->pgsize = __ffs(smmu_domain->domain.pgsize_bitmap);
> +	cur++;
> +
> +	/* All the nested S1 ASIDs have to be flushed when S2 parent changes */
> +	if (nesting) {
> +		*cur = (struct arm_smmu_inv){
> +			.smmu = master->smmu,
> +			.type = INV_TYPE_S2_VMID_S1_CLEAR,
> +			.id = smmu_domain->s2_cfg.vmid,
> +			.size_opcode = CMDQ_OP_TLBI_NH_ALL,
> +			.nsize_opcode = CMDQ_OP_TLBI_NH_ALL,
> +		};
> +		cur++;
> +	}
> +
> +	if (ats_enabled) {
> +		size_t i;
> +
> +		for (i = 0; i < master->num_streams; i++) {
> +			/*
> +			 * If an S2 used as a nesting parent is changed we have
> +			 * no option but to completely flush the ATC.
> +			 */
> +			*cur = (struct arm_smmu_inv){
> +				.smmu = master->smmu,
> +				.type = nesting ? INV_TYPE_ATS_FULL :
> +						  INV_TYPE_ATS,
> +				.id = master->streams[i].id,
> +				.ssid = ssid,
> +				.size_opcode = CMDQ_OP_ATC_INV,
> +				.nsize_opcode = CMDQ_OP_ATC_INV,
> +			};
> +			cur++;
> +		}
> +	}
> +
> +	/* Note this build_invs must have been sorted */
> +
> +	build_invs->num_invs = cur - build_invs->inv;
> +	return build_invs;
> +}
> +
>  static void arm_smmu_remove_master_domain(struct arm_smmu_master *master,
>  					  struct iommu_domain *domain,
>  					  ioasid_t ssid)
> @@ -3087,6 +3178,146 @@ static void arm_smmu_remove_master_domain(struct arm_smmu_master *master,
>  	kfree(master_domain);
>  }
>  
> +/*
> + * During attachment, the updates of the two domain->invs arrays are sequenced:
> + *  1. new domain updates its invs array, merging master->build_invs
> + *  2. new domain starts to include the master during its invalidation
> + *  3. master updates its STE switching from the old domain to the new domain
> + *  4. old domain still includes the master during its invalidation
> + *  5. old domain updates its invs array, unreferencing master->build_invs
> + *
> + * For 1 and 5, prepare the two updated arrays in advance, handling any changes
> + * that can possibly failure. So the actual update of either 1 or 5 won't fail.
> + * arm_smmu_asid_lock ensures that the old invs in the domains are intact while
> + * we are sequencing to update them.
> + */
> +static int arm_smmu_attach_prepare_invs(struct arm_smmu_attach_state *state,
> +					struct arm_smmu_domain *new_smmu_domain)
> +{
> +	struct arm_smmu_domain *old_smmu_domain =
> +		to_smmu_domain_devices(state->old_domain);
> +	struct arm_smmu_master *master = state->master;
> +	ioasid_t ssid = state->ssid;
> +
> +	/* A re-attach case doesn't need to update invs array */
> +	if (new_smmu_domain == old_smmu_domain)
> +		return 0;
> +
> +	/*
> +	 * At this point a NULL domain indicates the domain doesn't use the
> +	 * IOTLB, see to_smmu_domain_devices().
> +	 */
> +	if (new_smmu_domain) {
> +		struct arm_smmu_inv_state *invst = &state->new_domain_invst;
> +		struct arm_smmu_invs *build_invs;
> +
> +		invst->invs_ptr = &new_smmu_domain->invs;
> +		invst->old_invs = rcu_dereference_protected(
> +			new_smmu_domain->invs,
> +			lockdep_is_held(&arm_smmu_asid_lock));
> +		build_invs = arm_smmu_master_build_invs(
> +			master, state->ats_enabled, ssid, new_smmu_domain);
> +		if (!build_invs)
> +			return -EINVAL;
> +
> +		invst->new_invs =
> +			arm_smmu_invs_merge(invst->old_invs, build_invs);
> +		if (IS_ERR(invst->new_invs))
> +			return PTR_ERR(invst->new_invs);
> +	}
> +
> +	if (old_smmu_domain) {
> +		struct arm_smmu_inv_state *invst = &state->old_domain_invst;
> +
> +		invst->invs_ptr = &old_smmu_domain->invs;
> +		invst->old_invs = rcu_dereference_protected(
> +			old_smmu_domain->invs,
> +			lockdep_is_held(&arm_smmu_asid_lock));
> +		/* For old_smmu_domain, new_invs points to master->build_invs */
> +		invst->new_invs = arm_smmu_master_build_invs(
> +			master, master->ats_enabled, ssid, old_smmu_domain);
> +	}
> +
> +	return 0;
> +}
> +
> +/* Must be installed before arm_smmu_install_ste_for_dev() */
> +static void
> +arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
> +{
> +	struct arm_smmu_inv_state *invst = &state->new_domain_invst;
> +
> +	if (!invst->invs_ptr)
> +		return;
> +
> +	rcu_assign_pointer(*invst->invs_ptr, invst->new_invs);
> +	/*
> +	 * We are committed to updating the STE. Ensure the invalidation array
> +	 * is visable to concurrent map/unmap threads, and acquire any racying
> +	 * IOPTE updates.
> +	 */
> +	smp_mb();

Sorry, but the comment hasn't really helped me here. We're ordering the
publishing of the invalidation array above before ... what?

> +	kfree_rcu(invst->old_invs, rcu);
> +}
> +
> +/*
> + * When an array entry's users count reaches zero, it means the ASID/VMID is no
> + * longer being invalidated by map/unmap and must be cleaned. The rule is that
> + * all ASIDs/VMIDs not in an invalidation array are left cleared in the IOTLB.
> + */
> +static void arm_smmu_invs_flush_iotlb_tags(struct arm_smmu_inv *inv)
> +{
> +	struct arm_smmu_cmdq_ent cmd = {};
> +
> +	switch (inv->type) {
> +	case INV_TYPE_S1_ASID:
> +		cmd.tlbi.asid = inv->id;
> +		break;
> +	case INV_TYPE_S2_VMID:
> +		/* S2_VMID using nsize_opcode covers S2_VMID_S1_CLEAR */
> +		cmd.tlbi.vmid = inv->id;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	cmd.opcode = inv->nsize_opcode;
> +	arm_smmu_cmdq_issue_cmd_with_sync(inv->smmu, &cmd);
> +}
> +
> +/* Should be installed after arm_smmu_install_ste_for_dev() */
> +static void
> +arm_smmu_install_old_domain_invs(struct arm_smmu_attach_state *state)
> +{
> +	struct arm_smmu_inv_state *invst = &state->old_domain_invst;
> +	struct arm_smmu_invs *old_invs = invst->old_invs;
> +	struct arm_smmu_invs *new_invs;
> +	size_t num_trashes;
> +
> +	lockdep_assert_held(&arm_smmu_asid_lock);
> +
> +	if (!invst->invs_ptr)
> +		return;
> +
> +	num_trashes = arm_smmu_invs_unref(old_invs, invst->new_invs,
> +					  arm_smmu_invs_flush_iotlb_tags);
> +	if (!num_trashes)
> +		return;
> +
> +	new_invs = arm_smmu_invs_purge(old_invs, num_trashes);
> +	if (!new_invs)
> +		return;
> +
> +	rcu_assign_pointer(*invst->invs_ptr, new_invs);
> +	/*
> +	 * We are committed to updating the STE. Ensure the invalidation array
> +	 * is visable to concurrent map/unmap threads, and acquire any racying
> +	 * IOPTE updates.
> +	 */
> +	smp_mb();

(same here)

Will

