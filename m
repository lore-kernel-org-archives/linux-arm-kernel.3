Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD6C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd+hpYguRm0/LXSau2U/e2KAtn148hROAqJ+zClJj0g=; b=WqvH/tuVcWY+GoUUxSrvrI4HHK
	IudHYlq2f6U2Rv5W3YUDADTZyKlr0T9oEMcyADffh0aP4+ty31Zj/xlzy0ZuFJUwLInt8lF+h8c3X
	EtTuVDS27+cuDpQdddYcjMbcbi8CufFG8/awl+AqtyQx5SaCNxYP7ejixwXIwMqMWEbObNatHZXk2
	PTih0PV0S2e1h2VuI0857sPYjjU0OC2VByvqJ1Bd4KNy/fnl6kDXZ+6Um2WlK7sNLkkp0dbCJMaab
	TKZYS6covzkSu5nE5Cr7+rDmq+DsFZ1a7EsBssKOpF0YvTIhnK6qWPP1uMTDaJE/rXllmE3SyHtaD
	bFBqigFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OB-0000000H62z-2TAz;
	Fri, 11 Sep 2026 15:42:07 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O5-0000000H5yD-2Vn9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:02 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7f84a55cc06so964713a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141320; x=1789746120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd+hpYguRm0/LXSau2U/e2KAtn148hROAqJ+zClJj0g=;
        b=L+EtHFZWcqmQ7ZvXnjmd4sltocvJS92wzkB7A8vIbYX8218oQjmSTiBx8mXIfVh0j8
         4ML1xoZy+GnzkBeco8MAsCRKJeJlBwmW3Lbsh8uyedcsT44CRYF2G6PJNinNsj47Aj6W
         DOa/yPjrRmHFN9NDBTea4BrCvZ8vg/RtmheOEjvV0+nk/zvtT9yBWQtGpvYPJS8fveMA
         dZZv/+TGlPMu8TT/dEZpDBF98YSBL6sVyMq5cBidlc5mXsS32rcFQgNaKylTIwcOKEgD
         fDvt8zJX2kPUkEiCORsyAKib66n8VYhNUb1whiv/8qocWv1bBxJzAkiBOZfZOj0Hqtyf
         wQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141320; x=1789746120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd+hpYguRm0/LXSau2U/e2KAtn148hROAqJ+zClJj0g=;
        b=WL7z6jDeyM81Tlz8hmBJiyeLnlUlsd1Ru/Ow6x5MZaQfyqV4+JIVrlI5H8a7e+bGe7
         SAUh3A/pstLC1eGE9zQFFCqXdLrf8C/iMgY9HBxYYUpOImCZdbrn7ug4i5fuWsBstTjR
         zB7K8AvUAM2oYq5Cf7k1F1vIYdepKhEPGfa8AgGgfMR5Iviq2rWtznNgyCIInho6q92s
         VBAYpSj0IivNHt5oz4uqdzE50El75ZyUgonOGUUWCqcTrWCchMY4TFNW1ark6AxOzakH
         DeCvRYQEJ37gl41t/aJ1yGGBknzfBPOrSJkB1mYHC8L9WRsa0pHfJqamt5N3vxEjAV5c
         gqRA==
X-Gm-Message-State: AFuF++kdGLXSPb2JDyO8qBMTsY21qHdNjqrlplxVAI8JaBJmUlDJBsga
	OFLGdld+m9GI+4ENMaFSEkBmPZFyvcK7xOp7HYi8P5LNDQwoOve9FkPMoLbcwHywb4U=
X-Gm-Gg: AYBFou2tVcql/kg5s0gdQRRimYxJRXiRMn34jpDZJ9BYPYH68MjCuclAs9NM7htX3JO
	QU6rJt3XqArs98vx0/PuDht5CcD6tHwPkXLEoT0oU1eGgIxEBWcj2/e6FBvGQEz9EhwMSFNZthb
	RikEZsJcj5JpZhNJP+j8cMXqLw/PHz+SSdLWAYt3sMYM1Ho5xzX237QxdEq9IxBzFeLSyk36U0J
	4Ef8seExsDjSYKos7tf1RgI8yoEfAsp6RybdGDHP60lxYTbq/DkOyD9Z/LCWQmbJqe2XrOkyKaN
	d0N1TuK2UIWV6gRLemXNHufQdl2GMdrvexqw95JOBKPf79eQROC5Hg27nzdyECtEZfVC7ITMlyv
	5NM/9g4kakvyZSCG33W8a/S6jX5KWfh/qtIQ59ZhFSGxIFiRBzj85WGue09qSTVpkPFwq1J17xd
	lIr8GvCvYElAQvKylpcNvGKtxgMqLx2D7ES9PhnVFC5KFOUfRbtbic6sDWrKecuHcu5BkN15FGP
	b4Gn5M/Y91omq6c6HbW1sHSWisbygcoAoOUBlq4LixR
