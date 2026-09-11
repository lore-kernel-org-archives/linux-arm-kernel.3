Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312C6C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT/8H/cMArsJRoufbqdgzsmAKwU5NTozjyFMdjWjsc8=; b=SWuw/yMq7YF5j8D2w0bvboYEoI
	Eg6kXoGGrIlxizlkGmWsfxpEY0INNYIepiqkQ2QXjFe40d0mZmOma5lunVWVQJDCzXLaHPUi69NVl
	tnhia+wj9OrIeZVRhWom2XDE4O7nZ5j+vTdsZnQ3nESESZAs6dWT4/0VsiRMQGRCiIh5tIgvh6iFw
	PN5R3KIbFJjuLxqrtrYYpxx1Gy/JvrBHOIRovll4DqnJ6+EEy9qHja6PEnK54CrdQDswHR7WOPehD
	u5cKTVPDCccWSVTje7QYGU2Eld8sFa73tZw+XSW5FVpKH9G0bi/uEx7q2p+Rrdw1y0aXMbsUlUlQt
	l0ImXMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xp-0000000Grjw-41ng;
	Fri, 11 Sep 2026 14:10:49 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xR-0000000GrU6-2j11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:27 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-90e970f710cso9909616d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135824; x=1789740624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT/8H/cMArsJRoufbqdgzsmAKwU5NTozjyFMdjWjsc8=;
        b=bdqKSBen7escjbcjXFOAcOeeBDUYscxPpt6xo/ENM1JVES6AcIVGk8sD81M4B9koS2
         tzYySPKksWFaNSqunAuvoaxynn6t+vXnOwhc0yCaSks9X1LgpehGA5c79Zh0VdKCT6po
         Xl4AxnKnRhaE8w/T+5sN0jo0kU+JmaPtdfa7ZRwSd/NHGGz3J42a+O7NUZBuUNQeamLW
         lkdAHmXdCwHI+1bgO850Zj9Q/vg/3ThR3lsDrbXbhoaGdYnhzn0uncP/eNiV9DXEKdWa
         sCmLDj8IqCIpmO25NLpOWsiniwSMvNSP4m9I9mq449qxV3kT+MmwtYjfHOvem7DL3Ote
         OGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135824; x=1789740624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT/8H/cMArsJRoufbqdgzsmAKwU5NTozjyFMdjWjsc8=;
        b=bQVHogk2rl76v3TsFHXNznrCITV4cuzb9ru9nfqdzUTMmGn+tR3uOtx1/a8cdTL7dY
         qKSsB8SAn3HbQGbC+/vF0XXFePQczo7iqwEX+TJQj5AQPpr6N9FM1bCvQHEgAZIk/8lW
         f4xu6atSmW6nEZawyVpd12hE+7NwiwaMmGswvvJuhUlzEEvFkEzO7pOPlFxFr1JXDjZD
         hoS9RM4aqztZDpY7WvHN+cA8NjqSYWosJ1OO3Ub5k6dB0iTh8jkbwON+myj5uazeqekU
         u1f1EbiwgtdrSb+wrRXmneVccTdfJZWJCswgZxP5sVzhFqjnK+72wloU1u3+rmcaculi
         8ZoA==
X-Forwarded-Encrypted: i=1; AKwUvBx+WbX/fSC0WwOg3U1UEuDTTBsWBim4BlAnpy4YPNY6JUj/6HXvWRGyf4n1ecvzd2lbdggSNSX8GQX81BgN9mdo@lists.infradead.org
X-Gm-Message-State: AFuF++l0ool+dXeKGeU6zqqZBeUlISOpRUFpVJr90LNkXyzc9UJq/tFv
	4Tm7WUu7AdSmnNpNcEKIJRAqK7K5OpR5d81AxtsAqrQv1IjaD2pWEp3qydrhwTpFnt0=
X-Gm-Gg: AYBFou2zWiAWoa0X2MSMeMIklFdfJFuEML2c8Ji4LUXirZMiN6mW9ta/Tc+NyaS/Djg
	uwiz9fh5+ooBO4fthy/W6zQcihCyf0BLXuRQvpOfujvvMFES3Prmw7dSZIHagUcF9CWdfJpyNyC
	Fz3MLJ3GRbJMk5quTwmZz/GsFKTa8BfarpDIxH9s4k2dyV1LODoLk/j18YZJ3PgdDnHkS6VTjPy
	mNe3ghsHclbLweZN/8b73L9sAiQTBHEByt92I82ZsE1q2pWonyLyn/sKagsWViZlHIQ/tcXGwHe
	dXRZ4enwziVXi7Xk7Bdc5htVSGcGlu7/5G7TMcyEXcBAv5Zio2/KNLb7+N+7gGSYEQ2DHMrF/iS
	yjQ3eE5R4fvsxbRTjMfmRSn8/Vw6XkLdirDhXaZbO8/OTybh4yLDOhGsPGeiuyfEGojj1wZxyPx
	LckTJFdPS3fowa/QSS69WEEZq9C5xAI6Lw+W/8sbmVHOi48ohTQmHBr6t9YQBpVztZOICaK2d6c
	qvCwogipgbRQzjGSdl2xgNOkCodkAGCo5QISi8+zEN3Rpf/Flg6yyh2
