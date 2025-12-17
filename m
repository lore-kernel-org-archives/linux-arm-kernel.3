Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98805D64083
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPdhN2PgYo+tFQS6gBLjYcRITKQ82W662MYUF3IclR8=; b=Z68SNixYzIrycD4TTjXA62/oAK
	eO7AGvapl8Jw9Q4w6TgcvgAHzg5njhJyB08HtDBaG5KAIVaktOysh0LFJTYqUhPHmZCS9SIYxzqD7
	vJDtaCWGDB/AmMkf+29zJkhMNPGLAZ3kqcWHJ+i8r7fcDxigJqM1/e4OuR/TRep9QGDB33MRqd6ZQ
	q8u7B+cU6pC6n7Sa/ZFp3Ae4/9P6H4Cdd+3S2XmMYU8lpPZDbpsJosrAk4eLAoX0YDfYdgIjy4oUi
	KI3AiWW8VKSFwaUNNWyGYXR/JFlURSABKmTv2KHYmCPFPqrgpy4obAfmKJ0Ufq/c4ykOGvv1pputm
	wGczbQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlfX-00000006H8g-16ZA;
	Wed, 17 Dec 2025 07:09:55 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVlfT-00000006H80-3PPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 07:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765955389; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BPdhN2PgYo+tFQS6gBLjYcRITKQ82W662MYUF3IclR8=;
	b=gAFOHui7OtcrIxy+0Dgs5IynSQpQ9ImYB9pnJNlsb43qkgA2s+09idgoFWANKvSxA5eGdGgB+fm9Sqkk2OvIwr4oXRpA8ToIlcqdTeeWuIbVeZnFFCZWLUxTvSBV/w8QAI1ItoOryv/hF2RNAcOHg8ERK4KvjXVp9ldJ+g4rYc4=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wv2U.eU_1765955387 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Dec 2025 15:09:48 +0800
Message-ID: <753ee7bd-8c9a-4242-a216-98defcd8280f@linux.alibaba.com>
Date: Wed, 17 Dec 2025 15:09:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: rmap: support batched checks of the references
 for large folios
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@kernel.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com>
 <52ed7e12-b32e-4a73-ba55-eed993b930b9@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <52ed7e12-b32e-4a73-ba55-eed993b930b9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_230952_166025_9162EA04 
X-CRM114-Status: GOOD (  20.60  )
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



On 2025/12/17 14:49, Dev Jain wrote:
> 
> On 11/12/25 1:46 pm, Baolin Wang wrote:
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
>>   
>> @@ -650,7 +651,7 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
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
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +					 unsigned long addr, pte_t *ptep,
>> +					 unsigned int nr)
>> +{
>> +	int young = 0;
>> +
>> +	for (;;) {
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
> 
> I may be hallucinating here but I am just trying to recall things - is this a bug in
> folio_pte_batch_flags()? A folio may not be naturally aligned in virtual space and hence
> we may cross the PTE table while batching across it, which can be fixed by taking into
> account pmd_addr_end() while computing max_nr.

IMHO, the comments for the folio_pte_batch_flags() function have already 
made clear requirements for the caller to avoid such situations:

"
* @ptep must map any page of the folio. max_nr must be at least one and
* must be limited by the caller so scanning cannot exceed a single VMA and
* a single page table.
"

Additionally, Lance recently fixed a similar issue, see commit 
ddd05742b45b ("mm/rmap: fix potential out-of-bounds page table access 
during batched unmap").

