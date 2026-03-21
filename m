Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D71094481
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 23:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVNl6yrITHMoiv+qXWxUDrsX0SwLOzhViFdJJa+mJQM=; b=Y7atruBS0kDkuDC4KaiCZRhRfm
	GIKkRsCa2kTfZdY60Dod5gupcdp9z5jMsehtgmaG4mEC/w/81gXEzyRPHAcVkJmU+oiPMCMiSQADa
	MFazIwae+DxAqg/kpiz7HgeKTp9AGiukZ1ronFwajmoPo8gratr37yyL1ZDghnzGJjYx5ZhKrzwm5
	dtEBedDuYfqH0DHYOIZSZ4mbT5hLSicKB9jJEQpdyfDHPsR/jN/uFJp7IfC6lVY7ol3i66DDh6eQh
	gJujvjLLBYZgCs27Qq453N2Tf9z5IZO/2Zdh5ZuoUgXdKw/EY66mzKPn/rhOYeTrGXtVqWtBN1UR1
	APpSkUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45gu-0000000EsGI-2xdT;
	Sat, 21 Mar 2026 23:25:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w45gt-0000000EsG5-3cRm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 23:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9952A60145;
	Sat, 21 Mar 2026 23:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2F2C19421;
	Sat, 21 Mar 2026 23:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774135510;
	bh=mF6yhrLYKrMU36jVyej2tThhdvq8vNISgwbJfS7h6w4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sZVYHxjAIZGoV+GajMxAXc1Xtp2c5p2jRbxmRCcDEmF51VQGrePbKQirSPLg1SEdi
	 1aZ9ZgFqqhpGKvqUrSOQvhF5weQnQ/20EGuN2EhU2QvK0hgg67NuMmVGMmvCsunPU0
	 taSWNlTcHqhCZUajC76sqhUlE3M5Lid4b0lPZlYeNUF//KdoSXOhcJvxQO+NKsyeTY
	 2s887/ZEgbetU7lxJefmLWf/jSkw5qVe75sjssDqmkHW8adPk2B/jMpFOTaIp1Xqo/
	 UENKfxdCDo3g3TjpcxhQKc4YQ/zizVAIxtL9nNat7FGqLGFZEDCWjrzLX1cDpsVoRJ
	 fcGWLsEHb+8NQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com> <87341ujwl4.ffs@tglx>
 <ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com>
Date: Sun, 22 Mar 2026 00:25:06 +0100
Message-ID: <87fr5six4d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Mar 20 2026 at 17:31, Mark Rutland wrote:
> On Fri, Mar 20, 2026 at 05:26:47PM +0100, Thomas Gleixner wrote:
>> > I realise this is crazy. I would love to delete pseudo-NMI.
>> > Unfortunately people are using it.
>> 
>> What is it used for?
>
> It's used where people would want an NMI; specifically today that's:
>
> * The PMU interrupt (so people can profile code that has IRQs off).
> * IPI_CPU_BACKTRACE (so we can get a backtrace when code has IRQs off).
> * IPI_CPU_STOP_NMI (so panic can stop secondaries more reliably).
> * IPI_KGDB_ROUNDUP (so KGDB can stop secondaries more reliably).
>
> I mostly care about the first two. People *really* want the PMU interrupt as an
> NMI.

Which makes actually sense.

> My other concern is that I'd like to backport a fix for the issue I
> mentioned in the commit message, and I'd like to have something that's
> simpler than "rewrite the entire entry code" for that -- for backporting
> it'd be easier to revert the move to generic irq entry.

I understand.

> Not really, but we might be talking past one another.
>
> I *think* you're saying that because the arch code would manage DAIF
> early during entry and late during exit, that would all be in one place.

That was my thought, see below.

> However, that doubles the number of times we have to write to DAIF: at
> entry we'd have to poke it once to unmask everything except IRQs, then
> again to unmask IRQs, and exit would need the inverse. We'd also have to
> split the inheritance logic into inherit-everything-but-interrupt and
> inherit-only-interrupt, which is doable but not ideal. With pseudo-NMI
> it's even worse, but that's largely because pseudo-NMI is
> over-complicated today.

