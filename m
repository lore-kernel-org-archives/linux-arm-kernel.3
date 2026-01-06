Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B429CE9D5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBi46/iGiWZRcKIH39btNn/EM5amn6b3eJeYwrjj9jI=; b=FzAFDBn3cr7teMrR7GhmOI2QHT
	PSZzKind3lA/F4BrGxkNo/hmCTfpoDQCV3tyrXUWhV7VztXaw5KAh+aJGm7LL9nAZ1NUcm3VvKyMm
	UjXR2++4vJ74jtMEWuUnURGXi88c7roDAVRmyttOXCAwFMtrN1+pN3+Fu7cANiBP9Mv81zKqX1y/f
	s6bIuvOMrDSoV2MPvxX88kc8FAaNJ6FmNTy5nHnpe3uw3v/pB3wNbkZvFtATQMNj61aglb2QBHQT5
	MkI+n+Y9KvMAmkt7d48T7jGzqLlJ0LVOTzAOT2H/7oHjzDhj/ryIoaxCRRPfqXkSF7b6FuBRBrayF
	OaoykH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8yz-0000000DPQS-27Q4;
	Tue, 06 Jan 2026 15:28:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8yu-0000000DPPl-3L61
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:28:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C3A8497;
	Tue,  6 Jan 2026 07:28:13 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33D7B3F5A1;
	Tue,  6 Jan 2026 07:28:18 -0800 (PST)
Date: Tue, 6 Jan 2026 20:58:15 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/13] arm64: mm: More flags for __flush_tlb_range()
Message-ID: <aV0qD4MXi7hzFWWg@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-12-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-12-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_072824_920201_56CBE0C3 
X-CRM114-Status: GOOD (  33.01  )
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

Ryan,