X-Received: by 2002:a05:620a:444d:b0:939:cab7:8651 with SMTP id af79cd13be357-939ea0cff3cmr508758285a.21.1789135824016;
        Fri, 11 Sep 2026 07:10:24 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80801c0sm248912485a.30.2026.09.11.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:22 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:51 +0000
Subject: [PATCH RFC v2 13/15] rcu-tasks: Treat preemption outside
 trampolines as a quiescent state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-13-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=13377;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=782IiL7t8C+T7tHuP+fr7fuNKyJIY5LyrSPvir4aYJ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLUZnTIeq2lPY+NhGtgUM19AxK92AiGBaR4ReDiwvRRgaRGOQrROuHTyqXvXkEa5pxrRzrRbB/J
 mvbDi+9g+vAw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071025_776199_C8FEEAD6 
X-CRM114-Status: GOOD (  24.40  )
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

Tasks RCU only accepts a voluntary context switch, usermode or idle as a
quiescent state, because a task that was preempted may be sitting in a
trampoline whose text is about to be freed.  On PREEMPT_LAZY kernels,
where cond_resched() is a no-op and CPU-bound kernel threads only ever
lose the CPU through preemption, that means any long-running kthread or
kworker stalls every synchronize_rcu_tasks() caller -- BPF and LSM
program detach and DYNAMIC ftrace_ops teardown via ftrace_shutdown(),
and kprobe (un)registration via the jump optimizer, which waits under
kprobe_mutex, text_mutex and cpus_read_lock() -- for its entire run,
unless someone sprinkles cond_resched_tasks_rcu_qs() into it.  A cgroup
writeback worker draining a large cgwb for eleven minutes was enough to
back 40+ tasks up behind trampoline_mutex and trip the hung-task panic.

With the previous patches, every Tasks-RCU-protected trampoline on
x86-64 and arm64 (ftrace_caller and its dynamic copies, BPF trampoline
images, the optprobe template, out-of-line direct trampolines) holds
current->rcu_tramp_nesting across its call-out, and the irq-exit
preemption path holds it across preempt_schedule_irq() whenever the
interrupted IP is somewhere the counter cannot cover: trampoline
entry/exit instructions and other dynamically allocated text, the static
ftrace stubs and x86 return thunks on the way into a direct-call target,
modules hosting their own direct trampolines.  The kprobe
jump-optimization window, which is ordinary text a task may have been
parked in before the kprobe existed, is instead re-checked against the
recorded irq-preemption IP at each decision (rcu_tasks_irq_ip_holds()).
A task that is context-switched with the count at zero and no such IP
therefore cannot be inside, called from, or about to resume into
anything Tasks RCU protects.

So let rcu_tasks_classic_qs() clear the holdout flag on a preemption
too when rcu_tramp_nesting is zero, on architectures that select
ARCH_HAS_RCU_TASKS_PREEMPT_QS, and select it for x86-64 and for arm64
with DYNAMIC_FTRACE_WITH_ARGS.  A running holdout is already poked via
rcu_request_urgent_qs_task(), which makes the next tick set
NEED_RESCHED; the resulting preemption -- from irq exit, or synchronously
at the next preempt_enable() -- now retires it, so a Tasks RCU grace
period is bounded by roughly a tick plus the longest preempt-disabled
section instead of by the longest stretch without a voluntary schedule().
Other architectures keep the voluntary-only rule.  Update the Tasks RCU
comments, Documentation/RCU (Requirements.rst, checklist.rst) and the
FORCE_TASKS_RCU help text to match.

Cost: one load of current plus an inc/dec per trampoline entry and exit,
and on irq-exit preemption one core_kernel_text() check plus, with
OPTPROBES, MAX_OPTIMIZED_LENGTH-1 lockless kprobe hash lookups.

Not covered: x86-32 and the other GENERIC_IRQ_ENTRY architectures, and
return_to_handler / the rethook trampoline, whose C callees take the
ftrace recursion lock before touching any ops.

