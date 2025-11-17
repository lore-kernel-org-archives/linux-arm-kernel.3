Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6F8CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TePm3CEJokoqTe4+UMG/9yHGUPk2XiN+8QFyEy90meg=; b=hqOdh8J85d3i7RuYW0ockRI4R6
	3zGcBqC+VzKnGT/WL6AeSy+0UQDiEbax7XBbfoNpQM42R7j5hCWRxE1H/JZUzYlkXYvoWfPXFc9QM
	bxKVa6tOI9qB1/ClytCZu1HxiJn1p6bNUywGKZBC17cZWj8xUTF/knGRWzekK4fi1HCUB+x9/rP94
	9GFVUgz/KU+Epqas4C2N1S4xFoERXJz0bw7vt3SgsqN+Cki2zoUD77twpsDV4unydFYjvZVMapBP6
	i0xqyX1fiRlQjfXmvxV44oJ3WL17J8SbfJGz5fArbBroJngLUutTOmcBQrx8umpjp8ZjNnBzq4Tat
	rI/CN7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5p6-0000000GpCr-0Zc9;
	Mon, 17 Nov 2025 20:27:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5p5-0000000GpCl-2KXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8897F605CE;
	Mon, 17 Nov 2025 20:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6869C2BC9E;
	Mon, 17 Nov 2025 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763411258;
	bh=Ot/GU8L/ukoo/YG9Uc4A8sGu+dt6uA8wZTjT0bfWFwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuXk5vJbdAi967WO/ASmcw+UWlxmc9kH4rb0P1rnyy03c26ZXQ/k8ZJT/d9W7UXz6
	 AK95K+I0Mh8ynss91uQULytv9AjyEwcObAb7Deumxe6Nys1QIxpJqbBlwiuOVRissV
	 R91yIkmKPTI1Y+65jUX0DmaYkDuTpbznHhiPy4dx9lUOf/sZpSA7tTx6RBjEUY3Opa
	 IakaoeWOCYMx0cSX1Xf26CMUHodL/IAdphI0RbMlfSyju36woVxeKbIoesfs/3M4rw
	 p6xE+CMPdVH5cor8fV26izFVYo8MRoLDiRQwnhcmEvbqsGY9qwYTdTNZxOjybYMSit
	 gimGcW82Ia9VQ==
Date: Mon, 17 Nov 2025 12:27:36 -0800
From: Kees Cook <kees@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <202511171221.517FC4F@keescook>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
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

On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> Sorry; forgot to add Mark and the lists!
> 
> 
> On 17/11/2025 11:30, Ryan Roberts wrote:
> > Hi All,
> > 
> > Over the last few years we had a few complaints that syscall performance on
> > arm64 is slower than x86. Most recently, it was observed that a certain Java
> > benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
> > get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
> > ideas about how performance could be improved.
> > 
> > But I'll get to the performance angle in a bit. First, I want to discuss some
> > bugs that I believe I have uncovered during code review...
> > 
> > 
> > Bug 1: We have the following pattern:
> > 
> > add_random_kstack_offset()
> >   enable_interrupts_and_preemption()
> >     do_syscall()
> >   disable_interrupts_and_preemption()
> > choose_random_kstack_offset(random)
> > 
> > Where add_random_kstack_offset() adds an offset to the stack that was chosen by
> > a previous call to choose_random_kstack_offset() and stored in a per-cpu
> > variable. But since preemption is enabled during the syscall, surely an attacker
> > could defeat this by arranging for the thread to be preempted or migrated while
> > executing the syscall? That way the new offset is calculated for a different CPU
> > and a subsequent syscall on the original CPU will use the original offset?

Oh, interesting -- I hadn't considered that the entire thread would be
moved between CPUs while it is *IN* the syscall. Yeah, that would
effectively cause the offset to never change for the moved-from CPU. Ew.

> > I think we could just pass the random seed to add_random_kstack_offset() so that
> > we consume the old and buffer the new atomically? We would still buffer it
> > across syscalls to avoid the guessability issue that's documented. Then
> > choose_random_kstack_offset() could be removed. Or we could store
> > per-task_struct given it is only 32-bits?

I had wanted to avoid both growing task_struct and to avoid tying the
randomness to a given task -- then unpredictability could be higher
(barring the bug above), and could be only reduced to per-thread by
pinning a thread exclusively to a single CPU.