On Tue, Dec 16, 2025 at 02:45:56PM +0000, Ryan Roberts wrote:
> Refactor function variants with "_nosync", "_local" and "_nonotify" into
> a single __always_inline implementation that takes flags and rely on
> constant folding to select the parts that are actually needed at any
> given callsite, based on the provided flags.
> 
> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
> to provide the strongest semantics (i.e. evict from walk cache,
> broadcast, synchronise and notify). Each flag reduces the strength in
> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
> complement the existing TLBF_NOWALKCACHE.
> 
> The result is a clearer, simpler, more powerful API.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 101 ++++++++++++++++++------------
>  arch/arm64/mm/contpte.c           |   9 ++-
>  2 files changed, 68 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 9a37a6a014dc..ee747e66bbef 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -107,6 +107,12 @@ static inline unsigned long get_trans_granule(void)
>  
>  typedef void (*tlbi_op)(u64 arg);
>  
> +static __always_inline void vae1(u64 arg)
> +{
> +	__tlbi(vae1, arg);
> +	__tlbi_user(vae1, arg);
> +}
> +
>  static __always_inline void vae1is(u64 arg)
>  {
>  	__tlbi(vae1is, arg);
> @@ -276,7 +282,10 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>   *		no invalidation may take place. In the case where the level
>   *		cannot be easily determined, the value TLBI_TTL_UNKNOWN will
>   *		perform a non-hinted invalidation. flags may be TLBF_NONE (0) or
> - *		TLBF_NOWALKCACHE (elide eviction of walk cache entries).
> + *		any combination of TLBF_NOWALKCACHE (elide eviction of walk
> + *		cache entries), TLBF_NONOTIFY (don't call mmu notifiers),
> + *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
> + *		(only perform the invalidation for the local cpu).
>   *
>   *	local_flush_tlb_page(vma, addr)
>   *		Local variant of flush_tlb_page().  Stale TLB entries may
> @@ -286,12 +295,6 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>   *		Same as local_flush_tlb_page() except MMU notifier will not be
>   *		called.
>   *
> - *	local_flush_tlb_contpte(vma, addr)
> - *		Invalidate the virtual-address range
> - *		'[addr, addr+CONT_PTE_SIZE)' mapped with contpte on local CPU
> - *		for the user address space corresponding to 'vma->mm'.  Stale
> - *		TLB entries may remain in remote CPUs.
> - *
>   *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
>   *	on top of these routines, since that is our interface to the mmu_gather
>   *	API as used by munmap() and friends.
> @@ -436,6 +439,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> +static __always_inline void rvae1(u64 arg)
> +{
> +	__tlbi(rvae1, arg);
> +	__tlbi_user(rvae1, arg);
> +}
> +
>  static __always_inline void rvae1is(u64 arg)
>  {
>  	__tlbi(rvae1is, arg);
> @@ -531,16 +540,18 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
>  typedef unsigned __bitwise tlbf_t;
>  #define TLBF_NONE		((__force tlbf_t)0)
>  #define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
> +#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
> +#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
> +#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
>  
> -static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> -				     unsigned long start, unsigned long end,
> -				     unsigned long stride, int tlb_level,
> -				     tlbf_t flags)
> +static __always_inline void ___flush_tlb_range(struct vm_area_struct *vma,
> +					unsigned long start, unsigned long end,
> +					unsigned long stride, int tlb_level,
> +					tlbf_t flags)
>  {
> +	struct mm_struct *mm = vma->vm_mm;
>  	unsigned long asid, pages;
>  
> -	start = round_down(start, stride);
> -	end = round_up(end, stride);
>  	pages = (end - start) >> PAGE_SHIFT;
>  
>  	if (__flush_tlb_range_limit_excess(pages, stride)) {
> @@ -548,17 +559,41 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  		return;
>  	}
>  
> -	dsb(ishst);
> +	if (!(flags & TLBF_NOBROADCAST))
> +		dsb(ishst);
> +	else
> +		dsb(nshst);
> +
>  	asid = ASID(mm);
>  
> -	if (flags & TLBF_NOWALKCACHE)
> -		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
> -				     asid, tlb_level);
> -	else
> +	switch (flags & (TLBF_NOWALKCACHE | TLBF_NOBROADCAST)) {
> +	case TLBF_NONE:
>  		__flush_s1_tlb_range_op(vae1is, start, pages, stride,
> -				     asid, tlb_level);
> +					asid, tlb_level);
> +		break;
> +	case TLBF_NOWALKCACHE:
> +		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
> +					asid, tlb_level);
> +		break;
> +	case TLBF_NOBROADCAST:
> +		__flush_s1_tlb_range_op(vae1, start, pages, stride,
> +					asid, tlb_level);
> +		break;
> +	case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
> +		__flush_s1_tlb_range_op(vale1, start, pages, stride,
> +					asid, tlb_level);
> +		break;
> +	}
>  
> -	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> +	if (!(flags & TLBF_NONOTIFY))
> +		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> +
> +	if (!(flags & TLBF_NOSYNC)) {
> +		if (!(flags & TLBF_NOBROADCAST))
> +			dsb(ish);
> +		else
> +			dsb(nsh);
> +	}
>  }
>  
>  static inline void __flush_tlb_range(struct vm_area_struct *vma,
> @@ -566,24 +601,9 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>  				     unsigned long stride, int tlb_level,
>  				     tlbf_t flags)
>  {
> -	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
> -				 tlb_level, flags);
> -	dsb(ish);
> -}
> -
> -static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
> -					   unsigned long addr)
> -{
> -	unsigned long asid;
> -
> -	addr = round_down(addr, CONT_PTE_SIZE);
> -
> -	dsb(nshst);
> -	asid = ASID(vma->vm_mm);
> -	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
> -						    addr + CONT_PTE_SIZE);
> -	dsb(nsh);
> +	start = round_down(start, stride);
> +	end = round_up(end, stride);
> +	___flush_tlb_range(vma, start, end, stride, tlb_level, flags);
>  }
>  
>  static inline void flush_tlb_range(struct vm_area_struct *vma,
> @@ -636,7 +656,10 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>  static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>  		struct mm_struct *mm, unsigned long start, unsigned long end)
>  {
> -	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, 3, TLBF_NOWALKCACHE);
> +	struct vm_area_struct vma = { .vm_mm = mm, .vm_flags = 0 };
> +
> +	__flush_tlb_range(&vma, start, end, PAGE_SIZE, 3,
> +			  TLBF_NOWALKCACHE | TLBF_NOSYNC);
>  }
>  
>  static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 1a12bb728ee1..ec17a0e70415 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -527,8 +527,8 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>  		 * eliding the trailing DSB applies here.
>  		 */
>  		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
> -					 PAGE_SIZE, 3, TLBF_NOWALKCACHE);
> +		__flush_tlb_range(vma, addr, addr + CONT_PTE_SIZE,
> +				  PAGE_SIZE, 3, TLBF_NOWALKCACHE | TLBF_NOSYNC);
>  	}
>  
>  	return young;
> @@ -623,7 +623,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>  
>  		if (dirty)
> -			local_flush_tlb_contpte(vma, start_addr);
> +			__flush_tlb_range(vma, start_addr,
> +					  start_addr + CONT_PTE_SIZE,
> +					  PAGE_SIZE, 3,
> +					  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);


 
local_flush_tlb_contpte used round_down(addr, CONT_PTE_SIZE) but then flush_tlb_range uses
round_down(start, stride) which is PAGE_SIZE and end up giving smaller alignment than 
required ?

--
Linu Cherian.



