Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6BDFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdT5pfY3VK8rNWpNYZQMq0zeq8Lnd2Cb2TeI3hy+VDo=; b=wW8uEHwmSqKtXQe19XiMg48Rg5
	kiHN5wO/CfqIoPL2sJlrd8Sy6nuh1XP79Z694TuSLx9H7PnNiRGAaF5CV5nS3hl1xEYWwkOyCq+nL
	Yfj7S26nywicNQUioWdMOmj58X7Q3LuIZqkM+LT9E3I31lSj36Uo5ZURIJ9wLcnyrwlifD8DayW9z
	7CcNf0A2StrMyqafeD7/8YIBZ7c43AMrqi6I2KqwwnAA1a2F/O3PdWausIZjR0QiXV05vZArQOvBe
	ytHi0m6SFTrjrVtIhJ3lCIz7wVDj71QZgN71Zhqr42PIecQIfMVHRdLDAfdUtZEBw+vIknDcX05eu
	qzRsV3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbfo-00000000cDN-3xYI;
	Tue, 28 Apr 2026 06:11:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbfm-00000000cD0-0BSz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 06:11:56 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38df1889fb9so106369481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 23:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777356711; cv=none;
        d=google.com; s=arc-20240605;
        b=IZeRr7KchyF0uLJf9du51OmmI/YrKcmmp2LiMJBSfbPLL4q7F8g+KWXW0CLO74wa0j
         kI6VXgToB3+k0Or52C+VtwGGKeIRfOwjFrfd6/zadRMMsWcQIS9MewzriuEVMfCggBxv
         mIcldoGs2UAixTeVwBA1sAEcRL2sxTpc2lyaVOmi15mk23g+rTfhdyoqQqjKuIKPRguW
         3sAneObV/HP91qlWV47xkjf2OjQqETJmm97bbofx6XXBVO6DN5Jrg81oCiyMiMVQfyRL
         7z9Zkdq/AoH+ed6u4gOZRZzz9U5+0AutvUlZvlnURhk06m/9Pw2+NY4II7o82vq82KFL
         tk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pdT5pfY3VK8rNWpNYZQMq0zeq8Lnd2Cb2TeI3hy+VDo=;
        fh=ansRFDYHbmtfiUIyGn10erQ8w8InI46OS8X2YS7ewqU=;
        b=Ix3hgaNoOX7S3TRAvzjAdMFztnpxX6UVp0yhhdriWXWNjSPlBNyB8pt+KaqqXXsXOn
         aZj50ofXdrTqxa5LejYZj1M1sUJVDvMb3a6tFfizgtikVndGvHBGv6zR+EOTG3yAoYGJ
         fuUDBEERNXI57BepiYuwMHPqaOMKIRHQU2C31w+vP5lQgZYE2tbCEKQyzP0J+f8Gv6xI
         MOkNQ98af60bLqNlXXcnaZKQYMhobN1S+EyMEJ6R4ZIsiGkSHGyKnHpraN0+FlkJBs8t
         r49AGQbdHu8U+wXi5t0olB53a5MvJzbcQ28MGNr20F+WFk3UeR6rSMUe40ji5rcxrViS
         PuRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777356711; x=1777961511; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pdT5pfY3VK8rNWpNYZQMq0zeq8Lnd2Cb2TeI3hy+VDo=;
        b=L9VEBdgvI1vyCRjT6aAR4F7amEY+kXrq6z+sdLgMOy9A9rzQqkWgkxRBeJy9n6ZwHy
         SeEQWCCengtdsBHyGRPaeQSLY3qRVNNwhSJQptIOmeVgELeR3x9RCw0Qfoxh+Wd6DMaa
         /8KDi7rGeLLJ9sMPSZYA4D+qKhRbkrU+LcMQTVEWTvuqssdakQtAMnvfSORzWQDDrQXu
         /kAuflXd/V8KfmsT5EvzbSZOg2rG4BQlqF5w2DPkRAXv0Ig1gR//zG+ZYVrxAv2PyIWG
         FZ/Gq5g105coybtO1KWaEu9lSTwoe42Dh8B7lqwB9GcRuCYJtHJ++kzVAvlWQ1NoGu8B
         kAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777356711; x=1777961511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdT5pfY3VK8rNWpNYZQMq0zeq8Lnd2Cb2TeI3hy+VDo=;
        b=ji6NTkgqTZI+AFgLYxIAN785eYleXr2l4f0qI6HcegCy9yMn67GL7fgYRIf1Q1fMf8
         Pr8nxMqBQYk4Ya8l+g1F8f2qXOGfAg3oL6IAQCtnb4oJNFhOITt4rfzwbvb/jQE/6dK6
         tE6VjYJnlpWcJPF4npeLcqQqR5b5z3+tDsQHWtAfBRJhxPKeKWKoOntvyWf9oLQHkA0B
         qBDtDPjQhlLW49jXntXTkNGTrRVpQbY8gMFet1OqWG6hmqz3loI0mKE35OQxWgav8OmB
         ajBMjdlMncs19q0E5/YlGFo8uCJiVIXnf/oo5a4vnZv3sCggnVEipISEcawE95kvaWPN
         q7BA==
