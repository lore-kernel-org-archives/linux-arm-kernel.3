Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12F103A9A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7JuadCeGX6W9vwITObvZIGEFb5ZeS50Pf/MGH42a6A=; b=WpatUzkCYASahshLZGwwVbtxRb
	QXt7W0aMA5UsP6myMWr4MVaIp4JPPXwPbNVPMepSlGW48HE3CaB24ZDop0Bkg7bvW/ovqJldDwqS+
	CQSq9lF9E5sCDDFZ4AztNusqdjH4a4iQa35xtrIXakZAgBZMuZC+Yb53ZsSgjr3dy9f5en4WN5buj
	VS/4J/FJExPRYPAFqflJ3UmMEtjW9uxvHlzCHQ4bKQ6KUHDXOAvTBy1vvNC26fZK0b3MFsFUUy+es
	3kTdjGsJHzxdg3Fq6IrroiCufm2ffXboG1leLjCrSmnq7H7tqeVy0dcYJOhpyM8+I1FhcwDPYHyZQ
	uIwCJGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M14-00000003Cwh-33Rm;
	Wed, 25 Mar 2026 11:03:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M11-00000003CvL-2UCT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:03:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40BB81CDD;
	Wed, 25 Mar 2026 04:03:02 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C182D3FB90;
	Wed, 25 Mar 2026 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774436588; bh=SCTyfeB3k+9EI0VBNm85ZqRDDZXH45gfMsPcUlCMqBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8kZZcJ+nmBCer/W/3ur1dwzBBpVWsQsHoXpqA0s3Rr/8Z0/tLT64wUFSCG3bXnxQ
	 JqmVn0nHsLhEODDAX1ofMrYsCyCL3es3b38QJ9kR8sqLXAEQs5GUxdZugfT/ntAK7O
	 cwth0QQdBOw7Sy4aKAV4bnI7BFNAqqAIkMpWkJ5w=
Date: Wed, 25 Mar 2026 11:03:01 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <acPAzdtjK5w-rNqC@J2N7QTR9R3>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
 <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com>
 <87fr5six4d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fr5six4d.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040311_714146_D3B549AB 
X-CRM114-Status: GOOD (  39.76  )
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

On Sun, Mar 22, 2026 at 12:25:06AM +0100, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 17:31, Mark Rutland wrote:
> > On Fri, Mar 20, 2026 at 05:26:47PM +0100, Thomas Gleixner wrote:
> > I *think* you're saying that because the arch code would manage DAIF
> > early during entry and late during exit, that would all be in one place.
> 
> That was my thought, see below.
> 
> > However, that doubles the number of times we have to write to DAIF: at
> > entry we'd have to poke it once to unmask everything except IRQs, then
> > again to unmask IRQs, and exit would need the inverse. We'd also have to
> > split the inheritance logic into inherit-everything-but-interrupt and
> > inherit-only-interrupt, which is doable but not ideal. With pseudo-NMI
> > it's even worse, but that's largely because pseudo-NMI is
> > over-complicated today.
> 
> Interrupts are not unmasked on interrupt/exception entry ever and I
> don't understand your concerns at all, but as always I might be missing
> something.

I think one problem is that we're using the same words to describe
distinct things, because the terminology is overloaded; I've tried to
clarify some of that below.

I think another is that there are a large number of interacting
constraints, and it's easily possible to find something that for most
but not all of those. I *think* there's an approach that satisfies all
of our requirements; see below where I say "I *think* what would work
for us ...".

For context, when I said "at entry" and "at exit" I was including
*everything* we have to do before/after the "real" logic to handle an
exception, including parts that surround the generic entry code. I'm
happy to use a different term for those periods, but I can't immediately
think of something better.

For example, for faults handled by arm64's el1_abort(), I was
characterising this as:

    /* -------- "entry" begins here -------- */

    [[ entry asm ]]
    [[ early triage, branch to el1_abort() ]]

    static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr) 
    {
            unsigned long far = read_sysreg(far_el1);
            irqentry_state_t state;

            state = enter_from_kernel_mode(regs) {
                    ...
		    irqentry_enter(regs);
                    ...
	    }
            local_daif_inherit(regs); // <----------- might unmask interrupts
    /* -------- "entry" ends here ---------- */


    /* -------- "real logic" begins here --- */
            do_mem_abort(far, esr, regs);
    /* -------- "real logic" ends here ----- */


    /* -------- "exit" begins here --------- */
            local_daif_mask(); // <------------------------- masks interrupts
            exit_to_kernel_mode(regs, state) {
	            ...
		    irqentry_exit(regs);
	            ...
	    }
    }

    [[ return from el1_abort() ]]
    [[ exit asm ]]

    /* -------- "exit" ends here ----------- */

Please note, el1_abort() is indicative of what arm64 does for
(most) synchronous exceptions, but there are slight differences for
other exceptions. For anything maskable (including interupts) we DO NOT
use local_daif_inherit() and instead unmask specific higher-priority
maskable exceptions via other functions that write to DAIF, etc.

Interrupts are an odd middle ground where we use irqentry_{enter,exit}()
but do not use local_daif_inherit().

