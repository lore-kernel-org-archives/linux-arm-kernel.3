Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21718CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJFXEMxAnouHCYO17wxrr2jx0O81pY8fQRPbiAuBi3k=; b=DOXjz8bjNjYoZsE++W6A4cyCps
	ktn9mRT3sAwDPPuhK9d1gRQu/QWtFgUmt9DwQH4HlNTYQeT3P6sMBiql6KUCHEnZ1FfaJYEjLSCYx
	CLDXRoP2J7LvimtaTR7PkWuW5oeO2s0gVuv5h6RKjqBIO8f66bMG2DpqX8RyJEA20zWWNPKLa3TMp
	5Z1iKXJH6boUveoEo/DNIT0FqFGEBwSq90SlD+GqCUAQKDMrLJa7yNVGi98UTiDytaS1vt7Avow37
	htO5QJC42lIB/S4O6OniOX4u7YCZI5Lwe8I5mZO3k8Pz/+ChF7Ows0Tom828x+pA+DV31jXOByN2c
	dfCeTOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5Ni-0000000E5ng-0ftA;
	Mon, 15 Jun 2026 11:21:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ5Nf-0000000E5mY-1MwM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 11:21:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2611328D;
	Mon, 15 Jun 2026 04:21:18 -0700 (PDT)
Received: from [10.57.93.228] (unknown [10.57.93.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96AF3F915;
	Mon, 15 Jun 2026 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781522483; bh=xr8JAbsw542Ekce7MoopDiNfl5G5KYV1izF3XUolvlM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sQZjv+ms7bbldFg89JmwzQBQcG3vyjpTqIQ+bQboDRgs1MBFC/THCCpSCbOB+4DGb
	 fnGR1TPe8fNRGhV2VWiVg6eSL1BPfur9Ih7nn++l/B9w+KAVVIZaW4CSXGVF3AIYGY
	 7ZuGIIFexMuEc3aPJteWHPKf5evvbmgJGc2wo7VA=
Message-ID: <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
Date: Mon, 15 Jun 2026 12:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only active
 on local cpu
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ai6KzFgfMAxqplcr@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_042127_455091_2F727E2C 
X-CRM114-Status: GOOD (  52.84  )
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

On 14/06/2026 12:04, Will Deacon wrote:
> On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
>> From: Ryan Roberts <ryan.roberts@arm.com>
>>
>> There are 3 variants of tlb flush that invalidate user mappings:
>> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
>> would previously unconditionally broadcast their tlbis to all cpus in
>> the inner shareable domain.
>>
>> But this is a waste of effort if we can prove that the mm for which we
>> are flushing the mappings has only ever been active on the local cpu. In
>> that case, it is safe to avoid the broadcast and simply invalidate the
>> current cpu.
>>
>> So let's track in mm_context_t::active_cpu either the mm has never been
>> active on any cpu, has been active on more than 1 cpu, or has been
>> active on precisely 1 cpu - and in that case, which one. We update this
>> when switching context, being careful to ensure that it gets updated
>> *before* installing the mm's pgtables. On the reader side, we ensure we
>> read *after* the previous write(s) to the pgtable(s) that necessitated
>> the tlb flush have completed. This guarrantees that if a cpu that is
>> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
>> entry cannot have been seen by any other cpu and we can flush only the
>> local cpu.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
>> [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
>> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
>> ---
>> Changelog from RFC v1:
>> - Adapted for v7.1 flush tlb API changes
>>   No changes in core logic
>> - Collected Rb and Tb tags
>> - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
>>   hence retained dsb(ishst) in flush_tlb_user_pre	
>>
>>
>> Testing with 7.1-rc4 :
>> +-----------------------+---------------------------------------------------+-------------+
>> | Benchmark             | Result Class                                      |  Improvement|  
>> +=======================+===================================================+=============+
>> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
>> +-----------------------+---------------------------------------------------+-------------+
>> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
>> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
>> +-----------------------+---------------------------------------------------+-------------+
> 
> I think we need a much more comprehensive set of benchmarks before we can
> begin to consider a change like this.

I believe that Linu ran a wider set of benchmarks and didn't find any
regressions. These are just the ones that show improvement (Linu, please correct
me and/or provide details).

Additionally Huang Ying did some testing against the RFC and reported 4.5%
improvement with Redis:

https://lore.kernel.org/linux-arm-kernel/87segumv6w.fsf@DESKTOP-5N7EMDA/

> 
>>  arch/arm64/include/asm/mmu.h         |  12 +++
>>  arch/arm64/include/asm/mmu_context.h |   2 +
>>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
>>  arch/arm64/mm/context.c              |  30 ++++++-
>>  4 files changed, 141 insertions(+), 30 deletions(-)
> 
> Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
> even if you can provide some more compelling numbers.

AIUI, we don't support BTM upstream - the SMMU uses private ASIDs and implements
MMU notifiers to forward the TLBIs via its command queue interface.

I was also under the impression that supporting BTM upsteam was not desired;
Please correct me if that's not accurate or if you're aware of plans to add
support. I've been (coincidentlly) looking at some other stuff that could
benefit from BTM but had concluded it wouldn't be an acceptable approach upstream.

If we did ever want to add SMMU BTM support though, I think it would be simple
enough to add an interface to allow the SMMU to disable the optimization (i.e.
force active_cpu to ACTIVE_CPU_MULTIPLE)?

> 
>> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
>> +{
>> +	unsigned int self, active;
>> +	bool local;
>> +
>> +	migrate_disable();
>> +
>> +	if (flags & TLBF_NOBROADCAST) {
>> +		dsb(nshst);
>> +		return true;
>> +	}
> 
> Why does the NOBROADCAST case need migration disabled? It didn't before...

The existing semantic for TLBF_BOBROADCAST is that it emits a local TLBI on
whatever CPU we happen to be executing on. It's used for lazily fixing up
spurious faults (i.e. hitting RO TLB entries when the PTE has been relaxed to
RW). So it's still functionally correct if the thread migrates CPU between
taking the fault and issuing the local TLBI - in the worst case it just leads to
another spurious fault.

For this new case, we need to ensure we don't get migrated between reading
active_cpu and issuing the local TLBI, otherwise we would only issue a local
TLBI when a broadcast was required.

> 
>> +
>> +	self = smp_processor_id();
>> +
>> +	/*
>> +	 * The load of mm->context.active_cpu must not be reordered before the
>> +	 * store to the pgtable that necessitated this flush. This ensures that
>> +	 * if the value read is our cpu id, then no other cpu can have seen the
>> +	 * old pgtable value and therefore does not need this old value to be
>> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
>> +	 * needed to make the pgtable updates visible to the walker, to a
>> +	 * dsb(ish) by default. So speculatively load without a barrier and if
>> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
>> +	 */
>> +	active = READ_ONCE(mm->context.active_cpu);
>> +	if (active == self) {
>> +		dsb(ish);
>> +		active = READ_ONCE(mm->context.active_cpu);
>> +	} else {
>> +		dsb(ishst);
>> +	}
> 
> Why can't you just do:
> 
> 	dsb(ishst);
> 	active = READ_ONCE(mm->context.active_cpu);
> 
> ?

Prior to this optimization, we always issued a dsb(ishst) here. Catalin
suggested the same simplification against the RFC. I believe Linu tried it but
saw regressions; Hopefully Linu can provide the details.

> 
>> +
>> +	local = active == self;
>> +	if (!local)
>> +		migrate_enable();
>> +
>> +	return local;
>> +}
>> +
>> +static inline void flush_tlb_user_post(bool local)
>> +{
>> +	if (local)
>> +		migrate_enable();
>> +}
> 
> I was under the impression that disabling/enabling migration was an
> expensive thing to do, so I'd really want to see some more numbers to
> justify this (including from inside a VM) and allow us to consider the
> trade-offs properly. It's also not at all clear to me that it's safe
> from such a low-level TLB invalidation helper.

I had assumed it wasn't very expensive, but perhaps I'm wrong. I know
preempt_enable() can be expensive because it has to test to see if it needs to
reschedule. But I assumed for disabling/enabling migration, it would just be a
counter and the scheduler would check that it's zero before considing moving the
task to another run queue. (But I have practically zero understanding of the
scheduler so I'll assume I'm wrong...).

Instead of disabling migration, perhaps we could re-check active_cpu after
issuing the local tlbi - if it's now reporting "multiple" we must have been
migrated and we need to upgrade to a braodcast TLBI?

> 
>> +
>>  /*
>>   *	TLB Invalidation
>>   *	================
>> @@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
>>  static inline void flush_tlb_mm(struct mm_struct *mm)
>>  {
>>  	unsigned long asid;
>> +	bool local;
>>  
>> -	dsb(ishst);
>> +	local = flush_tlb_user_pre(mm, TLBF_NONE);
>>  	asid = __TLBI_VADDR(0, ASID(mm));
>> -	__tlbi(aside1is, asid);
>> -	__tlbi_user(aside1is, asid);
>> -	__tlbi_sync_s1ish(mm);
>> +	if (local) {
>> +		__tlbi(aside1, asid);
>> +		__tlbi_user(aside1, asid);
>> +		dsb(nsh);
>> +	} else {
>> +		__tlbi(aside1is, asid);
>> +		__tlbi_user(aside1is, asid);
>> +		__tlbi_sync_s1ish(mm);
>> +	}
>> +	flush_tlb_user_post(local);
> 
> I think you've changed this since Ryan's original patch, but why are you
> only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
> the erratum workaround when running as a VM if the vCPU is migrated?

Hmm. So from the guest kernel's perspective, it has concluded that it only needs
to target the local (v)CPU. Since the errata only affect boardcast TLBIs, it
concludes there is no need to issue the workarounds. But since it's a VM, the HW
will upgrade the local TLBIs to broadcast TLBIs, but will not magically
re-instate the workarounds. I guess the simplest solution would be to disable
the optimization when either workaround is enabled.

Perhaps this is all getting a bit too complex for not enough benefit...

Thanks,
Ryan

> 
>> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
>> index 0f4a28b87469..f34ed78393e0 100644
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -214,9 +214,10 @@ static u64 new_context(struct mm_struct *mm)
>>  
>>  void check_and_switch_context(struct mm_struct *mm)
>>  {
>> -	unsigned long flags;
>> -	unsigned int cpu;
>> +	unsigned int cpu = smp_processor_id();
>>  	u64 asid, old_active_asid;
>> +	unsigned int active;
>> +	unsigned long flags;
>>  
>>  	if (system_supports_cnp())
>>  		cpu_set_reserved_ttbr0();
>> @@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
>>  		atomic64_set(&mm->context.id, asid);
>>  	}
>>  
>> -	cpu = smp_processor_id();
>>  	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
>>  		local_flush_tlb_all();
>>  
>> @@ -262,6 +262,30 @@ void check_and_switch_context(struct mm_struct *mm)
>>  
>>  	arm64_apply_bp_hardening();
>>  
>> +	/*
>> +	 * Update mm->context.active_cpu in such a manner that we avoid cmpxchg
>> +	 * and dsb unless we definitely need it. If initially ACTIVE_CPU_NONE
>> +	 * then we are the first cpu to run so set it to our id. If initially
>> +	 * any id other than ours, we are the second cpu to run so set it to
>> +	 * ACTIVE_CPU_MULTIPLE. If we update the value then we must issue
>> +	 * dsb(ishst) to ensure stores to mm->context.active_cpu are ordered
>> +	 * against the TTBR0 write in cpu_switch_mm()/uaccess_enable(); the
>> +	 * store must be visible to another cpu before this cpu could have
>> +	 * populated any TLB entries based on the pgtables that will be
>> +	 * installed.
>> +	 */
>> +	active = READ_ONCE(mm->context.active_cpu);
>> +	if (active != cpu && active != ACTIVE_CPU_MULTIPLE) {
>> +		if (active == ACTIVE_CPU_NONE)
>> +			active = cmpxchg_relaxed(&mm->context.active_cpu,
>> +						 ACTIVE_CPU_NONE, cpu);
>> +
>> +		if (active != ACTIVE_CPU_NONE)
>> +			WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_MULTIPLE);
>> +
>> +		dsb(ishst);
>> +	}
>> +
> 
> Can you simplify the 'if' condition here?
> 
> 	if (active == ACTIVE_CPU_NONE) {
> 		if (!try_cmpxchg_relaxed(...))
> 			WRITE_ONCE(...);
> 
> 		dsb(ishst);
> 	}
> 
> (as an aside, maybe we should implement arch_try_cmpxchg{,_relaxed} so
>  we could drop the READ_ONCE() here as well?)
> 
> Will


