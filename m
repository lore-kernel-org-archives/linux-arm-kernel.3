Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839F7CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NXGmGXAhzufjE2WXuYgrhg2tIz1+eqndfL3/qHkLVjs=; b=0Q/MpnA9kCkpzC
	VJAK+jeM3wGGM1z7/jw3Bky39qgRPhKh0H5ROuu4d8tgKILtm8obMGAIS09uIRinw5/kYfNc1vV7i
	76WgR5aMe+rm7Ji3EMhsL1DLi9OjnS5moWCI16POKIX2EI26G0Ne/NAaIi3+WbqCNG80leV4eDCMq
	3qC0AM/YenV3N0DQ8uDG7zFwghMkpTfSKdhnwgxePaE7001eB05wlLyIiAEDgL1DSXfATY0eQm4Ch
	SHp3Fq1ULPxlMU3zKdnSJ3L3Q2WSyyFlm2Wt29SyL/IskkiAHkjncZjYreH/lBz1d0x75a+jfw+H7
	2tq5+JMSdT0yAertjtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbJq-000000048XU-0eCi;
	Tue, 29 Sep 2026 17:08:42 +0000
Received: from mail-qk2-x2b.google.com ([2607:f8b0:4864:34::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbJm-000000048Wv-49ON
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:08:40 +0000
Received: by mail-qk2-x2b.google.com with SMTP id af79cd13be357-93c67dc382cso305718385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701717; x=1791306517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NXGmGXAhzufjE2WXuYgrhg2tIz1+eqndfL3/qHkLVjs=;
        b=YvkCbZq8m+I2C4EpHow4JLTwOfpBUz3wnLWmJOgdiuOD+IM8pBhWuKPN0XrXXHj3Cu
         mypxBWoSLrawbQKmox4rim36zWbsW7ioj7A9W/QYtif1YcgZQMHn/v+oMSYYUrg0alSE
         L8wei680vfQ0/XjX9t/GYrwsv+yMdODkiBVXJXeS8fFrhx2sQHO9oo+WDor4JdUbjPjx
         SXOA7b9KlBjV5WMqklOVRszvZwBXisqk+J5KNl/kCaIhRNhHzl3fKJ2CMwyAVJ0pWN3/
         jT8zRuHtB3mp0Vu1d1fbqKeIKAH80/XIJwRn/Aw2XuVoonnyMxpHOM4e//pTZ7lHlnDW
         fK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701717; x=1791306517;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NXGmGXAhzufjE2WXuYgrhg2tIz1+eqndfL3/qHkLVjs=;
        b=kD9mgRkJ8X6vbyGWvghyAee4c2E2Qfhtk5A4NTlzJ2BHAqOO+PDGFECFzgp7eMtnWd
         rqWfv2MjtX9u3OtbsH+VcFvmPRGcYdiPTJrpNsroeuer8wm6fYeQnKXdVz5WZ0kewzIy
         RE85+PaXxKiGqKGlDaOpxxJtn5zaS2TkTJBTz4QYpnz84VmpFGPmI3EYs6DORuBK/rA3
         Z6LUpRIP2KgmwOnV6qBp74XitPFoOZRw/2A9td0TXSoyuUq7ZCBbvb884/7kTGLP3WmH
         GbqtsWt0O1TX5Cwz3zFOOHDfc7GxAb3iIic8u4p7N+kuzvCIUaTiA7hAx6+oOG0XdrRQ
         0cMw==
X-Forwarded-Encrypted: i=1; AKwUvBy4TfvrtTnbsUui5dln3hZ/xQdLbaEhlw2Z/4AnOm9M8fZzjaDJGhXrk005mxU4QYPEkMrAZReageWXDR2pRsVG@lists.infradead.org
X-Gm-Message-State: AFuF++nSnOskVtcLhqkQHvrLuvj/WZlXR42rbeRseMV8wruQBFSNt/Kb
	I8dSVF4ygqV4O4INPFLz8ujNW+697HYM1HeD1NCfbMAa2ETU20v9GSFHIRnvYD0+dEM=
X-Gm-Gg: AYBFou0NJSsYLP5E8igtNaK+z3RzLaF6TrzIbeHi9nEh5Nk/4X+07hluaYA/mTct8iZ
	XyUCnMLiMwiFI6pkgrAP+k66AvVfLpqWla8yl6U/seH6Rgsw94728PnIsRR9rbe4guun+/jZZkN
	+2MXBo0470HgPHdNgvYuDP+VZY00DvzpqDEYjt0k7sruxiyTzyllk9rJzYXlZX9oDP7IEwo2U4P
	V9H02UyKIjbTO4IAbFNu0tYtuKuDxUj8sTFmPHPq7vzkPy1VMTHIFW3rxN/Z96nzUSzA4SnZsew
	a18fnwJf1BRU+ovcmOaIrkf4Mg2/V/cDPi8JkLuxQktgyw+PxxDA5yE7h5c3SdxQXzIJP4JI93A
	MGWyAkkgSJwB3/lFhU+NtgHx8ncuPnzwFGVbbdtqGLuW4J8fbtop4N8h8tADBTUwgJyOW/KlWWA
	tzz+JG1vtP1Ewv1bReJJgSroznPFpJY22CUAelf+kyxsACdif9hovnGN95fIdmn69t7eXugwZBM
	MFgg/3rp1eEBw8=
X-Received: by 2002:a05:620a:2988:b0:939:1864:343e with SMTP id af79cd13be357-93c9fb8ed6amr19965085a.40.1790701716969;
        Tue, 29 Sep 2026 10:08:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f4601a9sm15957985a.13.2026.09.29.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:08:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH v6 00/14] rcu-tasks: build Tasks RCU on Tasks Trace readers
 in trampolines
Date: Tue, 29 Sep 2026 17:07:17 +0000
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbwu2oC/4XPwU7EIBAG4FfZcBYX6ECtJ9/DeJjC4KK7bYVus
 2bTdxfqpYltPP4D8/FzZ4lioMSeD3cWaQop9F0O5uHA7Am7d+LB5cyUUEY0UvAWeLRXPmL6THy
 IRJdh5F+Jg5Degwajbc3ydj7y4bbIr2+/OV3bD7Jj4cqNFhPxNmJnT2V0Ho4tHJfh1gNl4xTS2
 Mfvpewki/x/r0lywR2AaTxYK4V8GftbsAN2Dh9tf2Gl3KTWmNzHVMYIEY0kpxzCJlatMb2PVRk
 T6CphwWqiehODNfa0j0HGTOUFNc40xmx/U68wpfYxnTGQwuu6rkWL7g82z/MPFmPAxTsCAAA=
X-Change-ID: 20260910-b4-rcu-tasks-preempt-qs-401ff45465c7
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=14794;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=x05sLz026DuYGlUHpgPWY+eL4sujIHS80K0KlkZowcs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKojAkS12poS7JsTmhTE5Kqm+Meq6titsqb3cAPUtExA0/WxS02Nd+sjslEIG5dow4LDijv6NHR
 OSqbdwM07Pwc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100839_122664_60CA4BE2 
X-CRM114-Status: GOOD (  29.39  )
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

v1: https://lore.kernel.org/all/20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com/
v2: https://lore.kernel.org/all/20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com/
v3: https://lore.kernel.org/all/20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com/
v4: https://lore.kernel.org/all/20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com/
v5: https://lore.kernel.org/all/20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com/

v5->v6:
- New 1/14: let TASKS_TRACE_RCU_NO_MB's ARCH_WANTS_NO_INSTR default apply
  without RCU_EXPERT; before it every reader here carried two smp_mb()s on
  a normal config.
- Bare-metal numbers (Graviton4, Ice Lake) below and in the arch patches,
  including Alexei's suggested C-helper placement for BPF (Masami, Alexei).
- irq-exit hook is now just the IP store plus the text check, no per-CPU
  list; rcu_tasks_wait_irq_preempted() scans the task list and the classic
  exit lists instead (Frederic).
- x86: also treat the FineIBT-BHI __bhi_args thunks as trampoline text,
  since a struct_ops trampoline's CFI preamble calls them before it can
  take its reader (BPF CI bot).
- Rename rcu_tasks_trace_assert_idle() to _assert_not_held(); consolidate
  the kprobe_optimizer_waiting comments (BPF CI bot).
v4->v5:
- Dropped the RFC tag.
- JIT emitters: *_off naming and offsetof() for the srcu_ctr counters
  instead of hardcoded 0/8 (Alexei); note the open-coded copies at
  rcu_read_lock_trace().
v3->v4:
- BPF: the reader is emitted by the x86-64/arm64 JIT around the
  fentry/fmod_ret and fexit regions instead of taken in the C glue (Alexei).
- An idle CPU only counts as quiescent while in an RCU EQS (Sashiko).
- Dropped the rcu_read_lock_trace() lockdep/inline patch; BPF CI bot nits.
v2->v3:
- Reworked per Alexei and Paul: trampolines take rcu_read_lock_trace(),
  and Tasks RCU on x86-64/arm64 becomes a per-CPU pass plus a Tasks Trace
  grace period instead of a new per-task counter.
v1->v2:
- Sashiko/AI review fixes, Paul's and Steve's comments (see v2 changelog).

What it does now:

Every trampoline whose lifetime Tasks RCU guards (ftrace_caller and its
copies, the optprobe template, BPF trampolines, out-of-line direct-call
trampolines) takes rcu_read_lock_trace() around its call-out, open-coded
in asm / by the JIT. That leaves the few trampoline instructions outside
the reader, the static ftrace stubs and x86 return thunks that carry a
trampoline address, and the kprobe jump-optimization window. A task can
only linger in those by being interrupted there, so on x86-64 and arm64
the Tasks RCU grace period becomes: wait for every CPU to pass through
__schedule() or sit in an EQS (the irq-exit preemption checks the
interrupted IP first and briefly makes a task caught in such text a
holdout), then synchronize_rcu_tasks_trace(), then one more pass for the
trailing instructions. It runs from the existing rcu_tasks kthread, so
call_rcu_tasks() and friends keep their names and callers; there is no
task-list scan and no dependence on voluntary context switches, and
cond_resched_tasks_rcu_qs() becomes unnecessary there. Other
architectures keep the classic implementation.

Testing, on bare metal this time (KVM guests, 4 vCPUs, on an AWS
Graviton4 c8gd.metal-24xl and an Ice Lake 8375C c6id.metal), PREEMPT_LAZY
with PREEMPT_RCU=n. Functional, with PROVE_RCU and lockdep:
synchronize_rcu_tasks() against a 30s in-kernel spinner goes from 29.6s
to 60/316ms (arm64, plain loop / spinlock loop) and 29.5s to 18/100ms
(x86-64); ftrace instance teardown, optprobe register+unregister, the
direct-call samples and fentry/fexit attach+detach all complete in well
under a second with the spinner running; no warnings, return-to-user
reader assertion quiet.

Cost of the readers, as getppid() ns/call with things attached to
__do_sys_getppid, no lockdep, CONFIG_TASKS_TRACE_RCU_NO_MB=y (median of 6
runs of 5s, base -> this series; "C" is the same with the BPF reader taken
in __bpf_tramp_enter/exit + before/after-orig-call helpers as Alexei
suggested, instead of emitted by the JIT):

                   Graviton4                  Xeon 8375C
                   base   series   C          base   series   C
  nothing          87.0    87.8   87.7        70.3    70.5   69.8
  function tracer 103.7   105.6  105.9        87.2    88.0   88.2
  kprobe event    215.5   215.6  216.4       119.9   123.2  124.7
  fentry          101.3   109.7  111.3        77.0    77.9   78.3
  fexit           118.8   136.2  139.3        78.4    80.7   80.5
  fentry+fexit    134.1   151.0  154.5        83.2    85.6   85.5

So roughly 1ns per lock/unlock pair on x86-64 and 2ns (ftrace_caller) to
8.5ns (BPF trampoline) on arm64, where it is dominated by the LL/SC
per-CPU increment; fexit has two pairs (the arm64 kprobe is BRK-based
and does not go through a trampoline, hence no change there). The
C-helper placement is never
cheaper and costs an extra 1.5-3.5ns on arm64, so v6 keeps the reader in
the JIT; happy to switch if the lockdep visibility is judged worth it.
Without 1/14 (i.e. with the smp_mb()s) the same table read +10-12ns per
pair on both machines, which is what a distro config got until now.

Notes:
 - This is the alternate-gp_func-on-the-rcu_tasks-kthread form; folding
   the IP check into core RCU along the lines Frederic sketched is left as
   the follow-on Paul suggested.
 - The open-coded reader is ~9 instructions each side in ftrace_caller and
   at four points in the BPF trampoline. rcu_read_lock_tasks_trace() would
   be shorter but needs a slot for the cookie; also a possible follow-on.

--- Original email (v1) ---

Tasks RCU only treats a voluntary context switch, usermode or idle as a
quiescent state, because a preempted task may be sitting in a trampoline
that is about to be freed. That was a fine trade when PREEMPT_NONE
servers compiled Tasks RCU away and PREEMPT desktops rarely ran
long-lived in-kernel loops. PREEMPT_LAZY changes both halves at once:
Tasks RCU is now real on server configs, and cond_resched() is a no-op,
so a CPU-bound kthread or kworker only ever loses the CPU by being
preempted, which is exactly the event Tasks RCU refuses to count.

The way this showed up for us was a cgroup writeback worker draining a
very large cgwb for around eleven minutes on an arm64 box. Nothing wrong
with that on its own, but a BPF program detach on another CPU went
bpf_trampoline_update() -> ftrace_shutdown() -> synchronize_rcu_tasks()
while holding trampoline_mutex, forty-odd tasks piled up behind the
mutex, and the hung task detector panicked the machine. The kprobe jump
optimizer is worse in principle: it does synchronize_rcu_tasks() under
kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
kthread can stall static key updates and CPU hotplug for its whole run.
The current answer is to find each such loop and add
cond_resched_tasks_rcu_qs() to it, which is the kind of annotation
PREEMPT_LAZY was supposed to let us stop writing.

This series tries the other direction: have the trampolines say when a
task is inside them, so that a preemption anywhere else can be a
quiescent state.

 - task_struct grows an int, rcu_tramp_nesting. Every trampoline whose
   lifetime Tasks RCU guards increments it before calling out and
   decrements it before returning: ftrace_caller and its dynamic copies,
   the BPF trampoline (which drops it again around the call to the
   original function, since im->pcref covers that), the x86 optprobe
   template, and out-of-line register_ftrace_direct() trampolines. Only
   current writes it and nested users are balanced, so it is a plain
   non-atomic inc/dec, one load of current plus one RMW per entry/exit.

 - The inc/dec are inside the trampoline, so there is a window of a few
   instructions on each side where the count is zero but the task is in
   (or on its way into) trampoline text. Nothing there can be preempted
   synchronously, only from an interrupt, so the irq-exit preemption path
   looks at regs->ip and holds the count across preempt_schedule_irq()
   when the IP is somewhere the counter cannot cover: outside core and
   module text (all the dynamically allocated trampolines and slots), in
   the static ftrace stubs or the x86 return thunks that still hold a
   direct-call target, in a module that hosts its own direct trampoline,
   or inside the bytes after a kprobe that the jump optimizer may be
   about to rewrite (the one synchronize_rcu_tasks() user that is not
   about trampolines at all).

 - With those in place, rcu_tasks_classic_qs() also clears the holdout
   flag on a preemption when the count is zero, on architectures that
   opt in. x86-64 and arm64 do so here. Everyone else keeps the
   voluntary-only rule and is untouched apart from the (unused) field.

A running holdout already gets poked via rcu_request_urgent_qs_task(),
which makes the next tick set NEED_RESCHED, so with this the resulting
preemption retires it and a Tasks RCU grace period is bounded by roughly
a tick plus the longest preempt-off section rather than by the longest
stretch without a voluntary schedule().

Patches 1-12 are scaffolding and change no behaviour on their own; patch
13 flips the rule and selects the option for the two architectures.

Testing so far is QEMU only: x86-64, PREEMPT_LAZY with PREEMPT_RCU=n,
PROVE_RCU and lockdep, with and without PREEMPT_DYNAMIC. A kthread
spinning in-kernel for 30s with the function tracer, an ftrace kprobe,
an optimized kprobe and fentry/fexit programs attached:
synchronize_rcu_tasks() goes from 29.7s to 0.1-0.3s, tearing down a
DYNAMIC ftrace_ops (tracefs instance function -> nop) from 27s to
0.2-0.8s, and the ftrace-direct sample modules load, fire and unload in
about 2.5s each while the spinner runs, with no warnings and the new
return-to-user assertion quiet. arm64 is build-tested only at this
point; real hardware numbers for both are the obvious next step and I
did not want to sit on the idea waiting for them.

Things I would particularly like opinions on:

 - Whether hooking rcu_tasks_classic_qs() is the right place, or whether
   Paul would rather see this expressed differently inside Tasks RCU.
 - return_to_handler and the rethook/kretprobe trampolines are not
   instrumented. Their C callees take the ftrace recursion lock before
   touching any ops and the trampolines themselves are static text, so I
   believe they do not need it, but I would like Steven and Masami to
   confirm.
 - The register_ftrace_direct() contract change: out-of-line direct
   trampolines now have to maintain the count themselves (the samples
   are converted). I do not know of out-of-tree users beyond BPF, but
   this is the one place an existing user could be silently weakened.
 - Whether arm64 folks are comfortable with the ldr/add/str in
   ftrace_caller and the BPF trampoline, and with treating all of
   ftrace_caller as trampoline text for the IP check.
 - If this holds up, cond_resched_tasks_rcu_qs() and
   rcu_softirq_qs_periodic() become unnecessary on the opted-in
   architectures; I have not touched them here.

Based on v7.3-rc2+ (893e11787f78).

---
Josef Bacik (14):
      rcu-tasks-trace: Let TASKS_TRACE_RCU_NO_MB default on without RCU_EXPERT
      entry: Pass pt_regs to irqentry_exit_cond_resched()
      rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
      kprobes: Expose the optprobe jump window to Tasks RCU
      ftrace: Mark modules hosting direct-call trampolines for Tasks RCU
      x86/ftrace: Take a Tasks Trace reader around ftrace_caller's call-out
      x86/kprobes: Take a Tasks Trace reader in the optprobe template
      bpf, x86: Take a Tasks Trace reader in the trampoline around its call-outs
      arm64: ftrace: Take a Tasks Trace reader around ftrace_caller's call-out
      bpf, arm64: Take a Tasks Trace reader in the trampoline around its call-outs
      samples: ftrace: Make the direct-call trampolines Tasks Trace readers
      rcutorture: Make Tasks RCU readers Tasks Trace readers where required
      rcu-tasks-trace: Assert no reader is held on return to userspace
      x86, arm64: Build Tasks RCU on Tasks Trace readers in trampolines

 .../RCU/Design/Requirements/Requirements.rst       |  24 ++
 Documentation/RCU/checklist.rst                    |   7 +-
 arch/arm64/Kconfig                                 |   1 +
 arch/arm64/kernel/asm-offsets.c                    |   8 +
 arch/arm64/kernel/entry-ftrace.S                   |  74 ++++
 arch/arm64/kernel/ftrace.c                         |  20 +
 arch/arm64/net/bpf_jit_comp.c                      |  93 +++++
 arch/x86/Kconfig                                   |   1 +
 arch/x86/kernel/asm-offsets.c                      |   8 +
 arch/x86/kernel/ftrace.c                           |  52 +++
 arch/x86/kernel/ftrace_64.S                        |  69 ++++
 arch/x86/kernel/kprobes/opt.c                      |  44 ++
 arch/x86/kernel/vmlinux.lds.S                      |   4 +
 arch/x86/net/bpf_jit_comp.c                        | 107 +++++
 arch/x86/xen/enlighten_pv.c                        |   2 +-
 include/linux/irq-entry-common.h                   |  15 +-
 include/linux/kprobes.h                            |   8 +-
 include/linux/module.h                             |   7 +
 include/linux/rcupdate.h                           |  24 +-
 include/linux/rcupdate_trace.h                     |  13 +
 include/linux/sched.h                              |   1 +
 kernel/entry/common.c                              |  14 +-
 kernel/fork.c                                      |   1 +
 kernel/kprobes.c                                   |  44 ++
 kernel/rcu/Kconfig                                 |  32 +-
 kernel/rcu/rcutorture.c                            |  10 +
 kernel/rcu/tasks.h                                 | 458 ++++++++++++++++++++-
 kernel/rcu/update.c                                |   2 +
 kernel/trace/ftrace.c                              |  39 ++
 samples/ftrace/ftrace-direct-modify.c              |   9 +
 samples/ftrace/ftrace-direct-multi-modify.c        |   9 +
 samples/ftrace/ftrace-direct-multi.c               |   5 +
 samples/ftrace/ftrace-direct-too.c                 |   5 +
 samples/ftrace/ftrace-direct.c                     |   5 +
 samples/ftrace/ftrace-direct.h                     | 126 ++++++
 35 files changed, 1315 insertions(+), 26 deletions(-)
---
base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
change-id: 20260910-b4-rcu-tasks-preempt-qs-401ff45465c7


