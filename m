Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3325C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydyhu3OX4rvsnxJGAH9XqKC9KTzVKq+1IB9Qjm9knuE=; b=1ycYplS4PGby8yLz3tqoPMkqhR
	yz9V7Gxb6JlTe+WDuGQ3d9TX9QQv/xteIgNaV0UdPL1wJGB4fYplkmgof0iyP7G3CulcoWQPkgb3M
	4EGHdrVT/dLO2VRZY0UrXUD5Z15KQIA0k8r7njxyTBC4ryDeRFossoU0d+nnAkJ/bJaSXEwMzvarX
	GAlUlGHmXiQBYbPjUS4U9PE8KgNSOHVQNzJTqvIEhODedtRPtsyoojO8ns9A71udbAPlQf2QEXnT4
	WbMfwNpHkiIzan37fqHkGFVHQoDoRDCaOeZbRoDGZpbgVy8XEsVN7M3q8zQQ+gmoM5lPW5EnuNGEG
	bScY5NUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG5Z-00000001sg3-2SYP;
	Mon, 14 Jul 2025 10:07:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFjK-00000001p08-0hL2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:44:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04D151BC0;
	Mon, 14 Jul 2025 02:44:04 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1FE3F694;
	Mon, 14 Jul 2025 02:44:11 -0700 (PDT)
Message-ID: <1e650a1d-5c45-4d15-8b90-88c39785ff7b@arm.com>
Date: Mon, 14 Jul 2025 10:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: mm: Re-implement the __flush_tlb_range_op
 macro in C
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-11-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-11-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024414_295709_0E0532DC 
X-CRM114-Status: GOOD (  23.64  )
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

On 11/07/2025 17:17, Will Deacon wrote:
> The __flush_tlb_range_op() macro is horrible and has been a previous

Amen to that!

> source of bugs thanks to multiple expansions of its arguments (see
> commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).
> 
> Rewrite the thing in C.

This looks much better! Do we know it's definitely valuable to have all these
functions inline though? They have grown a lot over the years. I wonder how much
code size cost they have, vs the performance they actually save?

Perhaps it's worth considering if at least these should move to a c file?

__flush_tlb_range_nosync
flush_tlb_kernel_range


FYI, I've got a patch that uses local tlbi when we can prove only the local cpu
has seen the old pgtable entries that we are trying to flush. These changes to
use enum tlbi_op make that patch quite a bit neater. I'll post that as an RFC at
some point, as I expect it will need quite a bit of discussion.

Thanks,
Ryan


> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/include/asm/tlbflush.h | 63 +++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 2541863721af..ee69efdc12ab 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -376,12 +376,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  /*
>   * __flush_tlb_range_op - Perform TLBI operation upon a range
>   *
> - * @op:	TLBI instruction that operates on a range (has 'r' prefix)
> + * @op:		TLBI instruction that operates on a range
>   * @start:	The start address of the range
>   * @pages:	Range as the number of pages from 'start'
>   * @stride:	Flush granularity
>   * @asid:	The ASID of the task (0 for IPA instructions)
> - * @tlb_level:	Translation Table level hint, if known
> + * @level:	Translation Table level hint, if known
>   * @lpa2:	If 'true', the lpa2 scheme is used as set out below
>   *
>   * When the CPU does not support TLB range operations, flush the TLB
> @@ -439,33 +439,38 @@ static __always_inline void __tlbi_range(const enum tlbi_op op, u64 addr,
>  #undef ___GEN_TLBI_OP_CASE
>  #undef __GEN_TLBI_OP_CASE
>  
> -#define __flush_tlb_range_op(op, start, pages, stride,			\
> -				asid, tlb_level, lpa2)			\
> -do {									\
> -	typeof(start) __flush_start = start;				\
> -	typeof(pages) __flush_pages = pages;				\
> -	int num = 0;							\
> -	int scale = 3;							\
> -									\
> -	while (__flush_pages > 0) {					\
> -		if (!system_supports_tlb_range() ||			\
> -		    __flush_pages == 1 ||				\
> -		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
> -			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
> -			__flush_start += stride;			\
> -			__flush_pages -= stride >> PAGE_SHIFT;		\
> -			continue;					\
> -		}							\
> -									\
> -		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
> -		if (num >= 0) {						\
> -			__tlbi_range(op, __flush_start, asid, scale, num, tlb_level, lpa2); \
> -			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
> -			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
> -		}							\
> -		scale--;						\
> -	}								\
> -} while (0)
> +static __always_inline void __flush_tlb_range_op(const enum tlbi_op op,
> +						 u64 start, size_t pages,
> +						 u64 stride, u16 asid,
> +						 u32 level, bool lpa2)
> +{
> +	u64 addr = start, end = start + pages * PAGE_SIZE;
> +	int scale = 3;
> +
> +	while (addr != end) {
> +		int num;
> +
> +		pages = (end - addr) >> PAGE_SHIFT;
> +
> +		if (!system_supports_tlb_range() || pages == 1)
> +			goto invalidate_one;
> +
> +		if (lpa2 && !IS_ALIGNED(addr, SZ_64K))
> +			goto invalidate_one;
> +
> +		num = __TLBI_RANGE_NUM(pages, scale);
> +		if (num >= 0) {
> +			__tlbi_range(op, addr, asid, scale, num, level, lpa2);
> +			addr += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
> +		}
> +
> +		scale--;
> +		continue;
> +invalidate_one:
> +		__tlbi_level_asid(op, addr, level, asid);
> +		addr += stride;
> +	}
> +}
>  
>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>  	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());


