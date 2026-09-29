Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CB7CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNw00W9BCYnwC8xg/InU6V6F2D9xjEZKnGitOXbGDrM=; b=xRq4m8RucjFhHdfqD33iyqkkRf
	lHKvhucHR+1BrJwNLpoAerXkQ7VZfrL8NyCl0IVlv33XMn2em5q7uNYG0smFrPrdJzSRKWkI7cC2E
	kId+5AXekYG275LaF4/Nuo4dLa8Z7gqeCgHYrStPg8ZmKjP0zYXZiXLPjEt4KFwK62MxwWvzWKPN3
	Gu57sPYQY3RS62K9O3Dug6KD9NUFbya1L4W8FTDfKsdzy7Qk7OIo9O16iVI9/uP7zbVLHXGLoQjsZ
	Ljxmq7Rt43ftKQBEz2j+u6Zpf/gOvJ1bD3dKER08OZeiNo630hfzwS/NW/HEBUnQ6ZWqs5V9m4XXl
	RiCT2dAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbMD-000000048yW-0Kf7;
	Tue, 29 Sep 2026 17:11:09 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbMA-000000048y0-0xDK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:11:07 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-530fa0716f6so50201261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701865; x=1791306665; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNw00W9BCYnwC8xg/InU6V6F2D9xjEZKnGitOXbGDrM=;
        b=f7imN7/El9kSC7mj7+xT+2jx4G29FDWegaKnYhaIln0NXbPfL4h7Y252/3wHlB2Fyj
         oKvw4oHAq8icxC6bWKQERiAi80J/JMl262vnL6dmdXI817kiA0NBfuoGNO1Q3dQWb7ss
         K3Ow1RtMiRHH51LvlLOPyXKdrl9WaoAOZWvLR+h2NmmLTNzLeJvUv49pRfpibywugxHn
         x0CimF7H2rtyRagM3zo7oIRUlX4UamiM4yfwE9CgqqToCFRYTKbTyHW9ghp7dE4g2R45
         nHSYxpZ5xj3Z3ZavROwHUTAwGdp/UsI0vNSs6tkZsnZR3U/uDBB6NrEi/q/wFa0inyUe
         pQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701865; x=1791306665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNw00W9BCYnwC8xg/InU6V6F2D9xjEZKnGitOXbGDrM=;
        b=GohQAaaDq9bo7WS/+Vy66rJvvpCCNlFU+SNWxQbINCyaR+/TH9QDagCQm2k/HNUJ9k
         twCP0q/iOF48/G8T+GWuyCqXrfs1nJFyIkBQXUbVzTl7Isomk6lsN7IQvfPl+4jN1gnS
         EweSo18nDJXOUNN6+m1HJ8DKFHx5x08BXWzwYlMCKv5DRZOIoflDGsP7lz0P1WI3KikZ
         Y5T/UPNymvnaJ3vCFID6EsHYQRsH9VCAO0xLo3tQHVH8syjdHs/ADmjv0464F5dCH+MX
         k0dVfBtnlVhwAly4KoJ8cgq668qqwxgT26hOKyBaAyEUy86Lm6QiLpSEZqydtCYJCHaX
         ImSA==
X-Forwarded-Encrypted: i=1; AKwUvBwqRIIsUIClq9fcfGIdc6L+nZTRETKr/hWiFe9kkk35nVRjSFh1emYuclhTIp2hyLyP5Ipzp9dUW37wvRytQjgp@lists.infradead.org
X-Gm-Message-State: AFuF++l9vlFZtM9QXzhc3qMZBH1dXp06vzLZxXkrcNkEsjjo8GlaoeEq
	ndsLwfK6v5ZPkPkLidhGqZTZg30V/jjxMLHvqoQ8CslSB8cYkbt3m/dT6/saPM2iD2s=
