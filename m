Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D567CED26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FyeTG/0vdTOsiNezF6ATOWOJ13gy3l5wKEN/zumUWo=; b=VSxfJFy1IjhRoq333Hy8oDBkx7
	scayWEsrhz+lJbCSCxcABN5sq5/MKn8EGe/d4jhe1w7ZxQrR3n6VmDCGMRdkz9JYrfNKo4UDCLBgA
	4D2/DS5Y1XNN8e1hYqdjNC/VbmfpQRm7TF5vn/+eg9hvuyFhZpz1NQI5byouw/rpKMhazSqoqmoS3
	/ttJpGXMGh695K+RCV2XwJfVCNxo9tfYkJWIhYINndtKNWONkABR4wY6X/L8bTKpEx1sstBTOW9OC
	M6CqUWZaSZMKcB26XAUnhk/dfTpRIEHWa7qWjx6cW/6PCvV8lAu1Ywq/IpZV/lSu1MdjrRQ2f9dJo
	XNZCPBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIwv-00000000FCh-0UX2;
	Tue, 18 Nov 2025 10:28:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIws-00000000FCI-097h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:28:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB7B6FEC;
	Tue, 18 Nov 2025 02:28:24 -0800 (PST)
Received: from [10.1.25.191] (XHFQ2J9959.cambridge.arm.com [10.1.25.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 222573F740;
	Tue, 18 Nov 2025 02:28:30 -0800 (PST)
Message-ID: <251bcfb4-6069-40f7-be03-0a745bb8f761@arm.com>
Date: Tue, 18 Nov 2025 10:28:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Language: en-GB
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <202511171221.517FC4F@keescook>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202511171221.517FC4F@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_022834_195027_AF3A2892 
X-CRM114-Status: GOOD (  48.14  )
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

On 17/11/2025 20:27, Kees Cook wrote:
> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
>> Sorry; forgot to add Mark and the lists!
>>
>>
>> On 17/11/2025 11:30, Ryan Roberts wrote:
>>> Hi All,
>>>
>>> Over the last few years we had a few complaints that syscall performance on
>>> arm64 is slower than x86. Most recently, it was observed that a certain Java
>>> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
>>> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
>>> ideas about how performance could be improved.
>>>
>>> But I'll get to the performance angle in a bit. First, I want to discuss some
>>> bugs that I believe I have uncovered during code review...
>>>
>>>
>>> Bug 1: We have the following pattern:
>>>
>>> add_random_kstack_offset()
>>>   enable_interrupts_and_preemption()
>>>     do_syscall()
>>>   disable_interrupts_and_preemption()
>>> choose_random_kstack_offset(random)
>>>
>>> Where add_random_kstack_offset() adds an offset to the stack that was chosen by
>>> a previous call to choose_random_kstack_offset() and stored in a per-cpu
>>> variable. But since preemption is enabled during the syscall, surely an attacker
>>> could defeat this by arranging for the thread to be preempted or migrated while
>>> executing the syscall? That way the new offset is calculated for a different CPU
>>> and a subsequent syscall on the original CPU will use the original offset?
> 
> Oh, interesting -- I hadn't considered that the entire thread would be
> moved between CPUs while it is *IN* the syscall. Yeah, that would
> effectively cause the offset to never change for the moved-from CPU. Ew.
> 
>>> I think we could just pass the random seed to add_random_kstack_offset() so that
>>> we consume the old and buffer the new atomically? We would still buffer it
>>> across syscalls to avoid the guessability issue that's documented. Then
>>> choose_random_kstack_offset() could be removed. Or we could store
>>> per-task_struct given it is only 32-bits?
> 
> I had wanted to avoid both growing task_struct and to avoid tying the
> randomness to a given task -- then unpredictability could be higher
> (barring the bug above), and could be only reduced to per-thread by
> pinning a thread exclusively to a single CPU.

OK, so if we want to keep it per-cpu and close this gap, there are 2 options I
can think of; either get rid of choose_random_kstack_offset() and just pass the
random value to add_random_kstack_offset(), or have a hook in the context switch
path for the case where the thread gets preempted while in the syscall.

Personally I think the first option is sufficient and much simpler.

The original rationale for a separate choose_random_kstack_offset() at the end
of the syscall is described as:

 * This position in the syscall flow is done to
 * frustrate attacks from userspace attempting to learn the next offset:
 * - Maximize the timing uncertainty visible from userspace: if the
 *   offset is chosen at syscall entry, userspace has much more control
 *   over the timing between choosing offsets. "How long will we be in
 *   kernel mode?" tends to be more difficult to predict than "how long
 *   will we be in user mode?"
 * - Reduce the lifetime of the new offset sitting in memory during
 *   kernel mode execution. Exposure of "thread-local" memory content
 *   (e.g. current, percpu, etc) tends to be easier than arbitrary
 *   location memory exposure.

I'm not totally convinced by the first argument; for arches that use the tsc,
sampling the tsc at syscall entry would mean that userspace can figure out the
random value that will be used for syscall N by sampling the tsc and adding a
bit just before calling syscall N. Sampling the tsc at syscall exit would mean
that userspace can figure out the random value that will be used for syscall N
by sampling the tsc and subtracting a bit just after syscall N-1 returns. I
don't really see any difference in protection?

If you're trying force the kernel-sampled tsc to be a specific value, then for
the sample-on-exit case, userspace can just make a syscall with an invalid id as
it's syscall N-1 and in that case the duration between entry and exit is tiny
and fixed so it's still pretty simple to force the value.

So what do you think of this approach? :

#define add_random_kstack_offset(rand) do {				\
	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
				&randomize_kstack_offset)) {		\
		u32 offset = raw_cpu_read(kstack_offset);		\
		u8 *ptr;						\
									\
		offset = ror32(offset, 5) ^ (rand);			\
		raw_cpu_write(kstack_offset, offset);			\
		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
		/* Keep allocation even after "ptr" loses scope. */	\
		asm volatile("" :: "r"(ptr) : "memory");		\
	}								\
} while (0)

