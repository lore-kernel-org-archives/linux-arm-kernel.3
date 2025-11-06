Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA053CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv6mPGh8OTRRAPa/vnnTLwXHmpQDOc+h8v1HfQuws/k=; b=waWnlg/jNUhk199fOvhn8Q9L34
	x1qT/X+KbvEhmyRLbNNX1ou3SOtYC7aFvNTlMPKLqGBdbRM8W9TnaA1AxijYipba1t8ifQcGHwvDq
	8CtjPuv2PLdFpVZLeruymYWOvhdIXCPnPVldwp4e6/k4JBRkZbwp84hXjQs7D/mQGDJi/QsRw8mcR
	my4kXIcS8cU6MwYWNuMf8rXnwGZzSpgrW/qlZHCQ09y4BI6toRe2R/Qb1i+4w68opNvqabP3u7BwZ
	w415fIoXxm03fiflz3dpNKerXZzVKaUWPGGZSILyHkUK9hWbriDEfnlryv+Q9TgJnm0wB7o+1ZcS/
	LV/EZ5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3GF-0000000Fy31-36Cl;
	Thu, 06 Nov 2025 16:54:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3GB-0000000Fy2B-2UF5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:54:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7FEB1596;
	Thu,  6 Nov 2025 08:54:46 -0800 (PST)
Received: from [10.1.30.195] (XHFQ2J9959.cambridge.arm.com [10.1.30.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E7ED3F694;
	Thu,  6 Nov 2025 08:54:51 -0800 (PST)
Message-ID: <bd10dd8a-8cdc-404e-8259-4d65ca9a650d@arm.com>
Date: Thu, 6 Nov 2025 16:54:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -v4 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
Content-Language: en-GB
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
 Huang Ying <ying.huang@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Barry Song <baohua@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20251104095516.7912-1-ying.huang@linux.alibaba.com>
 <20251104095516.7912-3-ying.huang@linux.alibaba.com>
 <2b9fa85b-54ff-415c-9163-461e28b6d660@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2b9fa85b-54ff-415c-9163-461e28b6d660@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_085455_728290_6E68C329 
X-CRM114-Status: GOOD (  26.14  )
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

On 06/11/2025 09:47, David Hildenbrand (Red Hat) wrote:
> On 04.11.25 10:55, Huang Ying wrote:
>> A multi-thread customer workload with large memory footprint uses
>> fork()/exec() to run some external programs every tens seconds.  When
>> running the workload on an arm64 server machine, it's observed that
>> quite some CPU cycles are spent in the TLB flushing functions.  While
>> running the workload on the x86_64 server machine, it's not.  This
>> causes the performance on arm64 to be much worse than that on x86_64.
>>
>> During the workload running, after fork()/exec() write-protects all
>> pages in the parent process, memory writing in the parent process
>> will cause a write protection fault.  Then the page fault handler
>> will make the PTE/PDE writable if the page can be reused, which is
>> almost always true in the workload.  On arm64, to avoid the write
>> protection fault on other CPUs, the page fault handler flushes the TLB
>> globally with TLBI broadcast after changing the PTE/PDE.  However, this
>> isn't always necessary.  Firstly, it's safe to leave some stale
>> read-only TLB entries as long as they will be flushed finally.
>> Secondly, it's quite possible that the original read-only PTE/PDEs
>> aren't cached in remote TLB at all if the memory footprint is large.
>> In fact, on x86_64, the page fault handler doesn't flush the remote
>> TLB in this situation, which benefits the performance a lot.
>>
>> To improve the performance on arm64, make the write protection fault
>> handler flush the TLB locally instead of globally via TLBI broadcast
>> after making the PTE/PDE writable.  If there are stale read-only TLB
>> entries in the remote CPUs, the page fault handler on these CPUs will
>> regard the page fault as spurious and flush the stale TLB entries.
>>
>> To test the patchset, make the usemem.c from
>> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-
>> scalability.git).
>> support calling fork()/exec() periodically.  To mimic the behavior of
>> the customer workload, run usemem with 4 threads, access 100GB memory,
>> and call fork()/exec() every 40 seconds.  Test results show that with
>> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
>> flush functions reduces from ~50.5% to ~0.3% in perf profile.
>>
> 
> All makes sense to me.
> 
> Some smaller comments below.
> 
> [...]
> 
>> +
>> +static inline void local_flush_tlb_page_nonotify(
>> +    struct vm_area_struct *vma, unsigned long uaddr)
> 
> NIT: "struct vm_area_struct *vma" fits onto the previous line.
> 
>> +{
>> +    __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +    dsb(nsh);
>> +}
>> +
>> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>> +                    unsigned long uaddr)
>> +{
>> +    __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +    mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
>> +                        (uaddr & PAGE_MASK) + PAGE_SIZE);
>> +    dsb(nsh);
>> +}
>> +
>>   static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>>                          unsigned long uaddr)
>>   {
>> @@ -472,6 +512,22 @@ static inline void __flush_tlb_range(struct
>> vm_area_struct *vma,
>>       dsb(ish);
>>   }
>>   +static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
>> +                       unsigned long addr)
>> +{
>> +    unsigned long asid;
>> +
>> +    addr = round_down(addr, CONT_PTE_SIZE);
>> +
>> +    dsb(nshst);
>> +    asid = ASID(vma->vm_mm);
>> +    __flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
>> +                 3, true, lpa2_is_enabled());
>> +    mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
>> +                            addr + CONT_PTE_SIZE);
>> +    dsb(nsh);
>> +}
>> +
>>   static inline void flush_tlb_range(struct vm_area_struct *vma,
>>                      unsigned long start, unsigned long end)
>>   {
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index c0557945939c..589bcf878938 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -622,8 +622,7 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>>               __ptep_set_access_flags(vma, addr, ptep, entry, 0);
>>             if (dirty)
>> -            __flush_tlb_range(vma, start_addr, addr,
>> -                            PAGE_SIZE, true, 3);
>> +            local_flush_tlb_contpte(vma, start_addr);
> 
> In this case, we now flush a bigger range than we used to, no?

I don't believe so, no; we are still flushing the same contpte region (i.e. 64K
for 4K base page config).

> 
> Probably I am missing something (should this change be explained in more detail
> in the cover letter), but I'm wondering why this contpte handling wasn't
> required before on this level.

The previous __flush_tlb_range() API was flushing the same region. But that API
broadcasts. We decided not to just create a local version of that API because it
is more complex than it needs to be for this use case.

The whole (arm64-private) TLB flush interface is creeking and needs some
refactoring, which I'm planning to do as a follow up to this.

Thanks,
Ryan

> 
>>       } else {
>>           __contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>>           __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index d816ff44faff..22f54f5afe3f 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -235,7 +235,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>>         /* Invalidate a stale read-only entry */
> 
> I would expand this comment to also explain how remote TLBs are handled very
> briefly -> flush_tlb_fix_spurious_fault().
> 
>>       if (dirty)
>> -        flush_tlb_page(vma, address);
>> +        local_flush_tlb_page(vma, address);
>>       return 1;
>>   }
>>   
> 


