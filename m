Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EC3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M8bkiKnxTbharXuzOSOZuqPsiex+3ZJzlZMqOyyB7k=; b=PuAHHW2SK3jGgRmOoVNVG2q8nv
	tnc+0d3+U6a8ef99pTs+MQnWBZP4/g9OU7HjpuiwpxbKBK/l3MBaWSQwNLqNPsd/swpQBXWRPLG92
	AEkhjI0irGpJYS6jRc1+YlqY33TDmfEmECGSkG/rhHpQwVTzb00CwafErjd0eGwyzdShwSZWu31pO
	Uyw3Jpx7bGGVCW2fVumr49YuCvHyqrEOIncMgwyEhxASyjrGjS7atLbD42uU9yUMfbm22DZs+f3z1
	jKjpq0jNuBuXmstA8gAlV6gg+bb0897Q0+39SC+0Hex/kejXxfrz89IBB2WERZr2rXbB5JIpH54k3
	9UwWj0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFr3-00000001q6J-2l3C;
	Mon, 14 Jul 2025 09:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFW4-00000001mzs-3Dmm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:30:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C561BC0;
	Mon, 14 Jul 2025 02:30:22 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C513F694;
	Mon, 14 Jul 2025 02:30:30 -0700 (PDT)
Message-ID: <b10fd873-6de9-445a-a43a-cd588b433f42@arm.com>
Date: Mon, 14 Jul 2025 10:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] arm64: mm: Simplify
 __flush_tlb_range_limit_excess()
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-10-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-10-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_023032_897323_46DD0946 
X-CRM114-Status: GOOD (  23.99  )
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

Does this warrant a Fixes: tag?

> ---
>  arch/arm64/include/asm/tlbflush.h | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 8618a85d5cd3..2541863721af 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -470,21 +470,13 @@ do {									\
>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>  	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
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
>  }

I'm still not sure I totally get this... Aren't these really 2 separate
concepts? MAX_TLBI_RANGE_PAGES is the max amount of VA that can be handled by a
single tlbi-by-range (and due to implementation, the largest range that can be
handled by the loop in __flush_tlb_range_op()). Whereas MAX_DVM_OPS is the max
number of tlbi instrcutions you want to issue with the PTL held? Perhaps it is
better to split these out; For the range case, calculate the number of ops you
actually need and compare with MAX_DVM_OPS?


>  
>  static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
> @@ -498,7 +490,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
>  	end = round_up(end, stride);
>  	pages = (end - start) >> PAGE_SHIFT;
>  
> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>  		flush_tlb_mm(mm);
>  		return;
>  	}
> @@ -547,7 +539,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  	end = round_up(end, stride);
>  	pages = (end - start) >> PAGE_SHIFT;
>  
> -	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
> +	if (__flush_tlb_range_limit_excess(pages, stride)) {
>  		flush_tlb_all();
>  		return;
>  	}


