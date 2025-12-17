Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B4D637A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDb+p1XS9tbqYZm0GgN48he48Afc9fp1imRuzBzYL68=; b=EVYClL5rHttejdh1axl5HPE/Nd
	KHYR4Jt3hGQv1oDqC6z4b1CKvNPrXKx8q0R6Ns2iyJkto5oNWGK26m/HwInPItO246jT/X7FGToMU
	FzTw7Bpb8HcCOr6PO8NbakLjS1hS6aCcPSQnioLKCyDQGewCZ7cTzH04xhY0uCyWeyx1yF5OK2Wix
	xSyFrJyhiNcquSgRO/kAdv0p3+aVcg/OXhHiOJ3YoUIt/vW+2PEoI/2AZYGnMqSwBlzKOAJIjati0
	0tH4NiPUgB+ku+0P0aR3II1MQ/T9WHPKU0KzgwS2lLtxRWSOp8ylApCEfvYMyLDHDe4SvMTTxk4N/
	wSr8+VBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVme0-00000006KA4-2STt;
	Wed, 17 Dec 2025 08:12:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmdx-00000006K9Q-3cNq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:12:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D0DAFEC;
	Wed, 17 Dec 2025 00:12:13 -0800 (PST)
Received: from [10.164.18.63] (MacBook-Pro.blr.arm.com [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91EB93F73F;
	Wed, 17 Dec 2025 00:12:17 -0800 (PST)
Message-ID: <3de2b568-66f8-432f-a501-b19ca6c3a805@arm.com>
Date: Wed, 17 Dec 2025 13:42:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/13] arm64: mm: Simplify
 __flush_tlb_range_limit_excess()
To: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Linu Cherian <Linu.Cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-9-ryan.roberts@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251216144601.2106412-9-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_001222_046326_BDD76C7F 
X-CRM114-Status: GOOD (  22.20  )
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


On 16/12/25 8:15 pm, Ryan Roberts wrote:
> From: Will Deacon <will@kernel.org>
>
> __flush_tlb_range_limit_excess() is unnecessarily complicated:
>
>   - It takes a 'start', 'end' and 'pages' argument, whereas it only
>     needs 'pages' (which the caller has computed from the other two
>     arguments!).
>
>   - It erroneously compares 'pages' with MAX_TLBI_RANGE_PAGES when
>     the system doesn't support range-based invalidation but the range to
>     be invalidated would result in fewer than MAX_DVM_OPS invalidations.
>
> Simplify the function so that it no longer takes the 'start' and 'end'
> arguments and only considers the MAX_TLBI_RANGE_PAGES threshold on
> systems that implement range-based invalidation.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 0e1902f66e01..3b72a71feac0 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -527,21 +527,13 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>  	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
>  
> -static inline bool __flush_tlb_range_limit_excess(unsigned long start,
> -		unsigned long end, unsigned long pages, unsigned long stride)
> +static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
> +						  unsigned long stride)
>  {
> -	/*
> -	 * When the system does not support TLB range based flush
> -	 * operation, (MAX_DVM_OPS - 1) pages can be handled. But
> -	 * with TLB range based operation, MAX_TLBI_RANGE_PAGES
> -	 * pages can be handled.
> -	 */
> -	if ((!system_supports_tlb_range() &&
> -	     (end - start) >= (MAX_DVM_OPS * stride)) ||
> -	    pages > MAX_TLBI_RANGE_PAGES)
> +	if (system_supports_tlb_range() && pages > MAX_TLBI_RANGE_PAGES)
>  		return true;
>  
> -	return false;
> +	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;

The function will return true if tlb range is supported, but
((MAX_DVM_OPS * stride) >> PAGE_SHIFT) < pages <= MAX_TLBI_RANGE_PAGES.
So I think you need to do
https://lore.kernel.org/all/1b15b4f0-5490-4dac-8344-e716dd189751@arm.com/

>  }
>  
>  static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> @@ -555,7 +547,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  	end = round_up(end, stride);
>  	pages = (end - start) >> PAGE_SHIFT;
>  
> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>  		flush_tlb_mm(mm);
>  		return;
>  	}
> @@ -619,7 +611,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  	end = round_up(end, stride);
>  	pages = (end - start) >> PAGE_SHIFT;
>  
> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>  		flush_tlb_all();
>  		return;
>  	}

