Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE56C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hswNx1yk2khP3jCgiHhYfeW+HZiM1IKrwRhJc5vHisk=; b=xjlj7PaDbw+pgcA04Z0jVdwY5Q
	tr84dye2AdXszUO1wXHje/wFHAXmIC0GnEV2tvBZbKRIE7Oo26VgsnkkMxlMiFRDK4QB0yvFjAm9x
	3mlR3ZbtRlnhpL/HB7fjU1wyYpQxW8LFDdnNLgsHmNQwMGDVsvJhjnk19WLDvK+3TNEEJABP3MqUF
	nAF0J+il2x5mCa5pmfc/CL+cIIfOx/EmdxmoQ/JkdS//4iBM1ccujLJ8AEE0MJEXIZuL/cwT4oQoo
	c7YRNkuXRUMnUKpgdpWafluhySpuFbL86PUEwZgV9Q8P6wyGiwIkbcOdJmBMZ27sQ5B1Um/9TrI9u
	Z4Ij4ILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA17G-0000000BtMf-0PGO;
	Wed, 30 Apr 2025 06:40:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA14p-0000000Bt63-3fFx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:37:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27FC4106F;
	Tue, 29 Apr 2025 23:37:44 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B72F93F66E;
	Tue, 29 Apr 2025 23:37:41 -0700 (PDT)
Message-ID: <9687592f-ec04-410f-9fb2-9777edfe1178@arm.com>
Date: Wed, 30 Apr 2025 12:07:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
 <f4a90024-3cc7-4536-84b0-665021d96125@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f4a90024-3cc7-4536-84b0-665021d96125@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_233752_010241_1DD21DC8 
X-CRM114-Status: GOOD (  32.23  )
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



On 29/04/25 6:49 pm, Lorenzo Stoakes wrote:
> Very very very nitty on subject (sorry I realise this is annoying :P) -
> generally don't need to capitalise 'Optimize' here :>)
> 
> Generally I like the idea here. But some issues on impl.
> 
> On Tue, Apr 29, 2025 at 10:53:31AM +0530, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 70f59aa8c2a8..ec5d17af7650 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   	bool toptier;
>>   	int nid;
>>
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		return true;
>> +
> 
> Hm why not just put this here from the start? I think you should put this back
> in the prior commit.
> 
>>   	/* Also skip shared copy-on-write pages */
>>   	if (is_cow_mapping(vma->vm_flags) &&
>>   	    (folio_maybe_dma_pinned(folio) ||
>> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   }
>>
>>   static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>> -		unsigned long addr, pte_t oldpte, int target_node)
>> +		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
>> +		int max_nr, int *nr)
> 
> Hate this ptr to nr.
> 
> Why not just return nr, if it's 0 then skip? Simple!
> 
>>   {
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>   	struct folio *folio;
>>   	int ret;
>>
>> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>>   		return true;
>>
>>   	folio = vm_normal_folio(vma, addr, oldpte);
>> -	if (!folio || folio_is_zone_device(folio) ||
>> -	    folio_test_ksm(folio))
>> +	if (!folio)
>>   		return true;
>> +
> 
> Very nitty, but stray extra line unless intended...
> 
> Not sure why we can't just put this !folio check in prot_numa_skip()?

Because we won't be able to batch if the folio is NULL.

I think I really messed up by having separate patch 1 and 2. The real 
intent of patch 1 was to do batching in patch 2 *and* not have insane 
indentation. Perhaps I should merge them, or completely separate them 
logically, I'll figure this out.

> 
>>   	ret = prot_numa_skip(vma, folio, target_node);
>> -	if (ret)
>> +	if (ret) {
>> +		if (folio_test_large(folio) && max_nr != 1)
>> +			*nr = folio_pte_batch(folio, addr, pte, oldpte,
>> +					      max_nr, flags, NULL, NULL, NULL);
> 
> So max_nr can <= 0 too? Shouldn't this be max_nr > 1?
> 
>>   		return ret;
> 
> Again x = fn_return_bool(); if (x) { return x; } is a bit silly, just do if
> (fn_return_bool()) { return true; }.
> 
> If we return the number of pages, then this can become really simple, like:
> 
> I feel like maybe we should abstract the folio large handling here, though it'd
> be a tiny function so hm.
> 
> Anyway assuming we leave it in place, and return number of pages processed, this
> can become:
> 
> if (prot_numa_skip(vma, folio, target_node)) {
> 	if (folio_test_large(folio) && max_nr > 1)
> 		return folio_pte_batch(folio, addr, pte, oldpte, max_nr, flags,
> 				NULL, NULL, NULL);
> 	return 1;
> }
> 
> Which is neater I think!
> 
> 
>> +	}
>>   	if (folio_use_access_time(folio))
>>   		folio_xchg_access_time(folio,
>>   			jiffies_to_msecs(jiffies));
>> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr;
>>
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr = 1;
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> Not a fan of open-coding this. Since we already provide addr, why not just
> provide end as well and have prot_numa_avoid_fault() calculate it?
> 
>>   			pte_t ptent;
>>
>>   			/*
>> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa &&
>> -			    prot_numa_avoid_fault(vma, addr,
>> -						  oldpte, target_node))
>> +			    prot_numa_avoid_fault(vma, addr, pte,
>> +						  oldpte, target_node,
>> +							  max_nr, &nr))
>>   					continue;
>>
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
> 
> This is icky, having 'nr' here like this.
> 
> But alternatives might be _even more_ icky (that is advancing both on
> prot_numa_avoid_fault() so probably we need to keep it like this.
> 
> Maybe more a moan at the C programming language tbh haha!
> 
> 
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>
>> --
>> 2.30.2
>>


