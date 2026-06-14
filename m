Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB996CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcEhX+rJWzaDJiKwLbBoUnFKtEJviA+Ya6EcoB13VQM=; b=Xw2ELLxVdWalSKjNNKe58ZkHkY
	4htywRVW0pd/mDDPv+rb1lyBwEf3iGf3/+s1er9RsDUChfI1b/zboIWysvP6d62jSiW8MMQ53q8HZ
	BHcQDOQCz9MI1Dz+1WSnT3jVCIuQsE/FjZqcFXGl/DHfC48j8pkzCDcckqTpqeAqpmoxg68mo7u14
	eg3Ez7qo1wqfDZ15gqbS0Ifl6B6cOkRIgRDc45wMCkjG86uSM5NSekbVNGn4kGYTXS2OF3c6DRC09
	b97Ekvi6KOSGMsxiAwO83cViE5lkpDWIELBDcXqLipyUv5PIQ6RoQfeLHazIccu5PaQhV97HvRlw1
	C7NEGClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYie3-0000000CsYm-0DU2;
	Sun, 14 Jun 2026 11:04:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYie2-0000000CsYc-1r3X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 11:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEAAC43D52;
	Sun, 14 Jun 2026 11:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C512E1F000E9;
	Sun, 14 Jun 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781435089;
	bh=KcEhX+rJWzaDJiKwLbBoUnFKtEJviA+Ya6EcoB13VQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EOCKobcJTk7KF8RXwYtWWd8sqaBkUthCjhT7B99/Yw0+WH2Xzc3EQbhGQVKi0HHzM
	 3As3nJKvYNyvQJmA7ezXhgyJDqLwEZr+4jEoL3SyD5iwKBkam5QhkkajN4gezXS3RY
	 gdwO/3+S6GaeLeHRX66UoTIQOPxzA37OiKXUT8nUMLHXWwAhPGTwV0nRFKeAMDg9l7
	 HayVvCwSSkGf0IAVODb+jW8xRel9vGzV1fhl8QP2eSsNn6dAdxU9ic0GAD9S5K97AM
	 o2n1ZqxlK9VEjqKILPm9cpD7OgQyFQOEF0Ch/PcA024GLCPXqgselcoJ2xmMyLKEBd
	 XGmlJaOzAtOGg==
Date: Sun, 14 Jun 2026 12:04:44 +0100
From: Will Deacon <will@kernel.org>
To: Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ai6KzFgfMAxqplcr@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523134710.3827956-1-linu.cherian@arm.com>
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

On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> There are 3 variants of tlb flush that invalidate user mappings:
> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> would previously unconditionally broadcast their tlbis to all cpus in
> the inner shareable domain.
> 
> But this is a waste of effort if we can prove that the mm for which we
> are flushing the mappings has only ever been active on the local cpu. In
> that case, it is safe to avoid the broadcast and simply invalidate the
> current cpu.
> 
> So let's track in mm_context_t::active_cpu either the mm has never been
> active on any cpu, has been active on more than 1 cpu, or has been
> active on precisely 1 cpu - and in that case, which one. We update this
> when switching context, being careful to ensure that it gets updated
> *before* installing the mm's pgtables. On the reader side, we ensure we
> read *after* the previous write(s) to the pgtable(s) that necessitated
> the tlb flush have completed. This guarrantees that if a cpu that is
> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> entry cannot have been seen by any other cpu and we can flush only the
> local cpu.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
> Changelog from RFC v1:
> - Adapted for v7.1 flush tlb API changes
>   No changes in core logic
> - Collected Rb and Tb tags
> - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
>   hence retained dsb(ishst) in flush_tlb_user_pre	
> 
> 
> Testing with 7.1-rc4 :
> +-----------------------+---------------------------------------------------+-------------+
> | Benchmark             | Result Class                                      |  Improvement|  
> +=======================+===================================================+=============+
> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> +-----------------------+---------------------------------------------------+-------------+
> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> +-----------------------+---------------------------------------------------+-------------+

I think we need a much more comprehensive set of benchmarks before we can
begin to consider a change like this.

>  arch/arm64/include/asm/mmu.h         |  12 +++
>  arch/arm64/include/asm/mmu_context.h |   2 +
>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
>  arch/arm64/mm/context.c              |  30 ++++++-
>  4 files changed, 141 insertions(+), 30 deletions(-)

Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
even if you can provide some more compelling numbers.

> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
> +{
> +	unsigned int self, active;
> +	bool local;
> +
> +	migrate_disable();
> +
> +	if (flags & TLBF_NOBROADCAST) {
> +		dsb(nshst);
> +		return true;
> +	}

Why does the NOBROADCAST case need migration disabled? It didn't before...

> +
> +	self = smp_processor_id();
> +
> +	/*
> +	 * The load of mm->context.active_cpu must not be reordered before the
> +	 * store to the pgtable that necessitated this flush. This ensures that
> +	 * if the value read is our cpu id, then no other cpu can have seen the
> +	 * old pgtable value and therefore does not need this old value to be
> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
> +	 * needed to make the pgtable updates visible to the walker, to a
> +	 * dsb(ish) by default. So speculatively load without a barrier and if
> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
> +	 */
> +	active = READ_ONCE(mm->context.active_cpu);
> +	if (active == self) {
> +		dsb(ish);
> +		active = READ_ONCE(mm->context.active_cpu);
> +	} else {
> +		dsb(ishst);
> +	}

Why can't you just do:

	dsb(ishst);
	active = READ_ONCE(mm->context.active_cpu);

?

> +
> +	local = active == self;
> +	if (!local)
> +		migrate_enable();
> +
> +	return local;
> +}
> +
> +static inline void flush_tlb_user_post(bool local)
> +{
> +	if (local)
> +		migrate_enable();
> +}

I was under the impression that disabling/enabling migration was an
expensive thing to do, so I'd really want to see some more numbers to
justify this (including from inside a VM) and allow us to consider the
trade-offs properly. It's also not at all clear to me that it's safe
from such a low-level TLB invalidation helper.

> +
>  /*
>   *	TLB Invalidation
>   *	================
> @@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
>  static inline void flush_tlb_mm(struct mm_struct *mm)
>  {
>  	unsigned long asid;
> +	bool local;
>  
> -	dsb(ishst);
> +	local = flush_tlb_user_pre(mm, TLBF_NONE);
>  	asid = __TLBI_VADDR(0, ASID(mm));
> -	__tlbi(aside1is, asid);
> -	__tlbi_user(aside1is, asid);
> -	__tlbi_sync_s1ish(mm);
> +	if (local) {
> +		__tlbi(aside1, asid);
> +		__tlbi_user(aside1, asid);
> +		dsb(nsh);
> +	} else {
> +		__tlbi(aside1is, asid);
> +		__tlbi_user(aside1is, asid);
> +		__tlbi_sync_s1ish(mm);
> +	}
> +	flush_tlb_user_post(local);

I think you've changed this since Ryan's original patch, but why are you
only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
the erratum workaround when running as a VM if the vCPU is migrated?

> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 0f4a28b87469..f34ed78393e0 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -214,9 +214,10 @@ static u64 new_context(struct mm_struct *mm)
>  
>  void check_and_switch_context(struct mm_struct *mm)
>  {
> -	unsigned long flags;
> -	unsigned int cpu;
> +	unsigned int cpu = smp_processor_id();
>  	u64 asid, old_active_asid;
> +	unsigned int active;
> +	unsigned long flags;
>  
>  	if (system_supports_cnp())
>  		cpu_set_reserved_ttbr0();
> @@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
>  		atomic64_set(&mm->context.id, asid);
>  	}
>  
> -	cpu = smp_processor_id();
>  	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
>  		local_flush_tlb_all();
>  
> @@ -262,6 +262,30 @@ void check_and_switch_context(struct mm_struct *mm)
>  
>  	arm64_apply_bp_hardening();
>  
> +	/*
> +	 * Update mm->context.active_cpu in such a manner that we avoid cmpxchg
> +	 * and dsb unless we definitely need it. If initially ACTIVE_CPU_NONE
> +	 * then we are the first cpu to run so set it to our id. If initially
> +	 * any id other than ours, we are the second cpu to run so set it to
> +	 * ACTIVE_CPU_MULTIPLE. If we update the value then we must issue
> +	 * dsb(ishst) to ensure stores to mm->context.active_cpu are ordered
> +	 * against the TTBR0 write in cpu_switch_mm()/uaccess_enable(); the
> +	 * store must be visible to another cpu before this cpu could have
> +	 * populated any TLB entries based on the pgtables that will be
> +	 * installed.
> +	 */
> +	active = READ_ONCE(mm->context.active_cpu);
> +	if (active != cpu && active != ACTIVE_CPU_MULTIPLE) {
> +		if (active == ACTIVE_CPU_NONE)
> +			active = cmpxchg_relaxed(&mm->context.active_cpu,
> +						 ACTIVE_CPU_NONE, cpu);
> +
> +		if (active != ACTIVE_CPU_NONE)
> +			WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_MULTIPLE);
> +
> +		dsb(ishst);
> +	}
> +

Can you simplify the 'if' condition here?

	if (active == ACTIVE_CPU_NONE) {
		if (!try_cmpxchg_relaxed(...))
			WRITE_ONCE(...);

		dsb(ishst);
	}

(as an aside, maybe we should implement arch_try_cmpxchg{,_relaxed} so
 we could drop the READ_ONCE() here as well?)

Will

