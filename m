Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45321C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaSkBg1gwRLv4QW0pPStlZCwsjMD0iYU2zavQE68qlw=; b=DToeKBZ/6Qxh8yHDlXcxUvjs6N
	UbPj9Z6vrcfGBchmFAnzOWIXHHZc5FFW/qTYnvik2lVbScWKnwrB0uDuTdfov8k8AYp4Zd2FcCusz
	JRvhu824uk6nvEuxo3JCAoWlN96+mglbkGGrKKkH6D6ROeZZVKjk83fBdvirWyHXtWGduN92dOTwY
	cOSZ3mxR1kxj5GDhoTqRI49aWXtxOgf/5+akUjTEOQPK2FqTx1vha0UFEPSFwirg1W6P4tNL2STFC
	Ory0ShnITM+jjX/69R1M4OPEawPO5n9F5/p4QFNMOfUyFF1sz0Olzth42SrM8raHNrADBgYMYisXd
	7cmJccJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53OB-0000000H62S-1vro;
	Fri, 11 Sep 2026 15:42:07 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53O3-0000000H5yC-3vHi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:42:02 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6f5fc7so681979eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789141319; x=1789746119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaSkBg1gwRLv4QW0pPStlZCwsjMD0iYU2zavQE68qlw=;
        b=uWIFoaMJYpwhzEv18D8tEdc+kWPtzU7pYbLF1E1jOlGm4ygx0CB7Etw+77DTZZTRdv
         UcimQE+GIrnOZjywraf6ShHhd7pC0vePwf2EHsk/aIfCE0OJB5pscIQRsRVz5hbE07Et
         TSqpvepk9VnZbNyBZ+/7sgdAbnJrXeNzgJ1y/mUwppnACqBZkpw020ou9CoyRABBqo5d
         bsZaOQrmWZScm4dAvIMwEiOqjiqJjdKmJnZYCs07Cd4y7BVMa8HIYbV22HjJyEmztaSL
         X3LvQ7Z0sJJ/X5XxdtA5Jzp6MYfv4xnwKC8aOWXbP9+z8n55K9Apsd6zbtLLiFmW0xU2
         VUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141319; x=1789746119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaSkBg1gwRLv4QW0pPStlZCwsjMD0iYU2zavQE68qlw=;
        b=hkWDv9oI3DY05LFXWasYwnUL6FzyudZhIDO0uZg/ieWPM3DDMDveV0Mwsn5IHIpKsf
         MnE+XZqqlGkYGN7iFCnbZ7BuMQHWKvs9qvMmagi53Q8iaXedexKE8mbvq52d5iW0m37H
         BDM6El7VDY+CVJLsJ1spG9xj0HwEpjCGWVk+yJpKKua16ErHu4lOMVAwIAwnuK/FJwMG
         axmuRFFBAGSinzE/titcvr/paJTmfsjJ9zF8EU292//jaQgE1OOTRb9IsJgUraLalVV0
         plVSmMlHxyiAlYZxBlgxa8VWVG9XsoIOZsgS0ilx3nCFeHQPpZ3Pvgglavzq8UhYQvof
         nveg==
X-Gm-Message-State: AFuF++m7tf/SlJBNmyJxWIXd+ZGhN6vZiSPA6MkMsWRE4vtPx7ZaW5as
	37f4uu928zMniIhFXnM4yxVrggDUjmhx4/wG2Mc+eYvMDZuGgn/lz+L13gKfwBFpPsc=
X-Gm-Gg: AYBFou1kcUI7lU7p8N++2XNJjIhWk4VfRQavvUdDFvHh0zqKvyAAhLWHrGh4ATwIT6e
	TC6xOdHBM/pJytJfSWbotZXgpqNpFZGSyFUmPSnuuBYSROh0ARQa5DSR0uUaejtjs/6wiUHl9Pp
	oupublhHuzc/GmMWwi9SRjFMNcb9R/X4HlXMSww33Bg/4zicoHH+dNoYOnskJZgvFyBA4IO7g0b
	NjTfd3i56xx0jHdkVOrr3eE28GaPQrORywG6undTTB56sbEsahnkuBpUcTyRlpQ/Y/BgvbEiV6Z
	a9LwrS8iVKfyvDwIan0uIizowBa98S/IF44zagDwTL0Nl6Wc4n9JEwtnpctPd2QP9xiSGCNEdcu
	3BWsmqMw5qbY/JFTjGG8aK7BzuXya1hNSBJMkxCxaNy6jMABIztCPTr27O8uDfrlhFaSwWHemin
	EEn+5Fa0dUOirKoVmbrlrFgW7xxhhtNd59oXTu9Bw/GYA9cWqjMvmwoOFdDO0bBu8LPgeUdXcML
	NvLKhVVsHto8TTSfoBkvVzXFZdi6mHEYCOzFTYMp4iH
X-Received: by 2002:a05:6820:571c:20b0:6b6:4f90:a62a with SMTP id 006d021491bc7-6c0ba8280bbmr4922795eaf.11.1789141319190;
        Fri, 11 Sep 2026 08:41:59 -0700 (PDT)
Received: from m2max ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2802199eaf.1.2026.09.11.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:41:58 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/15] arm64: implement thread identity handoff
Date: Fri, 11 Sep 2026 09:40:53 -0600
Message-ID: <20260911154148.644489-4-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911154148.644489-1-axboe@kernel.dk>
References: <20260911154148.644489-1-axboe@kernel.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_084201_315296_617940D1 
X-CRM114-Status: GOOD (  16.32  )
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

Implement the arch_thread_handoff_*() hooks and select
ARCH_HAS_THREAD_HANDOFF.

