Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA754C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3nJGDsfLa13IFaPLgYB0xBvGAQkHOGraOYc1DGLgtc=; b=l8pzs2AG7pOjHSF3JG1AJyi7Aq
	5aHOjpniJNaMOLxkSpocovcYfs4SpVBWDrUFHICedtn9L/2KuJ5T7dlTErImRqr3RoG+Pa5ZSIANx
	vjO+PLwtbnbojFjg0s6LSpTIrxoY3HQKq1fQ7T/nN90kJR2pppfmm+1r/R41qhUt6drldZhvUlXjc
	s6dB6GgcrEkrwcqRMdaPyF/Wa10h6E8fDfJ6AXYhht/qkQ+wkbyc4dgWT1BK7F8/5YKo8BzVE4GUB
	9U1b3YTFTuiBHVc99g1L8o5vGIDIRJjaRJmyXQJdmGIYpKK++ZZWeFDjo3GUzJy9STKowl/Tg0IsH
	/xyUAsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdDr-0000000Aq43-0bEj;
	Mon, 05 Jan 2026 05:33:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcdDo-0000000Aq3g-2cRp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 05:33:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AEA6339;
	Sun,  4 Jan 2026 21:33:31 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF703F694;
	Sun,  4 Jan 2026 21:33:37 -0800 (PST)
Date: Mon, 5 Jan 2026 11:03:34 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 02/13] arm64: mm: Introduce a C wrapper for by-range
 TLB invalidation
Message-ID: <aVtNLmXgaxwPXG6q@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_213340_723705_8BCCE203 
X-CRM114-Status: GOOD (  22.76  )
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

On Tue, Dec 16, 2025 at 02:45:47PM +0000, Ryan Roberts wrote:
> As part of efforts to reduce our reliance on complex preprocessor macros
> for TLB invalidation routines, introduce a new C wrapper for by-range
> TLB invalidation which can be used instead of the __tlbi() macro and can
> additionally be called from C code.
> 
> Each specific tlbi range op is implemented as a C function and the
> appropriate function pointer is passed to __tlbi_range(). Since
> everything is declared inline and is statically resolvable, the compiler
> will convert the indirect function call to a direct inline execution.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 33 ++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 13a59cf28943..c5111d2afc66 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -459,6 +459,37 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>   *    operations can only span an even number of pages. We save this for last to
>   *    ensure 64KB start alignment is maintained for the LPA2 case.
>   */
> +static __always_inline void rvae1is(u64 arg)
> +{
> +	__tlbi(rvae1is, arg);
> +}
> +
> +static __always_inline void rvale1(u64 arg)
> +{
> +	__tlbi(rvale1, arg);
> +	__tlbi_user(rvale1, arg);

Should this __tlbi_user be added as part of patch 3 ?

> +}
> +
> +static __always_inline void rvale1is(u64 arg)
> +{
> +	__tlbi(rvale1is, arg);
> +}
> +
> +static __always_inline void rvaale1is(u64 arg)
> +{
> +	__tlbi(rvaale1is, arg);
> +}
> +
> +static __always_inline void ripas2e1is(u64 arg)
> +{
> +	__tlbi(ripas2e1is, arg);
> +}
> +
> +static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
> +{
> +	op(arg);
> +}
> +
>  #define __flush_tlb_range_op(op, start, pages, stride,			\
>  				asid, tlb_level, tlbi_user, lpa2)	\
>  do {									\
> @@ -486,7 +517,7 @@ do {									\
>  		if (num >= 0) {						\
>  			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
>  						scale, num, tlb_level);	\
> -			__tlbi(r##op, addr);				\
> +			__tlbi_range(r##op, addr);			\
>  			if (tlbi_user)					\
>  				__tlbi_user(r##op, addr);		\
>  			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
> -- 
> 2.43.0
> 

