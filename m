Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E13CD68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtgxMJy+nJmKfNZGRwA0XhkF4m6Mp5Z7MBUdEpNpwCs=; b=t/ZVu2tNDOwaY5TjXdBfGCkAEP
	aKU0nHe0crcBei6xARcl9B4lAFAjA4ea1j9D2F7HbTc2Hy3hy03B7z87u33m7pcBZX2ZHxmtJ3V1/
	fwhGEusf302oN20O8ZkrzdjC45hF8KZg2pxwK8mTLBakZH5bD9V2V52mXyZ+XXZLllC5NEQB+gOzn
	/x7EWVBLp3DJ25ubLOHG04habWogFEwGQzS84jUIAxrYr36nTSU83Eer3BAnyjjjlk/XqJBHDxEuB
	LzXmmSxtQE2s8BPYvvVeRdE8+q08OE/nw0AMRVwQ2BMwLZyek+Ut0kbtkpjrgcMaUvnnyNkkRUqTl
	kmZiJcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8jI-00000007ytm-31oc;
	Thu, 18 Dec 2025 07:47:20 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8jD-00000007yt9-3vEC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 07:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766044032; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xtgxMJy+nJmKfNZGRwA0XhkF4m6Mp5Z7MBUdEpNpwCs=;
	b=qweG0/veMjJAvHfJaN69RNmOJITqyL/PDfV/+woiZC2zJaetxSWgv1WCOgFGx2MuSuzUZGvu8bnK1+EW8G34hurm/0ROAi6eWBZigzoO61YuD0PMDehLHC8kaKLVgA8yZikhlpMaxK+1ACph3YrfIE8H1gd0HniS0ktwQLFKC/o=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wv7mHTb_1766044027 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 18 Dec 2025 15:47:08 +0800
Message-ID: <89cdd927-fc88-42cf-b8a1-2fbd736d5f7c@linux.alibaba.com>
Date: Thu, 18 Dec 2025 15:47:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: rmap: support batched checks of the references
 for large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com>
 <cb4d7243-d8c6-4706-a254-6f5afc148910@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <cb4d7243-d8c6-4706-a254-6f5afc148910@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_234716_591661_EF3CED7B 
X-CRM114-Status: GOOD (  32.58  )
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



On 2025/12/18 00:39, Ryan Roberts wrote:
> On 11/12/2025 08:16, Baolin Wang wrote:
>> Currently, folio_referenced_one() always checks the young flag for each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
>> an optimization to clear the young flags for PTEs within a contiguous range.
>> However, this is not sufficient. We can extend this to perform batched operations
>> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
>>
>> Introduce a new API: clear_flush_young_ptes() to facilitate batched checking
>> of the young flags and flushing TLB entries, thereby improving performance
>> during large folio reclamation.
>>
>> Performance testing:
>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>> 33% performance improvement on my Arm64 32-core server (and 10%+ improvement
>> on my X86 machine). Meanwhile, the hotspot folio_check_references() dropped
>> from approximately 35% to around 5%.
>>
>> W/o patchset:
>> real	0m1.518s
>> user	0m0.000s
>> sys	0m1.518s
>>
>> W/ patchset:
>> real	0m1.018s
>> user	0m0.000s
>> sys	0m1.018s
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 11 +++++++++++
>>   include/linux/mmu_notifier.h     |  9 +++++----
>>   include/linux/pgtable.h          | 19 +++++++++++++++++++
>>   mm/rmap.c                        | 22 ++++++++++++++++++++--
>>   4 files changed, 55 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index e03034683156..a865bd8c46a3 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1869,6 +1869,17 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
>>   }
>>   
>> +#define clear_flush_young_ptes clear_flush_young_ptes
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +					unsigned long addr, pte_t *ptep,
>> +					unsigned int nr)
>> +{
>> +	if (likely(nr == 1))
>> +		return __ptep_clear_flush_young(vma, addr, ptep);
> 
> Bug: This is broken if core-mm tries to call this for nr=1 on a pte that is part
> of a contpte mapping.
> 
> The similar fastpaths are here to prevent regressing the common small folio case.

Thanks for catching this. I had considered this before, but I still 
missed it.

> I guess here the best approach is (note no leading underscores):
> 
> 	if (likely(nr == 1))
> 		return ptep_clear_flush_young(vma, addr, ptep);

However, I prefer to use pte_cont() to check it. Later, I plan to clean 
up the ptep_clear_flush_young().

	if (nr == 1 && !pte_cont(__ptep_get(ptep))
		return __ptep_clear_flush_young(vma, addr, ptep);

>> +
>> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
>> +}
>> +
>>   #define wrprotect_ptes wrprotect_ptes
>>   static __always_inline void wrprotect_ptes(struct mm_struct *mm,
>>   				unsigned long addr, pte_t *ptep, unsigned int nr)
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index d1094c2d5fb6..be594b274729 100644
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>>   	range->owner = owner;
>>   }
>>   
>> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
>> +#define ptep_clear_flush_young_notify(__vma, __address, __ptep, __nr)	\
> 
> Shouldn't we rename this macro to clear_flush_young_ptes_notify()?
> 
> And potentially:
> 
> #define ptep_clear_flush_young_notify(__vma, __address, __ptep) \
> 	clear_flush_young_ptes_notify(__vma, __address, __ptep, 1)
> 
> if there are other non-batched users remaining.

