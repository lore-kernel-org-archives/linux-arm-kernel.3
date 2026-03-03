Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACE1D58E4E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU00aBVgZDbIXBlBNj0xnFoW1OZC52hKZV4FHE72gwE=; b=LpvZCWx3kqsI25KL0Crw56vYUO
	EPiVaxKgB9GvIx9PQ2IELT9c/i/HoRXUeJe0EOjDk3XlS63u0pkKtIsznWwNhK3cd8hWkjWaeXp/H
	pvQmiEttehLuyxUSosnOIkDiTwPiPXYvANDE3B2r0O9VWWxN16gRdoUCkZQDkqJ+DfPHfgbQLDS4Y
	rjH50LQ8OZyYjFLnL+UVIky3Uc/G0i7lfR5K0ECcGJv+dhoDEfPWldVh8A+5ItqEPJDUmnzeSVNQG
	ufC+RcQqNV2V0q8XL/WkY9cmd68SYC2LnlYKyKTO+TiEe4tP9/iQl7Wl873w4XeyYt+5VfG7xDXe2
	FLbrh/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGx4-0000000ETte-1Sbq;
	Tue, 03 Mar 2026 04:01:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxGx1-0000000ETsr-0eBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 04:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7BFA497;
	Mon,  2 Mar 2026 20:01:30 -0800 (PST)
Received: from [10.164.18.51] (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D5FF3F73B;
	Mon,  2 Mar 2026 20:01:34 -0800 (PST)
Message-ID: <2d07e814-a7a3-4cec-8a59-158420bde1f2@arm.com>
Date: Tue, 3 Mar 2026 09:31:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
 <20260224062423.972404-3-anshuman.khandual@arm.com>
 <6eee7f14-c3f2-4e16-b713-65c2ea141457@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <6eee7f14-c3f2-4e16-b713-65c2ea141457@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_200139_295019_FA58A528 
X-CRM114-Status: GOOD (  32.95  )
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



On 02/03/26 9:21 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 07:24, Anshuman Khandual wrote:
>> Linear and vmemmap mappings that get teared down during a memory hot remove
> 
> s/teared/torn/ ?

Done !

> 
>> operation might contain leaf level entries on any page table level. If the
>> requested memory range's linear or vmemmap mappings falls within such leaf
>> entries, new mappings need to be created for the remaining memory mapped on
>> the leaf entry earlier, following standard break before make aka BBM rules.
>> But kernel cannot tolerate BBM and hence remapping to fine grained leaves
>> would not be possible on systems without BBML2_NOABORT.
>>
>> Currently memory hot remove operation does not perform such restructuring,
>> and so removing memory ranges that could split a kernel leaf level mapping
>> need to be rejected.
>>
>> While memory_hotplug.c does appear to permit hot removing arbitrary ranges
>> of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
>> ...) all appear to treat memory as fixed size devices. So it is impossible
>> to hot unplug a different amount than was previously hot plugged, and hence
>> we should never see a rejection in practice, but adding the check makes us
>> robust against a future change.
> 
> Is this then really a fix that warrens?
> 
>   Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>   Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
> 
> ... if nothing is broken?
> 
> I can understand the desire for this check, but I am confused about Fixes:

Probably nothing is broken now I guess but the original memory hot remove
patch should have taken care of this scenario. Although don't have strong
opinions either way. We could drop both "Fixes" and "Closes" tags here if
that is preferred.

