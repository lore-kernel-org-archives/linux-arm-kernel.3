Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B0C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LUDBf5QxkKa+Esogmub7/Ta96yoX6znI4eeTq8O4IA=; b=n1GTYmOSBgpkczGwsuVyFeGoEd
	35Rs8CbyckcdfKo53smCy0G1MRhoN/57Saqlak5vY13GjKpRmgA8MB5Mnyiy+/LpadvxEKJk5i88z
	1sjktNImQ44bJZLlFJp+bfjeWGa+JoAdX3gER2Et3HrbHOzI7w6QJQrBqj7gCJXKk4BrYN1JSnWl7
	QdofX+KY0eYAVA5SUIkgteyi+3ksPtBV0vk+sHaaiT96qRChGCJ5m5bgbj72s5iCdyN62amLJcfor
	L3/Q0hBvPspccfD6Mo9jZMOBroM3Uspuo67XbJxjX9k2/yHdtBQtmXJheI/GfIu/5+Rf5bPJXM5HE
	2Sj8KlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y4-000000005gC-3VAF;
	Thu, 03 Sep 2026 16:07:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y1-000000005YR-1mrq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 442AF1D34;
	Thu,  3 Sep 2026 09:07:05 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39E9C3F673;
	Thu,  3 Sep 2026 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451629; bh=Qb3oPBwz4t17T1L/tcpkYmtgjbpA5m9YfiFEjNuQMo8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hQbkiO1tKYU1XOrbchK4lQWMbmXZo65sDm9oPpw2MOsawZEgsbsm8tNFDdaQpSitQ
	 WTsbLDl2ipkACZpm9hVwzkdEpiRdsDdqd8hlXv7UoLnsNiIizlnSZpKQN0ag/iqPOL
	 Ay+JLmYGOQ/tFJQT4hORMNQpah8y9eAiRzyRrm2k=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 16/28] KVM: arm64: Add SPE system registers to VCPU context
Date: Thu,  3 Sep 2026 17:06:11 +0100
Message-ID: <20260903160623.315525-17-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090709_556029_B39959CC 
X-CRM114-Status: GOOD (  17.78  )
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

Add the SPE registers to the VCPU context. Guest writes to the service bit,
which change the state of the SPE maintenance interrupt, will be handled in
a subsequent patch.

