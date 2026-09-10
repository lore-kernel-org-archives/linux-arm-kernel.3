Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B22C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz6PHByUgP1AVWjuJD1V+UfaCDrDqHgI9zDHmq+c8Zw=; b=SDkT80VZ+5kiMn9AgrYUIEKdPl
	i6cog9XSTeLeEiqTcQ1y7PVThHBhoU071rLFeKPtc5SWoAbK+Q+UijYzAWtclvsBB3lM4zHyXy3Kn
	UZ0cYJychLUzDPQy5p0DUqHGR0DoHmtwMoXOxFHDT/bEixLNDw4/jBOeIEnYNx89yOPEFmJ6vdptI
	7fjjEBpY8Mq5vxZixNapB2lepXDWz/y2hUwFOZnsrOk9tT3HANmLOlmt+4DPckh6+PyG+AzdZPDrX
	xcS6q40mGIIUBWolWULjVt8trvSHE64ai46Wn+YVlDig4OLVavrCr0S9w9cDTrM8d9k3jsw7ikp9X
	fZLTGN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nkF-0000000FVYG-2EMW;
	Thu, 10 Sep 2026 22:59:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nkE-0000000FVXu-1LWx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 22:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B712C43C48;
	Thu, 10 Sep 2026 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAED1F000FF;
	Thu, 10 Sep 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081189;
	bh=xz6PHByUgP1AVWjuJD1V+UfaCDrDqHgI9zDHmq+c8Zw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=hU0ytUBbxQNF/Ko7N4RIPT+JpPrgy8HZNvPMTUrRfxisMxs5GCtiCGdeUFowkvPdK
	 gIqFbvrR4RjOl9bLAeekCSVXFxuJFuWmJdZjFTcs1Drp4EGBGmfsQ6bly0WhLbGsJk
	 YVi2xQANuoU42iGwEFZTYbC3tkBpj/y6afENFzesX5gYoNUgfdpCroQNA3NKNXitbd
	 95cHu9S6+S8rC+OkT9IXy2r7sLCQ+ukD8hNx7p4T/moocJkTDYjo9NBYlWjNnnRTWR
	 rkZt/TbetwuCw7Ke6a6H2HBqDZ1YQoHH+zwt9DAHhIVGSL3kGJiBBiHt0ZpRENDNG/
	 0oc4cpzesfhWg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 54E1CCE19CD; Thu, 10 Sep 2026 15:59:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:59:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 00/13] rcu-tasks: let preemption outside trampolines
 be a quiescent state
Message-ID: <eef8c574-2360-4a5b-8fe8-628f8dfa269a@paulmck-laptop>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
 <20260910154450.7b770882@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910154450.7b770882@gandalf.local.home>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2026 at 03:44:50PM -0400, Steven Rostedt wrote:
> On Thu, 10 Sep 2026 18:50:23 +0000
> Josef Bacik <josef@toxicpanda.com> wrote:
> 
> > Tasks RCU only treats a voluntary context switch, usermode or idle as a
> > quiescent state, because a preempted task may be sitting in a trampoline
> > that is about to be freed. That was a fine trade when PREEMPT_NONE
> > servers compiled Tasks RCU away and PREEMPT desktops rarely ran
> > long-lived in-kernel loops. PREEMPT_LAZY changes both halves at once:
> > Tasks RCU is now real on server configs, and cond_resched() is a no-op,
> > so a CPU-bound kthread or kworker only ever loses the CPU by being
> > preempted, which is exactly the event Tasks RCU refuses to count.
> > 
> > The way this showed up for us was a cgroup writeback worker draining a
> > very large cgwb for around eleven minutes on an arm64 box. Nothing wrong
> 
> So you have a kernel thread running for 11 minutes without a schedule?

We have seen this from time to time here as well.

> You could still put in a cond_resched_tasks_rcu_qs() in that loop. But I
> guess you are trying to get rid of doing that too.

And we have done this a few times, but if this proves to be an acceptable
alternative, that would be wonderful.  ;-)

> > with that on its own, but a BPF program detach on another CPU went
> > bpf_trampoline_update() -> ftrace_shutdown() -> synchronize_rcu_tasks()
> > while holding trampoline_mutex, forty-odd tasks piled up behind the
> > mutex, and the hung task detector panicked the machine. The kprobe jump
> > optimizer is worse in principle: it does synchronize_rcu_tasks() under
> > kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
> > kthread can stall static key updates and CPU hotplug for its whole run.
> > The current answer is to find each such loop and add
> > cond_resched_tasks_rcu_qs() to it, which is the kind of annotation
> > PREEMPT_LAZY was supposed to let us stop writing.
> > 
> > This series tries the other direction: have the trampolines say when a
> > task is inside them, so that a preemption anywhere else can be a
> > quiescent state.
> > 
> >  - task_struct grows an int, rcu_tramp_nesting. Every trampoline whose
> >    lifetime Tasks RCU guards increments it before calling out and
> >    decrements it before returning: ftrace_caller and its dynamic copies,
> >    the BPF trampoline (which drops it again around the call to the
> >    original function, since im->pcref covers that), the x86 optprobe
> >    template, and out-of-line register_ftrace_direct() trampolines. Only
> >    current writes it and nested users are balanced, so it is a plain
> >    non-atomic inc/dec, one load of current plus one RMW per entry/exit.
> > 
> >  - The inc/dec are inside the trampoline, so there is a window of a few
> >    instructions on each side where the count is zero but the task is in
> >    (or on its way into) trampoline text. Nothing there can be preempted
> >    synchronously, only from an interrupt, so the irq-exit preemption path
> >    looks at regs->ip and holds the count across preempt_schedule_irq()
> >    when the IP is somewhere the counter cannot cover: outside core and
> >    module text (all the dynamically allocated trampolines and slots), in
> >    the static ftrace stubs or the x86 return thunks that still hold a
> >    direct-call target, in a module that hosts its own direct trampoline,
> >    or inside the bytes after a kprobe that the jump optimizer may be
> >    about to rewrite (the one synchronize_rcu_tasks() user that is not
> >    about trampolines at all).
> 
> So basically if the preemption happens outside of core or module text
> (which should be the case of any dynamically allocated trampoline), the
> task is marked to be in the grace period across its schedule, so that the
> RCU_TASK cannot move forward?

