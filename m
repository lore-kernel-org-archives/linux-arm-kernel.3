Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0821C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2816w4UPu3pZtKRnEULSS/SL+Ir3MGZTzZ7WxHZ3JYQ=; b=X+GmAhpPKgcaJGUG1AYVgf/rEP
	jkjPMNeoTVjhrx81zbrHnClCtbFfW98+X2qqR7o6JIZT5NKs9TNiWPXdSzd5as4orWHllI1jcIXTa
	yXZpD7fz9yZvuq18XHzoQEci3mSlgzxVJ/RF4Cd+BOq5MCRJyCvZOsjFrSLpMkerqiMgJ9mS2PSV0
	mqWNDNxDkT/B/7tC3e83/Ge39ZrV/4JrbylgqZdcvJeMT/DyDU9CHJyd7ZatOiiSJQv7Xb4uYHMJE
	46P/BgcHyE6TH1LKzMAj1hCKNV7AZ5vlI5vGGQmyW/jXDoYCVsh9/ev9htL06eZR2tDMnj4yw0f3G
	pWwg7uyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62MM-00000002oxu-050E;
	Mon, 14 Sep 2026 08:48:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62MJ-00000002owq-3ArO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:48:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C07861570;
	Mon, 14 Sep 2026 01:48:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98EC83F7B4;
	Mon, 14 Sep 2026 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789375693; bh=QD8aKpgaeEe3OYPjtQLqz89bXKDf0jtcGOEjaXi3TIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocYImIraJMKbAMrIqRBZACQ7eYVodGODAW4gSLAXj7U35z7kS6Vgim7MzhaaC31Nh
	 ntZQ8FmJVq2tIgFT+vMW0py8J45ahDqhRKqaDZSMuN4JJ6ejClHRoLafId73JDHHkK
	 Qtj/1vwzBqWYQi3ZTm2nW0uqMB9KIQfRQx04oKbA=
Date: Mon, 14 Sep 2026 09:48:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 1/4] KVM: arm64: pgtable: Add Stage-2 unmap without TLBI
 primitive
Message-ID: <aqe0w0myu7iIT_tR@J2N7QTR9R3>
References: <20260912104834.3093878-1-maz@kernel.org>
 <20260912104834.3093878-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912104834.3093878-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014815_874502_5139CBC2 
X-CRM114-Status: GOOD (  34.92  )
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

On Sat, Sep 12, 2026 at 11:48:31AM +0100, Marc Zyngier wrote:
> kvm_pgtable_stage2_unmap() iterates over a range, unmapping whatever is
> within the range, and always guarantees that that the corresponding TLBs
> are invalidated when the function returns.
> 
> While this is safe, it means that iterating over empty range on a system
> that supports range invalidation results in a TLBI per largest block
> mapping size (1GB, 32MB or 512MB, depending on the base granule size).
> 
> This can be pretty expensive in situation where the whole address space
> is being torn down, as it happens with NV (where S2 MMUs are recycled
> regularly), and it would be more efficient to elide the per-subrange
> TLBIs to solely rely on a VMID-wide TLBI.
> 
> For this, provide a kvm_pgtable_stage2_unmap_notlbi() helper that elides
> all TLBIs, and relies on the caller to do the work.
> 
> Note that for  pKVM case, no additional helper is provided, and we
> fallback on the TLBI-aware version.

Just to check: I assume that before this is called, we have somehow
ensured that the S2 being torn down isn't live on any PE, and cannot
become live on any PE? I asssume that's a natural part of S2 lifetime
management, but I couldn't figure that out from a quick skim of the hyp
pgtable code.

Assuming so, it might be worth mentioning that in the commit message,
since it explains why it's safe to invalidate *after* intermediate
tables are freed by stage2_unmap_walker() calling mm_ops->put_page(). We
might also be able to add some test/assertion in
kvm_pgtable_stage2_unmap_notlbi() to ensure it is not called where the
tables could be live on a PE.

Otherwise, this all looks sensible to me!

