Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB97C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjqwTY+gYWhQfYb74EjHJzgNUSsRFo40dXoQUFsvFa4=; b=olppGRH7hg2ku73PdUh8wVS9/j
	oEfo+PZpY/TESYvQ+E3p9ML/lDBwgN1sKeh/h1sciDacpJ4V4z51MQC0HFAKT7VrqzDTvGznJjm69
	NkVRkuhpOY3ooPs+rEI44JT3bgppI0H5/SWgzncTbbjyYve3JhU1qkhg4+D9Qkf3AtbW+x3YvmT3v
	Jt1x7TjTcjq6oMWIkjOMO0ma/LBJEYKcH7luw7oFB1jvX8GKmVQ/fCnXmfJd1ZAzl8NwRdE2+WF/A
	fC/wM/Dna50MEa0pKUxPM8NaTsS3V+3WB81xYeSchDljDbfLrfmteo2SGFh+DfW5MJaPiLTyTrO4L
	OIaa//Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubShZ-00000003YZa-3NOZ;
	Mon, 14 Jul 2025 23:35:17 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9A-00000003SVz-2s2B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:46 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-87313ccba79so952621339f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533983; x=1753138783; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjqwTY+gYWhQfYb74EjHJzgNUSsRFo40dXoQUFsvFa4=;
        b=avzWqLYL1V9nUJ9V9nHHBiVTem+6zPOa7XYMS94RxKt/pPU68FWIjqCORc/DcUKnlY
         CdoC6NIz3+0hqPYoUcHsdAGdMhYCpdIPhcuLhJZpa8Q7GC5Tk+oeu0oZHJCSSVI1mYmR
         9ZyeoVClOCfeGyWVkmuBctZ+WJ+Or+2wnTDjJlrl13CiTZ4ua3ktMCAfCe/OJg+veR3y
         x7j8SaFA32tJw3W85NFIwTGchxKQkWis/tBYarPP+MU3uy/xNfFJi12Pxgqrj0y8YEF/
         oNAdghoO1r3oUH2ltIpro1Au0fOlfIuQBMEBEGkVkImAZIDc+sNf34DFHzijI5e6BvPZ
         5CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533983; x=1753138783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjqwTY+gYWhQfYb74EjHJzgNUSsRFo40dXoQUFsvFa4=;
        b=OOJWcsekSm/BHIGpZ4iaeL2Ht84TamzUR33NH7kFnllpPEDNBARgQYPLl9LGFnfZUi
         Iya0bXw3001cNrZErcFbDS51yBY5UmenBrow00s/jb1hGC2lhcKreYyZPPEj47ZCULsf
         E8xYd7sne32at3xyTvMg55DgT+18cvHqJycvcurweAezfNw3q+N3Vo4CctVp+3xxomuX
         PljICPwC9Zehy2wObdRvMvnShqTv9j2+bD30kdEq7HUHIWPMHxZ1LbNEaZUfzVBEs6Vi
         ys33xmAc/QuvHJp+0ccsZJ9ntHDgWDVzeaSxc9saUUSvj/R4iL1b+JzOMmfio6qsZmqE
         hSaA==
X-Forwarded-Encrypted: i=1; AJvYcCWg3dZX0q9eDoFp/LFdBxs5uXbhxWQetWvpMuTcgKD4fYeb3NvFDUv1iy/XitNUHdoCgS2NMLFu9IkmnXy0F+Sj@lists.infradead.org
X-Gm-Message-State: AOJu0YypHDlRvofmhJYlG9GR7R4/Inj+IZkH7i1dSB4jf2FtC8W/+XjX
	6JKB582x/niFKL3U9ave9+WMSesN2djez8JIRDUMlg9V6trtlEhKIsdHE8tmLbkROiExnUu4K2l
	6z11x+4rcD9GA/LkfzYLLTQ3aQg==
