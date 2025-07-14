Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A44C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5qoKFFJ1dLm2Fshq3tMXNMlRF940fVitTxS+CiBs9M=; b=C/jhjnmEZYBr0MLUjtcKx/HPOp
	r0eOR4/myNiLMXJUfMd5jIQkksKINCJkK7uvV5d7b3al/42/yhe3lOmzup8npTI7rXIgn8BVhkrF5
	DHw/eUT/HoSsZvlcLoueGJ75+6yem2O08rLo6sdcfl6X51rCtk36CaFo9GoZXt9K3JMqHynvqnAVw
	m2OUFgDTxN0xXmIS76HijzJMEvbBaP2wD+30U99oSp1YezclCYzBVzqaje1JVgEC21fTcY9zwUw6J
	mSnc4RzMhciOmSYPAZeGUnFiI5ctWewEkLO0Wt8XcbyfYPMXlchFCMJWW5w2nrjDmZvF+bS/sRSkl
	EFSbfdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFM3-00000001lyF-1LVN;
	Mon, 14 Jul 2025 09:20:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFJW-00000001lGv-2mWb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DF721764;
	Mon, 14 Jul 2025 02:17:24 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EE553F694;
	Mon, 14 Jul 2025 02:17:32 -0700 (PDT)
Message-ID: <e3c6b8a5-083e-4993-8a87-9fe96af0763d@arm.com>
Date: Mon, 14 Jul 2025 10:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: mm: Inline __TLBI_VADDR_RANGE() into
 __tlbi_range()
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-9-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-9-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_021734_790536_644C3A93 
X-CRM114-Status: GOOD (  18.05  )
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
> The __TLBI_VADDR_RANGE() macro is only used in one place and isn't
> something that's generally useful outside of the low-level range
> invalidation gubbins.
> 
> Inline __TLBI_VADDR_RANGE() into the __tlbi_range() function so that the
> macro can be removed entirely.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h | 32 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 434b9fdb340a..8618a85d5cd3 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -185,19 +185,6 @@ static inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)
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
> @@ -426,8 +413,19 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  		__tlbi_user(r ## op, arg);				\
>  		break
>  
> -static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
> +static __always_inline void __tlbi_range(const enum tlbi_op op, u64 addr,
> +					 u16 asid, int scale, int num,
> +					 u32 level, bool lpa2)

Same comment about signedness of level; I think it would be marginally less
confusing to consistently consider level as signed, and it will help us when we
get to D128 pgtables.

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
>  	switch (op) {
>  	__GEN_TLBI_OP_ASID_CASE(vae1is);
>  	__GEN_TLBI_OP_ASID_CASE(vale1is);
> @@ -448,8 +446,6 @@ do {									\
>  	typeof(pages) __flush_pages = pages;				\
>  	int num = 0;							\
>  	int scale = 3;							\
> -	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
> -	unsigned long addr;						\
>  									\
>  	while (__flush_pages > 0) {					\
>  		if (!system_supports_tlb_range() ||			\
> @@ -463,9 +459,7 @@ do {									\
>  									\
>  		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
>  		if (num >= 0) {						\
> -			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
> -						scale, num, tlb_level);	\
> -			__tlbi_range(op, addr);				\
> +			__tlbi_range(op, __flush_start, asid, scale, num, tlb_level, lpa2); \
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
>  			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
>  		}							\


