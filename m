Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FE5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HIb0Zr48fpHIexI58bU8KpKg1eiHR/L5Tbs/Tkn9xM=; b=v+dymQjtgDpq1iXpwl8LVyyW9m
	4mNa8HPk1LSIrMijaOM/Cfz6DPYUTQ21yWOOyL0VpANDrFpBQFntZf/krVOMq8b0EEqo1Innc13P5
	r+4J8Hdh4VHPc81V6r+B91/CUEURYLUqvIqb2WH8pFy65XbyB+ODtS0rK69epktTAWFd85QdIr/+l
	tkM5OHjt/Xqj6BdC7m+SRDI3oLX7yRl+inf8L0DCZRdWhOew4tAVrMBIubQF4CEE899PLG1e8Xz9k
	Q9rfg4FPP5uYMa0b7jxXnaMbnUu25AQSS4hyKeJqI3bzTK1D5y2rBhHRlX2fSSnHWOgTOxdRmlzvl
	y3bg7pBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbxN-00000005hcL-3dzv;
	Tue, 01 Jul 2025 14:27:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaVs-00000005Ohq-0qY6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 12:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4HIb0Zr48fpHIexI58bU8KpKg1eiHR/L5Tbs/Tkn9xM=; b=KoPp5MBrWseJ+RbevAO5vx0MwF
	w62up+Ht+FyTrHV6PZO2Ub2vXUb8mjQDwF1fKYoFfY+NPel4+3EXhM8d5bK3iu2Lnl09Or56H6P2h
	Gr5V4lWHeKHdY9lGOHaHqKJ+dmE8gxt9x6s6DAAJmlMvIhCKrSIVkzpMZT/aepRUGi1Dv3sjS3/gJ
	mmmYGtNPNvobmCsYRKMH/tKZyod6u2H2fPEt+j90ZQBRuHNj0lXn1BTuscRvMuLud4+if3WErRH2y
	/LnOylwI+qGeaIUmHLIW4x7lPZMGWdfczFjv4gkmPG1JUGqqC4OHSRvO5kw+3Hdtoa9N8WqceA9Pg
	6c1Bbrmw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaVo-000000075RC-3HBK;
	Tue, 01 Jul 2025 12:55:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CF88B30012D; Tue, 01 Jul 2025 14:54:59 +0200 (CEST)
Date: Tue, 1 Jul 2025 14:54:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing: Fix inconsistency in irq tracking on NMIs
Message-ID: <20250701125459.GL1613200@noisy.programming.kicks-ass.net>
References: <20250625120823.60600-1-gmonaco@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625120823.60600-1-gmonaco@redhat.com>
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

On Wed, Jun 25, 2025 at 02:08:22PM +0200, Gabriele Monaco wrote:
> The irq_enable/irq_disable tracepoints fire only when there's an actual
> transition (enabled->disabled and vice versa), this needs special care
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

I'm not at all convinced this is correct. Nor can I understand anything
much about what you wrote above.


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
> +	else if (tracing_count) {
>  		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>  		this_cpu_write(tracing_irq_cpu, 0);
> @@ -89,8 +93,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on);
>   */
>  void trace_hardirqs_off_finish(void)
>  {
> -	if (!this_cpu_read(tracing_irq_cpu)) {
> -		this_cpu_write(tracing_irq_cpu, 1);
> +	if (this_cpu_inc_return(tracing_irq_cpu) == 1) {
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
>  		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  	}
> @@ -103,8 +106,7 @@ void trace_hardirqs_off(void)
>  {
>  	lockdep_hardirqs_off(CALLER_ADDR0);
>  
> -	if (!this_cpu_read(tracing_irq_cpu)) {
> -		this_cpu_write(tracing_irq_cpu, 1);
> +	if (this_cpu_inc_return(tracing_irq_cpu) == 1) {
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
>  		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  	}

So what about lovely things like:

trace_hardirqs_on_prepare()
  if (tracing_irq_cpu) {
    tracer_hardirqs_on();
    <NMI>
      trace_hardirqs_off_finish();
        if (this_cpu_inc_return() == 1) // will be > 1


So now we've traced IRQs are on, start an NMI, and loose the IRQs off
event. Well done.


This was all safe in that it would occasionally emit a duplicate state,
but no state was wrong. Both your attempts have broken things.

How about you fix you tool to accept duplicate state in the face of NMI
instead?

