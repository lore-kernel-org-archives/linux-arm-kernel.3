Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AE4E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTwHIpJ9tJyQIGbWN3On04XODjWvuR+JFUKDYOE7ZPI=; b=LTofC9RHe+bwhKn9waHyZPBrO1
	j6OJorlGIBLbnwnY0sC7bRzEnD2p63I2a+h1qEjplph6nICq7ALaaq0kteE47IPURZbF6oxIbF/9N
	qH3HMx1C/w7m1JhlLPHUkJTxAUds+3P1AaWRatGrdWvMNjkHb1aWc//qoaclDDgoVqC3g7AkZZJJp
	GcjhnekqNmX3pt8X6ZjSPklYy2VwrH27oCPFkzRYSjIB7Z/f1p+E/7iA+fpdgB8NmO6g6x3vUIupM
	WtvaST/YlSsrGckaMDCxXWXoJi1Lchb6Fbps1c1FASlK6cCmT39/12SSOK4mLbn8jAQ1dzXE8kwyK
	E9f4XyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7G-0000000EMT3-2dFg;
	Tue, 23 Dec 2025 01:23:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6z-0000000EMBq-3seI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F59444D2;
	Tue, 23 Dec 2025 01:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C5BC4CEF1;
	Tue, 23 Dec 2025 01:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452973;
	bh=4tkVTtIcV+e0K2I4W+1hXNEToJhLsGAEEoG4YE4nVFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QKCXZGXJHQwD4bhRzNLQNAPRbvz9UGGP5t2joUhKoPVr0i2REx+KJmI+eGT9BDa5F
	 OOjEoD//cp5peaaP6p2EHMDrtosfYbcprJVcomcwCRvMObfAChObdviGyiuRAcKEvS
	 bLmcMylMgXbzseWNlrLN+z2hQyv+agEzq3dH4QZnroICVhiGmKcuvW72HbwMB6kDPs
	 1Ko6Z+TYtKkYmci+QUhqOzLaDOBOGswEer5oF/zZrA2NsXNPqP3XM86HE9Jmwu8Mfi
	 L0B9WJXY3Wkrt9r4XVL3CYOJ5G+ECI6pEZ4A2xAfzpbOzx3wNXtUCO70K4o4nF9Hsi
	 EFJs0xNvLoNhA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:12 +0000
Subject: [PATCH v9 18/30] KVM: arm64: Support SME priority registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=6158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4tkVTtIcV+e0K2I4W+1hXNEToJhLsGAEEoG4YE4nVFY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6Q5ExWg5wVwOPBRRvKAq0znb2Hu7WznP00r
 umsHMxP8e2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnukAAKCRAk1otyXVSH
 0EwJB/98PQP6BIwFdnJL41doY1V6EXpRtB421waSmISOsufUulVltMbKI/RzvMDapY35h27Sm08
 o35srME+QFcH3Ha98Xwli0tjM+0kQYQdeIClelcVCA0Do7AXG5EJEXJOGU9AkgLY0L3Ps91aVs8
 ZpBaNGsa3oB/CcFxs0VQbblEJEoxAjB257sYfOenTZNesxHcC4/MYR+X+Q2uP5waeFy+w8Uv85J
 ntKTYSZ5zH1z6Yjl9LfY2VO92a1yzQd+13mgppVwjUSwERttucyclt4Ut+0aKWoCH5fx4IFVT+O
 LQW4F4t0yfvkbuDU376YFKed3YsoLiUmKmWjEMpEj1aBNO53
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172254_060711_D0E3CBD4 
X-CRM114-Status: GOOD (  22.46  )
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

SME has optional support for configuring the relative priorities of PEs
in systems where they share a single SME hardware block, known as a
SMCU. Currently we do not have any support for this in Linux and will
also hide it from KVM guests, pending experience with practical
implementations. The interface for configuring priority support is via
two new system registers, these registers are always defined when SME is
available.

The register SMPRI_EL1 allows control of SME execution priorities. Since
we disable SME priority support for guests this register is RES0, define
it as such and enable fine grained traps for SMPRI_EL1 to ensure that
guests can't write to it even if the hardware supports priorites.  Since
the register should be readable with fixed contents we only trap writes,
not reads. Since there is no host support for using priorities the
register currently left with a value of 0 by the host so we do not need
to update the value for guests.

