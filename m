Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C9AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYWKr0pLF1gqzXAJzy4K9O/VjD+jF3Lcopj7i03TrbE=; b=lfnsadu+ZXx3KUT2QSIQ1lLmuv
	nlppfezstkGx2amy/xlNd4PMHUZkIRC0RW8woVBxyudVMsCYJmb91Eh5AL+L1IIVkAQELwYk+rJoJ
	mwBsS+DsCbhF+lUI1mSsSTLEayTvJKORCXn3j+6QOnEET19sHU0oQFa/KAcUpGGTE+iiUabvy6Mz4
	iYXJDQnNkPSBNc1k+B0f/jvniuQJheQBBQLUdZx/vjYil0yKexOcai0TrEYnaoocxx4nHSG3EZuqj
	FDh4MaHzvjy6XVVOFQu7KAmdl4N4bGFC1Yi28y8f4LCvjQCoTEJydK7YwXboVFxr/n9qEZLxhxWlS
	qYH3IN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQh5-0000000DX0S-330C;
	Tue, 06 May 2025 22:23:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOy-0000000CiRP-3S1t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87D9A4A588;
	Tue,  6 May 2025 16:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484A2C4CEEB;
	Tue,  6 May 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549856;
	bh=ikEVPTCgx+pcsQUOo1kkFEMf6wRZO+tjbLPH51jTJUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WcvHBbyCeScUoQABtOU8XdJAgSHu5r/ro7v7WmhLV1PtYTQxye5uNdozOzuNKsfxW
	 UY+SO07tMI6tlLfFotitPNamB4HmQw53qpCr6YipBF54ocf9BSOUMpLsgYTDmFQyxX
	 xBlvTHhxDtf1ImSVMJ3mN5Ni4XnLfmnI9gYbeWU64/9dBLVspJHBRzZp0bP967RS6g
	 X+0rvNN4/cjLGVb46IBjy6GFLCebjii2gn0q22VuXMWXPXz4b1YuCpcnRMXHZIrmeT
	 tzWMsnjeL0W4QGbriKySAbGmt6zws/KmfSEJViIJmDWWR1JfZU924JMtrHmq+JPiR8
	 OyQRC6KrXViiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOw-00CJkN-HL;
	Tue, 06 May 2025 17:44:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 36/43] KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits
Date: Tue,  6 May 2025 17:43:41 +0100
Message-Id: <20250506164348.346001-37-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094416_961429_A939EE45 
X-CRM114-Status: GOOD (  19.23  )
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

Similarly to other registers, describe which HCR_EL2 bit depends
on which feature, and use this to compute the RES0 status of these
bits.

