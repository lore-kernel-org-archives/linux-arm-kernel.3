Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377E4C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uF502t7bopi+ifJXTVFE3KSkeICu9xtOi/Hy3LSWC0=; b=bcEHV3XgimwUlUY8ceJTxb7uvV
	VcMF6iD20EyTXyOWoAZ59oXyVxPY+aA7KAqlCL9zW5h4DLF0OaTN36zh9M5sJ87M3LmzMMOkI6ccX
	WZgRuYESl1CT5z9Ve1eRP9PHwz+e5kogLpXlGzNaBeHKSkipT2Cddb/+8AY/48kXJ+w4N5t+gC7c8
	hC4Uhvu3QtlHVO94gCsnJm31ky7BT7u9S4QftfualThcuNfV5rEFPC+WApXu/0PiRRD4+p0v9fs8Q
	Gvd3EO2WDXDvRUPV10ODXBrwzPQDSpvbdmp5ZO+svNVLiPRrzrsGEpOFi4lTzWgpxhXAuWJoId+qS
	QXmEfk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVnP-00000004KNt-3aYX;
	Tue, 01 Jul 2025 07:52:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVUv-00000004HTq-0LvV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 07:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2uF502t7bopi+ifJXTVFE3KSkeICu9xtOi/Hy3LSWC0=; b=T40vo9FbBKXCJf4VLcKdBN4T33
	/kMfKXup6UqhMM1qnp1+VtuVm5P8xYBvPBkxAVWLcmAwhMgEh+rSSAXstEoG7eEioCLvUkIBlqu9n
	uE8lTaQ1rCtSQbNzAof/WJ86MjfReuzNYCbChBof43OR2yxmIOcOEN0i8DUmg57yd9oEAf6OYPFLq
	F5NKAFAHaEJKrN9aliZE3L1aFrCSmxbudCfF7FJzn677sZZ3j4fZHNU8c+Xm7PRNiOrotgLJgtR5J
	DoWO1VSzbEu1n+XS7YaxTjIW+u3iRaqURl3W3z/cwzHPYjx6E4IpFrIBMMHJA+a5OnyvTj3IM+YGx
	q5QTopZg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVUr-00000006xMG-203f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 07:33:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359941595;
	Tue,  1 Jul 2025 00:33:23 -0700 (PDT)
Received: from [10.57.84.129] (unknown [10.57.84.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 606453F6A8;
	Tue,  1 Jul 2025 00:33:34 -0700 (PDT)
Message-ID: <23a213b8-280a-4544-a210-7c18a0caf8a9@arm.com>
Date: Tue, 1 Jul 2025 08:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
 <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083341_950356_0D722035 
X-CRM114-Status: GOOD (  25.54  )
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

On 01/07/2025 05:44, Dev Jain wrote:
> 
> On 30/06/25 6:27 pm, Lorenzo Stoakes wrote:
>> On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>> Architecture can override these helpers; in case not, they are implemented
>>> as a simple loop over the corresponding single pte helpers.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> Looks generally sensible! Some comments below.
>>
>>> ---
>>>   include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>>>   mm/mprotect.c           |  4 +-
>>>   2 files changed, 84 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index cf1515c163e2..662f39e7475a 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct
>>> vm_area_struct *vma,
>>>
>>>   /*
>>>    * Commit an update to a pte, leaving any hardware-controlled bits in
>>> - * the PTE unmodified.
>>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
>>>    */
>>>   static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>>                          unsigned long addr,
>>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct
>>> vm_area_struct *vma,
>>>       __ptep_modify_prot_commit(vma, addr, ptep, pte);
>>>   }
>>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>>> +
>>> +/**
>>> + * modify_prot_start_ptes - Start a pte protection read-modify-write
>>> transaction
>>> + * over a batch of ptes, which protects against asynchronous hardware
>>> + * modifications to the ptes. The intention is not to prevent the hardware from
>>> + * making pte updates, but to prevent any updates it may make from being lost.
>>> + * Please see the comment above ptep_modify_prot_start() for full description.
>>> + *
>>> + * @vma: The virtual memory area the pages are mapped into.
>>> + * @addr: Address the first page is mapped at.
>>> + * @ptep: Page table pointer for the first entry.
>>> + * @nr: Number of entries.
>>> + *
>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
>>> + * in the batch.
>>> + *
>>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
>>> + *
>>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
>>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
>>> + * mprotect_folio_pte_batch()).
>>> + */
>>> +#ifndef modify_prot_start_ptes
>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>> +        unsigned long addr, pte_t *ptep, unsigned int nr)
>>> +{
>>> +    pte_t pte, tmp_pte;
>>> +
>>> +    pte = ptep_modify_prot_start(vma, addr, ptep);
>>> +    while (--nr) {
>>> +        ptep++;
>>> +        addr += PAGE_SIZE;
>>> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>> +        if (pte_dirty(tmp_pte))
>>> +            pte = pte_mkdirty(pte);
>>> +        if (pte_young(tmp_pte))
>>> +            pte = pte_mkyoung(pte);
>>> +    }
>>> +    return pte;
>>> +}
>>> +#endif
>>> +
>>> +/**
>>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>>> + * hardware-controlled bits in the PTE unmodified.
>>> + *
>>> + * @vma: The virtual memory area the pages are mapped into.
>>> + * @addr: Address the first page is mapped at.
>>> + * @ptep: Page table pointer for the first entry.
>>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
>>> + * @pte: New page table entry to be set.
>>> + * @nr: Number of entries.
>>> + *
>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>> + * loop over ptep_modify_prot_commit().
>>> + *
>>> + * Context: The caller holds the page table lock. The PTEs are all in the same
>>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
>>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
>>> + * a/d bits on which were off in old_pte.
>>> + */
>>> +#ifndef modify_prot_commit_ptes
>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma,
>>> unsigned long addr,
>>> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < nr; ++i) {
>>> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>> +        ptep++;
>> Weird place to put this increment, maybe just stick it in the for loop.
>>
>>> +        addr += PAGE_SIZE;
>> Same comment here.
> 
> Sure.
> 
>>
>>> +        old_pte = pte_next_pfn(old_pte);
>> Could be:
>>
>>         old_pte = pte;
>>
>> No?
> 
> We will need to update old_pte also since that
> is used by powerpc in radix__ptep_modify_prot_commit().

I think perhaps Lorenzo has the model in his head where old_pte is the previous
pte in the batch. That's not the case. old_pte is the value of the pte in the
current position of the batch before any changes were made. pte is the new value
for the pte. So we need to expliticly advance the PFN in both old_pte and pte
each iteration round the loop.

> 
>>
>>> +        pte = pte_next_pfn(pte);
>>> +    }
>>> +}
>>> +#endif
>>> +
>>>   #endif /* CONFIG_MMU */
>>>
>>>   /*
>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>> index af10a7fbe6b8..627b0d67cc4a 100644
>>> --- a/mm/mprotect.c
>>> +++ b/mm/mprotect.c
>>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                       continue;
>>>               }
>>>
>>> -            oldpte = ptep_modify_prot_start(vma, addr, pte);
>>> +            oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>               ptent = pte_modify(oldpte, newprot);
>>>
>>>               if (uffd_wp)
>>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>                   can_change_pte_writable(vma, addr, ptent))
>>>                   ptent = pte_mkwrite(ptent, vma);
>>>
>>> -            ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>>> +            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>               if (pte_needs_flush(oldpte, ptent))
>>>                   tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>               pages++;
>>> -- 
>>> 2.30.2
>>>


