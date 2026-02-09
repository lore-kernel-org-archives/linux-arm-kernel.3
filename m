Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51732E78D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iospfJfgnCbZaQYzfaA2tvvmLSeoePlQ9WvdImbWy2c=; b=qP5TdCCVRiufreepbqGpZd/A5c
	xuSOPQVTqjsprf0mfu0g5fYsUZNb33DIzEf50uqtFY4hyNmgvbpANN2vunStudfac8QUVTjfVUAhm
	XAVGPY2Qx12euGO1zxgTfmplsq65Ksh+c0WeDv/xqXUV8B2LOv11r4nP2wtPNcx2uez7bpqb5+jwi
	Qxs0QbHBHNA7tkCfRBR2cR422FYMQJZTFKi5/mhwcaClVc+kViKlsCRVQ5DACYv1RMP93Swz5bDgN
	NTyRKidYaL5Tc5glwrAwCVfmYlh78oIwVsGjI6wcCVUwWxQ0TFG78fC3jKLEuG/08wApSYqdoVrRj
	Nzw7P5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNWa-0000000F87D-2dEd;
	Mon, 09 Feb 2026 09:25:44 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNWY-0000000F85s-09MY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770629137; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iospfJfgnCbZaQYzfaA2tvvmLSeoePlQ9WvdImbWy2c=;
	b=NRfigiPBM2qk1OBZmmymrXKTRcr7vsuETl8By9yyaWTKzbbD/mdN+CQJBREuPntaN9bL2ezE23zzBsqHVniLOpX+nBUQ8B+KxYBBQYhUB1ga+vNRL9OW2Sjtu3475rsn/MPpNE7ORztVfq6dUQq5XQEQIt9mGwN56JkIVPg4Clo=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WyqDuq3_1770629133 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 17:25:34 +0800
Message-ID: <f21ee001-91b5-4047-8e45-6e2ef320bcdf@linux.alibaba.com>
Date: Mon, 9 Feb 2026 17:25:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm: rmap: support batched checks of the references
 for large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <18b3eb9c730d16756e5d23c7be22efe2f6219911.1766631066.git.baolin.wang@linux.alibaba.com>
 <3d5cb9a4-6604-4302-a110-3d8ff91baa56@kernel.org>
 <44453a4c-50a2-4e7e-9d2a-ebf973ccf6b7@linux.alibaba.com>
 <b86bfd4e-302c-4152-8dfd-41f67515b71d@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b86bfd4e-302c-4152-8dfd-41f67515b71d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_012542_330348_C84087DC 
X-CRM114-Status: GOOD (  20.20  )
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



