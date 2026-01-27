Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4572DD2F033
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krqGeBSACHXjxJlSEmasGDGcH14xsvv4xOfTO1jOUuc=; b=DY1RaKbPdUrUe1wEhsx6NyZgIw
	R2FaNbMpjzIRRA41rQ0VAOLIVzXErMjJoe4QpPkTf2fwTecOVzyYbG7auLhkQL9Cmm1I3nNp27Vwu
	sasyKXZniyXVBwBufFmUByBdK1ewA/eACbsMg9wlIP+WR39JvHsOts4FgLHvo40YHE24/1IxgDoon
	6AAr6mpHs4kI5/VSOo9TsX0EjjQAh8Ei/VB0yOeSctI5jPEPmQio8xA4YGFmduxQa9m7AOShk+ZYY
	OsNF/ZkPhOWs+y1S7KmHZWorDBZgIgMztvKjaD1IizuNA+oE6UpcRStTh+MVvHjlsksiRVpGXEgXJ
	V/riH71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjpu-0000000ENG2-3cl4;
	Tue, 27 Jan 2026 14:14:30 +0000
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjpr-0000000ENF0-2cOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:14:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=krqGeBSACHXjxJlSEmasGDGcH14xsvv4xOfTO1jOUuc=;
	b=HWP1rLJdkqBRNpul8k3/kQQx0JiYCE+3nWAlOtVS+Hu3eLoALltI7Y3aR3lRXUpRBP6PTNFDe
	Cn7Sid4Ll5IZ8O7cMCJ0A5+6G+beFBXUQQoHdHhsVi3x/a7XHYypZhehKFRG+ONY9wITfSFbfkI
	fzBWAG2p26YObd9of2uAj8I=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f0nQS2Z0JzN15S;
	Tue, 27 Jan 2026 22:11:44 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0nSS61mtzHnH6F;
	Tue, 27 Jan 2026 22:13:28 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 804C740539;
	Tue, 27 Jan 2026 22:14:14 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 14:14:13 +0000
Date: Tue, 27 Jan 2026 14:14:12 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 11/13] arm64: mm: More flags for __flush_tlb_range()
Message-ID: <20260127141412.00005d7a@huawei.com>
In-Reply-To: <20260127141137.00004dd4@huawei.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-12-ryan.roberts@arm.com>
	<20260127124533.0000302e@huawei.com>
	<e75963a8-d0bd-49b0-9a00-b3297b1d5686@arm.com>
	<20260127141137.00004dd4@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_061428_205077_6653C53B 
X-CRM114-Status: GOOD (  52.21  )
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

On Tue, 27 Jan 2026 14:11:37 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Tue, 27 Jan 2026 13:50:06 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
> > On 27/01/2026 12:45, Jonathan Cameron wrote:  
> > > On Mon, 19 Jan 2026 17:21:58 +0000
> > > Ryan Roberts <ryan.roberts@arm.com> wrote:
> > >     
> > >> Refactor function variants with "_nosync", "_local" and "_nonotify" into
> > >> a single __always_inline implementation that takes flags and rely on
> > >> constant folding to select the parts that are actually needed at any
> > >> given callsite, based on the provided flags.
> > >>
> > >> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
> > >> to provide the strongest semantics (i.e. evict from walk cache,
> > >> broadcast, synchronise and notify). Each flag reduces the strength in
> > >> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
> > >> complement the existing TLBF_NOWALKCACHE.    
> > > 
> > > Unless I'm missing something the case of TLBF_NOBROADCAST but not
> > > TLBF_NOWALKCACHE isn't currently used.    
> > 
> > Currect but the next couple of patches start using TLBF_NOBROADCAST without
> > TLBF_NOWALKCACHE. TLBF_NOWALKCACHE is used without TLBF_NOBROADCAST in this patch.
> >   
> > >   
> > > I wonder if bringing that in with a user will make it easier to see what
> > > is going on.    
> > 
> > I'm not sure I understand the suggestion. This patch is using both flags so I
> > can't really defer introducing one of them. It's just that (for this patch only)
> > it never uses TLBF_NOBROADCAST without TLBF_NOWALKCACHE.  
> 
> Would be a case of lobbing in a build_bug_on() or similar, but this was
> mainly that I hadn't read the later patches at this point (or at least
> not such that they were still in my memory).
> 
> Perhaps a breadcrumb just to say that new combination is added, but
> not used until later patches.

Now I'm going crazy. Is it used used in this series?  After you pointed out
the addition of TLBF_NOWALKCACHE in the flush page stuff I'm failing to spot
that. Or do you mean in a follow up series?

