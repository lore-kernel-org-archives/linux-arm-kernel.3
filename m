Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4145FC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G8Y9/xY0kMl88nV4+aK7L6N6EzC6UwclJFLiIWbzwM=; b=Sa7iYNOnDS9XQPsekhGPmLdhHU
	RAbYkA6Q7p8+NdiAgTYyUxoPLwBUa3mEEDKPDt42q6Gwt1q7veq4bfHmHCqa5kt0kv3shCZvhFtN/
	+YwYpFZGprI7JmbMT+d81Z00nNn6CGFofw2S317Yl17DcAB94IXumPoFMtJZj+ZIuXbN5iM847ASd
	q2G2CLNKHveCas0ljvmFdsw9FNBkyFx0de/pQ8sR0TA+PCY+d4fB+OQMSxNfEvmZASgPzbXAtZRDj
	E/o9Y83iWrJzVpbpDBgcgGcc8Jucx7k5Go3NqU/OZsqItdqs9vgmlTHmwRghrcXfPe+nIZTBp0bWl
	hpzFry1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kgX-0000000FGlP-3DZg;
	Thu, 10 Sep 2026 19:43:49 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4kgV-0000000FGkJ-0CRV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:43:48 +0000
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 39693160690;
	Thu, 10 Sep 2026 19:43:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 30FD46000B;
	Thu, 10 Sep 2026 19:43:32 +0000 (UTC)
Date: Thu, 10 Sep 2026 15:44:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri
 Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Andy Lutomirski <luto@kernel.org>, Josh
 Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, Juergen Gross
 <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 00/13] rcu-tasks: let preemption outside trampolines
 be a quiescent state
Message-ID: <20260910154450.7b770882@gandalf.local.home>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 30FD46000B
X-Stat-Signature: q4rice5dx4toq6agt9e6os3uux3h5f5q
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/TvSOAPfmV5w9v9DlVemvWAF7fAQiQXhI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=0G8Y9/xY0kMl88nV4+aK7L6N6EzC6UwclJFLiIWbzwM=; b=XDaxsPusoW6gsn6QQqwKwtOsezn5XGTPhAZBWTmLI2a3wTTy4g9M8GxTBfx7IxRyYNyRuYQGkIUa70KldFVZ7BxD/P2CsoJAlMMiCFX8YSS1drmpdXopT7vrVM/O17FPu1+y62DsM8b0wE++rILKnKFPiYk8n6rvTHLZaMP183M=
X-HE-Tag: 1789069412-378097
X-HE-Meta: U2FsdGVkX1+2Ct3iQoLtuMkYa1cI50miBEnTqrhRYa+BXsr0BkuI+iyjkwhW+Ob8C5dT11n+jxKJvSyznZnLsxh0O/QKV9P9WQecOj/+21jACCNK26r6q8zwQqBN/ayZXuQ+GMG++J9Taw+/zJCowVnrggoyzv6dApRYuUizRVkjRykDXYfNTF0KQwLTeMZALOSsT8m10cqWJg1D25InukFaP+COzppk9X5R5JJAc9OQyO5V0RV7ia7UcNgjuOHSeTTxARbLsAo0lo+Cw5KvWdAoNn3RpyiQlWsoqM2E7xoqV45XznycLnrdwTWnybGDasUZEZxhn2u7O6k5MAY1bcSxESD/EVVf6gvruYYB/+VKBnRpc7lRNYR8i0iaqzQA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_124347_289248_6E8F7E7D 
X-CRM114-Status: GOOD (  42.74  )
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

On Thu, 10 Sep 2026 18:50:23 +0000
Josef Bacik <josef@toxicpanda.com> wrote:

> Tasks RCU only treats a voluntary context switch, usermode or idle as a
> quiescent state, because a preempted task may be sitting in a trampoline
> that is about to be freed. That was a fine trade when PREEMPT_NONE
> servers compiled Tasks RCU away and PREEMPT desktops rarely ran
> long-lived in-kernel loops. PREEMPT_LAZY changes both halves at once:
> Tasks RCU is now real on server configs, and cond_resched() is a no-op,
> so a CPU-bound kthread or kworker only ever loses the CPU by being
> preempted, which is exactly the event Tasks RCU refuses to count.
> 
> The way this showed up for us was a cgroup writeback worker draining a
> very large cgwb for around eleven minutes on an arm64 box. Nothing wrong

So you have a kernel thread running for 11 minutes without a schedule?

You could still put in a cond_resched_tasks_rcu_qs() in that loop. But I
guess you are trying to get rid of doing that too.