X-Received: by 2002:a05:6820:491a:b0:6b7:46fc:1d3 with SMTP id 006d021491bc7-6c0bd587be9mr2976582eaf.50.1789141320381;
        Fri, 11 Sep 2026 08:42:00 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/15] x86: implement thread identity handoff
Date: Fri, 11 Sep 2026 09:40:54 -0600
Message-ID: <20260911154148.644489-5-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084201_724892_C17EB033 
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

Implement the arch_thread_handoff_*() hooks for 64-bit x86 and select
ARCH_HAS_THREAD_HANDOFF.

Prepare saves FS/GS, PKRU and the FPU state. Finish copies the syscall
pt_regs, fault info and FPU image over, and loads what __switch_to()
would have. Refused are 32-bit tasks, I/O bitmaps and emulated iopl,
per-thread speculation and CPUID/TSC controls, user shadow stacks and
non-default sized fpstates.

ret_from_fork() now returns what the thread function returns in
regs->ax rather than 0. A kernel thread returning from kernel_execve()
returns 0 anyway, an io-wq worker that got handed a user identity
returns the result of the syscall it took over.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 arch/x86/Kconfig             |   1 +
 arch/x86/kernel/process.c    |  10 +--
 arch/x86/kernel/process_64.c | 139 +++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..4f53859d0228 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -109,6 +109,7 @@ config X86
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
+	select ARCH_HAS_THREAD_HANDOFF		if X86_64
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..ed52af862392 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -155,13 +155,13 @@ __visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
 
 	/* Is this a kernel thread? */
 	if (unlikely(fn)) {
-		fn(fn_arg);
+		long ret = fn(fn_arg);
+
 		/*
-		 * A kernel thread is allowed to return here after successfully
-		 * calling kernel_execve().  Exit to userspace to complete the
-		 * execve() syscall.
+		 * A kernel thread returning from kernel_execve(), or an io-wq
+		 * worker returning the result of a syscall it took over.
 		 */
-		regs->ax = 0;
+		regs->ax = ret;
 	}
 
 	syscall_exit_to_user_mode(regs);
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 2bce7b3f97ed..0f07e9a6bb02 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -41,10 +41,12 @@
 #include <linux/ftrace.h>
 #include <linux/syscalls.h>
 #include <linux/iommu.h>
+#include <linux/thread_handoff.h>
 
 #include <asm/processor.h>
 #include <asm/pkru.h>
 #include <asm/fpu/sched.h>
+#include <asm/fpu/xstate.h>
 #include <asm/mmu_context.h>
 #include <asm/prctl.h>
 #include <asm/desc.h>
@@ -980,3 +982,140 @@ long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
 
 	return ret;
 }
