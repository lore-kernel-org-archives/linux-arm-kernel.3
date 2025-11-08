Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D466CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5hRbEmCZAr8rZpKUXLSHNatmnQ6+I1kl4hbNoJwVz4=; b=zkh5aXeszjykHDrKpAuJdDxXZR
	Yab8pUdePsRNxdsCZMDJnwsdaW0DyWjRfvekqADHiF1ziyk27RVMf/gzsUgbcPHojrVd2caVl4QuS
	4X6/Ry45p/5+WQTGIgaZ252FvVPhINaFKSj7tNx0aw4TxY9KAdrPgYKEwYa9+1s5QjsDhCI8YiXLb
	61erFOUN5+kaIR8zVKehcl3phiz11iVjnL3GyDmkg2NnJubEL23WAtRI6dVvloIQtzFjbEoivqwq1
	Xuq4vpZoECV5Myi5lcJS/XRIx8FvFWLPTObpsTrbTz2/u65jxYf+z1qAllqvuAyLlDNaA1wt/zJi1
	H5xJwtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdFU-00000002ci2-2hLq;
	Sat, 08 Nov 2025 07:20:36 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdFR-00000002ch0-0m7s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 07:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762586425; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=w5hRbEmCZAr8rZpKUXLSHNatmnQ6+I1kl4hbNoJwVz4=;
	b=irMlCooeIbFjSXrp2p8fGXSNzg5HMMfKTN0sz9iWJE+bGItH/YKSk8oAl6mKxi7fLEoXwPyzO1fWvOXTd/yE2GZDb+vznPQbth/uxNP4ve4I7rGgwJbA2o1RJGAk0jf7GiPW0u1kY0zxD27hoqcyWmg/+Gx4wT3RJezZvvIvI8c=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wrv9onH_1762586422 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 08 Nov 2025 15:20:23 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  Ryan
 Roberts <ryan.roberts@arm.com>,  Barry Song <baohua@kernel.org>,  Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Zi Yan <ziy@nvidia.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Yang Shi <yang@os.amperecomputing.com>,  "Christoph Lameter (Ampere)"
 <cl@gentwo.org>,  Dev Jain <dev.jain@arm.com>,  Anshuman Khandual
 <anshuman.khandual@arm.com>,  Kefeng Wang <wangkefeng.wang@huawei.com>,
  Kevin Brodsky <kevin.brodsky@arm.com>,  Yin Fengwei
 <fengwei_yin@linux.alibaba.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH -v4 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
In-Reply-To: <2b9fa85b-54ff-415c-9163-461e28b6d660@gmail.com> (David
	Hildenbrand's message of "Thu, 6 Nov 2025 10:47:10 +0100")
References: <20251104095516.7912-1-ying.huang@linux.alibaba.com>
	<20251104095516.7912-3-ying.huang@linux.alibaba.com>
	<2b9fa85b-54ff-415c-9163-461e28b6d660@gmail.com>
Date: Sat, 08 Nov 2025 15:20:21 +0800
Message-ID: <87qzu97zyi.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_232033_925374_037C0137 
X-CRM114-Status: GOOD (  22.73  )
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

Hi, David,

"David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com> writes:

> On 04.11.25 10:55, Huang Ying wrote:
>> A multi-thread customer workload with large memory footprint uses
>> fork()/exec() to run some external programs every tens seconds.  When
>> running the workload on an arm64 server machine, it's observed that
>> quite some CPU cycles are spent in the TLB flushing functions.  While
>> running the workload on the x86_64 server machine, it's not.  This
>> causes the performance on arm64 to be much worse than that on x86_64.
>> During the workload running, after fork()/exec() write-protects all
>> pages in the parent process, memory writing in the parent process
>> will cause a write protection fault.  Then the page fault handler
>> will make the PTE/PDE writable if the page can be reused, which is
>> almost always true in the workload.  On arm64, to avoid the write
>> protection fault on other CPUs, the page fault handler flushes the TLB
>> globally with TLBI broadcast after changing the PTE/PDE.  However, this
>> isn't always necessary.  Firstly, it's safe to leave some stale
>> read-only TLB entries as long as they will be flushed finally.
>> Secondly, it's quite possible that the original read-only PTE/PDEs
>> aren't cached in remote TLB at all if the memory footprint is large.
>> In fact, on x86_64, the page fault handler doesn't flush the remote
>> TLB in this situation, which benefits the performance a lot.
>> To improve the performance on arm64, make the write protection fault
>> handler flush the TLB locally instead of globally via TLBI broadcast
>> after making the PTE/PDE writable.  If there are stale read-only TLB
>> entries in the remote CPUs, the page fault handler on these CPUs will
>> regard the page fault as spurious and flush the stale TLB entries.
>> To test the patchset, make the usemem.c from
>> vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git).
>> support calling fork()/exec() periodically.  To mimic the behavior of
>> the customer workload, run usemem with 4 threads, access 100GB memory,
>> and call fork()/exec() every 40 seconds.  Test results show that with
>> the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
>> flush functions reduces from ~50.5% to ~0.3% in perf profile.
>> 
>
> All makes sense to me.
>
> Some smaller comments below.

Thanks!

> [...]
>
>> +
>> +static inline void local_flush_tlb_page_nonotify(
>> +	struct vm_area_struct *vma, unsigned long uaddr)
>
> NIT: "struct vm_area_struct *vma" fits onto the previous line.

Sure.

>> +{
>> +	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +	dsb(nsh);
>> +}
>> +
>> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
>> +					unsigned long uaddr)
>> +{
>> +	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
>> +	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
>> +						(uaddr & PAGE_MASK) + PAGE_SIZE);
>> +	dsb(nsh);
>> +}
>> +
>>   static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>>   					   unsigned long uaddr)
>>   {
>> @@ -472,6 +512,22 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>>   	dsb(ish);
>>   }
>>   +static inline void local_flush_tlb_contpte(struct vm_area_struct
>> *vma,
>> +					   unsigned long addr)
>> +{
>> +	unsigned long asid;
>> +
>> +	addr = round_down(addr, CONT_PTE_SIZE);
>> +
>> +	dsb(nshst);
>> +	asid = ASID(vma->vm_mm);
>> +	__flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
>> +			     3, true, lpa2_is_enabled());
>> +	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
>> +						    addr + CONT_PTE_SIZE);
>> +	dsb(nsh);
>> +}
>> +
>>   static inline void flush_tlb_range(struct vm_area_struct *vma,
>>   				   unsigned long start, unsigned long end)
>>   {
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index c0557945939c..589bcf878938 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -622,8 +622,7 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>>   			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>>     		if (dirty)
>> -			__flush_tlb_range(vma, start_addr, addr,
>> -							PAGE_SIZE, true, 3);
>> +			local_flush_tlb_contpte(vma, start_addr);
>
> In this case, we now flush a bigger range than we used to, no?
>
> Probably I am missing something (should this change be explained in
> more detail in the cover letter), but I'm wondering why this contpte
> handling wasn't required before on this level.

As Ryan explained in his replay email.  The flush range doesn't change
here.  We just replace global TLB flush with local TLB flush.

>>   	} else {
>>   		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>>   		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index d816ff44faff..22f54f5afe3f 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -235,7 +235,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>>     	/* Invalidate a stale read-only entry */
>
> I would expand this comment to also explain how remote TLBs are
> handled very briefly -> flush_tlb_fix_spurious_fault().

Sure.

>>   	if (dirty)
>> -		flush_tlb_page(vma, address);
>> +		local_flush_tlb_page(vma, address);
>>   	return 1;
>>   }
>>   

---
Best Regards,
Huang, Ying

