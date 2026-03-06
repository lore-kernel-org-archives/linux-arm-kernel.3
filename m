Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738AFCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ORsfkUjoIfAvgh3oG4AgVDkJ7tXbqsb/bjHCruQTTk=; b=X1KltNix3oxdD7CLOk1DM1zKTy
	AXsbyAaSw3k+WyFdK1shIbwujnk2pSUpx6wMHcFc6Ls5eLQgrUE6aMwTxrOhjp9QUXZS5mTw7W4vB
	1J3JFEUs52Qu48MVS2xx3h2o9kMEId6qSlYEfmB1CfF6c1P566I2itEmGBql/DmgoPb/YBe2tSWVL
	UPHip4PM5U57eHp/r3/8Cl37hwoBiuF8snBEOnMq6ISdnnO97+WtG2So9gu/VHxOMUqB4FtEWYVF5
	YPYAz2PS1Bs8Vp+6ShWCTTvw8Ut630AnHAlJgEvBfxAJVFyYFqOKSir4EoTLMjPM9TRR2nKqosUXs
	Ul36IvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhe-00000004E1z-1iZk;
	Fri, 06 Mar 2026 17:11:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYha-00000004Dx2-2wGA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 17:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+ORsfkUjoIfAvgh3oG4AgVDkJ7tXbqsb/bjHCruQTTk=; b=TtagyV14ej+ectsmpqXPXwb6/f
	S4VH1F5YiuMxPHFzf7di5VDh00a1jKXp75rYl6+p3K64QcMhaHUg771UoO0d3HsXF4HpfCIoLkwcU
	50eIcYjleuODL3RtCFsTF6joJT8bmKTGdgN0qhd6ntdwAwuIvTBnwbLv3Li/9R0rzB5KipVyfF2yy
	pc8WarqDEgCWiMcO0zFC6CLoPjcD1eopGlmrCU9Eo2OuwXBCt4jwxg+PD6ZJrMXUnIwOJH/9WKCPZ
	sPFr5soioFkA7MPUP6NqPHQ2wuyz0SACPGGTtKpoLcNPY1tspxzdDNWFrOLEDKYHYV1QBs6zBu3Eq
	AbJcYCdA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhX-00000009JjM-2Hqy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 423E8406E1;
	Fri,  6 Mar 2026 17:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2888BC2BC86;
	Fri,  6 Mar 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817058;
	bh=XMWKLA20ZJQ2D0jPmK3pGEr/rR365kxTEGOE8CBcYKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jy0PsE97fdBos7uFwCnhSEbAKskXM3/fhbc94U6zjtBirw/7zesavv4H3JUyxDjgd
	 VjP3km3gjW4kbshvFPiBwPcgcylOsjOPUZBPz7QZfESvzku8RAGmxbO4E0lZsNuQGC
	 lS+URgG2cQ7rx5qXEtFbraOCAGKJQAYxBWZekZqOAywsUg6Wjbm7rgYhCyfKiKvfwh
	 ude9dLjYYOXY8otXWL/n/AqjD/rTYZBhCHf4lSq07yCaV6TxnxlrgcI0yRXiRsjXA9
	 Ubj1XpZeaO10NZpxYgYpB+ZAvlvQBQVPzXwA+rqT+522WdDBbp14OXVnXHOvFkcQUo
	 iL12G1WtBl/jw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:13 +0000
Subject: [PATCH v10 21/30] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-21-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=4405; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XMWKLA20ZJQ2D0jPmK3pGEr/rR365kxTEGOE8CBcYKo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo4QB0GzEXtABB8d+AGe7mHIeS5KOZQ4FwqN
 ejgafKoNX2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKOAAKCRAk1otyXVSH
 0NycB/97X0uK9f1azHuOQ9RQ6KvzB3F7lsfXwATUwgISCKtgmoBQo3Yp3RnWqW/dP7qv49ubFVB
 2uQhPj8uIT4fw5JT9uWAZWzcMsLnROShZjCgiyuiwYxrl76n/yBdkTnRgSbSfoii6+1aOLOEe/t
 0E2DbQnv0pI/DamIUJSWsuoY0Uh34MJ8ULaz+j6YEPYZX0j0Kh1C5ejLVkdVKxBrSZLrNfy/siO
 x+CMlqhO2/d/N42MYLdqL0y0vSosxDw+HRDAQUaiIsS2oj4o/4kVmA3q/THepzr8xnvfMMZX9U0
 fwFXvt4nyPydtfHvdhDqiUy8HmmNwzzdM+jC/OrMQxyCSFVq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_171100_070802_D5164B93 
