Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF94FD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUP/0ib7NzaQ10lNwrazeH9U5sdGAZQbx8k0mwKac3A=; b=cGsW9DtXYR8y9l79B+h33t+5hn
	kh7YlWj1x0a9edKiZPDUuu+mwmEY8TWQmJk1ID3h05iaood3IuYEAZmXwPln0XnBAVxofeSXCmFrE
	AZgoU2/tcqTMMrvW4ZgpvkSpVeJexXF8Gs4gNsYz7N2CH0mUTdJEwa+4McC/TX7ixO1dwNl4xeZx/
	13EC7LGmQZ/fBRg/DgLQx3lgJaUtXIKC+Qdb7Ewx73UkXHKasVgMd+1tPcZh3O9wP04qv2FUD3DLX
	eMONvUq/kASBmFJdS+a+sBfqfWGYil+lhoib14RhVW+541RyqUPH1QaDwPH7HmjRxpIa0mH0Yysyy
	peSwDuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hm-0000000ElCa-0jmx;
	Tue, 09 Dec 2025 20:53:06 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hP-0000000Ekjc-3tfJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:49 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7c766d79592so12748624a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313560; x=1765918360; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kUP/0ib7NzaQ10lNwrazeH9U5sdGAZQbx8k0mwKac3A=;
        b=MaX4FTpaf0MZG0HfVkIyHagJibu05xd76mqA9PWC5kRiQcaZbggRKWTkmG08xFDl1S
         6VIfLvDL3Ukr3KZL/Rt6ibk/SDcGxWOwj6D8oF1T8Pm62hPWqjj0MvX4TrvTrpq+6UP+
         VfvwdJsrErgY0LKjUxXMJ5ylUnmGrSO3hJwwvkTV0yZ5UfyOH6EK7LAKo+gTx6yMyy6Q
         MWIPbpFStiZL3Kbdm8Qk73QMn65v/TCVJeW/ZTgkulrt33zlcH1EEJKZ18nR597Wn9KH
         PpZrjkK/TZzQqjB5dDLmsbJlNYxem03MTAaAwjGeF+UVAx5n7ffsihXr/SwQMK/pSA3B
         4Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313560; x=1765918360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUP/0ib7NzaQ10lNwrazeH9U5sdGAZQbx8k0mwKac3A=;
        b=L81xmRws1F7lDGVK2aTTwoKrmKm+pBi9rYZeZsSttK/YRXlU6TzNZX3aElPIblaxyF
         2uOGZVhNOFQ5rJ7WKG8tT+OiOPxU1PeSJmkwpkmVLFjRJ3Q/fLofu9wgzS/fGzSAzd8T
         +K9dgdeEyCR1yRwwnJLDJ1q8obdvUDJTgFjTUxHLfPcoT1zvTEV15qYUtm/4FwC/nbRF
         RD16yo37QuPF1mGCbZgILQusv4Jaq0ZFltG99mpzXXUePFu5yCxC2hug8pwurCFrfxw8
         BThNxazXOiyexfqmKp3RuMArWLokDemdl719D2M+Y5vnsdGIUEuqrZ96sjCa0BFoDw9Q
         bRjA==
X-Forwarded-Encrypted: i=1; AJvYcCWjxCCErwPIKUNdikzbWZOlTpk0pzKusNevHkb82PWX1C0UDQdRbWCa281FyXWAVb3hvQvghtll7yUtnDbmEhrS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4pDLJk4AfkQk1IVLI7+Vw0O485xLTrSZW5MlYbnVw2Z5NP5iK
	oFSJjf2c6jlhSuH7CZkW28HUBgDg1ZvKZ+pjQ6/SjtrFQhkjBGJ+oy68fJBo4/pTuUFaemo+gDL
	MIzTFlyN5IWAqUrTVE/mJXxYZGA==
X-Google-Smtp-Source: AGHT+IHv8RQaXDHSivPTTeXk+3zR5MzJWrGN3A5PRODa9gDMtjaBK34a4o7xl6Y/q37pYaHLo9SGb0iM2yaoKrXonQ==
X-Received: from ilbck11.prod.google.com ([2002:a05:6e02:370b:b0:430:c380:c567])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:edc9:0:b0:659:9a49:8eb9 with SMTP id 006d021491bc7-65b2ad5ba6emr124789eaf.61.1765313560115;
 Tue, 09 Dec 2025 12:52:40 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:11 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-15-coltonlewis@google.com>
Subject: [PATCH v5 14/24] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125244_193486_751FE533 
X-CRM114-Status: GOOD (  22.83  )
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
specific registers that would normally be untrapped. Add a handler for
those registers in the fast path so we can still get a performance
boost from partitioning.

The idea is to handle traps for all the PMU registers quickly by
writing through to the hardware as possible instead of hooking into
the emulated vPMU as the standard handlers in sys_regs.c do. Since
context switching will not happen without FGT, make sure to write both
physical and virtual registers so they stay in sync.

