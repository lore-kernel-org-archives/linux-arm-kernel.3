Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwJvzjOst2er6K+UDT8eDw5lj3PdpLVthroXGjj7dNM=; b=O43R86NJrItkBsM406SVQsWDlG
	7Gzoj9GqfuV1hCxMN9rgLu1sDw3cwBifqtHpVOS0IHw4gQKKClyEc6YC2JSDYZQ2Cs4kvJAFP+wD4
	joXdHeheV6fSs7835a2uCS6fDoxcaKdUI37b1R66S7Khkjk/CoisvE0P5frBV2GSNtsjbqyQqgPid
	HZr6gG2Kke6Fec+r5ddoHS2ebsev/vKwm62z3JNpXCchQqliP7OdR8Y2n6ZxJY5rwRGhF1WAmWD++
	4Nj/qMG8hw83OMLgSaMBjOc6TrnNN290mSNK+hmURYx4P4q9ncJCxqUCCZyVItMjrS4rdnFntjBUU
	Tq+QwxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrN-0000000FBWU-0Aly;
	Thu, 10 Sep 2026 18:50:57 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrJ-0000000FBVC-46Tx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:50:55 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so250486d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066252; x=1789671052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwJvzjOst2er6K+UDT8eDw5lj3PdpLVthroXGjj7dNM=;
        b=F18QNKPuDenJqJmmjVHm4JoVkS/YRhGURDHd1r+lsYV6/uUMKvmvrKPKihNJyBJuWo
         z8+wogTrfvhmTnrbCRS5d9gBBBuDVvQ8MyeBEC7tmVIqaM1xTErG25f0ErYUU83duYuo
         I0R3F0WOfDuPQzHCgj3LMCnUnQGSG7SZ5w8YxLf1JD8tnDl3rvDjzsNdMl83hCtYYT04
         HuTsuhgQOxSl9pG7VwCRcRCgCG7vQHb1tFuZUfnjLz0u1IXWWz+OHD0JKN5FDo4RF4dW
         Z9TkV3TSdCNCG9WZpL1tE/TNA4qxAj06uVAfeveDFV9cyzVKl/dFK3EEcz9HmXJAmaSU
         A7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066252; x=1789671052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwJvzjOst2er6K+UDT8eDw5lj3PdpLVthroXGjj7dNM=;
        b=M3gP3659jEWBf3RlB1m9UmyILfNTDvHZE2N7pDohqE66fhmMmC+HQpUrj4YyFx2GNg
         N1omLdARntztO3fmGxmZQ203khaM1g+9+MFcAK6JMqrg9tlcWaMmvPcDpYK9TiPaAl+p
         5ZCIuMQyMxLvmAWV1w8+MqRBiEiX3eKdpNQMhyps2mPd7XXiGQlFYqx0NOAR1SwcIGfA
         Hz0fWV2za1yoI1QPh2OEfi43DcVR5AXqaXqX7DX/QudswbtHWi35wEHfLfyBmIllO/sN
         tdQjOKjOuC0Jvulv+eBCOpV64wRJI6iRW/XmipOcM+4JDO58xcnyCzTveOvKr9N6PmKj
         rwKg==
X-Forwarded-Encrypted: i=1; AKwUvByA1j3hFoaPXzBwVcRvOQfWli/02UIM9+whpwICl3qbJVPr7hhhJQ2Sp97gqw2WPwZ9Q0fHmv6EpsqTDUlppNAU@lists.infradead.org
X-Gm-Message-State: AFuF++lAnibGR2c38DzHiVLFL4BFWjYnKlbzImEe3733t4kVDO6F4YVw
	Zi5v9i/eDSLuzevmtIm3cgD1yKfVSI/FJZ66CzeWBpsDVriGyFN/FikMgay34IZyTZw=
X-Gm-Gg: AYBFou0ML2hgVt7XPZ2t9JUMlBTPYydmoOTy//F7u/h56PjqWl6SdtcyYSC/LGQBadn
	8e+wKZoGENuiQmp2iSSyzhDXd5T1r6F3z9CtKG5fW9+cbsBdC5JjaJnvpoOc9ncrin2eeNdg9cn
	au9mrPURHTadO03TjPxNLjgvtI3n/MGRIlVZnH0HzTZL2gylkEfN4xunT33CJYDPsNc0M4qufmd
	V3wqAg2WFEQvlQ7aP5WJujsT0QhHgx4wnKpNmakFyY4Vn7tR9EA2b9Opt71Kl0rIpUswk0XdgEJ
	Vz3KzfncPk1EEcqRyKMNbTUm9YddAiEyQfxDErnqTiQu8p2jPexEt1qdjzMS9Eez+s0KHAtDguh
	cQ+G3dhY48kc9op0GrzoiJAEkEMLx+oJNjvdkVT4HJJxWGA5FQurZWfGbPz5AAOVA35PF/pJTZd
	kI69B+yYKvyjdbIjK1N6c3TL8yNPZF5//KmjmTplQcjouc8DiBHQ6JXHU1LQ8kupDDlJWkWakim
	3Wl9vj2DEw7hr3PYIwEunr0SXoiKXtMMfqezIy9CQzrV0nEZSNImxiN4w==
