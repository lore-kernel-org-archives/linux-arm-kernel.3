Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0806CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aafA2ArxcNuVbo8pPO25wGQ4yORTGx7GaQoyPnuNIIQ=; b=GIlD+1ycLpCdAdQBZ4IyYrTQHe
	bjuOGtwC3XQ1aeX9QORE4j65I0fl8AIwS7UG4Gm3S7M0VLz/eEBFmL12DP+07d4z0tRwN5Tspz/eA
	WWhCoF+0KMUiTqLIIpImvPY/G/EDcsm7DwgV8H1T5ygxPiYWzlNtfi1Irhqrb2HuIToXw19EGuvuf
	2zSCk0soc3cBFt/TfpudJpsnZ+nwRwWM94EKunzX+xu9ieZE5Fi70QcbglVJjppcAbYaYRBZ2tSVM
	HMyeICGpRUGJhZE6pfpmjPNx0eWK7Nfe336CNL49mt9P/a2fGqLAbm1T18jP8hPo2+BzN/jPcWb15
	QOYmk++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8XV-0000000ER2i-10Bq;
	Mon, 15 Jun 2026 14:43:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8XT-0000000ER2a-0zLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68BB3601E8;
	Mon, 15 Jun 2026 14:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F101B1F00A3D;
	Mon, 15 Jun 2026 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534626;
	bh=aafA2ArxcNuVbo8pPO25wGQ4yORTGx7GaQoyPnuNIIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nWsa1NCjO9znGnb3C9xnFVWHmWGSd5c4zeTNqJsP5sL/OC0sc3qNGKUulDP/lrpqw
	 3Eg2fxXCcIhTTU57oFToHFiKFFW/U0Pk9qce7AazoBlAjXpS5gAis4pwV75vuWOGlK
	 9CEnqMAiythcc/1NXptciPTCXSeIj1zTOyNu4nie8tEd4H+UEaYmP4yUR7glZnQeL3
	 CO2aeaipS38C4ugwWJ+AvU1Pzf+StJ+u8XY+ZII6NshsCAjgn+M4Ee0wy94Q6o/smm
	 LcasBSZSBCi5hAhwpPh4exCzsZm9nokR2zlGg0PUc6077YUxEeDzpKY1tCZinQJHMX
	 X4A+jjUgBiqjw==
Date: Mon, 15 Jun 2026 15:43:41 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
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
Message-ID: <ajAPnahwTe1OHQDp@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
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

On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> On 14/06/2026 12:04, Will Deacon wrote:
> > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> >> From: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >> Testing with 7.1-rc4 :
> >> +-----------------------+---------------------------------------------------+-------------+
> >> | Benchmark             | Result Class                                      |  Improvement|  
> >> +=======================+===================================================+=============+
> >> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> >> +-----------------------+---------------------------------------------------+-------------+
> >> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> >> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> >> +-----------------------+---------------------------------------------------+-------------+
> > 
> > I think we need a much more comprehensive set of benchmarks before we can
> > begin to consider a change like this.
> 
> I believe that Linu ran a wider set of benchmarks and didn't find any
> regressions. These are just the ones that show improvement (Linu, please correct
> me and/or provide details).

I think it's important to show the ones that suffer as well... and also
look at different configurations (e.g. preemptible settings) and different
environments (e.g. native vs in a VM).

> Additionally Huang Ying did some testing against the RFC and reported 4.5%
> improvement with Redis:
> 
> https://lore.kernel.org/linux-arm-kernel/87segumv6w.fsf@DESKTOP-5N7EMDA 

To be clear: I'm not disputing that some benchmarks appear to show a small
boost from this series. I'm just worried that's not the whole story.

> >>  arch/arm64/include/asm/mmu.h         |  12 +++
> >>  arch/arm64/include/asm/mmu_context.h |   2 +
> >>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
> >>  arch/arm64/mm/context.c              |  30 ++++++-
> >>  4 files changed, 141 insertions(+), 30 deletions(-)
> > 
> > Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
> > even if you can provide some more compelling numbers.
> 
> AIUI, we don't support BTM upstream - the SMMU uses private ASIDs and implements
> MMU notifiers to forward the TLBIs via its command queue interface.
> 
> I was also under the impression that supporting BTM upsteam was not desired;
> Please correct me if that's not accurate or if you're aware of plans to add
> support. I've been (coincidentlly) looking at some other stuff that could
> benefit from BTM but had concluded it wouldn't be an acceptable approach upstream.
> 
> If we did ever want to add SMMU BTM support though, I think it would be simple
> enough to add an interface to allow the SMMU to disable the optimization (i.e.
> force active_cpu to ACTIVE_CPU_MULTIPLE)?

