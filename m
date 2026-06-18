Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9FECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrh0Efzu7OsN5UGgvC0/F8zFCrpiooG8KAqUSiEJ+wY=; b=Fq6Gnrmu84zBUzuEilnCuHZIlk
	7hAXvYxvojityLfwWpXIamI7W8UoMPrYZJPYp8AJj58UbY5UO2j+vxw2yRnjQ9iUSJsAuUx6eaoZ4
	oW76BfC9BDpyo/tQeoYPDZADjBcYuxXWWPbyjK11GwwpABLXKTiPc+uTMffHnAInZ3W4nkBDDomtz
	4NPsfc2ZnNyGxUDOvPZhucfMjH5bNNV9wly3qgdiDU0B5qchgTVlOL1IRogt3TckPYBHCLpUOmOO3
	gfl7Ui2ojYREFqkI/DomX7xiXuJwNGT+L7E+t1ans3Aj8qknpK/VMbbvB/O5eU+lPLhKVGsx9CgGD
	w/4xXBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oy-00000000g92-2G9H;
	Thu, 18 Jun 2026 06:01:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5ou-00000000g8f-3aUI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 06:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21B228AC;
	Wed, 17 Jun 2026 23:01:36 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBB173F915;
	Wed, 17 Jun 2026 23:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781762501; bh=wvF71wruNTFedYxNRUL72jmvp9HzpNJuEquij6HZbPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJm3SwVpj2AJ1RpncIA7Ng5szhqi7BDwlpNT7Noa4VVYEbmG63EdEQ6zgCg/VnN/L
	 O3tZthrnEVIIsrzSF2CyEeKqm1B795mDpoFwoPmpwILcrsfFI9O5oaVgDHLYt++hLe
	 4HLIBUkX13FL0vWXKBRVezQDQPpaPH2zZnwPPd+8=
Date: Thu, 18 Jun 2026 11:31:37 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajOJwcsxl3Qlu9vA@a079125.arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAPnahwTe1OHQDp@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_230145_082583_0D699A72 
X-CRM114-Status: GOOD (  65.58  )
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

Hi,

