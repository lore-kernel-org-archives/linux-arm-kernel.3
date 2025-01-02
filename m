Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE116E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 03:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/PgJP4At7maMkgEr5XksIBOUd9G8YNnzJaI2ze6h/E=; b=e7DA0pGK7TnbSG8ynk9ISy5Vc2
	WOfMGnL52Uqztcc+1NPcp3oP0UKZNknXeYdQL6MdHCKvuYHxewrHfehJZtV41eOyto8ZevvNPcHQb
	zyegzQQBPzdF5Fg2UBD2AcCn0AhQXVZc07wZs2tYTUHie5CTwCSXTdQQo/1/XwtU2iaDESrm8+eox
	LP+ekms56dKhmiw2JPODaR0EoQIEX0dRWE3Hwx3zrdUBz37cAfN3ybyiDJl98GMyfnLtXrMxeLBfL
	kzEkath6e1gAS2aryWJA7UZqW3mD0fbHJTxx9rqc2oNoLcnhmOS8/FcMFxEEPzuQ3fV9kpcwSgE/i
	uR9QngoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTCGj-00000009gHh-2RbB;
	Thu, 02 Jan 2025 03:53:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTCFb-00000009gCx-0VsD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 03:52:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51A2C11FB;
	Wed,  1 Jan 2025 19:52:25 -0800 (PST)
