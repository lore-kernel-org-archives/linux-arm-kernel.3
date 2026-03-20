Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB6E10987A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2F8g3RQzaMv1x1Al7qlXdh9hQ92OTI2S1ZLkWtCxmg=; b=450uvgyHU23CzoGbPtvl3RHI9R
	RcSa8Mi511vsJUJiM6Uw0B1OhWcxP9qmc8JyvRFBlXVBwThUn/uTQbMPMf9bB/pdw+W81e59hyBUn
	H+MQS1FWzS0kmNaHtnC7Dd9xiIRixJUPuLXiCb1bkcQmLzV1G25A7xlpYaK2v5DgvpSyJ7bEX5cY2
	+2K9NgljM36FtEhq9O19zG9WGBwogLweNSHWvwOGBGYZQiNiX4iKbft+uvGM3KoIlqY7crQTcoEnn
	8iWcu7xQO/oWdoyTH6byofjBO6dpHZqSMSgGbzgRz+Vtjz3ybID/AJFinZJvjbyG3TomzxYljrCG6
	Szhnmtzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cgX-0000000D7Oq-2hV6;
	Fri, 20 Mar 2026 16:26:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cgW-0000000D7OG-1BZ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1027040742;
	Fri, 20 Mar 2026 16:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AE4C4CEF7;
	Fri, 20 Mar 2026 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024010;
	bh=Mu8K4ltMOyKtrO/vxTH8fzGT8sDL87bCwkqPs4n7qOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EOd4dzPuRgAqJ6y5qEw7hANCw4SsZCxWvA62ZwvbcM253aRrtFH9DQLykfNTuAUeB
	 S8chSM/Hk44/IL0m/oycPdR3ttyYAVE495stCFIcEqB/B7XcshyCZZS9H/mJ0rjsY9
	 8bc1WpiJlwJFuuDX3lTXKz80s7bHG/LWy+dO4fDhbeziUM6wSJVhQqtlJu6dZlMm1m
	 sQF85HTtdMERsicOUm2zbh/hbLUtlbUuH8hBS+khQi1j85CAr+w3zmvIzTzGn3eqOj
	 eucvOxYam1nT++j1UzHcqnqwXHxBWd9rV1aYEZj78EGg8O8mdcYEwHTWTOzwZK1C7x
	 w7gb9ZhpHRuJw==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
In-Reply-To: <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com> <87eclek0mb.ffs@tglx>
 <ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com>
Date: Fri, 20 Mar 2026 17:26:47 +0100
Message-ID: <87341ujwl4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_092652_373921_30E03E5F 
X-CRM114-Status: GOOD (  42.12  )
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

On Fri, Mar 20 2026 at 15:37, Mark Rutland wrote:
> On Fri, Mar 20, 2026 at 03:59:40PM +0100, Thomas Gleixner wrote:
>> Why are you routing NMI like exceptions through irqentry_enter() and
>> irqentry_exit() in the first place? That's just wrong.
>
> Sorry, the above was not clear, and some of this logic is gunk that has
> been carried over unnnecessarily from our old exception handling flow.
>
> The issue with pseudo-NMI is that it uses the same exception as regular
> interrupts, but we don't know whether we have a pseudo-NMI until we
> acknowledge the event at the irqchip level. When a pseudo-NMI is taken,
> there are two possibilities:
>
> (1) The pseudo-NMI is taken from a context where interrupts were
>     *disabled*. The entry code immediately knows it must be a
>     pseudo-NMI, and we call irqentry_nmi_{enter,exit}(), NOT
>     irqentry_{enter,exit}(), treating it as an NMI.
>
>
> (2) The pseudo-NMI was taken from a context where interrupts were
>     *enabled*. The entry code doesn't know whether it's a pseudo-NMI or
>     a regular interrupt, so it calls irqentry_{enter,exit}(), and then
>     within that we'll call nmi_{enter,exit}() to transiently enter NMI
>     context.
>
> I realise this is crazy. I would love to delete pseudo-NMI.
> Unfortunately people are using it.

What is it used for?

> Putting aside the nesting here, I think it's fine to preempt upon return
> from case (2), and we can delete the logic to avoid preempting.

Correct.

