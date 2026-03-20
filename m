Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4C61099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLCvrC2mTLc8Z0MN6FQOVttXS4BCxi5tH5HMk/GFXSY=; b=09qFec2ndZ+vaDfmuY6lysSpZf
	o5ATdbdtHlBJ4yjazvNzqAlx7rHFw6QtY3LiSDR6E7+iuF/oeZkhv2q5Xn8U02gLfIPO3DqwVJkQ+
	fu9z0SLnLj4ywnk9FlTqUvQT/l2VWZqk130Q2/azPmTVLQPFDRkPNKm16YAcA4ObTEbGxqfl1aQy4
	0JRI+NKQSbvOeXMB9DbAPOGdeHgHqsCExnQqOcwAmfgAcoB5WqqRAfnqQtPfsgsxCb+H8ykd0TBdi
	lCHqwEmEgHDLcrrGnDkD8v0Pf9nyTNVQWMCvotr7RXppMLqwXNGDc6mT4WmwP3Ym7kX8PoBml9Kh8
	nh/CqzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dh0-0000000DGMg-48D1;
	Fri, 20 Mar 2026 17:31:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dgy-0000000DGKr-0Mn8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:31:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F1E61596;
	Fri, 20 Mar 2026 10:31:16 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 892323FA1F;
	Fri, 20 Mar 2026 10:31:20 -0700 (PDT)
Date: Fri, 20 Mar 2026 17:31:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
 <87341ujwl4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87341ujwl4.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_103124_479704_297C7E14 
X-CRM114-Status: GOOD (  62.48  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 05:26:47PM +0100, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 15:37, Mark Rutland wrote:
> > On Fri, Mar 20, 2026 at 03:59:40PM +0100, Thomas Gleixner wrote:
> >> Why are you routing NMI like exceptions through irqentry_enter() and
> >> irqentry_exit() in the first place? That's just wrong.
> >
> > Sorry, the above was not clear, and some of this logic is gunk that has
> > been carried over unnnecessarily from our old exception handling flow.
> >
> > The issue with pseudo-NMI is that it uses the same exception as regular
> > interrupts, but we don't know whether we have a pseudo-NMI until we
> > acknowledge the event at the irqchip level. When a pseudo-NMI is taken,
> > there are two possibilities:
> >
> > (1) The pseudo-NMI is taken from a context where interrupts were
> >     *disabled*. The entry code immediately knows it must be a
> >     pseudo-NMI, and we call irqentry_nmi_{enter,exit}(), NOT
> >     irqentry_{enter,exit}(), treating it as an NMI.
> >
> >
> > (2) The pseudo-NMI was taken from a context where interrupts were
> >     *enabled*. The entry code doesn't know whether it's a pseudo-NMI or
> >     a regular interrupt, so it calls irqentry_{enter,exit}(), and then
> >     within that we'll call nmi_{enter,exit}() to transiently enter NMI
> >     context.
> >
> > I realise this is crazy. I would love to delete pseudo-NMI.
> > Unfortunately people are using it.
> 
> What is it used for?

It's used where people would want an NMI; specifically today that's:

* The PMU interrupt (so people can profile code that has IRQs off).
* IPI_CPU_BACKTRACE (so we can get a backtrace when code has IRQs off).
* IPI_CPU_STOP_NMI (so panic can stop secondaries more reliably).
* IPI_KGDB_ROUNDUP (so KGDB can stop secondaries more reliably).

I mostly care about the first two. People *really* want the PMU interrupt as an
NMI.

> > Putting aside the nesting here, I think it's fine to preempt upon return
> > from case (2), and we can delete the logic to avoid preempting.
> 
> Correct.

Cool; thanks for confirming!

> >> That means at the point where irqentry_entry() is invoked, the
> >> architecture side should have made sure that everything is set up for
> >> the kernel to operate until irqentry_exit() returns.
> >
> > Ok. I think you're saying I should try:
> >
> > * At entry, *before* irqentry_enter():
> >   - unmask everything EXCEPT regular interrupts.
> >   - fix up all the necessary state.
> >
> > * At exception exit, *after* irqentry_exit():
> >   - mask everything.
> >   - fix up all the necessary state.
> >
> > ... right?
> 
> Yes.

Ok; I'll go experiment...

My major concern is that this is liable to make the arm64 entry
sequences substantially more expensive and complicated (see notes
below), but I should go see how bad that is in practice.

My other concern is that I'd like to backport a fix for the issue I
mentioned in the commit message, and I'd like to have something that's
simpler than "rewrite the entire entry code" for that -- for backporting
it'd be easier to revert the move to generic irq entry.

> >> Looking at your example:
> >> 
> >> > | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
> >> > | {
> >> > |         unsigned long far = read_sysreg(far_el1);
> >> > |         irqentry_state_t state;
> >> > |
> >> > |         state = enter_from_kernel_mode(regs);
> >> > |         local_daif_inherit(regs);
> >> > |         do_mem_abort(far, esr, regs);
> >> > |         local_daif_mask();
> >> > |         exit_to_kernel_mode(regs, state);
> >> 
> >> and the paragraph right below that:
> >> 
> >> > Currently, the generic irq entry code will attempt to preempt from any
> >> > exception under irqentry_exit() where interrupts were unmasked in the
> >> > original context. As arm64's entry code will have already masked
> >> > exceptions via DAIF, this results in the problems described above.
> >> 
> >> To me this looks like your ordering is wrong. Why are you doing the DAIF
> >> inherit _after_ irqentry_enter() and the mask _before_ irqentry_exit()?
> >
> > As above, I can go look at reworking this. 
> >
> > For context, we do it this way today for several reasons, including:
> >
> > (1) Because some of the arch-specific bits (such as checking the TFSR
> >     for MTE) in enter_from_kernel_mode() and exit_to_kernel_mode() need
> >     to be done while RCU is watching, etc, but needs other exceptions
> >     masked. I can look at reworking that.
> 
> Something like the below should do that for you. If you need more than
> regs, then you can either stick something on your stack frame or we go
> and extend irqentry_enter()/exit() with an additional argument which
> allows you to hand some exception/interrupt specific cookie in. The core
> code would just hand it through to arch_irqenter_enter/exit_rcu() along
> with @regs. That cookie might be data or even a function pointer. The
> core does not have to know about it.

I don't think that helps for exit, because the contradiction is "while
RCU is watching, etc, but needs other exceptions masked", and as above,
we can't have that, because (with the flow you've suggested)  exceptions
aren't masked until after irqentry_exit().

Let me go think a bit harder about that. The exit path for TFSR is
already somewhat best-effort. Maybe the right thing to do is push that
entirely out of the way and re-enter when it indicates a problem.

> > (2) To minimize the number of times we have to write to things like
> >     DAIF, as that can be expensive.
> >
> > (3) To simplify the management of things like DAIF, so that we don't
> >     have several points in time at which we need to inherit different
> >     pieces of state.
> 
> The above should cover your #2/3 too, no?

Not really, but we might be talking past one another.

I *think* you're saying that because the arch code would manage DAIF
early during entry and late during exit, that would all be in one place.

However, that doubles the number of times we have to write to DAIF: at
entry we'd have to poke it once to unmask everything except IRQs, then
again to unmask IRQs, and exit would need the inverse. We'd also have to
split the inheritance logic into inherit-everything-but-interrupt and
inherit-only-interrupt, which is doable but not ideal. With pseudo-NMI
it's even worse, but that's largely because pseudo-NMI is
over-complicated today.

As above, I'll go experiment and see how bad this is in practice.

> > (4) Historical, as that's the flow we had in assembly, and prior to the
> >     move to generic irq entry.
> 
> No comment :)

