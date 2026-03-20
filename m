Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA7109879E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt5wp0JccOgYV+FeGV4XCmx8mb18x/E0K2lKU+wkM+o=; b=p9m8NC14Meq8lwiSeZUtZcoaWQ
	B/03dzz2d7kmfPgL0FmRzxHMaa7t37s8bN3uSJo9VVeSyhIMzDtzI4SpusT4AvuBXA1kfbFiyMXMA
	A/i3kY0W8+/BQIhq6B6VaWonUK/xbR6e5gmlYLAZJOeJ5i1ih32rtpDPTK8IeEqnhTkuVymLB27Hj
	E1/JgMkkjGw+nLKKs5IB+zQwcsMcBisS9jlVwNJqXZIXyRyShcEqwrE8dbBGK/cQlnx7VZbQlwQCk
	rRxMAeuYp4O8JPawKh1+GjzF8uwaArcc2udaNCwKUXJeDqwsZWhwCT86vD1AZEuFIRo8UzNVdtI42
	RhhiD4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bue-0000000D2oa-2UhP;
	Fri, 20 Mar 2026 15:37:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3buc-0000000D2oA-0rtK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:37:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5D01165C;
	Fri, 20 Mar 2026 08:37:14 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C57A3F7BD;
	Fri, 20 Mar 2026 08:37:19 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:37:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <87eclek0mb.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eclek0mb.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_083722_350366_8038F48B 
X-CRM114-Status: GOOD (  49.37  )
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

On Fri, Mar 20, 2026 at 03:59:40PM +0100, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 11:30, Mark Rutland wrote:
> > 4) When 'pseudo-NMI' is used, Linux masks interrupts via a combination
> >    of DAIF and the 'PMR' priority mask register. At entry and exit,
> >    interrupts must be masked via DAIF, but most kernel code will
> >    mask/unmask regular interrupts using PMR (e.g. in local_irq_save()
> >    and local_irq_restore()).
> >
> >    This requires more complicated transitions at entry and exit. Early
> >    during entry or late during return, interrupts are masked via DAIF,
> >    and kernel code which manipulates PMR to mask/unmask interrupts will
> >    not function correctly in this state.
> >
> >    This also requires fairly complicated management of DAIF and PMR when
> >    handling interrupts, and arm64 has special logic to avoid preempting
> >    from pseudo-NMIs which currently lives in
> >    arch_irqentry_exit_need_resched().
> 
> Why are you routing NMI like exceptions through irqentry_enter() and
> irqentry_exit() in the first place? That's just wrong.

Sorry, the above was not clear, and some of this logic is gunk that has
been carried over unnnecessarily from our old exception handling flow.

The issue with pseudo-NMI is that it uses the same exception as regular
interrupts, but we don't know whether we have a pseudo-NMI until we
acknowledge the event at the irqchip level. When a pseudo-NMI is taken,
there are two possibilities:

(1) The pseudo-NMI is taken from a context where interrupts were
    *disabled*. The entry code immediately knows it must be a
    pseudo-NMI, and we call irqentry_nmi_{enter,exit}(), NOT
    irqentry_{enter,exit}(), treating it as an NMI.


(2) The pseudo-NMI was taken from a context where interrupts were
    *enabled*. The entry code doesn't know whether it's a pseudo-NMI or
    a regular interrupt, so it calls irqentry_{enter,exit}(), and then
    within that we'll call nmi_{enter,exit}() to transiently enter NMI
    context.

I realise this is crazy. I would love to delete pseudo-NMI.
Unfortunately people are using it.

Putting aside the nesting here, I think it's fine to preempt upon return
from case (2), and we can delete the logic to avoid preempting.

