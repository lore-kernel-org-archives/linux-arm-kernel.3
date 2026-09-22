Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB99C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n57jpnbqR3xEpFvVL4pj+x/9TynCnpwMD9+qM+zc540=; b=2wmg7S4jgED/lp7dPOPoDexTMF
	RPZMwccL0dvKMLIe+PqXGHiuopdIKicNoKrS+iAQFmVhnq+M+uPQDJ+y4dnU3w8BBDiDH6DKoqIZL
	tb6ggAIzTLgEZR5wMS1j/8zBVGNIxihG4q041aXpPbwzbo3vMCACh6A9dDPYkZCwvHWeVX0cKJU1s
	LjO3A0vSR7oeBZGc/+xTHpNE4qu2aPdtAXZCA09Ex5m1alb6XibMPYMFuqfzL2rwKk/HDdOJGO7gq
	H8ut1McgxzsjbQ4dw5eSdtQtDjFi++kVMqEY8/F2kKJ4TfAJgUKHz52LI00i9g4ty2Oy+Lhw6DYS6
	jfjkGSeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qDZ-00000003yNI-09vL;
	Tue, 22 Sep 2026 02:26:49 +0000
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qDX-00000003yMr-0lTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:26:48 +0000
Received: by mail-qk2-x0d.google.com with SMTP id af79cd13be357-93bfa7b2093so203677185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044006; x=1790648806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n57jpnbqR3xEpFvVL4pj+x/9TynCnpwMD9+qM+zc540=;
        b=fmdn/pbncKx4EDM7+spSDSbgp32q5o277vXDpIuw2oWZktHkFpd9qnLVAyawCGiUpa
         5w1PTn+NolRpsYR4qe9+lxJVZCiKjdToQ60FTbvG+I/mjslHMq1EZfL/WEi+Bak8Rhei
         d+uAlSh8ZGOZNCgNHef1v9pxE9/EC/MC6A+xG+ElXcZc/SzV+T3lkQVBdWIR6UuDILPQ
         mY79j0QIt1HOh9Eco+BywxeG7sAwlwGdzB+F6PIvSrovM/zZ6qtSMf4hVtJJOIx2kNj/
         UTfLvnPiSE9uqW3LpwP5caCmBoTV2r0h0Lt64nsH59PdzJl0G4qcw9J22bVm/eIFTDr1
         RYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044006; x=1790648806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n57jpnbqR3xEpFvVL4pj+x/9TynCnpwMD9+qM+zc540=;
        b=gfyzqbwqxZppSrT8QkkoZJG/3P/DpFKNLhYXoZxv3N1oT3fyfzQti8a2mVYBYWjtSh
         jdcmyWpvyklwrv9voH2FANpSAelvXu3IBBXbnxgponIvi153nNfAJ5YOb4NS7/X5bMbf
         iDYJqebVLIO+seWPDHBv9aM0MvfUoN9jtYhiYzyz4SoYIEXahYgYcYQbfLLSyJGV50ck
         7xFOtQorC76k8NYb3a1l7WeTYWzdgfBVuwZiKycGLGc52RTH3FShh5JfV7DOv1TXWev4
         +KCRWdnk9nMGQ3ElC6fVKzX/Jozy4jmfs1x4kXzISwBuI08zn+ORjFh/tDrulza92v+O
         pPJw==
X-Forwarded-Encrypted: i=1; AKwUvBxrB10xNgMrEmZ4+vcUDr0cyq39VhYcR0x5vGsnt0LXz9PUBknpQEljflqXBqQGQNUDnD6aa11iEoZxQy3aTfm5@lists.infradead.org
X-Gm-Message-State: AFuF++lGiT0PW+MV5XD6MGHoqc9KHPBcM3uMOgJmCq74uomPuSfHJXMN
	pIEn0+FY1NHYWtM14Yk73Qc+oJDSf78O9r1bq6gOIELxf0A4r9FD0M/7pSz2eFP88c4=
