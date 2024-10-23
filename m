Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFACDDE7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/U+O+YAsqSUUVHchuRQkkV8w0urrD9a9sqCgxywamw=; b=He9LpIVE7kWU8m+4VgkwEW3bdU
	lzTNS8YsO2F2o+y6tjiO4ReEjSeUZ6jyvhFSjmoHD2NCOjzUXjTWH9fWrJ9YsNqyQG5Zv1hztT0EQ
	7m6ANGbXdrSqOFI1LjFxh7d2oQz149vHRQbwQtK5NLjBNsq86ldjI1j0fBH8wna+i+l7R+2aNa0ZR
	4h1+ZKWklyKxuMOFNSPm25sjIx5a/3jY4kz0XHI38jHk6hwQjcBwCOzczO1shIdUAilykx3QuH3to
	QVPKY+RHKy2N3QTM1TO/muaLEXrXY50IJ33JPkGtrJFl/Ye4JDty8ME3vvM+tgzm08L5PGq9Bz/Ib
	C8W42oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dHS-0000000ExjU-3iGR;
	Wed, 23 Oct 2024 15:28:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckO-0000000EpQb-2TQe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l/U+O+YAsqSUUVHchuRQkkV8w0urrD9a9sqCgxywamw=; b=CI+xebrWB79ybsZnPvrWC/rIP6
	aMiG0zCjxPYKwKPRj4z90IScVFqVLzr4CpmUd8IowVMtNbrW6XWszY7Fn3lyLcQ41ItWpKjxwViur
	LbYF5098tOQ2WRED3Em1vPgwtmDy4tgneQuxotLMjhnGp+xqaZa1nEV1XVDlotPok9ig9IghXJK+g
	qdVn4pMtT6MB+Bscnb16U+V2RI4yefTNbqiGA4hjeJCYZrR0Qy99HWbLAIwz97ycHcmBkrFV44OKK
	a4olztpIkyzA4cnmFqsY6ASV1SbJyX6xoWeXt9d4zfzK4LJLj+DHX3HNVQUJKw/G4ryNNPxq/LQcf
	pn/uoH+g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckJ-00000008Qbm-1XA1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BE255C5ADA;
	Wed, 23 Oct 2024 14:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FF1C4CECD;
	Wed, 23 Oct 2024 14:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695236;
	bh=ZIdV0IYdRcU2goxbfbCyfcqHM0/7fCtUsdkb6ElTh5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HUhvltMRvl85hHrz/0Iagi3sgcbeYapU9MX3BQW16pW6R9Px/hEAplgAsujKQeDbH
	 +KUtWgxScNgBo1rfxv/ehQiA9lYmNPTCsfKjykZeOAmrs4R0V/CVt5yT1kmUkS9lmZ
	 wu1yA1qiil4pMzezVkIE18DmwXTbn46nGD80O+DzWplqwcJ2Ft9X3u3Id48wHVKpAz
	 2Bt47nqpBKlR0NQPIv13aXSuGpbklDREuHQzNW+zduROWD1qlJF8U2glEXq3jVvsDg
	 bDsTdBqleYVVIHV4Y1UZOdUBL+mpVOT/EumqzoxzjJTaVZJ6uZQOHwM6AWKNV7iH4v
	 vZSSK8kgnQDeA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckE-0068vz-ME;
	Wed, 23 Oct 2024 15:53:54 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 25/37] KVM: arm64: Hide S1PIE registers from userspace when disabled for guests
Date: Wed, 23 Oct 2024 15:53:33 +0100
Message-Id: <20241023145345.1613824-26-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155359_777685_254347C9 
X-CRM114-Status: GOOD (  18.88  )
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

From: Mark Brown <broonie@kernel.org>

When the guest does not support S1PIE we should not allow any access
to the system registers it adds in order to ensure that we do not create
spurious issues with guest migration. Add a visibility operation for these
registers.

Fixes: 86f9de9db178 ("KVM: arm64: Save/restore PIE registers")
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20240822-kvm-arm64-hide-pie-regs-v2-3-376624fa829c@kernel.org
[maz: simplify by using __el2_visibility(), kvm_has_s1pie() throughout]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  3 +++
 arch/arm64/kvm/at.c                        |  4 +--
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  2 +-
 arch/arm64/kvm/nested.c                    |  4 +--
 arch/arm64/kvm/sys_regs.c                  | 31 +++++++++++++++++-----
 5 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 197a7a08b3af5..9a6997827ad49 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1514,4 +1514,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_tcr2(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, TCRX, IMP))
 
