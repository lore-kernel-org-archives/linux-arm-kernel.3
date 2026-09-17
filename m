Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE8FC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF0BtYMFWD7pbUoewLZT8mBNaLMLep6fnG7M6eFSgew=; b=KXdPuV3Ek258TJJiI/Vd30Rmpn
	HcCTKPbaQHMRqB7tF8NVdylAVjR6Y7wdNfBFoXZb3LSMkm0exYT6BbXiLlOsTDWjTzOW3MgvddISm
	o8xfPz6qzwxqhA1HfnVlEvSNQenjslyVO4XCz+wcaRrju36/IqUerrLu2WRiKpR4LJyDIGXWhnA4e
	1d6Rm/HOLyAhMSLO9Y4lFK/GTZWfWJJ9XjOuvmyMW9BPoe8NNn4BRShfhawMNEG2nghvhv/lItkpQ
	reURIDOI2IFwyFnYiYs7slFtkZ97/RuzbqlDJip+D9fdicJhEGA0C0Jq4FJTZSNrDmyqy9jRBu/3+
	fGz6khzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cer-0000000BU35-0SLa;
	Thu, 17 Sep 2026 14:00:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ceq-0000000BU2y-04AA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:00:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04964436B7;
	Thu, 17 Sep 2026 14:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2351F000FF;
	Thu, 17 Sep 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653609;
	bh=rF0BtYMFWD7pbUoewLZT8mBNaLMLep6fnG7M6eFSgew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V5zw2bKn13/jSs5oYoBaVSxDvVGNH5RAFypAh0bqZw5RVdBazKjorZGSozYJi0rKR
	 qrdBhf5YWC9rDRmzz0bTjcnXOH0CZrAYY8VRSqierzDIf04pI6MBlHJKlLpkPJj+UC
	 nDwhjPVTlRNWwld+zl03AF+e0uBDLKdcrOm3+KRSRq6omTdsOlcsPBngKo8TtXxeTd
	 JlrwIqe3ielkYtrwB8L8P53XLDPu4aCUv22o/hwzZvUmLcq1kJr5MUUjcTupngwM+Q
	 Y5ZLpMsUJn2tIFiQoKXR/3PjxO8yUmnFLk046Qu4tSIGQrLGr6mZN59Tn5kliAmrQm
	 d+k0M8EebydDw==
Message-ID: <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
Date: Thu, 17 Sep 2026 16:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260917052933.188679-4-jiangwenxiaomi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 17/09/2026 à 07:29, Wen Jiang a écrit :
> From: Wen Jiang <jiangwen6@xiaomi.com>
> 
> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> 
> Now that arm64 and powerpc/8xx provide pte_set_huge() and
> pte_clear_huge(), add the generic fallbacks next to the existing
> pmd/pud_set_huge() family and convert vmap_pte_range() and
> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> around the block-mapping paths are dropped, so PTE-level block mappings
> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
> longer includes <linux/hugetlb.h>.
> 
> The fallbacks exist only to keep the build working on architectures
> without PTE-level block mapping support. They are unreachable there:
> the callers only run when arch_vmap_pte_range_map_size() or
> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> which requires an arch implementation. WARN_ON_ONCE() makes that
> explicit rather than silently doing nothing.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> ---
>   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>   mm/vmalloc.c            | 19 ++++++-------------
>   2 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cdd68ed3ae1a9..349ced999f959 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>   }
>   #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>   
> +/*
> + * PTE-level block mappings for vmap.
> + *
> + * pte_set_huge() only has to be implemented by architectures whose
> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> +				phys_addr_t phys, pgprot_t prot,
> +				unsigned long size)
> +{
> +	WARN_ON_ONCE(1);

BUILD_BUG_ON() would be better here.

It should be possible because fallback arch_vmap_pte_range_map_size() 
will constant-fold PAGE_SIZE so pte_set_huge() will never be called.

> +}
> +#endif
> +
> +/*
> + * Likewise, pte_clear_huge() only has to be implemented by architectures
> + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> + * PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> +				   unsigned long size)
> +{
> +	WARN_ON_ONCE(1);
> +	return __pte(0);

Same I guess.

> +}
> +#endif
> +
>   #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   /*