>> 
>> That means at the point where irqentry_entry() is invoked, the
>> architecture side should have made sure that everything is set up for
>> the kernel to operate until irqentry_exit() returns.
>
> Ok. I think you're saying I should try:
>
> * At entry, *before* irqentry_enter():
>   - unmask everything EXCEPT regular interrupts.
>   - fix up all the necessary state.
>
> * At exception exit, *after* irqentry_exit():
>   - mask everything.
>   - fix up all the necessary state.
>
> ... right?

Yes.

>> Looking at your example:
>> 
>> > | static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>> > | {
>> > |         unsigned long far = read_sysreg(far_el1);
>> > |         irqentry_state_t state;
>> > |
>> > |         state = enter_from_kernel_mode(regs);
>> > |         local_daif_inherit(regs);
>> > |         do_mem_abort(far, esr, regs);
>> > |         local_daif_mask();
>> > |         exit_to_kernel_mode(regs, state);
>> 
>> and the paragraph right below that:
>> 
>> > Currently, the generic irq entry code will attempt to preempt from any
>> > exception under irqentry_exit() where interrupts were unmasked in the
>> > original context. As arm64's entry code will have already masked
>> > exceptions via DAIF, this results in the problems described above.
>> 
>> To me this looks like your ordering is wrong. Why are you doing the DAIF
>> inherit _after_ irqentry_enter() and the mask _before_ irqentry_exit()?
>
> As above, I can go look at reworking this. 
>
> For context, we do it this way today for several reasons, including:
>
> (1) Because some of the arch-specific bits (such as checking the TFSR
>     for MTE) in enter_from_kernel_mode() and exit_to_kernel_mode() need
>     to be done while RCU is watching, etc, but needs other exceptions
>     masked. I can look at reworking that.

Something like the below should do that for you. If you need more than
regs, then you can either stick something on your stack frame or we go
and extend irqentry_enter()/exit() with an additional argument which
allows you to hand some exception/interrupt specific cookie in. The core
code would just hand it through to arch_irqenter_enter/exit_rcu() along
with @regs. That cookie might be data or even a function pointer. The
core does not have to know about it.

> (2) To minimize the number of times we have to write to things like
>     DAIF, as that can be expensive.
>
> (3) To simplify the management of things like DAIF, so that we don't
>     have several points in time at which we need to inherit different
>     pieces of state.

The above should cover your #2/3 too, no?

> (4) Historical, as that's the flow we had in assembly, and prior to the
>     move to generic irq entry.

No comment :)

>> I might be missing something, but this smells more than fishy.
>> 
>> As no other architecture has that problem I'm pretty sure that the
>> problem is not in the way how the generic code was designed. Why?
>
> Hey, I'm not saying the generic entry code is wrong, just that there's a
> mismatch between it and what would be optimal for arm64.
>
>> Because your architecture is _not_ sooo special! :)
>
> I think it's pretty special, but not necessarily in the same sense. ;)

Hehehe.

Thanks,

        tglx
---        
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -149,6 +149,7 @@ noinstr irqentry_state_t irqentry_enter(
 		instrumentation_begin();
 		kmsan_unpoison_entry_regs(regs);
 		trace_hardirqs_off_finish();
+		arch_irqentry_enter_rcu(regs);
 		instrumentation_end();
 
 		ret.exit_rcu = true;
@@ -166,6 +167,7 @@ noinstr irqentry_state_t irqentry_enter(
 	kmsan_unpoison_entry_regs(regs);
 	rcu_irq_enter_check_tick();
 	trace_hardirqs_off_finish();
+	arch_irqentry_enter_rcu(regs);
 	instrumentation_end();
 
 	return ret;
@@ -225,6 +227,7 @@ noinstr void irqentry_exit(struct pt_reg
 		 */
 		if (state.exit_rcu) {
 			instrumentation_begin();
+			arch_irqentry_exit_rcu(regs);
 			hrtimer_rearm_deferred();
 			/* Tell the tracer that IRET will enable interrupts */
 			trace_hardirqs_on_prepare();
@@ -239,11 +242,13 @@ noinstr void irqentry_exit(struct pt_reg
 		if (IS_ENABLED(CONFIG_PREEMPTION))
 			irqentry_exit_cond_resched();
 
+		arch_irqentry_exit_rcu(regs);
 		hrtimer_rearm_deferred();
 		/* Covers both tracing and lockdep */
 		trace_hardirqs_on();
 		instrumentation_end();
 	} else {
+		arch_irqentry_exit_rcu(regs);
 		/*
 		 * IRQ flags state is correct already. Just tell RCU if it
 		 * was not watching on entry.

