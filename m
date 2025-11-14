Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9361CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLTvdZxC1EfR4AvH3nILSXx7Rp5ypjivMXMe1usGaVo=; b=YTxbWjjxWY+tjW0Z2YZP0OqXbh
	pK5AXT1xe4A24z6jpDheTf0t/uJt2O4Tv2e7X7+gxzrSfrLja2j2Dl0Flaezx/WVBgbaxdIGESaTz
	rxd49czeJWcAWngFq1kLSMfcWl2o00PPq6xbUBgUXNGOnvE9GZguNfXRTOkOa6w+w/xakd9rNOduT
	vWfWr76NOk4iRnCYHr/nJb/3sd5prOC7uGdUDehTq5uvFaMCmwkvrGa1TN0tPA2Rzmtsn9bYMgiY6
	BjecZheK6lEEeys5L6NO0Ki0b8zgtdI6xyHLuxi3nSu02KEpgp1OPubYjhs7i754cw73W0FHbW4bS
	4UzJRhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLv-0000000Cg1o-2zjF;
	Fri, 14 Nov 2025 16:08:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLj-0000000Cfle-0LQg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vLTvdZxC1EfR4AvH3nILSXx7Rp5ypjivMXMe1usGaVo=; b=lUAINAC/TOs95MiBUumgJHkfM/
	FoHN7aaxTk+g3v2eZQ/LfAogGTzgqkGcSW2Kv7i4MmKFdN1VzlaID69+tfdkCE4FYYK6XDGUmkAwa
	58tfWe9YtdijO2yRxiLKXTywUbbNsziJ4rLg6mMJBOvmzTPKMTR2OOTVx2x075F8JMVb0uBV9SVkc
	IcR4UTxh1sMuWiU60LPmkhifOFhXrbMvM9/9B9SXbajNJgo9VTul2wa3qC1Dn8uT8pzHc//ZL2RFh
	GPufPfedsn6vHwLjgJ/m0E2xyLNGfODFvOVX6m8x/Vpz8zlGRz8mNrSavfU0PjAELHzu0W957l54v
	C5RGUPgw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvU0-00000002vY6-0SH4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5522A1BC0;
	Fri, 14 Nov 2025 08:08:22 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8A73F5A1;
	Fri, 14 Nov 2025 08:08:27 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 22/35] KVM: arm64: VHE: Context switch SPE state
Date: Fri, 14 Nov 2025 16:07:03 +0000
Message-ID: <20251114160717.163230-23-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151304_510057_1CCA2BE4 
X-CRM114-Status: GOOD (  28.07  )
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

Save and restore the SPE register state at the appropriate point in the
VCPU life cycle:

1. On VCPU load/put:
    * The sampling registers for the host and guest.
    * The buffer registers for the host.

2. On VCPU entry/exit:
    * The buffer registers for the guest.

Note that as a consequence, when a VM has SPE enabled, KVM disables host
profiling when the VCPU is scheduled in, and it resumes it when the VCPU
is scheduled out. This is different to what happens when a VM doesn't
have SPE enabled, which is to stop sampling when the exception level
changes to EL1.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_hyp.h |  16 +++-
 arch/arm64/include/asm/kvm_spe.h |  17 +++++
 arch/arm64/kvm/arm.c             |  10 +++
 arch/arm64/kvm/debug.c           |  10 ++-
 arch/arm64/kvm/hyp/vhe/Makefile  |   1 +
 arch/arm64/kvm/hyp/vhe/spe-sr.c  |  80 ++++++++++++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c  |   2 +
 arch/arm64/kvm/spe.c             | 125 +++++++++++++++++++++++++++++++
 8 files changed, 259 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/vhe/spe-sr.c

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index e6be1f5d0967..93ebe3c0d417 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -109,7 +109,21 @@ void __debug_switch_to_host(struct kvm_vcpu *vcpu);
 #ifdef __KVM_NVHE_HYPERVISOR__
 void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu);
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu);
-#endif
+#else
+#ifdef CONFIG_KVM_ARM_SPE
+void __kvm_spe_save_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt);
+void __kvm_spe_restore_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt);
+#else
+static inline void
+__kvm_spe_save_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
+{
+}
+static inline void
+__kvm_spe_restore_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
+{
+}
+#endif /* CONFIG_KVM_ARM_SPE */
+#endif /* __KVM_NVHE_HYPERVISOR__ */
 
 void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
 void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 6bc728723897..077ca1e596b8 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -16,6 +16,7 @@ struct kvm_spe {
 };
 
 struct kvm_vcpu_spe {
+	u64 host_pmscr_el2;	/* Host PMSCR_EL2 register, context switched. */
 	int irq_num;		/* Buffer management interrupt number */
 	bool initialized;	/* SPE initialized for the VCPU */
 };
