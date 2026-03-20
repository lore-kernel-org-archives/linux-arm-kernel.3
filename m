Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95411098793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+6XDmoOBE4a94fbtZrwArFWYGGADOf76HLZD/DE0Ac=; b=Sp4Z01h5I0Qqk19z700nltFmGY
	mfVoB+PpfbP2CD+hLx62aNaIPXPGniDq/0TsBBR3qHMBZQG0znj+pRQMf0bdOPr0rFUo5E1TmlIaN
	0e3JnQ1ioNR4Sa/lsyM3jS9f5uiYLBkEu8iFCr0uSLGBLyKVBr91RpK/1kpbgKtgA+g9eekT3sI5t
	1Z1CODbWOqGI4S/NfqZ/ISBJEOmON2MwUJHmZR02Nl2DOGc7sCRLxZJXqtQR8JsEZDOVN9Ra2+npP
	xCOza7FkEdr/FIScAL6FJPV1XDVT8qpVbqrIr0OCPs9MIFojuG6gjZUHRM0YHgFVqgvdQkZDnFj9G
	fKmN/G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bIN-0000000Cy9K-0KPM;
	Fri, 20 Mar 2026 14:57:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bIK-0000000Cy8p-0wXg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:57:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBD7165C;
	Fri, 20 Mar 2026 07:57:39 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 822B73FA1F;
	Fri, 20 Mar 2026 07:57:44 -0700 (PDT)
Date: Fri, 20 Mar 2026 14:57:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
 <87h5qak2uv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5qak2uv.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_075748_341368_17FED21D 
X-CRM114-Status: GOOD (  43.05  )
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
Cc: vladimir.murzin@arm.com, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 03:11:20PM +0100, Thomas Gleixner wrote:
> On Fri, Mar 20 2026 at 14:04, Peter Zijlstra wrote:
> > On Fri, Mar 20, 2026 at 11:30:25AM +0000, Mark Rutland wrote:
> >> Thomas, Peter, I have a couple of things I'd like to check:
> >> 
> >> (1) The generic irq entry code will preempt from any exception (e.g. a
> >>     synchronous fault) where interrupts were unmasked in the original
> >>     context. Is that intentional/necessary, or was that just the way the
> >>     x86 code happened to be implemented?
> >> 
> >>     I assume that it'd be fine if arm64 only preempted from true
> >>     interrupts, but if that was intentional/necessary I can go rework
> >>     this.
> >
> > So NMI-from-kernel must not trigger resched IIRC. There is some code
> > that relies on this somewhere. And on x86 many of those synchronous
> > exceptions are marked as NMI, since they can happen with IRQs disabled
> > inside locks etc.
> >
> > But for the rest I don't think we care particularly. Notably page-fault
> > will already schedule itself when possible (faults leading to IO and
> > blocking).
> 
> Right. In general we allow preemption on any interrupt, trap and exception
> when:
> 
>   1) the interrupted context had interrupts enabled
> 
>   2) RCU was watching in the original context
> 
> This _is_ intentional as there is no reason to defer preemption in such
> a case. The RT people might get upset if you do so.

Ok. Thanks for confirming!

As above, I'll go see what I can do to address that. I suspect I'll need
something like irqentry_exit_to_kernel_mode_prepare(), analogous to
irqentry_exit_to_user_mode_prepare(), so that the preemption can happen
before the exception masking, but the rest of the exit logic can happen
afterwards.

I know that arm64 currently uses exit_to_user_mode_prepare_legacy(), and
I want to go clean that up too. :)

> NMI like exceptions, which are not allowed to schedule, should therefore
> never go through irqentry_irq_entry() and irqentry_irq_exit().
> 
> irqentry_nmi_enter() and irqentry_nmi_exit() exist for a technical
> reason and are not just of decorative nature. :)

Sorry, I should have been clearer that I was only trying to ask about
cases where irqentry_exit() would preempt. I understand
irqentry_nmi_exit() won't preempt.

Understood and agreed for NMI!

> >> (2) The generic irq entry code only preempts when RCU was watching in
> >>     the original context. IIUC that's just to avoid preempting from the
> >>     idle thread. Is it functionally necessary to avoid that, or is that
> >>     just an optimization?
> >> 
> >>     I'm asking because historically arm64 didn't check that, and I
> >>     haven't bothered checking here. I don't know whether we have a
> >>     latent functional bug.
> >
> > Like I told you on IRC, I *think* this is just an optimization, since if
> > you hit idle, the idle loop will take care of scheduling. But I can't
> > quite remember the details here, and wish we'd have written a sensible
> > comment at that spot.
> 
> There is one, but it's obviously not detailed enough.
> 
> > Other places where RCU isn't watching are userspace and KVM. The first
> > isn't relevant because this is return-to-kernel, and the second I'm not
> > sure about.
> >
> > Thomas, can you remember?
> 
> Yes. It's not an optimization. It's a correctness issue.
> 
> If the interrupted context is RCU idle then you have to carefully go
> back to that context. So that the context can tell RCU it is done with
> the idle state and RCU has to pay attention again. Otherwise all of this
> becomes imbalanced.
> 
> This is about context-level nesting:
> 
>         ...
> L1.A    ct_cpuidle_enter();
> 
>                         -> interrupt
>  L2.A                           ct_irq_enter();
>                                 ...             // Set NEED_RESCHED
>  L2.B                           ct_irq_exit();
>                                
>         ...
> L1.B    ct_cpuidle_exit();
> 
> Scheduling between #L2.B and #L1.B makes RCU rightfully upset. 

I suspect I'm missing something obvious here:

* Regardless of nesting, I see that scheduling between L2.B and L1.B is
  broken because RCU isn't watching.

* I'm not sure whether there's a problem with scheduling between L2.A
  and L2.B, which is what arm64 used to do, and what arm64 would do
  after this patch.

I *think* I just don't understand how context tracking actually works,
so I'll go dig into that and go learn how the struct context_tracking
fields are manipulated by ct_cpuidle_{enter,exit}() and
ct_irq_{enter,exit}().

If there's something else I should go look at, please let me know!

> Think about it this way:
> 
> L1.A    preempt_disable();
> L2.A    local_bh_disable();
>         ..
> L2.B    local_bh_enable();
>         if (need_resched())
>            schedule();
> L1.B    preempt_enable();
> 
> RCU is not any different. For context-level nesting of any kind the only
> valid order is:
> 
>    L1.A -> L2.A -> L2.B -> L1.B
> 
> Pretty obvious if you actually think about it, no?

I guess I'll need to think a bit harder ;)

Thanks for all of this. Even if I'm confused right now, it's very
helpful!

Mark.