+#define kvm_has_s1pie(k)				\
+	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1PIE, IMP))
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index a9f665d5ceb0b..de7109111e404 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -95,7 +95,7 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
 
 static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 {
-	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+	if (!kvm_has_s1pie(vcpu->kvm))
 		return false;
 
 	switch (regime) {
@@ -1101,7 +1101,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
 	if (kvm_has_tcr2(vcpu->kvm)) {
 		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
-		if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
+		if (kvm_has_s1pie(vcpu->kvm)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
 		}
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index c92c2c0b86aa8..a306ea70502c4 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -58,7 +58,7 @@ static inline bool ctxt_has_s1pie(struct kvm_cpu_context *ctxt)
 		return false;
 
 	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64MMFR3_EL1, S1PIE, IMP);
+	return kvm_has_s1pie(kern_hyp_va(vcpu->kvm));
 }
 
 static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index e6d7114ef4d39..47be71279c304 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1080,7 +1080,7 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= (HFGxTR_EL2_nSMPRI_EL1 | HFGxTR_EL2_nTPIDR2_EL0);
 	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, THE, IMP))
 		res0 |= HFGxTR_EL2_nRCWMASK_EL1;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+	if (!kvm_has_s1pie(kvm))
 		res0 |= (HFGxTR_EL2_nPIRE0_EL1 | HFGxTR_EL2_nPIR_EL1);
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
 		res0 |= (HFGxTR_EL2_nPOR_EL0 | HFGxTR_EL2_nPOR_EL1);
@@ -1194,7 +1194,7 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= TCR2_EL2_AIE;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
 		res0 |= TCR2_EL2_POE | TCR2_EL2_E0POE;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+	if (!kvm_has_s1pie(kvm))
 		res0 |= TCR2_EL2_PIE;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
 		res0 |= (TCR2_EL2_E0POE | TCR2_EL2_D128 |
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 9b26514cf131f..85b465c9ec8fd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -373,7 +373,7 @@ static bool check_s1pie_access_rw(struct kvm_vcpu *vcpu,
 				  struct sys_reg_params *p,
 				  const struct sys_reg_desc *r)
 {
-	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
+	if (!kvm_has_s1pie(vcpu->kvm)) {
 		kvm_inject_undefined(vcpu);
 		return false;
 	}
@@ -2365,6 +2365,21 @@ static unsigned int tcr2_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, tcr2_visibility);
 }
 
+static unsigned int s1pie_visibility(const struct kvm_vcpu *vcpu,
+				     const struct sys_reg_desc *rd)
+{
+	if (kvm_has_s1pie(vcpu->kvm))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
+static unsigned int s1pie_el2_visibility(const struct kvm_vcpu *vcpu,
+					 const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, s1pie_visibility);
+}
+
 /*
  * Architected system registers.
  * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
@@ -2604,8 +2619,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMMIR_EL1), trap_raz_wi },
 
 	{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
-	{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1 },
-	{ SYS_DESC(SYS_PIR_EL1), NULL, reset_unknown, PIR_EL1 },
+	{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1,
+	  .visibility = s1pie_visibility },
+	{ SYS_DESC(SYS_PIR_EL1), NULL, reset_unknown, PIR_EL1,
+	  .visibility = s1pie_visibility },
 	{ SYS_DESC(SYS_POR_EL1), NULL, reset_unknown, POR_EL1,
 	  .visibility = s1poe_visibility },
 	{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL1 },
@@ -2916,8 +2933,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(HPFAR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(MAIR_EL2, access_rw, reset_val, 0),
-	EL2_REG(PIRE0_EL2, check_s1pie_access_rw, reset_val, 0),
-	EL2_REG(PIR_EL2, check_s1pie_access_rw, reset_val, 0),
+	EL2_REG_FILTERED(PIRE0_EL2, check_s1pie_access_rw, reset_val, 0,
+			 s1pie_el2_visibility),
+	EL2_REG_FILTERED(PIR_EL2, check_s1pie_access_rw, reset_val, 0,
+			 s1pie_el2_visibility),
 	EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
@@ -4807,7 +4826,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_ATS1E1RP |
 						HFGITR_EL2_ATS1E1WP);
 
-	if (!kvm_has_feat(kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+	if (!kvm_has_s1pie(kvm))
 		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPIRE0_EL1 |
 						HFGxTR_EL2_nPIR_EL1);
 
-- 
2.39.2