X-Gm-Gg: AYBFou1mzGtWjznwZqCjByhUR7hraVNi5sRUNl7OHbL5VAHu/4H0lvMrU6w7xvrCH48
	2cNJN7gEQ2R3syNmNy9MaRoJZdos+UOxukBSxRNp/FNIGOBcUjWUqzKNknqJOosIWt+5D+Ogru1
	pTwE97qh/4rZTkhAu6inX6KeLf+BPI0nsPaWk/RwVESTjXkRVQ6HryFXm2MPAF7jzf2LHE+M0Yg
	yaEb7KV4CVuMyLElpslZjOiRlf/uGRfkdGBt1rQzEhFvYakyFan62tOgLYLroZ4V0Zul8XDA7ry
	JJZ9tnDhcSDH8Hc6q0k+XidC+OROPJxmakhbXUhA82fDS/o9QKg7sJedO+Ovo2S9svOVOUWCh+S
	rNxGtLUgV56sbTt4D4EeHE9/Pk2/sf/M+WPce7bltF9GgoMPf9o/LegGv9JD1MKT1MeXwL/NwoI
	FRIV/b10KtpN82K0Hy9wopFyt/2NMxQgvE+8GKQ43a0YGHT1djJGdpF6vQHGQ1VWLxLLOg/aFT/
	SFCu2SZDgLu7mk=
X-Received: by 2002:a05:620a:458f:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93c15e783eamr375359285a.45.1790044005713;
        Mon, 21 Sep 2026 19:26:45 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d131c4dsm21683685a.15.2026.09.21.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:26:45 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:22 +0000
Subject: [PATCH v5 03/13] kprobes: Expose the optprobe jump window to Tasks
 RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-3-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=7473;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=97rXNEsO0S02JFiFJq38moNkWCht7E9TlyxYtLTVeYI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDgns7oV6kZusWmA4JvFz3vXN+lrAHSlz7TH5kJB91LDL9uOpEUIYQaSIenbGihoBc2IuMs6vNX
 0WqfawsK3hAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_192647_256711_7AD34E9F 
X-CRM114-Status: GOOD (  22.11  )
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
 kernel/kprobes.c        | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 kernel/rcu/tasks.h      | 11 ++++++++---
 3 files changed, 65 insertions(+), 4 deletions(-)

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
index 6337da5cab9e..e460fba83e4a 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,48 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/*
+ * True while kprobe_optimizer() is waiting for its Tasks RCU grace period.
+ * Only in that window can an interruption inside an optprobe's jump region
+ * matter to it, so kprobe_in_optimized_region() does no work otherwise.
+ */
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
+ * The hash walk only runs while the optimizer is actually waiting.  A task
+ * that was preempted in such a region before the flag went up is invisible
+ * to that check, so the optimizer first waits those out by their recorded
+ * preemption IP (rcu_tasks_wait_irq_preempted(), whose leading
+ * synchronize_rcu() also publishes the flag to every check in flight).
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
@@ -644,8 +686,16 @@ static void kprobe_optimizer(void)
 		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
 		 * Note that on non-preemptive kernel, this is transparently converted
 		 * to synchronoze_sched() to wait for all interrupts to have completed.
+		 * kprobe_optimizer_waiting lets a reader-marked-trampoline Tasks RCU
+		 * recognise tasks interrupted in such a region while we wait, and
+		 * rcu_tasks_wait_irq_preempted() (a no-op elsewhere) first waits
+		 * out any that were preempted there before we said so; see
+		 * kprobe_in_optimized_region().
 		 */
+		WRITE_ONCE(kprobe_optimizer_waiting, true);
+		rcu_tasks_wait_irq_preempted(kprobe_in_optimized_region);
 		synchronize_rcu_tasks();
+		WRITE_ONCE(kprobe_optimizer_waiting, false);
 
 		/* Step 3: Optimize kprobes after quiesence period */
 		do_optimize_kprobes();
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index f03be742be48..eb1388dd8a61 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1005,7 +1005,9 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
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
@@ -1013,8 +1015,11 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
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