X-CRM114-Status: GOOD (  17.87  )
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

Writes to the physical SVCR.SM and SVCR.ZA change the state of PSTATE.SM
and PSTATE.ZA, causing other floating point state to reset. Emulate this
behaviour for writes done via the KVM userspace ABI.

Setting PSTATE.ZA to 1 causes ZA and ZT0 to be reset to 0, these are stored
in sme_state. Setting PSTATE.ZA to 0 causes ZA and ZT0 to become inaccessible
so no reset is needed.

Any change in PSTATE.SM causes the V, Z, P, FFR and FPMR registers to be
reset to 0 and FPSR to be reset to 0x800009f.

Rather than introduce a requirement that the vector configuration be
finalised before writing to SVCR we check for this before updating the
SVE and SME specific state, when finalisation happens they will be
allocated with an initial state of 0.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 24 ++++++++++++++++++++++++
 arch/arm64/include/asm/sysreg.h   |  2 ++
 arch/arm64/kvm/sys_regs.c         | 30 +++++++++++++++++++++++++++++-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 094cbf8e7022..aa0817eb1b48 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1172,6 +1172,30 @@ struct kvm_vcpu_arch {
 
 #define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
 
+#define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
+
+#define sme_state_size_from_vl(vl, sme2) ({				\
+	size_t __size_ret;						\
+	unsigned int __vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid(vl))) {				\
+		__size_ret = 0;						\
+	} else {							\
+		__vq = sve_vq_from_vl(vl);				\
+		__size_ret = ZA_SIG_REGS_SIZE(__vq);			\
+		if (sme2)						\
+			__size_ret += ZT_SIG_REG_SIZE;			\
+	}								\
+									\
+	__size_ret;							\
+})
+
+#define vcpu_sme_state_size(vcpu) ({					\
+	unsigned long __vl;						\
+	__vl = (vcpu)->arch.max_vl[ARM64_VEC_SME];			\
+	sme_state_size_from_vl(__vl, vcpu_has_sme2(vcpu));		\
+})
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f4436ecc630c..90d398429d80 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1101,6 +1101,8 @@
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
+#define FPSR_RESET_VALUE	0x800009f
+
 #ifdef __ASSEMBLER__
 
 	.macro	mrs_s, rt, sreg
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 0ddb89723819..8a9fd8d69d6e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -927,6 +927,34 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static int set_svcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	u64 old = __vcpu_sys_reg(vcpu, rd->reg);
+
+	if (val & SVCR_RES0)
+		return -EINVAL;
+
+	if ((val & SVCR_ZA) && !(old & SVCR_ZA) &&
+	    kvm_arm_vcpu_vec_finalized(vcpu))
+		memset(vcpu->arch.sme_state, 0, vcpu_sme_state_size(vcpu));
+
+	if ((val & SVCR_SM) != (old & SVCR_SM)) {
+		memset(vcpu->arch.ctxt.fp_regs.vregs, 0,
+		       sizeof(vcpu->arch.ctxt.fp_regs.vregs));
+
+		if (kvm_arm_vcpu_vec_finalized(vcpu))
+			memset(vcpu->arch.sve_state, 0,
+			       vcpu_sve_state_size(vcpu));
+
+		__vcpu_assign_sys_reg(vcpu, FPMR, 0);
+		vcpu->arch.ctxt.fp_regs.fpsr = FPSR_RESET_VALUE;
+	}
+
+	__vcpu_assign_sys_reg(vcpu, rd->reg, val);
+	return 0;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -3535,7 +3563,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    CTR_EL0_DminLine_MASK |
 		    CTR_EL0_L1Ip_MASK |
 		    CTR_EL0_IminLine_MASK),
-	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
+	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,

-- 
2.47.3


