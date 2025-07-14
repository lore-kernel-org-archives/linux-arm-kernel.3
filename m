Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7197AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvzWS/7yddC/3Sn7lV+ftPf4ugqVEafl3R2jt48KMJw=; b=VwY1rIrRclZc2PfA3RCHFmQMIm
	2lCGPlLiR27FXPm7lFpwfVQsenPf1Ws9Ny/GjW9dS4D9Iqg3D26us83+wk396vxoO2JCqSBfDymVx
	0DJsrhM/mX1xUutvs5N1J7WAulDWSNyorbpE3Bc01v8QyWwOdBCxbzbS5SD8REwwVgSXEAQha65d5
	/ai2/7/vbKczPGjMZxxC07T++ycmmln7neYd5HaL54kdzCWQXxRIx0YqfsGAasVubRe/yomvW+gu0
	q0ibkj56gW69znZQ8KWsXJjsvNCliLQXlkxodB2sGGbgsnPVhQmeSU7l4Tx1ny54dxOzG68xogTAb
	RQSBUYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEsF-00000001gnZ-45Xe;
	Mon, 14 Jul 2025 08:49:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEnB-00000001g6Y-1QIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:44:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E5301764;
	Mon, 14 Jul 2025 01:43:59 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 008313F66E;
	Mon, 14 Jul 2025 01:44:03 -0700 (PDT)
Message-ID: <9dccf004-1ac4-45ae-9098-69fcad7107a8@arm.com>
Date: Mon, 14 Jul 2025 09:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] arm64: mm: Implicitly invalidate user ASID based on
 TLBI operation
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-4-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-4-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_014409_472305_FA10C5C2 
X-CRM114-Status: GOOD (  19.45  )
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
> When kpti is enabled, separate ASIDs are used for userspace and
> kernelspace, requiring ASID-qualified TLB invalidation by virtual
> address to invalidate both of them.
> 
> Push the logic for invalidating the two ASIDs down into the low-level
> __tlbi_level_op() function based on the TLBI operation and remove the
> burden from the caller to handle the kpti-specific behaviour.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/tlbflush.h | 45 ++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 4408aeebf4d5..08e509f37b28 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -115,17 +115,25 @@ enum tlbi_op {
>  
>  #define TLBI_TTL_UNKNOWN	INT_MAX
>  
> -#define __GEN_TLBI_OP_CASE(op)						\
> +#define ___GEN_TLBI_OP_CASE(op)						\
>  	case op:							\
> -		__tlbi(op, arg);					\
> +		__tlbi(op, arg)
> +
> +#define __GEN_TLBI_OP_ASID_CASE(op)					\
> +	___GEN_TLBI_OP_CASE(op);					\
> +		__tlbi_user(op, arg);					\
> +		break
> +
> +#define __GEN_TLBI_OP_CASE(op)						\
> +	___GEN_TLBI_OP_CASE(op);					\
>  		break
>  
>  static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
>  {
>  	switch (op) {
> -	__GEN_TLBI_OP_CASE(vae1is);
> +	__GEN_TLBI_OP_ASID_CASE(vae1is);
>  	__GEN_TLBI_OP_CASE(vae2is);
> -	__GEN_TLBI_OP_CASE(vale1is);
> +	__GEN_TLBI_OP_ASID_CASE(vale1is);
>  	__GEN_TLBI_OP_CASE(vale2is);
>  	__GEN_TLBI_OP_CASE(vaale1is);
>  	__GEN_TLBI_OP_CASE(ipas2e1);
> @@ -134,7 +142,8 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
>  		BUILD_BUG();
>  	}
>  }
> -#undef __GEN_TLBI_OP_CASE
> +#undef __GEN_TLBI_OP_ASID_CASE
> +#undef ___GEN_TLBI_OP_CASE
>  
>  #define __tlbi_level(op, addr, level) do {				\
>  	u64 arg = addr;							\
> @@ -150,11 +159,6 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
>  	__tlbi_level_op(op, arg);					\
>  } while(0)
>  
> -#define __tlbi_user_level(op, arg, level) do {				\
> -	if (arm64_kernel_unmapped_at_el0())				\
> -		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
> -} while (0)
> -
>  /*
>   * This macro creates a properly formatted VA operand for the TLB RANGE. The
>   * value bit assignments are:
> @@ -418,22 +422,28 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> -#define __GEN_TLBI_OP_CASE(op)						\
> +#define ___GEN_TLBI_OP_CASE(op)						\
>  	case op:							\
> -		__tlbi(r ## op, arg);					\
> +		__tlbi(r ## op, arg)
> +
> +#define __GEN_TLBI_OP_ASID_CASE(op)					\
> +	___GEN_TLBI_OP_CASE(op);					\
> +		__tlbi_user(r ## op, arg);				\
>  		break
>  
>  static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
>  {
>  	switch (op) {
> -	__GEN_TLBI_OP_CASE(vae1is);
> -	__GEN_TLBI_OP_CASE(vale1is);
> +	__GEN_TLBI_OP_ASID_CASE(vae1is);
> +	__GEN_TLBI_OP_ASID_CASE(vale1is);
>  	__GEN_TLBI_OP_CASE(vaale1is);
>  	__GEN_TLBI_OP_CASE(ipas2e1is);

Bug? This 2 underscore version is still defined from the level case above. So
this is no longer issuing a range-based tlbi? (i.e. you're no longer prepending
the "r" here.

>  	default:
>  		BUILD_BUG();
>  	}
>  }
> +#undef __GEN_TLBI_OP_ASID_CASE
> +#undef ___GEN_TLBI_OP_CASE
>  #undef __GEN_TLBI_OP_CASE
>  
>  #define __flush_tlb_range_op(op, start, pages, stride,			\
> @@ -452,8 +462,6 @@ do {									\
>  		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
>  			addr = __TLBI_VADDR(__flush_start, asid);	\
>  			__tlbi_level(op, addr, tlb_level);		\
> -			if (tlbi_user)					\
> -				__tlbi_user_level(op, addr, tlb_level);	\
>  			__flush_start += stride;			\
>  			__flush_pages -= stride >> PAGE_SHIFT;		\
>  			continue;					\
> @@ -464,8 +472,6 @@ do {									\
>  			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
>  						scale, num, tlb_level);	\
>  			__tlbi_range(op, addr);				\
> -			if (tlbi_user)					\
> -				__tlbi_user(r##op, addr);		\
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
>  			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
>  		}							\
> @@ -584,6 +590,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>  {
>  	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>  }
> -#endif
>  
> +#undef __tlbi_user
> +#endif
>  #endif