An additional complexity stems from the status of some bits such
as E2H and RW, which do not had a RESx status, but still take
a fixed value due to implementation choices in KVM.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 149 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c |  38 +---------
 2 files changed, 150 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 3d2c682bb53f7..b1db94057c937 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -69,7 +69,10 @@ struct reg_bits_to_feat_map {
 #define FEAT_TRBE		ID_AA64DFR0_EL1, TraceBuffer, IMP
 #define FEAT_DoubleLock		ID_AA64DFR0_EL1, DoubleLock, IMP
 #define FEAT_TRF		ID_AA64DFR0_EL1, TraceFilt, IMP
+#define FEAT_AA32EL0		ID_AA64PFR0_EL1, EL0, AARCH32
+#define FEAT_AA32EL1		ID_AA64PFR0_EL1, EL1, AARCH32
 #define FEAT_AA64EL1		ID_AA64PFR0_EL1, EL1, IMP
+#define FEAT_AA64EL3		ID_AA64PFR0_EL1, EL3, IMP
 #define FEAT_AIE		ID_AA64MMFR3_EL1, AIE, IMP
 #define FEAT_S2POE		ID_AA64MMFR3_EL1, S2POE, IMP
 #define FEAT_S1POE		ID_AA64MMFR3_EL1, S1POE, IMP
@@ -92,6 +95,7 @@ struct reg_bits_to_feat_map {
 #define FEAT_PAN2		ID_AA64MMFR1_EL1, PAN, PAN2
 #define FEAT_DPB2		ID_AA64ISAR1_EL1, DPB, DPB2
 #define FEAT_AMUv1		ID_AA64PFR0_EL1, AMU, IMP
+#define FEAT_AMUv1p1		ID_AA64PFR0_EL1, AMU, V1P1
 #define FEAT_CMOW		ID_AA64MMFR1_EL1, CMOW, IMP
 #define FEAT_D128		ID_AA64MMFR3_EL1, D128, IMP
 #define FEAT_DoubleFault2	ID_AA64PFR1_EL1, DF2, IMP
@@ -102,6 +106,31 @@ struct reg_bits_to_feat_map {
 #define FEAT_SYSREG128		ID_AA64ISAR2_EL1, SYSREG_128, IMP
 #define FEAT_TCR2		ID_AA64MMFR3_EL1, TCRX, IMP
 #define FEAT_XS			ID_AA64ISAR1_EL1, XS, IMP
+#define FEAT_EVT		ID_AA64MMFR2_EL1, EVT, IMP
+#define FEAT_EVT_TTLBxS		ID_AA64MMFR2_EL1, EVT, TTLBxS
+#define FEAT_MTE2		ID_AA64PFR1_EL1, MTE, MTE2
+#define FEAT_RME		ID_AA64PFR0_EL1, RME, IMP
+#define FEAT_S2FWB		ID_AA64MMFR2_EL1, FWB, IMP
+#define FEAT_TME		ID_AA64ISAR0_EL1, TME, IMP
+#define FEAT_TWED		ID_AA64MMFR1_EL1, TWED, IMP
+#define FEAT_E2H0		ID_AA64MMFR4_EL1, E2H0, IMP
+
+static bool not_feat_aa64el3(struct kvm *kvm)
+{
+	return !kvm_has_feat(kvm, FEAT_AA64EL3);
+}
+
+static bool feat_nv2(struct kvm *kvm)
+{
+	return ((kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY) &&
+		 kvm_has_feat_enum(kvm, ID_AA64MMFR2_EL1, NV, NI)) ||
+		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
+}
+
+static bool feat_nv2_e2h0_ni(struct kvm *kvm)
+{
+	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
+}
 
 static bool feat_rasv1p1(struct kvm *kvm)
 {
@@ -151,6 +180,31 @@ static bool feat_sme_smps(struct kvm *kvm)
 		(read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
 }
 
+static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
+{
+	/* This is purely academic: AArch32 and NV are mutually exclusive */
+	if (bits) {
+		if (kvm_has_feat(kvm, FEAT_AA32EL1))
+			*bits &= ~HCR_EL2_RW;
+		else
+			*bits |= HCR_EL2_RW;
+	}
+
+	return true;
+}
+
+static bool compute_hcr_e2h(struct kvm *kvm, u64 *bits)
+{
+	if (bits) {
+		if (kvm_has_feat(kvm, FEAT_E2H0))
+			*bits &= ~HCR_EL2_E2H;
+		else
+			*bits |= HCR_EL2_E2H;
+	}
+
+	return true;
+}
+
 static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
 	NEEDS_FEAT(HFGRTR_EL2_nAMAIR2_EL1	|
 		   HFGRTR_EL2_nMAIR2_EL1,
@@ -564,6 +618,77 @@ static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 	NEEDS_FEAT(HCRX_EL2_EnAS0, FEAT_LS64_ACCDATA),
 };
 
+static const struct reg_bits_to_feat_map hcr_feat_map[] = {
+	NEEDS_FEAT(HCR_EL2_TID0, FEAT_AA32EL0),
+	NEEDS_FEAT_FIXED(HCR_EL2_RW, compute_hcr_rw),
+	NEEDS_FEAT(HCR_EL2_HCD, not_feat_aa64el3),
+	NEEDS_FEAT(HCR_EL2_AMO		|
+		   HCR_EL2_BSU		|
+		   HCR_EL2_CD		|
+		   HCR_EL2_DC		|
+		   HCR_EL2_FB		|
+		   HCR_EL2_FMO		|
+		   HCR_EL2_ID		|
+		   HCR_EL2_IMO		|
+		   HCR_EL2_MIOCNCE	|
+		   HCR_EL2_PTW		|
+		   HCR_EL2_SWIO		|
+		   HCR_EL2_TACR		|
+		   HCR_EL2_TDZ		|
+		   HCR_EL2_TGE		|
+		   HCR_EL2_TID1		|
+		   HCR_EL2_TID2		|
+		   HCR_EL2_TID3		|
+		   HCR_EL2_TIDCP	|
+		   HCR_EL2_TPCP		|
+		   HCR_EL2_TPU		|
+		   HCR_EL2_TRVM		|
+		   HCR_EL2_TSC		|
+		   HCR_EL2_TSW		|
+		   HCR_EL2_TTLB		|
+		   HCR_EL2_TVM		|
+		   HCR_EL2_TWE		|
+		   HCR_EL2_TWI		|
+		   HCR_EL2_VF		|
+		   HCR_EL2_VI		|
+		   HCR_EL2_VM		|
+		   HCR_EL2_VSE,
+		   FEAT_AA64EL1),
+	NEEDS_FEAT(HCR_EL2_AMVOFFEN, FEAT_AMUv1p1),
+	NEEDS_FEAT(HCR_EL2_EnSCXT, feat_csv2_2_csv2_1p2),
+	NEEDS_FEAT(HCR_EL2_TICAB	|
+		   HCR_EL2_TID4		|
+		   HCR_EL2_TOCU,
+		   FEAT_EVT),
+	NEEDS_FEAT(HCR_EL2_TTLBIS	|
+		   HCR_EL2_TTLBOS,
+		   FEAT_EVT_TTLBxS),
+	NEEDS_FEAT(HCR_EL2_TLOR, FEAT_LOR),
+	NEEDS_FEAT(HCR_EL2_ATA		|
+		   HCR_EL2_DCT		|
+		   HCR_EL2_TID5,
+		   FEAT_MTE2),
+	NEEDS_FEAT(HCR_EL2_AT		| /* Ignore the original FEAT_NV */
+		   HCR_EL2_NV2		|
+		   HCR_EL2_NV,
+		   feat_nv2),
+	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
+	NEEDS_FEAT(HCR_EL2_API		|
+		   HCR_EL2_APK,
+		   feat_pauth),
+	NEEDS_FEAT(HCR_EL2_TEA		|
+		   HCR_EL2_TERR,
+		   FEAT_RAS),
+	NEEDS_FEAT(HCR_EL2_FIEN, feat_rasv1p1),
+	NEEDS_FEAT(HCR_EL2_GPF, FEAT_RME),
+	NEEDS_FEAT(HCR_EL2_FWB, FEAT_S2FWB),
+	NEEDS_FEAT(HCR_EL2_TME, FEAT_TME),
+	NEEDS_FEAT(HCR_EL2_TWEDEL	|
+		   HCR_EL2_TWEDEn,
+		   FEAT_TWED),
+	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
+};
+
 static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 				  int map_size, u64 res0, const char *str)
 {
@@ -593,6 +718,8 @@ void __init check_feature_map(void)
 		       hafgrtr_masks.res0, hafgrtr_masks.str);
 	check_feat_map(hcrx_feat_map, ARRAY_SIZE(hcrx_feat_map),
 		       __HCRX_EL2_RES0, "HCRX_EL2");
+	check_feat_map(hcr_feat_map, ARRAY_SIZE(hcr_feat_map),
+		       HCR_EL2_RES0, "HCR_EL2");
 }
 
 static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
@@ -651,6 +778,17 @@ static u64 compute_res0_bits(struct kvm *kvm,
 				    require, exclude | FIXED_VALUE);
 }
 
+static u64 compute_fixed_bits(struct kvm *kvm,
+			      const struct reg_bits_to_feat_map *map,
+			      int map_size,
+			      u64 *fixed_bits,
+			      unsigned long require,
+			      unsigned long exclude)
+{
+	return __compute_fixed_bits(kvm, map, map_size, fixed_bits,
+				    require | FIXED_VALUE, exclude);
+}
+
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 {
 	u64 val = 0;
@@ -691,6 +829,8 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *res1)
 {
+	u64 fixed = 0, mask;
+
 	switch (reg) {
 	case HFGRTR_EL2:
 		*res0 = compute_res0_bits(kvm, hfgrtr_feat_map,
@@ -734,6 +874,15 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res0 |= __HCRX_EL2_RES0;
 		*res1 = __HCRX_EL2_RES1;
 		break;
+	case HCR_EL2:
+		mask = compute_fixed_bits(kvm, hcr_feat_map,
+					  ARRAY_SIZE(hcr_feat_map), &fixed,
+					  0, 0);
+		*res0 = compute_res0_bits(kvm, hcr_feat_map,
+					  ARRAY_SIZE(hcr_feat_map), 0, 0);
+		*res0 |= HCR_EL2_RES0 | (mask & ~fixed);
+		*res1 = HCR_EL2_RES1 | (mask & fixed);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 		*res0 = *res1 = 0;
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 20c79f1eaebab..b633666be6df4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1018,43 +1018,7 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, VMPIDR_EL2, res0, res1);
 
 	/* HCR_EL2 */
-	res0 = BIT(48);
-	res1 = HCR_RW;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, TWED, IMP))
-		res0 |= GENMASK(63, 59);
-	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, MTE, MTE2))
-		res0 |= (HCR_TID5 | HCR_DCT | HCR_ATA);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, EVT, TTLBxS))
-		res0 |= (HCR_TTLBIS | HCR_TTLBOS);
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, CSV2, CSV2_2) &&
-	    !kvm_has_feat(kvm, ID_AA64PFR1_EL1, CSV2_frac, CSV2_1p2))
-		res0 |= HCR_ENSCXT;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, EVT, IMP))
-		res0 |= (HCR_TOCU | HCR_TICAB | HCR_TID4);
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, AMU, V1P1))
-		res0 |= HCR_AMVOFFEN;
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1))
-		res0 |= HCR_FIEN;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, FWB, IMP))
-		res0 |= HCR_FWB;
-	/* Implementation choice: NV2 is the only supported config */
-	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
-		res0 |= (HCR_NV2 | HCR_NV | HCR_AT);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI))
-		res0 |= HCR_NV1;
-	if (!(kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
-	      kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
-		res0 |= (HCR_API | HCR_APK);
-	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TME, IMP))
-		res0 |= BIT(39);
-	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP))
-		res0 |= (HCR_TEA | HCR_TERR);
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, LO, IMP))
-		res0 |= HCR_TLOR;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
-		res0 |= HCR_E2H;
-	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, IMP))
-		res1 |= HCR_E2H;
+	get_reg_fixed_bits(kvm, HCR_EL2, &res0, &res1);
 	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
 
 	/* HCRX_EL2 */
-- 
2.39.2


