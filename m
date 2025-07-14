Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5601C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyTxc8pb4TA91BRRqfUYU0R6j5aQ+IyfezW3qbGKOdM=; b=rNUy+iR56u6Bfmgkx2mFaE46cc
	HT1vFuUHrUZIF7Lk3hE8SQeEu25wckxFpF8gfSL8VR/3lnKOwiSQ1KppRN8eHcdQ4coDdfe1JJKoA
	fRgtNc+0kvd7a6PW1DEsjfMb1fOxgvmckHoNmpaUN9MFEIqzlvfSd7pYTW/4wsOPGS2vlbjPxyln6
	IV5ingfEpcqJohOpPydWcV4bJ6695NDqhG5aT0Z9PzfW1fK/cMxkXfHiALaQNezRyH4V4sGXKz6Jo
	F+ncXLtIOuXPpbH/Bd2Lofo4kFK2vxn+ir2BSDeooyJaSdRndaTVuh5yvVtLZTOSR5Ua6z0xPFl4t
	ZIXRNciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEnS-00000001g8V-1l45;
	Mon, 14 Jul 2025 08:44:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEWB-00000001e1G-3a5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:26:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071CC1764;
	Mon, 14 Jul 2025 01:26:26 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45723F66E;
	Mon, 14 Jul 2025 01:26:33 -0700 (PDT)
Message-ID: <65b4f0b6-3b0f-4d9b-a034-5031dc889abd@arm.com>
Date: Mon, 14 Jul 2025 09:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] arm64: mm: Introduce a C wrapper for by-range TLB
 invalidation helpers
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-3-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-3-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_012635_940871_D206B370 
X-CRM114-Status: GOOD (  17.96  )
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
> In preparation for reducing our reliance on complex preprocessor macros
> for TLB invalidation routines, introduce a new C wrapper for by-range
> TLB invalidation helpers which can be used instead of the __tlbi() macro
> and can additionally be called from C code.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 1c7548ec6cb7..4408aeebf4d5 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -418,6 +418,24 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> +#define __GEN_TLBI_OP_CASE(op)						\
> +	case op:							\
> +		__tlbi(r ## op, arg);					\
> +		break
> +
> +static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)

nit: you called the level version __tlbi_level_op(). Why not call this
__tlbi_range_op() for consistency?

> +{
> +	switch (op) {
> +	__GEN_TLBI_OP_CASE(vae1is);
> +	__GEN_TLBI_OP_CASE(vale1is);
> +	__GEN_TLBI_OP_CASE(vaale1is);
> +	__GEN_TLBI_OP_CASE(ipas2e1is);
> +	default:
> +		BUILD_BUG();
> +	}
> +}
> +#undef __GEN_TLBI_OP_CASE
> +
>  #define __flush_tlb_range_op(op, start, pages, stride,			\
>  				asid, tlb_level, tlbi_user, lpa2)	\
>  do {									\
> @@ -445,7 +463,7 @@ do {									\
>  		if (num >= 0) {						\
>  			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
>  						scale, num, tlb_level);	\
> -			__tlbi(r##op, addr);				\
> +			__tlbi_range(op, addr);				\
>  			if (tlbi_user)					\
>  				__tlbi_user(r##op, addr);		\
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \


