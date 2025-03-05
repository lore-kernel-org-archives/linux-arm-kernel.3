Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B078DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlTkLQMLL5cKhsNogbp1AV75B11bSfw8IM7FxEYfnHE=; b=17ATsjgNLZdhnGZieTQaLViwVI
	syP+2IvBzhhvDAiOtiZJQg/z2EqZnlePcXjeN6LS1eKZZRyaB1vUyOF+f/BxiVwtIwqTsL0TWIlGE
	gVQW9tRSRB12eqqxkxMeeN9nhP9yXBEifXy9peFiNwPXSQht8mPZLfPycaXPLdK8uRI5Shsrs6kdF
	dyEfNPG+bO63ixvyql6QO62nK/32vtYr41ou1PBaB93dCQ4TCe4GdvNN1uvAyE6v4AX38ZNP3qaax
	vyPDyyyu7JblszteftO2jLmed1bLaoywmEKcXdohe/KD9PUgSU1ftI05liBIf/OGOfXJj7/SlI2kI
	BcV6yCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptpg-00000008yI6-2jRz;
	Wed, 05 Mar 2025 18:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptnF-00000008xyX-2MVJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XlTkLQMLL5cKhsNogbp1AV75B11bSfw8IM7FxEYfnHE=; b=Is/C4AnJ47+U9hT7dp8JZEa/+A
	xx7nCIxUxlVSp8KfJbijPIrRxPRkrr61wHlca8f9NyXawLxlpN3TMXqI10rwHifudkhHGW0wl98Pl
	jLaUZj9j6RZeevmJwyzgcyUm+yF/c/0W9dwZhDjOTivCyM45WMnBOM5dngV5hgOKQIQqaZcklIHt9
	UMW/nBPBTm5cgleFuXydfoJ6d/froVM/49aN6JcDK9C0FQMh56KYpGgdgJy7GyNkEsmzOfFE7/rzp
	RixlsVPhDMNy8SiKOmfmGHRGFM3phKj4Jw1x3XukOHNmyFJ1i9/q3KX97Y8SLAzRaEnakQHZkJlhP
	nRtAgkiw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptnC-00000000h6C-1ncu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C988A425D2;
	Wed,  5 Mar 2025 18:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70DCC4CED1;
	Wed,  5 Mar 2025 18:48:22 +0000 (UTC)
Date: Wed, 5 Mar 2025 18:48:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	SeongJae Park <sj@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] [arm64/tlb] Fix mmu notifiers for range-based invalidates
Message-ID: <Z8iccxCo7tkqvE_p@arm.com>
References: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_184830_716332_8953748F 
X-CRM114-Status: GOOD (  23.66  )
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

On Tue, Mar 04, 2025 at 12:51:27AM -0800, Piotr Jaroszynski wrote:
> Update the __flush_tlb_range_op macro not to modify its parameters as
> these are unexepcted semantics. In practice, this fixes the call to
> mmu_notifier_arch_invalidate_secondary_tlbs() in
> __flush_tlb_range_nosync() to use the correct range instead of an empty
> range with start=end. The empty range was (un)lucky as it results in
> taking the invalidate-all path that doesn't cause correctness issues,
> but can certainly result in suboptimal perf.
> 
> This has been broken since commit 6bbd42e2df8f ("mmu_notifiers: call
> invalidate_range() when invalidating TLBs") when the call to the
> notifiers was added to __flush_tlb_range(). It predates the addition of
> the __flush_tlb_range_op() macro from commit 360839027a6e ("arm64: tlb:
> Refactor the core flush algorithm of __flush_tlb_range") that made the
> bug hard to spot.

That's the problem with macros.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Will, do you want to take this as a fix? It's only a performance
regression, though you never know how it breaks the callers of the macro
at some point.

> Fixes: 6bbd42e2df8f ("mmu_notifiers: call invalidate_range() when invalidating TLBs")
> 
> Signed-off-by: Piotr Jaroszynski <pjaroszynski@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Raghavendra Rao Ananta <rananta@google.com>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Nicolin Chen <nicolinc@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/tlbflush.h | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index bc94e036a26b..8104aee4f9a0 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -396,33 +396,35 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>  #define __flush_tlb_range_op(op, start, pages, stride,			\
>  				asid, tlb_level, tlbi_user, lpa2)	\
>  do {									\
> +	typeof(start) __flush_start = start;				\
> +	typeof(pages) __flush_pages = pages;				\
>  	int num = 0;							\
>  	int scale = 3;							\
>  	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
>  	unsigned long addr;						\
>  									\
> -	while (pages > 0) {						\
> +	while (__flush_pages > 0) {					\
>  		if (!system_supports_tlb_range() ||			\
> -		    pages == 1 ||					\
> -		    (lpa2 && start != ALIGN(start, SZ_64K))) {		\
> -			addr = __TLBI_VADDR(start, asid);		\
> +		    __flush_pages == 1 ||				\
> +		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
> +			addr = __TLBI_VADDR(__flush_start, asid);	\
>  			__tlbi_level(op, addr, tlb_level);		\
>  			if (tlbi_user)					\
>  				__tlbi_user_level(op, addr, tlb_level);	\
> -			start += stride;				\
> -			pages -= stride >> PAGE_SHIFT;			\
> +			__flush_start += stride;			\
> +			__flush_pages -= stride >> PAGE_SHIFT;		\
>  			continue;					\
>  		}							\
>  									\
> -		num = __TLBI_RANGE_NUM(pages, scale);			\
> +		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
>  		if (num >= 0) {						\
> -			addr = __TLBI_VADDR_RANGE(start >> shift, asid, \
> +			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
>  						scale, num, tlb_level);	\
>  			__tlbi(r##op, addr);				\
>  			if (tlbi_user)					\
>  				__tlbi_user(r##op, addr);		\
> -			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
> -			pages -= __TLBI_RANGE_PAGES(num, scale);	\
> +			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
> +			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
>  		}							\
>  		scale--;						\
>  	}								\
> 
> base-commit: 99fa936e8e4f117d62f229003c9799686f74cebc
> -- 
> 2.22.1.7.gac84d6e93c.dirty

-- 
Catalin

