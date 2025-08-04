Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733DCC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTqUm79WbAvmwkayaCj5N2v/VxAH0gHdH63x6SjAhJ4=; b=bMSVOfChbUzv6xX/ozD5l9eIA4
	graDQuWp9UjIMsHSxHz8ZXNSj5kxoj1nFl+8INHfKZcnV7OdzyiQg59NWvGpsDfF3nFJipRnSuaqg
	A298+LIAwm7M4ly+kRgyEwV0wV1A1ci+ZwjDSijkZka/+CWQOrdvZtBA2/g0MzSQMH69GmrQ7yFVL
	/C6wT9Y5XpkZUkUoU9VEHNAV01siax4Il4tH5cVC+Q/szTAn6FmmWQv0jg0cgMjBZmYn1AIOaGxoP
	oxzFCAyZeStvpas5ml0kYUoF1HcL9C9I3T50bWmwzP4pU21HhSbCDsnkygpiJqIP4d8r0LYvDNyfX
	HSBmikkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiueg-0000000AQyP-1L3K;
	Mon, 04 Aug 2025 12:51:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiu8n-0000000ALsp-3gBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:18:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733DD150C;
	Mon,  4 Aug 2025 05:18:01 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D20A43F738;
	Mon,  4 Aug 2025 05:18:05 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ry111@xry111.site,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 10/11] KVM: arm64: nv: support SCTLR2_ELx on nv
Date: Mon,  4 Aug 2025 13:17:23 +0100
Message-Id: <20250804121724.3681531-11-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804121724.3681531-1-yeoreum.yun@arm.com>
References: <20250804121724.3681531-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_051809_990176_454AF0A8 
X-CRM114-Status: GOOD (  13.20  )
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