We used to have some initial BTM support in the SMMUv3 driver but the
main problem was finding an upstream driver/soc that can use it properly
and so it was ultimately removed in d38c28dbefee ("iommu/arm-smmu-v3: Put
the SVA mmu notifier in the smmu_domain") because it was getting in the
way of wider driver rework and we couldn't test it.

However, there *is* work to re-enable it on top of that rework (and other
changes):

  https://lore.kernel.org/linux-iommu/20250319173202.78988-6-shameerali.kolothum.thodi@huawei.com/

although I don't know if Shameer intends to repost that...

> >> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
> >> +{
> >> +	unsigned int self, active;
> >> +	bool local;
> >> +
> >> +	migrate_disable();
> >> +
> >> +	if (flags & TLBF_NOBROADCAST) {
> >> +		dsb(nshst);
> >> +		return true;
> >> +	}
> > 
> > Why does the NOBROADCAST case need migration disabled? It didn't before...
> 
> The existing semantic for TLBF_BOBROADCAST is that it emits a local TLBI on
> whatever CPU we happen to be executing on. It's used for lazily fixing up
> spurious faults (i.e. hitting RO TLB entries when the PTE has been relaxed to
> RW). So it's still functionally correct if the thread migrates CPU between
> taking the fault and issuing the local TLBI - in the worst case it just leads to
> another spurious fault.
> 
> For this new case, we need to ensure we don't get migrated between reading
> active_cpu and issuing the local TLBI, otherwise we would only issue a local
> TLBI when a broadcast was required.

Sounds like those two users probably need separating out, then?

> >> +	self = smp_processor_id();
> >> +
> >> +	/*
> >> +	 * The load of mm->context.active_cpu must not be reordered before the
> >> +	 * store to the pgtable that necessitated this flush. This ensures that
> >> +	 * if the value read is our cpu id, then no other cpu can have seen the
> >> +	 * old pgtable value and therefore does not need this old value to be
> >> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
> >> +	 * needed to make the pgtable updates visible to the walker, to a
> >> +	 * dsb(ish) by default. So speculatively load without a barrier and if
> >> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
> >> +	 */
> >> +	active = READ_ONCE(mm->context.active_cpu);
> >> +	if (active == self) {
> >> +		dsb(ish);
> >> +		active = READ_ONCE(mm->context.active_cpu);
> >> +	} else {
> >> +		dsb(ishst);
> >> +	}
> > 
> > Why can't you just do:
> > 
> > 	dsb(ishst);
> > 	active = READ_ONCE(mm->context.active_cpu);
> > 
> > ?
> 
> Prior to this optimization, we always issued a dsb(ishst) here. Catalin
> suggested the same simplification against the RFC. I believe Linu tried it but
> saw regressions; Hopefully Linu can provide the details.

I don't follow...

The old code always did dsb(ishst). The proposed code here does either
dsb(ish) or dsb(ishst). How can that possibly be faster?

> >> +	local = active == self;
> >> +	if (!local)
> >> +		migrate_enable();
> >> +
> >> +	return local;
> >> +}
> >> +
> >> +static inline void flush_tlb_user_post(bool local)
> >> +{
> >> +	if (local)
> >> +		migrate_enable();
> >> +}
> > 
> > I was under the impression that disabling/enabling migration was an
> > expensive thing to do, so I'd really want to see some more numbers to
> > justify this (including from inside a VM) and allow us to consider the
> > trade-offs properly. It's also not at all clear to me that it's safe
> > from such a low-level TLB invalidation helper.
> 
> I had assumed it wasn't very expensive, but perhaps I'm wrong. I know
> preempt_enable() can be expensive because it has to test to see if it needs to
> reschedule. But I assumed for disabling/enabling migration, it would just be a
> counter and the scheduler would check that it's zero before considing moving the
> task to another run queue. (But I have practically zero understanding of the
> scheduler so I'll assume I'm wrong...).

I'm not an expert here either, but reading the code shows that it has
a preempt guard along with additional book-keeping.

> Instead of disabling migration, perhaps we could re-check active_cpu after
> issuing the local tlbi - if it's now reporting "multiple" we must have been
> migrated and we need to upgrade to a braodcast TLBI?

That's an interesting idea, although I suppose it means the
post-invalidation DSB needs to be ISH for the local case to check the
active_cpu safely?

> >>   *	TLB Invalidation
> >>   *	================
> >> @@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
> >>  static inline void flush_tlb_mm(struct mm_struct *mm)
> >>  {
> >>  	unsigned long asid;
> >> +	bool local;
> >>  
> >> -	dsb(ishst);
> >> +	local = flush_tlb_user_pre(mm, TLBF_NONE);
> >>  	asid = __TLBI_VADDR(0, ASID(mm));
> >> -	__tlbi(aside1is, asid);
> >> -	__tlbi_user(aside1is, asid);
> >> -	__tlbi_sync_s1ish(mm);
> >> +	if (local) {
> >> +		__tlbi(aside1, asid);
> >> +		__tlbi_user(aside1, asid);
> >> +		dsb(nsh);
> >> +	} else {
> >> +		__tlbi(aside1is, asid);
> >> +		__tlbi_user(aside1is, asid);
> >> +		__tlbi_sync_s1ish(mm);
> >> +	}
> >> +	flush_tlb_user_post(local);
> > 
> > I think you've changed this since Ryan's original patch, but why are you
> > only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
> > the erratum workaround when running as a VM if the vCPU is migrated?
> 
> Hmm. So from the guest kernel's perspective, it has concluded that it only needs
> to target the local (v)CPU. Since the errata only affect boardcast TLBIs, it
> concludes there is no need to issue the workarounds. But since it's a VM, the HW
> will upgrade the local TLBIs to broadcast TLBIs, but will not magically
> re-instate the workarounds. I guess the simplest solution would be to disable
> the optimization when either workaround is enabled.

That's what I was thinking, but Mark seems to think it's ok. I'll reply
to him on the other part of the thread.

> Perhaps this is all getting a bit too complex for not enough benefit...

I don't think the complexity is unmanageable, but I'm not yet convinced
that this offers any real benefit overall.

Will

