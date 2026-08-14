Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E90C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVRImTDaZs6cs5rh3bC1e77VibQeuPdYT8n/nwR/meA=; b=d615n0LmagZEqH
	pXHBm6Txsrt8XLcCYbRlL4UX31/1VVzpG3WUh+pxjBphoa3mQLrsREt0Ij/mH+rH7Nov6x7VLgaRm
	J7BCKLz15ho5t9OYV5tB5vn+gtMNrioKtnFLjjbyM9fcbGqNwyu8S9ick+Z0qkT0TxoHS6XfD9nHy
	k4mPUL9V0qVWaxyj+xcZJXno+oNnB8qP1PvRnSMtLW9Ryrsp8uYok0HoyVVekkoZ/z0RuTljam8D3
	Xbutuv5mKC0h17UA9fgem+Stwg0FQAUNsoFo56KE4hMHQ47vk9ZKCHF/dVbhw0KePms24Iqfdkthm
	JQEFFEsBh0v32tl3COzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wundR-00000002JzD-3drZ;
	Fri, 14 Aug 2026 08:51:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wundO-00000002Jxz-0zQu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:51:28 +0000
Date: Fri, 14 Aug 2026 10:51:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786697481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GVRImTDaZs6cs5rh3bC1e77VibQeuPdYT8n/nwR/meA=;
	b=Ol815WhQ6JnzXMGAYywjq9AyasEVlbbLbEw38nKeKXE5qCHE2T58DWCpFs3xPEmF8rQbNI
	9UTUaxkYxdSqMzv61/aeJEc/l/RP2UHi9M8emW5t0wmy1dc37InCmat1bbqouW9sBrP3Jc
	hdTm/z7NjucvP7SG/te1SpHxDXhgKZ2g0YOkA3Uzhuv/v0AgQ28foEo51ig6cO+osb/oyH
	LiYAg/9YhUmwKzO4Rg6YoN78JRWYTEQo+KHie3+jw0Q/fKg+RqbXQ15zYkKoKE8NM7onKe
	WjBPpJm+lPfMj12ZbBqNudjg7ADrJjcsh7Q4rTVhcuAF7w7+oXEM0HdA/u9Ufg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786697481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GVRImTDaZs6cs5rh3bC1e77VibQeuPdYT8n/nwR/meA=;
	b=C4OcThFk7xmv/cu7KFw4W9DLDTGOj2lKXa52tH+vvetyG6iwEJozfD1iDDfNcTPpbbgGGN
	cdO2nn8s6pTUvhAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <20260814085118.OPEA_Ssn@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_015126_416030_DA06075A 