X-Gm-Gg: AYBFou2svYHogMAHDSeRYeEVwgSinC2ufbZRmNLZn2XwFGQzi871/6qtziIYxdTVfPY
	6j50QccxQgktuV5+pLzXuOywPr+nUS/MPHr6vMYFe5elM4R6qlg5Md487JO1w3spxyoz2nGxo4R
	FPttxG9tCEXK6N3Ws0k1cdwtvwsmprEzKnR0GWA2WrT+hKUGeDNaZ330krxuMQVeuTuoDM5RfT0
	m1Ir4dpgD0kRLHiGWtGQ2rHPf13qoxv7Km58U2AzJ8KENXHfSijluCbMle2Bz1ELp/dFFrPeyoc
	LVAfpUmu79GK5TnuXm/NUleGWJ5KnPIR2DHW1YfGMETjk/clSa1VUZEzLrST/zSICnFHSjGi/K8
	74Ge17CPiYnOha8cFl2GepayInO0zu2i9L7l0TRcY+nu+ftRnmm4UAt8jhGZPWjJ6wSuc5y+/je
	MMHi/vgOUsmtSmTJc/+KWdfG/6p+hiUTIFe9xramzraVePbJ7JCAnZDeMwNyE3N2AEjc4HMqt+W
	IRk9sGmcWT4acc=
X-Received: by 2002:a05:622a:4016:b0:532:b31f:820e with SMTP id d75a77b69052e-5330b5b8118mr305631011cf.18.1790701864547;
        Tue, 29 Sep 2026 10:11:04 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53369af75edsm66981cf.9.2026.09.29.10.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:11:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:21 +0000
Subject: [PATCH v6 04/14] kprobes: Expose the optprobe jump window to Tasks
 RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-4-c111ee02caca@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=7126;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=nl5RNxQPCzAWJtmsi5SbRteMPNwj0J+QlcZAZWXWQ7c=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFFZEOaRfIVTqNnNhc5U/7HS1t7xUbawjml8+bJSR8yFK3V4XE1G+BlfVkIeDKMdjqiUSidKrEZ
 kwtnR55o1Hgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101106_290031_8448979A 
X-CRM114-Status: GOOD (  21.78  )
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

kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
about trampoline text: it waits for tasks that were interrupted on an
instruction boundary inside the bytes it is about to overwrite with the
optimized jump, so that none of them resumes into the middle of the new
instruction.  Those bytes are ordinary kernel or module text with no
Tasks Trace reader around them, so on CONFIG_TASKS_RCU_TRAMPOLINE_READERS
kernels the irq-exit quiescent-state check has to be told about them.

Add kprobe_in_optimized_region(), a lockless and conservative form of
get_optimized_kprobe() that reports whether any registered kprobe lies
within MAX_OPTIMIZED_LENGTH before the given address regardless of its
optimization state, and have rcu_tasks_trampoline_text() consult it for
core and module text so that a task interrupted there becomes a holdout
rather than a quiescent event. The hash walk only runs while
kprobe_optimizer() is actually inside its synchronize_rcu_tasks(),
tracked by a flag it sets around the call; otherwise the check is a
single load. That check cannot see a task that was already preempted in
the region before the flag went up (possibly before the kprobe even
existed), and the new grace period does not otherwise wait for a
preempted task to run again, so before synchronize_rcu_tasks() the
optimizer calls rcu_tasks_wait_irq_preempted() to wait until no parked
task's recorded irq-exit preemption IP is inside such a region; its
leading synchronize_rcu() also publishes the flag to every (interrupts-
disabled) check in flight. The kprobe hash is RCU-protected and every
free path waits for a grace period after unhashing, so the lockless walk
from the irq-exit path is safe.

On other configurations the flag is set and cleared but nothing reads
it and rcu_tasks_wait_irq_preempted() is a stub; the classic
implementation already waits for such tasks.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/kprobes.h |  8 +++++++-
 kernel/kprobes.c        | 44 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/rcu/tasks.h      | 11 ++++++++---
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index e6de7ae55bda..74cc48c04417 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -530,11 +530,17 @@ static inline bool is_kprobe_insn_slot(unsigned long addr)
 }
 #endif /* !CONFIG_KPROBES */
 