> 
> 
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/mm/mmu.c | 155 ++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 149 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index dfb61d218579..ce0b966f42d1 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -2063,6 +2063,142 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>>  	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
>>  }
>>  
>> +
>> +static bool addr_splits_kernel_leaf(unsigned long addr)
>> +{
>> +	pgd_t *pgdp, pgd;
>> +	p4d_t *p4dp, p4d;
>> +	pud_t *pudp, pud;
>> +	pmd_t *pmdp, pmd;
>> +	pte_t *ptep, pte;
>> +
>> +	/*
>> +	 * PGD level:
> 
> I consider all these "XXX level:" comments unhelpful. It's mostly there, in
> the code already: PGDIR_SIZE, PGDIR_SIZE, PUD_SIZE ... :)

Got it.

> 
>> +	 *
>> +	 * If addr is PGD_SIZE aligned - already on a leaf boundary
> 
> Similarly, repeating that is not particularly helpful.
> 
> You could have a single comment at the very top that says
> 
> "If the given address points at a the start address of a possible leaf, we
> certainly won't split. Otherwise, check if we would actually split a leaf by
> traversing the page tables further."

Will drop all the existing comments for each level and instead add the above
unified comment as suggested.

> 
>> +	 */
>> +	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
> 
> if (IS_ALIGNED(addr, PGDIR_SIZE))
> 	return false;
> 
> ?

Looks cleaner, will convert all ALIGN_DOWN() level checks into IS_ALIGNED().

> 
>> +		return false;
>> +
>> +	pgdp = pgd_offset_k(addr);
>> +	pgd = pgdp_get(pgdp);
>> +	if (!pgd_present(pgd))
>> +		return false;
> 
> How could we end up with non-present areas in a range we hotplugged earlier?

We might not in reality but in order to be sure just an additional protection.

> 
>> +
>> +	/*
>> +	 * P4D level:
>> +	 *
>> +	 * If addr is P4D_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>> +		return false;
>> +
>> +	p4dp = p4d_offset(pgdp, addr);
>> +	p4d = p4dp_get(p4dp);
>> +	if (!p4d_present(p4d))
>> +		return false;
>> +
>> +	/*
>> +	 * PUD level:
>> +	 *
>> +	 * If addr is PUD_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>> +		return false;
>> +
>> +	pudp = pud_offset(p4dp, addr);
>> +	pud = pudp_get(pudp);
>> +	if (!pud_present(pud))
>> +		return false;
>> +
>> +	if (pud_leaf(pud))
>> +		return true;
>> +
>> +	/*
>> +	 * CONT_PMD level:
>> +	 *
>> +	 * If addr is CONT_PMD_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>> +		return false;
>> +
>> +	pmdp = pmd_offset(pudp, addr);
>> +	pmd = pmdp_get(pmdp);
>> +	if (!pmd_present(pmd))
>> +		return false;
>> +
>> +	if (pmd_cont(pmd))
>> +		return true;
>> +
>> +	/*
>> +	 * PMD level:
>> +	 *
>> +	 * If addr is PMD_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>> +		return false;
>> +
>> +	if (pmd_leaf(pmd))
>> +		return true;
>> +
>> +	/*
>> +	 * CONT_PTE level:
>> +	 *
>> +	 * If addr is CONT_PTE_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, CONT_PTE_SIZE) == addr)
>> +		return false;
>> +
>> +	ptep = pte_offset_kernel(pmdp, addr);
>> +	pte = __ptep_get(ptep);
>> +	if (!pte_present(pte))
>> +		return false;
>> +
>> +	if (pte_cont(pte))
>> +		return true;
>> +
>> +	/*
>> +	 * PTE level:
>> +	 *
>> +	 * If addr is PAGE_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, PAGE_SIZE) == addr)
>> +		return false;
>> +	return true;
> 
> 	return !IS_ALIGNED(addr, PAGE_SIZE);
> 
>> +}
>> +
>> +static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
>> +{
>> +	unsigned long phys_start, phys_end, size, start, end;
>> +
>> +	phys_start = PFN_PHYS(pfn);
>> +	phys_end = phys_start + nr_pages * PAGE_SIZE;
>> +
>> +	/*
>> +	 * PFN range's linear map edges are leaf entry aligned
>> +	 */
>> +	start = __phys_to_virt(phys_start);
>> +	end =  __phys_to_virt(phys_end);
>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>> +			phys_start, phys_end);
>> +		return false;
>> +	}
>> +
>> +	/*
>> +	 * PFN range's vmemmap edges are leaf entry aligned
>> +	 */
>> +	size = nr_pages * sizeof(struct page);
>> +	start = (unsigned long)pfn_to_page(pfn);
>> +	end = start + size;
> 
> As arm64 cannot be used with CONFIG_SPARSEMEM (only with
> CONFIG_SPARSEMEM_VMEMMAP, as it sets SPARSEMEM_VMEMMAP_ENABLE),
> I think you can just do
> 
> 	start = (unsigned long)pfn_to_page(pfn);
> 	end = (unsigned long)pfn_to_page(pfn + nr_pages);
> 
> As pfn_to_page() is just simple calculation that works even if "pfn+nr_pages" does not exist.

Sure, will drop the element 'size' and derive 'end' as suggested above via pfn_to_page().

> 
>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>> +		pr_warn("[%lx %lx] splits a leaf entry in vmemmap\n",
>> +			phys_start, phys_end);
>> +		return false;
>> +	}
>> +	return true;
>> +}
>> +
> 


