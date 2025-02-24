Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D286C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZPt7DtLrr63jZ3pZpXntJhaWa0xW/waW9qRxGt5wAo=; b=wtuThWGs2lheW7oPnZ5IPQDmhg
	d+ADVCHxPXGEsHzFaUPYJB0xu36ITCefNyYUztsVd6y0VCBiv/F4zL3fslwA9KzKyC+5HfNEi9UTy
	9c1j+WkAfQZ6OqPMTqJSgjgReUThm65EI7jScYxMcQVcWUjHggM9EeEQjYRaIWhByfRMHksWpTSaJ
	BUFn2TYeZAXfjeOB4y2q73mNeuzXU7IaGJwaqQpjYLk6ydkXVZYHeqT6/YcfAyZyAcOrRd74AtvcI
	Z9eNHPffjOM/VtqCPyfdS/ZV/Vq9Ebt5t/OtmYheQsBx5atmqAsef10+E470QDMzcINDb67KAAQxn
	UopzdNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXNH-0000000DeZB-1KaI;
	Mon, 24 Feb 2025 12:15:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXBn-0000000Daz3-3xzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:04:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB81611A7;
	Mon, 24 Feb 2025 12:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E55EC4CED6;
	Mon, 24 Feb 2025 12:03:56 +0000 (UTC)
Date: Mon, 24 Feb 2025 12:03:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/14] arm64/mm: Support huge pte-mapped pages in vmap
Message-ID: <Z7xgKjhMZAY5mOwK@arm.com>
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-11-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217140809.1702789-11-ryan.roberts@arm.com>
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

On Mon, Feb 17, 2025 at 02:08:02PM +0000, Ryan Roberts wrote:
> Implement the required arch functions to enable use of contpte in the
> vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
> operations due to only having to issue a DSB and ISB per contpte block
> instead of per pte.

For non-cont PTEs, do you happen to know how often vmap_pte_range() is
called for multiple entries? It might be worth changing that to use
set_ptes() directly and we get some benefit as well.

> But it also means that the TLB pressure reduces due
> to only needing a single TLB entry for the whole contpte block.
> 
> Since vmap uses set_huge_pte_at() to set the contpte, that API is now
> used for kernel mappings for the first time. Although in the vmap case
> we never expect it to be called to modify a valid mapping so
> clear_flush() should never be called, it's still wise to make it robust
> for the kernel case, so amend the tlb flush function if the mm is for
> kernel space.
> 
> Tested with vmalloc performance selftests:
> 
>   # kself/mm/test_vmalloc.sh \
> 	run_test_mask=1
> 	test_repeat_count=5
> 	nr_pages=256
> 	test_loop_count=100000
> 	use_huge=1
> 
> Duration reduced from 1274243 usec to 1083553 usec on Apple M2 for 15%
> reduction in time taken.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 46 ++++++++++++++++++++++++++++++++
>  arch/arm64/mm/hugetlbpage.c      |  5 +++-
>  2 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 38fafffe699f..40ebc664190b 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,6 +23,52 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>  	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>  }
>  
> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
> +						unsigned long end, u64 pfn,
> +						unsigned int max_page_shift)
> +{
> +	/*
> +	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
> +	 * aligned in both virtual and physical space, then we can pte-map the
> +	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 */
> +

Nit: unnecessary empty line.

> +	if (max_page_shift < CONT_PTE_SHIFT)
> +		return PAGE_SIZE;
> +
> +	if (end - addr < CONT_PTE_SIZE)
> +		return PAGE_SIZE;
> +
> +	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
> +		return PAGE_SIZE;
> +
> +	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
> +		return PAGE_SIZE;
> +
> +	return CONT_PTE_SIZE;
> +}
> +
> +#define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
> +static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
> +							   pte_t *ptep)
> +{
> +	/*
> +	 * The caller handles alignment so it's sufficient just to check
> +	 * PTE_CONT.
> +	 */
> +	return pte_valid_cont(__ptep_get(ptep)) ? CONT_PTE_SIZE : PAGE_SIZE;
> +}
> +
> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
> +{
> +	if (size >= CONT_PTE_SIZE)
> +		return CONT_PTE_SHIFT;
> +
> +	return PAGE_SHIFT;
> +}
> +
>  #endif
>  
>  #define arch_vmap_pgprot_tagged arch_vmap_pgprot_tagged
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8ac86cd180b3..a29f347fea54 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  
> -	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
> +	if (mm == &init_mm)
> +		flush_tlb_kernel_range(saddr, addr);
> +	else
> +		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