X-Forwarded-Encrypted: i=1; AFNElJ/HoBnqqqDAaXca3xXcKc2SII1BVUKGaYsiuxqJNIce/TwIGMvU2Of1hKGXhYBOfPBkWILGVmRU0zDeKbPmbdpK@lists.infradead.org
X-Gm-Message-State: AOJu0YxBJ53kzGWR01fQewSOFsRVqctN4aFaP3xoV/gP4MDR2HcSH5/n
	fMijTyuGiMnkJF2+vUMs1u+xQ/ifWKuOQaVmfx/8oryPJF43bRtjrxA9QngWI4i5qtPU8Ygpiui
	P9S062cWQKAMyItXCzQUE3p11N1HCx8wUZ7DcJ8jU
X-Gm-Gg: AeBDiesf5udpS5c4v3wvs+BrTwCsilylEswyfv9+bJE8u7t6+EY6XnvTtAdyG2p362t
	GwrJXGX0RdHvmG/6B4FcjTA+It1i0laZV3Yin1KR974puYW/YSMjYVn1DEH4P0PinBnRaPuhW8U
	J1coeGJAzFsTLRLK/Rw2tPASsCMW0zV8FFTDldIlBOwevMCsSl7gFXlpomNmqG3DZFtL6KRU6Nn
	X2adsTWX0Pc2cjEMLftj/37EtkUSUDVI/1y7+YZYGA7zNzGRmL6kGFkr+oKwX1hXnWFEPCOs0va
	gj5ASpA3KLG38SnQc9nxWpYn1RRmeerY5AcpBoFN1dUv+IStCNydKbvcNz201TrODwimKHf2JHe
	lcvFca6Emo1dG/g5jAvclpMUUolA7
X-Received: by 2002:a05:651c:41c3:b0:38e:ba6a:699a with SMTP id
 38308e7fff4ca-39240fbf363mr4248041fa.23.1777356710193; Mon, 27 Apr 2026
 23:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
 <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
 <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx> <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx> <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
In-Reply-To: <87jyttz8cf.ffs@tglx>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 28 Apr 2026 08:11:37 +0200
X-Gm-Features: AVHnY4IOWbT3zRFi94RLX1-zjsdzbqliqKQYb4VcI1nonhs-Jx38hProtGzMGss
Message-ID: <CACT4Y+ZofNqpeDdgde969LzLznxbRb8CPB6m=CS2RiSmkSYPQQ@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Mathias Stearn <mathias@mongodb.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Matthew Wilcox <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_231154_396223_A0857B04 
X-CRM114-Status: GOOD (  65.35  )
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

On Mon, 27 Apr 2026 at 00:04, Thomas Gleixner <tglx@kernel.org> wrote:
>
> On Fri, Apr 24 2026 at 21:44, Thomas Gleixner wrote:
> > On Fri, Apr 24 2026 at 17:03, Peter Zijlstra wrote:
> >> On Fri, Apr 24, 2026 at 04:16:08PM +0200, Thomas Gleixner wrote:
> >>> > I was really hoping that we would only need to do the "redundant"
> >>> > cpu_id_start writes would only be needed on membarrier_rseq IPIs where
> >>> > it really is a pay-for-what-you-use functionality,
> >>>
> >>> That's fine and can be solved without adding this sequence overhead into
> >>> the scheduler hotpath.
> >>
> >> Something like so? (probably needs help for !GENERIC bits)
> >
> > Yes and yes :)
> >
> > Let me stare at that !generic tif bits case.
>
> I stared at it and finally gave up because all of this is in a
> completely FUBAR'ed state and ends up in a horrible pile of hacks and
> duct tape with a way larger than zero probability that we chase the
> nasty corner cases for quite some time just to add more duct tape and
> hacks.
>
> Contrary to that it's rather trivial to cleanly separate the behavioral
> cases and guarantees without a masssive runtime overhead and without a
> pile of hard to maintain TCMalloc specific hacks.
>
> All required code is already available to support the architectures
> which do not utilize the generic entry code and therefore can't neither
> use the optimized mode nor time slice extensions. So instead of letting
> the compiler optimize that code out for the generic entry code users, we
> can keep it around and utilize one or the other depending on the
> requested mode. I managed to get the required run-time conditionals down
> to a minimum so that they are in the noise when analysing it with perf.
>
> The real question is how to differentiate between the legacy and the
> optimized mode. I have two working variants to achieve that:
>
>    1) The fully safe option requires a new flag for RSEQ
>       registration. It obviously requires a glibc update. (Suggested by
>       PeterZ)
>
>    2) Determine the requirements of the registering task via the size of
>       the registered RSEQ area.
>
>       The original implementation, which TCMalloc depends on, registers
>       a 32 byte region (ORIG_RSEG_SIZE). This region has 32 byte
>       alignment requirement.
>
>       The extension safe newer variant exposes the kernel RSEQ feature
>       size via getauxval(AT_RSEQ_FEATURE_SIZE) and the alignment
>       requirement via getauxval(AT_RSEQ_ALIGN). The alignment
>       requirement is that the registered rseq region is aligned to the
>       next power of two of the feature size. The kernel currently has a
>       feature size of 33 bytes, which means the alignment requirement is
>       64 bytes.
>
>       The TCMalloc RSEQ region is embedded into a cache line aligned
>       data structure starting at offset 32 bytes so that bytes 28-31 and
>       the cpu_id_start field at bytes 32-35 form a 64-bit little endian
>       pointer with the top-most bit (63 set) to check whether the kernel
>       has overwritten cpu_id_start with an actual CPU id value, which is
>       guaranteed to not have the top most bit set.
>
>       As this is part of their performance tuned magic, it's a pretty
>       safe assumption, that TCMalloc won't use a larger RSEQ size, which
>       allows to select optimized mode for registrations with a size
>       greater than 32 bytes.
>
>       That does not require any changes to glibc and works out of the
>       box. (Suggested by Mathieu)
>
> In both cases the legacy non-optimized mode exposes the original
> behaviour up to the mm_cid field and does not provide support for time
> slice extensions.  Optimized mode restores the performance gains and
> enables support for time slice extensions.
>
> I have no strong preference either way and have working code for both
> variants. Though obviously avoiding to update the libc world has a
> charme. If that unexpectedly would turn out to be not sufficient, then
> disabling that would be a trivial one-liner and as a consequence require
> to add the flag and update the libc world.
>
> Combo patch for the auto-detection based on the registered size below as
> that allows to immediately test without glibc dependencies. It applies
> cleanly on Linus tree and 7.0. 6.19 would need some fixups, but I
> learned today that it's already EOL.
>
> In the final version that's three separate patches plus a set of
> selftest changes which validate legacy behaviour and run the full param
> test suite in both legacy and optimized mode.
>
> Thoughts, preferences?