> > 5) Most kernel code runs with all exceptions unmasked. When scheduling,
> >    only interrupts should be masked (by PMR pseudo-NMI is used, and by
> >    DAIF otherwise).
> >
> > For most exceptions, arm64's entry code has a sequence similar to that
> > of el1_abort(), which is used for faults:
> >
> > | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
> > | {
> > |         unsigned long far = read_sysreg(far_el1);
> > |         irqentry_state_t state;
> > |
> > |         state = enter_from_kernel_mode(regs);
> > |         local_daif_inherit(regs);
> > |         do_mem_abort(far, esr, regs);
> > |         local_daif_mask();
> > |         exit_to_kernel_mode(regs, state);
> > | }
> >
> > ... where enter_from_kernel_mode() and exit_to_kernel_mode() are
> > wrappers around irqentry_enter() and irqentry_exit() which perform
> > additional arm64-specific entry/exit logic.
> >
> > Currently, the generic irq entry code will attempt to preempt from any
> > exception under irqentry_exit() where interrupts were unmasked in the
> > original context. As arm64's entry code will have already masked
> > exceptions via DAIF, this results in the problems described above.
> 
> See below.
> 
> > Fix this by opting out of preemption in irqentry_exit(), and restoring
> > arm64's old behaivour of explicitly preempting when returning from IRQ
> > or FIQ, before calling exit_to_kernel_mode() / irqentry_exit(). This
> > ensures that preemption occurs when only interrupts are masked, and
> > where that masking is compatible with most kernel code (e.g. using PMR
> > when pseudo-NMI is in use).
> 
> My gut feeling tells me that there is a fundamental design flaw
> somewhere and the below is papering over it.
> 
> > @@ -497,6 +497,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
> >  	do_interrupt_handler(regs, handler);
> >  	irq_exit_rcu();
> >  
> > +	irqentry_exit_cond_resched();
> > +
> >  	exit_to_kernel_mode(regs, state);
> >  }
> >  static void noinstr el1_interrupt(struct pt_regs *regs,
> > diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> > index 9ef63e4147913..af9cae1f225e3 100644
> > --- a/kernel/entry/common.c
> > +++ b/kernel/entry/common.c
> > @@ -235,8 +235,10 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
> >  		}
> >  
> >  		instrumentation_begin();
> > -		if (IS_ENABLED(CONFIG_PREEMPTION))
> > +		if (IS_ENABLED(CONFIG_PREEMPTION) &&
> > +		    !IS_ENABLED(CONFIG_ARCH_HAS_OWN_IRQ_PREEMPTION)) {
> 
> These 'But my architecture is sooo special' switches cause immediate review
> nausea and just confirm that there is a fundamental flaw somewhere else.
> 
> >  			irqentry_exit_cond_resched();
> 
> Let's look at how this is supposed to work. I'm just looking at
> irqentry_enter()/exit() and not the NMI variant.
> 
> Interrupt/exception is raised
> 
>   1) low level architecture specific entry code does all the magic state
>      saving, setup etc.
> 
>   2) irqentry_enter() is invoked
> 
>       - checks for user mode or kernel mode entry
> 
>       - handles RCU on enter from user and if kernel entry hits the idle
>         task
> 
>       - Sets up lockdep, tracing, kminsanity
> 
>   3) the interrupt/exception handler is invoked
> 
>   4) irqentry_exit() is invoked
> 
>       - handles exit to user and exit to kernel
> 
>       - exit to user handles the TIF and other pending work, which can
>         schedule and then prepares for return
> 
>       - exit to kernel
> 
>         When interrupt were disabled on entry, it just handles RCU and
>         returns.
> 
>         When enabled on entry, it checks whether RCU was watching on
>         entry or not. If not it tells RCU that the interrupt nesting is
>         done and returns. When RCU was watching it can schedule
>  
>   5) Undoes #1 so that it can return to the originally interrupted
>      context.
> 
> That means at the point where irqentry_entry() is invoked, the
> architecture side should have made sure that everything is set up for
> the kernel to operate until irqentry_exit() returns.

Ok. I think you're saying I should try:

* At entry, *before* irqentry_enter():
  - unmask everything EXCEPT regular interrupts.
  - fix up all the necessary state.

* At exception exit, *after* irqentry_exit():
  - mask everything.
  - fix up all the necessary state.

... right?

> Looking at your example:
> 
> > | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
> > | {
> > |         unsigned long far = read_sysreg(far_el1);
> > |         irqentry_state_t state;
> > |
> > |         state = enter_from_kernel_mode(regs);
> > |         local_daif_inherit(regs);
> > |         do_mem_abort(far, esr, regs);
> > |         local_daif_mask();
> > |         exit_to_kernel_mode(regs, state);
> 
> and the paragraph right below that:
> 
> > Currently, the generic irq entry code will attempt to preempt from any
> > exception under irqentry_exit() where interrupts were unmasked in the
> > original context. As arm64's entry code will have already masked
> > exceptions via DAIF, this results in the problems described above.
> 
> To me this looks like your ordering is wrong. Why are you doing the DAIF
> inherit _after_ irqentry_enter() and the mask _before_ irqentry_exit()?

As above, I can go look at reworking this. 

For context, we do it this way today for several reasons, including:

(1) Because some of the arch-specific bits (such as checking the TFSR
    for MTE) in enter_from_kernel_mode() and exit_to_kernel_mode() need
    to be done while RCU is watching, etc, but needs other exceptions
    masked. I can look at reworking that.

(2) To minimize the number of times we have to write to things like
    DAIF, as that can be expensive.

(3) To simplify the management of things like DAIF, so that we don't
    have several points in time at which we need to inherit different
    pieces of state.

(4) Historical, as that's the flow we had in assembly, and prior to the
    move to generic irq entry.

> I might be missing something, but this smells more than fishy.
> 
> As no other architecture has that problem I'm pretty sure that the
> problem is not in the way how the generic code was designed. Why?

Hey, I'm not saying the generic entry code is wrong, just that there's a
mismatch between it and what would be optimal for arm64.

> Because your architecture is _not_ sooo special! :)

I think it's pretty special, but not necessarily in the same sense. ;)

Mark.

