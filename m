Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB4CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scYEqgPNqa4L0eir6n9Bw/SroXs0gLzpEzD7gxqRbLI=; b=DhjwBJ6dW+xSDU3VBFBf8MnqT/
	4ukXTkpWbIN4jYdxhUyTOXOymVpNyKf45/A0aqM9K7OI6JsiA36qzaUexoaByg+Bta96GlkvmHS5/
	ZLe7qDkgN+4Vk99lBFMG+g7AkeaOpUy6wFmA0wc8fWsMIkmwOTXM1qG60Z5gbh35j+aMZHcbLRGHW
	Dvp8nz3Z829TIDg5UeMS3+QiLPmjDUQis4yZC3SEWn8NLXN+/CNicuiea9+rL5BvmItMR/3Xg6Qaw
	eF3d+RfcAnn+GUcFMnqexOxEwI8fYS8HGFW3yxSMZymfg0Ikpke/55GjtdR3cR5qNQkJFQ8zNO3Qv
	o8rThB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Gr-0000000Gqjm-0oAr;
	Mon, 17 Nov 2025 20:56:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Gp-0000000GqjJ-0EDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:56:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C606BFEC;
	Mon, 17 Nov 2025 12:56:07 -0800 (PST)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367613F66E;
	Mon, 17 Nov 2025 12:56:13 -0800 (PST)
Message-ID: <b0c4bfc1-1070-48ae-a51a-d6a32f534022@arm.com>
Date: Mon, 17 Nov 2025 14:56:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
To: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Will Deacon <will@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_125619_208273_5390AEC9 
X-CRM114-Status: GOOD (  36.30  )
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

Hi,

On 11/17/25 5:31 AM, Ryan Roberts wrote:
> Sorry; forgot to add Mark and the lists!
> 
> 
> On 17/11/2025 11:30, Ryan Roberts wrote:
>> Hi All,
>>
>> Over the last few years we had a few complaints that syscall performance on
>> arm64 is slower than x86. Most recently, it was observed that a certain Java
>> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
>> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
>> ideas about how performance could be improved.
>>
>> But I'll get to the performance angle in a bit. First, I want to discuss some
>> bugs that I believe I have uncovered during code review...
>>
>>
>> Bug 1: We have the following pattern:
>>
>> add_random_kstack_offset()
>>    enable_interrupts_and_preemption()
>>      do_syscall()
>>    disable_interrupts_and_preemption()
>> choose_random_kstack_offset(random)
>>
>> Where add_random_kstack_offset() adds an offset to the stack that was chosen by
>> a previous call to choose_random_kstack_offset() and stored in a per-cpu
>> variable. But since preemption is enabled during the syscall, surely an attacker
>> could defeat this by arranging for the thread to be preempted or migrated while
>> executing the syscall? That way the new offset is calculated for a different CPU
>> and a subsequent syscall on the original CPU will use the original offset?
>>
>> I think we could just pass the random seed to add_random_kstack_offset() so that
>> we consume the old and buffer the new atomically? We would still buffer it
>> across syscalls to avoid the guessability issue that's documented. Then
>> choose_random_kstack_offset() could be removed. Or we could store
>> per-task_struct given it is only 32-bits?
>>
>>
>> Bug 2: add_random_kstack_offset() and choose_random_kstack_offset() both
>> document their requirement to be called with interrupts and preemption disabled.
>> They use raw_cpu_*(), which require this. But on arm64, they are called from
>> invoke_syscall(), where interrupts and preemption are _enabled_. In practice, I
>> don't think this will cause functional harm for arm64's implementations of
>> raw_cpu_*(), but means that it's possible that the wrong per-cpu structure is
>> being referred to. Perhaps there is a way for user code to exploit this to
>> defeat the purpose of the feature.
>>
>> This should be straightforward to fix; if we take the task_struct approach for
>> bug 1, then that would also fix this issue too because the requirement to be in
>> atomic context goes away. Otherwsise it can be moved earlier in the callchain,
>> before interrupts are enabled.
>>
>>
>> Then we get to the performance aspect...
>>
>> arm64 uses get_random_u16() to get 16 bits from a per-cpu entropy buffer that
>> originally came from the crng. get_random_u16() does
>> local_lock_irqsave()/local_unlock_irqrestore() inside every call (both the
>> fastpath and the slow path). It turns out that this locking/unlocking accounts
>> for 30%-50% of the total cost of kstack offset randomization. By introducing a
>> new raw_try_get_random_uX() helper that's called from a context where irqs are
>> disabled, I can eliminate that cost. (I also plan to dig into exactly why it's
>> costing so much).

