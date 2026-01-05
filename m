Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DBDC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyzGeAHexbaUBEitz5TlegABfGwoZuFVsiR/v3zIfg0=; b=nLRKYJ7nhVqrUa+IKJ1dQPm+TQ
	eY+EWhzMK6f2wBR/Fagf4B/ZVy6qX4MuKTjQxe6x6IHzEBpEL9q7E97nxDMsjg1QD6jw7t1uppgv0
	glWY8rGtUpZ02W2Q80kPFxLj7TjsWQIjvZSbeDDwnpcQxOs1SiEbHlJRNp1bGDBo30Qi0N7OiMZri
	YJig1s0nyqykXvaVNMDQwp2Bb8m89a4BrJ+lWT/+totnAHw8Dd91oJKfP0VnUzI3VtS+673Sg1NdK
	OvWTnomnzrm63euXMo5zVBpbChjS/LpQScRTojVpIF/Y9+YF7rafeGAR4YIXNdI1VIg2WzI52MfIg
	LHUCsBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdFw-0000000AqOW-2ePJ;
	Mon, 05 Jan 2026 05:35:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdFu-0000000AqNp-0RAG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 05:35:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7EF6339;
	Sun,  4 Jan 2026 21:35:41 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE4123F694;
	Sun,  4 Jan 2026 21:35:47 -0800 (PST)
Date: Mon, 5 Jan 2026 11:05:44 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/13] arm64: mm: Inline __TLBI_VADDR_RANGE() into
 __tlbi_range()
Message-ID: <aVtNsF8gpO1BjG2F@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-6-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-6-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_213550_259088_F36F0622 
X-CRM114-Status: GOOD (  20.28  )
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


On Tue, Dec 16, 2025 at 02:45:50PM +0000, Ryan Roberts wrote:
> From: Will Deacon <will@kernel.org>
> 
> The __TLBI_VADDR_RANGE() macro is only used in one place and isn't
> something that's generally useful outside of the low-level range
> invalidation gubbins.
> 
> Inline __TLBI_VADDR_RANGE() into the __tlbi_range() function so that the
> macro can be removed entirely.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 32 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 39717f98c31e..887dd1f05a89 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -195,19 +195,6 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
>  #define TLBIR_TTL_MASK		GENMASK_ULL(38, 37)
>  #define TLBIR_BADDR_MASK	GENMASK_ULL(36,  0)
>  
> -#define __TLBI_VADDR_RANGE(baddr, asid, scale, num, ttl)		\
> -	({								\
> -		unsigned long __ta = 0;					\
> -		unsigned long __ttl = (ttl >= 1 && ttl <= 3) ? ttl : 0;	\
> -		__ta |= FIELD_PREP(TLBIR_BADDR_MASK, baddr);		\
> -		__ta |= FIELD_PREP(TLBIR_TTL_MASK, __ttl);		\
> -		__ta |= FIELD_PREP(TLBIR_NUM_MASK, num);		\
> -		__ta |= FIELD_PREP(TLBIR_SCALE_MASK, scale);		\
> -		__ta |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());	\
> -		__ta |= FIELD_PREP(TLBIR_ASID_MASK, asid);		\
> -		__ta;							\
> -	})
> -
>  /* These macros are used by the TLBI RANGE feature. */
>  #define __TLBI_RANGE_PAGES(num, scale)	\
>  	((unsigned long)((num) + 1) << (5 * (scale) + 1))
> @@ -488,8 +475,19 @@ static __always_inline void ripas2e1is(u64 arg)
>  	__tlbi(ripas2e1is, arg);
>  }
>  
> -static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
> +static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
> +					 u16 asid, int scale, int num,
> +					 u32 level, bool lpa2)
>  {
> +	u64 arg = 0;
> +
> +	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
> +	arg |= FIELD_PREP(TLBIR_TTL_MASK, level > 3 ? 0 : level);
> +	arg |= FIELD_PREP(TLBIR_NUM_MASK, num);
> +	arg |= FIELD_PREP(TLBIR_SCALE_MASK, scale);
> +	arg |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());
> +	arg |= FIELD_PREP(TLBIR_ASID_MASK, asid);
> +
>  	op(arg);
>  }
>  
> @@ -500,8 +498,6 @@ do {									\
>  	typeof(pages) __flush_pages = pages;				\
>  	int num = 0;							\
>  	int scale = 3;							\
> -	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
> -	unsigned long addr;						\
>  									\
>  	while (__flush_pages > 0) {					\
>  		if (!system_supports_tlb_range() ||			\
> @@ -515,9 +511,7 @@ do {									\
>  									\
>  		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
>  		if (num >= 0) {						\
> -			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
> -						scale, num, tlb_level);	\
> -			__tlbi_range(r##op, addr);			\
> +			__tlbi_range(r##op, __flush_start, asid, scale, num, tlb_level, lpa2); \
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
>  			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
>  		}							\
> -- 
> 2.43.0
> 

Reviewed-by: Linu Cherian <linu.cherian@arm.com>

