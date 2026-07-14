Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30667C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae/klHPrw6XikHNA4G0PypNfCBya6aaG0EoWE65OTbs=; b=jBuom/1rAaDNVP2hATBLFxt3T2
	k9LCmW2Xo1w1jmzYaT3dV4+kMU+GBaNufwVXnZPubAQik/28Q2BdkNAEEhew+JDGyRxcn0sTsvmJS
	oCOmcG9oUmRaxpK/mEs7y6sV7b1q4M/SkoYB9lREQDUoaCBFChTxEt4egp7FfPqYHMEx5ZgJQMO2d
	u9cx6NZSlqpdjxj/SkogeHs8+VF6QzLdPmVSWGDrVRlCnsiWiPUoLVG8oqDlgGk3VJuYbYvLu2e1S
	5wTj2BOxUKq17VNE6xoZW+cSaJoKDxE2Cas9SztXbGFaX7i4QSol8I57CDowcBs3bSGZfDh7M4wP5
	qs40vLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUrF-0000000AtDh-3vBP;
	Tue, 14 Jul 2026 04:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUrD-0000000AtCS-0GWU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 04:35:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82C421570;
	Mon, 13 Jul 2026 21:34:53 -0700 (PDT)
Received: from [10.164.148.52] (unknown [10.164.148.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91D583F7B4;
	Mon, 13 Jul 2026 21:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784003697; bh=BxkWyC9Bhg38Bdzlxk2i0B0fqTApnC3gzsK70rHjD2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwUrnLjzAVWoVjf+esj3MW/phE+xAwE72Ug8zTJ/jqyB6sMXFO9y11RbpKOBGwemy
	 e2us0nCdvNyjzhZPb6pzcu+k41WXpRHoZnHxbjdRcfeXtBzfcMMWgSPzDYpbQfhr+b
	 ybZ0qBZJAfJTQYR1SkfrgB4ot17SfThYt7Oea9PY=
Message-ID: <cec57a2d-c507-4ad1-a598-a0ca7ac8f427@arm.com>
Date: Tue, 14 Jul 2026 10:04:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
 linux-mm@kvack.org, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, Wen Jiang <jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
 <54434a84-51b3-4e3f-988b-6bcbac5a2f42@arm.com> <alUgwPT9uh_EWItt@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <alUgwPT9uh_EWItt@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_213459_196904_47F8AD61 
X-CRM114-Status: GOOD (  26.24  )
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



On 13/07/26 11:00 pm, Uladzislau Rezki wrote:
> On Mon, Jul 13, 2026 at 08:43:14PM +0530, Dev Jain wrote:
>>
>>
>> On 10/07/26 2:24 pm, Wen Jiang wrote:
>>> On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>>>>
>>>> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>>>
>>>>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
>>>>> is physically fully or partially contiguous.
>>>>
>>>> Thanks, I added this to mm.git's mm-new branch for wider testing.
>>>>
>>>> AI review asked some questions, and some of them are new since the v5
>>>> series:
>>>>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
>>>
>>> Hi Andrew,
>>>
>>> I've gone through the Sashiko findings:
>>>
>>> - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
>>>   is added. The extra sizes are only used by init_mm kernel mappings via.
>>>
>>> - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
>>>     array of valid struct page pointers.
>>
>> Correct, but vmap_pages_pte_range has !page and !pfn_valid checks.
>>
>> I really hate those checks - if those checks have any remote possibility of
>> firing, then we already have a bug at
>>
>> vm_map_ram -> vmap_pages_range -> vmap_pages_range_noflush -> kmsan_vmap_pages_range_noflush
>>
>> because the last function dereferences the struct page pointers.
>>
>> It is painful to do the page array sanity check deep into vmap - it implies
>> we simply cannot play with the page array before that.
>>
>> But since vmap is an exported function, doing a sanity check for the page array
>> in the vmap code makes sense.
>>
>> So how about the following:
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index afaa14ebf17bb..0c44bb7a45b5d 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -566,14 +566,6 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>  			err = -EBUSY;
>>  			break;
>>  		}
>> -		if (WARN_ON(!page)) {
>> -			err = -ENOMEM;
>> -			break;
>> -		}
>> -		if (WARN_ON(!pfn_valid(page_to_pfn(page)))) {
>> -			err = -EINVAL;
>> -			break;
>> -		}
>>
>>  		pfn = page_to_pfn(page);
>>  		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
>> @@ -603,11 +595,6 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>>  			struct page *page = pages[*nr];
>>  			phys_addr_t phys_addr;
>>
>> -			if (WARN_ON(!page))
>> -				return -ENOMEM;
>> -			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
>> -				return -EINVAL;
>> -
>>  			phys_addr = page_to_phys(page);
>>
>>  			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
>> @@ -3663,6 +3650,19 @@ static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
>>  	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
>>  }
>>
>> +static inline bool vmap_page_sanity_checks(struct page **pages, unsigned int count)
>> +{
>> +	for (int i = 0; i < count; ++i) {
>> +		if (WARN_ON(!pages[i]))
>> +			return true;
>> +
>> +		if (WARN_ON(!pfn_valid(page_to_pfn(pages[i]))))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * vmap - map an array of pages into virtually contiguous space
>>   * @pages: array of page pointers
>> @@ -3706,6 +3706,9 @@ void *vmap(struct page **pages, unsigned int count,
>>  	if (!area)
>>  		return NULL;
>>
>> +	if (unlikely(vmap_page_sanity_checks(pages, count)))
>> +		return NULL;
>> +
>>  	addr = (unsigned long)area->addr;
>>  	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
>>  				pages) < 0) {
>>
>>
>>
>> Reasoning for calling vmap_page_sanity_checks() before vmap_pages_range_batched,
>> and not at the start of vmap: I am worried that since vmap() is already very
>> fast, we may cause a regression:
>>
>> vmap() -> scan page array with linear map pointers -> vmap_get_aligned_vm_area (does
>> memory allocation, throwing out the linear map VAs from cache and TLB) -> walk
>> the pgtables and again access cold page array.
>>
>> Perhaps I am being very pedantic here. What do you think?
>>
> Sanity check adds extra CPU cycles and it adds overhead. The concern about cache
> to be cold on second iteration looks valid. You can get some perf figures to see
> the cost.
> 
> I would just keep the original approach. But no strong opinion here.

Given you don't have a strong opinion here, I would also prefer keeping the original
approach. This feels more like a code structure problem than a correctness problem,
*and* given that with kmsan builds we have this problem for years now in the kernel.

So perhaps we can look at how to solve this later.


> 
> --
> Uladzislau Rezki


