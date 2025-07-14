Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BABC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6a0gTJDQodjMl0j0TomCVxnaTJ3hH3RYJ2cUl6fHZA=; b=28jnUXmUAWSNLjQAoXITS9zfAe
	MCno0NmTXGp6K154Uqr0eZ11YnNa/gJ65fVq9N4uFfHJ//7Z/AXIheSWlq2tL0vm/8XIqYI+wog/Z
	3c7MokQi6H9EiKE2Cm3cXRhMrzL6X79P5VwPnzMoSbfPAdsLzLGHEn/ZLI+jXV5qL4Vl50zGx+3dn
	u5kOoWsDuxPCmEAoYe8dtgm26mxByfrVcFO1Ijowhj9PMmAnwkGZ48MQgMCZghVVpts/kXr8QZNyo
	53ydEOlW307/kOQVIgw8CWbMb/x5VGPR+ARbxe2pW0o54hKhrVBjNd3isx2dOqNMkp+hWxGgm27Ti
	+5OxfP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIiL-00000002DAK-21Vj;
	Mon, 14 Jul 2025 12:55:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029kL-2yAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 716DF46853;
	Mon, 14 Jul 2025 12:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569D3C4CEFC;
	Mon, 14 Jul 2025 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496005;
	bh=TyCnvvi1aCzaI2Wx0/CEwTJPmVkxLKFgX0BffGlLxoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGa2snzqIJ4Ja04oGtPodZTrcIiPXzUY/vnYuQ4WJqbZuwzd3VIqcpmi2+tQ12qVU
	 C9u2bm0VLj9w3bJcAWPG3CPh5wdEyjn29Hl+Q9Opm/yAVtD6wL1majajeKgWhbTt3j
	 in3fiuWkpayRkcEhxiLsHJb7pcdAnAmsd/Q0yX+GU/rFavre/GC51ydJK+9MzgYFj6
	 TjQ2zODlbIX6VdN3h0X/qQIjyq5HeZRLFG1pYCvFWIjkrW7LufIKqmAPUsgTuMnSy2
	 88QIajkcM3wxhnOy+hFe+7+aURnnL1TigZ/vSKhOxqzHsrjqHqjUr/JNDMBRkAlObC
	 X4imkkca8klGA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGZ-00FW7V-Iy;
	Mon, 14 Jul 2025 13:26:43 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/11] KVM: arm64: selftests: get-reg-list: Add base EL2 registers
Date: Mon, 14 Jul 2025 13:26:33 +0100
Message-Id: <20250714122634.3334816-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052645_829364_2538D914 
X-CRM114-Status: GOOD (  12.03  )
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