> > Bug 2: add_random_kstack_offset() and choose_random_kstack_offset() both
> > document their requirement to be called with interrupts and preemption disabled.
> > They use raw_cpu_*(), which require this. But on arm64, they are called from
> > invoke_syscall(), where interrupts and preemption are _enabled_. In practice, I
> > don't think this will cause functional harm for arm64's implementations of
> > raw_cpu_*(), but means that it's possible that the wrong per-cpu structure is
> > being referred to. Perhaps there is a way for user code to exploit this to
> > defeat the purpose of the feature.
> > 
> > This should be straightforward to fix; if we take the task_struct approach for
> > bug 1, then that would also fix this issue too because the requirement to be in
> > atomic context goes away. Otherwsise it can be moved earlier in the callchain,
> > before interrupts are enabled.

I can't speak to these internals, just that I'd hope to avoid forcing
the randomness down to the thread-level.

> > 
> > 
> > Then we get to the performance aspect...
> > 
> > arm64 uses get_random_u16() to get 16 bits from a per-cpu entropy buffer that
> > originally came from the crng. get_random_u16() does
> > local_lock_irqsave()/local_unlock_irqrestore() inside every call (both the
> > fastpath and the slow path). It turns out that this locking/unlocking accounts
> > for 30%-50% of the total cost of kstack offset randomization. By introducing a
> > new raw_try_get_random_uX() helper that's called from a context where irqs are
> > disabled, I can eliminate that cost. (I also plan to dig into exactly why it's
> > costing so much).
> > 
> > Furthermore, given we are actually only using 6 bits of entropy per syscall, we
> > could instead just request a u8 instead of a u16 and only throw away 2 bits
> > instead of 10 bits. This means we drain the entropy buffer half as quickly and
> > make half as many slow calls into the crng:
> > 
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | Benchmark | randomize=off | randomize=on | + no local_lock | + get_random_u8 |
> > |           |    (baseline) |              |                 |                 |
> > +===========+===============+==============+=================+=================+
> > | getpid    |          0.19 |  (R) -11.43% |      (R) -8.41% |      (R) -5.97% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | getppid   |          0.19 |  (R) -13.81% |      (R) -7.83% |      (R) -6.14% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | invalid   |          0.18 |  (R) -12.22% |      (R) -5.55% |      (R) -3.70% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > 
> > I expect we could even choose to re-buffer and save those 2 bits so we call the
> > slow path even less often.
> > 
> > I believe this helps the mean latency significantly without sacrificing any
> > strength. But it doesn't reduce the tail latency because we still have to call
> > into the crng eventually.
> > 
> > So here's another idea: Could we use siphash to generate some random bits? We
> > would generate the secret key at boot using the crng. Then generate a 64 bit
> > siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
> > new hash). As long as the key remains secret, the hash is unpredictable.
> > (perhaps we don't even need the timer value). For every hash we get 64 bits, so
> > that would last for 10 syscalls at 6 bits per call. So we would still have to
> > call siphash every 10 syscalls, so there would still be a tail, but from my
> > experiements, it's much less than the crng:
> > 
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | Benchmark | randomize=off | randomize=on |         siphash |   Jeremy's prng |
> > |           |    (baseline) |              |                 |                 |
> > +===========+===============+==============+=================+=================+
> > | getpid    |          0.19 |  (R) -11.43% |      (R) -5.74% |      (R) -2.06% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | getppid   |          0.19 |  (R) -13.81% |      (R) -3.39% |      (R) -2.59% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > | invalid   |          0.18 |  (R) -12.22% |      (R) -2.43% |          -1.31% |
> > +-----------+---------------+--------------+-----------------+-----------------+
> > 
> > Could this give us a middle ground between strong-crng and
> > weak-timestamp-counter? Perhaps the main issue is that we need to store the
> > secret key for a long period?

All these ideas seem fine to me. I agree about only needed 6 bits, so a
u8 is good. Since we already use siphash extensively, that also seems
fine, though it'd be nice if we could find a solution that avoided
intermittent reseeding.

> > Anyway, I plan to work up a series with the bugfixes and performance
> > improvements. I'll add the siphash approach as an experimental addition and get
> > some more detailed numbers for all the options. But wanted to raise it all here
> > first to get any early feedback.

Thanks for tackling this!

-Kees

-- 
Kees Cook

