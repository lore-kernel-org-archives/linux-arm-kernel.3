Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3D9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjO2EggScuOllKktrWFHe7yaTaIe/zkkTeovFc4ptrA=; b=VtI9VH/OtffIyVCaWEBambOW/0
	Blz5AtD2MTJCD4m5LW5wmCq6UeMVFAQPoXSlnxRAbMRI56aO9WnCSrMk6NkqgLwpnQkYohKoFoP7H
	rxl1IaeKhGWfE2VO/qBQkjIENQFRjLuOYGtzBtFF7L9AW2dF26Mh0l1g7YCh6jrHUMr4n1bVT8MQZ
	oNnygE6KJAhUmbWflgKMF/2RPGSN08+PFu5UeoWMoW+L6TbvJuk7FZGwZYmLwe/LKmTR2/GEFfM/Y
	FLGuW9dwbMU2FSVX5ndYZa8NQWE6LYtK+/UlaXyNx2LVT5zmwdgO8vzWrqfW883TU6VGlmMZsX2X6
	P/WNsiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHCU-0000000A0xr-2LJR;
	Thu, 02 Jan 2025 09:09:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHBF-0000000A0Ro-3hEN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:07:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50279g40010882;
	Thu, 2 Jan 2025 09:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjO2EggScuOllKktrWFHe7yaTaIe/zkkTeovFc4ptrA=; b=LNn6wlWhY4Uq7zZW
	7WqOS+4CwC18rXTziZbiONSvGxkeBUGYo2qDE+aBXoxh1uo7cEwKIlrmNDtbkNLn
	6dVfyYW5Rpj2FgUc1acJDknv6qBBXy1an/s36VLZOtOkA6TUGRIqvO6Efyy6fJMw
	9Wm7cTaJie7VPTkBts47LUAG3pzthO+p1PsdzZ4Jysr5xppU0cZpTSyCUturaonc
	IpCVyrUefl2x0nHNdJ9k3H2FR0GY2Oy/Dlc2tFq9wgC2BucivyffEfwGkkPoEaq9
	QXoFRC284io6A+ip7PwLzCiH0sAhAcdDC7iB0QyVjdEljX1N3qXOeTqPE2Zm+5eg
	32m7IQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wp5vg77f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 09:07:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50297Z3J007525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 09:07:35 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 01:07:30 -0800
Message-ID: <aedbbc4f-8f6c-46d8-a8d7-53103675a816@quicinc.com>
Date: Thu, 2 Jan 2025 17:07:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com> <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com> <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
 <22fd3452-748c-4d4b-bd51-08e6faeaa867@quicinc.com>
 <3aadda40-c973-4703-8ed8-9cf2d3eb70a0@quicinc.com>
 <3af539ac-d241-4349-be37-9f41ee42c86c@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <3af539ac-d241-4349-be37-9f41ee42c86c@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rIv5tPZ79GRWYc-1_COEMldHG3_-czBj
X-Proofpoint-GUID: rIv5tPZ79GRWYc-1_COEMldHG3_-czBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501020077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_010750_035334_0C86314B 
X-CRM114-Status: GOOD (  42.18  )
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