:)

Mark.

> >> I might be missing something, but this smells more than fishy.
> >> 
> >> As no other architecture has that problem I'm pretty sure that the
> >> problem is not in the way how the generic code was designed. Why?
> >
> > Hey, I'm not saying the generic entry code is wrong, just that there's a
> > mismatch between it and what would be optimal for arm64.
> >
> >> Because your architecture is _not_ sooo special! :)
> >
> > I think it's pretty special, but not necessarily in the same sense. ;)
> 
> Hehehe.
> 
> Thanks,
> 
>         tglx
> ---        
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -149,6 +149,7 @@ noinstr irqentry_state_t irqentry_enter(
>  		instrumentation_begin();
>  		kmsan_unpoison_entry_regs(regs);
>  		trace_hardirqs_off_finish();
> +		arch_irqentry_enter_rcu(regs);
>  		instrumentation_end();
>  
>  		ret.exit_rcu = true;
> @@ -166,6 +167,7 @@ noinstr irqentry_state_t irqentry_enter(
>  	kmsan_unpoison_entry_regs(regs);
>  	rcu_irq_enter_check_tick();
>  	trace_hardirqs_off_finish();
> +	arch_irqentry_enter_rcu(regs);
>  	instrumentation_end();
>  
>  	return ret;
> @@ -225,6 +227,7 @@ noinstr void irqentry_exit(struct pt_reg
>  		 */
>  		if (state.exit_rcu) {
>  			instrumentation_begin();
> +			arch_irqentry_exit_rcu(regs);
>  			hrtimer_rearm_deferred();
>  			/* Tell the tracer that IRET will enable interrupts */
>  			trace_hardirqs_on_prepare();
> @@ -239,11 +242,13 @@ noinstr void irqentry_exit(struct pt_reg
>  		if (IS_ENABLED(CONFIG_PREEMPTION))
>  			irqentry_exit_cond_resched();
>  
> +		arch_irqentry_exit_rcu(regs);
>  		hrtimer_rearm_deferred();
>  		/* Covers both tracing and lockdep */
>  		trace_hardirqs_on();
>  		instrumentation_end();
>  	} else {
> +		arch_irqentry_exit_rcu(regs);
>  		/*
>  		 * IRQ flags state is correct already. Just tell RCU if it
>  		 * was not watching on entry.

