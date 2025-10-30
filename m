Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27767CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwwiKmWYxoxYPefRWPFy29i8u7SbNSc1aIu3IZKTM/g=; b=m+x+o1MbtE3GcnZyfjbMlJmMd3
	huZFAOAx4vh8sNqHskMigFEdCvWOki026BQNYEkBAApH9Su4Yz1R6YnmqZeDgpGwgMjtTDgjETIQx
	UmVJh4NqAX0ubhQFW8AWSD6N/4TLSfqnjNYFXmeNXNHIudkFZR7fW79vF0XZbRmdGg9B5q3m8FyBk
	kXvKKs/XZ+clmtAiuBATn+6sjWzdqIJcYmO08Dc6yrH3/9WXH4JEGBmRH7FAMurd2l7bv3ZRuAVO2
	C2GNL0D9SXv22DO2mwpOkv/yQhrlXA4WY9E95wer+ZBHrKfYo7S0mKFO3s90mIX49VaPT4epxFeel
	413HPVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGEs-00000003HCY-2STi;
	Thu, 30 Oct 2025 00:10:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGEq-00000003HBl-3JqR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 00:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB9036021B;
	Thu, 30 Oct 2025 00:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF33C4CEFD;
	Thu, 30 Oct 2025 00:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761782999;
	bh=AceE3gCsdl1DA5X4XGmZcEf7H6HBtxryjxL7lc5Pcck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SbRGlLY+9om9klZoA9dwo0WYQHobN4e/PU1/Y8xveEi/7ZI2WDhT5chQdEcNm1QSX
	 U8hGhrLPNXFnMwwB3ACZxo2YQNKuLaIiHTcQhYxHMqxt4JoujiphZ5LBZBBhelmbUd
	 G7An3QlOisuhVQ1yrhtLK35Yq0yrOIahqOORflXgp+X4SR+NKCLqkK3hWBQanEbb2c
	 X+wCNdVumjh3z/wYYIwZCKTGlnosCMgUaPWVk/qfexbcUkj4JSOE1F2zDqdo/adp1H
	 GFrCHO9OVd0GlFFJnZxrokMcF8fueJmg23t7c2ZO327wRVhEZFzq6Ts8DIb1GBMyn6
	 r18V3ftUKJGjQ==
Date: Thu, 30 Oct 2025 09:09:52 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Brown <broonie@kernel.org>, Masami Hiramatsu
 (Google) <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 Jinchao Wang <wangjinchao600@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v5 6/8] selftests: tracing: Add a basic testcase for
 wprobe
Message-Id: <20251030090952.befea7f0cecd5518c7fda02c@kernel.org>
In-Reply-To: <20251029172004.a0aca144735f20a6a59d2aa6@kernel.org>
References: <175859019940.374439.7398451124225791618.stgit@devnote2>
	<175859026716.374439.14852239332989324292.stgit@devnote2>
	<aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk>
	<20251027224347.4c887cc956df63602f377550@kernel.org>
	<20251028084222.a3c1ae97d125d9bd88fc565b@kernel.org>
	<20251028105549.ae94e8eeb42f4efc183d2807@kernel.org>
	<20251029004219.dc9cda0eb56ae46c55855844@kernel.org>
	<20251029114317.167b7d908533385c1c9e6782@kernel.org>
	<20251029172004.a0aca144735f20a6a59d2aa6@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Oct 2025 17:20:04 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> On Wed, 29 Oct 2025 11:43:17 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > > Hmm, it seems that jiffies related things are updated frequently
> > > and it may cause interrupt storm or infinit recursive call.
> > 
> > I added another trace_printk() in el1_watchpt(). It seems el1_watchpt()
> > takes too long and there is no time to do any other things.
> > (Note the interval shown below is only within the el1_watchpt function,
> >  and in reality various processes (save/restore registers etc) for
> >  exception handling will be inserted before and after.)
> 
> Forget about this. I found the root cause. The x86 watchpoint exception
> happens after the instruction is executed, the arm64 happens before.
> 
> Thus what we need is to emulate or do single step the hooked instruction
> and restart from the next instruction from the watchpoint exception on
> arm64. I thought hw_breakpoint does that, but doesn't. Should we do this
> in do_watchpoint() or in user_handler?

There is a single step execution code but only for default overflow_handlers.
This is a bit strange becuase other users can not set it up outside of
the arch dependent code. Even if it can, it is simply redundant.

So I made changes below which allow users to set its own custom handler is
compatible with perf default overflow handlers.
I confirmed this works on both arm and arm64.

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..e12ec95b471e 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -632,6 +632,7 @@ void do_breakpoint(unsigned long esr, struct pt_regs *regs)
 	addr = instruction_pointer(regs);
 	debug_info = &current->thread.debug;
 
+	trace_printk("breakpoint exception at address: 0x%lx\n", addr);
 	for (i = 0; i < core_num_brps; ++i) {
 		rcu_read_lock();
 
@@ -661,6 +662,7 @@ void do_breakpoint(unsigned long esr, struct pt_regs *regs)
 		rcu_read_unlock();
 	}
 
+	trace_printk("breakpoint handling complete, step=%d\n", step);
 	if (!step)
 		return;
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fd1d91017b99..40dd897e26b0 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -902,6 +902,7 @@ struct perf_event {
 	u64				(*clock)(void);
 	perf_overflow_handler_t		overflow_handler;
 	void				*overflow_handler_context;
+	bool				default_overflow_compatible;
 	struct bpf_prog			*prog;
 	u64				bpf_cookie;
 
@@ -1505,13 +1506,7 @@ extern int perf_event_output(struct perf_event *event,
 static inline bool
 is_default_overflow_handler(struct perf_event *event)
 {
-	perf_overflow_handler_t overflow_handler = event->overflow_handler;
-
-	if (likely(overflow_handler == perf_event_output_forward))
-		return true;
-	if (unlikely(overflow_handler == perf_event_output_backward))
-		return true;
-	return false;
+	return event->default_overflow_compatible;
 }
 
 extern void
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 177e57c1a362..6bbbde82cb21 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12946,9 +12946,11 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	} else if (is_write_backward(event)){
 		event->overflow_handler = perf_event_output_backward;
 		event->overflow_handler_context = NULL;
+		event->default_overflow_compatible = true;
 	} else {
 		event->overflow_handler = perf_event_output_forward;
 		event->overflow_handler_context = NULL;
+		event->default_overflow_compatible = true;
 	}
 
 	perf_event__state_init(event);
diff --git a/kernel/trace/trace_wprobe.c b/kernel/trace/trace_wprobe.c
index 98605b207f43..f2c2f26fd668 100644
--- a/kernel/trace/trace_wprobe.c
+++ b/kernel/trace/trace_wprobe.c
@@ -163,6 +163,8 @@ static void wprobe_perf_handler(struct perf_event *bp,
 static int __register_trace_wprobe(struct trace_wprobe *tw)
 {
 	struct perf_event_attr attr;
+	struct perf_event *bp;
+	int cpu;
 
 	if (tw->bp_event)
 		return -EINVAL;
@@ -179,6 +181,11 @@ static int __register_trace_wprobe(struct trace_wprobe *tw)
 		tw->bp_event = NULL;
 		return ret;
 	}
+	/* Mark wprobe_perf_handler is compatible with default one. */
+	for_each_online_cpu(cpu) {
+		bp = per_cpu(*tw->bp_event, cpu);
+		bp->default_overflow_compatible = true;
+	}
 
 	return 0;
 }

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