@@ -30,6 +31,13 @@ static __always_inline bool kvm_supports_spe(void)
 #define vcpu_has_spe(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
 
+/* Implements the function ProfilingBufferEnabled() from ARM DDI0487K.a */
+static inline bool kvm_spe_profiling_buffer_enabled(u64 pmblimitr_el1, u64 pmbsr_el1)
+{
+	return !FIELD_GET(PMBSR_EL1_S, pmbsr_el1) &&
+	       FIELD_GET(PMBLIMITR_EL1_E, pmblimitr_el1);
+}
+
 void kvm_spe_init_vm(struct kvm *kvm);
 int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu);
 
@@ -44,6 +52,9 @@ u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
 
 bool kvm_spe_has_feat_spe_fne(struct kvm *kvm);
 bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);
+
+void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu);
+void kvm_vcpu_spe_put(struct kvm_vcpu *vcpu);
 #else
 struct kvm_spe {
 };
@@ -93,6 +104,12 @@ static inline bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
 {
 	return false;
 }
+static inline void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu)
+{
+}
+static inline void kvm_vcpu_spe_put(struct kvm_vcpu *vcpu)
+{
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f5c846c16cb8..c5f5d5dbd695 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -631,6 +631,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	 */
 	kvm_timer_vcpu_load(vcpu);
 	kvm_vgic_load(vcpu);
+	/*
+	 * Drain the host profiling buffer before the buffer owning exception
+	 * level is changed in kvm_vcpu_load_debug().
+	 */
+	kvm_vcpu_spe_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
 	kvm_vcpu_load_fgt(vcpu);
 	if (has_vhe())
@@ -670,6 +675,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	}
 
 	kvm_vcpu_put_debug(vcpu);
+	/*
+	 * Restore the host profiling session after the owning exception level
+	 * is restored in kvm_vcpu_put_debug().
+	 */
+	kvm_vcpu_spe_put(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
 		kvm_vcpu_put_vhe(vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0821ebfb03fa..d6357784730d 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -75,8 +75,16 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 		kvm_nested_setup_mdcr_el2(vcpu);
 
 	/* Write MDCR_EL2 directly if we're already at EL2 */
-	if (has_vhe())
+	if (has_vhe()) {
 		write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
+		if (vcpu_has_spe(vcpu)) {
+			/*
+			 * Synchronize the write that changes the owning regime
+			 * to EL1&0.
+			 */
+			isb();
+		}
+	}
 
 	preempt_enable();
 }
diff --git a/arch/arm64/kvm/hyp/vhe/Makefile b/arch/arm64/kvm/hyp/vhe/Makefile
index afc4aed9231a..49496139b156 100644
--- a/arch/arm64/kvm/hyp/vhe/Makefile
+++ b/arch/arm64/kvm/hyp/vhe/Makefile
@@ -11,3 +11,4 @@ CFLAGS_switch.o += -Wno-override-init
 obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o
 obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o
+obj-$(CONFIG_KVM_ARM_SPE) += spe-sr.o
diff --git a/arch/arm64/kvm/hyp/vhe/spe-sr.c b/arch/arm64/kvm/hyp/vhe/spe-sr.c
new file mode 100644
index 000000000000..fb8614435069
--- /dev/null
+++ b/arch/arm64/kvm/hyp/vhe/spe-sr.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 - ARM Ltd
+ */
+
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_hyp.h>
+#include <asm/kprobes.h>
+#include <asm/kvm_spe.h>
+
+/*
+ * The following are true when the guest buffer is restored or saved:
+ * - Sampling is disabled.
+ * - The buffer owning regime is EL1&0.
+ * - Stage 2 is enabled.
+ */
+
+static bool kvm_spe_profiling_buffer_enabled_ctxt(struct kvm_cpu_context *ctxt)
+{
+	return kvm_spe_profiling_buffer_enabled(ctxt_sys_reg(ctxt, PMBLIMITR_EL1),
+						ctxt_sys_reg(ctxt, PMBSR_EL1));
+}
+
+void __kvm_spe_restore_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
+{
+	if (!vcpu_has_spe(vcpu))
+		return;
+
+	/*
+	 * If StatisticalProfilingEnabled() is false or the buffer is in
+	 * discard mode, the hardware value for PMBPTR_EL1 won't change while
+	 * the guest is running, so no point in writing the registers to
+	 * hardware.
+	 *
+	 * This is also about correctness. KVM runs a guest with hardware
+	 * service bit clear. If the in-memory service bit is set, the only way
+	 * to stop profiling while the guest is running is to have the hardware
+	 * buffer enable bit clear.
+	 */
+	if (!kvm_spe_profiling_buffer_enabled_ctxt(guest_ctxt))
+		return;
+
+	write_sysreg_s(ctxt_sys_reg(guest_ctxt, PMBPTR_EL1), SYS_PMBPTR_EL1);
+	isb();
+	write_sysreg_s(ctxt_sys_reg(guest_ctxt, PMBLIMITR_EL1), SYS_PMBLIMITR_EL1);
+}
+NOKPROBE_SYMBOL(__kvm_spe_restore_guest_buffer);
+
+void __kvm_spe_save_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
+{
+	u64 pmbsr_el1;
+
+	if (!vcpu_has_spe(vcpu))
+		return;
+
+	/* See __kvm_spe_restore_guest_buffer() */
+	if (!kvm_spe_profiling_buffer_enabled_ctxt(guest_ctxt))
+		return;
+
+	psb_csync();
+	dsb(nsh);
+	/* Advance PMBPTR_EL1. */
+	isb();
+	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+	isb();
+
+	ctxt_sys_reg(guest_ctxt, PMBPTR_EL1) = read_sysreg_s(SYS_PMBPTR_EL1);
+
+	pmbsr_el1 = read_sysreg_s(SYS_PMBSR_EL1);
+	if (!FIELD_GET(PMBSR_EL1_S, pmbsr_el1))
+		return;
+
+	/* Stop the SPU from asserting PMBIRQ. */
+	write_sysreg_s(0, SYS_PMBSR_EL1);
+	isb();
+	/* PMBSR_EL1 changed while the VCPU was running, save it */
+	ctxt_sys_reg(guest_ctxt, PMBSR_EL1) = pmbsr_el1;
+}
+NOKPROBE_SYMBOL(__kvm_spe_save_guest_buffer);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 9984c492305a..14449d568405 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -593,6 +593,7 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
 	__kvm_adjust_pc(vcpu);
 
 	sysreg_restore_guest_state_vhe(guest_ctxt);
+	__kvm_spe_restore_guest_buffer(vcpu, guest_ctxt);
 	__debug_switch_to_guest(vcpu);
 
 	do {
@@ -603,6 +604,7 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
 	} while (fixup_guest_exit(vcpu, &exit_code));
 
 	sysreg_save_guest_state_vhe(guest_ctxt);
+	__kvm_spe_save_guest_buffer(vcpu, guest_ctxt);
 
 	__deactivate_traps(vcpu);
 
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index fa24e47a1e73..32156e43f454 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -169,6 +169,131 @@ u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
 	return val;
 }
 