On Mon, Jun 15, 2026 at 03:43:41PM +0100, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> > On 14/06/2026 12:04, Will Deacon wrote:
> > > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> > >> From: Ryan Roberts <ryan.roberts@arm.com>
> > >>
> > >> Testing with 7.1-rc4 :
> > >> +-----------------------+---------------------------------------------------+-------------+
> > >> | Benchmark             | Result Class                                      |  Improvement|  
> > >> +=======================+===================================================+=============+
> > >> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > >> +-----------------------+---------------------------------------------------+-------------+
> > >> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > >> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > >> +-----------------------+---------------------------------------------------+-------------+
> > > 
> > > I think we need a much more comprehensive set of benchmarks before we can
> > > begin to consider a change like this.
> > 
> > I believe that Linu ran a wider set of benchmarks and didn't find any
> > regressions. These are just the ones that show improvement (Linu, please correct
> > me and/or provide details).
> 
> I think it's important to show the ones that suffer as well... and also
> look at different configurations (e.g. preemptible settings) and different
> environments (e.g. native vs in a VM).
> 
> > Additionally Huang Ying did some testing against the RFC and reported 4.5%
> > improvement with Redis:
> > 
> > https://lore.kernel.org/linux-arm-kernel/87segumv6w.fsf@DESKTOP-5N7EMDA 
> 
> To be clear: I'm not disputing that some benchmarks appear to show a small
> boost from this series. I'm just worried that's not the whole story.
> 
> > >>  arch/arm64/include/asm/mmu.h         |  12 +++
> > >>  arch/arm64/include/asm/mmu_context.h |   2 +
> > >>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
> > >>  arch/arm64/mm/context.c              |  30 ++++++-
> > >>  4 files changed, 141 insertions(+), 30 deletions(-)
> > > 
> > > Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
> > > even if you can provide some more compelling numbers.
> > 
> > AIUI, we don't support BTM upstream - the SMMU uses private ASIDs and implements
> > MMU notifiers to forward the TLBIs via its command queue interface.
> > 
> > I was also under the impression that supporting BTM upsteam was not desired;
> > Please correct me if that's not accurate or if you're aware of plans to add
> > support. I've been (coincidentlly) looking at some other stuff that could
> > benefit from BTM but had concluded it wouldn't be an acceptable approach upstream.
> > 
> > If we did ever want to add SMMU BTM support though, I think it would be simple
> > enough to add an interface to allow the SMMU to disable the optimization (i.e.
> > force active_cpu to ACTIVE_CPU_MULTIPLE)?
> 
> We used to have some initial BTM support in the SMMUv3 driver but the
> main problem was finding an upstream driver/soc that can use it properly
> and so it was ultimately removed in d38c28dbefee ("iommu/arm-smmu-v3: Put
> the SVA mmu notifier in the smmu_domain") because it was getting in the
> way of wider driver rework and we couldn't test it.
> 
> However, there *is* work to re-enable it on top of that rework (and other
> changes):
> 
>   https://lore.kernel.org/linux-iommu/20250319173202.78988-6-shameerali.kolothum.thodi@huawei.com/
> 
> although I don't know if Shameer intends to repost that...
> 
> > >> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
> > >> +{
> > >> +	unsigned int self, active;
> > >> +	bool local;
> > >> +
> > >> +	migrate_disable();
> > >> +
> > >> +	if (flags & TLBF_NOBROADCAST) {
> > >> +		dsb(nshst);
> > >> +		return true;
> > >> +	}
> > > 
> > > Why does the NOBROADCAST case need migration disabled? It didn't before...
> > 
> > The existing semantic for TLBF_BOBROADCAST is that it emits a local TLBI on
> > whatever CPU we happen to be executing on. It's used for lazily fixing up
> > spurious faults (i.e. hitting RO TLB entries when the PTE has been relaxed to
> > RW). So it's still functionally correct if the thread migrates CPU between
> > taking the fault and issuing the local TLBI - in the worst case it just leads to
> > another spurious fault.
> > 
> > For this new case, we need to ensure we don't get migrated between reading
> > active_cpu and issuing the local TLBI, otherwise we would only issue a local
> > TLBI when a broadcast was required.
> 
> Sounds like those two users probably need separating out, then?
> 
> > >> +	self = smp_processor_id();
> > >> +
> > >> +	/*
> > >> +	 * The load of mm->context.active_cpu must not be reordered before the
> > >> +	 * store to the pgtable that necessitated this flush. This ensures that
> > >> +	 * if the value read is our cpu id, then no other cpu can have seen the
> > >> +	 * old pgtable value and therefore does not need this old value to be
> > >> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
> > >> +	 * needed to make the pgtable updates visible to the walker, to a
> > >> +	 * dsb(ish) by default. So speculatively load without a barrier and if
> > >> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
> > >> +	 */
> > >> +	active = READ_ONCE(mm->context.active_cpu);
> > >> +	if (active == self) {
> > >> +		dsb(ish);
> > >> +		active = READ_ONCE(mm->context.active_cpu);
> > >> +	} else {
> > >> +		dsb(ishst);
> > >> +	}
> > > 
> > > Why can't you just do:
> > > 
> > > 	dsb(ishst);
> > > 	active = READ_ONCE(mm->context.active_cpu);
> > > 
> > > ?
> > 
> > Prior to this optimization, we always issued a dsb(ishst) here. Catalin
> > suggested the same simplification against the RFC. I believe Linu tried it but
> > saw regressions; Hopefully Linu can provide the details.
> 
> I don't follow...
> 
> The old code always did dsb(ishst). The proposed code here does either
> dsb(ish) or dsb(ishst). How can that possibly be faster?
> 
> > >> +	local = active == self;
> > >> +	if (!local)
> > >> +		migrate_enable();
> > >> +
> > >> +	return local;
> > >> +}
> > >> +
> > >> +static inline void flush_tlb_user_post(bool local)
> > >> +{
> > >> +	if (local)
> > >> +		migrate_enable();
> > >> +}
> > > 
> > > I was under the impression that disabling/enabling migration was an
> > > expensive thing to do, so I'd really want to see some more numbers to
> > > justify this (including from inside a VM) and allow us to consider the
> > > trade-offs properly. It's also not at all clear to me that it's safe
> > > from such a low-level TLB invalidation helper.
> > 
> > I had assumed it wasn't very expensive, but perhaps I'm wrong. I know
> > preempt_enable() can be expensive because it has to test to see if it needs to
> > reschedule. But I assumed for disabling/enabling migration, it would just be a
> > counter and the scheduler would check that it's zero before considing moving the
> > task to another run queue. (But I have practically zero understanding of the
> > scheduler so I'll assume I'm wrong...).
> 
> I'm not an expert here either, but reading the code shows that it has
> a preempt guard along with additional book-keeping.
> 
> > Instead of disabling migration, perhaps we could re-check active_cpu after
> > issuing the local tlbi - if it's now reporting "multiple" we must have been
> > migrated and we need to upgrade to a braodcast TLBI?
> 
> That's an interesting idea, although I suppose it means the
> post-invalidation DSB needs to be ISH for the local case to check the
> active_cpu safely?

I might be wrong about this, so please correct me if i am missing
something here.

So we have two possibilities here,
Case 1: Task not migrated until active_cpu is loaded

In this case, the existing dsb(nsh) would suffice to give necessary
ordering between tlbi and active_cpu_load. 

Case 2: Task migrated(scheduled to run on another cpu) before active_cpu is loaded

In this case, active_cpu gets upgraded to ACTIVE_CPU_MULTIPLE as part of context switch in
check_and_switch_context and active_cpu gets loaded correctly.
Also we would end up repeating the tlbi op in broadcast mode for this case.

But then, we will have a problem with the TLBF_NOSYNC | TLBF_NOBRODCAST case, as we need
to introduce a dsb(nsh) unconditionally to ensure ordering between the tlbi and
active_cpu load.


Thanks,
Linu Cherian.