I like this! This does not create fires, and allows incremental transition.

I've tested the patch with membarrier doing TIF_RSEQ_FORCE_RESTART,
and it did not work with unmodified tcmalloc for subtle reasons
anyway. Tcmalloc can be made to work with that approach with minor
changes, but if the goal is to keep old binaries working, that won't
work.

I've tested this patch with unmodified tcmalloc tests, and it almost works.
I think the recent rseq changes introduced 2 more regressions/bugs.
They are caught by tcmalloc tests, but I think they equally affect
optimized v2 mode.

1. This seems to be broken after rseq unregistration:
"cpu_id_start Optimistic cache of the CPU number on which the
registered thread is running. Its value is guaranteed to always be a
possible CPU number, even when rseq is not registered."

Old kernels used to put cpu_id_start = 0:
https://elixir.bootlin.com/linux/v6.7/source/kernel/rseq.c#L119

But now kernel uses this function which puts cpu_id_start =
RSEQ_CPU_ID_UNINITIALIZED:
https://elixir.bootlin.com/linux/v7.0.1/source/include/linux/rseq_entry.h#L503

2. There are spurious SIGSEGV kills on rseq unregistration (thread exit).
Stress tests that unregister rseq and use membarrier sometimes killed
with SIGSEGV inside of rseq(UNREGISTER) syscall. I suspect there is
some race between ipi_rseq and rseq(UNREGISTER). I saw the same when
tested the
TIF_RSEQ_FORCE_RESTART patch -- kernel tried to update user-space rseq
when the pointer was NULL.

rseq_reset uses memset to clear t->rseq:

memset(&t->rseq, 0, sizeof(t->rseq));

If that uses byte writes, then it will clear sched_switch/ids_changed,
then at this point ipi_rseq still sees has_rseq=1 and sets
sched_switch/ids_changed, which cause update on return from
rseq(UNREGISTER).
Not sure if that's it, or there is something else.

This did not happen on older kernels which used rseq_preempt in ipi_rseq:
https://elixir.bootlin.com/linux/v6.7/source/kernel/sched/membarrier.c#L197





