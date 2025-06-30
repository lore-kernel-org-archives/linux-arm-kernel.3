Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A7C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXonc0KksfgcMOKjNgh+rkn7Fuh0D7ZEpOfg1sBxbSc=; b=DNWclf9fl8wpVg1hnQEqd+FGy6
	ClbKiCf401fXKvC2+ZewJCBKQNnv8uisShS8agunyZUD+BqLG9+i14X1EKUcN1V2r2/v+KmWE8tAQ
	e/F3gv5A/L5SzTMscL1PqoLROnRx1oSulCmOJOWD5ac48hKcnn+thtvxPwukUr76SOTesX1WLKB9c
	ZELQJEX8yzZcpLn7k7i+w1bBTbO2GH1GrrlBxEO8/iYH2LOKzTIQG4OpFeKvEBL7g87ql+E1rDp/S
	I/jY48m/TLYOebQmu9RZbgZLSvnOIGxXLWdUu0SYN/1ZYBtDZLV22sxNRm3Nw7pq1HZInLp/me+UV
	FHDbzjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIVO-000000036Cc-2bwM;
	Mon, 30 Jun 2025 17:41:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHIc-00000002uUQ-0p0C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 16:24:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751300642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXonc0KksfgcMOKjNgh+rkn7Fuh0D7ZEpOfg1sBxbSc=;
	b=DxdQex7A4h47bp/vTs/wSvi+EJoKciQsC/faneSoI9IaundjT1ihjXVfwkiAk0y7ZpO4DV
	aSClAYkqJx9gf2ej8TaBhBioaU3OXEHApWREQ/9CF1Fu+HrTJh426wRyAbcGdbe/NciNJN
	zUxRfPZ2xDx94lA6OJQht/J5oU0+4L+MeRo9W5Os5KQNGEJ8r0NY/MUbImFbYyEp8KSFI6
	szLMkOomImbugHzwroBwo10PzF1aMwb54sTNbKLp+h9Ydx4R7Dn8Fc03BjfIsxS4X4zpeV
	Fjz973bJxJjtkoiF4VuWoQ+Xmg2eGrCBCGOFQ+JF8cL1JboXfN67YkBjnqTObQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751300642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXonc0KksfgcMOKjNgh+rkn7Fuh0D7ZEpOfg1sBxbSc=;
	b=vlBJ+6vPAw7wT/FS5SFaJJbVEQlbqZk2uRm+Q78sgJXzy5aipZiStMNgLNeSbJbI3ODqtU
	gLhVGsirUyEzViAA==
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [PATCH v2] tracing: Fix inconsistency in irq tracking on NMIs
In-Reply-To: <20250625120823.60600-1-gmonaco@redhat.com>
References: <20250625120823.60600-1-gmonaco@redhat.com>
Date: Mon, 30 Jun 2025 18:24:02 +0200
Message-ID: <87tt3xmc4d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_092406_374612_33D2454D 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, Jun 25 2025 at 14:08, Gabriele Monaco wrote:
> The irq_enable/irq_disable tracepoints fire only when there's an actual
> transition (enabled->disabled and vice versa), this needs special care

vice versa). This needs ...

> in NMIs, as they can potentially start with interrupts already disabled.
> The current implementation takes care of this by tracking the lockdep
> state on nmi_entry as well as using the variable tracing_irq_cpu to
> synchronise with other calls (e.g. local_irq_disable/enable).
>
> This can be racy in case of NMIs when lockdep is enabled, and can lead
> to missing events when lockdep is disabled.
>
> Remove dependency on the lockdep status in the NMI common entry/exit
> code and adapt the tracing code to make sure that:
>
> - The first call disabling interrupts fires the tracepoint
> - The first non-NMI call enabling interrupts fires the tracepoint
> - The last NMI call enabling interrupts fires the tracepoint unless
>   interrupts were disabled before the NMI
> - All other calls don't fire

Please mention, that you fix the same problem in the ARM64 specific variant.

> Fixes: ba1f2b2eaa2a ("x86/entry: Fix NMI vs IRQ state tracking")
> Fixes: f0cd5ac1e4c5 ("arm64: entry: fix NMI {user, kernel}->kernel transitions")
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>
> The inconsistency is visible with the sncid RV monitor and particularly
> likely on machines with the following setup:
> - x86 bare-metal with 40+ CPUs
> - tuned throughput-performance (activating regular perf NMIs)
> - workload: stress-ng --cpu-sched 21 --timer 11 --signal 11
>
> The presence of the RV monitor is useful to see the error but it is not
> necessary to trigger it.
>
> Changes since V1:
> * Reworded confusing changelog
> * Remove dependency on lockdep counters for tracepoints
> * Ensure we don't drop valid tracepoints
> * Extend change to arm64 code
>
>  arch/arm64/kernel/entry-common.c |  5 ++---
>  kernel/entry/common.c            |  5 ++---
>  kernel/trace/trace_preemptirq.c  | 12 +++++++-----
>  3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7c1970b341b8c..7f1844123642e 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -213,10 +213,9 @@ static void noinstr arm64_exit_nmi(struct pt_regs *regs)
>  	bool restore = regs->lockdep_hardirqs;
>  
>  	ftrace_nmi_exit();
> -	if (restore) {
> -		trace_hardirqs_on_prepare();
> +	trace_hardirqs_on_prepare();
> +	if (restore)
>  		lockdep_hardirqs_on_prepare();
> -	}
>  
>  	ct_nmi_exit();
>  	lockdep_hardirq_exit();
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index a8dd1f27417cf..e234f264fb495 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -343,10 +343,9 @@ void noinstr irqentry_nmi_exit(struct pt_regs *regs, irqentry_state_t irq_state)
>  {
>  	instrumentation_begin();
>  	ftrace_nmi_exit();
> -	if (irq_state.lockdep) {
> -		trace_hardirqs_on_prepare();
> +	trace_hardirqs_on_prepare();
> +	if (irq_state.lockdep)
>  		lockdep_hardirqs_on_prepare();
> -	}
>  	instrumentation_end();
>  
>  	ct_nmi_exit();
> diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> index 0c42b15c38004..fa45474fc54f1 100644
> --- a/kernel/trace/trace_preemptirq.c
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -58,7 +58,11 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
>   */
>  void trace_hardirqs_on_prepare(void)
>  {
> -	if (this_cpu_read(tracing_irq_cpu)) {
> +	int tracing_count = this_cpu_read(tracing_irq_cpu);
> +
> +	if (in_nmi() && tracing_count > 1)
> +		this_cpu_dec(tracing_irq_cpu);

This if clause wants curly brackets and please add a comment explaining
this in_nmi() magic. Two month down the road everyone forgot including
you :)

Thanks,

        tglx

