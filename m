Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B796E9B37E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1vjhB8uu47MLBap5vhRZdGfbp6v2d+stXxOuxYto9g=; b=pGzyUjssu9zNGCcUc2+ePlmSot
	x6mH10XVSgB6j3IGfTC39hz+SJ7M+SkiRYWhJHUH2oKLEKkavWRXcx/t7vaYqQ1XPBEV0NSPs7p+u
	LVRCcHUb1C6u/WJd35RixaBCOTZdfAZEia+NkZaFNlLSrKv6w2KanDPTDwg4QHcOke6FVVj9wDs4s
	sAyu9BnTPkMiLezzMcoXey8MpMpe19S44SfrOIgqyFx48ItED0MJ2d7wiP485fQJPjGeiCYGyyw7z
	NJ/MR5YJOPWp9XdDBvAdzrxB7ip/Xwz/rR1DNzCTs2lFk5Eu4pwu+nakAuMjoxn381M9jyyafh2OW
	nmTXTuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6b3-0000000DXgm-2Yf7;
	Mon, 02 Mar 2026 16:58:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6b1-0000000DXfR-2qQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1C96600AD;
	Mon,  2 Mar 2026 16:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B7DC4AF0B;
	Mon,  2 Mar 2026 16:58:12 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: [PATCH 3/4] arm64: errata: Work around early CME DVMSync acknowledgement
Date: Mon,  2 Mar 2026 16:57:56 +0000
Message-ID: <20260302165801.3014607-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302165801.3014607-1-catalin.marinas@arm.com>
References: <20260302165801.3014607-1-catalin.marinas@arm.com>
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

C1-Pro acknowledges DVMSync messages before completing the SME/CME
memory accesses. Work around this by issuing an IPI+DSB to the affected
CPUs if they are running in EL0 with SME enabled.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig                | 12 +++++
 arch/arm64/include/asm/cpucaps.h  |  2 +
 arch/arm64/include/asm/cputype.h  |  2 +
 arch/arm64/include/asm/fpsimd.h   | 29 +++++++++++
 arch/arm64/include/asm/mmu.h      |  1 +
 arch/arm64/include/asm/tlbflush.h | 17 +++++++
 arch/arm64/kernel/cpu_errata.c    | 19 ++++++++
 arch/arm64/kernel/entry-common.c  |  3 ++
 arch/arm64/kernel/fpsimd.c        | 81 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/process.c       |  7 +++
 arch/arm64/tools/cpucaps          |  1 +
 11 files changed, 174 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..f07cdb6ada08 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1175,6 +1175,18 @@ config ARM64_ERRATUM_4311569
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_SME_DVMSYNC
+	bool "C1-Pro: 4193714: SME DVMSync early acknowledgement"
+	depends on ARM64_SME
+	default y
+	help
+	  Enable workaround for C1-Pro acknowledging the DVMSync before
+	  the SME memory accesses are complete. This would cause TLB
+	  maintenance for processes using SME to also issue an IPI to
+	  the affected CPUs.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 177c691914f8..d0e6cff93876 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -64,6 +64,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
+	case ARM64_WORKAROUND_SME_DVMSYNC:
+		return IS_ENABLED(CONFIG_ARM64_ERRATUM_SME_DVMSYNC);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 08860d482e60..7b518e81dd15 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -98,6 +98,7 @@
 #define ARM_CPU_PART_CORTEX_A725	0xD87
 #define ARM_CPU_PART_CORTEX_A720AE	0xD89
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
+#define ARM_CPU_PART_C1_PRO		0xD8B
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -189,6 +190,7 @@
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
 #define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
+#define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 1d2e33559bd5..a956fe12fc4d 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -428,6 +428,32 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return __sme_state_size(task_get_sme_vl(task));
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
+
+void sme_enable_dvmsync(void);
+void sme_set_active(unsigned int cpu);
+void sme_clear_active(unsigned int cpu);
+
+#else
+
+static inline void sme_enable_dvmsync(void) { }
+static inline void sme_set_active(unsigned int cpu) { }
+static inline void sme_clear_active(unsigned int cpu) { }
+
+#endif /* CONFIG_ARM64_ERRATUM_SME_DVMSYNC */
+
+static inline void sme_enter_from_user_mode(void)
+{
+	if (test_thread_flag(TIF_SME))
+		sme_clear_active(smp_processor_id());
+}
+
+static inline void sme_exit_to_user_mode(void)
+{
+	if (test_thread_flag(TIF_SME))
+		sme_set_active(smp_processor_id());
+}
+
 #else
 
 static inline void sme_user_disable(void) { BUILD_BUG(); }
@@ -456,6 +482,9 @@ static inline size_t sme_state_size(struct task_struct const *task)
 	return 0;
 }
 
+static inline void sme_enter_from_user_mode(void) { }
+static inline void sme_exit_to_user_mode(void) { }
+
 #endif /* ! CONFIG_ARM64_SME */
 
 /* For use by EFI runtime services calls only */
diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 137a173df1ff..ec6003db4d20 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -8,6 +8,7 @@
 #include <asm/cputype.h>
 
 #define MMCF_AARCH32	0x1	/* mm context flag for AArch32 executables */