Received: from [10.162.16.95] (a077893.blr.arm.com [10.162.16.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E1523F59E;
	Wed,  1 Jan 2025 19:51:53 -0800 (PST)
Message-ID: <88dc8823-1439-40ed-80a3-becb4a51aff7@arm.com>
Date: Thu, 2 Jan 2025 09:21:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com> <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com> <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
 <22fd3452-748c-4d4b-bd51-08e6faeaa867@quicinc.com>
Content-Language: en-US
In-Reply-To: <22fd3452-748c-4d4b-bd51-08e6faeaa867@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_195159_251722_ACB9DA13 
X-CRM114-Status: GOOD (  35.85  )
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

On 12/30/24 13:18, Zhenhua Huang wrote:
> Hi Anshuman,
> 
> On 2024/12/27 15:49, Anshuman Khandual wrote:
>> On 12/24/24 19:39, Catalin Marinas wrote:
>>> On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
>>>> Thanks Catalin for review!
>>>> Merry Christmas.
>>>
>>> Merry Christmas to you too!
>>>
>>>> On 2024/12/21 2:30, Catalin Marinas wrote:
>>>>> On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
>>>>>> Fixes: c1cc1552616d ("arm64: MMU initialisation")
>>>>>
>>>>> I wouldn't add a fix for the first commit adding arm64 support, we did
>>>>> not even have memory hotplug at the time (added later in 5.7 by commit
>>>>> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
>>>>> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
>>>>> sub-section hotplug"). That commit broke some arm64 assumptions.
>>>>
>>>> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>> because it broke arm64 assumptions ?
>>>
>>> Yes, I think that would be better. And a cc stable to 5.4 (the above
>>> commit appeared in 5.3).
>>
>> Agreed. This is a problem which needs fixing but not sure if proposed patch
>> here fixes that problem.
>>
>>>
>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>> index e2739b69e11b..fd59ee44960e 100644
>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>>>>    {
>>>>>>        WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>>>> -    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>>>> +    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>>>>>            return vmemmap_populate_basepages(start, end, node, altmap);
>>>>>>        else
>>>>>>            return vmemmap_populate_hugepages(start, end, node, altmap);
>>>>>
>>>>> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
>>>>> nuking the whole vmemmap pmd section if it's not empty. Not sure how
>>>>> easy that is, whether we have the necessary information (I haven't
>>>>> looked in detail).
>>>>>
>>>>> A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
>>>>> that's possible, the problem isn't solved by this patch.
>>
>> Believe this is possible after sub-section hotplug and hotremove support.
>>
>>>>
>>>> Indeed, seems there is no guarantee that plug size must be equal to unplug
>>>> size...
>>>>
>>>> I have two ideas:
>>>> 1. Completely disable this PMD mapping optimization since there is no
>>>> guarantee we must align 128M memory for hotplug ..
>>>
>>> I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
>>> I think the only advantage here is that we don't allocate a full 2MB
>>> block for vmemmap when only plugging in a sub-section.
>>
>> Agreed, that will be the right fix for the problem which can be back ported.
>> We will have to prevent PMD/PUD/CONT mappings for both linear and as well as
> 
> Thanks Anshuman, yeah.. we must handle linear mapping as well.
> 
>> vmemmap for all non-boot memory sections, that can be hot-unplugged.
>>
>> Something like the following ? [untested]
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 216519663961..56b9c6891f46 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1171,9 +1171,15 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>                  struct vmem_altmap *altmap)
>>   {
>> +       unsigned long start_pfn;
>> +       struct mem_section *ms;
>> +
>>          WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>   -       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +       start_pfn = page_to_pfn((struct page *)start);
>> +       ms = __pfn_to_section(start_pfn);
>> +
>> +       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
> 
> LGTM. I will follow your and Catalin's suggestion to prepare further patches, Thanks!
> 
>>                  return vmemmap_populate_basepages(start, end, node, altmap);
>>          else
>>                  return vmemmap_populate_hugepages(start, end, node, altmap);
>> @@ -1334,10 +1340,15 @@ struct range arch_get_mappable_range(void)
>>   int arch_add_memory(int nid, u64 start, u64 size,
>>                      struct mhp_params *params)
>>   {
>> +       unsigned long start_pfn = page_to_pfn((struct page *)start);
>> +       struct mem_section *ms = __pfn_to_section(start_pfn);
>>          int ret, flags = NO_EXEC_MAPPINGS;
>>            VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>   +       if (!early_section(ms))
>> +               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> 
> However, here comes another doubt, given that the subsection size is 2M, shouldn't we have ability to support PMD SECTION MAPPING if CONFIG_ARM64_4K_PAGES? This might be the optimization we want to maintain?> 
> Should we remove NO_BLOCK_MAPPINGS and add more constraints to avoid pud_set_huge if CONFIG_ARM64_4K_PAGES ?

I guess this has been covered on the thread.

> 
>> +
>>          if (can_set_direct_map())
>>                  flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>  
>>>
>>>> 2. If we want to take this optimization.
>>>> I propose adding one argument to vmemmap_free to indicate if the entire
>>>> section is freed(based on subsection map). Vmemmap_free is a common function
>>>> and might affect other architectures... The process would be:
>>>> vmemmap_free
>>>>     unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if
>>>> whole section is freed, proceed as usual. Otherwise, *just clear out struct
>>>> page content but do not free*.
>>>>     free_empty_tables // will be called only if entire section is freed
>>>>
>>>> On the populate side,
>>>> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
>>>>     continue;    //Buffer still exists, just abort..
>>>>
>>>> Could you please comment further whether #2 is feasible ?
>>>
>>> vmemmap_free() already gets start/end, so it could at least check the
>>> alignment and avoid freeing if it's not unplugging a full section. It
>>
>> unmap_hotplug_pmd_range()
>> {
>>     do {
>>         if (pmd_sect(pmd)) {
>>             pmd_clear(pmdp);
>>             flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>                          if (free_mapped)
>>                                  free_hotplug_page_range(pmd_page(pmd),
>>                                                          PMD_SIZE, altmap);
>>         }
>>     } while ()
>> }
>>
>> Do you mean clearing the PMD entry but not freeing the mapped page for vmemmap ?
>> In that case should the hot-unplug fail or not ? If we free the pfns (successful
>> hot-unplug), then leaving behind entire PMD entry for covering the remaining sub
>> sections, is going to be problematic as it still maps the removed pfns as well !
> 
> Could you please help me to understand in which scenarios this might cause issue? I assume we won't touch these struct page further?

Regardless of whether the non-present pfns are accessed or not from the cpu, having
page table mappings covering them might probably create corresponding TLB entries ?
IIUC from an arch perspective, this seems undesirable and possibly some what risky.

> 
>>
>>> does leave a 2MB vmemmap block in place when freeing the last subsection
>>> but it's safer than freeing valid struct page entries. In addition, it
>>> could query the memory hotplug state with something like
>>> find_memory_block() and figure out whether the section is empty.
>>
>> I guess there are two potential solutions, if unmap_hotplug_pmd_range() were to
>> handle sub-section removal.
>>
>> 1) Skip pmd_clear() when entire section is not covered
>>
>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>     via is_subsection_map_empty() or something similar.
>>
>> b. Skip pmd_clear() if the entire section covering that PMD is not being removed
>>     but that might be problematic, as it still maps potentially unavailable pfns,
>>     which are now hot-unplugged out.
>>
>> 2) Break PMD into base pages
>>
>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>     via is_subsection_map_empty() or something similar.
>>
>> b. Break entire PMD into base page mappings and remove entries corresponding to
>>     the subsection being removed. Although the BBM sequence needs to be followed
>>     while making sure that no other part of the kernel is accessing subsections,
>>     that are mapped via the erstwhile PMD but currently not being removed.
>>
>>>
>>> Anyway, I'll be off until the new year, maybe I get other ideas by then.
>>>
> 