To assist with that, fill of the gaps in arm_pmuv3.h for helper
functions to read and write PMU registers and lift some of the access
checking functions from sys_regs.c to pmu.c

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h      |  37 ++++-
 arch/arm64/include/asm/kvm_pmu.h        |  25 +++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 201 ++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c                    |  40 +++++
 arch/arm64/kvm/sys_regs.c               |  41 +----
 5 files changed, 303 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 3e25c0313263c..41ec6730ebc62 100644
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
index 7297a697a4a62..60b8a48cad456 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -83,6 +83,11 @@ struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
+bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags);
+bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu);
+bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu);
+bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu);
+bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
@@ -226,6 +231,26 @@ static inline bool kvm_set_pmuserenr(u64 val)
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
+static inline bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
+{
+	return false;
+}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 6e8050f260f34..40bd00df6c58f 100644
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
@@ -768,6 +770,202 @@ static bool handle_ampere1_tcr(struct kvm_vcpu *vcpu)
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
+	u64 mask;
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
+		mask = ARMV8_PMU_PMCR_MASK;
+
+		if (p.is_write) {
+			write_pmcr(val);
+			mask &= ~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
+			__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val & mask);
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
+		mask = ARMV8_PMU_USERENR_MASK;
+		ret = handle_pmu_reg(vcpu, &p, PMUSERENR_EL0, rt, val & mask,
+				     &read_pmuserenr, &write_pmuserenr);
+		break;
+	case SYS_PMSELR_EL0:
+		mask = PMSELR_EL0_SEL_MASK;
+
+		if (pmu_access_event_counter_el0_disabled(vcpu))
+			return false;
+
+		ret = handle_pmu_reg(vcpu, &p, PMSELR_EL0, rt, val & mask,
+				     &read_pmselr, &write_pmselr);
+		break;
+	case SYS_PMINTENCLR_EL1:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, ~(val & mask));
+			write_pmintenclr(val);
+		} else {
+			val = read_pmintenclr();
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+		ret = true;
+
+		break;
+	case SYS_PMINTENSET_EL1:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, |=, val & mask);
+			write_pmintenset(val);
+		} else {
+			val = read_pmintenset();
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCNTENCLR_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, &=, ~(val & mask));
+			write_pmcntenclr(val);
+		} else {
+			val = read_pmcntenclr();
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCNTENSET_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMCNTENSET_EL0, |=, val & mask);
+			write_pmcntenset(val);
+		} else {
+			val = read_pmcntenset();
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCCNTR_EL0:
+		if (pmu_access_cycle_counter_el0_disabled(vcpu))
+			return false;
+
+		ret = handle_pmu_reg(vcpu, &p, PMCCNTR_EL0, rt, val,
+				     &read_pmccntr, &write_pmccntr);
+		break;
+	case SYS_PMXEVCNTR_EL0:
+		idx = FIELD_GET(PMSELR_EL0_SEL, read_pmselr());
+
+		if (pmu_access_event_counter_el0_disabled(vcpu))
+			return false;
+
+		if (!pmu_counter_idx_valid(vcpu, idx))
+			return false;
+
+		ret = handle_pmu_reg(vcpu, &p, PMEVCNTR0_EL0 + idx, rt, val,
+				     &read_pmxevcntr, &write_pmxevcntr);
+		break;
+	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
+		idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
+
+		if (pmu_access_event_counter_el0_disabled(vcpu))
+			return false;
+
+		if (!pmu_counter_idx_valid(vcpu, idx))
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
@@ -785,6 +983,9 @@ static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_handle_cntxct(vcpu))
 		return true;
 
+	if (kvm_hyp_handle_pmu_regs(vcpu))
+		return true;
+
 	return false;
 }
 
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 79b7ea037153a..1fd012f8ff4a9 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -884,3 +884,43 @@ u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 
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
+
+bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
+{
+	u64 pmcr, val;
+
+	pmcr = kvm_vcpu_read_pmcr(vcpu);
+	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
+	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
+		kvm_inject_undefined(vcpu);
+		return false;
+	}
+
+	return true;
+}
+
+bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_EN);
+}
+
+bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu)
+{
+	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_EN);
+}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index bee892db9ca8b..70104087b6c7b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -29,6 +29,7 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_pmu.h>
 #include <asm/perf_event.h>
 #include <asm/sysreg.h>
 
@@ -970,37 +971,11 @@ static u64 reset_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
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
 }
 
-static bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu)
-{
-	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_EN);
-}
-
-static bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu)
-{
-	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_EN);
-}
-
 static bool access_pmcr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			const struct sys_reg_desc *r)
 {
@@ -1067,20 +1042,6 @@ static bool access_pmceid(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
-static bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
-{
-	u64 pmcr, val;
-
-	pmcr = kvm_vcpu_read_pmcr(vcpu);
-	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
-	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
-		kvm_inject_undefined(vcpu);
-		return false;
-	}
-
-	return true;
-}
-
 static int get_pmu_evcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 			  u64 *val)
 {
-- 
2.52.0.239.gd5f0c6e74e-goog


