Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C171098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3q1TEqM8eWWYRQEuvnbrkwxjZzJy8sIF20cXbbeOwY=; b=sSP+Rmrmj4QUN0RZRaymaYscj8
	rG67LzZjdLgQqQkkYpqWHRDMlz4yw9+8AXL3xm779Ok5k8CDpMozXUGbT4BulCrQ3Tght3S/ncUjC
	5MW03hAUcDzZpvmJBStdb7vwDvXXmTFzYw4PNO6rSclBUMH7ljCSEw9q9Gr7+k/Ifo5Safs39/934
	q7CgvTvGbNSjyinEpEYg+4uUljFfozO0+CHS8ykeILgYRxAPXmbYH5XgQCKL56JpcBs33LBGyJrQb
	hTXpJTDJ/Iirczab6kY3WSUNEZmll6wl/OsEnlr9arqEswRLb6eZB30ty6T7Uqt4ltyPrwpOI8vBL
	95D2aKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKI-0000000CyLg-1gUi;
	Fri, 20 Mar 2026 14:59:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKC-0000000CyKM-31O5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 086EA418E7;
	Fri, 20 Mar 2026 14:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1ACC4CEF7;
	Fri, 20 Mar 2026 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774018783;
	bh=IVpPNHfkLUbMPsPANZapGtUdJtqu1A8En+bmgRYI8EI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JD74K33Be/loKb4BxBCWk+8FFV/CgPpMoGi/jRSoSW2G0urmWnLOexw3e9Chuhu9B
	 yzPbO1NNkmEkPZEHqmxG2JB6DxZ33xfJrLdbj5/dEgUCB1Y+j4cm5KMKOFFensvNK7
	 Y/1mWK53pHXUxRg8NyufxRHYAMrp597lEvWWY2KKRQP2O0A8TgAT4/tkCSPs0a3m3/
	 G2EtymEQh+eUQ5LmsKviKSZOgWf3X/ZLXqs1o7DyBClsnPDH4jTFjdlHXDhf7S9Sd0
	 1YAQzALBNRymNnKGJXnXigb3lPXcwpdHQ0KPUCREOuBO2mlP0FFCVDUWW2/QYgn9ct
	 tChTMF5opRxVQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <20260320113026.3219620-2-mark.rutland@arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
Date: Fri, 20 Mar 2026 15:59:40 +0100
Message-ID: <87eclek0mb.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_075944_799323_A076503D 
X-CRM114-Status: GOOD (  39.89  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20 2026 at 11:30, Mark Rutland wrote:
> We can fix this relatively simply by moving the preemption logic out of
> irqentry_exit(), which is desirable for a number of other reasons on
> arm64. Context and rationale below:
>
> 1) Architecturally, several groups of exceptions can be masked
>    independently, including 'Debug', 'SError', 'IRQ', and 'FIQ', whose
>    mask bits can be read/written via the 'DAIF' register.
>
>    Other mask bits exist, including 'PM' and 'AllInt', which we will
>    need to use in future (e.g. for architectural NMI support).
>
>    The entry code needs to manipulate all of these, but the generic
>    entry code only knows about interrupts (which means both IRQ and FIQ
>    on arm64), and the other exception masks aren't generic.

Right, but that's what the architecture specific parts are for.

> 2) Architecturally, all maskable exceptions MUST be masked during
>    exception entry and exception return.
>
>    Upon exception entry, hardware places exception context into
>    exception registers (e.g. the PC is saved into ELR_ELx). Upon
>    exception return, hardware restores exception context from those
>    exception registers (e.g. the PC is restored from ELR_ELx).
>
>    To ensure the exception registers aren't clobbered by recursive
>    exceptions, all maskable exceptions must be masked early during entry
>    and late during exit. Hardware masks all maskable exceptions
>    automatically at exception entry. Software must unmask these as
>    required, and must mask them prior to exception return.

That's not much different from any other architecture.

> 3) Architecturally, hardware masks all maskable exceptions upon any
>    exception entry. A synchronous exception (e.g. a fault on a memory
>    access) can be taken from any context (e.g. where IRQ+FIQ might be
>    masked), and the entry code must explicitly 'inherit' the unmasking
>    from the original context by reading the exception registers (e.g.
>    SPSR_ELx) and writing to DAIF, etc.

The amount of mask bits/registers is obviously architecture specific,
but conceptually it's the same everywhere.

> 4) When 'pseudo-NMI' is used, Linux masks interrupts via a combination
>    of DAIF and the 'PMR' priority mask register. At entry and exit,
>    interrupts must be masked via DAIF, but most kernel code will
>    mask/unmask regular interrupts using PMR (e.g. in local_irq_save()
>    and local_irq_restore()).
>
>    This requires more complicated transitions at entry and exit. Early
>    during entry or late during return, interrupts are masked via DAIF,
>    and kernel code which manipulates PMR to mask/unmask interrupts will
>    not function correctly in this state.
>
>    This also requires fairly complicated management of DAIF and PMR when
>    handling interrupts, and arm64 has special logic to avoid preempting
>    from pseudo-NMIs which currently lives in
>    arch_irqentry_exit_need_resched().

