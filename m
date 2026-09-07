Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD796C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnJS5sPm/eEb7Whkt9kcxmirJFvVGPcXcBd/GmZPmro=; b=Xsmj2itf4qy/rYE6vS2uS8dhq8
	qgsBtYz3Riqbc2rDTyGaQMZL8VBsGU+nz5nki3MDmR3Gagm8relIdx+INLpCxl1W2WkjFZz5qwX43
	Ian32NV/6cqi2wSrfyMtlWg32VaZvEFnCGdTRfSWTmvebuJPFbivnMFuXXJdt40YZgko7C8kL+epM
	sYDMF25G7Pa5poFQAv1L+urPm8yeExuiW71ccSTa93KOmQnmcvsXc7PHjbHs+OL+6gAAo6udMeAfX
	aW8VbNcAjtzUa6uA5TllvvgQWkZSsvpopSCI5zAzuyxqROAwIPv/EvQaSKUDMgGD592yDcj1AWIY5
	JderkrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPW-00000007M3B-30MA;
	Mon, 07 Sep 2026 16:41:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cPS-00000007LvZ-01Iv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE27640B3C;
	Mon,  7 Sep 2026 16:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5322E1F00A3A;
	Mon,  7 Sep 2026 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799289;
	bh=FnJS5sPm/eEb7Whkt9kcxmirJFvVGPcXcBd/GmZPmro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J2uS/ZFegs2bPuppfq4q61wHXjhXSfLLRSdpBWZhH+w4+qVa8fOQW9/6o2TzJkOtQ
	 FZT65VPKHBt+GTZ62Y2E+HYvukB6UTZNrolpdxuUCKppoYZX9aoL1jpAgd5wbXtaXf
	 2CIjKaPMrrXBp/fONa3f3cxwVC+3HUn8odmkz/lAd+NwG9GuE/5+0TMNIwNqZolVxV
	 4rFuseffS6u/SNKlmxqiXdtwlktQ0aYKUVl4TImp55PEb/JyceUhmIAXZ8fTyViHt1
	 Cbie8UGD6cfA+G8Mu3rNCoMxDTxeNdiyaAYkGJPxtH7Sh5v45F+a4qygfL1WBZwQgz
	 Zg2DoDSRIiCog==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 19/19] arm64: smp: Harden parallel CPU bringup against broken PSCI firmware
Date: Mon,  7 Sep 2026 17:40:22 +0100
Message-ID: <20260907164024.17164-20-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since firmware has occasionally been known to get things wrong, harden
our parallel CPU bringup code against a PSCI implementation that passes
the CPU_ON argument to an incorrect CPU.

The primary CPU writes the MPIDR of the incoming CPU to the end of its
task stack and this is then checked against the MPIDR_EL1 register
during early kernel entry. A mismatch is reported via the existing
failure reporting mechanism and the CPU is not brought online.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/smp.h    |  4 +++-
 arch/arm64/kernel/asm-offsets.c |  1 +
 arch/arm64/kernel/head.S        | 39 ++++++++++++++++++++++++++++-----
 arch/arm64/kernel/smp.c         | 11 ++++++++--
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 3decb42164aa..1ecfa4fa4f82 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -15,7 +15,9 @@
 /* Offsets for late (i.e. MMU-enabled) CPU boot reasons */
 /* Fatal system error detected by secondary CPU, crash the system */
 #define CPU_PANIC_KERNEL			(0)
-#define CPU_STATUS_FLAGS_MAX			(1)
+/* The PSCI v0.2+ implementation passed the wrong argument */
+#define CPU_BROKEN_PSCI_ARG			(1)
+#define CPU_STATUS_FLAGS_MAX			(2)
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..0cbd10af13ac 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -97,6 +97,7 @@ int main(void)
   BLANK();
 #endif
   DEFINE(CPU_BOOT_TASK,		offsetof(struct secondary_data, task));