+static void kvm_spe_save_sampling_regs(struct kvm_vcpu *vcpu, struct kvm_cpu_context *ctxt)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	ctxt_sys_reg(ctxt, PMSCR_EL1) = read_sysreg_el1(SYS_PMSCR);
+	if (kvm_spe_has_feat_spe_fne(kvm))
+		ctxt_sys_reg(ctxt, PMSNEVFR_EL1) = read_sysreg_s(SYS_PMSNEVFR_EL1);
+	ctxt_sys_reg(ctxt, PMSICR_EL1) = read_sysreg_s(SYS_PMSICR_EL1);
+	ctxt_sys_reg(ctxt, PMSIRR_EL1) = read_sysreg_s(SYS_PMSIRR_EL1);
+	ctxt_sys_reg(ctxt, PMSFCR_EL1) = read_sysreg_s(SYS_PMSFCR_EL1);
+	ctxt_sys_reg(ctxt, PMSEVFR_EL1) = read_sysreg_s(SYS_PMSEVFR_EL1);
+	ctxt_sys_reg(ctxt, PMSLATFR_EL1) = read_sysreg_s(SYS_PMSLATFR_EL1);
+	if (kvm_spe_has_feat_spe_fds(kvm))
+		ctxt_sys_reg(ctxt, PMSDSFR_EL1) = read_sysreg_s(SYS_PMSDSFR_EL1);
+}
+
+static void kvm_spe_restore_sampling_regs(struct kvm_vcpu *vcpu, struct kvm_cpu_context *ctxt)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	write_sysreg_el1(ctxt_sys_reg(ctxt, PMSCR_EL1), SYS_PMSCR);
+	if (kvm_spe_has_feat_spe_fne(kvm))
+		write_sysreg_s(ctxt_sys_reg(ctxt, PMSNEVFR_EL1), SYS_PMSNEVFR_EL1);
+	write_sysreg_s(ctxt_sys_reg(ctxt, PMSICR_EL1), SYS_PMSICR_EL1);
+	write_sysreg_s(ctxt_sys_reg(ctxt, PMSIRR_EL1), SYS_PMSIRR_EL1);
+	write_sysreg_s(ctxt_sys_reg(ctxt, PMSFCR_EL1), SYS_PMSFCR_EL1);
+	write_sysreg_s(ctxt_sys_reg(ctxt, PMSEVFR_EL1), SYS_PMSEVFR_EL1);
+	write_sysreg_s(ctxt_sys_reg(ctxt, PMSLATFR_EL1), SYS_PMSLATFR_EL1);
+	if (kvm_spe_has_feat_spe_fds(kvm))
+		write_sysreg_s(ctxt_sys_reg(ctxt, PMSDSFR_EL1), SYS_PMSDSFR_EL1);
+}
+
+void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu)
+{
+	u64 host_pmblimitr_el1, host_pmscr_el2, host_pmbsr_el1;
+	struct kvm_cpu_context *host_ctxt;
+	struct kvm_cpu_context *guest_ctxt;
+
+	if (!vcpu_has_spe(vcpu) || unlikely(vcpu_on_unsupported_cpu(vcpu)))
+		return;
+
+	host_ctxt = host_data_ptr(host_ctxt);
+	guest_ctxt = &vcpu->arch.ctxt;
+
+	/* Disable interrupts to prevent races with the perf interrupt handler. */
+	local_irq_disable();
+
+	host_pmscr_el2 = read_sysreg_el2(SYS_PMSCR);
+	write_sysreg_el2(0, SYS_PMSCR);
+	/* Host was profiling, synchronize the write to PMSCR_EL2. */
+	if (FIELD_GET(PMSCR_EL2_E2SPE, host_pmscr_el2))
+		isb();
+
+	host_pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
+	if (FIELD_GET(PMBLIMITR_EL1_E, host_pmblimitr_el1)) {
+		psb_csync();
+		dsb(nsh);
+		/*
+		 * Disable the buffer, to avoid the wrong translation table
+		 * entries being cached while KVM restores the guest context.
+		 */
+		write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+		/*
+		 * The ISB here has two uses: hardware updates to the host's
+		 * PMBPTR_EL1 register are made visible, and the write to
+		 * PMBLIMITR_EL1 is synchronized.
+		 */
+		isb();
+	}
+
+	host_pmbsr_el1 = read_sysreg_s(SYS_PMBSR_EL1);
+	if (FIELD_GET(PMBSR_EL1_S, host_pmbsr_el1)) {
+		/*
+		 * If the GIC asserts the interrupt after local_irq_enabled()
+		 * below, the perf interrupt handler will read PMBSR_EL1.S zero
+		 * and treat it as a spurious interrupt.
+		 */
+		write_sysreg_s(0, SYS_PMBSR_EL1);
+		isb();
+	}
+
+	local_irq_enable();
+
+	ctxt_sys_reg(host_ctxt, PMBPTR_EL1) = read_sysreg_s(SYS_PMBPTR_EL1);
+	ctxt_sys_reg(host_ctxt, PMBLIMITR_EL1) = host_pmblimitr_el1;
+	ctxt_sys_reg(host_ctxt, PMBSR_EL1) = host_pmbsr_el1;
+	vcpu->arch.vcpu_spe.host_pmscr_el2 = host_pmscr_el2;
+
+	kvm_spe_save_sampling_regs(vcpu, host_ctxt);
+	kvm_spe_restore_sampling_regs(vcpu, guest_ctxt);
+}
+
+void kvm_vcpu_spe_put(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *host_ctxt;
+	struct kvm_cpu_context *guest_ctxt;
+	u64 host_pmblimitr_el1;
+	bool buffer_enabled;
+
+	if (!vcpu_has_spe(vcpu) || unlikely(vcpu_on_unsupported_cpu(vcpu)))
+		return;
+
+	guest_ctxt = &vcpu->arch.ctxt;
+	host_ctxt = host_data_ptr(host_ctxt);
+
+	kvm_spe_save_sampling_regs(vcpu, guest_ctxt);
+	kvm_spe_restore_sampling_regs(vcpu, host_ctxt);
+
+	write_sysreg_el2(vcpu->arch.vcpu_spe.host_pmscr_el2, SYS_PMSCR);
+	write_sysreg_s(ctxt_sys_reg(host_ctxt, PMBPTR_EL1), SYS_PMBPTR_EL1);
+	write_sysreg_s(ctxt_sys_reg(host_ctxt, PMBSR_EL1), SYS_PMBSR_EL1);
+
+	host_pmblimitr_el1 = ctxt_sys_reg(host_ctxt, PMBLIMITR_EL1);
+	buffer_enabled = FIELD_GET(PMBLIMITR_EL1_E, host_pmblimitr_el1);
+
+	/* Synchronise above writes before enabling the buffer. */
+	if (buffer_enabled)
+		isb();
+
+	write_sysreg_s(host_pmblimitr_el1, SYS_PMBLIMITR_EL1);
+	/* Everything is on the hardware, re-enable the host buffer. */
+	if (buffer_enabled)
+		isb();
+}
+
 static u64 max_buffer_size_to_pmbidr_el1(u64 size)
 {
 	u64 msb_idx, num_bits;
-- 
2.51.2