+#define MMCF_SME_DVMSYNC 0x2	/* force DVMSync via IPI for SME completion */
 #define USER_ASID_BIT	48
 #define USER_ASID_FLAG	(UL(1) << USER_ASID_BIT)
 #define TTBR_ASID_MASK	(UL(0xffff) << 48)
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 14f116bfec73..e3ea0246a4f4 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -80,6 +80,22 @@ static inline unsigned long get_trans_granule(void)
 	}
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
+void sme_do_dvmsync(void);
+
+static inline void sme_dvmsync(struct mm_struct *mm)
+{
+	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
+		return;
+	if (mm && !test_bit(ilog2(MMCF_SME_DVMSYNC), &mm->context.flags))
+		return;
+
+	sme_do_dvmsync();
+}
+#else
+static inline void sme_dvmsync(struct mm_struct *mm) { }
+#endif
+
 /*
  * Level-based TLBI operations.
  *
@@ -189,6 +205,7 @@ static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+	sme_dvmsync(mm);
 }
 
 static inline void __tlbi_sync_s1ish_kernel(void)
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5c0ab6bfd44a..fef522a6b4b7 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -11,6 +11,7 @@
 #include <asm/cpu.h>
 #include <asm/cputype.h>
 #include <asm/cpufeature.h>
+#include <asm/fpsimd.h>
 #include <asm/kvm_asm.h>
 #include <asm/smp_plat.h>
 
@@ -575,6 +576,14 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
+static void cpu_enable_sme_dvmsync(const struct arm64_cpu_capabilities *__unused)
+{
+	if (this_cpu_has_cap(ARM64_WORKAROUND_SME_DVMSYNC))
+		sme_enable_dvmsync();
+}
+#endif
+
 #ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_38
 static const struct midr_range erratum_ac03_cpu_38_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
@@ -901,6 +910,16 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = need_arm_si_l1_workaround_4311569,
 	},
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
+	{
+		.desc = "C1-Pro SME DVMSync early acknowledgement",
+		.capability = ARM64_WORKAROUND_SME_DVMSYNC,
+		.cpu_enable = cpu_enable_sme_dvmsync,
+		/* C1-Pro r0p0 - r1p2 (the latter only when REVIDR_EL1[0]==0 */
+		ERRATA_MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 2),
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
index 9de1d8a604cb..90015fc29722 100644
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
@@ -1358,6 +1360,85 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	put_cpu_fpsimd_context();
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_SME_DVMSYNC
+
+/*
+ * SME/CME erratum handling
+ */
+static cpumask_var_t sme_dvmsync_cpus;
+static cpumask_var_t sme_active_cpus;
+
+void sme_set_active(unsigned int cpu)
+{
+	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
+		return;
+	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
+		return;
+
+	if (!test_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags))
+		set_bit(ilog2(MMCF_SME_DVMSYNC), &current->mm->context.flags);
+
+	cpumask_set_cpu(cpu, sme_active_cpus);
+
+	/*
+	 * Ensure subsequent (SME) memory accesses are observed after the
+	 * cpumask and the MMCF_SME_DVMSYNC flag setting.
+	 */
+	smp_mb();
+}
+
+void sme_clear_active(unsigned int cpu)
+{
+	if (!cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
+		return;
+	if (!cpumask_test_cpu(cpu, sme_dvmsync_cpus))
+		return;
+
+	/*
+	 * With SCTLR_EL1.IESB enabled, the SME memory transactions are
+	 * completed on entering EL1.
+	 */
+	cpumask_clear_cpu(cpu, sme_active_cpus);
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
+void sme_do_dvmsync(void)
+{
+	/*
+	 * This is called from the TLB maintenance functions after the DSB ISH
+	 * to send hardware DVMSync message. If this CPU sees the mask as
+	 * empty, the remote CPU executing sme_set_active() would have seen
+	 * the DVMSync and no IPI required.
+	 */
+	if (cpumask_empty(sme_active_cpus))
+		return;
+
+	preempt_disable();
+	smp_call_function_many(sme_active_cpus, sme_dvmsync_ipi, NULL, true);
+	preempt_enable();
+}
+
+void sme_enable_dvmsync(void)
+{
+	if ((!cpumask_available(sme_dvmsync_cpus) &&
+	     !zalloc_cpumask_var(&sme_dvmsync_cpus, GFP_ATOMIC)) ||
+	    (!cpumask_available(sme_active_cpus) &&
+	     !zalloc_cpumask_var(&sme_active_cpus, GFP_ATOMIC)))
+		panic("Unable to allocate the cpumasks for SME DVMSync erratum");
+
+	cpumask_set_cpu(smp_processor_id(), sme_dvmsync_cpus);
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_SME_DVMSYNC */
+
 /*
  * Trapped SME access
  *
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 489554931231..6154d0b454a3 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -471,6 +471,13 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 				ret = copy_thread_za(p, current);
 				if (ret)
 					return ret;
+				/*
+				 * Disable the SME DVMSync workaround for the
+				 * new process, it will be enabled on return
+				 * to user if TIF_SME is set.
+				 */
+				if (cpus_have_final_cap(ARM64_WORKAROUND_SME_DVMSYNC))
+					p->mm->context.flags &= ~MMCF_SME_DVMSYNC;
 			} else {
 				p->thread.tpidr2_el0 = 0;
 				WARN_ON_ONCE(p->thread.svcr & SVCR_ZA_MASK);
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 7261553b644b..7d69d8a16eae 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -123,6 +123,7 @@ WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
 WORKAROUND_QCOM_ORYON_CNTVOFF
 WORKAROUND_REPEAT_TLBI
+WORKAROUND_SME_DVMSYNC
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD

