Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50BE7315B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=echvPul4IA2jsCKKbn+yCMl1dA6MWy/9xurj386pijU=; b=Myrh609N7VNCGt98InQdJQt627
	I/ZdZ8tXXBcN2bfw6A7SZXoEeQfBefWyUCS4bhNvkNtSgqAss0h/SOvzJKNHT6Mwgr4gua5f8dRsm
	2FrfhvMROCYCWVqOhZO7uXOK5/UJPKgqleVDks5GAVxzdn7IbYViazlaAMv+NIl0APnw1BgOWG5zk
	vuWFIHdaaqys0LuKzB2BzqLfu59WRtWK+7/xo0sBARnq3wm9yaYlqIJJQMmDw1X4wsAz2biP4F/SB
	w4Esgfb1PtcuXGDh+Tjva4v91qmNb0SAj7Lwj10FpN3q+N+1FMbGzel+h8194TH4ae2DhdB4aGRIY
	dnE01+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsDH-00000004uhH-1cpV;
	Mon, 02 Feb 2026 11:35:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsDE-00000004ugk-3XQB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:35:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59D47339;
	Mon,  2 Feb 2026 03:35:17 -0800 (PST)
Received: from [10.57.95.78] (unknown [10.57.95.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AAFD3F7A6;
	Mon,  2 Feb 2026 03:35:22 -0800 (PST)
Message-ID: <fbc45a22-a916-4885-9aeb-857c7c9dcb9c@arm.com>
Date: Mon, 2 Feb 2026 11:35:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Reject memory removal that splits a kernel
 leaf mapping
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260202042617.504183-1-anshuman.khandual@arm.com>
 <20260202042617.504183-3-anshuman.khandual@arm.com>
 <10088a12-332f-490e-9726-3015f99e264a@arm.com>
 <7790afb1-df77-4c14-90f1-1499f4e68f94@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7790afb1-df77-4c14-90f1-1499f4e68f94@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033524_978412_27564578 
X-CRM114-Status: GOOD (  32.53  )
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

On 02/02/2026 11:06, Anshuman Khandual wrote:
> On 02/02/26 3:12 PM, Ryan Roberts wrote:
>> On 02/02/2026 04:26, Anshuman Khandual wrote:
>>> Linear and vmemmap mapings that get teared down during a memory hot remove
>>> operation might contain leaf level entries on any page table level. If the
>>> requested memory range's linear or vmemmap mappings falls within such leaf
>>> entries, new mappings need to be created for the remaning memory mapped on
>>> the leaf entry earlier, following standard break before make aka BBM rules.
>>
>> I think it would be good to mention that the kernel cannot tolerate BBM so
>> remapping to fine grained leaves would not be possible on systems without
>> BBML2_NOABORT.
> 
> Sure will add that.
> 
>>
>>>
>>> Currently memory hot remove operation does not perform such restructuring,
>>> and so removing memory ranges that could split a kernel leaf level mapping
>>> need to be rejected.
>>
>> Perhaps it is useful to mention that while memory_hotplug.c does appear to
>> permit hot-unplugging arbitrary ranges of memory, the higher layers that drive
>> memory_hotplug (e.g. ACPI, virtio, ...) all appear to treat memory as fixed size
>> devices so it is impossible to hotunplug a different amount than was previously
>> hotplugged, and so we should never see a rejection in practice, but adding the
>> check makes us robust against a future change.
> 
> Agreed, will update the commit message.
> 
>>
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>>> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>  arch/arm64/mm/mmu.c | 126 ++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 126 insertions(+)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8ec8a287aaa1..9d59e10fb3de 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -2063,6 +2063,129 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>>>  	__remove_pgd_mapping(swapper_pg_dir, __phys_to_virt(start), size);
>>>  }
>>>  
>>> +
>>> +static bool split_kernel_leaf_boundary(unsigned long addr)
>>
>> The name currently makes it sound like we are asking for the mapping to be split
>> (we have existing functions to do this that are named similarly). Perhaps a
>> better name would be addr_splits_leaf()?
> 
> Agreed that name sounds bit confusing and ambiguous as there is already
> a similarly named function. Will rename it as addr_splits_kernel_leaf()
> instead.
> 
>>
>>> +{
>>> +	pgd_t *pgdp, pgd;
>>> +	p4d_t *p4dp, p4d;
>>> +	pud_t *pudp, pud;
>>> +	pmd_t *pmdp, pmd;
>>> +	pte_t *ptep, pte;
>>> +
>>> +	/*
>>> +	 * PGD: If addr is PGD aligned then addr already
>>> +	 * describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	pgdp = pgd_offset_k(addr);
>>> +	pgd = pgdp_get(pgdp);
>>> +	if (!pgd_present(pgd))
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * P4D: If addr is P4D aligned then addr already
>>> +	 * describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	p4dp = p4d_offset(pgdp, addr);
>>> +	p4d = p4dp_get(p4dp);
>>> +	if (!p4d_present(p4d))
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * PUD: If addr is PUD aligned then addr already
>>> +	 * describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	pudp = pud_offset(p4dp, addr);
>>> +	pud = pudp_get(pudp);
>>> +	if (!pud_present(pud))
>>> +		return false;
>>> +
>>> +	if (pud_leaf(pud))
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * CONT_PMD: If addr is CONT_PMD aligned then
>>> +	 * addr already describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	pmdp = pmd_offset(pudp, addr);
>>> +	pmd = pmdp_get(pmdp);
>>> +	if (!pmd_present(pmd))
>>> +		return false;
>>> +
>>> +	if (pmd_leaf(pmd) && pmd_cont(pmd))
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * PMD: If addr is PMD aligned then addr already
>>> +	 * describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	if (pmd_leaf(pmd))
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * CONT_PTE: If addr is CONT_PTE aligned then addr
>>> +	 * already describes a leaf boundary.
>>> +	 */
>>> +	if (ALIGN_DOWN(addr, CONT_PTE_SIZE) == addr)
>>> +		return false;
>>> +
>>> +	ptep = pte_offset_kernel(pmdp, addr);
>>> +	pte = __ptep_get(ptep);
>>> +	if (!pte_present(pte))
>>> +		return false;
>>> +
>>> +	if (pte_valid(pte) && pte_cont(pte))
>>
>> Why do you need pte_valid() here? You have already checked !pte_present(). Are
>> you expecting a case of present but not valid (PTE_PRESENT_INVALID)? If so, do
>> you need to consider that for the other levels too? (pmd_leaf() only checks
>> pmd_present()).
>>> Personally I think you can just drop the pte_valid() check here.
> 
> Added pte_valid() for abundance of caution but it is not really
> necessary though. Sure will drop it off.
> 
>>
>>> +		return true;
>>> +
>>> +	if (ALIGN_DOWN(addr, PAGE_SIZE) == addr)
>>> +		return false;
>>> +	return true;
>>> +}
>>> +
>>> +static bool can_unmap_without_split(unsigned long pfn, unsigned long nr_pages)
>>> +{
>>> +	unsigned long linear_start, linear_end, phys_start, phys_end;
>>> +	unsigned long vmemmap_size, vmemmap_start, vmemmap_end;
>>
>> nit: do we need all these variables. Perhaps just:
>>
>> unsigned long sz, start, end, phys_start, phys_end;
>>
>> are sufficient?
> 
> Alright. I guess start and end can be re-used both for linear and
> vmemmap mapping.
> 
>>
>>> +
>>> +	/* Assert linear map edges do not split a leaf entry */
>>> +	phys_start = PFN_PHYS(pfn);
>>> +	phys_end = phys_start + nr_pages * PAGE_SIZE;
>>> +	linear_start = __phys_to_virt(phys_start);
>>> +	linear_end =  __phys_to_virt(phys_end);
>>> +	if (split_kernel_leaf_boundary(linear_start) ||
>>> +	    split_kernel_leaf_boundary(linear_end)) {
>>> +		pr_warn("[%lx %lx] splits a leaf entry in linear map\n",
>>> +			phys_start, phys_end);
>>> +		return false;
>>> +	}
>>> +
>>> +	/* Assert vmemmap edges do not split a leaf entry */
>>> +	vmemmap_size = nr_pages * sizeof(struct page);
>>> +	vmemmap_start = (unsigned long) pfn_to_page(pfn);
>>
>> nit:                                   ^
>>
>> I don't think we would normally have that space?
> 
> Sure will drop that.
> 
>>
>>> +	vmemmap_end = vmemmap_start + vmemmap_size;
>>> +	if (split_kernel_leaf_boundary(vmemmap_start) ||
>>> +	    split_kernel_leaf_boundary(vmemmap_end)) {
>>> +		pr_warn("[%lx %lx] splits a leaf entry in vmemmap\n",
>>> +			phys_start, phys_end);
>>> +		return false;
>>> +	}
>>> +	return true;
>>> +}
>>> +
>>>  /*
>>>   * This memory hotplug notifier helps prevent boot memory from being
>>>   * inadvertently removed as it blocks pfn range offlining process in
>>> @@ -2083,6 +2206,9 @@ static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
>>>  	if ((action != MEM_GOING_OFFLINE) && (action != MEM_OFFLINE))
>>>  		return NOTIFY_OK;
>>>  
>>> +	if (!can_unmap_without_split(pfn, arg->nr_pages))
>>> +		return NOTIFY_BAD;
>>> +
>>
>> Personally, I'd keep the bootmem check first and do this check after. That means
>> an existing warning will not change.
> 
> Makes sense, will move it after existing bootmem check. BTW the function
> still named as prevent_bootmem_remove_notifier() although now it's going
> to check leaf boundaries as well. Should the function be renamed as well
> to something more generic e.g prevent_memory_remove_notifier() ?

Works for me.

> 
>>
>> Thanks,
>> Ryan
>>
>>>  	for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
>>>  		unsigned long start = PFN_PHYS(pfn);
>>>  		unsigned long end = start + (1UL << PA_SECTION_SHIFT);
>>
> 


