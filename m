Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B2C61CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyNEaUQ6S60CsL15GivIkEQCpTAc1xYJ4bKa/6t4hnw=; b=H+UqUgPBowSpg3uZCKFBDuKYkk
	HSuFuiCPz4dobqDm/PjYsdkSPk6vPjvcYXq/8fHysllb6RzHfFuQQFPVrZ05yFBkQJpIG1iRM03t1
	va0pcNvr2GtnXRpX/aWqSvt8fIfc2kcsi7omuExqlH2iOX0FwmmpYcAYAQsWbGNuSMSBhkf65yYrq
	05QlxsUU47ZyjosUiqj7vUBPUi6KuDcgRZUn0podp1L6BzR9WE9xwizRylJBZ2Kjht/vmFCeAQkme
	dDSBxd4KaT2gEtG4XqTsLVUny3j+5pCZUUfGxl+NgxWxfRCqdgaKugO1EXjAbm8xYTPEXsLxz3ejY
	2xj0LoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBU-0000000AhX1-0iIy;
	Tue, 03 Jun 2025 10:47:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOwK-0000000AgDS-3iAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 10:32:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17A801A25;
	Tue,  3 Jun 2025 03:31:57 -0700 (PDT)
Received: from [10.1.36.211] (XHFQ2J9959.cambridge.arm.com [10.1.36.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 985E03F5A1;
	Tue,  3 Jun 2025 03:32:12 -0700 (PDT)
Message-ID: <96266c85-0a17-4291-8147-867925cac7ca@arm.com>
Date: Tue, 3 Jun 2025 11:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_033217_013614_2D2D8BAB 
X-CRM114-Status: GOOD (  37.62  )
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

On 03/06/2025 10:49, Barry Song wrote:
> On Sat, May 31, 2025 at 3:24 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
>> a parallel reclaim leaving stale TLB entries") describes a race that,
>> prior to the commit, could occur between reclaim and operations such as
>> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
>> details but the summary is:
>>
>> """
>> Nadav Amit identified a theoritical race between page reclaim and
>> mprotect due to TLB flushes being batched outside of the PTL being held.
>>
>> He described the race as follows:
>>
>>         CPU0                            CPU1
>>         ----                            ----
>>                                         user accesses memory using RW PTE
>>                                         [PTE now cached in TLB]
>>         try_to_unmap_one()
>>         ==> ptep_get_and_clear()
>>         ==> set_tlb_ubc_flush_pending()
>>                                         mprotect(addr, PROT_READ)
>>                                         ==> change_pte_range()
>>                                         ==> [ PTE non-present - no flush ]
>>
>>                                         user writes using cached RW PTE
>>         ...
>>
>>         try_to_unmap_flush()
>> """
>>
>> The solution was to insert flush_tlb_batched_pending() in mprotect() and
>> friends to explcitly drain any pending reclaim TLB flushes. In the
>> modern version of this solution, arch_flush_tlb_batched_pending() is
>> called to do that synchronisation.
>>
>> arm64's tlbbatch implementation simply issues TLBIs at queue-time
>> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
>> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
>> of the batch to wait for all the issued TLBIs to complete.
>>
>> Now, the Arm ARM states:
>>
>> """
>> The completion of the TLB maintenance instruction is guaranteed only by
>> the execution of a DSB by the observer that performed the TLB
>> maintenance instruction. The execution of a DSB by a different observer
>> does not have this effect, even if the DSB is known to be executed after
>> the TLB maintenance instruction is observed by that different observer.
>> """
>>
>> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
>> requirement because they are called from the same task (either kswapd or
>> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
>> if the task was migrated, __switch_to() contains an extra dsb(ish).
>>
>> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
>> a dsb(ish). But this may be running on a CPU remote from the one that
>> issued the outstanding TLBIs. So there is no architectural gurantee of
>> synchonization. Therefore we are still vulnerable to the theoretical
>> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
>> potentially racing with a parallel reclaim leaving stale TLB entries").
> 
> Hi Ryan,
> 
> Sorry for bringing up another question late, but your explanation made me
> reconsider whether I might also be wrong in arch_tlbbatch_flush(). Specifically,
> try_to_unmap_flush() needs to ensure that all TLBI operations from other CPUs
> for all involved memory contexts have completed. However, as you pointed
> out, a DSB ISH alone cannot guarantee this.

Hmm, does try_to_unmap_flush() actually need to ensure that *all* pending TLBIs
are completed, or does it only need to ensure that the TLBIs previously issued
by the same instance of shrink_folio_list() are completed?

I understood it to be the latter and therefore thought the current
arch_tlbbatch_flush() was safe.

If another instance has concurrently queued up some TLBIs using tlbbatch (i.e.
MADV_PAGEOUT) then the first instance would never see those PTEs so I don't
think it matters that the TLB flush is still pending? Perhaps I'm wrong...

> 
> This makes me wonder if we should take inspiration from RISC-V or x86 and use a
> cpumask to track all CPUs that have pending TLBIs. Then, we could use IPIs to
> explicitly request those CPUs to issue DSB ISH, ensuring their TLB
> invalidations are fully completed.
> 
> I mean something similar to what x86 and RISC-V do, but using just a
> simpler approach like issuing DSB ISH on the relevant CPUs.
> 
> void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> {
>         on_each_cpu_mask(&batch->cpumask, __ipi_flush_tlbi, NULL, NULL);
>         cpumask_clear(&batch->cpumask);
> }
> 
> static void __ipi_flush_tlbi(void *info)
> {
>         dsb(ish);
> }

My initial instinct is yuk :). I guess we would need to do a bunch of
benchmarking if this is needed. But would be good to avoid if possible. Let's
figure out if we definitely have a race first...

Thanks,
Ryan

> 
> Sorry for the mess I made earlier.

No worries, it happens.

> 
>>
>> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
>> This aligns with what the other arches that implement the tlbbatch
>> feature do.
>>
>> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index eba1a98657f1..7d564c2a126f 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>  }
>>
>>  /*
>> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
>> - * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
>> - * flush_tlb_batched_pending().
>> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
>> + * all the previously issued TLBIs targeting mm have completed. But since we
>> + * can be executing on a remote CPU, a DSB cannot guarrantee this like it can
>> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>>   */
>>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>>  {
>> -       dsb(ish);
>> +       flush_tlb_mm(mm);
>>  }
>>
>>  /*
>> --
>> 2.43.0
>>
> 
> Thanks
> Barry