+  DEFINE(CPU_BOOT_STATUS_FLAGS,	offsetof(struct secondary_data, status.flags));
   BLANK();
   DEFINE(FTR_OVR_VAL_OFFSET,	offsetof(struct arm64_ftr_override, val));
   DEFINE(FTR_OVR_MASK_OFFSET,	offsetof(struct arm64_ftr_override, mask));
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index bec4bc1b12db..56deeb9673d6 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -192,11 +192,21 @@ SYM_CODE_END(preserve_boot_args)
 	 * its location in the task stack. We reserve the entire pt_regs space
 	 * for consistency with user tasks and kthreads.
 	 */
-	.macro	init_cpu_task tsk, tmp1, tmp2
+	.macro	init_cpu_task tsk, tmp1, tmp2, check_mpidr=
 	msr	sp_el0, \tsk
 
 	ldr	\tmp1, [\tsk, #TSK_STACK]
-	add	sp, \tmp1, #THREAD_SIZE
+	mov	sp, \tmp1
+	.ifnb	\check_mpidr
+	mov_q	\tmp1, MPIDR_HWID_BITMASK
+	mrs	\tmp2, mpidr_el1
+	and	\tmp2, \tmp2, \tmp1
+	ldr	\tmp1, [sp]
+	sub	\tmp1, \tmp1, \tmp2
+	cbnz	\tmp1, __cpu_secondary_broken_psci_arg
+	.endif
+
+	add	sp, sp, #THREAD_SIZE
 	sub	sp, sp, #PT_REGS_SIZE
 
 	stp	xzr, xzr, [sp, #S_STACKFRAME]
@@ -401,11 +411,12 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
 	cbnz	x2, 1f
 	adr_l	x0, secondary_data
 	ldr	x2, [x0, #CPU_BOOT_TASK]
-	cbz	x2, __secondary_too_slow
-
-1:
 	init_cpu_task x2, x1, x3
-
+	cbnz	x2, 2f
+	b	__secondary_too_slow
+1:
+	init_cpu_task x2, x1, x3, check_mpidr=1
+2:
 #ifdef CONFIG_ARM64_PTR_AUTH
 	ptrauth_keys_init_cpu x2, x3, x4, x5
 #endif
@@ -451,6 +462,22 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
 	dc	ivac, \tmp1			// Invalidate potentially stale cache line
 	.endm
 
+	.macro	update_cpu_boot_status status, tmp1, tmp2
+	adr_l	\tmp1, secondary_data
+	add	\tmp1, \tmp1, #CPU_BOOT_STATUS_FLAGS + \status
+	mov	\tmp2, #1
+	strb	w\tmp2, [\tmp1]
+	.endm
+
+SYM_FUNC_START_LOCAL(__cpu_secondary_broken_psci_arg)
+	update_cpu_boot_status CPU_BROKEN_PSCI_ARG, x0, x1
+1:
+	wfe
+	wfi
+	b	1b
+SYM_FUNC_END(__cpu_secondary_broken_psci_arg)
+
+
 /*
  * Enable the MMU.
  *
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index d5da44949671..95af5384885b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -119,10 +119,12 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * We need to tell the secondary core where to find its stack and the
 	 * page tables.
 	 */
-	if (smp_parallel_bringup)
+	if (smp_parallel_bringup) {
+		*((u64 *)idle->stack) = cpu_logical_map(cpu);
 		arg = idle;
-	else
+	} else {
 		secondary_data.task = idle;
+	}
 
 	/* Now bring the CPU into our world */
 	if (ops->cpu_boot)
@@ -158,6 +160,11 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
 	}
 
 	status = READ_ONCE(secondary_data.status);
+	if (status.flags[CPU_BROKEN_PSCI_ARG]) {
+		pr_crit_once("CPU%u detected broken PSCI v0.2+ CPU_ON argument passing\n",
+			     cpu);
+	}
+
 	if (status.flags[CPU_PANIC_KERNEL])
 		panic("CPU%u detected unsupported configuration\n", cpu);
 
-- 
2.55.0.979.g7e5102b832-goog


