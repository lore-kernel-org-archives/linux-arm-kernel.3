Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7348CCED635
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUVHr7BNQI9naDGl8K0Y8PI79auV5dRfaXm8COo7VmM=; b=2MD9tNE7fSGuoDKPRWT9Pm1X9A
	Dh1/AwRZVzATk5qwRuhljoi6khrzbla06xrY0Vak1SSgkJJ66M9D8OKHC5rebeJrwTOWGoQm0KUS4
	aCYOEOOWRRWZdlyUNxTNNUscyY4mWCC+uQnfSdWM1UVCECW0HYBj/Ol7t0pXumsm2qCbQoLE5DweH
	xeuY0xCH61bZaEDzRu7YmCGVpZvzQboFuV1QQ3Q94oVyKG6mrZegR7oHNfg8H4zeaJ/3ea5FMXpYO
	GQXbbePUgATApxdob2PNW65XIOYyeCUgAM/9CJ85ApBmFcLxF9LduWexmrgOqGQKX/2KowapZ2kM3
	uJbDtpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKdZ-00000000P4W-0Be9;
	Tue, 18 Nov 2025 12:16:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKdX-00000000P2p-0Js6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:16:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F783FEC;
	Tue, 18 Nov 2025 04:16:30 -0800 (PST)
Received: from [10.1.25.191] (XHFQ2J9959.cambridge.arm.com [10.1.25.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B282B3F740;
	Tue, 18 Nov 2025 04:16:36 -0800 (PST)
Message-ID: <b71ce209-80d7-4cfa-aa77-4f6c8999a187@arm.com>
Date: Tue, 18 Nov 2025 12:16:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <202511171221.517FC4F@keescook>
 <251bcfb4-6069-40f7-be03-0a745bb8f761@arm.com> <aRxXkSx3WbgAPp_Q@J2N7QTR9R3>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aRxXkSx3WbgAPp_Q@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041643_210476_A377EA36 
X-CRM114-Status: GOOD (  36.46  )
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

On 18/11/2025 11:25, Mark Rutland wrote:
> On Tue, Nov 18, 2025 at 10:28:29AM +0000, Ryan Roberts wrote:
>> On 17/11/2025 20:27, Kees Cook wrote:
>>> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
>>>> On 17/11/2025 11:30, Ryan Roberts wrote:
>> The original rationale for a separate choose_random_kstack_offset() at the end
>> of the syscall is described as:
>>
>>  * This position in the syscall flow is done to
>>  * frustrate attacks from userspace attempting to learn the next offset:
>>  * - Maximize the timing uncertainty visible from userspace: if the
>>  *   offset is chosen at syscall entry, userspace has much more control
>>  *   over the timing between choosing offsets. "How long will we be in
>>  *   kernel mode?" tends to be more difficult to predict than "how long
>>  *   will we be in user mode?"
>>  * - Reduce the lifetime of the new offset sitting in memory during
>>  *   kernel mode execution. Exposure of "thread-local" memory content
>>  *   (e.g. current, percpu, etc) tends to be easier than arbitrary
>>  *   location memory exposure.
>>
>> I'm not totally convinced by the first argument; for arches that use the tsc,
>> sampling the tsc at syscall entry would mean that userspace can figure out the
>> random value that will be used for syscall N by sampling the tsc and adding a
>> bit just before calling syscall N. Sampling the tsc at syscall exit would mean
>> that userspace can figure out the random value that will be used for syscall N
>> by sampling the tsc and subtracting a bit just after syscall N-1 returns. I
>> don't really see any difference in protection?
>>
>> If you're trying force the kernel-sampled tsc to be a specific value, then for
>> the sample-on-exit case, userspace can just make a syscall with an invalid id as
>> it's syscall N-1 and in that case the duration between entry and exit is tiny
>> and fixed so it's still pretty simple to force the value.
> 
> FWIW, I agree. I don't think we're gaining much based on the placement
> of choose_random_kstack_offset() at the start/end of the entry/exit
> sequences.
> 
> As an aside, it looks like x86 calls choose_random_kstack_offset() for
> *any* return to userspace, including non-syscall returns (e.g. from
> IRQ), in arch_exit_to_user_mode_prepare(). There's some additional
> randomness/perturbation that'll cause, but logically it's not necessary
> to do that for *all* returns to userspace.

(as is s390)

Hmm, that's interesting; that will defeat the attack where a task is migrated
away from the cpu mid-syscall, since any future return to user space will still
stir the per-cpu pot.

So getting rid of choose_random_kstack_offset() would likely reduce security for
x86 and s390 because we would only be sampling the tsc on entry to syscalls.

But similarly, I think changing to keeping the offset per-task has potential to
reduce the security here too, because each return to user space will only mix
the current per-task value.

Perhaps this is actually an argument to keep it per-cpu.

For arm64 performance, the interrupt timing provides a somewhat-random source
that an attacker can't control or guess. So could we take a similar route; fold
in the timer value at every return to user (or even every interrupt). Then use
that with Jeremy's per-cpu prng, which is seeded by the crng only once, at
cpu-online time.

I know you don't like relying on the timer, Mark, but sampling it per interrupt
feels a bit stronger to me?

> 
>> So what do you think of this approach? :
>>
>> #define add_random_kstack_offset(rand) do {				\
>> 	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>> 				&randomize_kstack_offset)) {		\
>> 		u32 offset = raw_cpu_read(kstack_offset);		\
>> 		u8 *ptr;						\
>> 									\
>> 		offset = ror32(offset, 5) ^ (rand);			\
>> 		raw_cpu_write(kstack_offset, offset);			\
>> 		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
>> 		/* Keep allocation even after "ptr" loses scope. */	\
>> 		asm volatile("" :: "r"(ptr) : "memory");		\
>> 	}								\
>> } while (0)
>>
>> This ignores "Maximize the timing uncertainty" (but that's ok because the
>> current version doesn't really do that either), but strengthens "Reduce the
>> lifetime of the new offset sitting in memory".
> 
> Is this assuming that 'rand' can be generated in a non-preemptible
> context? If so (and this is non-preemptible), that's fine.

Yes this needs to be called with preemption disabled and yes it assumes that
rand can be generated in non-preemptible context - which is true for all arch's
rand sources today.

Although given the cost of get_random_u16() (or u8) for arm64, for the case
where it has to call into the crng, I was considering that we would first "try
get rand" before enabling preemption, and if that failed, enable preemption then
do the slow path. That would at least allow preemption for RT kernels (due to
get_random_u16()'s local_lock).

But given the above discussion about return-to-user, perhaps this is not the way
to go anyway. I suspect it makes sense to keep the entropy collection separate
from it's usage.

> 
> I'm not sure whether that was the intent, or this was ignoring the
> rescheduling problem.
> 
> If we do this per-task, then that concern disappears, and this can all
> be preemptible.
> 
> Mark.


