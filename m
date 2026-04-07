Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA4EDB7ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWU3QxEeGhRXaA37+NkM+GLDlHDHlcdWKYCt2Fr8esg=; b=5G8FJFTPPR4sUB1EM7LM7YJPXH
	CPv7OiNc/uK76aPPab3Rt/6yIU4ljFFGkdvtWk6f1SnZqG+ncw2BSjroeDU+g8uIdIftfN+tkCaL/
	wW4YtR81nz6HoprSxrmXQx4gwstnjJ8N6q7DwXxDA1B+aihbKftCK1R6PjeRik/zDyCp2RfPPzwcY
	FfKzNd1WyUTUeW9uL8yZKSXsOivljh/LYg5Zu9gDD5PCqzvylT3/UYlufewodj57Ao5jJ1M4AkZCZ
	pb9ul7p0DMybgXH39XyAO0MkAs/ymJBLEsZnfcVuQNN2Hefa6RDfgcrOSisRxfekKvW6APoImDwjm
	FZe876yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3g4-00000006HsW-1sRF;
	Tue, 07 Apr 2026 10:29:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3g0-00000006Hox-0Ggo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:28:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733D21C14;
	Tue,  7 Apr 2026 03:28:49 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420193F641;
	Tue,  7 Apr 2026 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775557735; bh=I2AOfXjurNGrbNPAxbY4pXZ5naLj5jG47+iD3xzbnzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEIMrC3RLYG17gPzdUAnRci+1np4vB6ykHo8tBdcM8gnv7wmPBhIa2ZL4GPCJmgTK
	 /KyxGtUT+OBwYohVy328kI9L5EH8gPMgLQJbIFxmMiaF9deDRedjG2712EwsF+fn0P
	 +dzaCk86ovufJxh4QUT2A7xDEqWUN+IixItWsMJ4=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 4/4] arm64: errata: Work around early CME DVMSync acknowledgement
Date: Tue,  7 Apr 2026 11:28:44 +0100
Message-ID: <20260407102848.2266988-5-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407102848.2266988-1-catalin.marinas@arm.com>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032856_186731_808DBEC1 
X-CRM114-Status: GOOD (  29.22  )
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

C1-Pro acknowledges DVMSync messages before completing the SME/CME
memory accesses. Work around this by issuing an IPI to the affected CPUs
if they are running in EL0 with SME enabled.

Note that we avoid the local DSB in the IPI handler as the kernel runs
with SCTLR_EL1.IESB=1. This is sufficient to complete SME memory
accesses at EL0 on taking an exception to EL1. On the return to user
path, no barrier is necessary either. See the comment in
sme_set_active() and the more detailed explanation in the link below.

To avoid a potential IPI flood from malicious applications (e.g.
madvise(MADV_PAGEOUT) in a tight loop), track where a process is active
via mm_cpumask() and only interrupt those CPUs.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 12 ++++
 arch/arm64/include/asm/cpucaps.h            |  2 +
 arch/arm64/include/asm/fpsimd.h             | 21 ++++++
 arch/arm64/include/asm/tlbbatch.h           | 10 ++-
 arch/arm64/include/asm/tlbflush.h           | 72 ++++++++++++++++++-
 arch/arm64/kernel/cpu_errata.c              | 30 ++++++++
 arch/arm64/kernel/entry-common.c            |  3 +
 arch/arm64/kernel/fpsimd.c                  | 79 +++++++++++++++++++++
 arch/arm64/kernel/process.c                 | 36 ++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 11 files changed, 264 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 4c300caad901..282ad4257983 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -202,6 +202,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..9b419f1a9ae6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1175,6 +1175,18 @@ config ARM64_ERRATUM_4311569
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_4193714
+	bool "C1-Pro: 4193714: SME DVMSync early acknowledgement"
+	depends on ARM64_SME
+	default y
+	help
+	  Enable workaround for C1-Pro acknowledging the DVMSync before
+	  the SME memory accesses are complete. This will cause TLB
+	  maintenance for processes using SME to also issue an IPI to
+	  the affected CPUs.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 177c691914f8..0b1b78a4c03e 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -64,6 +64,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
+	case ARM64_WORKAROUND_4193714:
+		return IS_ENABLED(CONFIG_ARM64_ERRATUM_4193714);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 1d2e33559bd5..d9d00b45ab11 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -428,6 +428,24 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return __sme_state_size(task_get_sme_vl(task));
 }
 
+void sme_enable_dvmsync(void);
+void sme_set_active(void);
+void sme_clear_active(void);
+
+static inline void sme_enter_from_user_mode(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+	    test_thread_flag(TIF_SME))
+		sme_clear_active();
+}
+
+static inline void sme_exit_to_user_mode(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+	    test_thread_flag(TIF_SME))
+		sme_set_active();
+}
+
 #else
 
 static inline void sme_user_disable(void) { BUILD_BUG(); }