X-Google-Smtp-Source: AGHT+IFmuHuKbrKCLr1Cw7MZEQLMklR+eN3XgjUB+Ob8JPY0WXuWwV5qFcLvi0V9ygsSZx5dwP8kl6fx3bAGHK9YOw==
X-Received: from iojj19.prod.google.com ([2002:a05:6602:8213:b0:876:41f5:7fcc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:379a:b0:85b:3a51:2923 with SMTP id ca18e2360f4ac-8797888a9fcmr1798282239f.14.1752533983502;
 Mon, 14 Jul 2025 15:59:43 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:07 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-14-coltonlewis@google.com>
Subject: [PATCH v4 13/23] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155944_763312_9C1CF208 
X-CRM114-Status: GOOD (  20.06  )
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

We may want a partitioned PMU but not have FEAT_FGT to untrap the
specific registers that would normally be. Add a handler for those
registers in the fast path so we can still get a performance boost
from partitioning.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h      |  37 ++++-
 arch/arm64/include/asm/kvm_pmu.h        |  10 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 174 ++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c                    |  16 +++
 arch/arm64/kvm/sys_regs.c               |  16 ---
 5 files changed, 236 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 3e25c0313263..41ec6730ebc6 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -39,6 +39,16 @@ static inline unsigned long read_pmevtypern(int n)
 	return 0;
 }
 
+static inline void write_pmxevcntr(u64 val)
+{
+	write_sysreg(val, pmxevcntr_el0);
+}
+
+static inline u64 read_pmxevcntr(void)
+{
+	return read_sysreg(pmxevcntr_el0);
+}
+
 static inline unsigned long read_pmmir(void)
 {
 	return read_cpuid(PMMIR_EL1);
@@ -105,21 +115,41 @@ static inline void write_pmcntenset(u64 val)
 	write_sysreg(val, pmcntenset_el0);
 }
 
+static inline u64 read_pmcntenset(void)
+{
+	return read_sysreg(pmcntenset_el0);
+}
+
 static inline void write_pmcntenclr(u64 val)
 {
 	write_sysreg(val, pmcntenclr_el0);
 }
 
+static inline u64 read_pmcntenclr(void)
+{
+	return read_sysreg(pmcntenclr_el0);
+}
+
 static inline void write_pmintenset(u64 val)
 {
 	write_sysreg(val, pmintenset_el1);
 }
 
+static inline u64 read_pmintenset(void)
+{
+	return read_sysreg(pmintenset_el1);
+}
+
 static inline void write_pmintenclr(u64 val)
 {
 	write_sysreg(val, pmintenclr_el1);
 }
 
+static inline u64 read_pmintenclr(void)
+{
+	return read_sysreg(pmintenclr_el1);
+}
+
 static inline void write_pmccfiltr(u64 val)
 {
 	write_sysreg(val, pmccfiltr_el0);
@@ -160,11 +190,16 @@ static inline u64 read_pmovsclr(void)
 	return read_sysreg(pmovsclr_el0);
 }
 
-static inline void write_pmuserenr(u32 val)
+static inline void write_pmuserenr(u64 val)
 {
 	write_sysreg(val, pmuserenr_el0);
 }
 
+static inline u64 read_pmuserenr(void)
+{
+	return read_sysreg(pmuserenr_el0);
+}
+
 static inline void write_pmuacr(u64 val)
 {
 	write_sysreg_s(val, SYS_PMUACR_EL1);
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 73b7161e3f4e..62c8032a548f 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -81,6 +81,8 @@ struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
+bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags);
+bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
@@ -214,6 +216,14 @@ static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
 }
+static inline bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
+{
+	return false;
+}
+static inline bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 7fe5b087c95a..92b76764b555 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -24,12 +24,14 @@
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_pmu.h>
 #include <asm/kvm_nested.h>
 #include <asm/fpsimd.h>
 #include <asm/debug-monitors.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+#include <../../sys_regs.h>
 #include "arm_psci.h"
 
 struct kvm_exception_table_entry {
@@ -724,6 +726,175 @@ static bool handle_ampere1_tcr(struct kvm_vcpu *vcpu)
 	return true;
 }
 