X-CRM114-Status: GOOD (  18.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, James Clark <james.clark@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Oleg Nesterov <oleg@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Waiman Long <longman@redhat.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Clark Williams <clrkwllms@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
"sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
delivered with disabled interrupts and perf intrastrucure expects
disabled interrupts while the overflow callback is invoked.

The callback then sends a SIGTRAP signal for which it acquires
sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
must not be acquired in atomic context.

Delay the event callback until the return to userland.
Add perf_arch_hwbp_notify(), a generic perf callback which delayes the
actual callback invocation to task_work_add() callback. This callback
invokes the architecture defines callback arch_hwbp_send_sig().
This requires struct callback_head and the functions require
ARCH_NEED_PERF_HW_NOTIF to be defined.

This was reported against ARM64. ARM and LongARCH follow the same
pattern are also converted.

Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
Reported-by: Waiman Long <longman@redhat.com>
Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: https://lore.kernel.org/all/20260713144939.FuCj9yvZ@linutron=
ix.de/
 - sashiko complained that a memory breakpoint might trigger several
   times before a signal is sent if the syscall touches the memory (via
   get_user()) more than once before returning back. This would lead to
   list corruption in task_work_add(). To handle this, there is now a
   variable which is set via xchg before task_work_add() and cleared
   after the signal has been sent.

 arch/arm/include/asm/hw_breakpoint.h       |  1 +
 arch/arm/kernel/ptrace.c                   |  6 ++---
 arch/arm64/include/asm/hw_breakpoint.h     |  1 +
 arch/arm64/kernel/ptrace.c                 |  6 ++---
 arch/loongarch/include/asm/hw_breakpoint.h |  1 +
 arch/loongarch/kernel/ptrace.c             |  6 ++---
 include/linux/hw_breakpoint.h              |  3 +++
 include/linux/perf_event.h                 |  4 ++++
 kernel/events/core.c                       | 26 ++++++++++++++++++++++
 9 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/hw_breakpoint.h b/arch/arm/include/asm/hw=
_breakpoint.h
index e7f9961c53b2d..5b3a373348ff5 100644
--- a/arch/arm/include/asm/hw_breakpoint.h
+++ b/arch/arm/include/asm/hw_breakpoint.h
@@ -7,6 +7,7 @@
 struct task_struct;
=20
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
+#define ARCH_NEED_PERF_HW_NOTIF
=20
 struct arch_hw_breakpoint_ctrl {
 		u32 __reserved	: 9,
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 7951b2c06fec6..1650f12a04702 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -347,9 +347,7 @@ static long ptrace_hbp_idx_to_num(int idx)
 /*
  * Handle hitting a HW-breakpoint.
  */
-static void ptrace_hbptriggered(struct perf_event *bp,
-				     struct perf_sample_data *data,
-				     struct pt_regs *regs)
+void arch_hwbp_send_sig(struct perf_event *bp)
 {
 	struct arch_hw_breakpoint *bkpt =3D counter_arch_bp(bp);
 	long num;
@@ -424,7 +422,7 @@ static struct perf_event *ptrace_hbp_create(struct task=
_struct *tsk, int type)
 	attr.bp_type	=3D type;
 	attr.disabled	=3D 1;
=20
-	return register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL,
+	return register_user_hw_breakpoint(&attr, perf_arch_hwbp_notify, NULL,
 					   tsk);
 }
=20
diff --git a/arch/arm64/include/asm/hw_breakpoint.h b/arch/arm64/include/as=
m/hw_breakpoint.h
index bd81cf17744af..58befb79c885c 100644
--- a/arch/arm64/include/asm/hw_breakpoint.h
+++ b/arch/arm64/include/asm/hw_breakpoint.h
@@ -124,6 +124,7 @@ extern void hw_breakpoint_pmu_read(struct perf_event *b=
p);
 extern int hw_breakpoint_slots(int type);
=20
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
+#define ARCH_NEED_PERF_HW_NOTIF
 extern void hw_breakpoint_thread_switch(struct task_struct *next);
 extern void ptrace_hw_copy_thread(struct task_struct *task);
 #else
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891d..df6122779ada6 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -168,9 +168,7 @@ void ptrace_disable(struct task_struct *child)
 /*
  * Handle hitting a HW-breakpoint.
  */
-static void ptrace_hbptriggered(struct perf_event *bp,
-				struct perf_sample_data *data,
-				struct pt_regs *regs)
+void arch_hwbp_send_sig(struct perf_event *bp)
 {
 	struct arch_hw_breakpoint *bkpt =3D counter_arch_bp(bp);
 	const char *desc =3D "Hardware breakpoint trap (ptrace)";
@@ -312,7 +310,7 @@ static struct perf_event *ptrace_hbp_create(unsigned in=
t note_type,
 	attr.bp_type	=3D type;
 	attr.disabled	=3D 1;
=20
-	bp =3D register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL, tsk);
+	bp =3D register_user_hw_breakpoint(&attr, perf_arch_hwbp_notify, NULL, ts=
k);
 	if (IS_ERR(bp))
 		return bp;
=20
diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/in=
clude/asm/hw_breakpoint.h
index 5faa97a87a9e2..2b51922eb5492 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -120,6 +120,7 @@ void breakpoint_handler(struct pt_regs *regs);
 void watchpoint_handler(struct pt_regs *regs);
=20
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
+#define ARCH_NEED_PERF_HW_NOTIF
 extern void ptrace_hw_copy_thread(struct task_struct *task);
 extern void hw_breakpoint_thread_switch(struct task_struct *next);
 #else
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index be38430f7e280..1d5e05a70b8d3 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -384,9 +384,7 @@ static int lbt_set(struct task_struct *target,
 /*
  * Handle hitting a HW-breakpoint.
  */
-static void ptrace_hbptriggered(struct perf_event *bp,
-				struct perf_sample_data *data,
-				struct pt_regs *regs)
+void arch_hwbp_send_sig(struct perf_event *bp)
 {
 	int i;
 	struct arch_hw_breakpoint *bkpt =3D counter_arch_bp(bp);
@@ -479,7 +477,7 @@ static struct perf_event *ptrace_hbp_create(unsigned in=
t note_type,
 	attr.bp_type	=3D type;
 	attr.disabled	=3D 1;
=20
-	bp =3D register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL, tsk);
+	bp =3D register_user_hw_breakpoint(&attr, perf_arch_hwbp_notify, NULL, ts=
k);
 	if (IS_ERR(bp))
 		return bp;
=20
diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index db199d653dd1a..bb4c1064a103d 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -85,6 +85,9 @@ extern int register_perf_hw_breakpoint(struct perf_event =
*bp);
 extern void unregister_hw_breakpoint(struct perf_event *bp);
 extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cp=
u_events);
 extern bool hw_breakpoint_is_used(void);
+extern void arch_hwbp_send_sig(struct perf_event *bp);
+extern void perf_arch_hwbp_notify(struct perf_event *bp, struct perf_sampl=
e_data *data,
+				  struct pt_regs *regs);
=20
 extern int dbg_reserve_bp_slot(struct perf_event *bp);
 extern int dbg_release_bp_slot(struct perf_event *bp);
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea5..45c8391975007 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -215,6 +215,10 @@ struct hw_perf_event {
=20
 	/* Last sync'ed generation of filters */
 	unsigned long			addr_filters_gen;
+#ifdef ARCH_NEED_PERF_HW_NOTIF
+	struct callback_head		arch_hw_notif;
+	int				arch_hw_notif_busy;
+#endif
=20
 /*
  * hw_perf_event::state flags; used to track the PERF_EF_* state.
diff --git a/kernel/events/core.c b/kernel/events/core.c
index ba5bd6a78fe7b..1ca91208e1524 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13338,6 +13338,28 @@ static void account_event(struct perf_event *event)
 	account_pmu_sb_event(event);
 }
=20
+#ifdef ARCH_NEED_PERF_HW_NOTIF
+static void perf_arch_hwbp_send_sig(struct callback_head *head)
+{
+	struct perf_event *bp;
+
+	bp =3D container_of(head, struct perf_event, hw.arch_hw_notif);
+	arch_hwbp_send_sig(bp);
+	xchg_relaxed(&bp->hw.arch_hw_notif_busy, 0);
+	put_event(bp);
+}
+
+void perf_arch_hwbp_notify(struct perf_event *bp, struct perf_sample_data =
*data,
+			   struct pt_regs *regs)
+{
+	if (WARN_ON_ONCE(!atomic_long_inc_not_zero(&bp->refcount)))
+		return;
+	if (xchg_relaxed(&bp->hw.arch_hw_notif_busy, 1) ||
+	    WARN_ON_ONCE(task_work_add(current, &bp->hw.arch_hw_notif, TWA_RESUME=
)))
+		put_event(bp);
+}
+#endif
+
 /*
  * Allocate and initialize an event structure
  */
@@ -13443,6 +13465,10 @@ perf_event_alloc(struct perf_event_attr *attr, int=
 cpu,
 	}
=20
 	if (overflow_handler) {
+#ifdef ARCH_NEED_PERF_HW_NOTIF
+		if (overflow_handler =3D=3D perf_arch_hwbp_notify)
+			init_task_work(&event->hw.arch_hw_notif, perf_arch_hwbp_send_sig);
+#endif
 		event->overflow_handler	=3D overflow_handler;
 		event->overflow_handler_context =3D context;
 	} else if (is_write_backward(event)){
--=20
2.55.0