If I understand correctly, the difference with Josef's patch is
that rcu_tasks_classic_qs(current, true), when called without the
direct or indirect aid of a trampoline, will provide an RCU Tasks
quiescent state.  In contrast, without Josef's patch, no call to
rcu_tasks_classic_qs(current, true) will provide such a quiescent state.

More to the point, because rcu_tasks_classic_qs(current, false) is
invoked from rcu_note_context_switch(), any preemption to kernel code not
within or called from a trampoline will now provide a quiescent state.
Keeping in mind that cond_resched() is treated as a preemption, this
change could potentially greatly reduce the need for sprinkling calls
to cond_resched_tasks_rcu_qs() throughout the kernel.  (Except that
the call to cond_resched() has to actually invoke the scheduler for
anything to happen.)

Which, if it works, would of course be a good thing.  ;-)

> >  - With those in place, rcu_tasks_classic_qs() also clears the holdout
> >    flag on a preemption when the count is zero, on architectures that
> >    opt in. x86-64 and arm64 do so here. Everyone else keeps the
> >    voluntary-only rule and is untouched apart from the (unused) field.
> > 
> > A running holdout already gets poked via rcu_request_urgent_qs_task(),
> > which makes the next tick set NEED_RESCHED, so with this the resulting
> > preemption retires it and a Tasks RCU grace period is bounded by roughly
> > a tick plus the longest preempt-off section rather than by the longest
> > stretch without a voluntary schedule().
> > 
> > Patches 1-12 are scaffolding and change no behaviour on their own; patch
> > 13 flips the rule and selects the option for the two architectures.
> > 
> > Testing so far is QEMU only: x86-64, PREEMPT_LAZY with PREEMPT_RCU=n,
> > PROVE_RCU and lockdep, with and without PREEMPT_DYNAMIC. A kthread
> > spinning in-kernel for 30s with the function tracer, an ftrace kprobe,
> > an optimized kprobe and fentry/fexit programs attached:
> > synchronize_rcu_tasks() goes from 29.7s to 0.1-0.3s, tearing down a
> > DYNAMIC ftrace_ops (tracefs instance function -> nop) from 27s to
> > 0.2-0.8s, and the ftrace-direct sample modules load, fire and unload in
> > about 2.5s each while the spinner runs, with no warnings and the new
> > return-to-user assertion quiet. arm64 is build-tested only at this
> > point; real hardware numbers for both are the obvious next step and I
> > did not want to sit on the idea waiting for them.
> > 
> > Things I would particularly like opinions on:
> > 
> >  - Whether hooking rcu_tasks_classic_qs() is the right place, or whether
> >    Paul would rather see this expressed differently inside Tasks RCU.

We might well need more:

o	The rcu_tasks_pertask() might need to check to see if task "t"
	is in a quiescent state.  The task_call_func() function might
	be helpful in safely accessing that task's state remotely in
	the common case where the task is blocked or preempted.

o	Given a task that runs for a very long time on a CPU that has
	nothing else to do (so that cond_resched() does nothing and
	there are no preemptions), and does so in a code path that never
	invokes cond_resched_tasks_rcu_qs(), it might be necessary to IPI
	to CPU that this task is running on.  Or to invoke resched_cpu()
	in order to force a context switch on that CPU, whether it needs
	one or not.  (Which makes the scheduler do the IPI for us.)

o	PREEMPT_RT kernels might want memory ordering on the nesting count
	increments and decrements, along with READ_ONCE() and WRITE_ONCE()
	or similar, in order to avoid the aforementioned IPIs.  But this
	increases overhead, so !PREEMPT_RT kernels would *not* want this.

And probably other things that I am not yet seeing.  ;-)

> >  - return_to_handler and the rethook/kretprobe trampolines are not
> >    instrumented. Their C callees take the ftrace recursion lock before
> >    touching any ops and the trampolines themselves are static text, so I
> >    believe they do not need it, but I would like Steven and Masami to
> >    confirm.
> 
> Note, there has been some work in the past (and may happen again in the
> future) that will remove the preempt_disable() from the trace_recursion
> locking. If that happens, then I believe the trace_recursion would need to
> increment (and decrement) your counter. Probably need a comment there to
> let whomever know about it if they decide to remove the preempt_disable().
> 
> >  - The register_ftrace_direct() contract change: out-of-line direct
> >    trampolines now have to maintain the count themselves (the samples
> >    are converted). I do not know of out-of-tree users beyond BPF, but
> >    this is the one place an existing user could be silently weakened.
> >  - Whether arm64 folks are comfortable with the ldr/add/str in
> >    ftrace_caller and the BPF trampoline, and with treating all of
> >    ftrace_caller as trampoline text for the IP check.
> >  - If this holds up, cond_resched_tasks_rcu_qs() and
> >    rcu_softirq_qs_periodic() become unnecessary on the opted-in
> >    architectures; I have not touched them here.
> 
> I don't know. It may work, but I have a feeling there's a devil in the
> details here that is waiting to bite us in the underside when we are not
> (RCU) watching.

Well, that is RCU for you!  ;-)

							Thanx, Paul

