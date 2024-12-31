Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD50E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 05:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cN84LZS9dG+nE/0sO+t0H/JR17yA4u9e5UeKsKXS0I=; b=G9LhxCPgnRFpVkbha6VnXLVdRH
	/3LnVSGYMR2hGp6OfAuG1qMONPLzUkGqlc2OSNIDTQzpy4Jt6oOB7AyS5386rOWt6t4KpqkMcExDa
	nUJWzPKAaeXgnBkomt7ByeE9pZUlj7E8zy9mUpq0zTLxs4KYg8ZELFUfQGkuwN1GFCLdDDZn59fnX
	KE7L0dNGMhQmCXpxgOlYnIhbNb0fiXI9u9D7bE63TCZpQMKOP4601Cl+nyvuBYiFnhWpToZgAMsXy
	muzX8j95dcXfR7ZAFWfbR/Lb4z8B3N+j6RT1nlWqu0XOQSubGFM5mHwkebG6R4jgQvvBnfrucH7fH
	z9jsLoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSVCG-00000006aHk-1OZP;
	Tue, 31 Dec 2024 05:53:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSVB6-00000006a9H-0FsS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 05:52:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV0hDtP024359;
	Tue, 31 Dec 2024 05:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cN84LZS9dG+nE/0sO+t0H/JR17yA4u9e5UeKsKXS0I=; b=dcHQ9rVKOCzGliq8
	cQSXAwLaTIv1zHXqqX6RSbMTcvLvNrsEMgJMHKmhN7eWLrP5pAvDkJtgp9EUb53u
	CvKni/wcfqdWHLGRXVx0WnTOV1R4P36TgSSEBuKBvVQ+Tykvt9F1k2b7EV0pgN6T
	8phgfVv6abkY+sjNr5lus+cfpB3NwK73Gz2RkA/vUpX4/+E6YSbPX4WBGsR6nun3
	Euv2kaXmNrtGi7LGDGxa/bwR77fePrSoTCO41D4pm0NynMMaxkX/DCTf1kApbhsm
	Y2cXZhjs82BYX5X43Mc5owWtsp3dUuGEYRIn+i+St9sReEByOOWCqABaiC24m/hZ
	Fy1V7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v6af0gu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:52:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV5qE45001722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 05:52:14 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 21:52:10 -0800
Message-ID: <3aadda40-c973-4703-8ed8-9cf2d3eb70a0@quicinc.com>
Date: Tue, 31 Dec 2024 13:52:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
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
Content-Language: en-US
In-Reply-To: <22fd3452-748c-4d4b-bd51-08e6faeaa867@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5H9BvNTYcZCaVFpnualkyY3Sm6WejOYi
X-Proofpoint-GUID: 5H9BvNTYcZCaVFpnualkyY3Sm6WejOYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_215228_212263_5F37EB9A 
X-CRM114-Status: GOOD (  45.68  )
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



