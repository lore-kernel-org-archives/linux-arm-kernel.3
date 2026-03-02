Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C5DEA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7afmxr4Zp1eqDjaNzKei/WdjgGqkGp1AXV3tHh/axE=; b=dyLVMFRQa/P05WocfOBVDvRpVR
	Y6/XXoL/zmyeBviEQD0HdWurAO8xgXFwyG+LgBPI7+eVVMQMMzHK9xViIiz2Jww6RvnALp4GJKFFm
	g6sSKsEU58noaSnP6BRtM0+9XWt+dUbBpbOwstlt3TcqAVArAiktnMN+csajCENUjtug1IrfcrGma
	rNuQbU5wrU5qAVt2pXoxP1/ofc0VA9qjgdpSR/xs4FWnOBctaKzVqSrUnJR7lgfK4cuTPj9MAR8mX
	HTwALyVZNVxmHgfByjpGsTVbW6pJwBrzP2BlOiqiA2VpfRhgHDMXlrffIZoNug+jBIka/N8GrvgPh
	1pMRa54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5YY-0000000DPBN-3QIZ;
	Mon, 02 Mar 2026 15:51:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5YW-0000000DPAr-1LPy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 811174061F;
	Mon,  2 Mar 2026 15:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D497FC2BC87;
	Mon,  2 Mar 2026 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772466695;
	bh=5yZdFyABlRn8cWdlXJGBlydbmpCFPmAJ9Eli7s9/mAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fjkCeGfPyXSNyM/LdAgApX4BOf2fVdPtk52hASkj1ULq+2/48rb9H3frtcnjxwVHh
	 EOnLbzgfEByiENr2UASkhvadsPs0bhv8jW69TM167ZMOhGWRERsAOnoHmIO8vJq6KD
	 ZLelILP0BIN1ejtXgu/ehsisE7FeM6djX4nREtpA8QdyTSDttXhjdisWQqIjU/DljJ
	 pJar4dWGEH4rW7wQe/J1IPoSzYAuqqiAmHeUxEIVRlywY4K+E4rK2CuzkXphnaP+/j
	 9dBfELdNUJomkOGtX4/sr0/6wmoDXh80UVqOZTaMeQ2ivm5WX9UaYcYkSy+U4LfsDU
	 /YBuVBpgmyzPQ==
Message-ID: <6eee7f14-c3f2-4e16-b713-65c2ea141457@kernel.org>
Date: Mon, 2 Mar 2026 16:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
 <20260224062423.972404-3-anshuman.khandual@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260224062423.972404-3-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075136_408561_82C315A3 
X-CRM114-Status: GOOD (  29.64  )
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

On 2/24/26 07:24, Anshuman Khandual wrote:
> Linear and vmemmap mappings that get teared down during a memory hot remove

s/teared/torn/ ?

> operation might contain leaf level entries on any page table level. If the
> requested memory range's linear or vmemmap mappings falls within such leaf
> entries, new mappings need to be created for the remaining memory mapped on
> the leaf entry earlier, following standard break before make aka BBM rules.
> But kernel cannot tolerate BBM and hence remapping to fine grained leaves
> would not be possible on systems without BBML2_NOABORT.
> 
> Currently memory hot remove operation does not perform such restructuring,
> and so removing memory ranges that could split a kernel leaf level mapping
> need to be rejected.
> 
> While memory_hotplug.c does appear to permit hot removing arbitrary ranges
> of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
> ...) all appear to treat memory as fixed size devices. So it is impossible
> to hot unplug a different amount than was previously hot plugged, and hence
> we should never see a rejection in practice, but adding the check makes us
> robust against a future change.

Is this then really a fix that warrens?

  Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
  Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")

... if nothing is broken?

I can understand the desire for this check, but I am confused about Fixes:


> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 155 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 149 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index dfb61d218579..ce0b966f42d1 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2063,6 +2063,142 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>  	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
>  }
>  
> +
> +static bool addr_splits_kernel_leaf(unsigned long addr)
> +{
> +	pgd_t *pgdp, pgd;
> +	p4d_t *p4dp, p4d;
> +	pud_t *pudp, pud;
> +	pmd_t *pmdp, pmd;
> +	pte_t *ptep, pte;
> +
> +	/*
> +	 * PGD level:

I consider all these "XXX level:" comments unhelpful. It's mostly there, in
the code already: PGDIR_SIZE, PGDIR_SIZE, PUD_SIZE ... :)

> +	 *
> +	 * If addr is PGD_SIZE aligned - already on a leaf boundary

Similarly, repeating that is not particularly helpful.

You could have a single comment at the very top that says

"If the given address points at a the start address of a possible leaf, we
certainly won't split. Otherwise, check if we would actually split a leaf by
traversing the page tables further."

> +	 */
> +	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)