> Thanks,
>
>         tglx
> ---
>  Documentation/userspace-api/rseq.rst |   77 ++++++++++++++
>  include/linux/rseq.h                 |   20 +++
>  include/linux/rseq_entry.h           |  110 ++++++++++-----------
>  include/linux/rseq_types.h           |    3
>  kernel/rseq.c                        |  183 ++++++++++++++++++++++-------------
>  kernel/sched/membarrier.c            |   11 +-
>  6 files changed, 280 insertions(+), 124 deletions(-)
> ---
> --- a/include/linux/rseq.h
> +++ b/include/linux/rseq.h
> @@ -9,6 +9,11 @@
>
>  void __rseq_handle_slowpath(struct pt_regs *regs);
>
> +static __always_inline bool rseq_optimized(struct task_struct *t)
> +{
> +       return IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && likely(t->rseq.event.optimized);
> +}
> +
>  /* Invoked from resume_user_mode_work() */
>  static inline void rseq_handle_slowpath(struct pt_regs *regs)
>  {
> @@ -30,7 +35,7 @@ void __rseq_signal_deliver(int sig, stru
>   */
>  static inline void rseq_signal_deliver(struct ksignal *ksig, struct pt_regs *regs)
>  {
> -       if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +       if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_optimized(current)) {

Just rseq_optimized(t), it already includes the other check.

>                 /* '&' is intentional to spare one conditional branch */
>                 if (current->rseq.event.has_rseq & current->rseq.event.user_irq)
>                         __rseq_signal_deliver(ksig->sig, regs);
> @@ -50,15 +55,21 @@ static __always_inline void rseq_sched_s
>  {
>         struct rseq_event *ev = &t->rseq.event;
>
> -       if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
> +       /*
> +        * Only apply the user_irq optimization for RSEQ ABI V2
> +        * registrations. Legacy users like TCMalloc rely on the historical ABI
> +        * V1 behaviour which updates IDs on every context swtich.
> +        */
> +       if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_optimized(t)) {

Just rseq_optimized(t), it already includes the other check.

>                 /*
>                  * Avoid a boat load of conditionals by using simple logic
>                  * to determine whether NOTIFY_RESUME needs to be raised.
>                  *
>                  * It's required when the CPU or MM CID has changed or
> -                * the entry was from user space.
> +                * the entry was from user space. ev->has_rseq does not
> +                * have to be evaluated because optimized implies has_rseq.
>                  */
> -               bool raise = (ev->user_irq | ev->ids_changed) & ev->has_rseq;
> +               bool raise = ev->user_irq | ev->ids_changed;
>
>                 if (raise) {
>                         ev->sched_switch = true;
> @@ -66,6 +77,7 @@ static __always_inline void rseq_sched_s
>                 }
>         } else {
>                 if (ev->has_rseq) {
> +                       t->rseq.event.ids_changed = true;
>                         t->rseq.event.sched_switch = true;
>                         rseq_raise_notify_resume(t);
>                 }
> --- a/include/linux/rseq_entry.h
> +++ b/include/linux/rseq_entry.h
> @@ -111,6 +111,20 @@ static __always_inline void rseq_slice_c
>         t->rseq.slice.state.granted = false;
>  }
>
> +/*
> + * Open coded, so it can be invoked within a user access region.
> + *
> + * This clears the user space state of the time slice extensions field only when
> + * the task has registered the optimized RSEQ_ABI V2. Some legacy registrations,
> + * e.g. TCMalloc, have conflicting non-ABI fields in struct RSEQ, which would be
> + * overwritten by an unconditional write.
> + */
> +#define rseq_slice_clear_user(rseq, efault)                            \
> +do {                                                                   \
> +       if (rseq_slice_extension_enabled())                             \
> +               unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);     \
> +} while (0)
> +
>  static __always_inline bool __rseq_grant_slice_extension(bool work_pending)
>  {
>         struct task_struct *curr = current;
> @@ -230,10 +244,10 @@ static __always_inline bool rseq_slice_e
>  static __always_inline bool rseq_arm_slice_extension_timer(void) { return false; }
>  static __always_inline void rseq_slice_clear_grant(struct task_struct *t) { }
>  static __always_inline bool rseq_grant_slice_extension(unsigned long ti_work, unsigned long mask) { return false; }
> +#define rseq_slice_clear_user(rseq, efault) do { } while (0)
>  #endif /* !CONFIG_RSEQ_SLICE_EXTENSION */
>
>  bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr);
> -bool rseq_debug_validate_ids(struct task_struct *t);
>
>  static __always_inline void rseq_note_user_irq_entry(void)
>  {
> @@ -353,43 +367,6 @@ bool rseq_debug_update_user_cs(struct ta
>         return false;
>  }
>
> -/*
> - * On debug kernels validate that user space did not mess with it if the
> - * debug branch is enabled.
> - */
> -bool rseq_debug_validate_ids(struct task_struct *t)
> -{
> -       struct rseq __user *rseq = t->rseq.usrptr;
> -       u32 cpu_id, uval, node_id;
> -
> -       /*
> -        * On the first exit after registering the rseq region CPU ID is
> -        * RSEQ_CPU_ID_UNINITIALIZED and node_id in user space is 0!
> -        */
> -       node_id = t->rseq.ids.cpu_id != RSEQ_CPU_ID_UNINITIALIZED ?
> -                 cpu_to_node(t->rseq.ids.cpu_id) : 0;
> -
> -       scoped_user_read_access(rseq, efault) {
> -               unsafe_get_user(cpu_id, &rseq->cpu_id_start, efault);
> -               if (cpu_id != t->rseq.ids.cpu_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->cpu_id, efault);
> -               if (uval != cpu_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->node_id, efault);
> -               if (uval != node_id)
> -                       goto die;
> -               unsafe_get_user(uval, &rseq->mm_cid, efault);
> -               if (uval != t->rseq.ids.mm_cid)
> -                       goto die;
> -       }
> -       return true;
> -die:
> -       t->rseq.event.fatal = true;
> -efault:
> -       return false;
> -}
> -
>  #endif /* RSEQ_BUILD_SLOW_PATH */
>
>  /*
> @@ -504,12 +481,32 @@ bool rseq_set_ids_get_csaddr(struct task
>  {
>         struct rseq __user *rseq = t->rseq.usrptr;
>
> -       if (static_branch_unlikely(&rseq_debug_enabled)) {
> -               if (!rseq_debug_validate_ids(t))
> -                       return false;
> -       }
> -
>         scoped_user_rw_access(rseq, efault) {
> +               /* Validate the R/O fields for debug and optimized mode */
> +               if (static_branch_unlikely(&rseq_debug_enabled) || rseq_optimized(t)) {
> +                       u32 cpu_id, uval, node_id;
> +
> +                       /*
> +                        * On the first exit after registering the rseq region CPU ID is
> +                        * RSEQ_CPU_ID_UNINITIALIZED and node_id in user space is 0!
> +                        */
> +                       node_id = t->rseq.ids.cpu_id != RSEQ_CPU_ID_UNINITIALIZED ?
> +                               cpu_to_node(t->rseq.ids.cpu_id) : 0;
> +
> +                       unsafe_get_user(cpu_id, &rseq->cpu_id_start, efault);
> +                       if (cpu_id != t->rseq.ids.cpu_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->cpu_id, efault);
> +                       if (uval != cpu_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->node_id, efault);
> +                       if (uval != node_id)
> +                               goto die;
> +                       unsafe_get_user(uval, &rseq->mm_cid, efault);
> +                       if (uval != t->rseq.ids.mm_cid)
> +                               goto die;
> +               }
> +
>                 unsafe_put_user(ids->cpu_id, &rseq->cpu_id_start, efault);
>                 unsafe_put_user(ids->cpu_id, &rseq->cpu_id, efault);
>                 unsafe_put_user(node_id, &rseq->node_id, efault);
> @@ -517,11 +514,9 @@ bool rseq_set_ids_get_csaddr(struct task
>                 if (csaddr)
>                         unsafe_get_user(*csaddr, &rseq->rseq_cs, efault);
>
> -               /* Open coded, so it's in the same user access region */
> -               if (rseq_slice_extension_enabled()) {
> -                       /* Unconditionally clear it, no point in conditionals */
> -                       unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
> -               }
> +               /* RSEQ ABI V2 only operations */
> +               if (rseq_optimized(t))
> +                       rseq_slice_clear_user(rseq, efault);
>         }
>
>         rseq_slice_clear_grant(t);
> @@ -530,6 +525,9 @@ bool rseq_set_ids_get_csaddr(struct task
>         rseq_stat_inc(rseq_stats.ids);
>         rseq_trace_update(t, ids);
>         return true;
> +
> +die:
> +       t->rseq.event.fatal = true;
>  efault:
>         return false;
>  }
> @@ -612,6 +610,14 @@ static __always_inline bool rseq_exit_us
>          * interrupts disabled
>          */
>         guard(pagefault)();
> +       /*
> +        * This optimization is only valid when the task registered for the
> +        * optimized RSEQ_ABI_V2 variant. Some legacy users rely on the original
> +        * RSEQ implementation behaviour which unconditionally updated the IDs.
> +        * rseq_sched_switch_event() ensures that legacy registrations always
> +        * have both sched_switch and ids_changed set, which is compatible with
> +        * the historical TIF_NOTIFY_RESUME behaviour.
> +        */
>         if (likely(!t->rseq.event.ids_changed)) {
>                 struct rseq __user *rseq = t->rseq.usrptr;
>                 /*
> @@ -623,11 +629,9 @@ static __always_inline bool rseq_exit_us
>                 scoped_user_rw_access(rseq, efault) {
>                         unsafe_get_user(csaddr, &rseq->rseq_cs, efault);
>
> -                       /* Open coded, so it's in the same user access region */
> -                       if (rseq_slice_extension_enabled()) {
> -                               /* Unconditionally clear it, no point in conditionals */
> -                               unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
> -                       }
> +                       /* RSEQ ABI V2 only operations */
> +                       if (rseq_optimized(t))
> +                               rseq_slice_clear_user(rseq, efault);
>                 }
>
>                 rseq_slice_clear_grant(t);
> --- a/include/linux/rseq_types.h
> +++ b/include/linux/rseq_types.h
> @@ -18,6 +18,7 @@ struct rseq;
>   * @ids_changed:       Indicator that IDs need to be updated
>   * @user_irq:          True on interrupt entry from user mode
>   * @has_rseq:          True if the task has a rseq pointer installed
> + * @optimized:         RSEQ ABI V2 optimized mode
>   * @error:             Compound error code for the slow path to analyze
>   * @fatal:             User space data corrupted or invalid
>   * @slowpath:          Indicator that slow path processing via TIF_NOTIFY_RESUME
> @@ -41,7 +42,7 @@ struct rseq_event {
>                         };
>
>                         u8                      has_rseq;
> -                       u8                      __pad;
> +                       u8                      optimized;
>                         union {
>                                 u16             error;
>                                 struct {
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -258,11 +258,15 @@ static bool rseq_handle_cs(struct task_s
>  static void rseq_slowpath_update_usr(struct pt_regs *regs)
>  {
>         /*
> -        * Preserve rseq state and user_irq state. The generic entry code
> -        * clears user_irq on the way out, the non-generic entry
> -        * architectures are not having user_irq.
> -        */
> -       const struct rseq_event evt_mask = { .has_rseq = true, .user_irq = true, };
> +        * Preserve has_rseq, optimized and user_irq state. The generic entry
> +        * code clears user_irq on the way out, the non-generic entry
> +        * architectures are not setting user_irq.
> +        */
> +       const struct rseq_event evt_mask = {
> +               .has_rseq       = true,
> +               .user_irq       = true,
> +               .optimized      = true,
> +       };
>         struct task_struct *t = current;
>         struct rseq_ids ids;
>         u32 node_id;
> @@ -335,8 +339,9 @@ void __rseq_handle_slowpath(struct pt_re
>  void __rseq_signal_deliver(int sig, struct pt_regs *regs)
>  {
>         rseq_stat_inc(rseq_stats.signal);
> +
>         /*
> -        * Don't update IDs, they are handled on exit to user if
> +        * Don't update IDs yet, they are handled on exit to user if
>          * necessary. The important thing is to abort a critical section of
>          * the interrupted context as after this point the instruction
>          * pointer in @regs points to the signal handler.
> @@ -349,6 +354,13 @@ void __rseq_signal_deliver(int sig, stru
>                 current->rseq.event.error = 0;
>                 force_sigsegv(sig);
>         }
> +
> +       /*
> +        * In legacy mode, force the update of IDs before returning to user
> +        * space to stay compatible.
> +        */
> +       if (!rseq_optimized(current))
> +               rseq_force_update();
>  }
>
>  /*
> @@ -404,66 +416,19 @@ static bool rseq_reset_ids(void)
>  /* The original rseq structure size (including padding) is 32 bytes. */
>  #define ORIG_RSEQ_SIZE         32
>
> -/*
> - * sys_rseq - setup restartable sequences for caller thread.
> - */
> -SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len, int, flags, u32, sig)
> +static long rseq_register(struct rseq __user * rseq, u32 rseq_len, int flags, u32 sig)
>  {
> +       bool optimized = IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY) && rseq_len > ORIG_RSEQ_SIZE;
>         u32 rseqfl = 0;
>
> -       if (flags & RSEQ_FLAG_UNREGISTER) {
> -               if (flags & ~RSEQ_FLAG_UNREGISTER)
> -                       return -EINVAL;
> -               /* Unregister rseq for current thread. */
> -               if (current->rseq.usrptr != rseq || !current->rseq.usrptr)
> -                       return -EINVAL;
> -               if (rseq_len != current->rseq.len)
> -                       return -EINVAL;
> -               if (current->rseq.sig != sig)
> -                       return -EPERM;
> -               if (!rseq_reset_ids())
> -                       return -EFAULT;
> -               rseq_reset(current);
> -               return 0;
> -       }
> -
> -       if (unlikely(flags & ~(RSEQ_FLAG_SLICE_EXT_DEFAULT_ON)))
> -               return -EINVAL;
> -
> -       if (current->rseq.usrptr) {
> -               /*
> -                * If rseq is already registered, check whether
> -                * the provided address differs from the prior
> -                * one.
> -                */
> -               if (current->rseq.usrptr != rseq || rseq_len != current->rseq.len)
> -                       return -EINVAL;
> -               if (current->rseq.sig != sig)
> -                       return -EPERM;
> -               /* Already registered. */
> -               return -EBUSY;
> -       }
> -
> -       /*
> -        * If there was no rseq previously registered, ensure the provided rseq
> -        * is properly aligned, as communcated to user-space through the ELF
> -        * auxiliary vector AT_RSEQ_ALIGN. If rseq_len is the original rseq
> -        * size, the required alignment is the original struct rseq alignment.
> -        *
> -        * The rseq_len is required to be greater or equal to the original rseq
> -        * size. In order to be valid, rseq_len is either the original rseq size,
> -        * or large enough to contain all supported fields, as communicated to
> -        * user-space through the ELF auxiliary vector AT_RSEQ_FEATURE_SIZE.
> -        */
> -       if (rseq_len < ORIG_RSEQ_SIZE ||
> -           (rseq_len == ORIG_RSEQ_SIZE && !IS_ALIGNED((unsigned long)rseq, ORIG_RSEQ_SIZE)) ||
> -           (rseq_len != ORIG_RSEQ_SIZE && (!IS_ALIGNED((unsigned long)rseq, rseq_alloc_align()) ||
> -                                           rseq_len < offsetof(struct rseq, end))))
> -               return -EINVAL;
>         if (!access_ok(rseq, rseq_len))
>                 return -EFAULT;
>
> -       if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION)) {
> +       /*
> +        * The optimized check disables time slice extensions for legacy
> +        * registrations.
> +        */
> +       if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION) && optimized) {
>                 rseqfl |= RSEQ_CS_FLAG_SLICE_EXT_AVAILABLE;
>                 if (rseq_slice_extension_enabled() &&
>                     (flags & RSEQ_FLAG_SLICE_EXT_DEFAULT_ON))
> @@ -485,7 +450,15 @@ SYSCALL_DEFINE4(rseq, struct rseq __user
>                 unsafe_put_user(RSEQ_CPU_ID_UNINITIALIZED, &rseq->cpu_id, efault);
>                 unsafe_put_user(0U, &rseq->node_id, efault);
>                 unsafe_put_user(0U, &rseq->mm_cid, efault);
> -               unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
> +
> +               /*
> +                * All fields past mm_cid are only valid for non-legacy registrations
> +                * which register with rseq_len > ORIG_RSEQ_SIZE.
> +                */
> +               if (optimized) {
> +                       if (IS_ENABLED(CONFIG_RSEQ_SLICE_EXTENSION))
> +                               unsafe_put_user(0U, &rseq->slice_ctrl.all, efault);
> +               }
>         }
>
>         /*
> @@ -501,11 +474,11 @@ SYSCALL_DEFINE4(rseq, struct rseq __user
>  #endif
>
>         /*
> -        * If rseq was previously inactive, and has just been
> -        * registered, ensure the cpu_id_start and cpu_id fields
> -        * are updated before returning to user-space.
> +        * Ensure the cpu_id_start and cpu_id fields are updated before
> +        * returning to user-space.
>          */
>         current->rseq.event.has_rseq = true;
> +       current->rseq.event.optimized = optimized;
>         rseq_force_update();
>         return 0;
>
> @@ -513,6 +486,86 @@ SYSCALL_DEFINE4(rseq, struct rseq __user
>         return -EFAULT;
>  }
>
> +static long rseq_unregister(struct rseq __user * rseq, u32 rseq_len, int flags, u32 sig)
> +{
> +       if (flags & ~RSEQ_FLAG_UNREGISTER)
> +               return -EINVAL;
> +       if (current->rseq.usrptr != rseq || !current->rseq.usrptr)
> +               return -EINVAL;
> +       if (rseq_len != current->rseq.len)
> +               return -EINVAL;
> +       if (current->rseq.sig != sig)
> +               return -EPERM;
> +       if (!rseq_reset_ids())
> +               return -EFAULT;
> +       rseq_reset(current);
> +       return 0;
> +}
> +
> +static long rseq_reregister(struct rseq __user * rseq, u32 rseq_len, u32 sig)
> +{
> +       /*
> +        * If rseq is already registered, check whether the provided address
> +        * differs from the prior one.
> +        */
> +       if (current->rseq.usrptr != rseq || rseq_len != current->rseq.len)
> +               return -EINVAL;
> +       if (current->rseq.sig != sig)
> +               return -EPERM;
> +       /* Already registered. */
> +       return -EBUSY;
> +}
> +
> +static bool rseq_length_valid(struct rseq __user *rseq, unsigned int rseq_len)
> +{
> +       if (rseq_len < ORIG_RSEQ_SIZE)
> +               return false;
> +
> +       /*
> +        * Ensure the provided rseq is properly aligned, as communicated to
> +        * user-space through the ELF auxiliary vector AT_RSEQ_ALIGN. If
> +        * rseq_len is the original rseq size, the required alignment is the
> +        * original struct rseq alignment.
> +        *
> +        * The rseq_len is required to be greater or equal than the original
> +        * rseq size.
> +        *
> +        * In order to be valid, rseq_len is either the original rseq size, or
> +        * large enough to contain all supported fields, as communicated to
> +        * user-space through the ELF auxiliary vector AT_RSEQ_FEATURE_SIZE.
> +        */
> +       if (rseq_len < ORIG_RSEQ_SIZE)
> +               return false;
> +
> +       if (rseq_len == ORIG_RSEQ_SIZE)
> +               return IS_ALIGNED((unsigned long)rseq, ORIG_RSEQ_SIZE);
> +
> +       return IS_ALIGNED((unsigned long)rseq, rseq_alloc_align()) &&
> +               rseq_len >= offsetof(struct rseq, end);
> +}
> +
> +#define RSEQ_FLAGS_SUPPORTED   (RSEQ_FLAG_SLICE_EXT_DEFAULT_ON)
> +
> +/*
> + * sys_rseq - Register or unregister restartable sequences for the caller thread.
> + */
> +SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len, int, flags, u32, sig)
> +{
> +       if (flags & RSEQ_FLAG_UNREGISTER)
> +               return rseq_unregister(rseq, rseq_len, flags, sig);
> +
> +       if (unlikely(flags & ~RSEQ_FLAGS_SUPPORTED))
> +               return -EINVAL;
> +
> +       if (current->rseq.usrptr)
> +               return rseq_reregister(rseq, rseq_len, sig);
> +
> +       if (!rseq_length_valid(rseq, rseq_len))
> +               return -EINVAL;
> +
> +       return rseq_register(rseq, rseq_len, flags, sig);
> +}
> +
>  #ifdef CONFIG_RSEQ_SLICE_EXTENSION
>  struct slice_timer {
>         struct hrtimer  timer;
> @@ -713,6 +766,8 @@ int rseq_slice_extension_prctl(unsigned
>                         return -ENOTSUPP;
>                 if (!current->rseq.usrptr)
>                         return -ENXIO;
> +               if (!current->rseq.event.optimized)
> +                       return -ENOTSUPP;
>
>                 /* No change? */
>                 if (enable == !!current->rseq.slice.state.enabled)
> --- a/kernel/sched/membarrier.c
> +++ b/kernel/sched/membarrier.c
> @@ -199,7 +199,16 @@ static void ipi_rseq(void *info)
>          * is negligible.
>          */
>         smp_mb();
> -       rseq_sched_switch_event(current);
> +       /*
> +        * Legacy mode requires that IDs are written and the critical section is
> +        * evaluated. Optimized mode handles the critical section and IDs are
> +        * only updated if they change as a consequence of preemption after
> +        * return from this IPI.
> +        */
> +       if (rseq_optimized(current))
> +               rseq_sched_switch_event(current);
> +       else
> +               rseq_force_update();
>  }
>
>  static void ipi_sync_rq_state(void *info)
> --- a/Documentation/userspace-api/rseq.rst
> +++ b/Documentation/userspace-api/rseq.rst
> @@ -24,6 +24,80 @@ Quick access to CPU number, node ID
>  Allows to implement per CPU data efficiently. Documentation is in code and
>  selftests. :(
>
> +Optimized RSEQ V2
> +-----------------
> +
> +On architectures which utilize the generic entry code and generic TIF bits
> +the kernel supports runtime optimizations for RSEQ, which also enable
> +enhanced features like scheduler time slice extensions.
> +
> +To enable them a task has to register the RSEQ region with at least the
> +length advertised by getauxval(AT_RSEQ_FEATURE_SIZE).
> +
> +If existing binaries register with RSEQ_ORIG_SIZE (32 bytes), the kernel
> +keeps the legacy low performance mode enabled to fulfil the expectations
> +existing users regarding the original RSEQ implementation behaviour.
> +
> +The following table documents the ABI and behavioral guarantees of the
> +legacy and the optimized V2 mode.
> +
> +.. list-table:: RSEQ modes
> +   :header-rows: 1
> +
> +   * - Nr
> +     - What
> +     - Legacy
> +     - Optimized V2
> +   * - 1
> +     - The cpu_id_start, cpu_id, node_id and mm_cid fields (User mode read
> +       only)
> +     - Updated by the kernel unconditionally after each context switch and
> +       before signal delivery
> +     - Updated by the kernel if and only if they change, i.e. if the task
> +       is migrated or mm_cid changes
> +   * - 2
> +     - The rseq_cs critical section field
> +     - Evaluated and handled unconditionally after each context switch and
> +       before signal delivery
> +     - Evaluated and handled conditionally only when user space was
> +       interrupted. Either after being preempted or before signal delivery
> +       in the interrupted context.
> +   * - 3
> +     - Read only fields
> +     - No strict enforcement except in debug mode
> +     - Strict enforcement
> +   * - 4
> +     - membarrier(...RSEQ)
> +     - All running threads of the process are interrupted and the ID fields
> +       are rewritten and eventually active critical sections are aborted
> +       before they return to user space.  All threads which are scheduled
> +       out whether voluntary or not are covered by #1/#2 above.
> +     - All running threads of the process are interrupted and eventually
> +       active critical sections are aborted before these threads return to
> +       user space. The ID fields are only updated if changed as a
> +       consequence of the interrupt. All threads which are scheduled out
> +       whether voluntary not are covered by #1/#2 above.
> +   * - 5
> +     - Time slice extensions
> +     - Not supported
> +     - Supported
> +
> +The legacy mode is obviously less performant as it does unconditional
> +updates and critical section checks even if not strictly required by the
> +ABI contract. That can't be changed anymore as some users depend on that
> +observed behavior, which in turn enables them to violate the ABI and
> +overwrite the cpu_id_start field for their own purposes. This is obviously
> +discouraged as it renders RSEQ incompatible with the intended usage and
> +breaks the expectation of other libraries in the same application.
> +
> +The ABI compliant optimized mode, which respects the read only fields, does
> +not require unconditional updates and therefore is way more performant. The
> +kernel validates the read only fields for compliance. If user space
> +modifies them, the process is killed. Compliant usage allows multiple
> +libraries in the same application to benefit from the RSEQ functionality
> +without disturbing each other.
> +
> +
>  Scheduler time slice extensions
>  -------------------------------
>
> @@ -37,7 +111,8 @@ scheduled out inside of the critical sec
>
>      * Enabled at boot time (default is enabled)
>
> -    * A rseq userspace pointer has been registered for the thread
> +    * A rseq userspace pointer has been registered for the thread in
> +      optimized V2 mode
>
>  The thread has to enable the functionality via prctl(2)::
>