There are no other non-batched users now, so seems there is no need to 
add another redundant API.

>>   ({									\
>>   	int __young;							\
>>   	struct vm_area_struct *___vma = __vma;				\
>>   	unsigned long ___address = __address;				\
>> -	__young = ptep_clear_flush_young(___vma, ___address, __ptep);	\
>> +	unsigned int ___nr = __nr;					\
>> +	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
>>   	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
>>   						  ___address,		\
>>   						  ___address +		\
>> -							PAGE_SIZE);	\
>> +						nr * PAGE_SIZE);	\
>>   	__young;							\
>>   })
>>   > @@ -650,7 +651,7 @@ static inline void
> mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
>>   
>>   #define mmu_notifier_range_update_to_read_only(r) false
>>   
>> -#define ptep_clear_flush_young_notify ptep_clear_flush_young
>> +#define ptep_clear_flush_young_notify clear_flush_young_ptes
>>   #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
>>   #define ptep_clear_young_notify ptep_test_and_clear_young
>>   #define pmdp_clear_young_notify pmdp_test_and_clear_young
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b13b6f42be3c..c7d0fd228cb7 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -947,6 +947,25 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   }
>>   #endif
>>   
>> +#ifndef clear_flush_young_ptes
> 
> Let's have some function documentation here please.

Sure. Will do.

>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +					 unsigned long addr, pte_t *ptep,
>> +					 unsigned int nr)
>> +{
>> +	int young = 0;
>> +
>> +	for (;;) {
> 
> I know Lorenzo is pretty allergic to this style of looping :)
> 
> He's right of course, we should probably just do this the ideomatic way and not
> worry about it looking a bit different to the others.

Let me use the 'while (--nr) { }' instead.

> 
>> +		young |= ptep_clear_flush_young(vma, addr, ptep);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +	}
>> +
>> +	return young;
>> +}
>> +#endif
>> +
>>   /*
>>    * On some architectures hardware does not set page access bit when accessing
>>    * memory page, it is responsibility of software setting this bit. It brings
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index d6799afe1114..ec232165c47d 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -827,9 +827,11 @@ static bool folio_referenced_one(struct folio *folio,
>>   	struct folio_referenced_arg *pra = arg;
>>   	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>>   	int ptes = 0, referenced = 0;
>> +	unsigned int nr;
>>   
>>   	while (page_vma_mapped_walk(&pvmw)) {
>>   		address = pvmw.address;
>> +		nr = 1;
>>   
>>   		if (vma->vm_flags & VM_LOCKED) {
>>   			ptes++;
>> @@ -874,9 +876,21 @@ static bool folio_referenced_one(struct folio *folio,
>>   			if (lru_gen_look_around(&pvmw))
>>   				referenced++;
>>   		} else if (pvmw.pte) {
>> +			if (folio_test_large(folio)) {
>> +				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
>> +				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
>> +				pte_t pteval = ptep_get(pvmw.pte);
>> +
>> +				nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
>> +			}
>> +
>> +			ptes += nr;
>>   			if (ptep_clear_flush_young_notify(vma, address,
>> -						pvmw.pte))
>> +						pvmw.pte, nr))
>>   				referenced++;
>> +			/* Skip the batched PTEs */
>> +			pvmw.pte += nr - 1;
>> +			pvmw.address += (nr - 1) * PAGE_SIZE;
> 
> The -1 part is because the walker will increment by 1 I'm guessing?

Right.

> 
>>   		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>>   			if (pmdp_clear_flush_young_notify(vma, address,
>>   						pvmw.pmd))
>> @@ -886,7 +900,11 @@ static bool folio_referenced_one(struct folio *folio,
>>   			WARN_ON_ONCE(1);
>>   		}
>>   
>> -		pra->mapcount--;
>> +		pra->mapcount -= nr;
>> +		if (ptes == pvmw.nr_pages) {
>> +			page_vma_mapped_walk_done(&pvmw);
>> +			break;
> 
> What's this needed for? I'm suspicious because there wasn't an equivalent here
> before.

If we are sure that we batched the entire folio, we can just optimize 
and stop right here.

Thanks for reviewing.

