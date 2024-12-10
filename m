Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04A4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV2T5J3BNvjRtldZRGk8Nz7cXOlyVacgSnUjPHbyVoE=; b=e2x5AsmQpeGYCPdG7ymPbX/dZB
	2dET5CgFytL5/Pj5KCwnxc+LF2na8yCHpRAdIFce4AP/MN3oe1lkYr7I52Zr7zakm8keLam4vw6r1
	RaoOxX7T7RnXCyJWj86TfMrwOAQ9HbMlTZ8tw1HYldgAUQliv+OUBkTwZB0cFJkjEdLArUQnb4Udc
	eyQvPMVcn4j2R/pd4aYui/TD7ClmifH5kjPAmZpdnFBZHB6t6vLRZ0rNjJzg11OrcgC4BAreI8xc1
	VRBxBnH5ONgcAvpfA/X3OBoqmf6Foh+xbEqAeZ1xV5V0Col/95bqSIeoBwA0XjEomUTxovHuJXpMg
	C05uhhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtxc-0000000ASvb-1rLB;
	Tue, 10 Dec 2024 06:43:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtF9-0000000AKlE-0oS2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E34DC339;
	Mon,  9 Dec 2024 21:57:38 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 44A433F58B;
	Mon,  9 Dec 2024 21:57:07 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH V2 46/46] KVM: arm64: nv: Add trap forwarding for FEAT_FGT2 described registers
Date: Tue, 10 Dec 2024 11:23:11 +0530
Message-Id: <20241210055311.780688-47-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215711_316719_FB6E27B3 
X-CRM114-Status: GOOD (  11.92  )
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

