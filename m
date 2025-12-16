Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F1D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 03:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHI8MwEkAMVbXFoi4qV2CciOuoz7wsRR0Mr9u7abYfA=; b=PnuSY62MvIYgN7CULiaZagu9o0
	RiNjgId4yuipKFHC0Eqp5VT8j0IUrHl8I/M5pYYtz4V+QzzsHuC1ZfnA08gI/a5FLVYhs+YDPYmdY
	rKaCpGRNYSDtuysjUce2sGH9opPRQlsEFS30naDb0pIdNQ8GFqMMuSJ+LaqLo54+nI0IZ4mUoPwut
	6KH91g58PY6IR/O8QmhzQYm8L1Q0T+sj3C+0jLCqUszhJxuZ97LmLXFDyu+zfalQDV0F4YxYH/ybj
	2Ao/7GDP3JZ0+Ub+ds7SqiE5BkFeYN4YGwPYMSmi0kOJrt3r94qixVCcBOy40qdETDKn5x573HDnZ
	q+0Stotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM1m-00000004e44-15M6;
	Tue, 16 Dec 2025 03:47:10 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM1j-00000004e16-24VZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 03:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765856824; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OHI8MwEkAMVbXFoi4qV2CciOuoz7wsRR0Mr9u7abYfA=;
	b=KcWUTW6K5bW5lXXybH8ecE0lGScgoPa02eNTHuaUTtnqJwSOuL7t5b6HOXk2RfnUGHMyzsCu6YDzpyQoxJ2k4mD7lV5oJ1ZwzM+YGzA1UHlNzBGtKUpscMOLO/7c7IVaVPLXfrelkX7dmwrkwOzOLzGclfJu1AWQdV7y+LCSVMo=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WuxZNce_1765856820 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Dec 2025 11:47:01 +0800
Message-ID: <7391d74f-782c-4d5a-9f9d-02afcefdbf87@linux.alibaba.com>
Date: Tue, 16 Dec 2025 11:47:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: rmap: support batched checks of the references
 for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com>
 <4413d7f4-7734-4715-a450-2ba09db5ed22@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <4413d7f4-7734-4715-a450-2ba09db5ed22@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_194708_023290_A3A40A27 
X-CRM114-Status: GOOD (  31.63  )
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



On 2025/12/15 20:22, Lorenzo Stoakes wrote:
> On Thu, Dec 11, 2025 at 04:16:55PM +0800, Baolin Wang wrote:
>> Currently, folio_referenced_one() always checks the young flag for each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
> 
> arm64 you mean :)

Right. Will make it clear.

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
> 
> That's nice!
> 
> Have you performed the same kind of performance testing on non-arm64? As in the
> past we've had a batch optimisation go horribly wrong on non-arm64 even if it
> was ok on arm64 :)

Yes, seems you missed my test results for the x86 machine in the commit 
message :)

"I can observe 33% performance improvement on my Arm64 32-core server 
(and 10%+ improvement on my X86 machine)."

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
> 
> Hmm again this is a weird way of exposing a contepte-specific function, you
> really need to rework that as discussed in patch 1/3.
> 
> It seems to me we can share code to avoid this.

Sorry I don't think so. This is the current way of exposing a contpte 
for Arm64. Please take a look at set_ptes(), clear_full_ptes(), 
wrprotect_ptes() and so on (in this file).

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
> 
> An aside, but I wonder why this needs to be a (pretty disgusting) macro?

Um, I can send a follow-up to clean up all these related macros.

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
>> +				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
>> +				pte_t pteval = ptep_get(pvmw.pte);
>> +
>> +				nr = folio_pte_batch(folio, pvmw.pte, pteval, max_nr);
> 
> I do wish we could put this fiddly logic into a helper for each place in
> which we do similar kind 'end of the PTE table, maximum number we could
> have' logic.

Um, the logic is already simple, and I don’t think adding a new helper 
would improve readability. If some code can reuse this logic, we can 
factor it out into a helper at that point.

>> +			}
> 
> NIT but we're running into pretty long lines here.

OK. Will fix this.

>> +
>> +			ptes += nr;
>>   			if (ptep_clear_flush_young_notify(vma, address,
>> -						pvmw.pte))
>> +						pvmw.pte, nr))
>>   				referenced++;
> 
> I find this referenced logic weird, it seems like it should be a boolean,
> but this is outside the scope of your patch here :)

Right. Thanks for reviewing.