> with that on its own, but a BPF program detach on another CPU went
> bpf_trampoline_update() -> ftrace_shutdown() -> synchronize_rcu_tasks()
> while holding trampoline_mutex, forty-odd tasks piled up behind the
> mutex, and the hung task detector panicked the machine. The kprobe jump
> optimizer is worse in principle: it does synchronize_rcu_tasks() under
> kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
> kthread can stall static key updates and CPU hotplug for its whole run.
> The current answer is to find each such loop and add
> cond_resched_tasks_rcu_qs() to it, which is the kind of annotation
> PREEMPT_LAZY was supposed to let us stop writing.
> 
> This series tries the other direction: have the trampolines say when a
> task is inside them, so that a preemption anywhere else can be a
> quiescent state.
> 
>  - task_struct grows an int, rcu_tramp_nesting. Every trampoline whose
>    lifetime Tasks RCU guards increments it before calling out and
>    decrements it before returning: ftrace_caller and its dynamic copies,
>    the BPF trampoline (which drops it again around the call to the
>    original function, since im->pcref covers that), the x86 optprobe
>    template, and out-of-line register_ftrace_direct() trampolines. Only
>    current writes it and nested users are balanced, so it is a plain
>    non-atomic inc/dec, one load of current plus one RMW per entry/exit.
> 
>  - The inc/dec are inside the trampoline, so there is a window of a few
>    instructions on each side where the count is zero but the task is in
>    (or on its way into) trampoline text. Nothing there can be preempted
>    synchronously, only from an interrupt, so the irq-exit preemption path
>    looks at regs->ip and holds the count across preempt_schedule_irq()
>    when the IP is somewhere the counter cannot cover: outside core and
>    module text (all the dynamically allocated trampolines and slots), in
>    the static ftrace stubs or the x86 return thunks that still hold a
>    direct-call target, in a module that hosts its own direct trampoline,
>    or inside the bytes after a kprobe that the jump optimizer may be
>    about to rewrite (the one synchronize_rcu_tasks() user that is not
>    about trampolines at all).

So basically if the preemption happens outside of core or module text
(which should be the case of any dynamically allocated trampoline), the
task is marked to be in the grace period across its schedule, so that the
RCU_TASK cannot move forward?

> 
>  - With those in place, rcu_tasks_classic_qs() also clears the holdout
>    flag on a preemption when the count is zero, on architectures that
>    opt in. x86-64 and arm64 do so here. Everyone else keeps the
>    voluntary-only rule and is untouched apart from the (unused) field.
> 
> A running holdout already gets poked via rcu_request_urgent_qs_task(),
> which makes the next tick set NEED_RESCHED, so with this the resulting
> preemption retires it and a Tasks RCU grace period is bounded by roughly
> a tick plus the longest preempt-off section rather than by the longest
> stretch without a voluntary schedule().
> 
> Patches 1-12 are scaffolding and change no behaviour on their own; patch
> 13 flips the rule and selects the option for the two architectures.
> 
> Testing so far is QEMU only: x86-64, PREEMPT_LAZY with PREEMPT_RCU=n,
> PROVE_RCU and lockdep, with and without PREEMPT_DYNAMIC. A kthread
> spinning in-kernel for 30s with the function tracer, an ftrace kprobe,
> an optimized kprobe and fentry/fexit programs attached:
> synchronize_rcu_tasks() goes from 29.7s to 0.1-0.3s, tearing down a
> DYNAMIC ftrace_ops (tracefs instance function -> nop) from 27s to
> 0.2-0.8s, and the ftrace-direct sample modules load, fire and unload in
> about 2.5s each while the spinner runs, with no warnings and the new
> return-to-user assertion quiet. arm64 is build-tested only at this
> point; real hardware numbers for both are the obvious next step and I
> did not want to sit on the idea waiting for them.
> 
> Things I would particularly like opinions on:
> 
>  - Whether hooking rcu_tasks_classic_qs() is the right place, or whether
>    Paul would rather see this expressed differently inside Tasks RCU.
>  - return_to_handler and the rethook/kretprobe trampolines are not
>    instrumented. Their C callees take the ftrace recursion lock before
>    touching any ops and the trampolines themselves are static text, so I
>    believe they do not need it, but I would like Steven and Masami to
>    confirm.

Note, there has been some work in the past (and may happen again in the
future) that will remove the preempt_disable() from the trace_recursion
locking. If that happens, then I believe the trace_recursion would need to
increment (and decrement) your counter. Probably need a comment there to
let whomever know about it if they decide to remove the preempt_disable().

>  - The register_ftrace_direct() contract change: out-of-line direct
>    trampolines now have to maintain the count themselves (the samples
>    are converted). I do not know of out-of-tree users beyond BPF, but
>    this is the one place an existing user could be silently weakened.
>  - Whether arm64 folks are comfortable with the ldr/add/str in
>    ftrace_caller and the BPF trampoline, and with treating all of
>    ftrace_caller as trampoline text for the IP check.
>  - If this holds up, cond_resched_tasks_rcu_qs() and
>    rcu_softirq_qs_periodic() become unnecessary on the opted-in
>    architectures; I have not touched them here.

I don't know. It may work, but I have a feeling there's a devil in the
details here that is waiting to bite us in the underside when we are not
(RCU) watching.

-- Steve

