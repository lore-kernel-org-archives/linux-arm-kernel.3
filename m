Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B30FDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr/7Zmxu/ZQqvILwZW7UDw2oRwDO+gN3baqm7IZmHr4=; b=k/dM7+1LY3FUaFGJRE2iEWWARe
	3z8rbKZoxv69F7C/l2HV9tTJ0fEHmGyBy5YkVcfaMUjFtCevIxz7IlX6cSP1GXcrod+vI01bXRU3H
	9/LZ342J3LG4+/QN+OlN9GCRIW4/y5iuA0UDBNtNmBRz+JFplFViMrlFN9JcNkko0sR8mqswmWPu7
	Mq11oaQbPBJS3jSWum7XkIpybHcwyTXyvHRhLnwUz3MZ9ZW1PDRq1iY8BYVAXMMA7vunjah1HGh9c
	7RA8gQlA6j2WC+YVp0Rr/FzoQGCdtsLmHfbp70MlJwv5ZCW/YtOAARn6oEvfxyxGMD/8CdfJoU/Et
	+LIdOh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzlx-0000000CF1N-3Cnj;
	Thu, 23 Apr 2026 19:31:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzlw-0000000CF0p-104s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 19:31:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776972691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr/7Zmxu/ZQqvILwZW7UDw2oRwDO+gN3baqm7IZmHr4=;
	b=00mjlLu3y5F/trdb0l39Eob8Dc+G319oqCPepgM8gT+nKK47phL5euTHhBxYMj8bKEVhDY
	vlK5FbSIqEuMi/xwY1j97KgEMA/nIXQcUrZRl7n5mfkFDC1x//X+nrMxTNdhsokryLlo68
	bJOx4tG0MMjOg5KqS+Oju+rz85vmVO8ZTk/QDzf/hg9OWkh/6bgVdnnX0Ol9rmSs4rk/tn
	dqOvDb5cio/xPRY2IJwakZ4iq9znfqNN7XWimLLfO0/1EOjE9f+S2jQD8vPGCQPl6a0Xcy
	ydC09f/Xv68/7rBbjGZ2ZpUuwXbH62+uHAabbxhSyLEPsva3BuK6bb3NaTsJOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776972691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr/7Zmxu/ZQqvILwZW7UDw2oRwDO+gN3baqm7IZmHr4=;
	b=YwjUs7vnnAeHab+Lnj7sEh9P5XfR0rsYrN+4B+4jvo6EpPb7hHxCqRpuAV5miLnZdmLWlp
	yipHfaVmWd+QsXAg==
To: Mathias Stearn <mathias@mongodb.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-man@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
Date: Thu, 23 Apr 2026 21:31:30 +0200
Message-ID: <87a4ut1njh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_123136_423487_85284456 
X-CRM114-Status: GOOD (  28.57  )
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

On Thu, Apr 23 2026 at 12:51, Mathias Stearn wrote:
> On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>> The kernel clears rseq_cs reliably when user space was interrupted and:
>>
>>     the task was preempted
>> or
>>     the return from interrupt delivers a signal
>>
>> If the task invoked a syscall then there is absolutely no reason to do
>> either of this because syscalls from within a critical section are a
>> bug and catched when enabling rseq debugging.
>>
>> The original code did this along with unconditionally updating CPU/MMCID
>> which resulted in ~15% performance regression on a syscall heavy
>> database benchmark once glibc started to register rseq.
>
> Just to be clear TCMalloc does not need either rseq_cs to be cleared
> or cpu_id_start to be written to on syscalls because it doesn't do
> syscalls from critical sections. It will actually benefit (slightly)
> from not updating cpu_id_start on syscalls.

I know that it does not do syscalls from within critical sections, but
it relies on cpu_id_start being unconditionally updated in one way or
the other.