Support SCTLR2_ELx sysreg on nv.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/kvm_host.h  |  3 +++
 arch/arm64/kvm/emulate-nested.c    |  2 ++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c |  6 ++++++
 arch/arm64/kvm/nested.c            | 13 +++++++++++++
 arch/arm64/kvm/sys_regs.c          |  9 +++++++++
 5 files changed, 33 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4ff0ebcc2f60..95d0027a734e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -525,6 +525,7 @@ enum vcpu_sysreg {
 	TCR2_EL2,	/* Extended Translation Control Register (EL2) */
 	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
 	CNTHCTL_EL2,	/* Counter-timer Hypervisor Control register */
+	SCTLR2_EL2,	/* Extend System Control Register (EL2) */

 	/* Any VNCR-capable reg goes after this point */
 	MARKER(__VNCR_START__),
@@ -1161,6 +1162,7 @@ static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 	switch (reg) {
 	case SCTLR_EL1:		*val = read_sysreg_s(SYS_SCTLR_EL12);	break;
 	case CPACR_EL1:		*val = read_sysreg_s(SYS_CPACR_EL12);	break;
+	case SCTLR2_EL1:	*val = read_sysreg_s(SYS_SCTLR2_EL12);	break;
 	case TTBR0_EL1:		*val = read_sysreg_s(SYS_TTBR0_EL12);	break;
 	case TTBR1_EL1:		*val = read_sysreg_s(SYS_TTBR1_EL12);	break;
 	case TCR_EL1:		*val = read_sysreg_s(SYS_TCR_EL12);	break;
@@ -1211,6 +1213,7 @@ static inline bool __vcpu_write_sys_reg_to_cpu(u64 val, int reg)
 	switch (reg) {
 	case SCTLR_EL1:		write_sysreg_s(val, SYS_SCTLR_EL12);	break;
 	case CPACR_EL1:		write_sysreg_s(val, SYS_CPACR_EL12);	break;
+	case SCTLR2_EL1:	write_sysreg_s(val, SYS_SCTLR2_EL12);	break;
 	case TTBR0_EL1:		write_sysreg_s(val, SYS_TTBR0_EL12);	break;
 	case TTBR1_EL1:		write_sysreg_s(val, SYS_TTBR1_EL12);	break;
 	case TCR_EL1:		write_sysreg_s(val, SYS_TCR_EL12);	break;
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3a384e9660b8..d7809682915c 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -782,6 +782,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(OP_TLBI_RVALE1OSNXS,	CGT_HCR_TTLB_TTLBOS),
 	SR_TRAP(OP_TLBI_RVAALE1OSNXS,	CGT_HCR_TTLB_TTLBOS),
 	SR_TRAP(SYS_SCTLR_EL1,		CGT_HCR_TVM_TRVM),
+	SR_TRAP(SYS_SCTLR2_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_TTBR0_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_TTBR1_EL1,		CGT_HCR_TVM_TRVM),
 	SR_TRAP(SYS_TCR_EL1,		CGT_HCR_TVM_TRVM),
@@ -1354,6 +1355,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_SCXTNUM_EL0,		HFGRTR, SCXTNUM_EL0, 1),
 	SR_FGT(SYS_SCXTNUM_EL1, 	HFGRTR, SCXTNUM_EL1, 1),
 	SR_FGT(SYS_SCTLR_EL1, 		HFGRTR, SCTLR_EL1, 1),
+	SR_FGT(SYS_SCTLR2_EL1, 		HFGRTR, SCTLR_EL1, 1), /* not typo! */
 	SR_FGT(SYS_REVIDR_EL1, 		HFGRTR, REVIDR_EL1, 1),
 	SR_FGT(SYS_PAR_EL1, 		HFGRTR, PAR_EL1, 1),
 	SR_FGT(SYS_MPIDR_EL1, 		HFGRTR, MPIDR_EL1, 1),
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 73e4bc7fde9e..689e3297d949 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -51,6 +51,9 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 		__vcpu_assign_sys_reg(vcpu, TTBR1_EL2,	 read_sysreg_el1(SYS_TTBR1));
 		__vcpu_assign_sys_reg(vcpu, TCR_EL2,	 read_sysreg_el1(SYS_TCR));

+		if (ctxt_has_sctlrx(&vcpu->arch.ctxt))
+			__vcpu_assign_sys_reg(vcpu, SCTLR2_EL2, read_sysreg_el1(SYS_SCTLR2));
+
 		if (ctxt_has_tcrx(&vcpu->arch.ctxt)) {
 			__vcpu_assign_sys_reg(vcpu, TCR2_EL2, read_sysreg_el1(SYS_TCR2));

@@ -120,6 +123,9 @@ static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
 		write_sysreg_el1(val, SYS_TCR);
 	}

+	if (ctxt_has_sctlrx(&vcpu->arch.ctxt))
+		write_sysreg_el1(__vcpu_sys_reg(vcpu, SCTLR2_EL2), SYS_SCTLR2);
+
 	if (ctxt_has_tcrx(&vcpu->arch.ctxt)) {
 		write_sysreg_el1(__vcpu_sys_reg(vcpu, TCR2_EL2), SYS_TCR2);

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dc1d26559bfa..a4d3b2d2fd80 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1704,6 +1704,19 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 			 TCR2_EL2_AMEC1 | TCR2_EL2_DisCH0 | TCR2_EL2_DisCH1);
 	set_sysreg_masks(kvm, TCR2_EL2, res0, res1);

+	/*
+	 * SCTLR2_EL2 - until explicit support for each feature, set all as RES0.
+	 */
+	res0 = SCTLR2_EL2_RES0 | SCTLR2_EL2_EMEC;
+	res0 |= SCTLR2_EL2_EASE;
+	res0 |= SCTLR2_EL2_NMEA;
+	res0 |= (SCTLR2_EL2_EnADERR | SCTLR2_EL2_EnANERR);
+	res0 |= SCTLR2_EL2_EnIDCP128;
+	res0 |= (SCTLR2_EL2_CPTA | SCTLR2_EL2_CPTA0 |
+		 SCTLR2_EL2_CPTM | SCTLR2_EL2_CPTM0);
+	res1 = SCTLR2_EL2_RES1;
+	set_sysreg_masks(kvm, SCTLR2_EL2, res0, res1);
+
 	/* SCTLR_EL1 */
 	res0 = SCTLR_EL1_RES0;
 	res1 = SCTLR_EL1_RES1;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c960470b6d2b..24881b7248b5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -122,6 +122,7 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		PURE_EL2_SYSREG(  CNTHCTL_EL2	);
 		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
 				  translate_sctlr_el2_to_sctlr_el1	     );
+		MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,    NULL	     );
 		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
 				  translate_cptr_el2_to_cpacr_el1	     );
 		MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
@@ -2597,6 +2598,12 @@ static unsigned int sctlr2_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }

+static unsigned int sctlr2_el2_visibility(const struct kvm_vcpu *vcpu,
+				    const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, sctlr2_visibility);
+}
+
 static unsigned int s1pie_visibility(const struct kvm_vcpu *vcpu,
 				     const struct sys_reg_desc *rd)
 {
@@ -3313,6 +3320,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG_VNCR(VMPIDR_EL2, reset_unknown, 0),
 	EL2_REG(SCTLR_EL2, access_rw, reset_val, SCTLR_EL2_RES1),
 	EL2_REG(ACTLR_EL2, access_rw, reset_val, 0),
+	EL2_REG_FILTERED(SCTLR2_EL2, access_rw, reset_val, 0,
+			 sctlr2_el2_visibility),
 	EL2_REG_VNCR(HCR_EL2, reset_hcr, 0),
 	EL2_REG(MDCR_EL2, access_mdcr, reset_mdcr, 0),
 	EL2_REG(CPTR_EL2, access_rw, reset_val, CPTR_NVHE_EL2_RES1),
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