Only the buffer registers are trapped, because KVM will need to keep track
of the buffer enabled state for dirty page logging, errata handling and to
sanitise writes to PMBLIMITR_EL1 based on the features exposed to the VM.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 13 +++++++
 arch/arm64/include/asm/kvm_spe.h  | 11 ++++++
 arch/arm64/kvm/spe.c              | 29 ++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 56 ++++++++++++++++++++++++-------
 4 files changed, 96 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 10fa223bdbda..b92b19229c36 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -483,6 +483,19 @@ enum vcpu_sysreg {
 	PMOVSSET_EL0,	/* Overflow Flag Status Set Register */
 	PMUSERENR_EL0,	/* User Enable Register */
 
+	/* SPE registers */
+	PMSCR_EL1,
+	PMSNEVFR_EL1,
+	PMSICR_EL1,
+	PMSIRR_EL1,
+	PMSFCR_EL1,
+	PMSEVFR_EL1,
+	PMSLATFR_EL1,
+	PMBLIMITR_EL1,
+	PMBPTR_EL1,
+	PMBSR_EL1,
+	PMSDSFR_EL1,
+
 	/* Pointer Authentication Registers in a strict increasing order. */
 	APIAKEYLO_EL1,
 	APIAKEYHI_EL1,
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 4bae3e6b05c8..56dc9e660bef 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -37,6 +37,9 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 
 bool kvm_spe_pmu_set(struct kvm *kvm);
 u8 kvm_spe_get_pmsver(struct kvm *kvm);
+
+bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
+u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
 #else
 struct kvm_spe {
 };
@@ -81,6 +84,14 @@ static inline u8 kvm_spe_get_pmsver(struct kvm *kvm)
 {
 	return 0;
 }
+static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
+{
+	return true;
+}
+static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
+{
+	return 0;
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 4426d614a9e0..6a00a44c73ed 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 #include <linux/perf/arm_spe_pmu.h>
 
+#include <asm/kvm_emulate.h>
 #include <asm/kvm_spe.h>
 #include <asm/sysreg.h>
 
@@ -82,6 +83,34 @@ void kvm_spe_destroy_vm(struct kvm *kvm)
 	module_put(spe_pmu->pmu.module);
 }
 
+bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
+{
+	switch (reg) {
+	case PMBLIMITR_EL1:
+	case PMBSR_EL1:
+	case PMBPTR_EL1:
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+		break;
+	default:
+		WARN_ON_ONCE("unexpected trap");
+	}
+
+	return true;
+}
+
+u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
+{
+	switch (reg) {
+	case PMBLIMITR_EL1:
+	case PMBSR_EL1:
+	case PMBPTR_EL1:
+		return __vcpu_sys_reg(vcpu, reg);
+	default:
+		WARN_ON_ONCE("unexpected trap");
+		return 0;
+	}
+}
+
 bool kvm_spe_pmu_set(struct kvm *kvm)
 {
 	return !!kvm->arch.kvm_spe.spe_pmu;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a6bb6884b965..89b01b6ac783 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1554,6 +1554,28 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	return 0;
 }
 
+static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
+				   const struct sys_reg_desc *r)
+{
+	if (vcpu_has_spe(vcpu))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
+static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			   const struct sys_reg_desc *r)
+{
+	u64 val = p->regval;
+	int reg = r->reg;
+
+	if (p->is_write)
+		return kvm_spe_write_sysreg(vcpu, reg, val);
+
+	p->regval = kvm_spe_read_sysreg(vcpu, reg);
+	return true;
+}
+
 /* Silly macro to expand the DBG{BCR,BVR,WVR,WCR}n_EL1 registers in one go */
 #define DBG_BCR_BVR_WCR_WVR_EL1(n)					\
 	{ SYS_DESC(SYS_DBGBVRn_EL1(n)),					\
@@ -1586,6 +1608,14 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	  .reset = reset_pmevtyper,					\
 	  .access = access_pmu_evtyper, .reg = (PMEVTYPER0_EL0 + n), }
 
+#define SPE_SYS_REG(name)						\
+	SYS_DESC(SYS_##name), .reg = name, .access = access_spe_reg,	\
+	.reset = reset_val, .val = 0, .visibility = spe_visibility
+
+#define SPE_UNTRAPPED_REG(name)						\
+	SYS_DESC(SYS_##name), .reg = name, .access = undef_access,	\
+	.reset = reset_val, .val = 0, .visibility = spe_visibility
+
 /* Macro to expand the AMU counter and type registers*/
 #define AMU_AMEVCNTR0_EL0(n) { SYS_DESC(SYS_AMEVCNTR0_EL0(n)), undef_access }
 #define AMU_AMEVTYPER0_EL0(n) { SYS_DESC(SYS_AMEVTYPER0_EL0(n)), undef_access }
@@ -3525,19 +3555,19 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
 	{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
 
-	{ SYS_DESC(SYS_PMSCR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSNEVFR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSICR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSIRR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSFCR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSEVFR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSLATFR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSIDR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
-	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
-	/* PMBIDR_EL1 is not trapped */
+	{ SPE_UNTRAPPED_REG(PMSCR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSNEVFR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSICR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSIRR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
+	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
+	{ SPE_SYS_REG(PMBLIMITR_EL1) },
+	{ SPE_SYS_REG(PMBPTR_EL1) },
+	{ SPE_SYS_REG(PMBSR_EL1) },
+	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
+	/* PMBIDR_EL1 is not trapped and read-only */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),
 	  .access = access_pminten, .reg = PMINTENSET_EL1,
-- 
2.43.0