Describe remaining MDCR_EL2 register, and associate that with all FEAT_FGT2
exposed system registers it allows to trap.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Dropped check_cntr_accessible_N and CGT_CNTR_ACCESSIBLE_N constructs
- SYS_PMEVCNTSVR_EL1(N) access traps have been forwarded to CGT_MDCR_HPMN
- Updated check_mdcr_hpmn() to handle SYS_PMEVCNTSVR_EL1(N) registers
- Changed behaviour as BEHAVE_FORWARD_RW for CGT_MDCR_EnSPM

 arch/arm64/include/asm/kvm_host.h |   2 +
 arch/arm64/kvm/emulate-nested.c   | 158 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c80c07be3358..4cdce62642d1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -441,6 +441,7 @@ enum vcpu_sysreg {
 	PMINTENSET_EL1,	/* Interrupt Enable Set Register */
 	PMOVSSET_EL0,	/* Overflow Flag Status Set Register */
 	PMUSERENR_EL0,	/* User Enable Register */
+	SPMSELR_EL0,	/* System PMU Select Register */
 
 	/* Pointer Authentication Registers in a strict increasing order. */
 	APIAKEYLO_EL1,
@@ -501,6 +502,7 @@ enum vcpu_sysreg {
 	CNTHP_CVAL_EL2,
 	CNTHV_CTL_EL2,
 	CNTHV_CVAL_EL2,
+	SPMACCESSR_EL2, /* System PMU Access Register */
 
 	/* Anything from this can be RES0/RES1 sanitised */
 	MARKER(__SANITISED_REG_START__),
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 6c63cbfc11ea..c7d6d2034f27 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -79,6 +79,7 @@ enum cgt_group_id {
 	CGT_MDCR_TDRA,
 	CGT_MDCR_E2PB,
 	CGT_MDCR_TPMS,
+	CGT_MDCR_EnSPM,
 	CGT_MDCR_TTRF,
 	CGT_MDCR_E2TB,
 	CGT_MDCR_TDCC,
@@ -125,6 +126,7 @@ enum cgt_group_id {
 	CGT_CNTHCTL_EL1PCTEN = __COMPLEX_CONDITIONS__,
 	CGT_CNTHCTL_EL1PTEN,
 
+	CGT_SPMSEL_SPMACCESS,
 	CGT_CPTR_TTA,
 	CGT_MDCR_HPMN,
 
@@ -351,6 +353,12 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.mask		= MDCR_EL2_TPMS,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
+	[CGT_MDCR_EnSPM] = {
+		.index		= MDCR_EL2,
+		.value		= MDCR_EL2_EnSPM,
+		.mask		= MDCR_EL2_EnSPM,
+		.behaviour	= BEHAVE_FORWARD_RW,
+	},
 	[CGT_MDCR_TTRF] = {
 		.index		= MDCR_EL2,
 		.value		= MDCR_EL2_TTRF,
@@ -509,6 +517,7 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
 	switch (sysreg) {
 	case SYS_PMEVTYPERn_EL0(0) ... SYS_PMEVTYPERn_EL0(30):
 	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
+	case SYS_PMEVCNTSVR_EL1(0) ... SYS_PMEVCNTSVR_EL1(30):
 		idx = (sys_reg_CRm(sysreg) & 0x3) << 3 | sys_reg_Op2(sysreg);
 		break;
 	case SYS_PMXEVTYPER_EL0:
@@ -528,6 +537,22 @@ static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
 	return BEHAVE_HANDLE_LOCALLY;
 }
 
+static enum trap_behaviour check_spmsel_spmaccess(struct kvm_vcpu *vcpu)
+{
+	u64 spmaccessr_el2, spmselr_el2;
+	int syspmusel;
+
+	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_EnSPM) {
+		spmselr_el2 = __vcpu_sys_reg(vcpu, SPMSELR_EL0);
+		spmaccessr_el2 = __vcpu_sys_reg(vcpu, SPMACCESSR_EL2);
+		syspmusel = FIELD_GET(SPMSELR_EL0_SYSPMUSEL_MASK, spmselr_el2);
+
+		if (((spmaccessr_el2 >> (syspmusel * 2)) & 0x3) == 0x0)
+			return BEHAVE_FORWARD_RW;
+	}
+	return BEHAVE_HANDLE_LOCALLY;
+}
+
 #define CCC(id, fn)				\
 	[id - __COMPLEX_CONDITIONS__] = fn
 
@@ -536,6 +561,7 @@ static const complex_condition_check ccc[] = {
 	CCC(CGT_CNTHCTL_EL1PTEN, check_cnthctl_el1pten),
 	CCC(CGT_CPTR_TTA, check_cptr_tta),
 	CCC(CGT_MDCR_HPMN, check_mdcr_hpmn),
+	CCC(CGT_SPMSEL_SPMACCESS, check_spmsel_spmaccess),
 };
 
 /*
@@ -947,6 +973,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_ERXPFGF_EL1,	CGT_HCR_nFIEN),
 	SR_TRAP(SYS_ERXPFGCTL_EL1,	CGT_HCR_nFIEN),
 	SR_TRAP(SYS_ERXPFGCDN_EL1,	CGT_HCR_nFIEN),
+
 	SR_TRAP(SYS_PMCR_EL0,		CGT_MDCR_TPM_TPMCR),
 	SR_TRAP(SYS_PMCNTENSET_EL0,	CGT_MDCR_TPM),
 	SR_TRAP(SYS_PMCNTENCLR_EL0,	CGT_MDCR_TPM),
@@ -1120,6 +1147,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
@@ -1127,6 +1155,136 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_TRBPTR_EL1, 	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBSR_EL1, 		CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBTRG_EL1,		CGT_MDCR_E2TB),
+
+	SR_TRAP(SYS_MDSTEPOP_EL1,	CGT_MDCR_TDE_TDA),
+	SR_TRAP(SYS_TRBMPAM_EL1,	CGT_MDCR_E2TB),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
+
+	SR_TRAP(SYS_SPMDEVAFF_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMCGCR0_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMCGCR1_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMIIDR_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMDEVARCH_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMCFGR_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMSCR_EL1,		CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMACCESSR_EL1,	CGT_MDCR_EnSPM),
+	SR_TRAP(SYS_SPMCR_EL0,		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMOVSCLR_EL0,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMOVSSET_EL0,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMINTENCLR_EL1,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMINTENSET_EL1,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMCNTENCLR_EL0,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMCNTENSET_EL0,	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMSELR_EL0,	CGT_MDCR_EnSPM),
+
+	SR_TRAP(SYS_SPMEVTYPER_EL0(0),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(1),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(2),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(3),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(4),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(5),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(6),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(7),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(8),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(9),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(10),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(11),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(12),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(13),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(14),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVTYPER_EL0(15),	CGT_SPMSEL_SPMACCESS),
+
+	SR_TRAP(SYS_SPMEVFILTR_EL0(0),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(1),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(2),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(3),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(4),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(5),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(6),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(7),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(8),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(9),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(10), CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(11),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(12),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(13),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(14),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILTR_EL0(15),	CGT_SPMSEL_SPMACCESS),
+
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(0),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(1),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(2),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(3),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(4),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(5),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(6),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(7),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(8),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(9),		CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(10),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(11),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(12),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(13),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(14),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVFILT2R_EL0(15),	CGT_SPMSEL_SPMACCESS),
+
+	SR_TRAP(SYS_SPMEVCNTR_EL0(0),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(1),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(2),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(3),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(4),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(5),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(6),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(7),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(8),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(9),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(10),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(11),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(12),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(13),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(14),	CGT_SPMSEL_SPMACCESS),
+	SR_TRAP(SYS_SPMEVCNTR_EL0(15),	CGT_SPMSEL_SPMACCESS),
+
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(0),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(1),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(2),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(3),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(4),  CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(5),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(6),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(7),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(8),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(9),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(10),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(11),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(12),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(13),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(14),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(15),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(16),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(17),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(18),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(19),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(20),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(21),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(22),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(23),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(24),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(25),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(26),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(27),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(28),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(29),	CGT_MDCR_HPMN),
+	SR_TRAP(SYS_PMEVCNTSVR_EL1(30),	CGT_MDCR_HPMN),
+
+	SR_TRAP(SYS_MDSELR_EL1,		CGT_MDCR_TDE_TDA),
+	SR_TRAP(SYS_PMUACR_EL1,		CGT_MDCR_TPM),
+	SR_TRAP(SYS_PMICFILTR_EL0,	CGT_MDCR_TPM),
+	SR_TRAP(SYS_PMICNTR_EL0,	CGT_MDCR_TPM),
+	SR_TRAP(SYS_PMIAR_EL1,		CGT_MDCR_TPM),
+	SR_TRAP(SYS_PMECR_EL1,		CGT_MDCR_TPM),
+	SR_TRAP(SYS_PMZR_EL0,		CGT_MDCR_TPM),
+
 	SR_TRAP(SYS_CPACR_EL1,		CGT_CPTR_TCPAC),
 	SR_TRAP(SYS_AMUSERENR_EL0,	CGT_CPTR_TAM),
 	SR_TRAP(SYS_AMCFGR_EL0,		CGT_CPTR_TAM),
-- 
2.25.1


