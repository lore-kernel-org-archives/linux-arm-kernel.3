Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23990CD5823
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eSvWQJN7si0FwL7aqZMNra0heK9Zgm49vvu+8HpRlc=; b=4VZtTWq8DIpRucTVy/4Dw72a/m
	/9SV3i1luLsJl6+ffkM4ejUrpAWMbGa+f+CQWrTTORa/mIccRRqgooYZBDpcPuaq9YHXn1ojhVmdL
	Wu8F4iC3U8lXVjQrr6V8blSYbIK8zysfV76C3Qidj1L6F6gMk87yGE4r76CwZVCTdUA+Fltw4U0+b
	L5WSrDTCGuU52trJ+Cz0pWKHg/xxrD7ohk/ByyTosSoTOggfa8StTZc8QW9BKHxqQYH8LdMO2o9dQ
	Q3jipg/WZ+nHVN//oxuGg6sBMidaoqZ7BHG+WurZehRVZwPPlvgVGiDM+LY/NLc1hTXII+aSncjcU
	kqu1qEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQHt-0000000Ec4g-1HUy;
	Wed, 07 Jan 2026 09:57:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQHq-0000000Ec3z-3HxO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:57:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7456497;
	Wed,  7 Jan 2026 01:56:58 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDA773F6A8;
	Wed,  7 Jan 2026 01:57:04 -0800 (PST)
Date: Wed, 7 Jan 2026 15:27:01 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 12/13] arm64: mm: Wrap flush_tlb_page() around
 ___flush_tlb_range()
Message-ID: <aV4t7YajY8omwVHf@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-13-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-13-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015706_922455_A66FEF33 
X-CRM114-Status: GOOD (  30.20  )
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


On Tue, Dec 16, 2025 at 02:45:57PM +0000, Ryan Roberts wrote:
> Flushing a page from the tlb is just a special case of flushing a range.
> So let's rework flush_tlb_page() so that it simply wraps
> ___flush_tlb_range(). While at it, let's also update the API to take the
> same flags that we use when flushing a range. This allows us to delete
> all the ugly "_nosync", "_local" and "_nonotify" variants.
> 
> Thanks to constant folding, all of the complex looping and tlbi-by-range
> options get eliminated so that the generated code for flush_tlb_page()
> looks very similar to the previous version.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h  |  6 +--
>  arch/arm64/include/asm/tlbflush.h | 81 ++++++++++---------------------
>  arch/arm64/mm/fault.c             |  2 +-
>  3 files changed, 29 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 736747fbc843..b96a7ca465a1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -136,10 +136,10 @@ static inline void arch_leave_lazy_mmu_mode(void)
>   * entries exist.
>   */
>  #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
> -	local_flush_tlb_page_nonotify(vma, address)
> +	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>  
>  #define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
> -	local_flush_tlb_page_nonotify(vma, address)
> +	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>  
>  /*
>   * ZERO_PAGE is a global shared page that is always zero: used
> @@ -1351,7 +1351,7 @@ static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
>  		 * context-switch, which provides a DSB to complete the TLB
>  		 * invalidation.
>  		 */
> -		flush_tlb_page_nosync(vma, address);
> +		__flush_tlb_page(vma, address, TLBF_NOSYNC);
>  	}
>  
>  	return young;
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index ee747e66bbef..fa5aee990742 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -256,10 +256,7 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>   *		unmapping pages from vmalloc/io space.
>   *
>   *	flush_tlb_page(vma, addr)
> - *		Invalidate a single user mapping for address 'addr' in the
> - *		address space corresponding to 'vma->mm'.  Note that this
> - *		operation only invalidates a single, last-level page-table
> - *		entry and therefore does not affect any walk-caches.
> + *		Equivalent to __flush_tlb_page(..., flags=TLBF_NONE)
>   *
>   *
>   *	Next, we have some undocumented invalidation routines that you probably
> @@ -287,13 +284,14 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>   *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
>   *		(only perform the invalidation for the local cpu).
>   *
> - *	local_flush_tlb_page(vma, addr)
> - *		Local variant of flush_tlb_page().  Stale TLB entries may
> - *		remain in remote CPUs.
> - *
> - *	local_flush_tlb_page_nonotify(vma, addr)
> - *		Same as local_flush_tlb_page() except MMU notifier will not be
> - *		called.
> + *	__flush_tlb_page(vma, addr, flags)
> + *		Invalidate a single user mapping for address 'addr' in the
> + *		address space corresponding to 'vma->mm'.  Note that this
> + *		operation only invalidates a single, last-level page-table entry
> + *		and therefore does not affect any walk-caches. flags may contain
> + *		any combination of TLBF_NONOTIFY (don't call mmu notifiers),
> + *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
> + *		(only perform the invalidation for the local cpu).
>   *
>   *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
>   *	on top of these routines, since that is our interface to the mmu_gather
> @@ -327,51 +325,6 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>  
> -static inline void __local_flush_tlb_page_nonotify_nosync(struct mm_struct *mm,
> -							  unsigned long uaddr)
> -{
> -	dsb(nshst);
> -	__tlbi_level_asid(vale1, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
> -}
> -
> -static inline void local_flush_tlb_page_nonotify(struct vm_area_struct *vma,
> -						 unsigned long uaddr)
> -{
> -	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> -	dsb(nsh);
> -}
> -
> -static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> -					unsigned long uaddr)
> -{
> -	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
> -						(uaddr & PAGE_MASK) + PAGE_SIZE);
> -	dsb(nsh);
> -}
> -
> -static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> -					   unsigned long uaddr)
> -{
> -	dsb(ishst);
> -	__tlbi_level_asid(vale1is, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
> -	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
> -						(uaddr & PAGE_MASK) + PAGE_SIZE);
> -}
> -
> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> -					 unsigned long uaddr)
> -{
> -	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> -}
> -
> -static inline void flush_tlb_page(struct vm_area_struct *vma,
> -				  unsigned long uaddr)
> -{
> -	flush_tlb_page_nosync(vma, uaddr);
> -	dsb(ish);
> -}
> -
>  static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>  {
>  	/*
> @@ -618,6 +571,22 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  	__flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN, TLBF_NONE);
>  }
>  
> +static inline void __flush_tlb_page(struct vm_area_struct *vma,
> +				    unsigned long uaddr, tlbf_t flags)
> +{
> +	unsigned long start = round_down(uaddr, PAGE_SIZE);
> +	unsigned long end = start + PAGE_SIZE;
> +
> +	___flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
> +			   TLBF_NOWALKCACHE | flags);
> +}
> +
> +static inline void flush_tlb_page(struct vm_area_struct *vma,
> +				  unsigned long uaddr)
> +{
> +	__flush_tlb_page(vma, uaddr, TLBF_NONE);
> +}
> +
>  static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
>  	const unsigned long stride = PAGE_SIZE;
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index be9dab2c7d6a..f91aa686f142 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -239,7 +239,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>  	 * flush_tlb_fix_spurious_fault().
>  	 */
>  	if (dirty)
> -		local_flush_tlb_page(vma, address);
> +		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);
>  	return 1;
>  }

Reviewed-by: Linu Cherian <linu.cherian@arm.com>


