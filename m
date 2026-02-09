Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07140E9461C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1q4WN7z/SL7quCNEFM+ItoBlF4yxyRczz8LessGfPao=; b=H3Qjj0db9dyYtxf7+/nSFctBgv
	ftZzDx2y4p0E+kh/DbcbbN0TReZPcrTZTi+YE0MsGk/qb+sVa2ePwzXwJfmoCorQmM2WFPF+Y8yh8
	c8Zk8cY/BAls8o9vCWSSAo+0vniNPFqaqlsVk9MiuHAeG3O8zpTinbSp6MOAATUMH2q36PNQcJDg4
	W8D5DCUDzWsPDVd+Cw7N1NRM9fD9JDOxQrIAD1TKLkYbhHNIXPwo0DZE2YwQ8Vq74RsqyA4xLOzgH
	gs9lJBw5T1dMBiGZ7+XyG7y3gMEA7uPOOol7AzhgCdQncQxNYfOcT59gBWM+gE8dCkqo7l4yMBzKh
	fUmqU4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwK-0000000G7XN-0B15;
	Mon, 09 Feb 2026 22:41:08 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZw7-0000000G7Lx-1vFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:40:59 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-45f0bfd68a3so7385926b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676854; x=1771281654; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1q4WN7z/SL7quCNEFM+ItoBlF4yxyRczz8LessGfPao=;
        b=Jk1qtBfvZC5ndnM8y/j1bG75pSlWv/oNhnsXsHYggbgwNH3BVR/EZsNA4zg2uZMXIB
         cXLt+s6RaBG91D2VFOW3CzGRPL8HsUflWJ3E1wMXiio2gpEtma2WAfz38KYjmcLrpRWx
         6aZeQOTS2DpbaVJBd2C3M2twJejFebNHVeYxXGaUi+BViez/TCLdkNqiu5s7wKDzWNH7
         cIbIj2om9NNxue4QL37YBfMTihAqmP4dM1ZO0PdoYdXIZmGz1nX7ZRXAf21tjsfrLv1X
         lMNoNr9K6vw1EaF0WfeO9ib3a2GhBsAKbn93OD02muvRxD4StzoDKm+XQlschDl+DF1X
         GTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676854; x=1771281654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1q4WN7z/SL7quCNEFM+ItoBlF4yxyRczz8LessGfPao=;
        b=ss7UfXpLlmGlbPa/w7WbRWfkd1fDcMPLcK4IEMUstIv+sgmFPf9tIthCmQhMt5PRLQ
         KNFJlIBXvHa2ro0kh5FFtcmIDoF1BKsa6SoaRbJZWeCgemrch0uvxM0k7wqMtCmnv4GT
         IO/1Uf74b5bUde/+AJN2DGwX8lUyIEb2swqJaeq9QiO+7bo0w9bvbReUDbpgVLZPuuB9
         0PkLvOzbMT/i7C+/FEjTbUx2PtsrgHNMgdFtsE7LTAqZrpx1i7gcc/OsWV0lynFzhPek
         RqtBKa929A1iSyWFvVkIducNcN6qFe9IMiVft0jHAFI5QarpjTpQlAnIFipxr29mDvPk
         AgkA==
X-Forwarded-Encrypted: i=1; AJvYcCVByB9W6quuIY7mppZ2IkDkMlUYsQeTQ8NpMoaImQjrFs0JgzqHu+dniWUyjozjxvzM4MNzy714o7Gvx5aVigEk@lists.infradead.org
X-Gm-Message-State: AOJu0YzNLaOmPqQcqgdmVJZpm03tpqN5DowbcMLZyGgSq41KhulJNkmD
	xH38tqAo4KLdTRJsoxPPReJIEa0oKFhweccfTp9JOkzsj15x6/iKteEU+G2+VCDmf6pDN+OMWo0
	dmg50V5TGEVUHzutkmB1C6CjoSw==