There is also an EL2 register SMPRIMAP_EL2 for virtualisation of
priorities, this is RES0 when priority configuration is not supported
but has no specific traps available.  When saving state from a nested
guest we overwite any value the guest stored.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h     |  1 +
 arch/arm64/include/asm/vncr_mapping.h |  1 +
 arch/arm64/kvm/config.c               |  3 +++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c    |  7 +++++++
 arch/arm64/kvm/sys_regs.c             | 30 +++++++++++++++++++++++++++++-
 5 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fead6988f47c..44595a789a97 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -546,6 +546,7 @@ enum vcpu_sysreg {
 	VNCR(CPACR_EL1),/* Coprocessor Access Control */
 	VNCR(ZCR_EL1),	/* SVE Control */
 	VNCR(SMCR_EL1),	/* SME Control */
+	VNCR(SMPRIMAP_EL2),	/* Streaming Mode Priority Mapping Register */
 	VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
 	VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
 	VNCR(TCR_EL1),	/* Translation Control Register */
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 44b12565321b..a2a84af6585b 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -45,6 +45,7 @@
 #define VNCR_ZCR_EL1            0x1E0
 #define VNCR_HAFGRTR_EL2	0x1E8
 #define VNCR_SMCR_EL1		0x1F0
+#define VNCR_SMPRIMAP_EL2	0x1F0
 #define VNCR_TTBR0_EL1          0x200
 #define VNCR_TTBR1_EL1          0x210
 #define VNCR_FAR_EL1            0x220
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 7e26991b2df1..0088635a95bd 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1481,6 +1481,9 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 
 	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
+
+	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
+		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_nSMPRI_EL1;
 }
 
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index f28c6cf4fe1b..07aa4378c58a 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -80,6 +80,13 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 
 	if (ctxt_has_sctlr2(&vcpu->arch.ctxt))
 		__vcpu_assign_sys_reg(vcpu, SCTLR2_EL2, read_sysreg_el1(SYS_SCTLR2));
+
+	/*
+	 * We block SME priorities so SMPRIMAP_EL2 is RES0, however we
+	 * do not have traps to block access so the guest might have
+	 * updated the state, overwrite anything there.
+	 */
+	__vcpu_assign_sys_reg(vcpu, SMPRIMAP_EL2, 0);
 }
 
 static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a7ab02822023..51f175bbe8d1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -691,6 +691,15 @@ static bool trap_raz_wi(struct kvm_vcpu *vcpu,
 		return read_zero(vcpu, p);
 }
 
+static int set_res0(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
+		    u64 val)
+{
+	if (val)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * ARMv8.1 mandates at least a trivial LORegion implementation, where all the
  * RW registers are RES0 (which we can implement as RAZ/WI). On an ARMv8.0
@@ -1979,6 +1988,15 @@ static unsigned int fp8_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static unsigned int sme_raz_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	if (vcpu_has_sme(vcpu))
+		return REG_RAZ;
+
+	return REG_HIDDEN;
+}
+
 static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
 {
 	if (!vcpu_has_sve(vcpu))
@@ -3349,7 +3367,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
 	{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
-	{ SYS_DESC(SYS_SMPRI_EL1), undef_access },
+
+	/*
+	 * SMPRI_EL1 is UNDEF when SME is disabled, the UNDEF is
+	 * handled via FGU which is handled without consulting this
+	 * table.
+	 */
+	{ SYS_DESC(SYS_SMPRI_EL1), trap_raz_wi, .visibility = sme_raz_visibility },
+
 	{ SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
@@ -3719,6 +3744,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
 
+	{ SYS_DESC(SYS_SMPRIMAP_EL2), .reg = SMPRIMAP_EL2,
+	  .access = trap_raz_wi, .set_user = set_res0, .reset = reset_val,
+	  .val = 0, .visibility = sme_el2_visibility },
 	EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
 			 sme_el2_visibility),
 

-- 
2.47.3