> The current sequence on entry is:
> 
>   // interrupts are disabled by interrupt/exception entry
>   enter_from_kernel_mode()
>      irqentry_enter(regs);
>      mte_check_tfsr_entry();
>      mte_disable_tco_entry();
>      daif_inherit(regs);
>      // interrupts are still disabled

That last comment isn't quite right: we CAN and WILL enable interrupts
in local_daif_inherit(), if and only if they were enabled in the context
the exception was taken from.

As mentioned above, when handling an interrupt (rather than a
synchronous exception), we don't use local_daif_inherit(), and instead
use a different DAIF function to unmask everything except interrupts.

> which then becomes:
> 
>   // interrupts are disabled by interrupt/exception entry
>   irqentry_enter(regs)
>      establish_state();
>      // RCU is watching
>      arch_irqentry_enter_rcu()
>         mte_check_tfsr_entry();
>         mte_disable_tco_entry();
>         daif_inherit(regs);
>      // interrupts are still disabled
>           
> Which is equivalent versus the MTE/DAIF requirements, no?

As above, we can't use local_daif_inherit() here because we want
different DAIF masking behavior for entry to interrupts and entry to
synchronous exceptions. While we could pass some token around to
determine the behaviour dynamically, that's less clear, more
complicated, and results in worse code being generated for something we
know at compile time.

If we can leave DAIF masked early on during irqentry_enter(), I don't
see why we can't leave all DAIF exceptions masked until the end of
irqentry_enter().

I *think* what would work for us is we could split some of the exit
handling (including involuntary preemption) into a "prepare" step, as we
have for return to userspace. That way, arm64 could handle exiting
something like:

	local_irq_disable();
	irqentry_exit_prepare(); // new, all generic logic
	local_daif_mask();
	arm64_exit_to_kernel_mode() {
		...
		irqentry_exit(); // ideally irqentry_exit_to_kernel_mode().
		...
	}

... and other architectures can use a combined exit_to_kernel_mode() (or
whatever we call that), which does both, e.g.

	// either noinstr, __always_inline, or a macro
	void irqentry_prepare_and_exit(void)
	{
		irqentry_exit_prepare();
		irqentry_exit();
	}

That way:

* There's a clear separation between the "prepare" and subsequent exit
  steps, which minimizes the risk that a change subtly breaks arm64's
  exception masking.

* This would mirror the userspace return path, and so would be more
  consistent over all.

* All of arm64's arch-specific exception masking can live in
  arch/arm64/kernel/entry-common.c, explicit in the straight line code
  rather than partially hidden behind arch_*() callbacks.

* There's no unnecessary cost to other architectures.

* There's no/minimal maintenance cost for the generic code. There are no
  arch_*() callbacks, and we'd have to enforce ordering between the
  prepare/exit steps anyhow...

If you don't see an obvious problem with that, I will go and try that
now.

> The current broken sequence vs. preemption on exit is:
> 
>   // interrupts are disabled
>   exit_to_kernel_mode
>      daif_mask();
>      mte_check_tfsr_exit();
>      irqentry_exit(regs, state);
> 
> which then becomes:
> 
>   // interrupts are disabled
>   irqentry_exit(regs, state)
>      // includes preemption
>      prepare_for_exit();
> 
>      // RCU is still watching
>      arch_irqentry_ecit_rcu()
>         daif_mask();
>         mte_check_tfsr_exit();
> 
>      if (state.exit_rcu)
>         ct_irq_exit();

As above, I'd strongly prefer if we could pull the "prepare" step out of
irqentry_exit(). Especially since for the entry path we can't push the
DAIF masking into irqentry_enter(), and I'd very strongly prefer that
the masking and unmasking occur in the same logical place, rather than
having one of those hidden behind an arch_() callback.

> Which is equivalent versus the MTE/DAIF requirements and fixes the
> preempt on exit issue too, no?
> 
> That change would be trivial enough for backporting, right?
> 
> It also prevents you from staring at the bug reports which are going to
> end up in your mailbox after I merged the patch which moves the
> misplaced rcu_irq_exit_check_preempt() check _before_ the
> preempt_count() check where it belongs.

I intend to fix that issue, so hopefully I'm not staring at those for
long.

Just to check, do you mean that you've already queued that (I didn't
spot it in tip), or that you intend to? I'll happily test/review/ack a
patch adding that, but hopefully we can fix arm64 first.

> I fully agree that ARM64 is special vs. CPU state handling, but it's not
> special enough to justify it's own semantically broken preemption logic.

Sure. To be clear, I'm not arguing for broken preemption logic. I'd
asked those initial two questions because I suspected this approach
wasn't quite right.

As above, I think we can solve this in an actually generic way by
splitting out a "prepare to exit" step, and still keep the bulk of the
logic generic.

> Looking at those details made me also look at this magic
> arch_irqentry_exit_need_resched() inline function. 

I see per your other reply that you figured out this part was ok:

  https://lore.kernel.org/linux-arm-kernel/87se9ph129.ffs@tglx/

... though I agree we can clean that up further.

Mark.