> It is specifically in the cases where an rseq would need to be aborted
> (preemption, signals, migration, and membarrier IPI with the rseq
> flag) that TCMalloc relies on cpu_id_start being written. It does rely
> on that write even when not inside the critical section, because it
> effectively uses that to detect if there were any would-cause-abort
> events in between two critical sections. But since it leaves the
> rseq_cs pointer non-null between critical sections, so you dont need
> to add _any_ overhead for programs that never make use of rseq after
> registration, or add any overhead to syscalls even for those who do.

Well. According to the comment in the tcmalloc code:

// Calculation of the address of the current CPU slabs region is needed for
// allocation/deallocation fast paths, but is quite expensive. Due to varia=
ble
// shift and experimental support for "virtual CPUs", the calculation invol=
ves
// several additional loads and dependent calculations. Pseudo-code for the
// address calculation is as follows:
//
//   cpu_offset =3D TcmallocSlab.virtual_cpu_id_offset_;
//   cpu =3D *(&__rseq_abi + virtual_cpu_id_offset_);
//   slabs_and_shift =3D TcmallocSlab.slabs_and_shift_;
//   shift =3D slabs_and_shift & kShiftMask;
//   shifted_cpu =3D cpu << shift;
//   slabs =3D slabs_and_shift & kSlabsMask;
//   slabs +=3D shifted_cpu;
//
// To remove this calculation from fast paths, we cache the slabs address
// for the current CPU in thread local storage. However, when a thread is
// rescheduled to another CPU, we somehow need to understand that the cached

                  ^^^^^^^^^^^

// address is not valid anymore. To achieve this, we overlap the top 4 bytes
// of the cached address with __rseq_abi.cpu_id_start. When a thread is
// rescheduled the kernel overwrites cpu_id_start with the current CPU numb=
er,
// which gives us the signal that the cached address is not valid anymore.

The kernel still as of today (the arm64 bug aside) updates the
cpu_id_start and cpu_id fields in rseq when a task is rescheduled to
another CPU.

So if the code only requires to know when it got rescheduled to another
CPU then it still should work, no?

But it does not, which makes it clear that it relies on this
undocumented behaviour of the kernel to rewrite rseq::cpu_id_start
unconditionally. I'm not yet convinced that it relies on it only when
interrupted between two subsequent critical sections. We'll see.

....

Now we come to the best part of this comment:

// Note: this makes __rseq_abi.cpu_id_start unusable for its original purpo=
se.

So any code sequence which ends up in:

   x =3D tcmalloc();
   dostuff(x)
     evaluate(rseq::cpu_id_start, rseq::cpu_id)

is doomed. This might be acceptable for Google internal usage where they
control the full stack and can prevent anyone else to utilize rseq, but
in an open ecosystem that's obviously a non-starter.

And they definitely forgot to add this to the comment:

// Never enable CONFIG_RSEQ_DEBUG in the kernel when you use tcmalloc as
// it will expose the blatant ABI abuse and therefore will kill your
// application.

If your assumption that the rewrite is only required when rseq::rseq_cs
is non NULL and user space was interrupted is correct, then the obvious
no-brainer would have been to add:

        __u64	rseq_usr_data;

to struct rseq and clear that unconditionally when rseq::rseq_cs is
cleared.

But that would have been too simple, would work independent of endianess
and not in the way of anybody else.

But I know that's incompatible with the features first, correctness
later and we own the world anyway mindset.

Just for giggles I asked Google Gemini about the implications of
tmalloc's rseq abuse. The answer is pretty clear:

   "In short, TCMalloc treats RSEQ as a private optimization rather than
    a shared system resource, which compromises the stability and
    extensibility of any application that needs RSEQ for anything other
    than memory allocation."

It's also very clear about the wilful ignorance of the tcmalloc people:

   "In summary, the developers have known for at least 6 years that the
    implementation was non-standard and conflicting with other rseq
    usage. The github issue which requested glibc compatibility was
    opened in 2022 and has been unresolved since then."

Thanks,

        tglx