On 2024/12/30 15:48, Zhenhua Huang wrote:
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
>>>>> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this 
>>>>> hasn't
>>>>> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
>>>>> sub-section hotplug"). That commit broke some arm64 assumptions.
>>>>
>>>> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>> because it broke arm64 assumptions ?
>>>
>>> Yes, I think that would be better. And a cc stable to 5.4 (the above
>>> commit appeared in 5.3).
>>
>> Agreed. This is a problem which needs fixing but not sure if proposed 
>> patch
>> here fixes that problem.
>>
>>>
>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>> index e2739b69e11b..fd59ee44960e 100644
>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long 
>>>>>> start, unsigned long end, int node,
>>>>>>    {
>>>>>>        WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>>>> -    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>>>> +    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)start), 
>>>>>> PAGES_PER_SECTION) ||
>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>>>>>            return vmemmap_populate_basepages(start, end, node, 
>>>>>> altmap);
>>>>>>        else
>>>>>>            return vmemmap_populate_hugepages(start, end, node, 
>>>>>> altmap);
>>>>>
>>>>> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
>>>>> nuking the whole vmemmap pmd section if it's not empty. Not sure how
>>>>> easy that is, whether we have the necessary information (I haven't
>>>>> looked in detail).
>>>>>
>>>>> A potential issue - can we hotplug 128MB of RAM and only unplug 
>>>>> 2MB? If
>>>>> that's possible, the problem isn't solved by this patch.
>>
>> Believe this is possible after sub-section hotplug and hotremove support.
>>
>>>>
>>>> Indeed, seems there is no guarantee that plug size must be equal to 
>>>> unplug
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
>> Agreed, that will be the right fix for the problem which can be back 
>> ported.
>> We will have to prevent PMD/PUD/CONT mappings for both linear and as 
>> well as
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
>> @@ -1171,9 +1171,15 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, 
>> int node,
>>   int __meminit vmemmap_populate(unsigned long start, unsigned long 
>> end, int node,
>>                  struct vmem_altmap *altmap)
>>   {
>> +       unsigned long start_pfn;
>> +       struct mem_section *ms;
>> +
>>          WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>> -       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +       start_pfn = page_to_pfn((struct page *)start);
>> +       ms = __pfn_to_section(start_pfn);
>> +
>> +       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
> 
> LGTM. I will follow your and Catalin's suggestion to prepare further 
> patches, Thanks!
> 
>>                  return vmemmap_populate_basepages(start, end, node, 
>> altmap);
>>          else
>>                  return vmemmap_populate_hugepages(start, end, node, 
>> altmap);
>> @@ -1334,10 +1340,15 @@ struct range arch_get_mappable_range(void)
>>   int arch_add_memory(int nid, u64 start, u64 size,
>>                      struct mhp_params *params)
>>   {
>> +       unsigned long start_pfn = page_to_pfn((struct page *)start);
>> +       struct mem_section *ms = __pfn_to_section(start_pfn);
>>          int ret, flags = NO_EXEC_MAPPINGS;
>>          VM_BUG_ON(!mhp_range_allowed(start, size, true));
>> +       if (!early_section(ms))
>> +               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> 
> However, here comes another doubt, given that the subsection size is 2M, 
> shouldn't we have ability to support PMD SECTION MAPPING if 
> CONFIG_ARM64_4K_PAGES? This might be the optimization we want to maintain?
> 
> Should we remove NO_BLOCK_MAPPINGS and add more constraints to avoid 
> pud_set_huge if CONFIG_ARM64_4K_PAGES ?
> 

BTW, shall we remove the check for !early_section since arch_add_memory 
is only called during hotplugging case? Correct me please if I'm mistaken :)
The idea is like(not fully tested):

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e2739b69e11b..9afeb35673a3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -45,6 +45,7 @@
  #define NO_BLOCK_MAPPINGS      BIT(0)
  #define NO_CONT_MAPPINGS       BIT(1)
  #define NO_EXEC_MAPPINGS       BIT(2)  /* assumes FEAT_HPDS is not used */
+#define NO_PUD_BLOCK_MAPPINGS  BIT(3)  /* Hotplug case: do not want 
block mapping for PUD */

  u64 kimage_voffset __ro_after_init;
  EXPORT_SYMBOL(kimage_voffset);
@@ -356,10 +357,12 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned 
long addr, unsigned long end,

                 /*
                  * For 4K granule only, attempt to put down a 1GB block
+                * Hotplug case: do not attempt 1GB block
                  */
                 if (pud_sect_supported() &&
                    ((addr | next | phys) & ~PUD_MASK) == 0 &&
-                   (flags & NO_BLOCK_MAPPINGS) == 0) {
+                   (flags & NO_BLOCK_MAPPINGS) == 0 &&
+                   (flags & NO_PUD_BLOCK_MAPPINGS) == 0) {
                         pud_set_huge(pudp, phys, prot);

                         /*
@@ -1175,9 +1178,16 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int 
node,
  int __meminit vmemmap_populate(unsigned long start, unsigned long end, 
int node,
                 struct vmem_altmap *altmap)
  {
+       unsigned long start_pfn;
+       struct mem_section *ms;
+
         WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));

-       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+       start_pfn = page_to_pfn((struct page *)start);
+       ms = __pfn_to_section(start_pfn);
+
+       /* hotplugged section not support hugepages */
+       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
                 return vmemmap_populate_basepages(start, end, node, 
altmap);
         else
                 return vmemmap_populate_hugepages(start, end, node, 
altmap);
@@ -1342,6 +1352,16 @@ int arch_add_memory(int nid, u64 start, u64 size,

         VM_BUG_ON(!mhp_range_allowed(start, size, true));

+       if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+       /*
+        * As per subsection granule is 2M, allow PMD block mapping in
+        * case 4K PAGES.
+        * Other cases forbid section mapping.
+        */
+               flags |= NO_PUD_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+       else
+               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
         if (can_set_direct_map())
                 flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;



>> +
>>          if (can_set_direct_map())
>>                  flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>
>>>
>>>> 2. If we want to take this optimization.
>>>> I propose adding one argument to vmemmap_free to indicate if the entire
>>>> section is freed(based on subsection map). Vmemmap_free is a common 
>>>> function
>>>> and might affect other architectures... The process would be:
>>>> vmemmap_free
>>>>     unmap_hotplug_range //In unmap_hotplug_pmd_range() as you 
>>>> mentioned：if
>>>> whole section is freed, proceed as usual. Otherwise, *just clear out 
>>>> struct
>>>> page content but do not free*.
>>>>     free_empty_tables // will be called only if entire section is freed
>>>>
>>>> On the populate side,
>>>> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this 
>>>> function
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
>>                                                          PMD_SIZE, 
>> altmap);
>>         }
>>     } while ()
>> }
>>
>> Do you mean clearing the PMD entry but not freeing the mapped page for 
>> vmemmap ?
>> In that case should the hot-unplug fail or not ? If we free the pfns 
>> (successful
>> hot-unplug), then leaving behind entire PMD entry for covering the 
>> remaining sub
>> sections, is going to be problematic as it still maps the removed pfns 
>> as well !
> 
> Could you please help me to understand in which scenarios this might 
> cause issue? I assume we won't touch these struct page further?
> 
>>
>>> does leave a 2MB vmemmap block in place when freeing the last subsection
>>> but it's safer than freeing valid struct page entries. In addition, it
>>> could query the memory hotplug state with something like
>>> find_memory_block() and figure out whether the section is empty.
>>
>> I guess there are two potential solutions, if 
>> unmap_hotplug_pmd_range() were to
>> handle sub-section removal.
>>
>> 1) Skip pmd_clear() when entire section is not covered
>>
>> a. pmd_clear() only if all but the current subsection have been 
>> removed earlier
>>     via is_subsection_map_empty() or something similar.
>>
>> b. Skip pmd_clear() if the entire section covering that PMD is not 
>> being removed
>>     but that might be problematic, as it still maps potentially 
>> unavailable pfns,
>>     which are now hot-unplugged out.
>>
>> 2) Break PMD into base pages
>>
>> a. pmd_clear() only if all but the current subsection have been 
>> removed earlier
>>     via is_subsection_map_empty() or something similar.
>>
>> b. Break entire PMD into base page mappings and remove entries 
>> corresponding to
>>     the subsection being removed. Although the BBM sequence needs to 
>> be followed
>>     while making sure that no other part of the kernel is accessing 
>> subsections,
>>     that are mapped via the erstwhile PMD but currently not being 
>> removed.
>>
>>>
>>> Anyway, I'll be off until the new year, maybe I get other ideas by then.
>>>
> 
> 