This ignores "Maximize the timing uncertainty" (but that's ok because the
current version doesn't really do that either), but strengthens "Reduce the
lifetime of the new offset sitting in memory".

> 
>>> Bug 2: add_random_kstack_offset() and choose_random_kstack_offset() both
>>> document their requirement to be called with interrupts and preemption disabled.
>>> They use raw_cpu_*(), which require this. But on arm64, they are called from
>>> invoke_syscall(), where interrupts and preemption are _enabled_. In practice, I
>>> don't think this will cause functional harm for arm64's implementations of
>>> raw_cpu_*(), but means that it's possible that the wrong per-cpu structure is
>>> being referred to. Perhaps there is a way for user code to exploit this to
>>> defeat the purpose of the feature.
>>>
>>> This should be straightforward to fix; if we take the task_struct approach for
>>> bug 1, then that would also fix this issue too because the requirement to be in
>>> atomic context goes away. Otherwsise it can be moved earlier in the callchain,
>>> before interrupts are enabled.
> 
> I can't speak to these internals, just that I'd hope to avoid forcing
> the randomness down to the thread-level.

ACK.

> 
>>>
>>>
>>> Then we get to the performance aspect...
>>>
>>> arm64 uses get_random_u16() to get 16 bits from a per-cpu entropy buffer that
>>> originally came from the crng. get_random_u16() does
>>> local_lock_irqsave()/local_unlock_irqrestore() inside every call (both the
>>> fastpath and the slow path). It turns out that this locking/unlocking accounts
>>> for 30%-50% of the total cost of kstack offset randomization. By introducing a
>>> new raw_try_get_random_uX() helper that's called from a context where irqs are
>>> disabled, I can eliminate that cost. (I also plan to dig into exactly why it's
>>> costing so much).
>>>
>>> Furthermore, given we are actually only using 6 bits of entropy per syscall, we
>>> could instead just request a u8 instead of a u16 and only throw away 2 bits
>>> instead of 10 bits. This means we drain the entropy buffer half as quickly and
>>> make half as many slow calls into the crng:
>>>
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | Benchmark | randomize=off | randomize=on | + no local_lock | + get_random_u8 |
>>> |           |    (baseline) |              |                 |                 |
>>> +===========+===============+==============+=================+=================+
>>> | getpid    |          0.19 |  (R) -11.43% |      (R) -8.41% |      (R) -5.97% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | getppid   |          0.19 |  (R) -13.81% |      (R) -7.83% |      (R) -6.14% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | invalid   |          0.18 |  (R) -12.22% |      (R) -5.55% |      (R) -3.70% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>>
>>> I expect we could even choose to re-buffer and save those 2 bits so we call the
>>> slow path even less often.
>>>
>>> I believe this helps the mean latency significantly without sacrificing any
>>> strength. But it doesn't reduce the tail latency because we still have to call
>>> into the crng eventually.
>>>
>>> So here's another idea: Could we use siphash to generate some random bits? We
>>> would generate the secret key at boot using the crng. Then generate a 64 bit
>>> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
>>> new hash). As long as the key remains secret, the hash is unpredictable.
>>> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
>>> that would last for 10 syscalls at 6 bits per call. So we would still have to
>>> call siphash every 10 syscalls, so there would still be a tail, but from my
>>> experiements, it's much less than the crng:
>>>
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | Benchmark | randomize=off | randomize=on |         siphash |   Jeremy's prng |
>>> |           |    (baseline) |              |                 |                 |
>>> +===========+===============+==============+=================+=================+
>>> | getpid    |          0.19 |  (R) -11.43% |      (R) -5.74% |      (R) -2.06% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | getppid   |          0.19 |  (R) -13.81% |      (R) -3.39% |      (R) -2.59% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>> | invalid   |          0.18 |  (R) -12.22% |      (R) -2.43% |          -1.31% |
>>> +-----------+---------------+--------------+-----------------+-----------------+
>>>
>>> Could this give us a middle ground between strong-crng and
>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
>>> secret key for a long period?
> 
> All these ideas seem fine to me. I agree about only needed 6 bits, so a
> u8 is good. Since we already use siphash extensively, that also seems
> fine, though it'd be nice if we could find a solution that avoided
> intermittent reseeding.

ACK.

Thanks,
Ryan

> 
>>> Anyway, I plan to work up a series with the bugfixes and performance
>>> improvements. I'll add the siphash approach as an experimental addition and get
>>> some more detailed numbers for all the options. But wanted to raise it all here
>>> first to get any early feedback.
> 
> Thanks for tackling this!
> 
> -Kees
> 