@@ -456,6 +474,9 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return 0;
 }
 
+static inline void sme_enter_from_user_mode(void) { }
+static inline void sme_exit_to_user_mode(void) { }
+
 #endif /* ! CONFIG_ARM64_SME */
 
 /* For use by EFI runtime services calls only */
diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
index fedb0b87b8db..6297631532e5 100644
--- a/arch/arm64/include/asm/tlbbatch.h
+++ b/arch/arm64/include/asm/tlbbatch.h
@@ -2,11 +2,17 @@
 #ifndef _ARCH_ARM64_TLBBATCH_H
 #define _ARCH_ARM64_TLBBATCH_H
 
+#include <linux/cpumask.h>
+
 struct arch_tlbflush_unmap_batch {
+#ifdef CONFIG_ARM64_ERRATUM_4193714
 	/*
-	 * For arm64, HW can do tlb shootdown, so we don't
-	 * need to record cpumask for sending IPI
+	 * Track CPUs that need SME DVMSync on completion of this batch.
+	 * Otherwise, the arm64 HW can do tlb shootdown, so we don't need to
+	 * record cpumask for sending IPI
 	 */
+	cpumask_var_t cpumask;
+#endif
 };
 
 #endif /* _ARCH_ARM64_TLBBATCH_H */
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 262791191935..4aae42b83049 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -80,6 +80,71 @@ static inline unsigned long get_trans_granule(void)
 	}
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+void sme_do_dvmsync(const struct cpumask *mask);
+
+static inline void sme_dvmsync(struct mm_struct *mm)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	sme_do_dvmsync(mm_cpumask(mm));
+}
+
+static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					   struct mm_struct *mm)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	/*
+	 * Order the mm_cpumask() read after the hardware DVMSync.
+	 */
+	dsb(ish);
+	if (cpumask_empty(mm_cpumask(mm)))
+		return;
+
+	/*
+	 * Allocate the batch cpumask on first use. Fall back to an immediate
+	 * IPI for this mm in case of failure.
+	 */
+	if (!cpumask_available(batch->cpumask) &&
+	    !zalloc_cpumask_var(&batch->cpumask, GFP_ATOMIC)) {
+		sme_do_dvmsync(mm_cpumask(mm));
+		return;
+	}
+
+	cpumask_or(batch->cpumask, batch->cpumask, mm_cpumask(mm));
+}
+
+static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	if (!cpumask_available(batch->cpumask))
+		return;
+
+	sme_do_dvmsync(batch->cpumask);
+	cpumask_clear(batch->cpumask);
+}
+
+#else
+
+static inline void sme_dvmsync(struct mm_struct *mm)
+{
+}
+static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					   struct mm_struct *mm)
+{
+}
+static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
+{
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 /*
  * Level-based TLBI operations.
  *
@@ -189,12 +254,14 @@ static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+	sme_dvmsync(mm);
 }
 
-static inline void __tlbi_sync_s1ish_batch(void)
+static inline void __tlbi_sync_s1ish_batch(struct arch_tlbflush_unmap_batch *batch)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+	sme_dvmsync_batch(batch);
 }
 
 static inline void __tlbi_sync_s1ish_kernel(void)
@@ -397,7 +464,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish_batch();
+	__tlbi_sync_s1ish_batch(batch);
 }
 
 /*
@@ -602,6 +669,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
+	sme_dvmsync_add_pending(batch, mm);
 }
 
 static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5c0ab6bfd44a..5377e4c2eba2 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -11,6 +11,7 @@
 #include <asm/cpu.h>
 #include <asm/cputype.h>
 #include <asm/cpufeature.h>
+#include <asm/fpsimd.h>
 #include <asm/kvm_asm.h>
 #include <asm/smp_plat.h>
 
@@ -575,6 +576,23 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+static bool has_sme_dvmsync_erratum(const struct arm64_cpu_capabilities *entry,
+				    int scope)
+{
+	if (!id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1)))
+		return false;
+
+	return is_affected_midr_range(entry, scope);
+}
+
+static void cpu_enable_sme_dvmsync(const struct arm64_cpu_capabilities *__unused)
+{
+	if (this_cpu_has_cap(ARM64_WORKAROUND_4193714))
+		sme_enable_dvmsync();
+}
+#endif
+
 #ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_38
 static const struct midr_range erratum_ac03_cpu_38_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
@@ -901,6 +919,18 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = need_arm_si_l1_workaround_4311569,
 	},
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+	{
+		.desc = "C1-Pro SME DVMSync early acknowledgement",
+		.capability = ARM64_WORKAROUND_4193714,
+		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+		.matches = has_sme_dvmsync_erratum,
+		.cpu_enable = cpu_enable_sme_dvmsync,
+		/* C1-Pro r0p0 - r1p2 (the latter only when REVIDR_EL1[0]==0) */
+		.midr_range = MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 2),
+		MIDR_FIXED(MIDR_CPU_VAR_REV(1, 2), BIT(0)),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 	{
 		.desc = "ARM errata 2966298, 3117295",
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8..fb1e374af622 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -21,6 +21,7 @@
 #include <asm/daifflags.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
+#include <asm/fpsimd.h>
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
@@ -67,6 +68,7 @@ static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 }
 
 /*
@@ -80,6 +82,7 @@ static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
 	local_irq_disable();
 	exit_to_user_mode_prepare_legacy(regs);
 	local_daif_mask();
+	sme_exit_to_user_mode();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
 }
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 9de1d8a604cb..60a45d600b46 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -15,6 +15,7 @@
 #include <linux/compiler.h>
 #include <linux/cpu.h>
 #include <linux/cpu_pm.h>
+#include <linux/cpumask.h>
 #include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/linkage.h>
@@ -28,6 +29,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/signal.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
 #include <linux/stddef.h>
 #include <linux/sysctl.h>
 #include <linux/swab.h>
@@ -1358,6 +1360,83 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	put_cpu_fpsimd_context();
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+/*
+ * SME/CME erratum handling.
+ */
+static cpumask_t sme_dvmsync_cpus;
+
+/*
+ * These helpers are only called from non-preemptible contexts, so
+ * smp_processor_id() is safe here.
+ */
+void sme_set_active(void)
+{
+	unsigned int cpu = smp_processor_id();
+
+	if (!cpumask_test_cpu(cpu, &sme_dvmsync_cpus))
+		return;
+
+	cpumask_set_cpu(cpu, mm_cpumask(current->mm));
+
+	/*
+	 * A subsequent (post ERET) SME access may use a stale address
+	 * translation. On C1-Pro, a TLBI+DSB on a different CPU will wait for
+	 * the completion of cpumask_set_cpu() above as it appears in program
+	 * order before the SME access. The post-TLBI+DSB read of mm_cpumask()
+	 * will lead to the IPI being issued.
+	 *
+	 * https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
+	 */
+}
+
+void sme_clear_active(void)
+{
+	unsigned int cpu = smp_processor_id();
+
+	if (!cpumask_test_cpu(cpu, &sme_dvmsync_cpus))
+		return;
+
+	/*
+	 * With SCTLR_EL1.IESB enabled, the SME memory transactions are
+	 * completed on entering EL1.
+	 */
+	cpumask_clear_cpu(cpu, mm_cpumask(current->mm));
+}
+
+static void sme_dvmsync_ipi(void *unused)
+{
+	/*
+	 * With SCTLR_EL1.IESB on, taking an exception is sufficient to ensure
+	 * the completion of the SME memory accesses, so no need for an
+	 * explicit DSB.
+	 */
+}
+
+void sme_do_dvmsync(const struct cpumask *mask)
+{
+	/*
+	 * This is called from the TLB maintenance functions after the DSB ISH
+	 * to send the hardware DVMSync message. If this CPU sees the mask as
+	 * empty, the remote CPU executing sme_set_active() would have seen
+	 * the DVMSync and no IPI required.
+	 */
+	if (cpumask_empty(mask))
+		return;
+
+	preempt_disable();
+	smp_call_function_many(mask, sme_dvmsync_ipi, NULL, true);
+	preempt_enable();
+}
+
+void sme_enable_dvmsync(void)
+{
+	cpumask_set_cpu(smp_processor_id(), &sme_dvmsync_cpus);
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 /*
  * Trapped SME access
  *
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 489554931231..4c328b7c79ba 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -26,6 +26,7 @@
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/cpumask.h>
 #include <linux/cpu.h>
 #include <linux/elfcore.h>
 #include <linux/pm.h>
@@ -339,8 +340,41 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
+{
+	/*
+	 * Clear the inherited cpumask with memset() to cover both cases where
+	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
+	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
+	 */
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		memset(&dst->tlb_ubc.arch.cpumask, 0,
+		       sizeof(dst->tlb_ubc.arch.cpumask));
+}
+
+static void arch_release_tlbbatch_mask(struct task_struct *tsk)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		free_cpumask_var(tsk->tlb_ubc.arch.cpumask);
+}
+
+#else
+
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
+{
+}
+
+static void arch_release_tlbbatch_mask(struct task_struct *tsk)
+{
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
+	arch_release_tlbbatch_mask(tsk);
 	fpsimd_release_task(tsk);
 }
 
@@ -356,6 +390,8 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 	*dst = *src;
 
+	arch_dup_tlbbatch_mask(dst);
+
 	/*
 	 * Drop stale reference to src's sve_state and convert dst to
 	 * non-streaming FPSIMD mode.
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 7261553b644b..8946be60a409 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -105,6 +105,7 @@ WORKAROUND_2077057
 WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
+WORKAROUND_4193714
 WORKAROUND_4311569
 WORKAROUND_AMPERE_AC03_CPU_38
 WORKAROUND_AMPERE_AC04_CPU_23

