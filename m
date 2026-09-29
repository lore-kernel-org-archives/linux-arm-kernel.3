Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97556CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe4PBb/Hf6DUzcCJY1sqn5uC1SzSruVIKDxh26oxA4E=; b=uCt/0tMh0zdqy8CWHSAOTyQRy1
	V5/Yj7yIVQjLyi8ZfkaFHSzqn7lJRHL1yc1SFl+b8WTMU+x3L4naemZIVsAPPVssI/sbrekDqMQW+
	07sv1du4gm2M8Hva2HaKQfSVoeQJXfxTAqYlhoGcrzgoFND+LpQmGyK4tC8XaH4WICTHb6nLcJOMS
	31OrXHtwHCUawnrHEh1b2secC4DYzpE8A8ENOraS2vsVZ2XPGj/aifK9AYlKojKRVl7B6ymDOeKcb
	tzQ5nRFid01QIzYx5A6HOowFTgBJfw7/P6MSoYjEDV/QyIlEqAUmSxlPG+LSWVA4IWsw67x+8ZYWd
	2dxTAFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbSb-00000004AJZ-1GbR;
	Tue, 29 Sep 2026 17:17:45 +0000
Received: from mail-qk2-x2b.google.com ([2607:f8b0:4864:34::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbSX-00000004AIJ-0HQJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:17:43 +0000
Received: by mail-qk2-x2b.google.com with SMTP id af79cd13be357-93c67dc38f4so159520685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790702260; x=1791307060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe4PBb/Hf6DUzcCJY1sqn5uC1SzSruVIKDxh26oxA4E=;
        b=SmoJ5+b4hCEM8jffUik8Sp+ZVqBpO0UZjzt0CYAoSuFL5oPRM5aayCWMxoIdUmKiCl
         Oa+D+i+VyawlhOC9GfZwpj9FW9c7BxaFypguVOwnBPVm84ub9m/4NuT2V7944HVVzpdj
         uXhG7SGwQUQJlCAk0aiFlYxq8xuj3fqNpZl+4IOkLZNS1dQl1ybmbilpLrfwa2Bujb3p
         MxGo9Mx8sM0/eXelfAgFN6bmx4+S2vjBllQEBWBnD/628dDkuLT3swW/d3E5ZbN4Bp0d
         b+TJDZOLty44lVJYCKesIUBZMCqgml0ZtbB8tTCk2ak2qb6MObDpQQOdgIu0QAOb5/cZ
         UAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702260; x=1791307060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe4PBb/Hf6DUzcCJY1sqn5uC1SzSruVIKDxh26oxA4E=;
        b=RMLOH7JvXyi8/EXq60l/Q81wKuUtWpWKUkVJlLlWc/+Dl8Aw/WvYWgeCyg2f2+jaP4
         5h7TaJF+M9bDvmD+Ae6/PoU5I1GuPKmXRwbvrs/9MJ8Oz+Sf6msy0DD5U8DBiEaLDKSs
         V4zoo3/ifrJ8wCKlT+qYI0/zvqr5vVJ3oowywS26itCasQRTckL8ulZBYQEzyGCAM37d
         7CA76KV7995UaAgfRx1ykWF70kFcrY0dD+2jwurPdFpCdI2chTlOw6a0IiKBWdCsEkGh
         56JGWtmMhGlu7opN3MG7g/WKA7dn97i0m7o0RqoQLH/Fx5uWRSG8T5hYVp7g4qkl6Ffw
         xMYg==
X-Forwarded-Encrypted: i=1; AKwUvByvxeFf47UeRgnN17w5V88bP7V/QtMN7SFDIPCMmvQNSFPj+feJt7lDM7w+oVY8mNKmgDJF01C7ldh2ldnJYrUF@lists.infradead.org
X-Gm-Message-State: AFuF++mJpllml7tHnujhwGL2aaFyDXD7YIAY39Bqtk/8TZb8DvhzVRCY
	CeN2Lla/f6EWEW0MmbhhKVTaORZstgBPd6PsEuxUemJt7s9KaKePeP8tZ7r65RyQH8Q=
X-Gm-Gg: AYBFou2/IrK4sJ0/UX9BYjHzkAOz0ygLvibm7y4RwuSgHCOaclcR1u1j+saM30HuDH7
	CpLfd9zCykSLsfSXPgSTuIqRk8MWWau72CRwpvYXbnq0/Jm9b7gtDChfCOmNIjKjNDaXQ0LpYUc
	HOXEw51B0XrLyQCONKwoLJz0vHUJbk6jN1tMiZMUFt39BLpAHy5lgXiQmIPtBX/sNZ9RT+CH34P
	KkJLFstI29lNLcLJJHvlLVg59Ob15e7rlnNoPapMocMr8kuUlAM+bQrEHbZxYJ8+Fdz6weAY5YW
	yBvPGUb/Z+a1T3wT7D8zXm9+WRv0DGL9YjTVvIQG/y01TcqzIjRYMy/A5rRdc3uCRSVigF5vyNH
	H3gGJeYGcA76Z8BczRxPmLPvM+KMhr+PrttQJ5894aMOeWdrnBQ1Yb+URE8u35q1nGwp+3s6hV+
	KmUkZ+fX+sQGmuuz3qAlnre7exXF3BPXsDtbZs7lHuZZaCQWCngKoDobiWFQ++5mpmQVWWCmhH7
	kXpVxp6TSyaQWc=
X-Received: by 2002:a05:620a:1451:b0:93c:2670:2c28 with SMTP id af79cd13be357-93c9f9846a4mr28084685a.10.1790702259614;
        Tue, 29 Sep 2026 10:17:39 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f503457sm17417585a.27.2026.09.29.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:17:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:31 +0000
Subject: [PATCH v6 14/14] x86, arm64: Build Tasks RCU on Tasks Trace
 readers in trampolines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-14-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701682; l=6284;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FBu4wPNvp6XKLCksA/EO6fe2fqobXZ0aLWTgQ92ND/M=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM5aKK+gCbm3N+QZV9FJaROou1WOBBTQcvS6L+bOjkJ3lKBVKqJiXBvlyBo1oNNPHF0Pr3LTzCa
 TSaSfpKWd7AA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101741_135809_DE730371 
X-CRM114-Status: GOOD (  19.37  )
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

With the preceding patches every trampoline whose lifetime Tasks RCU
guards on x86-64 and arm64 -- ftrace_caller and its copies, the optprobe
template, BPF trampolines, and the sample direct-call
trampolines -- is a Tasks Trace RCU reader around its call-out, and the
text outside that reader is known to rcu_tasks_trampoline_text().
Select HAVE_RCU_TRAMPOLINE_READERS on both (x86-64 with SMP for Tree
SRCU and DYNAMIC_FTRACE, which is where its ftrace_caller changes and
arch_rcu_tasks_trampoline_text() live; arm64 with
DYNAMIC_FTRACE_WITH_ARGS likewise), which switches CONFIG_TASKS_RCU to the
implementation added earlier in the series: a Tasks RCU grace period
becomes a per-CPU pass over context switches and irq-exit reschedules
outside trampoline text plus a Tasks Trace grace period, bounded by a
few jiffies and preempt-off latency instead of by the longest stretch
any task runs without sleeping.

Other architectures keep the classic implementation.  Update
Documentation/RCU and the FORCE_TASKS_RCU help text to describe the
variant and the obligation it places on trampolines.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 .../RCU/Design/Requirements/Requirements.rst       | 24 ++++++++++++++++++++++
 Documentation/RCU/checklist.rst                    |  7 ++++++-
 arch/arm64/Kconfig                                 |  1 +
 arch/x86/Kconfig                                   |  1 +
 kernel/rcu/Kconfig                                 |  6 ++++--
 5 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 8101fe6229d5..c059c463e083 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -2756,6 +2756,30 @@ synchronize_rcu(), and rcu_barrier(), respectively. In
 three APIs are therefore implemented by separate functions that check
 for voluntary context switches.
 
+Architectures that select ``CONFIG_HAVE_RCU_TRAMPOLINE_READERS`` keep the
+same three APIs but implement the grace period differently
+(``CONFIG_TASKS_RCU_TRAMPOLINE_READERS``).  There, every trampoline whose
+lifetime Tasks RCU guards enters a Tasks Trace RCU read-side critical
+section (rcu_read_lock_trace() or its assembly equivalent) before calling
+out and leaves it before returning, so a task anywhere inside such a
+call-out is an ordinary Tasks Trace reader whether or not it is
+preempted.  The few trampoline instructions outside that reader can only
+be occupied by a task that was interrupted there, so the grace period
+additionally waits for each CPU to pass through a context switch, and the
+irq-exit preemption path, the only switch that can catch a task inside
+such text (rcu_tasks_trampoline_text()), briefly makes such a task a
+holdout until it is next seen elsewhere.  On such kernels an involuntary
+context switch outside trampoline text *is* a Tasks-RCU quiescent state,
+a Tasks RCU grace period no longer depends on how long any task runs
+without sleeping, cond_resched_tasks_rcu_qs() is unnecessary, and the
+obligation moves to the trampolines: anything that relies on
+synchronize_rcu_tasks() to protect code a task may be preempted in must
+take the Tasks Trace reader (see register_ftrace_direct()), or, where
+that is impossible because the code is ordinary text with no trampoline
+of its own, make it known to rcu_tasks_trampoline_text() and wait out
+tasks already parked there with rcu_tasks_wait_irq_preempted(), as the
+kprobe jump optimizer does.
+
 Tasks Rude RCU
 ~~~~~~~~~~~~~~
 
diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
index 4b30f701225f..87dd506bffef 100644
--- a/Documentation/RCU/checklist.rst
+++ b/Documentation/RCU/checklist.rst
@@ -252,7 +252,12 @@ over a rather long period of time, but improvements are always welcome!
 	a.	If the updater uses synchronize_rcu_tasks() or
 		call_rcu_tasks(), then the readers must refrain from
 		executing voluntary context switches, that is, from
-		blocking.
+		blocking.  On architectures that select
+		CONFIG_HAVE_RCU_TRAMPOLINE_READERS a reader must in
+		addition be a Tasks Trace RCU reader (that is what the
+		trampolines there do around their call-outs) or be text
+		that rcu_tasks_trampoline_text() recognises; an arbitrary
+		stretch of preemptible kernel code is not protected.
 
 	b.	If the updater uses call_rcu_tasks_trace()
 		or synchronize_rcu_tasks_trace(), then the
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..bf0e56006863 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -218,6 +218,7 @@ config ARM64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_PREEMPT_DYNAMIC_KEY
+	select HAVE_RCU_TRAMPOLINE_READERS if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..64c3814eb745 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -288,6 +288,7 @@ config X86
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_MERGE_VMAS
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
+	select HAVE_RCU_TRAMPOLINE_READERS	if X86_64 && SMP && DYNAMIC_FTRACE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if UNWINDER_ORC || STACK_VALIDATION
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index e3dc348bff29..abff3a924e1e 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -95,8 +95,10 @@ config FORCE_TASKS_RCU
 	help
 	  This option force-enables a task-based RCU implementation
 	  that uses only voluntary context switch (not preemption!),
-	  idle, and user-mode execution as quiescent states.  Not for
-	  manual selection in most cases.
+	  idle, and user-mode execution as quiescent states, or, on
+	  HAVE_RCU_TRAMPOLINE_READERS architectures, the variant built on
+	  Tasks Trace RCU readers in trampolines.  Not for manual
+	  selection in most cases.
 
 config NEED_TASKS_RCU
 	bool

-- 
2.55.0