The source is inside a syscall, so only the FPSIMD view of the vector
registers needs to move. Tasks with SME streaming mode or ZA enabled,
compat tasks, tasks with a guarded control stack and tasks trapping
counter-timer access are refused.

Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 arch/arm64/Kconfig          |   1 +
 arch/arm64/kernel/process.c | 109 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..a919570c80cd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -46,6 +46,7 @@ config ARM64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
+	select ARCH_HAS_THREAD_HANDOFF
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..e669a2717106 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -11,6 +11,7 @@
 #include <linux/elf.h>
 #include <linux/export.h>
 #include <linux/sched.h>
+#include <linux/thread_handoff.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
@@ -1003,3 +1004,111 @@ int set_tsc_mode(unsigned int val)
 
 	return do_set_tsc_mode(val);
 }
+
+#ifdef CONFIG_THREAD_HANDOFF
+/*
+ * Thread identity handoff. The source is inside a syscall, so only the FPSIMD
+ * view of the vector registers needs to move. SME state is refused.
+ */
+static bool thread_handoff_task_ok(struct task_struct *tsk)
+{
+	if (is_compat_thread(task_thread_info(tsk)))
+		return false;
+	/* the GCS is per-thread and would have to move along */
+	if (task_gcs_el0_enabled(tsk))
+		return false;
+	/* counter-timer trapping doesn't move, see update_cntkctl_el1() */
+	if (test_tsk_thread_flag(tsk, TIF_TSC_SIGSEGV))
+		return false;
+	return true;
+}
+
+bool arch_thread_handoff_allowed(struct task_struct *tsk)
+{
+	return thread_handoff_task_ok(tsk);
+}
+
+bool arch_thread_handoff_compatible(struct task_struct *src,
+				    struct task_struct *dst)
+{
+	return thread_handoff_task_ok(dst);
+}
+
+/* sync the live user state, fpsimd_syscall_enter() guarantees FPSIMD format */
+bool arch_thread_handoff_prepare(void)
+{
+	struct thread_struct *thread = &current->thread;
+
+	fpsimd_preserve_current_state();
+	tls_preserve_current_state();
+	if (system_supports_poe())
+		thread->por_el0 = read_sysreg_s(SYS_POR_EL0);
+
+	if (WARN_ON_ONCE(thread->fp_type != FP_STATE_FPSIMD))
+		return false;
+	/* ZA and streaming mode state doesn't move, for now */
+	if (thread_sm_enabled(thread) || thread_za_enabled(thread))
+		return false;
+	return true;
+}
+
+/* copy the user register state over, load what the return to user won't */
+int arch_thread_handoff_finish(struct task_struct *src, bool leader)
+{
+	struct task_struct *dst = current;
+	struct pt_regs *regs = task_pt_regs(dst);
+	struct frame_record_meta stackframe = regs->stackframe;
+
+	/* the syscall frame, this is what the return to userspace restores */
+	*regs = *task_pt_regs(src);
+	regs->stackframe = stackframe;
+
+	/*
+	 * Marks our FP state foreign so nothing saves over what's copied in
+	 * below, and frees the SVE/SME buffers, the vector lengths may differ.
+	 */
+	fpsimd_flush_thread();
+
+	preempt_disable();
+
+	dst->thread.uw = src->thread.uw;
+	dst->thread.fp_type = FP_STATE_FPSIMD;
+	memcpy(dst->thread.vl, src->thread.vl, sizeof(dst->thread.vl));
+	memcpy(dst->thread.vl_onexec, src->thread.vl_onexec,
+	       sizeof(dst->thread.vl_onexec));
+	dst->thread.svcr = src->thread.svcr;
+	dst->thread.tpidr2_el0 = src->thread.tpidr2_el0;
+	dst->thread.por_el0 = src->thread.por_el0;
+	dst->thread.sctlr_user = src->thread.sctlr_user;
+#ifdef CONFIG_ARM64_MTE
+	dst->thread.mte_ctrl = src->thread.mte_ctrl;
+#endif
+#ifdef CONFIG_ARM64_PTR_AUTH
+	dst->thread.keys_user = src->thread.keys_user;
+#endif
+	update_tsk_thread_flag(dst, TIF_SVE_VL_INHERIT,
+			       test_tsk_thread_flag(src, TIF_SVE_VL_INHERIT));
+	update_tsk_thread_flag(dst, TIF_SME_VL_INHERIT,
+			       test_tsk_thread_flag(src, TIF_SME_VL_INHERIT));
+	update_tsk_thread_flag(dst, TIF_TAGGED_ADDR,
+			       test_tsk_thread_flag(src, TIF_TAGGED_ADDR));
+	update_tsk_thread_flag(dst, TIF_SSBD,
+			       test_tsk_thread_flag(src, TIF_SSBD));
+	if (test_and_clear_tsk_thread_flag(src, TIF_MTE_ASYNC_FAULT))
+		set_tsk_thread_flag(dst, TIF_MTE_ASYNC_FAULT);
+
+	/* load what __switch_to() would have, FPSIMD gets restored on exit */
+	write_sysreg(dst->thread.uw.tp_value, tpidr_el0);
+	if (system_supports_tpidr2())
+		write_sysreg_s(dst->thread.tpidr2_el0, SYS_TPIDR2_EL0);
+	if (system_supports_poe())
+		write_sysreg_s(dst->thread.por_el0, SYS_POR_EL0);
+	contextidr_thread_switch(dst);
+	ptrauth_thread_switch_user(dst);
+	mte_thread_switch(dst);
+	update_sctlr_el1(dst->thread.sctlr_user);
+
+	preempt_enable();
+	return 0;
+}
+#endif
-- 
2.55.0