Tested under QEMU (x86-64, PREEMPT_LAZY, PREEMPT_RCU=n, PROVE_RCU, with
and without PREEMPT_DYNAMIC) against a kthread spinning in-kernel for
30s with the function tracer, an ftrace kprobe, an optimized kprobe and
fentry/fexit programs live: synchronize_rcu_tasks() 29.7s -> 0.1-0.3s,
ftrace_shutdown() of a DYNAMIC ops 27s -> 0.2-0.8s, the ftrace-direct
sample modules load/fire/unload in ~2.5s each during the spin, no
warnings.  arm64 is build-tested only.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 .../RCU/Design/Requirements/Requirements.rst       | 28 ++++++++++++++++------
 Documentation/RCU/checklist.rst                    |  8 ++++++-
 arch/arm64/Kconfig                                 |  1 +
 arch/x86/Kconfig                                   |  1 +
 include/linux/rcupdate.h                           | 15 +++++++++++-
 kernel/rcu/Kconfig                                 |  7 +++---
 kernel/rcu/tasks.h                                 | 15 ++++++++----
 7 files changed, 59 insertions(+), 16 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 8101fe6229d5..428b5e8f4b4e 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -2739,13 +2739,27 @@ userspace execution also delimit tasks-RCU read-side critical sections.
 Idle tasks are ignored by Tasks RCU, and Tasks Rude RCU may be used to
 interact with them.
 
-Note well that involuntary context switches are *not* Tasks-RCU quiescent
-states.  After all, in preemptible kernels, a task executing code in a
-trampoline might be preempted.  In this case, the Tasks-RCU grace period
-clearly cannot end until that task resumes and its execution leaves that
-trampoline.  This means, among other things, that cond_resched() does
-not provide a Tasks RCU quiescent state.  (Instead, use rcu_softirq_qs()
-from softirq or rcu_tasks_classic_qs() otherwise.)
+Note well that, by default, involuntary context switches are *not*
+Tasks-RCU quiescent states.  After all, in preemptible kernels, a task
+executing code in a trampoline might be preempted.  In this case, the
+Tasks-RCU grace period clearly cannot end until that task resumes and its
+execution leaves that trampoline.  This means, among other things, that
+cond_resched() does not provide a Tasks RCU quiescent state.  (Instead,
+use rcu_softirq_qs() from softirq or rcu_tasks_classic_qs() otherwise.)
+
+Architectures that select ``CONFIG_ARCH_HAS_RCU_TASKS_PREEMPT_QS`` relax
+this: there, every trampoline whose lifetime Tasks RCU guards (the ftrace
+and BPF trampolines, optprobe slots, out-of-line ftrace direct-call
+trampolines) increments ``current->rcu_tramp_nesting`` before calling out
+and decrements it before returning, and the irq-exit preemption path
+covers the few instructions the counter cannot (see
+rcu_tasks_ip_in_trampoline() and rcu_tasks_irq_ip_holds()).  A task that
+is preempted with that count at zero is therefore known not to be in, or
+called from, any trampoline, and such a preemption *is* a Tasks-RCU
+quiescent state.  The obligation moves to the trampolines: anything that
+relies on synchronize_rcu_tasks() to protect code a task may be preempted
+in must maintain the count (see register_ftrace_direct()), or Tasks RCU
+will not wait for it on those architectures.
 
 The tasks-RCU API is quite compact, consisting only of
 call_rcu_tasks(), synchronize_rcu_tasks(), and
diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
index 4b30f701225f..28df48fecac7 100644
--- a/Documentation/RCU/checklist.rst
+++ b/Documentation/RCU/checklist.rst
@@ -252,7 +252,13 @@ over a rather long period of time, but improvements are always welcome!
 	a.	If the updater uses synchronize_rcu_tasks() or
 		call_rcu_tasks(), then the readers must refrain from
 		executing voluntary context switches, that is, from
-		blocking.
+		blocking.  On architectures that select
+		CONFIG_ARCH_HAS_RCU_TASKS_PREEMPT_QS an involuntary
+		context switch is also a quiescent state unless
+		current->rcu_tramp_nesting is non-zero, so a reader
+		there is a trampoline that maintains that count (see
+		rcu_tasks_trampoline_enter()), not an arbitrary
+		stretch of kernel code.
 
 	b.	If the updater uses call_rcu_tasks_trace()
 		or synchronize_rcu_tasks_trace(), then the
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..0e6c1e0b236f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -44,6 +44,7 @@ config ARM64
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RCU_TASKS_PREEMPT_QS if DYNAMIC_FTRACE_WITH_ARGS
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..0a6427019345 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -99,6 +99,7 @@ config X86
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RCU_TASKS_PREEMPT_QS	if X86_64
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_NONLEAF_PMD_YOUNG	if PGTABLE_LEVELS > 2
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 4cfe096d624f..9509f99ec965 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -210,6 +210,11 @@ bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
  * preemption and rcu_tasks_irq_ip_holds() checks it at every quiescent-state
  * decision, locally and from the grace-period kthread.
  *
