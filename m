Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D95C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpHXXsH5yi2fHYPvHI4v5N4V2+xFzjjphJv7QxPpCG0=; b=hk5DqVe0G+702gQVBblH4Ygvaq
	K8ZyJuPFf5DLYtIvv854Rt8x/oX7srOUxaOEYTA3aPndMrjeinEEaMSziq2+dBrnklKxicNB0RX73
	MzV5O3jn9Fxfcdpq+PKGS/nevAg+qb4cAA3zLTL+fFCoNWodOTG9ognO1oJv1Ud7Yi/SCM6n3zchL
	ANs3Y9TvzsYDELvHJDIfgb13+Yh2fG5ORxsn5JJ/Ezevlwy9Q4it6zaBt+wgyRtM0KovoJUKJJnxd
	Na74NjAn7RQ7xeVyCHkIz+usHtDx0DnEzN9aJiXdE1Z4Zyy/WdbCfkwq3Zm2xCDeMB0zEBr9ujWWy
	s2C07TKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yA-000000005r1-11fa;
	Thu, 03 Sep 2026 16:07:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y6-000000005iv-0VSM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D341D34;
	Thu,  3 Sep 2026 09:07:09 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5985F3F673;
	Thu,  3 Sep 2026 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451633; bh=HykRoC+x7+WJpH6zqJw7sUTUkGOjuJltTihUTPx51TE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K90rYPg+6dENgxgZASly10im1bD4yhpBSzckl5iGbAhOxrXgBsWaaeA+m/+IuItRc
	 7/XegLpS62FtNtKB2aahfavnxtJ9g/cSR699hYuocLwYT0ehk6aTNZEfZckBlOm2uW
	 HofCD2iPrXWrivry32oeisiHIKqrdQOLdloZ/Mzk=
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
Subject: [RFC PATCH v7 18/28] KVM: arm64: config: Use functions from spe.c to test FEAT_SPE_{FnE,FDS}
Date: Thu,  3 Sep 2026 17:06:13 +0100
Message-ID: <20260903160623.315525-19-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090714_250740_F3293DB5 
X-CRM114-Status: GOOD (  15.69  )
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

KVM's FGU mechanism will trap the registers introduced by FEAT_SPE_FnE and
FEAT_SPE_FDS if the feature is not present for the VM. Move the functions
that check for the presence of these features out of config.c and into
spe.c, since that's where the bulk of SPE virtualization lies.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h | 11 +++++++++++
 arch/arm64/kvm/config.c          | 30 +++++-------------------------
 arch/arm64/kvm/spe.c             | 22 ++++++++++++++++++++++
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 3d8e9720daca..618051dcf59f 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -43,6 +43,9 @@ u8 kvm_spe_get_pmsver(struct kvm *kvm);
 
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
 u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
+
+bool kvm_spe_has_feat_spe_fne(struct kvm *kvm);
+bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);
 #else
 struct kvm_spe {
 };
@@ -99,6 +102,14 @@ static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
 {
 	return 0;
 }