On 2/9/26 5:20 PM, David Hildenbrand (Arm) wrote:
> On 2/9/26 10:14, Baolin Wang wrote:
>>
>>
>> On 2/9/26 4:49 PM, David Hildenbrand (Arm) wrote:
>>> On 12/26/25 07:07, Baolin Wang wrote:
>>>> Currently, folio_referenced_one() always checks the young flag for 
>>>> each PTE
>>>> sequentially, which is inefficient for large folios. This 
>>>> inefficiency is
>>>> especially noticeable when reclaiming clean file-backed large 
>>>> folios, where
>>>> folio_referenced() is observed as a significant performance hotspot.
>>>>
>>>> Moreover, on Arm64 architecture, which supports contiguous PTEs, 
>>>> there is already
>>>> an optimization to clear the young flags for PTEs within a 
>>>> contiguous range.
>>>> However, this is not sufficient. We can extend this to perform 
>>>> batched operations
>>>> for the entire large folio (which might exceed the contiguous range: 
>>>> CONT_PTE_SIZE).
>>>>
>>>> Introduce a new API: clear_flush_young_ptes() to facilitate batched 
>>>> checking
>>>> of the young flags and flushing TLB entries, thereby improving 
>>>> performance
>>>> during large folio reclamation. And it will be overridden by the 
>>>> architecture
>>>> that implements a more efficient batch operation in the following 
>>>> patches.
>>>>
>>>> While we are at it, rename ptep_clear_flush_young_notify() to
>>>> clear_flush_young_ptes_notify() to indicate that this is a batch 
>>>> operation.
>>>>
>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>   include/linux/mmu_notifier.h |  9 +++++----
>>>>   include/linux/pgtable.h      | 31 +++++++++++++++++++++++++++++++
>>>>   mm/rmap.c                    | 31 ++++++++++++++++++++++++++++---
>>>>   3 files changed, 64 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/include/linux/mmu_notifier.h b/include/linux/ 
>>>> mmu_notifier.h
>>>> index d1094c2d5fb6..07a2bbaf86e9 100644
>>>> --- a/include/linux/mmu_notifier.h
>>>> +++ b/include/linux/mmu_notifier.h
>>>> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>>>>       range->owner = owner;
>>>>   }
>>>> -#define ptep_clear_flush_young_notify(__vma, __address, 
>>>> __ptep)        \
>>>> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, 
>>>> __nr)    \
>>>>   ({                                    \
>>>>       int __young;                            \
>>>>       struct vm_area_struct *___vma = __vma;                \
>>>>       unsigned long ___address = __address;                \
>>>> -    __young = ptep_clear_flush_young(___vma, ___address, __ptep);    \
>>>> +    unsigned int ___nr = __nr;                    \
>>>> +    __young = clear_flush_young_ptes(___vma, ___address, __ptep, 
>>>> ___nr);    \
>>>>       __young |= mmu_notifier_clear_flush_young(___vma->vm_mm,    \
>>>>                             ___address,        \
>>>>                             ___address +        \
>>>> -                            PAGE_SIZE);    \
>>>> +                          ___nr * PAGE_SIZE);    \
>>>>       __young;                            \
>>>>   })
>>>
>>> Man that's ugly, Not your fault, but can this possibly be turned into 
>>> an inline function in a follow-up patch.
>>
>> Yes, the cleanup of these macros is already in my follow-up patch set.
>>
>>>> +#ifndef clear_flush_young_ptes
>>>> +/**
>>>> + * clear_flush_young_ptes - Clear the access bit and perform a TLB 
>>>> flush for PTEs
>>>> + *                that map consecutive pages of the same folio.
>>>
>>> With clear_young_dirty_ptes() description in mind, this should 
>>> probably be "Mark PTEs that map consecutive pages of the same folio 
>>> as clean and flush the TLB" ?
>>
>> IMO, “clean” is confusing here, as it sounds like clear the dirty bit 
>> to make the folio clean.
> 
> "as old", sorry, I used the wrong part of the description.

OK.

>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>> + * @addr: Address the first page is mapped at.
>>>> + * @ptep: Page table pointer for the first entry.
>>>> + * @nr: Number of entries to clear access bit.
>>>> + *
>>>> + * May be overridden by the architecture; otherwise, implemented as 
>>>> a simple
>>>> + * loop over ptep_clear_flush_young().
>>>> + *
>>>> + * Note that PTE bits in the PTE range besides the PFN can differ. 
>>>> For example,
>>>> + * some PTEs might be write-protected.
>>>> + *
>>>> + * Context: The caller holds the page table lock.  The PTEs map 
>>>> consecutive
>>>> + * pages that belong to the same folio.  The PTEs are all in the 
>>>> same PMD.
>>>> + */
>>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +                     unsigned long addr, pte_t *ptep,
>>>> +                     unsigned int nr)
>>>
>>> Two-tab alignment on second+ line like all similar functions here.
>>
>> Sure.
>>
>>>> +{
>>>> +    int i, young = 0;
>>>> +
>>>> +    for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
>>>> +        young |= ptep_clear_flush_young(vma, addr, ptep);
>>>> +
>>>
>>> Why don't we use a similar loop we use in clear_young_dirty_ptes() or 
>>> clear_full_ptes() etc? It's not only consistent but also optimizes 
>>> out the first check for nr.
>>> for (;;) {
>>>      young |= ptep_clear_flush_young(vma, addr, ptep);
>>>      if (--nr == 0)
>>>          break;
>>>      ptep++;
>>>      addr += PAGE_SIZE;
>>> }
>>
>> We’ve discussed this loop pattern before [1], and it seems that people 
>> prefer the ‘for (;;)’ loop. Do you have a strong preference for 
>> changing it back?
> 
> Yes, to make all such helpers look consistent. Note that your version 
> was also not consistent with the other variants.
> 
> Ryans point was about avoiding two ptep_clear_flush_young() calls, which 
> the for(;;) avoids as well.

Actually my v2[1] is following the previous pattern, anyway let me 
change it back.

[1] 
https://lore.kernel.org/all/545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com/

