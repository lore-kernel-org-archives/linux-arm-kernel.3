Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539ADEA3F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnX34QFYHPww4lXQc+Jznfsv608rX9RaxcT3D5dEVSI=; b=11M6tQAfZkOCMEEmy/ORkVqY7Q
	HxqNF/EHEOnoY/hhNaEPDzGOeLrHqWZq4tnh0N7QhTkcLpo27Ye/zPm+W42gfGbS4WqWBsYW5DqY4
	9Zt5tjfX7lCIPc7G+kxnLJh5QL9gtqYnV9ti6FCbPUgAiYNbVTfRYmOwOc4DiYGvt6DUcB3Molsoz
	71gOxJjLfgDjm7bzbDEtK9k4lnrM41EaM+N8s4YCsS6f7QKDVeLH7d8rJXP4TOQN3jPpb2a7ca0qR
	v6ZWia/E7MOSrioX3I10DNA1OFEeUutwG2FBG0bxdckZOwDJ2mZiZOMpiubYgqh2oqNhni+OUt8xh
	Cnyc+gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkXB-0000000GnZm-2GyO;
	Tue, 10 Feb 2026 09:59:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkX7-0000000GnZ8-3wPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:59:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F222339;
	Tue, 10 Feb 2026 01:59:40 -0800 (PST)
Received: from [10.163.170.66] (unknown [10.163.170.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40993F632;
	Tue, 10 Feb 2026 01:59:40 -0800 (PST)
Message-ID: <de94c15e-7778-416a-a023-bbefc18c7c02@arm.com>
Date: Tue, 10 Feb 2026 15:29:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64/mm: Reject memory removal that splits a
 kernel leaf mapping
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260203130348.612150-1-anshuman.khandual@arm.com>
 <20260203130348.612150-3-anshuman.khandual@arm.com>
 <9ede3f81-5325-4acc-8ca1-ccb243c71961@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <9ede3f81-5325-4acc-8ca1-ccb243c71961@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_015950_077219_0FB24A2E 
X-CRM114-Status: GOOD (  28.44  )
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

On 10/02/26 3:17 PM, Ryan Roberts wrote:
> On 03/02/2026 13:03, Anshuman Khandual wrote:
>> Linear and vmemmap mapings that get teared down during a memory hot remove
>> operation might contain leaf level entries on any page table level. If the
>> requested memory range's linear or vmemmap mappings falls within such leaf
>> entries, new mappings need to be created for the remaning memory mapped on
>> the leaf entry earlier, following standard break before make aka BBM rules.
>> But kernel cannot tolerate BBM amd hemce remapping to fine grained leaves
> 
> nits:                            ^^^ ^^^^^

Yikes ! will fix the typos.

> 
>> would not be possible on systems without BBML2_NOABORT.
>>
>> Currently memory hot remove operation does not perform such restructuring,
>> and so removing memory ranges that could split a kernel leaf level mapping
>> need to be rejected.
>>
>> while memory_hotplug.c does appear to permit hot removing arbitrary ranges
>> of memory, the higher layers that drive memory_hotplug (e.g. ACPI, virtio,
>> ...) all appear to treat memory as fixed size devices. So it is impossible
>> to hotunplug a different amount than was previously hotplugged, and hence
>> we should never see a rejection in practice, but adding the check makes us
>> robust against a future change.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
>> Cc: stable@vger.kernel.org
> 
> Given your statement in the commit log above about how this never happens in
> practice but is instead to make us robust to any future changes, perhaps this is
> not a stable candidate?
> 
> For clarity; I do agree that this extra robustness is useful so I think we
> should aim to get it upstream, I just don't think it needs to go to stable.

Will drop the `Cc: stable` reference.

> 
>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Other than above nit, LGTM:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks ! 

Will respin the series on upcoming - rc1 version.

> 
>> ---
>>  arch/arm64/mm/mmu.c | 155 ++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 149 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8ec8a287aaa1..3fb9bcbd739a 100644
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
>> +	 *
>> +	 * If addr is PGD_SIZE aligned - already on a leaf boundary
>> +	 */
>> +	if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>> +		return false;
>> +
>> +	pgdp = pgd_offset_k(addr);
>> +	pgd = pgdp_get(pgdp);
>> +	if (!pgd_present(pgd))
>> +		return false;
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
>> +	if (addr_splits_kernel_leaf(start) || addr_splits_kernel_leaf(end)) {
>> +		pr_warn("[%lx %lx] splits a leaf entry in vmemmap\n",
>> +			phys_start, phys_end);
>> +		return false;
>> +	}
>> +	return true;
>> +}
>> +
>>  /*
>>   * This memory hotplug notifier helps prevent boot memory from being
>>   * inadvertently removed as it blocks pfn range offlining process in
>> @@ -2071,8 +2207,11 @@ void arch_remove_memory(u64 start, u64 size, struct vmem_altmap *altmap)
>>   * In future if and when boot memory could be removed, this notifier
>>   * should be dropped and free_hotplug_page_range() should handle any
>>   * reserved pages allocated during boot.
>> + *
>> + * This also blocks any memory remove that would have caused a split
>> + * in leaf entry in kernel linear or vmemmap mapping.
>>   */
>> -static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
>> +static int prevent_memory_remove_notifier(struct notifier_block *nb,
>>  					   unsigned long action, void *data)
>>  {
>>  	struct mem_section *ms;
>> @@ -2118,11 +2257,15 @@ static int prevent_bootmem_remove_notifier(struct notifier_block *nb,
>>  			return NOTIFY_DONE;
>>  		}
>>  	}
>> +
>> +	if (!can_unmap_without_split(pfn, arg->nr_pages))
>> +		return NOTIFY_BAD;
>> +
>>  	return NOTIFY_OK;
>>  }
>>  
>> -static struct notifier_block prevent_bootmem_remove_nb = {
>> -	.notifier_call = prevent_bootmem_remove_notifier,
>> +static struct notifier_block prevent_memory_remove_nb = {
>> +	.notifier_call = prevent_memory_remove_notifier,
>>  };
>>  
>>  /*
>> @@ -2172,7 +2315,7 @@ static void validate_bootmem_online(void)
>>  	}
>>  }
>>  
>> -static int __init prevent_bootmem_remove_init(void)
>> +static int __init prevent_memory_remove_init(void)
>>  {
>>  	int ret = 0;
>>  
>> @@ -2180,13 +2323,13 @@ static int __init prevent_bootmem_remove_init(void)
>>  		return ret;
>>  
>>  	validate_bootmem_online();
>> -	ret = register_memory_notifier(&prevent_bootmem_remove_nb);
>> +	ret = register_memory_notifier(&prevent_memory_remove_nb);
>>  	if (ret)
>>  		pr_err("%s: Notifier registration failed %d\n", __func__, ret);
>>  
>>  	return ret;
>>  }
>> -early_initcall(prevent_bootmem_remove_init);
>> +early_initcall(prevent_memory_remove_init);
>>  #endif
>>  
>>  pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
> 