if (IS_ALIGNED(addr, PGDIR_SIZE))
	return false;

?

> +		return false;
> +
> +	pgdp = pgd_offset_k(addr);
> +	pgd = pgdp_get(pgdp);
> +	if (!pgd_present(pgd))
> +		return false;

How could we end up with non-present areas in a range we hotplugged earlier?

> +
> +	/*
> +	 * P4D level:
> +	 *
> +	 * If addr is P4D_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
> +		return false;
> +
> +	p4dp = p4d_offset(pgdp, addr);
> +	p4d = p4dp_get(p4dp);
> +	if (!p4d_present(p4d))
> +		return false;
> +
> +	/*
> +	 * PUD level:
> +	 *
> +	 * If addr is PUD_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
> +		return false;
> +
> +	pudp = pud_offset(p4dp, addr);
> +	pud = pudp_get(pudp);
> +	if (!pud_present(pud))
> +		return false;
> +
> +	if (pud_leaf(pud))
> +		return true;
> +
> +	/*
> +	 * CONT_PMD level:
> +	 *
> +	 * If addr is CONT_PMD_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
> +		return false;
> +
> +	pmdp = pmd_offset(pudp, addr);
> +	pmd = pmdp_get(pmdp);
> +	if (!pmd_present(pmd))
> +		return false;
> +
> +	if (pmd_cont(pmd))
> +		return true;
> +
> +	/*
> +	 * PMD level:
> +	 *
> +	 * If addr is PMD_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
> +		return false;
> +
> +	if (pmd_leaf(pmd))
> +		return true;
> +
> +	/*
> +	 * CONT_PTE level:
> +	 *
> +	 * If addr is CONT_PTE_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, CONT_PTE_SIZE) == addr)
> +		return false;
> +
> +	ptep = pte_offset_kernel(pmdp, addr);
> +	pte = __ptep_get(ptep);
> +	if (!pte_present(pte))
> +		return false;
> +
> +	if (pte_cont(pte))
> +		return true;
> +
> +	/*
> +	 * PTE level:
> +	 *
> +	 * If addr is PAGE_SIZE aligned - already on a leaf boundary
> +	 */
> +	if (ALIGN_DOWN(addr, PAGE_SIZE) == addr)
> +		return false;
> +	return true;

	return !IS_ALIGNED(addr, PAGE_SIZE);

> +}
> +
> +static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
> +{
> +	unsigned long phys_start, phys_end, size, start, end;
> +
> +	phys_start = PFN_PHYS(pfn);
> +	phys_end = phys_start + nr_pages * PAGE_SIZE;
> +
> +	/*
> +	 * PFN range's linear map edges are leaf entry aligned
> +	 */
> +	start = __phys_to_virt(phys_start);
> +	end =  __phys_to_virt(phys_end);
> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
> +			phys_start, phys_end);
> +		return false;
> +	}
> +
> +	/*
> +	 * PFN range's vmemmap edges are leaf entry aligned
> +	 */
> +	size = nr_pages * sizeof(struct page);
> +	start = (unsigned long)pfn_to_page(pfn);
> +	end = start + size;

As arm64 cannot be used with CONFIG_SPARSEMEM (only with
CONFIG_SPARSEMEM_VMEMMAP, as it sets SPARSEMEM_VMEMMAP_ENABLE),
I think you can just do

	start = (unsigned long)pfn_to_page(pfn);
	end = (unsigned long)pfn_to_page(pfn + nr_pages);

As pfn_to_page() is just simple calculation that works even if "pfn+nr_pages" does not exist.

> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
> +		pr_warn("[%lx %lx] splits a leaf entry in vmemmap\n",
> +			phys_start, phys_end);
> +		return false;
> +	}
> +	return true;
> +}
> +

-- 
Cheers,

David

