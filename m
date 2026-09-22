Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA1EC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnUA/meXTogPz3GsOPNeYu661jZ5us8UlNuxG2VZ7Jg=; b=kZlWL+ny13gSNHFQG6Zlty1wfh
	Oee8tstgeznRDIDBkwkHPiwdKET3edy3eZYNadyy+OezTk4d0tuZsodk7YXAsumy/oJBOFkp7iFPr
	0us6PR7uSdxeDoStYhyjb2HBuEwgw9CtI+oIDRXzLxf9rodKb8T4FlNudBwAP0g404ywcYAbN65ip
	5MeVz7DYjfZsPgBX6CzzUMS3d3ajGwsr4RcRj4GbbboOnkp713hmgMoYcSzrbLZkfKH4BT2W2Tg8w
	1GIxWuytRwFGPTBtaVfa+lrF2EJsZW3TyHak3SqZE2/GfwKFf0Y4QlG2b2daSUb5ZzH/c/BobwVPB
	lfyQl8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wlJ-00000004ugw-0xOc;
	Tue, 22 Sep 2026 09:26:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wlI-00000004ugk-16WK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:26:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB1F040801;
	Tue, 22 Sep 2026 09:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC091F000FF;
	Tue, 22 Sep 2026 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069163;
	bh=rnUA/meXTogPz3GsOPNeYu661jZ5us8UlNuxG2VZ7Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kKEof/d/QGqqvEMieqPcq+iNbah4miWQ+uYdxMOhLMYpA+UGfhL7Rj4Zwp+2u9HzE
	 vr9LclbaTGguy8ICWkSRUpb0+uOiBBA9uEx8/DitWMMHhbIDUVYyqDXYTge07CuQYi
	 ICq9pc4ldXl82zrkQWBoiyDFCEhfwRFtDamwwtvxrawKTgjy4iTdMK2UPWySGypleG
	 OK9v9ed/WPwqqSyRCPofNx7UeEUyu672bKbH5G0HbXp6OHFlaThk/fIuL2WJSQ78OX
	 D7Y2GjecVdut0Y2AQPjA7f9E06kCgkoLp8EKs/d+HV9JCqiuu348mREXpUXdbd72gB
	 D5451IcxHeBZQ==
Date: Tue, 22 Sep 2026 11:26:00 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/13] rcu-tasks: Add a Tasks RCU implementation for
 reader-marked trampolines
Message-ID: <arJJqAjqy1dWnPkn@localhost.localdomain>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
 <20260922-b4-rcu-tasks-preempt-qs-v5-2-410f57770bad@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-2-410f57770bad@toxicpanda.com>
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

Le Tue, Sep 22, 2026 at 02:23:21AM +0000, Josef Bacik a écrit :
> Tasks RCU waits for every task to pass through a voluntary context
> switch, usermode or idle, because a preempted task might be sitting in a
> trampoline that is about to be freed and nothing marks it as such.  With
> PREEMPT_LAZY that is a poor fit for servers: cond_resched() is a no-op,
> so a CPU-bound kthread only ever leaves the CPU by preemption, and one
> such kthread holds every synchronize_rcu_tasks() caller -- ftrace and
> BPF trampoline teardown under their mutexes, the kprobe jump optimizer
> under text_mutex and cpus_read_lock() -- hostage for as long as it runs.
> 
> Following the discussion on v2, take the other road: let the
> architecture make its trampolines Tasks Trace RCU readers.  When an
> architecture selects HAVE_RCU_TRAMPOLINE_READERS it promises that every
> trampoline whose lifetime Tasks RCU guards enters rcu_read_lock_trace()
> (or its assembly equivalent) before calling out and leaves it before
> returning, so a task anywhere inside such a call-out, preempted or not,
> is an ordinary Tasks Trace reader.
> 
> That leaves the few instructions of trampoline text before the reader is
> entered and after it is left (plus, in a later patch, the bytes a kprobe
> jump optimization is about to overwrite). A task can only linger there
> by being interrupted there, and such text never calls anything that
> schedules, so instead of tracking tasks we track CPUs: every pass
> through __schedule() is a per-CPU quiescent event, except that the one
> context switch that can catch a task at an arbitrary instruction -- a
> preemption from irq exit -- first records the interrupted IP in the task
> and parks it on a per-CPU list for the duration (reusing the fields and
> lists the classic flavor keeps for its exit-path bookkeeping), and, if
> the IP is inside such "unmarked" text, puts the task on a short holdout
> list; the task takes itself off at its next context switch outside such
> a preemption or irq-exit check that finds it elsewhere. Usermode (the
> existing tick hook, or a nohz_full CPU in an RCU extended quiescent
> state) and idle count as well. rcu_tasks_trampoline_text() does the
> classification: anything outside core and module text, plus an arch hook
> for things like static ftrace stubs and return thunks.
> 
> The grace period, run by the existing rcu_tasks kthread so that
> call_rcu_tasks(), synchronize_rcu_tasks() and rcu_barrier_tasks() keep
> their names and callers, is: wait for every online CPU to context switch
> or be seen in an RCU extended quiescent state (nudging stragglers with
> resched_cpu() after a jiffy), drain the holdout list as it stood,
> synchronize_rcu_tasks_trace() for everything inside the readers, then
> one more CPU pass and drain for tasks that have since left the reader
> into the trailing instructions. That is bounded by a few jiffies,
> preempt-off latency and an SRCU grace period rather than by the longest
> stretch any task runs without sleeping, needs no per-task scan, and
> makes cond_resched_tasks_rcu_qs() unnecessary on such architectures.
> Unlike the classic flavor it also waits for an idle task caught in a
> trampoline, since an idle CPU only counts while RCU is not watching it.
> rcu_tasks_wait_irq_preempted() walks the parked lists for the one caller
> (the kprobe jump optimizer, later in the series) that makes ordinary
> text unsafe to be parked in and so has to wait out tasks that were
> preempted there before it said so.
> 
> The classic implementation is untouched and remains the default; the
> new one is built only as CONFIG_TASKS_RCU_TRAMPOLINE_READERS when the
> architecture opts in and uses the generic irq entry code, whose
> reschedule check gains the rcu_tasks_irq_resched() call.  Nothing
> selects it yet.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

One review might have fell into the cracks: https://lore.kernel.org/lkml/aqxLgT41UyA-bV5J@pavilion.home/

-- 
Frederic Weisbecker
SUSE Labs