-#ifndef CONFIG_OPTPROBES
+#ifdef CONFIG_OPTPROBES
+bool kprobe_in_optimized_region(unsigned long addr);
+#else /* !CONFIG_OPTPROBES */
 static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 {
 	return false;
 }
+static inline bool kprobe_in_optimized_region(unsigned long addr)
+{
+	return false;
+}
 #endif /* !CONFIG_OPTPROBES */
 
 #ifdef CONFIG_KRETPROBES
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..a63f31045b14 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,46 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/* See kprobe_in_optimized_region(). */
+static bool kprobe_optimizer_waiting;
+
+/**
+ * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
+ *	kprobe replaces?
+ * @addr: kernel text address, typically an interrupted instruction pointer
+ *
+ * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
+ * were interrupted on an instruction boundary inside the region about to be
+ * overwritten by the optimized jump.  Where Tasks RCU is built on
+ * reader-marked trampolines that region has no reader, so the irq-exit
+ * quiescent-state check asks this instead (see rcu_tasks_trampoline_text()).
+ * This is the lockless, conservative form of get_optimized_kprobe(): it does
+ * not care whether the kprobe found is, or ever will be, optimized.  May be
+ * called from any context with preemption disabled; the kprobe hash is
+ * RCU-protected and every free path waits for a grace period after unhashing.
+ *
+ * The hash walk only runs while the optimizer is actually waiting
+ * (kprobe_optimizer_waiting); otherwise this is a single load.  A task that
+ * was preempted in such a region before the flag went up is invisible to
+ * that check, so the optimizer first waits those out by their recorded
+ * preemption IP (rcu_tasks_wait_irq_preempted(), a no-op on other
+ * configurations, whose leading synchronize_rcu() also publishes the flag to
+ * every check in flight).
+ */
+bool kprobe_in_optimized_region(unsigned long addr)
+{
+	int i;
+
+	if (!READ_ONCE(kprobe_optimizer_waiting))
+		return false;
+
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+		if (get_kprobe((kprobe_opcode_t *)addr - i))
+			return true;
+	return false;
+}
+NOKPROBE_SYMBOL(kprobe_in_optimized_region);
+
 /* Optimization staging list, protected by 'kprobe_mutex' */
 static LIST_HEAD(optimizing_list);
 static LIST_HEAD(unoptimizing_list);
@@ -644,8 +684,12 @@ static void kprobe_optimizer(void)
 		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
 		 * Note that on non-preemptive kernel, this is transparently converted
 		 * to synchronoze_sched() to wait for all interrupts to have completed.
+		 * See kprobe_in_optimized_region() for the flag and the extra wait.
 		 */
+		WRITE_ONCE(kprobe_optimizer_waiting, true);
+		rcu_tasks_wait_irq_preempted(kprobe_in_optimized_region);
 		synchronize_rcu_tasks();
+		WRITE_ONCE(kprobe_optimizer_waiting, false);
 
 		/* Step 3: Optimize kprobes after quiesence period */
 		do_optimize_kprobes();
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index e7498601c28c..3f127e47ffc2 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -996,7 +996,9 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *    trampolines, kprobe slots and other dynamically allocated text; this
  *    deliberately does not ask is_ftrace_trampoline() and friends, since
  *    text being torn down may already be unregistered there);
- *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text().
+ *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the bytes after a kprobe that a pending jump optimization is about to
+ *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
  * A false positive only makes the task a holdout until its next quiescent
  * event.  Called with interrupts disabled from the irq-exit path.
@@ -1004,8 +1006,11 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
 bool rcu_tasks_trampoline_text(unsigned long ip)
 {
 	if (core_kernel_text(ip))
-		return arch_rcu_tasks_trampoline_text(ip);
-	return !is_module_text_address(ip);
+		return arch_rcu_tasks_trampoline_text(ip) ||
+		       kprobe_in_optimized_region(ip);
+	if (is_module_text_address(ip))
+		return kprobe_in_optimized_region(ip);
+	return true;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 

-- 
2.55.0


