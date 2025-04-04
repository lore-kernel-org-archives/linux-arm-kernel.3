Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B98C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 04:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfG/L2q3tEaCb0PV+CtwYxhiHfdHGC1ZMO8q5WmuOiw=; b=LLRfJkM27VUvGr5OqQu3EJuzK3
	vdFA3kfoIoh2o9SF6VCojyQF9VnjABY7ZJY/G1Ync2IYFaoSsipE0xnCBGJXVYxa+FlauVTpt9dTn
	j89gN07+KfTBf2Gf+rMmE7IYO2sPG95WejEnn/hFBhlsnOhmxgnZC2XBayUg8qbmZRPaMlfR26Pkr
	aFzQtujRdgxhcTjGvd0hrU1kJFOv6E29oZDmoGBPdTkq8qS6HOFmUEVULU0Ita+uhpWw8GVs7kpwa
	CRITmwxQSGAMxxKgGSb7IMJQSc1YRFbnjW9ueQBSE2MNeObmEhSIBtmABFFHW29RALo2zJm4MrlNU
	/WNHN1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Z6I-0000000AleN-0Pln;
	Fri, 04 Apr 2025 04:56:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Z4U-0000000AlY2-2lsF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 04:54:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE2A1516;
	Thu,  3 Apr 2025 21:54:28 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5A633F59E;
	Thu,  3 Apr 2025 21:54:20 -0700 (PDT)
Message-ID: <39d4d1d4-3d22-4d31-bfc6-1d583e9d3f9b@arm.com>
Date: Fri, 4 Apr 2025 10:24:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while
 manipulating vmalloc ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-11-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-11-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_215426_782818_2B46D895 
X-CRM114-Status: GOOD (  17.13  )
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



On 3/4/25 20:34, Ryan Roberts wrote:
> Wrap vmalloc's pte table manipulation loops with
> arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
> the arch code with the opportunity to optimize the pte manipulations.
> 
> Note that vmap_pfn() already uses lazy mmu mode since it delegates to
> apply_to_page_range() which enters lazy mmu mode for both user and
> kernel mappings.
> 
> These hooks will shortly be used by arm64 to improve vmalloc
> performance.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6111ce900ec4..b63ca0b7dd40 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -104,6 +104,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
>  			if (pfn_valid(pfn)) {
> @@ -127,6 +130,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,6 +359,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_unmap_size(addr, pte);
> @@ -370,6 +377,8 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			ptent = ptep_get_and_clear(&init_mm, addr, pte);
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -515,6 +524,9 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
>  		return -ENOMEM;
> +
> +	arch_enter_lazy_mmu_mode();
> +
>  	do {
>  		struct page *page = pages[*nr];
>  
> @@ -528,6 +540,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> +
> +	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

