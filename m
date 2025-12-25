Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E4E776FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fy7EXMdCyEH27NzJMvO2tdqkUATW53yXrUXnni0WAs=; b=LXedxQFS3cVmIak9v+3d+tZ0ee
	Peas7UmgvHRv4IutxDnHR8cYK+ysTcMB1I7LhQzRA/gdXo3n4Og83vM8nFZLCNrj62JDTP6Quboze
	RZiW73ilFHht8YP9czmjwArSctlDH0xAhfyRijdYsgO614sycAzhCiq4lQiATTuMtp6j6p8G/5YTK
	kPxjdTjsKTwtoBPZVQp49hdOkJvyvJkCunZfo6bHFwGCv2exhCaRuh0XyXmJ/1+QxLEn6S7ITEqUX
	G7/WpOh6Q3dvfuv079PxOl/NkhFwBSghj4zAwL/Ny9GXh5G/TPJ6vnPsKq6FpoSncza66CzcWGnZv
	zZ/AynAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYZjs-0000000HXwa-1pI8;
	Thu, 25 Dec 2025 01:02:00 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYZjo-0000000HXvb-24Bg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 01:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766624511; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2fy7EXMdCyEH27NzJMvO2tdqkUATW53yXrUXnni0WAs=;
	b=O9rb/vjUa6PQXhvvRh88c1Wa13z4ve+pWa8ozdQC7pcpnom5f2/EfVdrlbfwdMiqPnV52582IITf+3MokTssAn8JfIa0+0A9Rr+Z4Po0VrqtLxvQu1qcvsWim14kVkWARzchu+ZN/dmYqduWH/mF2fv4yLcXaHzGia7ymnpU8wo=
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wvci210_1766624507 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 25 Dec 2025 09:01:48 +0800
Message-ID: <43b6ef51-c88f-4b0c-b512-c7195afdd31b@linux.alibaba.com>
Date: Thu, 25 Dec 2025 09:01:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
 <e9ff5fa689740f3b6f3ed1c1ec0e3244f20c1f06.1766455378.git.baolin.wang@linux.alibaba.com>
 <ec49f0fe-9df8-4762-b315-240cbb1ed3ce@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ec49f0fe-9df8-4762-b315-240cbb1ed3ce@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_170157_025110_B76F2FE3 
X-CRM114-Status: GOOD (  21.89  )
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

Hi Ryan,

On 2025/12/24 21:24, Ryan Roberts wrote:
> On 23/12/2025 05:48, Baolin Wang wrote:
>> Currently, folio_referenced_one() always checks the young flag for each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm64 architecture, which supports contiguous PTEs, there is already
>> an optimization to clear the young flags for PTEs within a contiguous range.
>> However, this is not sufficient. We can extend this to perform batched operations
>> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
>>
>> Introduce a new API: clear_flush_young_ptes() to facilitate batched checking
>> of the young flags and flushing TLB entries, thereby improving performance
>> during large folio reclamation. And it will be overridden by the architecture
>> that implements a more efficient batch operation in the following patches.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> With the 2 niggles below addressed:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks.

>> ---
>>   include/linux/mmu_notifier.h |  9 +++++----
>>   include/linux/pgtable.h      | 35 +++++++++++++++++++++++++++++++++++
>>   mm/rmap.c                    | 29 +++++++++++++++++++++++++++--
>>   3 files changed, 67 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index d1094c2d5fb6..dbbdcef4abf1 100644
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>>   	range->owner = owner;
>>   }
>>   
>> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
>> +#define ptep_clear_flush_young_notify(__vma, __address, __ptep, __nr)	\
> 
> I think I previously suggested that this should be renamed to
> clear_flush_young_ptes_notify() given that it is now a batch operation. Were
> others against that or did you forget?

Sorry, I missed this comment. Yes, sounds reasonable to me. Will do in 
the next version.

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
>> +						  ___nr * PAGE_SIZE);	\
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
>> index 2f0dd3a4ace1..fcf7a7820061 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1087,6 +1087,41 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   }
>>   #endif
>>   
>> +#ifndef clear_flush_young_ptes
>> +/**
>> + * clear_flush_young_ptes - Clear the access bit and perform a TLB flush for PTEs
>> + *			    that map consecutive pages of the same folio.
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries to clear access bit.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_clear_flush_young().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>> + * some PTEs might be write-protected.
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + */
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +					 unsigned long addr, pte_t *ptep,
>> +					 unsigned int nr)
>> +{
>> +	int young;
>> +
>> +	young = ptep_clear_flush_young(vma, addr, ptep);
>> +	while (--nr) {
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		young |= ptep_clear_flush_young(vma, addr, ptep);
>> +	}
> 
> I think it's better to avoid the two ptep_clear_flush_young() calls if we can.
> Personally I think we should just go for the simple:
> 
> 	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
> 		young |= ptep_clear_flush_young(vma, addr, ptep);

ACK. Thanks for reviewing.

