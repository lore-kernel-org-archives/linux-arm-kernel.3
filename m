Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B7DC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1j2uapmNQWyEzpK5UxbpWbS0I1720u4wxkbEmi1Tyk=; b=PgM+XRMa2KVaD7Jedkmzb4RW2J
	K6+RB1w26Zh8fRDZNWzqOEGmVBFfc/rsyHX8blS2s7JmJY0D9YMsKro7Pis+qGoc6pBsotW7m5sZe
	WD6gnxNklNIRTALqDJ7cRXnmbBGqZkyZPWcjqH2kkFrJ36Ax4ynsNsKCmHjOAWnCvPrLAQgB3Rkt7
	HcBjJ19eQep9xNxBWPjp50Mi74fzSd3qVPkNQ3tlzfCJIrdzWJM8UPYNR0oswHuGvOv1e6D6f4ptr
	9Otonq0omwmay2uSs97tJQzFxwyjYePHllg9u5NQAxTnMtVBMvxaWX0drNSLKmJLcMQ8bZt+JglsS
	AsDqD+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdEd-0000000AqA9-1yVO;
	Mon, 05 Jan 2026 05:34:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdEa-0000000Aq9j-1RC0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 05:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49FA9497;
	Sun,  4 Jan 2026 21:34:20 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 504D73F694;
	Sun,  4 Jan 2026 21:34:26 -0800 (PST)
Date: Mon, 5 Jan 2026 11:04:22 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/13] arm64: mm: Implicitly invalidate user ASID
 based on TLBI operation
Message-ID: <aVtNXhd1VRfktfAx@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-4-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_213428_456509_34282DBC 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Ryan,

On Tue, Dec 16, 2025 at 02:45:48PM +0000, Ryan Roberts wrote:
> When kpti is enabled, separate ASIDs are used for userspace and
> kernelspace, requiring ASID-qualified TLB invalidation by virtual
> address to invalidate both of them.
> 
> Push the logic for invalidating the two ASIDs down into the low-level
> tlbi-op-specific functions and remove the burden from the caller to
> handle the kpti-specific behaviour.
> 
> Co-developed-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index c5111d2afc66..31f43d953ce2 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -110,6 +110,7 @@ typedef void (*tlbi_op)(u64 arg);
>  static __always_inline void vae1is(u64 arg)
>  {
>  	__tlbi(vae1is, arg);
> +	__tlbi_user(vae1is, arg);
>  }
>  
>  static __always_inline void vae2is(u64 arg)
> @@ -126,6 +127,7 @@ static __always_inline void vale1(u64 arg)
>  static __always_inline void vale1is(u64 arg)
>  {
>  	__tlbi(vale1is, arg);
> +	__tlbi_user(vale1is, arg);
>  }
>  
>  static __always_inline void vale2is(u64 arg)
> @@ -162,11 +164,6 @@ static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>  	op(arg);
>  }
>  
> -#define __tlbi_user_level(op, arg, level) do {				\
> -	if (arm64_kernel_unmapped_at_el0())				\
> -		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
> -} while (0)
> -
>  /*
>   * This macro creates a properly formatted VA operand for the TLB RANGE. The
>   * value bit assignments are:
> @@ -435,8 +432,6 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   * @stride:	Flush granularity
>   * @asid:	The ASID of the task (0 for IPA instructions)
>   * @tlb_level:	Translation Table level hint, if known
> - * @tlbi_user:	If 'true', call an additional __tlbi_user()
> - *              (typically for user ASIDs). 'flase' for IPA instructions
>   * @lpa2:	If 'true', the lpa2 scheme is used as set out below
>   *
>   * When the CPU does not support TLB range operations, flush the TLB
> @@ -462,6 +457,7 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  static __always_inline void rvae1is(u64 arg)
>  {
>  	__tlbi(rvae1is, arg);
> +	__tlbi_user(rvae1is, arg);
>  }
>  
>  static __always_inline void rvale1(u64 arg)
> @@ -473,6 +469,7 @@ static __always_inline void rvale1(u64 arg)
>  static __always_inline void rvale1is(u64 arg)
>  {
>  	__tlbi(rvale1is, arg);
> +	__tlbi_user(rvale1is, arg);
>  }
>  
>  static __always_inline void rvaale1is(u64 arg)
> @@ -491,7 +488,7 @@ static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
>  }
>  
>  #define __flush_tlb_range_op(op, start, pages, stride,			\
> -				asid, tlb_level, tlbi_user, lpa2)	\
> +				asid, tlb_level, lpa2)			\
>  do {									\
>  	typeof(start) __flush_start = start;				\
>  	typeof(pages) __flush_pages = pages;				\
> @@ -506,8 +503,6 @@ do {									\
>  		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
>  			addr = __TLBI_VADDR(__flush_start, asid);	\
>  			__tlbi_level(op, addr, tlb_level);		\
> -			if (tlbi_user)					\
> -				__tlbi_user_level(op, addr, tlb_level);	\
>  			__flush_start += stride;			\
>  			__flush_pages -= stride >> PAGE_SHIFT;		\
>  			continue;					\
> @@ -518,8 +513,6 @@ do {									\
>  			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
>  						scale, num, tlb_level);	\
>  			__tlbi_range(r##op, addr);			\
> -			if (tlbi_user)					\
> -				__tlbi_user(r##op, addr);		\
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
>  			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
>  		}							\
> @@ -528,7 +521,7 @@ do {									\
>  } while (0)
>  
>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
> -	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false, kvm_lpa2_is_enabled());
> +	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
>  
>  static inline bool __flush_tlb_range_limit_excess(unsigned long start,
>  		unsigned long end, unsigned long pages, unsigned long stride)
> @@ -568,10 +561,10 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  
>  	if (last_level)
>  		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
> -				     tlb_level, true, lpa2_is_enabled());
> +				     tlb_level, lpa2_is_enabled());
>  	else
>  		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
> -				     tlb_level, true, lpa2_is_enabled());
> +				     tlb_level, lpa2_is_enabled());
>  
>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>  }
> @@ -630,7 +623,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  
>  	dsb(ishst);
>  	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
> -			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
> +			     TLBI_TTL_UNKNOWN, lpa2_is_enabled());
>  	dsb(ish);
>  	isb();



 __flush_tlb_range_op call in local_flush_tlb_contpte is missed out.


--
Linu Cherian