+static inline bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
+{
+	return false;
+}
+static inline bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
+{
+	return false;
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 1053676551af..78e414ed736d 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_spe.h>
 #include <asm/sysreg.h>
 
 /*
@@ -159,7 +160,6 @@ struct reg_feat_map_desc {
 #define FEAT_GICv3		ID_AA64PFR0_EL1, GIC, IMP
 #define FEAT_LOR		ID_AA64MMFR1_EL1, LO, IMP
 #define FEAT_SPEv1p2		ID_AA64DFR0_EL1, PMSVer, V1P2
-#define FEAT_SPEv1p4		ID_AA64DFR0_EL1, PMSVer, V1P4
 #define FEAT_SPEv1p5		ID_AA64DFR0_EL1, PMSVer, V1P5
 #define FEAT_ATS1A		ID_AA64ISAR2_EL1, ATS1A, IMP
 #define FEAT_SPECRES2		ID_AA64ISAR1_EL1, SPECRES, COSP_RCTX
@@ -292,26 +292,6 @@ static bool feat_sme_smps(struct kvm *kvm)
 		(read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
 }
 
-static bool feat_spe_fds(struct kvm *kvm)
-{
-	/*
-	 * Revisit this if KVM ever supports SPE -- this really should
-	 * look at the guest's view of PMSIDR_EL1.
-	 */
-	return (kvm_has_feat(kvm, FEAT_SPEv1p4) &&
-		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FDS));
-}
-
-static bool feat_spe_fne(struct kvm *kvm)
-{
-	/*
-	 * Revisit this if KVM ever supports SPE -- this really should
-	 * look at the guest's view of PMSIDR_EL1.
-	 */
-	return (kvm_has_feat(kvm, FEAT_SPEv1p2) &&
-		(read_sysreg_s(SYS_PMSIDR_EL1) & PMSIDR_EL1_FnE));
-}
-
 static bool feat_trbe_mpam(struct kvm *kvm)
 {
 	/*
@@ -547,7 +527,7 @@ static const struct reg_bits_to_feat_map hdfgrtr_feat_map[] = {
 		   HDFGRTR_EL2_PMBPTR_EL1	|
 		   HDFGRTR_EL2_PMBLIMITR_EL1,
 		   FEAT_SPE),
-	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
+	NEEDS_FEAT(HDFGRTR_EL2_nPMSNEVFR_EL1, kvm_spe_has_feat_spe_fne),
 	NEEDS_FEAT(HDFGRTR_EL2_nBRBDATA		|
 		   HDFGRTR_EL2_nBRBCTL		|
 		   HDFGRTR_EL2_nBRBIDR,
@@ -615,7 +595,7 @@ static const struct reg_bits_to_feat_map hdfgwtr_feat_map[] = {
 		   HDFGWTR_EL2_PMBPTR_EL1	|
 		   HDFGWTR_EL2_PMBLIMITR_EL1,
 		   FEAT_SPE),
-	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, feat_spe_fne),
+	NEEDS_FEAT(HDFGWTR_EL2_nPMSNEVFR_EL1, kvm_spe_has_feat_spe_fne),
 	NEEDS_FEAT(HDFGWTR_EL2_nBRBDATA		|
 		   HDFGWTR_EL2_nBRBCTL,
 		   FEAT_BRBE),
@@ -851,7 +831,7 @@ static const struct reg_bits_to_feat_map hdfgrtr2_feat_map[] = {
 		   HDFGRTR2_EL2_nPMSSDATA,
 		   FEAT_PMUv3_SS),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
-	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
+	NEEDS_FEAT(HDFGRTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
 	NEEDS_FEAT(HDFGRTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
 	NEEDS_FEAT(HDFGRTR2_EL2_nSPMACCESSR_EL1	|
 		   HDFGRTR2_EL2_nSPMCNTEN	|
@@ -884,7 +864,7 @@ static const struct reg_bits_to_feat_map hdfgwtr2_feat_map[] = {
 		   feat_pmuv3p9),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMSSCR_EL1, FEAT_PMUv3_SS),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMIAR_EL1, FEAT_SEBEP),
-	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, feat_spe_fds),
+	NEEDS_FEAT(HDFGWTR2_EL2_nPMSDSFR_EL1, kvm_spe_has_feat_spe_fds),
 	NEEDS_FEAT(HDFGWTR2_EL2_nPMBMAR_EL1, FEAT_SPE_nVM),
 	NEEDS_FEAT(HDFGWTR2_EL2_nSPMACCESSR_EL1	|
 		   HDFGWTR2_EL2_nSPMCNTEN	|
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 8c173a1f48bd..3b285b45332b 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -113,6 +113,28 @@ void kvm_spe_destroy_vm(struct kvm *kvm)
 	module_put(spe_pmu->pmu.module);
 }
 
+bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
+{
+	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.spe_pmu;
+
+	if (!spe_pmu)
+		return false;
+
+	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
+	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
+}
+
+bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
+{
+	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.spe_pmu;
+
+	if (!spe_pmu)
+		return false;
+
+	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
+	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
+}
+
 bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
 {
 	struct kvm_spe *kvm_spe = &vcpu->kvm->arch.kvm_spe;
-- 
2.43.0