+/**
+ * handle_pmu_reg() - Handle fast access to most PMU regs
+ * @vcpu: Ponter to kvm_vcpu struct
+ * @p: System register parameters (read/write, Op0, Op1, CRm, CRn, Op2)
+ * @reg: VCPU register identifier
+ * @rt: Target general register
+ * @val: Value to write
+ * @readfn: Sysreg read function
+ * @writefn: Sysreg write function
+ *
+ * Handle fast access to most PMU regs. Writethrough to the physical
+ * register. This function is a wrapper for the simplest case, but
+ * sadly there aren't many of those.
+ *
+ * Always return true. The boolean makes usage more consistent with
+ * similar functions.
+ *
+ * Return: True
+ */
+static bool handle_pmu_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			   enum vcpu_sysreg reg, u8 rt, u64 val,
+			   u64 (*readfn)(void), void (*writefn)(u64))
+{
+	if (p->is_write) {
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+		writefn(val);
+	} else {
+		vcpu_set_reg(vcpu, rt, readfn());
+	}
+
+	return true;
+}
+
+/**
+ * kvm_hyp_handle_pmu_regs() - Fast handler for PMU registers
+ * @vcpu: Pointer to vcpu struct
+ *
+ * This handler immediately writes through certain PMU registers when
+ * we have a partitioned PMU (that is, MDCR_EL2.HPMN is set to reserve
+ * a range of counters for the guest) but the machine does not have
+ * FEAT_FGT to selectively untrap the registers we want.
+ *
+ * Return: True if the exception was successfully handled, false otherwise
+ */
+static bool kvm_hyp_handle_pmu_regs(struct kvm_vcpu *vcpu)
+{
+	struct sys_reg_params p;
+	u64 esr;
+	u32 sysreg;
+	u8 rt;
+	u64 val;
+	u8 idx;
+	bool ret;
+
+	if (!kvm_vcpu_pmu_is_partitioned(vcpu)
+	    || pmu_access_el0_disabled(vcpu))
+		return false;
+
+	esr = kvm_vcpu_get_esr(vcpu);
+	p = esr_sys64_to_params(esr);
+	sysreg = esr_sys64_to_sysreg(esr);
+	rt = kvm_vcpu_sys_get_rt(vcpu);
+	val = vcpu_get_reg(vcpu, rt);
+
+	switch (sysreg) {
+	case SYS_PMCR_EL0:
+		val &= ARMV8_PMU_PMCR_MASK;
+
+		if (p.is_write) {
+			write_pmcr(val);
+			__vcpu_assign_sys_reg(vcpu, PMCR_EL0, read_pmcr());
+		} else {
+			val = u64_replace_bits(
+				read_pmcr(),
+				vcpu->kvm->arch.nr_pmu_counters,
+				ARMV8_PMU_PMCR_N);
+			vcpu_set_reg(vcpu, rt, val);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMUSERENR_EL0:
+		val &= ARMV8_PMU_USERENR_MASK;
+		ret = handle_pmu_reg(vcpu, &p, PMUSERENR_EL0, rt, val,
+				     &read_pmuserenr, &write_pmuserenr);
+		break;
+	case SYS_PMSELR_EL0:
+		val &= PMSELR_EL0_SEL_MASK;
+		ret = handle_pmu_reg(vcpu, &p, PMSELR_EL0, rt, val,
+				     &read_pmselr, &write_pmselr);
+		break;
+	case SYS_PMINTENCLR_EL1:
+		val &= kvm_pmu_accessible_counter_mask(vcpu);
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, ~val);
+			write_pmintenclr(val);
+		} else {
+			vcpu_set_reg(vcpu, rt, read_pmintenclr());
+		}
+		ret = true;
+		break;
+	case SYS_PMINTENSET_EL1:
+		val &= kvm_pmu_accessible_counter_mask(vcpu);
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, |=, val);
+			write_pmintenset(val);
+		} else {
+			vcpu_set_reg(vcpu, rt, read_pmintenset());
+		}
+		ret = true;
+		break;
+	case SYS_PMCNTENCLR_EL0:
+		val &= kvm_pmu_accessible_counter_mask(vcpu);
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, &=, ~val);
+			write_pmcntenclr(val);
+		} else {
+			vcpu_set_reg(vcpu, rt, read_pmcntenclr());
+		}
+		ret = true;
+		break;
+	case SYS_PMCNTENSET_EL0:
+		val &= kvm_pmu_accessible_counter_mask(vcpu);
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, |=, val);
+			write_pmcntenset(val);
+		} else {
+			vcpu_set_reg(vcpu, rt, read_pmcntenset());
+		}
+		ret = true;
+		break;
+	case SYS_PMCCNTR_EL0:
+		ret = handle_pmu_reg(vcpu, &p, PMCCNTR_EL0, rt, val,
+				     &read_pmccntr, &write_pmccntr);
+		break;
+	case SYS_PMXEVCNTR_EL0:
+		idx = FIELD_GET(PMSELR_EL0_SEL, read_pmselr());
+
+		if (idx >= vcpu->kvm->arch.nr_pmu_counters)
+			return false;
+
+		ret = handle_pmu_reg(vcpu, &p, PMEVCNTR0_EL0 + idx, rt, val,
+				     &read_pmxevcntr, &write_pmxevcntr);
+		break;
+	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
+		idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
+
+		if (idx >= vcpu->kvm->arch.nr_pmu_counters)
+			return false;
+
+		if (p.is_write) {
+			write_pmevcntrn(idx, val);
+			__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + idx, val);
+		} else {
+			vcpu_set_reg(vcpu, rt, read_pmevcntrn(idx));
+		}
+
+		ret = true;
+		break;
+	default:
+		ret = false;
+	}
+
+	if (ret)
+		__kvm_skip_instr(vcpu);
+
+	return ret;
+}
+
 static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_TX2_219_TVM) &&
@@ -741,6 +912,9 @@ static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_handle_cntxct(vcpu))
 		return true;
 
+	if (kvm_hyp_handle_pmu_regs(vcpu))
+		return true;
+
 	return false;
 }
 
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 8a21ddc42f67..30244eb7bc9b 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -890,3 +890,19 @@ u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 
 	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
+
+bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
+{
+	u64 reg = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+	bool enabled = (reg & flags) || vcpu_mode_priv(vcpu);
+
+	if (!enabled)
+		kvm_inject_undefined(vcpu);
+
+	return !enabled;
+}
+
+bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_EN);
+}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 68457655a10b..ad9c406734a5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -840,22 +840,6 @@ static u64 reset_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return __vcpu_sys_reg(vcpu, r->reg);
 }
 
-static bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
-{
-	u64 reg = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
-	bool enabled = (reg & flags) || vcpu_mode_priv(vcpu);
-
-	if (!enabled)
-		kvm_inject_undefined(vcpu);
-
-	return !enabled;
-}
-
-static bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
-{
-	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_EN);
-}
-
 static bool pmu_write_swinc_el0_disabled(struct kvm_vcpu *vcpu)
 {
 	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_SW | ARMV8_PMU_USERENR_EN);
-- 
2.50.0.727.gbf7dc18ff4-goog