Why are you routing NMI like exceptions through irqentry_enter() and
irqentry_exit() in the first place? That's just wrong.

> 5) Most kernel code runs with all exceptions unmasked. When scheduling,
>    only interrupts should be masked (by PMR pseudo-NMI is used, and by
>    DAIF otherwise).
>
> For most exceptions, arm64's entry code has a sequence similar to that
> of el1_abort(), which is used for faults:
>
> | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
> | {
> |         unsigned long far = read_sysreg(far_el1);
> |         irqentry_state_t state;
> |
> |         state = enter_from_kernel_mode(regs);
> |         local_daif_inherit(regs);
> |         do_mem_abort(far, esr, regs);
> |         local_daif_mask();
> |         exit_to_kernel_mode(regs, state);
> | }
>
> ... where enter_from_kernel_mode() and exit_to_kernel_mode() are
> wrappers around irqentry_enter() and irqentry_exit() which perform
> additional arm64-specific entry/exit logic.
>
> Currently, the generic irq entry code will attempt to preempt from any
> exception under irqentry_exit() where interrupts were unmasked in the
> original context. As arm64's entry code will have already masked
> exceptions via DAIF, this results in the problems described above.

See below.

> Fix this by opting out of preemption in irqentry_exit(), and restoring
> arm64's old behaivour of explicitly preempting when returning from IRQ
> or FIQ, before calling exit_to_kernel_mode() / irqentry_exit(). This
> ensures that preemption occurs when only interrupts are masked, and
> where that masking is compatible with most kernel code (e.g. using PMR
> when pseudo-NMI is in use).

My gut feeling tells me that there is a fundamental design flaw
somewhere and the below is papering over it.

> @@ -497,6 +497,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>  	do_interrupt_handler(regs, handler);
>  	irq_exit_rcu();
>  
> +	irqentry_exit_cond_resched();
> +
>  	exit_to_kernel_mode(regs, state);
>  }
>  static void noinstr el1_interrupt(struct pt_regs *regs,
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index 9ef63e4147913..af9cae1f225e3 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -235,8 +235,10 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
>  		}
>  
>  		instrumentation_begin();
> -		if (IS_ENABLED(CONFIG_PREEMPTION))
> +		if (IS_ENABLED(CONFIG_PREEMPTION) &&
> +		    !IS_ENABLED(CONFIG_ARCH_HAS_OWN_IRQ_PREEMPTION)) {

These 'But my architecture is sooo special' switches cause immediate review
nausea and just confirm that there is a fundamental flaw somewhere else.

>  			irqentry_exit_cond_resched();

Let's look at how this is supposed to work. I'm just looking at
irqentry_enter()/exit() and not the NMI variant.

Interrupt/exception is raised

  1) low level architecture specific entry code does all the magic state
     saving, setup etc.

  2) irqentry_enter() is invoked

      - checks for user mode or kernel mode entry

      - handles RCU on enter from user and if kernel entry hits the idle
        task

      - Sets up lockdep, tracing, kminsanity

  3) the interrupt/exception handler is invoked

  4) irqentry_exit() is invoked

      - handles exit to user and exit to kernel

      - exit to user handles the TIF and other pending work, which can
        schedule and then prepares for return

      - exit to kernel

        When interrupt were disabled on entry, it just handles RCU and
        returns.

        When enabled on entry, it checks whether RCU was watching on
        entry or not. If not it tells RCU that the interrupt nesting is
        done and returns. When RCU was watching it can schedule
 
  5) Undoes #1 so that it can return to the originally interrupted
     context.

That means at the point where irqentry_entry() is invoked, the
architecture side should have made sure that everything is set up for
the kernel to operate until irqentry_exit() returns.

Looking at your example:

> | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
> | {
> |         unsigned long far = read_sysreg(far_el1);
> |         irqentry_state_t state;
> |
> |         state = enter_from_kernel_mode(regs);
> |         local_daif_inherit(regs);
> |         do_mem_abort(far, esr, regs);
> |         local_daif_mask();
> |         exit_to_kernel_mode(regs, state);

and the paragraph right below that:

> Currently, the generic irq entry code will attempt to preempt from any
> exception under irqentry_exit() where interrupts were unmasked in the
> original context. As arm64's entry code will have already masked
> exceptions via DAIF, this results in the problems described above.

To me this looks like your ordering is wrong. Why are you doing the DAIF
inherit _after_ irqentry_enter() and the mask _before_ irqentry_exit()?

I might be missing something, but this smells more than fishy.

As no other architecture has that problem I'm pretty sure that the
problem is not in the way how the generic code was designed. Why?

Because your architecture is _not_ sooo special! :)

Thanks,

        tglx