Interrupts are not unmasked on interrupt/exception entry ever and I
don't understand your concerns at all, but as always I might be missing
something.

The current sequence on entry is:

  // interrupts are disabled by interrupt/exception entry
  enter_from_kernel_mode()
     irqentry_enter(regs);
     mte_check_tfsr_entry();
     mte_disable_tco_entry();
     daif_inherit(regs);
     // interrupts are still disabled

which then becomes:

  // interrupts are disabled by interrupt/exception entry
  irqentry_enter(regs)
     establish_state();
     // RCU is watching
     arch_irqentry_enter_rcu()
        mte_check_tfsr_entry();
        mte_disable_tco_entry();
        daif_inherit(regs);
     // interrupts are still disabled
          
Which is equivalent versus the MTE/DAIF requirements, no?

The current broken sequence vs. preemption on exit is:

  // interrupts are disabled
  exit_to_kernel_mode
     daif_mask();
     mte_check_tfsr_exit();
     irqentry_exit(regs, state);

which then becomes:

  // interrupts are disabled
  irqentry_exit(regs, state)
     // includes preemption
     prepare_for_exit();

     // RCU is still watching
     arch_irqentry_ecit_rcu()
        daif_mask();
        mte_check_tfsr_exit();

     if (state.exit_rcu)
        ct_irq_exit();

Which is equivalent versus the MTE/DAIF requirements and fixes the
preempt on exit issue too, no?

That change would be trivial enough for backporting, right?

It also prevents you from staring at the bug reports which are going to
end up in your mailbox after I merged the patch which moves the
misplaced rcu_irq_exit_check_preempt() check _before_ the
preempt_count() check where it belongs.

I fully agree that ARM64 is special vs. CPU state handling, but it's not
special enough to justify it's own semantically broken preemption logic.

Looking at those details made me also look at this magic
arch_irqentry_exit_need_resched() inline function. 

	/*
	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
	 * DAIF we must have handled an NMI, so skip preemption.
	 */
	if (system_uses_irq_prio_masking() && read_sysreg(daif))
		return false;

Why is this using irqentry_enter/exit() in the first place? 

NMI delivery has to go through irqentry_nmi_enter/exit() as I explained
to you before. This hack is fundamentally wrong:

 1) It fails to indicate NMI state in preempt_count and other facilities

    There is code which cares about this state. It's truly amazing that
    it did not explode in your face yet.

 2) It uses a code path which is not NMI safe by definition

    I did not go through all the gory details there, but the lack of
    explosions might be sheer luck because most of the related code is
    written in a way that it can be used in both context.

    But the pending for v7.1 hrtimer changes are going to actually
    expose this ARM64 NMI bogosity. Assume the following scenario:

    timer interrupt
       hrtimer_interrupt()
          raw_spin_lock(&cpu_base->lock);
          ...
          cpu_base->deferred_rearm = true;
    ---> NMI
      irqentry_enter();
      handle();
      irqentry_exit()
        ...
        hrtimer_rearm_deferred()
          if (!cpu_base->deferred_rearm)
             return;
          raw_spin_lock(&cpu_base->lock)
     --->    LIVELOCK

    That's code which is not upstream yet, but it was written under the
    perfectly valid assumption that architectures actually adhere to the
    mandatory interrupt/NMI destinction, which ARM64 clearly does not.

You might argue that this assumption is wrong vs. other irqentry_enter()
bound exceptions which can be raised and handled even if interrupts are
disabled, i.e. page faults, divide by zero etc.

It's not wrong at all because any of these exceptions in the context of
a interrupt handler will cause a kernel panic.

Actually thinking about that the rearm code needs to be hardened against
this by having:

         if (WARN_ON_ONCE(in_hardirq())
         	return;
Thanks,

        tglx