IIRC it was because there is another thread filling batch of random numbers.


>>
>> Furthermore, given we are actually only using 6 bits of entropy per syscall, we
>> could instead just request a u8 instead of a u16 and only throw away 2 bits
>> instead of 10 bits. This means we drain the entropy buffer half as quickly and
>> make half as many slow calls into the crng:
>>
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | Benchmark | randomize=off | randomize=on | + no local_lock | + get_random_u8 |
>> |           |    (baseline) |              |                 |                 |
>> +===========+===============+==============+=================+=================+
>> | getpid    |          0.19 |  (R) -11.43% |      (R) -8.41% |      (R) -5.97% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | getppid   |          0.19 |  (R) -13.81% |      (R) -7.83% |      (R) -6.14% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | invalid   |          0.18 |  (R) -12.22% |      (R) -5.55% |      (R) -3.70% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>>
>> I expect we could even choose to re-buffer and save those 2 bits so we call the
>> slow path even less often.
>>
>> I believe this helps the mean latency significantly without sacrificing any
>> strength. But it doesn't reduce the tail latency because we still have to call
>> into the crng eventually.
>>
>> So here's another idea: Could we use siphash to generate some random bits? We
>> would generate the secret key at boot using the crng. Then generate a 64 bit
>> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
>> new hash). As long as the key remains secret, the hash is unpredictable.
>> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
>> that would last for 10 syscalls at 6 bits per call. So we would still have to
>> call siphash every 10 syscalls, so there would still be a tail, but from my
>> experiements, it's much less than the crng:
>>
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | Benchmark | randomize=off | randomize=on |         siphash |   Jeremy's prng |
>> |           |    (baseline) |              |                 |                 |
>> +===========+===============+==============+=================+=================+
>> | getpid    |          0.19 |  (R) -11.43% |      (R) -5.74% |      (R) -2.06% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | getppid   |          0.19 |  (R) -13.81% |      (R) -3.39% |      (R) -2.59% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>> | invalid   |          0.18 |  (R) -12.22% |      (R) -2.43% |          -1.31% |
>> +-----------+---------------+--------------+-----------------+-----------------+
>>
>> Could this give us a middle ground between strong-crng and
>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
>> secret key for a long period?

This is sorta fundamental with the (C)PRNG's. There is an estimated 
cycle (2^112 it says for prandom) and the more state you keep hidden to 
increase that value slower the generation becomes.

If your not worried about tail latency, then just use prandom per the 
patch below and xor in some data from the get_random_* into the local 
state on some interval. Say every million calls. One might argue for a 
couple bits of a counter on some interval would be enough if the tsc is 
good enough for x86, but frankly any counter must be independent from 
the core cpu clocks to have any hope of those values being 
unpredictable. Or just reseed it only on a subset of syscalls known to 
have a lot of variance, or some other per-cpu work, that at least will 
hide when its being reseeded from someone measuring the latency variance.

I guess it depends on how strong you believe the existing system is. My 
perspective is that resseding it is probably a waste of time since its 
being quantized down to 2^5 bits anyway.

>>
>>
>> Anyway, I plan to work up a series with the bugfixes and performance
>> improvements. I'll add the siphash approach as an experimental addition and get
>> some more detailed numbers for all the options. But wanted to raise it all here
>> first to get any early feedback.
>>
>>
>> [1]
>> https://lore.kernel.org/linux-arm-kernel/20240305221824.3300322-1-jeremy.linton@arm.com/
>>
>> Thanks,
>> Ryan
>>
> 