Add the EL2 registers and the eventual dependencies, effectively
doubling the number of test vectors. Oh well.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../selftests/kvm/arm64/get-reg-list.c        | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index a35b01d08cc63..996d78ee35487 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -41,10 +41,27 @@ struct feature_id_reg {
 
 static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(TCR2_EL1,	ID_AA64MMFR3_EL1, TCRX, IMP),
+	REG_FEAT(TCR2_EL2,	ID_AA64MMFR3_EL1, TCRX, IMP),
 	REG_FEAT(PIRE0_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
+	REG_FEAT(PIRE0_EL2,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(PIR_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
+	REG_FEAT(PIR_EL2,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(POR_EL1,	ID_AA64MMFR3_EL1, S1POE, IMP),
 	REG_FEAT(POR_EL0,	ID_AA64MMFR3_EL1, S1POE, IMP),
+	REG_FEAT(POR_EL2,	ID_AA64MMFR3_EL1, S1POE, IMP),
+	REG_FEAT(HCRX_EL2,	ID_AA64MMFR1_EL1, HCX, IMP),
+	REG_FEAT(HFGRTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HFGWTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HFGITR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HDFGRTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HDFGWTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HAFGRTR_EL2,	ID_AA64MMFR0_EL1, FGT, IMP),
+	REG_FEAT(HFGRTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
+	REG_FEAT(HFGWTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
+	REG_FEAT(HFGITR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
+	REG_FEAT(HDFGRTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
+	REG_FEAT(HDFGWTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
+	REG_FEAT(ZCR_EL2,	ID_AA64PFR0_EL1, SVE, IMP),
 };
 
 bool filter_reg(__u64 reg)
@@ -678,6 +695,60 @@ static __u64 pauth_generic_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 3, 1),	/* APGAKEYHI_EL1 */
 };
 
+static __u64 el2_regs[] = {
+	SYS_REG(VPIDR_EL2),
+	SYS_REG(VMPIDR_EL2),
+	SYS_REG(SCTLR_EL2),
+	SYS_REG(ACTLR_EL2),
+	SYS_REG(HCR_EL2),
+	SYS_REG(MDCR_EL2),
+	SYS_REG(CPTR_EL2),
+	SYS_REG(HSTR_EL2),
+	SYS_REG(HFGRTR_EL2),
+	SYS_REG(HFGWTR_EL2),
+	SYS_REG(HFGITR_EL2),
+	SYS_REG(HACR_EL2),
+	SYS_REG(ZCR_EL2),
+	SYS_REG(HCRX_EL2),
+	SYS_REG(TTBR0_EL2),
+	SYS_REG(TTBR1_EL2),
+	SYS_REG(TCR_EL2),
+	SYS_REG(TCR2_EL2),
+	SYS_REG(VTTBR_EL2),
+	SYS_REG(VTCR_EL2),
+	SYS_REG(VNCR_EL2),
+	SYS_REG(HDFGRTR2_EL2),
+	SYS_REG(HDFGWTR2_EL2),
+	SYS_REG(HFGRTR2_EL2),
+	SYS_REG(HFGWTR2_EL2),
+	SYS_REG(HDFGRTR_EL2),
+	SYS_REG(HDFGWTR_EL2),
+	SYS_REG(HAFGRTR_EL2),
+	SYS_REG(HFGITR2_EL2),
+	SYS_REG(SPSR_EL2),
+	SYS_REG(ELR_EL2),
+	SYS_REG(AFSR0_EL2),
+	SYS_REG(AFSR1_EL2),
+	SYS_REG(ESR_EL2),
+	SYS_REG(FAR_EL2),
+	SYS_REG(HPFAR_EL2),
+	SYS_REG(MAIR_EL2),
+	SYS_REG(PIRE0_EL2),
+	SYS_REG(PIR_EL2),
+	SYS_REG(POR_EL2),
+	SYS_REG(AMAIR_EL2),
+	SYS_REG(VBAR_EL2),
+	SYS_REG(CONTEXTIDR_EL2),
+	SYS_REG(TPIDR_EL2),
+	SYS_REG(CNTVOFF_EL2),
+	SYS_REG(CNTHCTL_EL2),
+	SYS_REG(CNTHP_CTL_EL2),
+	SYS_REG(CNTHP_CVAL_EL2),
+	SYS_REG(CNTHV_CTL_EL2),
+	SYS_REG(CNTHV_CVAL_EL2),
+	SYS_REG(SP_EL2),
+};
+
 #define BASE_SUBLIST \
 	{ "base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), }
 #define VREGS_SUBLIST \
@@ -704,6 +775,14 @@ static __u64 pauth_generic_regs[] = {
 		.regs		= pauth_generic_regs,			\
 		.regs_n		= ARRAY_SIZE(pauth_generic_regs),	\
 	}
+#define EL2_SUBLIST						\
+	{							\
+		.name 		= "EL2",			\
+		.capability	= KVM_CAP_ARM_EL2,		\
+		.feature	= KVM_ARM_VCPU_HAS_EL2,		\
+		.regs		= el2_regs,			\
+		.regs_n		= ARRAY_SIZE(el2_regs),		\
+	}
 
 static struct vcpu_reg_list vregs_config = {
 	.sublists = {
@@ -753,6 +832,65 @@ static struct vcpu_reg_list pauth_pmu_config = {
 	},
 };
 
+static struct vcpu_reg_list el2_vregs_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	VREGS_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_vregs_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	VREGS_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_sve_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	SVE_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_sve_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	SVE_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_pauth_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	VREGS_SUBLIST,
+	PAUTH_SUBLIST,
+	{0},
+	},
+};
+
+static struct vcpu_reg_list el2_pauth_pmu_config = {
+	.sublists = {
+	BASE_SUBLIST,
+	EL2_SUBLIST,
+	VREGS_SUBLIST,
+	PAUTH_SUBLIST,
+	PMU_SUBLIST,
+	{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&vregs_config,
 	&vregs_pmu_config,
@@ -760,5 +898,12 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&sve_pmu_config,
 	&pauth_config,
 	&pauth_pmu_config,
+
+	&el2_vregs_config,
+	&el2_vregs_pmu_config,
+	&el2_sve_config,
+	&el2_sve_pmu_config,
+	&el2_pauth_config,
+	&el2_pauth_pmu_config,
 };
 int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
-- 
2.39.2


