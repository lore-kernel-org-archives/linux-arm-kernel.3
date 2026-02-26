Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94219FD460E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 03:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/4WtA3QVEwzHgjUpBzvEPaT6QgOS9tebXTKZPMA8IU=; b=DjS1ygflx+EXCcg1CrLuoG5AoF
	zc8WYDnHtNhSHqn5cG6bCPDFFW7H/bsg926Xs3g1JUPbLjjHDHcH+3LwvvjMSom/Mz2kc1ncWW/9C
	wcDYvKcuZ5ow3xxWBVFl+MUsBzSFnaceut5k5ljs9viiala2Tr1rQBan7VYhXDMFQWoUJ2SHtmw07
	G8FNMRoleNvaYbzsRifRUsIbIhqGrl5TvRBoaCQRsbI/XP+9M7Wtbwpo9BUrkHnkUQITlgJyMVmfF
	UKQxOq3wx2OgmLxlRFCjgh88ZBN9BG1iXHK3kmpvUXl6qfRH7uA9WXACjTvDQsOn+vBU3dxErTs/g
	KlYiVGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSGd-00000005Ked-0se7;
	Thu, 26 Feb 2026 03:42:23 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSGa-00000005KeH-18Vt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 03:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772077335; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=s/4WtA3QVEwzHgjUpBzvEPaT6QgOS9tebXTKZPMA8IU=;
	b=BANf9/8O1QaUdIUDXVcCYUkIzjk/afwq0niLBfkXSmXlGNZZBvshdVAOgF/Brex5TpYmQq8ScFTbXKGvDViagnuvZ/1GTlSdYJcqZfWSbMZXjCZ3RgBNlFxzHS7U2tWmnpYJv8Il0FNL5J3sJnQAv1nli6aPzoNDmjFtTa5/YnM=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WzpnIJH_1772077332 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Feb 2026 11:42:13 +0800
Message-ID: <32c538ce-6af8-48a8-86fc-d26ee253af54@linux.alibaba.com>
Date: Thu, 26 Feb 2026 11:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm: add a batched helper to clear the young flag for
 large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
 <bfbe28e381b02452b455498e7ea82662e83a3865.1771897150.git.baolin.wang@linux.alibaba.com>
 <d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_194220_734943_BF1A82CD 
X-CRM114-Status: GOOD (  24.60  )
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



On 2/25/26 10:04 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 02:56, Baolin Wang wrote:
>> Currently, MGLRU will call ptep_clear_young_notify() to check and clear the
>> young flag for each PTE sequentially, which is inefficient for large folios
>> reclamation.
>>
>> Moreover, on Arm64 architecture, which supports contiguous PTEs, the Arm64-
>> specific ptep_test_and_clear_young() already implements an optimization to
>> clear the young flags for PTEs within a contiguous range. However, this is not
>> sufficient. Similar to the Arm64 specific clear_flush_young_ptes(), we can
>> extend this to perform batched operations for the entire large folio (which
>> might exceed the contiguous range: CONT_PTE_SIZE).
>>
>> Thus, we can introduce a new batched helper: test_and_clear_young_ptes() and
>> its wrapper clear_young_ptes_notify(), to perform batched checking of the young
>> flags for large folios, which can help improve performance during large folio
>> reclamation when MGLRU is enabled. And it will be overridden by the architecture
>> that implements a more efficient batch operation in the following patches.
>>
> 
> Maybe mention that the implementation follows the other existing functions.

Ack.

>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/pgtable.h | 36 ++++++++++++++++++++++++++++++++++++
>>   mm/internal.h           | 23 ++++++++++++++++++-----
>>   2 files changed, 54 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 776993d4567b..0bcd3be524d3 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1103,6 +1103,42 @@ static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> +#ifndef test_and_clear_young_ptes
>> +/**
>> + * test_and_clear_young_ptes - Mark PTEs that map consecutive pages of the same
>> + *			       folio as old
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries to clear access bit.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_test_and_clear_young().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>> + * some PTEs might be write-protected.
> 
> Document the return value?
> 
> Returns: whether any PTE was young.

Ack.

> 
> Or sth like that.
> 
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + */
>> +static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +					    unsigned long addr, pte_t *ptep,
>> +					    unsigned int nr)
> 
> Two tabs ...

Ack.

> 
>> +{
>> +	int young = 0;
>> +
>> +	for (;;) {
>> +		young |= ptep_test_and_clear_young(vma, addr, ptep);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +	}
>> +
>> +	return young;
> 
> BTW: can this function simply return (and use) a bool instead?
> 
> Likely we should do the same for the other functions, but that can be
> done separately.

Yes, add this to my TODO list to convert all related functions.

>>   /*
>>    * On some architectures hardware does not set page access bit when accessing
>>    * memory page, it is responsibility of software setting this bit. It brings
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 1ba175b8d4f1..1b59be99dc3f 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -1813,16 +1813,23 @@ static inline int pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
>>   	return young;
>>   }
>>   
>> -static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
>> -					  unsigned long addr, pte_t *ptep)
>> +static inline int clear_young_ptes_notify(struct vm_area_struct *vma,
>> +					  unsigned long addr, pte_t *ptep,
>> +					  unsigned int nr)
>>   {
>>   	int young;
>>   
>> -	young = ptep_test_and_clear_young(vma, addr, ptep);
>> -	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
>> +	young = test_and_clear_young_ptes(vma, addr, ptep, nr);
>> +	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + nr * PAGE_SIZE);
>>   	return young;
>>   }
>>   
>> +static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
>> +					  unsigned long addr, pte_t *ptep)
>> +{
>> +	return clear_young_ptes_notify(vma, addr, ptep, 1);
>> +}
>> +
>>   static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>>   					  unsigned long addr, pmd_t *pmdp)
>>   {
>> @@ -1837,9 +1844,15 @@ static inline int pmdp_clear_young_notify(struct vm_area_struct *vma,
>>   
>>   #define clear_flush_young_ptes_notify	clear_flush_young_ptes
>>   #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
>> -#define ptep_clear_young_notify	ptep_test_and_clear_young
>> +#define clear_young_ptes_notify	test_and_clear_young_ptes
>>   #define pmdp_clear_young_notify	pmdp_test_and_clear_young
>>   
>> +static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
>> +					  unsigned long addr, pte_t *ptep)
>> +{
>> +	return test_and_clear_young_ptes(vma, addr, ptep, 1);
>> +}
> 
> Why not outside of the ifdef a single generic
> 
> static inline int ptep_clear_young_notify(struct vm_area_struct *vma,
> 		 unsigned long addr, pte_t *ptep)
> {
> 	return clear_young_ptes_notify(vma, addr, ptep, 1);
> }

Yes, will do. And this function will be removed in the following patch.