+ * With both in place, on architectures that select
+ * ARCH_HAS_RCU_TASKS_PREEMPT_QS, a preemption with rcu_tramp_nesting == 0 is
+ * a Tasks RCU quiescent state, and a CPU-bound kernel thread no longer needs
+ * to volunteer one via cond_resched_tasks_rcu_qs().
+ *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
  */
@@ -241,9 +246,17 @@ static __always_inline void rcu_tasks_note_irq_ip(unsigned long ip)
 	WRITE_ONCE(current->rcu_tasks_irq_ip, ip);
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+#define rcu_tasks_preempt_is_qs(t)					\
+	(!READ_ONCE((t)->rcu_tramp_nesting) && !rcu_tasks_irq_ip_holds(t))
+#else
+#define rcu_tasks_preempt_is_qs(t)	false
+#endif
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
-		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
+		if (READ_ONCE((t)->rcu_tasks_holdout) &&		\
+		    (!(preempt) || rcu_tasks_preempt_is_qs(t)))		\
 			WRITE_ONCE((t)->rcu_tasks_holdout, false);	\
 	} while (0)
 void call_rcu_tasks(struct rcu_head *head, rcu_callback_t func);
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 999f8228a13d..8e7c94329105 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -94,9 +94,10 @@ config FORCE_TASKS_RCU
 	default n
 	help
 	  This option force-enables a task-based RCU implementation
-	  that uses only voluntary context switch (not preemption!),
-	  idle, and user-mode execution as quiescent states.  Not for
-	  manual selection in most cases.
+	  that uses only voluntary context switch (not preemption, unless
+	  the architecture selects ARCH_HAS_RCU_TASKS_PREEMPT_QS and the
+	  task is outside any trampoline), idle, and user-mode execution
+	  as quiescent states.  Not for manual selection in most cases.
 
 config NEED_TASKS_RCU
 	bool
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 1b9fe1bfa591..bab08a666dc0 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -905,7 +905,10 @@ static void rcu_tasks_wait_gp(struct rcu_tasks *rtp)
 //
 // Simple variant of RCU whose quiescent states are voluntary context
 // switch, cond_resched_tasks_rcu_qs(), user-space execution, and idle.
-// As such, grace periods can take one good long time.  There are no
+// With CONFIG_RCU_TASKS_PREEMPT_QS, a preemption taken while the task is
+// not inside a trampoline (current->rcu_tramp_nesting == 0, see
+// rcu_tasks_trampoline_enter()) is a quiescent state as well; without it,
+// grace periods can take one good long time.  There are no
 // read-side primitives similar to rcu_read_lock() and rcu_read_unlock()
 // because this implementation is intended to get the system into a safe
 // state for some of the manipulations involved in tracing and the like.
@@ -1263,8 +1266,11 @@ static void tasks_rcu_exit_stall(struct timer_list *unused)
  * period elapses, in other words after all currently executing rcu-tasks
  * read-side critical sections have completed. call_rcu_tasks() assumes
  * that the read-side critical sections end at a voluntary context
- * switch (not a preemption!), cond_resched_tasks_rcu_qs(), entry into idle,
- * or transition to usermode execution.  As such, there are no read-side
+ * switch, cond_resched_tasks_rcu_qs(), entry into idle, transition to
+ * usermode execution, or, with CONFIG_RCU_TASKS_PREEMPT_QS, a preemption
+ * taken outside any trampoline (current->rcu_tramp_nesting == 0, see
+ * rcu_tasks_trampoline_enter()); otherwise a preemption is not a
+ * quiescent state.  As such, there are no read-side
  * primitives analogous to rcu_read_lock() and rcu_read_unlock() because
  * this primitive is intended to determine that all tasks have passed
  * through a safe state, not so much for data-structure synchronization.
@@ -1286,7 +1292,8 @@ EXPORT_SYMBOL_GPL(call_rcu_tasks);
  * executing rcu-tasks read-side critical sections have elapsed.  These
  * read-side critical sections are delimited by calls to schedule(),
  * cond_resched_tasks_rcu_qs(), idle execution, userspace execution, calls
- * to synchronize_rcu_tasks(), and (in theory, anyway) cond_resched().
+ * to synchronize_rcu_tasks(), (in theory, anyway) cond_resched(), and,
+ * with CONFIG_RCU_TASKS_PREEMPT_QS, preemption outside any trampoline.
  *
  * This is a very specialized primitive, intended only for a few uses in
  * tracing and other situations requiring manipulation of function

-- 
2.55.0