On 2025/1/2 11:16, Anshuman Khandual wrote:
> 
> 
> On 12/31/24 11:22, Zhenhua Huang wrote:
>>
>>
>> On 2024/12/30 15:48, Zhenhua Huang wrote:
>>> Hi Anshuman,
>>>
>>> On 2024/12/27 15:49, Anshuman Khandual wrote:
>>>> On 12/24/24 19:39, Catalin Marinas wrote:
>>>>> On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
>>>>>> Thanks Catalin for review!
>>>>>> Merry Christmas.
>>>>>
>>>>> Merry Christmas to you too!
>>>>>
>>>>>> On 2024/12/21 2:30, Catalin Marinas wrote:
>>>>>>> On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
>>>>>>>> Fixes: c1cc1552616d ("arm64: MMU initialisation")
>>>>>>>
>>>>>>> I wouldn't add a fix for the first commit adding arm64 support, we did
>>>>>>> not even have memory hotplug at the time (added later in 5.7 by commit
>>>>>>> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
>>>>>>> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
>>>>>>> sub-section hotplug"). That commit broke some arm64 assumptions.
>>>>>>
>>>>>> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>>> because it broke arm64 assumptions ?
>>>>>
>>>>> Yes, I think that would be better. And a cc stable to 5.4 (the above
>>>>> commit appeared in 5.3).
>>>>
>>>> Agreed. This is a problem which needs fixing but not sure if proposed patch
>>>> here fixes that problem.
>>>>
>>>>>
>>>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>>>> index e2739b69e11b..fd59ee44960e 100644
>>>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>>>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>>>>>>     {
>>>>>>>>         WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>>>>>> -    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>>>>>> +    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>>>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
>>>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>>>>>>>             return vmemmap_populate_basepages(start, end, node, altmap);
>>>>>>>>         else
>>>>>>>>             return vmemmap_populate_hugepages(start, end, node, altmap);
>>>>>>>
>>>>>>> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
>>>>>>> nuking the whole vmemmap pmd section if it's not empty. Not sure how
>>>>>>> easy that is, whether we have the necessary information (I haven't
>>>>>>> looked in detail).
>>>>>>>
>>>>>>> A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
>>>>>>> that's possible, the problem isn't solved by this patch.
>>>>
>>>> Believe this is possible after sub-section hotplug and hotremove support.
>>>>
>>>>>>
>>>>>> Indeed, seems there is no guarantee that plug size must be equal to unplug
>>>>>> size...
>>>>>>
>>>>>> I have two ideas:
>>>>>> 1. Completely disable this PMD mapping optimization since there is no
>>>>>> guarantee we must align 128M memory for hotplug ..
>>>>>
>>>>> I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
>>>>> I think the only advantage here is that we don't allocate a full 2MB
>>>>> block for vmemmap when only plugging in a sub-section.
>>>>
>>>> Agreed, that will be the right fix for the problem which can be back ported.
>>>> We will have to prevent PMD/PUD/CONT mappings for both linear and as well as
>>>
>>> Thanks Anshuman, yeah.. we must handle linear mapping as well.
>>>
>>>> vmemmap for all non-boot memory sections, that can be hot-unplugged.
>>>>
>>>> Something like the following ? [untested]
>>>>
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 216519663961..56b9c6891f46 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1171,9 +1171,15 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>>>    int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>>                   struct vmem_altmap *altmap)
>>>>    {
>>>> +       unsigned long start_pfn;
>>>> +       struct mem_section *ms;
>>>> +
>>>>           WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>> -       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>> +       start_pfn = page_to_pfn((struct page *)start);
>>>> +       ms = __pfn_to_section(start_pfn);
>>>> +
>>>> +       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
>>>
>>> LGTM. I will follow your and Catalin's suggestion to prepare further patches, Thanks!
>>>
>>>>                   return vmemmap_populate_basepages(start, end, node, altmap);
>>>>           else
>>>>                   return vmemmap_populate_hugepages(start, end, node, altmap);
>>>> @@ -1334,10 +1340,15 @@ struct range arch_get_mappable_range(void)
>>>>    int arch_add_memory(int nid, u64 start, u64 size,
>>>>                       struct mhp_params *params)
>>>>    {
>>>> +       unsigned long start_pfn = page_to_pfn((struct page *)start);
>>>> +       struct mem_section *ms = __pfn_to_section(start_pfn);
>>>>           int ret, flags = NO_EXEC_MAPPINGS;
>>>>           VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>>> +       if (!early_section(ms))
>>>> +               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>
>>> However, here comes another doubt, given that the subsection size is 2M, shouldn't we have ability to support PMD SECTION MAPPING if CONFIG_ARM64_4K_PAGES? This might be the optimization we want to maintain?
>>>
>>> Should we remove NO_BLOCK_MAPPINGS and add more constraints to avoid pud_set_huge if CONFIG_ARM64_4K_PAGES ?
>>>
>>
>> BTW, shall we remove the check for !early_section since arch_add_memory is only called during hotplugging case? Correct me please if I'm mistaken :)
> 
> While this is true, still might be a good idea to keep the early_section()
> check in place just to be extra careful here. Otherwise an WARN_ON() might
> be needed.

Make sense. I would like to add some comments and WARN_ON() if 
early_section().

> 
>> The idea is like(not fully tested):
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index e2739b69e11b..9afeb35673a3 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -45,6 +45,7 @@
>>   #define NO_BLOCK_MAPPINGS      BIT(0)
>>   #define NO_CONT_MAPPINGS       BIT(1)
>>   #define NO_EXEC_MAPPINGS       BIT(2)  /* assumes FEAT_HPDS is not used */
>> +#define NO_PUD_BLOCK_MAPPINGS  BIT(3)  /* Hotplug case: do not want block mapping for PUD */
> 
> Since block mappings get created either at PMD or PUD, the existing flag
> NO_BLOCK_MAPPINGS should be split into two i.e NO_PMD_BLOCK_MAPPINGS and
> NO_PUD_BLOCK_MAPPINGS (possibly expanding into P4D later). Although all
> block mappings can still be prevented using the existing flag which can
> be derived from the new ones.
> 
> #define NO_BLOCK_MAPPINGS (NO_PMD_BLOCK_MAPPINGS | NO_PUD_BLOCK_MAPPINGS)

Thanks, it's more clear.

> 
>>
>>   u64 kimage_voffset __ro_after_init;
>>   EXPORT_SYMBOL(kimage_voffset);
>> @@ -356,10 +357,12 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>
>>                  /*
>>                   * For 4K granule only, attempt to put down a 1GB block
>> +                * Hotplug case: do not attempt 1GB block
>>                   */
>>                  if (pud_sect_supported() &&
>>                     ((addr | next | phys) & ~PUD_MASK) == 0 &&
>> -                   (flags & NO_BLOCK_MAPPINGS) == 0) {
>> +                   (flags & NO_BLOCK_MAPPINGS) == 0 &&
>> +                   (flags & NO_PUD_BLOCK_MAPPINGS) == 0) {
> 
> After flags being split as suggested above, only the PUD block mapping
> flag need to be checked here, and similarly the PMU block mapping flag
> needs to be checked in alloc_init_pmd().
> 
>>                          pud_set_huge(pudp, phys, prot);
>>
>>                          /*
>> @@ -1175,9 +1178,16 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>                  struct vmem_altmap *altmap)
>>   {
>> +       unsigned long start_pfn;
>> +       struct mem_section *ms;
>> +
>>          WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>
>> -       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +       start_pfn = page_to_pfn((struct page *)start);
>> +       ms = __pfn_to_section(start_pfn);
>> +
>> +       /* hotplugged section not support hugepages */
>> +       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
>>                  return vmemmap_populate_basepages(start, end, node, altmap);
>>          else
>>                  return vmemmap_populate_hugepages(start, end, node, altmap);
>> @@ -1342,6 +1352,16 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>
>>          VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>
>> +       if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +       /*
>> +        * As per subsection granule is 2M, allow PMD block mapping in
>> +        * case 4K PAGES.
>> +        * Other cases forbid section mapping.
>> +        */
>> +               flags |= NO_PUD_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>> +       else
>> +               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>> +
>>          if (can_set_direct_map())
>>                  flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>
> 
> Basically vmmemap will not allow PMD or PUD block mapping for non boot
> memory as a 2MB sized sub-section hot removal involves tearing down a
> sub PMD i.e (512 * sizeof(struct page)) VA range, which is currently
> not supported in unmap_hotplug_range().
> 
> Although linear mapping could still support PMD block mapping as hot
> removing a 2MB sized sub-section will tear down an entire PMD entry.
> 
> Fair enough but seems like this should be done after the fix patch
> which prevents all block mappings for early section memory as that

s/early section/non early section ?
Sure, I will wait for Catalin/Will's comments.

> will be an easy back port. But will leave this to upto Catalin/Will
> to decide.
> 
>>
>>
>>>> +
>>>>           if (can_set_direct_map())
>>>>                   flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>>
>>>>>
>>>>>> 2. If we want to take this optimization.
>>>>>> I propose adding one argument to vmemmap_free to indicate if the entire
>>>>>> section is freed(based on subsection map). Vmemmap_free is a common function
>>>>>> and might affect other architectures... The process would be:
>>>>>> vmemmap_free
>>>>>>      unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if
>>>>>> whole section is freed, proceed as usual. Otherwise, *just clear out struct
>>>>>> page content but do not free*.
>>>>>>      free_empty_tables // will be called only if entire section is freed
>>>>>>
>>>>>> On the populate side,
>>>>>> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
>>>>>>      continue;    //Buffer still exists, just abort..
>>>>>>
>>>>>> Could you please comment further whether #2 is feasible ?
>>>>>
>>>>> vmemmap_free() already gets start/end, so it could at least check the
>>>>> alignment and avoid freeing if it's not unplugging a full section. It
>>>>
>>>> unmap_hotplug_pmd_range()
>>>> {
>>>>      do {
>>>>          if (pmd_sect(pmd)) {
>>>>              pmd_clear(pmdp);
>>>>              flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>>                           if (free_mapped)
>>>>                                   free_hotplug_page_range(pmd_page(pmd),
>>>>                                                           PMD_SIZE, altmap);
>>>>          }
>>>>      } while ()
>>>> }
>>>>
>>>> Do you mean clearing the PMD entry but not freeing the mapped page for vmemmap ?
>>>> In that case should the hot-unplug fail or not ? If we free the pfns (successful
>>>> hot-unplug), then leaving behind entire PMD entry for covering the remaining sub
>>>> sections, is going to be problematic as it still maps the removed pfns as well !
>>>
>>> Could you please help me to understand in which scenarios this might cause issue? I assume we won't touch these struct page further?
>>>
>>>>
>>>>> does leave a 2MB vmemmap block in place when freeing the last subsection
>>>>> but it's safer than freeing valid struct page entries. In addition, it
>>>>> could query the memory hotplug state with something like
>>>>> find_memory_block() and figure out whether the section is empty.
>>>>
>>>> I guess there are two potential solutions, if unmap_hotplug_pmd_range() were to
>>>> handle sub-section removal.
>>>>
>>>> 1) Skip pmd_clear() when entire section is not covered
>>>>
>>>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>>>      via is_subsection_map_empty() or something similar.
>>>>
>>>> b. Skip pmd_clear() if the entire section covering that PMD is not being removed
>>>>      but that might be problematic, as it still maps potentially unavailable pfns,
>>>>      which are now hot-unplugged out.
>>>>
>>>> 2) Break PMD into base pages
>>>>
>>>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>>>      via is_subsection_map_empty() or something similar.
>>>>
>>>> b. Break entire PMD into base page mappings and remove entries corresponding to
>>>>      the subsection being removed. Although the BBM sequence needs to be followed
>>>>      while making sure that no other part of the kernel is accessing subsections,
>>>>      that are mapped via the erstwhile PMD but currently not being removed.
>>>>
>>>>>
>>>>> Anyway, I'll be off until the new year, maybe I get other ideas by then.
>>>>>
>>>
>>>
>>


