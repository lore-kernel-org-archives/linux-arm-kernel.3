Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E36CE8D50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NltffDxsrP2OriSuQube5x2RMZIEZnEw5YmbG/VoHzw=; b=TUL/wgbyW/ELuZzGPgJg9UMIDt
	GH6Mzdihri+sMuEiLoARBrafItD56h44W86i+tn4fFfMAlsrAoQDuB8cSIuZW9h3bBpVgHGBS6JjW
	WbyL/6B3NcL8JE4DqXZaCo60nyByWEFkurGDbDLYqIHscRsFreEIeDVa8z9GBvsUbFsJEXx0X/Pzf
	7SiXaIEXGchw8fq2C4vFa5Fpa3E1bhOlN5J64aI7r+NJZ+GfC0MvLQ131Hxro8lhfk2lMSYGL0HPk
	VGiQYMJTGSf5BH9HppAP2n9utLb+xgBwCOVTEp8XVeOcW9lq0oBods2RWbGol5HlloqBGlwWpzDII
	Vw1gRA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLr-0000000Cfvb-2hbC;
	Fri, 14 Nov 2025 16:08:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLa-0000000CfYY-1UPr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NltffDxsrP2OriSuQube5x2RMZIEZnEw5YmbG/VoHzw=; b=iQUjD3QMrT6loi3kqjkrAZwqEe
	uAmHwQkLR34fsgtmExsygP5H1RkZ/PdPQekvp6U/xe2NvZzeE4I4eOYm6+a+wdUm68wBfhYh2mu47
	6OBevOCPjfHdgnkp3z5doN0q89DN0iniivwwC3ffWuDoMee3T7vmEXU3vVj4BR7M7SxZCMmbbXNJi
	2BcjPTDvMkDUV+ne+359O9GIqe6y5bc8VNYec+xVjoot2PIE9psEhYKS6/Nh7dG8E8qmyweUurIm1
	jGJwrweJoNnkquCKFAnJw2sZVbA6jJPJB8lVg1H7OF3gOR7vCpouqiwaoL5FFYFTE4fxS7xrEGAgb
	+t6VCG5w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTs-00000002vVd-2UVX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:12:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7F491BB0;
	Fri, 14 Nov 2025 08:08:14 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59C693F5A1;
	Fri, 14 Nov 2025 08:08:20 -0800 (PST)
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
Subject: [RFC PATCH v6 19/35] KVM: arm64: Trap PMBIDR_EL1 and PMSIDR_EL1
Date: Fri, 14 Nov 2025 16:07:00 +0000
Message-ID: <20251114160717.163230-20-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151256_995896_B418FC1C 
X-CRM114-Status: GOOD (  17.05  )
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

PMBIDR_EL1 and PMSIDR_EL1 are read-only registers that describe the SPE
implementation. Trap reads to allow KVM to control how SPE is described to
a virtual machine. In particular, this is needed to:

- Advertise the maximum buffer size set by userspace in
  PMBIDR_EL1.MaxBuffSize.
- Hide in PMSIDR_EL1, if necessary, the presence of FEAT_SPE_FDS and
  FEAT_SPE_FnE, both of which add new registers which are already
  trapped via the FGU mechanism.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h |  4 +-
 arch/arm64/kvm/config.c          | 13 ++++-
 arch/arm64/kvm/spe.c             | 82 +++++++++++++++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c        | 13 +++--
 4 files changed, 103 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 3506d8c4c661..47b94794cc5f 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -40,7 +40,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
-u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
+u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
 #else
 struct kvm_spe {
 };
@@ -78,7 +78,7 @@ static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 {
 	return true;
 }
-static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
+static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
 {
 	return 0;
 }
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 24bb3f36e9d5..ed6b167b7aa8 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -6,6 +6,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_spe.h>
 #include <asm/kvm_nested.h>
 #include <asm/sysreg.h>
 
@@ -1489,6 +1490,16 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
+static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR_EL2);
+
+	if (vcpu_has_spe(vcpu)) {
+		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMBIDR_EL1;
+		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMSIDR_EL1;
+	}
+}
+
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 {
 	__compute_fgt(vcpu, HDFGWTR_EL2);
@@ -1505,7 +1516,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR_EL2);
 	__compute_hfgwtr(vcpu);
 	__compute_fgt(vcpu, HFGITR_EL2);
-	__compute_fgt(vcpu, HDFGRTR_EL2);
+	__compute_hdfgrtr(vcpu);
 	__compute_hdfgwtr(vcpu);
 	__compute_fgt(vcpu, HAFGRTR_EL2);
 
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 5b3dc622cf82..92eb46276c71 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -22,10 +22,16 @@ struct arm_spu_entry {
 	struct arm_spe_pmu *arm_spu;
 };
 
+static u64 max_buffer_size_to_pmbidr_el1(u64 size);
+
 void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
 {
 	struct arm_spu_entry *entry;
 
+	/* PMBIDR_EL1 cannot be trapped without FEAT_FGT. */
+	if (!cpus_have_final_cap(ARM64_HAS_FGT))
+		return;
+
 	/* TODO: pKVM and nVHE support */
 	if (is_protected_kvm_enabled() || !has_vhe())
 		return;
@@ -86,9 +92,81 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 	return true;
 }
 
-u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
+static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
+{
+	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
+
+	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
+	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
+}
+
+static bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
+{
+	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
+
+	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
+	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
+}
+
+static u64 kvm_spe_get_pmsidr_el1(struct kvm_vcpu *vcpu)
 {
-	return __vcpu_sys_reg(vcpu, reg);
+	struct kvm *kvm = vcpu->kvm;
+	u64 pmsidr = kvm->arch.kvm_spe.arm_spu->pmsidr_el1;
+
+	/* Filter out known RES0 bits. */
+	pmsidr &= ~GENMASK_ULL(63, 33);
+
+	if (!kvm_spe_has_feat_spe_fne(kvm))
+		pmsidr &= ~PMSIDR_EL1_FnE;
+
+	if (!kvm_spe_has_feat_spe_fds(kvm))
+		pmsidr &= ~PMSIDR_EL1_FDS;
+
+	return pmsidr;
+}
+
+static u64 kvm_spe_get_pmbidr_el1(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
+	u64 max_buffer_size = kvm_spe->max_buffer_size;
+	u64 pmbidr_el1 = kvm_spe->arm_spu->pmbidr_el1;
+
+	/* Filter out known RES0 bits. */
+	pmbidr_el1 &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(31, 12));
+
+	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, SPE_nVM, IMP)) {
+		pmbidr_el1 &= ~PMBIDR_EL1_AddrMode;
+		pmbidr_el1 |= PMBIDR_EL1_AddrMode_VM_ONLY;
+	}
+
+	pmbidr_el1 &= ~PMBIDR_EL1_MaxBuffSize;
+	pmbidr_el1 |= max_buffer_size_to_pmbidr_el1(max_buffer_size);
+
+	return pmbidr_el1;
+}
+
+u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
+{
+	u64 val = 0;
+
+	switch (encoding) {
+	case SYS_PMBIDR_EL1:
+		val = kvm_spe_get_pmbidr_el1(vcpu);
+		break;
+	case SYS_PMSIDR_EL1:
+		val = kvm_spe_get_pmsidr_el1(vcpu);
+		break;
+	case SYS_PMBLIMITR_EL1:
+	case SYS_PMBPTR_EL1:
+	case SYS_PMBSR_EL1:
+		val = __vcpu_sys_reg(vcpu, reg);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+
+	return val;
 }
 
 static u64 max_buffer_size_to_pmbidr_el1(u64 size)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5eeea229b46e..db86d1dcd148 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1386,13 +1386,18 @@ static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
 static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
 {
+	u32 encoding = reg_to_encoding(r);
 	u64 val = p->regval;
 	int reg = r->reg;
 
-	if (p->is_write)
+	if (p->is_write) {
+		if (WARN_ON_ONCE(encoding == SYS_PMBIDR_EL1 ||
+				 encoding == SYS_PMSIDR_EL1))
+			return write_to_read_only(vcpu, p, r);
 		return kvm_spe_write_sysreg(vcpu, reg, val);
+	}
 
-	p->regval = kvm_spe_read_sysreg(vcpu, reg);
+	p->regval = kvm_spe_read_sysreg(vcpu, reg, encoding);
 	return true;
 }
 
@@ -3360,12 +3365,12 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
 	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
 	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
-	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
+	{ SYS_DESC(SYS_PMSIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
 	{ SPE_TRAPPED_REG(PMBLIMITR_EL1) },
 	{ SPE_TRAPPED_REG(PMBPTR_EL1) },
 	{ SPE_TRAPPED_REG(PMBSR_EL1) },
 	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
-	{ SYS_DESC(SYS_PMBIDR_EL1), .access = undef_access },
+	{ SYS_DESC(SYS_PMBIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),
 	  .access = access_pminten, .reg = PMINTENSET_EL1,
-- 
2.51.2