+
+#ifdef CONFIG_THREAD_HANDOFF
+/* Thread identity handoff, see include/linux/thread_handoff.h */
+
+/* prctl driven per-thread controls that __switch_to_xtra() applies */
+#define THREAD_HANDOFF_TIF_MATCH \
+	(_TIF_SSBD | _TIF_SPEC_IB | _TIF_NOCPUID | _TIF_NOTSC)
+
+/* state bound to the task that neither side may have */
+static bool thread_handoff_task_ok(struct task_struct *tsk)
+{
+	/* I/O permissions, the bitmap hangs off the task */
+	if (test_tsk_thread_flag(tsk, TIF_IO_BITMAP) || tsk->thread.iopl_emul)
+		return false;
+#ifdef CONFIG_X86_USER_SHADOW_STACK
+	/* the shadow stack is per-thread and would have to move along */
+	if (tsk->thread.features & ARCH_SHSTK_SHSTK)
+		return false;
+#endif
+	/* only the default sized FPU state gets copied over, no AMX */
+	if (x86_task_fpu(tsk)->fpstate->is_valloc)
+		return false;
+	return true;
+}
+
+bool arch_thread_handoff_allowed(struct task_struct *tsk)
+{
+	/* 64-bit tasks only */
+	if (test_tsk_thread_flag(tsk, TIF_ADDR32))
+		return false;
+	return thread_handoff_task_ok(tsk);
+}
+
+bool arch_thread_handoff_compatible(struct task_struct *src,
+				    struct task_struct *dst)
+{
+	/* these don't move, must match. They're usually applied process wide */
+	if ((read_task_thread_flags(src) ^ read_task_thread_flags(dst)) &
+	    THREAD_HANDOFF_TIF_MATCH)
+		return false;
+	return thread_handoff_task_ok(dst);
+}
+
+/*
+ * Sync the live user register state. TIF_NEED_FPU_LOAD makes the in-memory
+ * FPU image final, later context switches won't write it again.
+ */
+bool arch_thread_handoff_prepare(void)
+{
+	current_save_fsgs();
+	/* thread.pkru is only valid when scheduled out, make it so */
+	if (cpu_feature_enabled(X86_FEATURE_OSPKE))
+		current->thread.pkru = read_pkru();
+	fpregs_lock();
+	if (!test_thread_flag(TIF_NEED_FPU_LOAD)) {
+		save_fpregs_to_fpstate(x86_task_fpu(current));
+		set_thread_flag(TIF_NEED_FPU_LOAD);
+	}
+	fpregs_unlock();
+	return true;
+}
+
+/* copy the user register state over, load what __switch_to() would have */
+int arch_thread_handoff_finish(struct task_struct *src, bool leader)
+{
+	struct task_struct *dst = current;
+	struct thread_struct *t = &dst->thread, *s = &src->thread;
+	struct fpu *dst_fpu = x86_task_fpu(dst), *src_fpu = x86_task_fpu(src);
+	struct thread_struct prev;
+
+	/* the syscall frame, this is what the return to userspace restores */
+	*task_pt_regs(dst) = *task_pt_regs(src);
+
+	/* fault info, in case a signal for it is pending */
+	t->cr2 = s->cr2;
+	t->trap_nr = s->trap_nr;
+	t->error_code = s->error_code;
+
+	/*
+	 * Dynamic xstate permissions are a property of the process but live
+	 * in the group leader's struct fpu, see xstate_get_group_perm().
+	 */
+	if (leader && fpu_state_size_dynamic()) {
+		struct sighand_struct *sighand;
+
+		sighand = rcu_dereference_protected(dst->sighand, true);
+		spin_lock_irq(&sighand->siglock);
+		dst_fpu->perm = src_fpu->perm;
+		dst_fpu->guest_perm = src_fpu->guest_perm;
+		spin_unlock_irq(&sighand->siglock);
+	}
+
+	/* both sides have the default sized fpstate, reload on the way out */
+	fpregs_lock();
+	memcpy(&dst_fpu->fpstate->regs, &src_fpu->fpstate->regs,
+	       src_fpu->fpstate->size);
+	dst_fpu->last_cpu = -1;
+	set_thread_flag(TIF_NEED_FPU_LOAD);
+	fpregs_unlock();
+
+	preempt_disable();
+
+	memcpy(t->tls_array, s->tls_array, sizeof(t->tls_array));
+	load_TLS(t, smp_processor_id());
+
+	savesegment(es, t->es);
+	if (unlikely(t->es | s->es))
+		loadsegment(es, s->es);
+	t->es = s->es;
+	savesegment(ds, t->ds);
+	if (unlikely(t->ds | s->ds))
+		loadsegment(ds, s->ds);
+	t->ds = s->ds;
+
+	/* FS/GS, the legacy load path needs to know what the CPU holds now */
+	local_irq_disable();
+	save_fsgs(dst);
+	prev.fsindex = t->fsindex;
+	prev.fsbase = t->fsbase;
+	prev.gsindex = t->gsindex;
+	prev.gsbase = t->gsbase;
+	t->fsindex = s->fsindex;
+	t->fsbase = s->fsbase;
+	t->gsindex = s->gsindex;
+	t->gsbase = s->gsbase;
+	x86_fsgsbase_load(&prev, t);
+	local_irq_enable();
+
+	if (cpu_feature_enabled(X86_FEATURE_OSPKE)) {
+		t->pkru = s->pkru;
+		write_pkru(t->pkru);
+	}
+
+	preempt_enable();
+	return 0;
+}
+#endif
-- 
2.55.0


