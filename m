Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70954CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnE93G2u/eFvF1dAmMOvsX2Y2QbJ9+i3KIIVXjBli68=; b=qgf6rWpm6WnhvKiNQlyqL6a4xP
	qa+6L+9VpfbBl0Vr6VFPeC8s9MEJZ4ac/xEEHIDfWDEGTcvlbt3E1lDiPBecJncd9qXYV2BE/qISl
	AfVZBbp9Gm0wYYhsUmDfbvVWRhTsJYLq0sZT2CNDV4NiJyBOS6X3VXyQuaSJWup1/LIp6hmL32/ya
	ZjEs3cKBK/v9NYD/pTVByP+qYASKPsd2d1V/soHOPq4FWJNSWgjRMESrTEuLRt9x4GCLCyW2prb9A
	Q+4HL/v8QhJtPp4N0W1QSxb9z6MZ+lN/iUEvQGi4Cp0WQ8AQHsJmm5KnUqclmKFSiUIIZTu7LjSwx
	DgiuPE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9RD-0000000EVxr-3x2u;
	Mon, 15 Jun 2026 15:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9RA-0000000EVxI-1xMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 164161BF7;
	Mon, 15 Jun 2026 08:41:09 -0700 (PDT)
Received: from [10.57.93.228] (unknown [10.57.93.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6F513F915;
	Mon, 15 Jun 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781538068; bh=uKy06R4vHRTt1O6VDrEcVfBGKBLQ4AxYIbMp+c+Nsfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICc9boqQQsg9BNxwktyWXwHY9L3RM8O8jaOs5HjWJSMjo+iOf3q9ZMDPEzX8HfBtv
	 99A7U473a/OwPRiNFHwdJaUbJY0rP/CDHKbZDWSddTKhZE50gkzi64vLIlUw+VXL5R
	 wIu1YZH+71ntrv3dsfOLYSKORqgR/uzt2ekm8OAw=
Message-ID: <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
Date: Mon, 15 Jun 2026 16:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only active
 on local cpu
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Mark Rutland <mark.rutland@arm.com>,
 Huang Ying <ying.huang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ajAPnahwTe1OHQDp@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_084120_616932_529D6398 
X-CRM114-Status: GOOD (  61.46  )
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

On 15/06/2026 15:43, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
>> On 14/06/2026 12:04, Will Deacon wrote:
>>> On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
>>>> From: Ryan Roberts <ryan.roberts@arm.com>
>>>>
>>>> Testing with 7.1-rc4 :
>>>> +-----------------------+---------------------------------------------------+-------------+
>>>> | Benchmark             | Result Class                                      |  Improvement|  
>>>> +=======================+===================================================+=============+
>>>> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
>>>> +-----------------------+---------------------------------------------------+-------------+
>>>> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
>>>> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
>>>> +-----------------------+---------------------------------------------------+-------------+
>>>
>>> I think we need a much more comprehensive set of benchmarks before we can
>>> begin to consider a change like this.
>>
>> I believe that Linu ran a wider set of benchmarks and didn't find any
>> regressions. These are just the ones that show improvement (Linu, please correct
>> me and/or provide details).
> 
> I think it's important to show the ones that suffer as well... and also
> look at different configurations (e.g. preemptible settings) and different
> environments (e.g. native vs in a VM).
> 
>> Additionally Huang Ying did some testing against the RFC and reported 4.5%
>> improvement with Redis:
>>
>> https://lore.kernel.org/linux-arm-kernel/87segumv6w.fsf@DESKTOP-5N7EMDA 
> 
> To be clear: I'm not disputing that some benchmarks appear to show a small
> boost from this series. I'm just worried that's not the whole story.
> 
>>>>  arch/arm64/include/asm/mmu.h         |  12 +++
>>>>  arch/arm64/include/asm/mmu_context.h |   2 +
>>>>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
>>>>  arch/arm64/mm/context.c              |  30 ++++++-
>>>>  4 files changed, 141 insertions(+), 30 deletions(-)
>>>
>>> Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
>>> even if you can provide some more compelling numbers.
>>
>> AIUI, we don't support BTM upstream - the SMMU uses private ASIDs and implements
>> MMU notifiers to forward the TLBIs via its command queue interface.
>>
>> I was also under the impression that supporting BTM upsteam was not desired;
>> Please correct me if that's not accurate or if you're aware of plans to add
>> support. I've been (coincidentlly) looking at some other stuff that could
>> benefit from BTM but had concluded it wouldn't be an acceptable approach upstream.
>>
>> If we did ever want to add SMMU BTM support though, I think it would be simple
>> enough to add an interface to allow the SMMU to disable the optimization (i.e.
>> force active_cpu to ACTIVE_CPU_MULTIPLE)?
> 
> We used to have some initial BTM support in the SMMUv3 driver but the
> main problem was finding an upstream driver/soc that can use it properly
> and so it was ultimately removed in d38c28dbefee ("iommu/arm-smmu-v3: Put
> the SVA mmu notifier in the smmu_domain") because it was getting in the
> way of wider driver rework and we couldn't test it.
> 
> However, there *is* work to re-enable it on top of that rework (and other
> changes):
> 
>   https://lore.kernel.org/linux-iommu/20250319173202.78988-6-shameerali.kolothum.thodi@huawei.com/
> 
> although I don't know if Shameer intends to repost that...

Thanks for the pointers; That's very interesting feedback. I'll take a closer
look :)

> 
>>>> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
>>>> +{
>>>> +	unsigned int self, active;
>>>> +	bool local;
>>>> +
>>>> +	migrate_disable();
>>>> +
>>>> +	if (flags & TLBF_NOBROADCAST) {
>>>> +		dsb(nshst);
>>>> +		return true;
>>>> +	}
>>>
>>> Why does the NOBROADCAST case need migration disabled? It didn't before...
>>
>> The existing semantic for TLBF_BOBROADCAST is that it emits a local TLBI on
>> whatever CPU we happen to be executing on. It's used for lazily fixing up
>> spurious faults (i.e. hitting RO TLB entries when the PTE has been relaxed to
>> RW). So it's still functionally correct if the thread migrates CPU between
>> taking the fault and issuing the local TLBI - in the worst case it just leads to
>> another spurious fault.
>>
>> For this new case, we need to ensure we don't get migrated between reading
>> active_cpu and issuing the local TLBI, otherwise we would only issue a local
>> TLBI when a broadcast was required.
> 
> Sounds like those two users probably need separating out, then?

Ahh, I see; I'll admit I hadn't actually reviewed the new integration part. I
agree - NOBROADCAST is different to to this. This is an optimization for the
"not NOBROADCAST" case. We need to avoid disabling migration in the NOBROADCAST
case.

> 
>>>> +	self = smp_processor_id();
>>>> +
>>>> +	/*
>>>> +	 * The load of mm->context.active_cpu must not be reordered before the
>>>> +	 * store to the pgtable that necessitated this flush. This ensures that
>>>> +	 * if the value read is our cpu id, then no other cpu can have seen the
>>>> +	 * old pgtable value and therefore does not need this old value to be
>>>> +	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
>>>> +	 * needed to make the pgtable updates visible to the walker, to a
>>>> +	 * dsb(ish) by default. So speculatively load without a barrier and if
>>>> +	 * it indicates our cpu id, then upgrade the barrier and re-load.
>>>> +	 */
>>>> +	active = READ_ONCE(mm->context.active_cpu);
>>>> +	if (active == self) {
>>>> +		dsb(ish);
>>>> +		active = READ_ONCE(mm->context.active_cpu);
>>>> +	} else {
>>>> +		dsb(ishst);
>>>> +	}
>>>
>>> Why can't you just do:
>>>
>>> 	dsb(ishst);
>>> 	active = READ_ONCE(mm->context.active_cpu);
>>>
>>> ?
>>
>> Prior to this optimization, we always issued a dsb(ishst) here. Catalin
>> suggested the same simplification against the RFC. I believe Linu tried it but
>> saw regressions; Hopefully Linu can provide the details.
> 
> I don't follow...
> 
> The old code always did dsb(ishst). The proposed code here does either
> dsb(ish) or dsb(ishst). How can that possibly be faster?

Ugh, sorry - I read your suggestion as unconditionally issuing a dsb(ish).

Ignore my previous answer, and now I'll demonstrate my total lack of
understanding of barriers instead...

As the comment says, "The load of mm->context.active_cpu must not be reordered
before the store to the pgtable that necessitated this flush". I thought that a
dsb(ishst) would only provide ordering between stores. Don't we need the
dsb(ish) to prevent the load from being reordered before the store?

> 
>>>> +	local = active == self;
>>>> +	if (!local)
>>>> +		migrate_enable();
>>>> +
>>>> +	return local;
>>>> +}
>>>> +
>>>> +static inline void flush_tlb_user_post(bool local)
>>>> +{
>>>> +	if (local)
>>>> +		migrate_enable();
>>>> +}
>>>
>>> I was under the impression that disabling/enabling migration was an
>>> expensive thing to do, so I'd really want to see some more numbers to
>>> justify this (including from inside a VM) and allow us to consider the
>>> trade-offs properly. It's also not at all clear to me that it's safe
>>> from such a low-level TLB invalidation helper.
>>
>> I had assumed it wasn't very expensive, but perhaps I'm wrong. I know
>> preempt_enable() can be expensive because it has to test to see if it needs to
>> reschedule. But I assumed for disabling/enabling migration, it would just be a
>> counter and the scheduler would check that it's zero before considing moving the
>> task to another run queue. (But I have practically zero understanding of the
>> scheduler so I'll assume I'm wrong...).
> 
> I'm not an expert here either, but reading the code shows that it has
> a preempt guard along with additional book-keeping.
> 
>> Instead of disabling migration, perhaps we could re-check active_cpu after
>> issuing the local tlbi - if it's now reporting "multiple" we must have been
>> migrated and we need to upgrade to a braodcast TLBI?
> 
> That's an interesting idea, although I suppose it means the
> post-invalidation DSB needs to be ISH for the local case to check the
> active_cpu safely?

Another idea could be to use PeterZ's "kernel mode restartable sequence" thingy,
then we can detect migration and retry? There a thread briefly talking about
doing something similar to avoid disabling preemption in the this_cpu_ ops, but
not sure if it went anywhere.

> 
>>>>   *	TLB Invalidation
>>>>   *	================
>>>> @@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
>>>>  static inline void flush_tlb_mm(struct mm_struct *mm)
>>>>  {
>>>>  	unsigned long asid;
>>>> +	bool local;
>>>>  
>>>> -	dsb(ishst);
>>>> +	local = flush_tlb_user_pre(mm, TLBF_NONE);
>>>>  	asid = __TLBI_VADDR(0, ASID(mm));
>>>> -	__tlbi(aside1is, asid);
>>>> -	__tlbi_user(aside1is, asid);
>>>> -	__tlbi_sync_s1ish(mm);
>>>> +	if (local) {
>>>> +		__tlbi(aside1, asid);
>>>> +		__tlbi_user(aside1, asid);
>>>> +		dsb(nsh);
>>>> +	} else {
>>>> +		__tlbi(aside1is, asid);
>>>> +		__tlbi_user(aside1is, asid);
>>>> +		__tlbi_sync_s1ish(mm);
>>>> +	}
>>>> +	flush_tlb_user_post(local);
>>>
>>> I think you've changed this since Ryan's original patch, but why are you
>>> only calling __tlbi_sync_s1ish() for the !local case? Doesn't that break
>>> the erratum workaround when running as a VM if the vCPU is migrated?
>>
>> Hmm. So from the guest kernel's perspective, it has concluded that it only needs
>> to target the local (v)CPU. Since the errata only affect boardcast TLBIs, it
>> concludes there is no need to issue the workarounds. But since it's a VM, the HW
>> will upgrade the local TLBIs to broadcast TLBIs, but will not magically
>> re-instate the workarounds. I guess the simplest solution would be to disable
>> the optimization when either workaround is enabled.
> 
> That's what I was thinking, but Mark seems to think it's ok. I'll reply
> to him on the other part of the thread.
> 
>> Perhaps this is all getting a bit too complex for not enough benefit...
> 
> I don't think the complexity is unmanageable, but I'm not yet convinced
> that this offers any real benefit overall.

I'll talk with Linu and see if we can present a clearer view.

Thanks,
Ryan


> 
> Will


