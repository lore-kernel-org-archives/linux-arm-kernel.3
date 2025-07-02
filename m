Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0740EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10CYibGvwIVYchOvUOxwjyPV91vxtw5BqVOM0fUyS28=; b=Rmey7xs5UlvR5Ieij2YXtd2hBF
	DyiTWuRlEeVmhDSiAB5QVOg9bfbNtq8WCziecrLDQpKbrZV6xm6Rkkj/v9y2utrxTzQ2t/Px7GVeA
	mV5JVpT82yPbpzwIpuC4gwx+8nZDV44zUKdbbYIZc3ij/ZpV6s4HGhuSEfY5Ic3khc+C/LmlvAMhn
	TTo0aD7LMx3htWoRoygIXo/Y8asldIEBmYLq2H8U28TLqBgiJ4s2oEWNOh6AqEuuglc4MrOCj5Ecy
	2ej53fU3OWu/dCWUyJcG2thWNK028SRS1GZeEmFo0qdRoom4SAU3hZ7UAqlkGh+g7FAmYTwumTd3M
	dlIAw27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuN2-00000007tJo-47ar;
	Wed, 02 Jul 2025 10:07:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtwJ-00000007nrM-11lE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:39:40 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751449177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10CYibGvwIVYchOvUOxwjyPV91vxtw5BqVOM0fUyS28=;
	b=DADx7Gs5oChS8tz124E7PgQoyjZN6PFOt4xrJCp3IqgpGjjCcEC5wYQyUQRUMjZf40GGtd
	7+o2D0aaPfDvvMnZxlGuhwqZfMHc/MjsHF/bn3YTBPhaD9J1sP7pxpDE92CKIwJKalhrsF
	S231rF82KkiFdKdaZsK8Ubl4tM+TWB5FuWXcTdgo/XGhYO+RDMlwxoq03lZLxjgeZNdswe
	M8PcHw4GMz+LIGmpReA+V8d2XAyKB7X+LSo9IxVsQ9crJJx/uJSfevHeKTpxBGQlFCMqQ8
	dBLVOa5OlWGb+B13Xq8S+Y2YlLBKmxsBLO4QGSV34yQlzcSj6tWDMkNPHO0V3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751449177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10CYibGvwIVYchOvUOxwjyPV91vxtw5BqVOM0fUyS28=;
	b=+Fnw+crHy4xmKh/dT5Ygf/U+FvNoiyjfkNEflf8c5EM8g/kWZhBsHHPEN5bLiR0h4eM84O
	qN71oJUcjhDkrRDg==
To: Gabriele Monaco <gmonaco@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Andy
 Lutomirski <luto@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing: Fix inconsistency in irq tracking on NMIs
In-Reply-To: <5097b17cc506af60ca718aba5a0a10e0fda01440.camel@redhat.com>
References: <20250625120823.60600-1-gmonaco@redhat.com>
 <20250701125459.GL1613200@noisy.programming.kicks-ass.net>
 <5097b17cc506af60ca718aba5a0a10e0fda01440.camel@redhat.com>
Date: Wed, 02 Jul 2025 11:39:37 +0200
Message-ID: <87cyajkk2u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_023939_424436_FAA26E1C 
X-CRM114-Status: GOOD (  20.31  )
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

On Wed, Jul 02 2025 at 09:18, Gabriele Monaco wrote:
> On Tue, 2025-07-01 at 14:54 +0200, Peter Zijlstra wrote:
> I could probably only fix this without even considering NMIs when
> interrupts are disabled, but I believe if that happens, the tracepoints
> would report something wrong, since using tracing_irq_cpu alone does:
>
> local_irq_disable -> trace_irq_off
>   nmi_enter -> no trace
>   nmi_exit -> trace_irq_on
>   // here interrupts are still off, aren't they?
> local_irq_enable -> no trace
>
> The idea that I described poorly, was to use tracing_irq_cpu in a way
> that the first context disabling interrupts fires the tracepoint
> (current behaviour), but when it's time to enable interrupts, an NMI
> which didn't disable interrupts shouldn't trace but let the next
> context trace.
...
> [1] - https://lore.kernel.org/lkml/87sejup1fe.ffs@tglx

As I told you before:

 "As you correctly described, the two states are asynchronous in the
  context of NMIs, so the obvious thing is to treat them as seperate
  entities so that the trace really contains the off/on events
  independent of lockdep enablement and lockdep's internal state. No?"

So I would have expected that you look at the lockdep implementation and
figure out why that one works correctly. Let's have a look at it:

nmi_entry()
   irq_state.lockdep = lockdep_hardirqs_enabled();

   lockdep_hardirqs_off(CALLER_ADDR0);
   ...
   return irq_state;

nmi_exit(irq_state)

   if (irq_state.lockdep)
	lockdep_hardirqs_on(CALLER_ADDR0);

On NMI entry the internal state of lockdep tracking is recorded and
lockdep_hardirqs_off() handles a redundant off gracefully. As I said it
might be arguable to invoke it only when irq_state.lockdep == true, but
that's a cosmetic or performance issue not a correctness problem.

On NMI exit lockdep_hardirqs_on() is only invoked when the lockdep internal
state at entry was 'enabled' so it can restore the state correctly.

If you model the tracer exactly the same way:

   irq_state.lockdep = lockdep_hardirqs_enabled();
   irq_state.tracer = tracer_hardirqs_enabled();
   ....

   You get the idea...

That will be "correct" in terms of sequencing depending on your trace side
implementation:

  trace_hardirqs_off()
        if (trace_hardirqs_enabled()) {
        	trace_irqs_enabled = false;     // A
                emit_trace(OFF);	        // B

If the NMI hits before A, everything is fine because it will record a
ON->OFF transition on NMI entry and a OFF->ON transition on NMI
exit. Then the interrupted context records a ON->OFF transition again.

If it hits between A and B, then the NMI tracing wont do anything
because enabled state is already false, but the resulting trace
sequencing is messed up:

     irqs on
     ...
     nmi_entry
     nmi_exit
     irqs off

IOW, it misses the ON->OFF OFF->ON transitions in the NMI.

So you want to do it the other way round:

  trace_hardirqs_off()
        if (trace_hardirqs_enabled()) {
                emit_trace(OFF);	        // A
        	trace_irqs_enabled = false;     // B

If the NMI hits before A, everything is fine because it will record a
ON->OFF transition on NMI entry and a OFF->ON transition on NMI
exit. Then the interrupted context records a ON->OFF transition again.

If it hits between A and B then you get a duplicate

     irqs on
     ...
     irqs off
     nmi_entry
     irqs off
     irqs on
     nmi_exit

There is nothing you can do about it, but that's easy enough to filter
out, no?

I'm pretty sure you can figure out how that should be modeled on the
on() side of affairs.

Thanks,

        tglx

