Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3641EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJRAzBap9vNHfo+ypgWcODkMjG3vxlLJ5T1YYDjN1CI=; b=G2de0OTvtE/ygtka4XaH3VW7gU
	M0BDO8p/MqsVLK5l9ecEALULVi8GWfBO0i4aRFZYFUhjonqby7KmaPEQd8hfCNX01ioEMgV8H5ZIT
	bt27Ri/jVOMoTJ9IFPIELqZZbZyad0W8VUwJWu3oI2Kb+vS467ONZqPEXHtpK36ggRiiwUwC5Aooq
	bCElZR8zyW5F4cLdiVpFLBylE0lDgqz8YcmnC8jqaCpFKzxu4+3nRf+pD/gNxXuVCBnfo64LeE+dZ
	YjO/7N09wvinV/zvaENX2kcZWuzPjS1fZzZ0WPatEYRfslQ1IypSaFPv/mOK8ehiviAd8/ljD/Hef
	/wctRbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5nW-00000007Yjy-0XUs;
	Mon, 02 Jun 2025 14:05:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5i5-00000007Xkx-14ew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 14:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 586DF12FC;
	Mon,  2 Jun 2025 06:59:58 -0700 (PDT)
Received: from [10.57.95.206] (unknown [10.57.95.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53AD3F59E;
	Mon,  2 Jun 2025 07:00:13 -0700 (PDT)
Message-ID: <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
Date: Mon, 2 Jun 2025 15:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <20250602120042.GB1227@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250602120042.GB1227@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_070017_393704_EC718719 
X-CRM114-Status: GOOD (  30.65  )
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

On 02/06/2025 13:00, Will Deacon wrote:
> On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
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
>> 	CPU0				CPU1
>> 	----				----
>> 					user accesses memory using RW PTE
>> 					[PTE now cached in TLB]
>> 	try_to_unmap_one()
>> 	==> ptep_get_and_clear()
>> 	==> set_tlb_ubc_flush_pending()
>> 					mprotect(addr, PROT_READ)
>> 					==> change_pte_range()
>> 					==> [ PTE non-present - no flush ]
>>
>> 					user writes using cached RW PTE
>> 	...
>>
>> 	try_to_unmap_flush()
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
>>
>> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
>> This aligns with what the other arches that implement the tlbbatch
>> feature do.
>>
>> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown during page reclamation/migration")
> 
> Barry -- it would be great if you could re-run some of the benchmarks
> from that commit with this fix applied.

Worth rerunning if possible, but I would guess that those benchmarks will still
show the similar improvement because they are measuring the cost of doing the
TLB flushing. But with the fix, there is an extra cost that those benchmarks
probably won't measure; subsequent work within the target mm will have no VAs
cached in the TLB so the miss rate will be much higher.

> 
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
>> -	dsb(ish);
>> +	flush_tlb_mm(mm);
>>  }
> 
> Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
> do this given that all the architectures selecting
> ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
> of arch_flush_tlb_batched_pending()?

Ha, yes... infact it looks like that's what it did prior to commit db6c1f6f236d
("mm/tlbbatch: introduce arch_flush_tlb_batched_pending()").

I'll do that tidy up once this fix appears in mm-unstable.

Thanks,
Ryan


> 
> Will