X-Received: by 2002:a05:622a:1b8b:b0:530:5ed1:561a with SMTP id d75a77b69052e-530c876e50amr12423551cf.43.1789066252311;
        Thu, 10 Sep 2026 11:50:52 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45b61dsm239421cf.6.2026.09.10.11.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:24 +0000
Subject: [PATCH RFC 01/13] rcu-tasks: Add per-task trampoline nesting count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-1-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115054_051723_54F0CB1D 
X-CRM114-Status: GOOD (  19.48  )
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

Tasks RCU exists so that ftrace, BPF and kprobes can free trampoline
text once no task can still be executing in it.  Today the only way a
task tells Tasks RCU "I am not in a trampoline" is a voluntary context
switch, so a preempted task is always assumed to be inside one.

Add task_struct::rcu_tramp_nesting so that trampolines can say so
directly: a trampoline increments it before calling out and decrements
it before returning, and while it is non-zero the task must not be
treated as Tasks-RCU quiescent.  Provide rcu_tasks_trampoline_enter()
and rcu_tasks_trampoline_exit() for C users, report the count in the
Tasks RCU stall output, and, under CONFIG_PROVE_RCU, assert that it is
zero on every return to userspace since no task can legitimately reach
userspace with a trampoline on its stack.

Only current ever writes the count and every nested user (interrupts
running their own trampolines) is balanced, so plain accesses suffice.

Nothing increments the count and nothing consults it for quiescent-state
decisions yet; both come in later patches.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h |  2 ++
 include/linux/rcupdate.h         | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/sched.h            |  1 +
 kernel/fork.c                    |  1 +
 kernel/rcu/tasks.h               |  3 ++-
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..8da571622000 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trampoline_assert_none();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 44c07a66edff..b5c666c82479 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -180,6 +180,37 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 #ifdef CONFIG_TASKS_RCU_GENERIC
 
 # ifdef CONFIG_TASKS_RCU
+
+/*
+ * Trampoline nesting: dynamically allocated text (ftrace trampolines, BPF
+ * trampoline images, kprobe optinsn slots) that relies on Tasks RCU for its
+ * lifetime brackets itself with an increment/decrement of
+ * current->rcu_tramp_nesting.  While the count is non-zero the task is inside,
+ * or was called from, such text and an involuntary context switch must not be
+ * treated as a Tasks RCU quiescent state.
+ *
+ * Only current writes the count and only current (or an interrupt on the same
+ * CPU) reads it, so plain accesses suffice.
+ */
+static __always_inline void rcu_tasks_trampoline_enter(void)
+{
+	current->rcu_tramp_nesting++;
+	barrier();
+}
+
+static __always_inline void rcu_tasks_trampoline_exit(void)
+{
+	barrier();
+	current->rcu_tramp_nesting--;
+}
+
+/* A task must never reach userspace with a trampoline on its stack. */
+static __always_inline void rcu_tasks_trampoline_assert_none(void)
+{
+	if (IS_ENABLED(CONFIG_PROVE_RCU))
+		WARN_ON_ONCE(current->rcu_tramp_nesting);
+}
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
 		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
@@ -192,6 +223,9 @@ void rcu_tasks_torture_stats_print(char *tt, char *tf);
 # define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 # define call_rcu_tasks call_rcu
 # define synchronize_rcu_tasks synchronize_rcu
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -208,6 +242,9 @@ void exit_tasks_rcu_finish(void);
 #define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 #define rcu_tasks_qs(t, preempt) do { } while (0)
 #define rcu_note_voluntary_context_switch(t) do { } while (0)
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..d2e7b1b3c9d2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -956,6 +956,7 @@ struct task_struct {
 	unsigned long			rcu_tasks_nvcsw;
 	u8				rcu_tasks_holdout;
 	u8				rcu_tasks_idx;
+	int				rcu_tramp_nesting;
 	int				rcu_tasks_idle_cpu;
 	struct list_head		rcu_tasks_holdout_list;
 	int				rcu_tasks_exit_cpu;
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..cfe3a8e53fbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1869,6 +1869,7 @@ static inline void rcu_copy_process(struct task_struct *p)
 #endif /* #ifdef CONFIG_PREEMPT_RCU */
 #ifdef CONFIG_TASKS_RCU
 	p->rcu_tasks_holdout = false;
+	p->rcu_tramp_nesting = 0;
 	INIT_LIST_HEAD(&p->rcu_tasks_holdout_list);
 	p->rcu_tasks_idle_cpu = -1;
 	INIT_LIST_HEAD(&p->rcu_tasks_exit_list);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 627295396cd9..1662ba18bf34 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1113,10 +1113,11 @@ static void check_holdout_task(struct task_struct *t,
 		*firstreport = false;
 	}
 	cpu = task_cpu(t);
-	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d idle_cpu: %d/%d\n",
+	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d tramp_nesting: %d idle_cpu: %d/%d\n",
 		 t, ".I"[is_idle_task(t)],
 		 "N."[cpu < 0 || !tick_nohz_full_cpu(cpu)],
 		 t->rcu_tasks_nvcsw, t->nvcsw, t->rcu_tasks_holdout,
+		 data_race(t->rcu_tramp_nesting),
 		 data_race(t->rcu_tasks_idle_cpu), cpu);
 	sched_show_task(t);
 }

-- 
2.55.0