Mark.

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 17 +++++++++++++
>  arch/arm64/include/asm/kvm_pkvm.h    |  1 +
>  arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++-------
>  arch/arm64/kvm/pkvm.c                |  2 ++
>  4 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb6..c370196888d1d 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -318,6 +318,8 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
>   * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
>   *					without Cache maintenance
>   *					operations required.
> + * @KVM_PGTABLE_WALK_SKIP_S2_TLBI:	Visit and update table entries
> + *					without Stage-2 TLB invalidation.
>   */
>  enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_LEAF			= BIT(0),
> @@ -327,6 +329,7 @@ enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
>  	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
>  	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
> +	KVM_PGTABLE_WALK_SKIP_S2_TLBI		= BIT(7),
>  };
>  
>  struct kvm_pgtable_visit_ctx {
> @@ -717,6 +720,20 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
>   */
>  int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
>  
> +/**
> + * kvm_pgtable_stage2_unmap_notlbi() - Remove a mapping from a guest stage-2 page-table
> + *				       without TLB invalidation.
> + * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
> + * @addr:	Intermediate physical address from which to remove the mapping.
> + * @size:	Size of the mapping.
> + *
> + * Same as kvm_pgtable_stage2_unmap(), but does not invalidate the
> + * TLBs, which is the responsibility of the caller. Use with caution!
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int kvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size);
> +
>  /**
>   * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
>   *                                  without TLB invalidation.
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index beea00e693a0a..273013c98ff17 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -214,6 +214,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phy
>  			    enum kvm_pgtable_prot prot, void *mc,
>  			    enum kvm_pgtable_walk_flags flags);
>  int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
> +int pkvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size);
>  int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
>  int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
>  bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b74dd5ce1efd3..6603fc236daa2 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -29,6 +29,11 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
>  	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
>  }
>  
> +static bool kvm_pgtable_walk_skip_s2_tlbi(const struct kvm_pgtable_visit_ctx *ctx)
> +{
> +	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_S2_TLBI);
> +}
> +
>  static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
>  {
>  	u64 granule = kvm_granule_size(ctx->level);
> @@ -905,12 +910,14 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (kvm_pte_valid(ctx->old)) {
>  		kvm_clear_pte(ctx->ptep);
>  
> -		if (kvm_pte_table(ctx->old, ctx->level)) {
> -			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
> -				     TLBI_TTL_UNKNOWN);
> -		} else if (!stage2_unmap_defer_tlb_flush(pgt)) {
> -			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
> -				     ctx->level);
> +		if (!kvm_pgtable_walk_skip_s2_tlbi(ctx)) {
> +			if (kvm_pte_table(ctx->old, ctx->level)) {
> +				kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
> +					     TLBI_TTL_UNKNOWN);
> +			} else if (!stage2_unmap_defer_tlb_flush(pgt)) {
> +				kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
> +					     ctx->level);
> +			}
>  		}
>  	}
>  
> @@ -1195,23 +1202,36 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	return 0;
>  }
>  
> -int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +static int __kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt,
> +				      enum kvm_pgtable_walk_flags flags,
> +				      u64 addr, u64 size)
>  {
>  	int ret;
>  	struct kvm_pgtable_walker walker = {
>  		.cb	= stage2_unmap_walker,
>  		.arg	= pgt,
> -		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
> +		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST | flags,
>  	};
>  
>  	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
> -	if (stage2_unmap_defer_tlb_flush(pgt))
> +	if (stage2_unmap_defer_tlb_flush(pgt) &&
> +	    !(flags & KVM_PGTABLE_WALK_SKIP_S2_TLBI))
>  		/* Perform the deferred TLB invalidations */
>  		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
>  
>  	return ret;
>  }
>  
> +int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +{
> +	return __kvm_pgtable_stage2_unmap(pgt, 0, addr, size);
> +}
> +
> +int kvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +{
> +	return __kvm_pgtable_stage2_unmap(pgt, KVM_PGTABLE_WALK_SKIP_S2_TLBI, addr, size);
> +}
> +
>  struct stage2_attr_data {
>  	kvm_pte_t			attr_set;
>  	kvm_pte_t			attr_clr;
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8e4c6e4bec123..ec151005fbe4d 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -488,6 +488,8 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
>  
> +int pkvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size) __alias(pkvm_pgtable_stage2_unmap);
> +
>  int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> -- 
> 2.47.3
> 
> 

