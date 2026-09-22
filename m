Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23339C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8c5rUXaTXu9B0UqDL2lNbjmJqabE8+fQOLsAHyr+Co=; b=wUe3Fh4lZk0SrZ+ZVstx5TTnFG
	JXw3FmXoTkvXG5bwTqe7QqK7a1Z59hOAo0EdMPACYlzwis+JoacZHLQsgzIbbgRMU1V0SmkwGMYkv
	nN7aMdhzmora5A9+OkambQoZ71nVlfgDFAC7bxq4+qY8wmZF7fmP6mX369COrfp0bzhUs9Bv+2n9B
	9yqPyHMQjg3aYRKKiotBtiY/Fh7Kj2cQgXqEaQKUh2uxrQGUgsjO++2+whN4uHidvFvJNfUNNQSxz
	CQr6zxBeKvDOTk4VbaziNfKdv0A3eUVQ0G8tKHm0wQ3DYo9s4ut59oBtJBHeoTTaCPthq6xDqyW7h
	WZg8SlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qLJ-00000004043-00ej;
	Tue, 22 Sep 2026 02:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qLG-00000004037-3IUW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A8c5rUXaTXu9B0UqDL2lNbjmJqabE8+fQOLsAHyr+Co=; b=aQidYUe59uFLFdxTJrdnBK7209
	+OeO7rI11Zf9WqgNDF2YCylABNXGFbB7ANOY3JrPD1hFFrMJ1hPK5iiBlGM6Nf4m1QTlks4SkF9ZD
	v4O6chadynLS7vWOR2l3AqTtB5UGrBUmkdOb8uDb/ESLZnNlAk/4yq7L11SBGEKGNKoMIqon6Acmy
	Xsz2tCVtB4SoxpljxzakAgjOby8IZ3Y92bnCnibGqk5c90WsetOCHalQtuNkNTdw7xUCkzzHTITJk
	14wWtgprezJ+B+M/6P/7SOiPJ3QzVwhXci+0blfZtK0uIyTQ1TJkGDhRNBNigyEZjQPacIizBE5oo
	6/kDthRQ==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8qLD-0000000D1LD-2kfB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:34:45 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb76ef19aso38218181cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044482; x=1790649282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8c5rUXaTXu9B0UqDL2lNbjmJqabE8+fQOLsAHyr+Co=;
        b=IHBIL47Rk/I1MUL4wr+KilpocO5JNMgXXdVRmDK4U/4h3RBe4hQDDfwPcTmCdkv+7A
         dFCBF1fxT5d9ame3e8V0+w44bukkfK9OIG1z3rRrTRkGizOpRbsO+hj30PeqEGdkOoTU
         1q9xYl+fCO+jI6z1l8F5fqtVTHK/W96ZpksAvwRRuFSS8Evq9Rs7jamVnm9j7nucHV4t
         UvsM5lgIGkN+g+1L5MVIb8QjF/7A48RzUzQffS0mPOwe0TMMmaO/lSX1lWWo04od4fej
         Q2EfQfE+fuAncPFUr8/FxCoUmwkSQ2742FkHuY16Xxf0dd8R2CSGvjwxDYoKv5H2k1qm
         chGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044482; x=1790649282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8c5rUXaTXu9B0UqDL2lNbjmJqabE8+fQOLsAHyr+Co=;
        b=gL1s55Z+B9Mghmw50mHrscT/nUwbXBFZhL1XWORGNl7bevFnR9YU/0HDz5uEY/IMVU
         jSy5d+VfWFkxNGe2L0GYyfkP9M/x1XrHlXRe5jVl8KSjtfwfgkP6BHBKBfnjroeMY4Pz
         KZgCbImnnw7ZqyB1b0gI1ENWPwtyNLEPj8DVv9OiCQJ4z2oXkObFOJjrKD75ZgPFdU9t
         3NnYZ/X2RhawQCgyj1IeNB0ncySoc1YRA2B2Wx5MWcZVYDn+I5C8vIVbTW/JbAUC0YQ1
         m7hQusNScn5gvEYDuIr0YMgVnzaCY6uEWFvQS0dOpxdhD3JAFU15GAMkXJ1ODDx1h4UY
         pI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPYb6O3FSqbFONs6IeGV0XIvoN9fIV+GZ8zEyw/qMrKlHUE9ICdJ9hXxrxoqaPaADqO4thzgSB/EyQp6PUZ7/8@lists.infradead.org
X-Gm-Message-State: AFuF++k1op05YoWKrtzKeL8qR3hsUapetbZgA43hi5v0IuA+/whzvqsv
	6ZmPk31yLTL8GY9cYc3nTFhlBNk3eC2YsPN0zyp3nMz9vPGmm0+6wTuw8vLceGvs/Z8=
X-Gm-Gg: AYBFou1uwHx/9j9STkcgAlPjMvJ4I4Th8uudwvPheU/2mdeEAy94mIACKj+sMd/a1YE
	l9GfgGQXQChbgpd8cF3CLNnD1LhdQIWon2SiVSKRfqrnyTh75GesAbiyCO2DVb7szfiZqxpp8BT
	YTe2UmwZ8Hf2K/zSVk+x8GpMvE18svcdqWeaEHxe3mj1ySqnJOihcbS3rb8CTpicPgCsxnNzlkC
	gtWsPKUTyLHUOvgZ8fjoZRzcoM/zAaP4DQilPLH7kca5BE8k/6jdhbhi9+DPBuN4UbI0e2a/P+J
	2AviEI/OuwEApXUSqf9azO9U139u59pc0ad3jJLtWbpMxXrptlWOzXHzZ5cMrwNChXf3aLZMWFO
	qH8OQTtsaZ4MUkQdOAKDfoTUGrte/ckG0fte1IIrc0VPoih4V1mQ/68x2+xnmEQ7pbuWX/XTvu3
	SvSruWHdPHN3NvSSmNU5nz4H2YTTQoRnVNErmCmo/dxXV5FGEFxusx+Knx501SFXKqy6fogFxUg
	AAe285MkWrQEppx
X-Received: by 2002:ac8:5981:0:b0:531:341:685b with SMTP id d75a77b69052e-532d8e6db17mr35559661cf.57.1790044481601;
        Mon, 21 Sep 2026 19:34:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e19042f2sm1747801cf.17.2026.09.21.19.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:34:41 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:32 +0000
Subject: [PATCH v5 13/13] x86, arm64: Build Tasks RCU on Tasks Trace
 readers in trampolines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-13-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043821; l=6284;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=VsJyzZYJ6ksShlnC7Yiz29R4LafGY+0/mhkU2yBL4O8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAul8WLe0tDTHb9SU5nk2yovv9PSDoMlv/2xo0UkHrqLg8PKI6TfwzvMu0u8RzKLGszaLneeE+P
 K/bP4/WyaqA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_033443_773126_4FCEA20D 
X-CRM114-Status: GOOD (  19.17  )
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
index bbab14bc14c3..341b68b972ef 100644
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