> >   
> > > 
> > > Otherwise, 3 vs 2 underscores? Can we come up with something easier
> > > to read than that?    
> > 
> > You mean for ___flush_tlb_range() below? Yeah fair enough. How about
> > __do_flush_tlb_range() as the common function?  
> 
> That works for me.
> 
> J
> > 
> > Thanks,
> > Ryan
> > 
> > 
> >   
> > >     
> > >>
> > >> The result is a clearer, simpler, more powerful API.
> > >>
> > >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > >> ---
> > >>  arch/arm64/include/asm/tlbflush.h | 107 +++++++++++++++++++-----------
> > >>  arch/arm64/mm/contpte.c           |   9 ++-
> > >>  2 files changed, 74 insertions(+), 42 deletions(-)
> > >>
> > >> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> > >> index 1ad1c864e1f8..f03831cd8719 100644
> > >> --- a/arch/arm64/include/asm/tlbflush.h
> > >> +++ b/arch/arm64/include/asm/tlbflush.h
> > >> @@ -107,6 +107,12 @@ static inline unsigned long get_trans_granule(void)
> > >>  
> > >>  typedef void (*tlbi_op)(u64 arg);
> > >>  
> > >> +static __always_inline void vae1(u64 arg)
> > >> +{
> > >> +	__tlbi(vae1, arg);
> > >> +	__tlbi_user(vae1, arg);
> > >> +}
> > >> +
> > >>  static __always_inline void vae1is(u64 arg)
> > >>  {
> > >>  	__tlbi(vae1is, arg);
> > >> @@ -275,7 +281,10 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
> > >>   *		no invalidation may take place. In the case where the level
> > >>   *		cannot be easily determined, the value TLBI_TTL_UNKNOWN will
> > >>   *		perform a non-hinted invalidation. flags may be TLBF_NONE (0) or
> > >> - *		TLBF_NOWALKCACHE (elide eviction of walk cache entries).
> > >> + *		any combination of TLBF_NOWALKCACHE (elide eviction of walk
> > >> + *		cache entries), TLBF_NONOTIFY (don't call mmu notifiers),
> > >> + *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
> > >> + *		(only perform the invalidation for the local cpu).
> > >>   *
> > >>   *	local_flush_tlb_page(vma, addr)
> > >>   *		Local variant of flush_tlb_page().  Stale TLB entries may
> > >> @@ -285,12 +294,6 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
> > >>   *		Same as local_flush_tlb_page() except MMU notifier will not be
> > >>   *		called.
> > >>   *
> > >> - *	local_flush_tlb_contpte(vma, addr)
> > >> - *		Invalidate the virtual-address range
> > >> - *		'[addr, addr+CONT_PTE_SIZE)' mapped with contpte on local CPU
> > >> - *		for the user address space corresponding to 'vma->mm'.  Stale
> > >> - *		TLB entries may remain in remote CPUs.
> > >> - *
> > >>   *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
> > >>   *	on top of these routines, since that is our interface to the mmu_gather
> > >>   *	API as used by munmap() and friends.
> > >> @@ -435,6 +438,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > >>   *    operations can only span an even number of pages. We save this for last to
> > >>   *    ensure 64KB start alignment is maintained for the LPA2 case.
> > >>   */
> > >> +static __always_inline void rvae1(u64 arg)
> > >> +{
> > >> +	__tlbi(rvae1, arg);
> > >> +	__tlbi_user(rvae1, arg);
> > >> +}
> > >> +
> > >>  static __always_inline void rvae1is(u64 arg)
> > >>  {
> > >>  	__tlbi(rvae1is, arg);
> > >> @@ -541,15 +550,23 @@ typedef unsigned __bitwise tlbf_t;
> > >>  /* Invalidate tlb entries only, leaving the page table walk cache intact. */
> > >>  #define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
> > >>  
> > >> -static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> > >> -				     unsigned long start, unsigned long end,
> > >> -				     unsigned long stride, int tlb_level,
> > >> -				     tlbf_t flags)
> > >> +/* Skip the trailing dsb after issuing tlbi. */
> > >> +#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
> > >> +
> > >> +/* Suppress tlb notifier callbacks for this flush operation. */
> > >> +#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
> > >> +
> > >> +/* Perform the tlbi locally without broadcasting to other CPUs. */
> > >> +#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
> > >> +
> > >> +static __always_inline void ___flush_tlb_range(struct vm_area_struct *vma,    
> > > 
> > > Can we come up with anything better for naming than more underscores?
> > > 
> > > My eyes skipped over there being 3 here rather than 2 and I got rather confused
> > > as a result.  Maybe at least make it excessive and go from 2 to 4+?
> > >     
> > >> +					unsigned long start, unsigned long end,
> > >> +					unsigned long stride, int tlb_level,
> > >> +					tlbf_t flags)
> > >>  {
> > >> +	struct mm_struct *mm = vma->vm_mm;
> > >>  	unsigned long asid, pages;
> > >>  
> > >> -	start = round_down(start, stride);
> > >> -	end = round_up(end, stride);
> > >>  	pages = (end - start) >> PAGE_SHIFT;
> > >>  
> > >>  	if (__flush_tlb_range_limit_excess(pages, stride)) {
> > >> @@ -557,17 +574,41 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> > >>  		return;
> > >>  	}
> > >>  
> > >> -	dsb(ishst);
> > >> +	if (!(flags & TLBF_NOBROADCAST))
> > >> +		dsb(ishst);
> > >> +	else
> > >> +		dsb(nshst);
> > >> +
> > >>  	asid = ASID(mm);
> > >>  
> > >> -	if (flags & TLBF_NOWALKCACHE)
> > >> -		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
> > >> -				     asid, tlb_level);
> > >> -	else
> > >> +	switch (flags & (TLBF_NOWALKCACHE | TLBF_NOBROADCAST)) {
> > >> +	case TLBF_NONE:
> > >>  		__flush_s1_tlb_range_op(vae1is, start, pages, stride,
> > >> -				     asid, tlb_level);
> > >> +					asid, tlb_level);
> > >> +		break;
> > >> +	case TLBF_NOWALKCACHE:
> > >> +		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
> > >> +					asid, tlb_level);
> > >> +		break;
> > >> +	case TLBF_NOBROADCAST:
> > >> +		__flush_s1_tlb_range_op(vae1, start, pages, stride,
> > >> +					asid, tlb_level);
> > >> +		break;
> > >> +	case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
> > >> +		__flush_s1_tlb_range_op(vale1, start, pages, stride,
> > >> +					asid, tlb_level);
> > >> +		break;
> > >> +	}
> > >> +
> > >> +	if (!(flags & TLBF_NONOTIFY))
> > >> +		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> > >>  
> > >> -	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> > >> +	if (!(flags & TLBF_NOSYNC)) {
> > >> +		if (!(flags & TLBF_NOBROADCAST))
> > >> +			dsb(ish);
> > >> +		else
> > >> +			dsb(nsh);
> > >> +	}
> > >>  }
> > >>  
> > >>  static inline void __flush_tlb_range(struct vm_area_struct *vma,
> > >> @@ -575,24 +616,9 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
> > >>  				     unsigned long stride, int tlb_level,
> > >>  				     tlbf_t flags)
> > >>  {
> > >> -	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
> > >> -				 tlb_level, flags);
> > >> -	dsb(ish);
> > >> -}
> > >> -
> > >> -static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
> > >> -					   unsigned long addr)
> > >> -{
> > >> -	unsigned long asid;
> > >> -
> > >> -	addr = round_down(addr, CONT_PTE_SIZE);
> > >> -
> > >> -	dsb(nshst);
> > >> -	asid = ASID(vma->vm_mm);
> > >> -	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
> > >> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
> > >> -						    addr + CONT_PTE_SIZE);
> > >> -	dsb(nsh);
> > >> +	start = round_down(start, stride);
> > >> +	end = round_up(end, stride);
> > >> +	___flush_tlb_range(vma, start, end, stride, tlb_level, flags);
> > >>  }
> > >>  
> > >>  static inline void flush_tlb_range(struct vm_area_struct *vma,
> > >> @@ -645,7 +671,10 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
> > >>  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> > >>  		struct mm_struct *mm, unsigned long start, unsigned long end)
> > >>  {
> > >> -	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, 3, TLBF_NOWALKCACHE);
> > >> +	struct vm_area_struct vma = { .vm_mm = mm, .vm_flags = 0 };
> > >> +
> > >> +	__flush_tlb_range(&vma, start, end, PAGE_SIZE, 3,
> > >> +			  TLBF_NOWALKCACHE | TLBF_NOSYNC);
> > >>  }
> > >>  
> > >>  static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
> > >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > >> index 1a12bb728ee1..ec17a0e70415 100644
> > >> --- a/arch/arm64/mm/contpte.c
> > >> +++ b/arch/arm64/mm/contpte.c
> > >> @@ -527,8 +527,8 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
> > >>  		 * eliding the trailing DSB applies here.
> > >>  		 */
> > >>  		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> > >> -		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
> > >> -					 PAGE_SIZE, 3, TLBF_NOWALKCACHE);
> > >> +		__flush_tlb_range(vma, addr, addr + CONT_PTE_SIZE,
> > >> +				  PAGE_SIZE, 3, TLBF_NOWALKCACHE | TLBF_NOSYNC);
> > >>  	}
> > >>  
> > >>  	return young;
> > >> @@ -623,7 +623,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
> > >>  			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
> > >>  
> > >>  		if (dirty)
> > >> -			local_flush_tlb_contpte(vma, start_addr);
> > >> +			__flush_tlb_range(vma, start_addr,
> > >> +					  start_addr + CONT_PTE_SIZE,
> > >> +					  PAGE_SIZE, 3,
> > >> +					  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);
> > >>  	} else {
> > >>  		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
> > >>  		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);    
> > >     
> > 
> >   
> 