X-Received: from iong8.prod.google.com ([2002:a5d:8c88:0:b0:957:4b76:541e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:6aca:b0:663:9b9:9297 with SMTP id 006d021491bc7-66d0c6685ccmr6026920eaf.64.1770676853645;
 Mon, 09 Feb 2026 14:40:53 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:04 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-10-coltonlewis@google.com>
Subject: [PATCH v6 09/19] KVM: arm64: Write fast path PMU register handlers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144055_551418_A0FFE470 
X-CRM114-Status: GOOD (  19.69  )
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
writing directly to the hardware when possible instead of hooking into
the emulated vPMU as the standard handlers in sys_regs.c do.

For registers that can't be written to hardware because they require
special handling (PMEVTYPER and PMOVS), write to the virtual
register. A later patch will ensure these are handled correctly at
vcpu_load time.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 238 ++++++++++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 9db3f11a4754d..154da70146d98 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -28,6 +28,8 @@
 #include <asm/thread_info.h>
 #include <asm/vectors.h>
 
+#include <../../sys_regs.h>
+
 /* VHE specific context */
 DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
@@ -482,6 +484,239 @@ static bool kvm_hyp_handle_zcr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
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
+	u64 pmuser;
+	u64 pmselr;
+	u64 esr;
+	u64 val;
+	u64 mask;
+	u32 sysreg;
+	u8 nr_cnt;
+	u8 rt;
+	u8 idx;
+	bool ret;
+
+	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
+		return false;
+
+	pmuser = kvm_vcpu_read_pmuserenr(vcpu);
+
+	if (!(pmuser & ARMV8_PMU_USERENR_EN))
+		return false;
+
+	esr = kvm_vcpu_get_esr(vcpu);
+	p = esr_sys64_to_params(esr);
+	sysreg = esr_sys64_to_sysreg(esr);
+	rt = kvm_vcpu_sys_get_rt(vcpu);
+	val = vcpu_get_reg(vcpu, rt);
+	nr_cnt = vcpu->kvm->arch.nr_pmu_counters;
+
+	switch (sysreg) {
+	case SYS_PMCR_EL0:
+		mask = ARMV8_PMU_PMCR_MASK;
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmcr_el0);
+		} else {
+			mask |= ARMV8_PMU_PMCR_N;
+			val = u64_replace_bits(
+				read_sysreg(pmcr_el0),
+				nr_cnt,
+				ARMV8_PMU_PMCR_N);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMUSERENR_EL0:
+		mask = ARMV8_PMU_USERENR_MASK;
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmuserenr_el0);
+		} else {
+			val = read_sysreg(pmuserenr_el0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMSELR_EL0:
+		mask = PMSELR_EL0_SEL_MASK;
+		val &= mask;
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmselr_el0);
+		} else {
+			val = read_sysreg(pmselr_el0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+		ret = true;
+		break;
+	case SYS_PMINTENCLR_EL1:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmintenclr_el1);
+		} else {
+			val = read_sysreg(pmintenclr_el1);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+		ret = true;
+
+		break;
+	case SYS_PMINTENSET_EL1:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmintenset_el1);
+		} else {
+			val = read_sysreg(pmintenset_el1);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCNTENCLR_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmcntenclr_el0);
+		} else {
+			val = read_sysreg(pmcntenclr_el0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCNTENSET_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			write_sysreg(val & mask, pmcntenset_el0);
+		} else {
+			val = read_sysreg(pmcntenset_el0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMOVSCLR_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(val & mask));
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMOVSSET_EL0:
+		mask = kvm_pmu_accessible_counter_mask(vcpu);
+
+		if (p.is_write) {
+			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+			vcpu_set_reg(vcpu, rt, val & mask);
+		}
+
+		ret = true;
+		break;
+	case SYS_PMCCNTR_EL0:
+	case SYS_PMXEVCNTR_EL0:
+	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
+		if (sysreg == SYS_PMCCNTR_EL0)
+			idx = ARMV8_PMU_CYCLE_IDX;
+		else if (sysreg == SYS_PMXEVCNTR_EL0)
+			idx = FIELD_GET(PMSELR_EL0_SEL, kvm_vcpu_read_pmselr(vcpu));
+		else
+			idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
+
+		if (idx == ARMV8_PMU_CYCLE_IDX &&
+		    !(pmuser & ARMV8_PMU_USERENR_CR)) {
+			ret = false;
+			break;
+		} else if (!(pmuser & ARMV8_PMU_USERENR_ER)) {
+			ret = false;
+			break;
+		}
+
+		if (idx >= nr_cnt && idx < ARMV8_PMU_CYCLE_IDX) {
+			ret = false;
+			break;
+		}
+
+		pmselr = read_sysreg(pmselr_el0);
+		write_sysreg(idx, pmselr_el0);
+
+		if (p.is_write) {
+			write_sysreg(val, pmxevcntr_el0);
+		} else {
+			val = read_sysreg(pmxevcntr_el0);
+			vcpu_set_reg(vcpu, rt, val);
+		}
+
+		write_sysreg(pmselr, pmselr_el0);
+		ret = true;
+		break;
+	case SYS_PMCCFILTR_EL0:
+	case SYS_PMXEVTYPER_EL0:
+	case SYS_PMEVTYPERn_EL0(0) ... SYS_PMEVTYPERn_EL0(30):
+		if (sysreg == SYS_PMCCFILTR_EL0)
+			idx = ARMV8_PMU_CYCLE_IDX;
+		else if (sysreg == SYS_PMXEVTYPER_EL0)
+			idx = FIELD_GET(PMSELR_EL0_SEL, kvm_vcpu_read_pmselr(vcpu));
+		else
+			idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
+
+		if (idx == ARMV8_PMU_CYCLE_IDX &&
+		    !(pmuser & ARMV8_PMU_USERENR_CR)) {
+			ret = false;
+			break;
+		} else if (!(pmuser & ARMV8_PMU_USERENR_ER)) {
+			ret = false;
+			break;
+		}
+
+		if (idx >= nr_cnt && idx < ARMV8_PMU_CYCLE_IDX) {
+			ret = false;
+			break;
+		}
+
+		if (p.is_write) {
+			__vcpu_assign_sys_reg(vcpu, PMEVTYPER0_EL0 + idx, val);
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + idx);
+			vcpu_set_reg(vcpu, rt, val);
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
 static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (kvm_hyp_handle_tlbi_el2(vcpu, exit_code))
@@ -496,6 +731,9 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
 		return true;
 
+	if (kvm_hyp_handle_pmu_regs(vcpu))
+		return true;
+
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
 }
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog


