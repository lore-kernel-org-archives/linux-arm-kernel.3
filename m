Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E015C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoMPGPhanshZGMamuGL4DVdSxWIT3Ea9rLxIl5VFb0c=; b=qA+8pdNbH1VEcycm7qoTxSk0yA
	Gw4h6x2l8U9L2fo8FncetWJRhXFjeLY4hgYTvTEaoFUMjI1eEB3kIRG7x3+tKqUKmBUlQCKnONYHA
	pg1coXkx2wYLaMDPVWm4T4Qa+kLrQN8ZVsavCDZIlL7rnZxNs0QV1D1e3xr6bCy+0xxAZ9hIoRsk+
	a4CYoF9Js+JEOieSjjgUPFfad+0dD5m7JxnxWnO1SiBCedMgul30tRGmET8QkTaIQXQEVPrhNtEQB
	EExAD7FXOC+/ndaPzw0XGrGdqqcdMWQY5ZGNzJYjAoYuiQ8Ru4GaZxzksXomO2MF6XUHBnZkb/tZ0
	5Zmu/01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaZL-0000000410D-3sQh;
	Mon, 09 Jun 2025 11:21:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaFy-00000003yL0-0q1G;
	Mon, 09 Jun 2025 11:01:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02C2150C;
	Mon,  9 Jun 2025 04:01:13 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C82543F59E;
	Mon,  9 Jun 2025 04:01:29 -0700 (PDT)
Message-ID: <b86971db-c326-46df-9553-d89cf5609a75@arm.com>
Date: Mon, 9 Jun 2025 12:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250609103132.447370-1-ryan.roberts@arm.com>
 <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_040134_339989_BF52AD4E 
X-CRM114-Status: GOOD (  26.29  )
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

On 09/06/2025 11:45, Lorenzo Stoakes wrote:
> On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
>> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
>> TLB entry remains valid"), all arches that use tlbbatch for reclaim
>> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
>> flush_tlb_mm().
>>
>> So let's simplify by removing the unnecessary abstraction and doing the
>> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
>> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
>> arch_flush_tlb_batched_pending()").
>>
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Thanks, love to see an arch_*() helper go :)
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

> 
> Couple points below.
> 
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 11 -----------
>>  arch/riscv/include/asm/tlbflush.h |  1 -
>>  arch/riscv/mm/tlbflush.c          |  5 -----
>>  arch/x86/include/asm/tlbflush.h   |  5 -----
>>  mm/rmap.c                         |  2 +-
>>  5 files changed, 1 insertion(+), 23 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index aa9efee17277..18a5dc0c9a54 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -322,17 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>  	return true;
>>  }
>>
>> -/*
>> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
>> - * all the previously issued TLBIs targeting mm have completed. But since we
>> - * can be executing on a remote CPU, a DSB cannot guarantee this like it can
>> - * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>> - */
> 
> Hm are we losing information here? I guess it's hard to know whewre to put
> this though.

The generic version of this comment exists above flush_tlb_batched_pending() in
rmap.c.

For the arm64-specific description of why we need to flush the whole mm, that's
captured in Commit 4b634918384c ("arm64/mm: Close theoretical race where stale
TLB entry remains valid"), although I accept that may not be the first place
someone looks.

I don't think we should be defining arch_ helpers just to provide a hook for
some arch-specific comments though.

> 
>> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  /*
>>   * To support TLB batched flush for multiple pages unmapping, we only send
>>   * the TLBI for each page in arch_tlbbatch_add_pending() and wait for the
>> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
>> index 1a20dd746a49..eed0abc40514 100644
>> --- a/arch/riscv/include/asm/tlbflush.h
>> +++ b/arch/riscv/include/asm/tlbflush.h
>> @@ -63,7 +63,6 @@ void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>  bool arch_tlbbatch_should_defer(struct mm_struct *mm);
>>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>>  		struct mm_struct *mm, unsigned long start, unsigned long end);
>> -void arch_flush_tlb_batched_pending(struct mm_struct *mm);
>>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>>
>>  extern unsigned long tlb_flush_all_threshold;
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index e737ba7949b1..8404530ec00f 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -234,11 +234,6 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
>>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
>>  }
>>
>> -void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>>  {
>>  	__flush_tlb_range(NULL, &batch->cpumask,
>> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
>> index e9b81876ebe4..00daedfefc1b 100644
>> --- a/arch/x86/include/asm/tlbflush.h
>> +++ b/arch/x86/include/asm/tlbflush.h
>> @@ -356,11 +356,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>>  }
>>
>> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>> -{
>> -	flush_tlb_mm(mm);
>> -}
>> -
>>  extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
>>
>>  static inline bool pte_flags_need_flush(unsigned long oldflags,
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..fd160ddaa980 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -746,7 +746,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>>  	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
>>
>>  	if (pending != flushed) {
>> -		arch_flush_tlb_batched_pending(mm);
>> +		flush_tlb_mm(mm);
> 
> I see that CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH is only implemented in
> riscv (if !nommu), x86, arm64, and therefore we are only going to invoke
> this for those arches which previously did the same anyway, so this is
> safe.

It's also the way it used to be done before arm64 joined the party and thought
it could optimize by just issuing a DSB. I since discoved that the DSB approach
is buggy so arm64 has now fallen back to flush_tlb_mm() so the reason for the
original introduction of arch_flush_tlb_batched_pending() has gone.

Thanks,
Ryan

> 
> Kinda wish we could avoid this ugly #ifdef #else #endif pattern here in
> mm/rmap.c but probably necessary in this case.
> 
>>  		/*
>>  		 * If the new TLB flushing is pending during flushing, leave
>>  		 * mm->tlb_flush_batched as is, to avoid losing flushing.
>> --
>> 2.43.0
>>


