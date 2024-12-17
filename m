Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0033E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq8pDON9yx5CVLp53CmtmGVBi5oQwjgXkn+7DN4FuP0=; b=yrSvHr4uQlTldY5EaFGU6l8NAg
	moMGZeysWYuRn+vRIpLsRmQa+VnoUGOhrj/HeNde4MUvqROKGnOyipcoTcuD6BzZZH74RqUapqmbg
	rJXR3MRnCwz7ZzBvQzdXN8nPldQRA4YWaGPEy+SJ//HaiwWFbJRWbVvbR0j2uasDRTY9DCBFkKwsT
	v45gUs5rHwYqIBZfOHMTWdavgLkDsHBhkDRGSYPY6dJd/92yGNCoGT/OWOdYPSvWzDbe/4x0yOu1Y
	cM3c/YljSASaHzUa16zZS/D8c5Do2vw7UVH3bhAELcyrhus0ix8wRz0O32LNCDT3rWpvtY5EwILN/
	/mRuq88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYW4-0000000DkAh-19ga;
	Tue, 17 Dec 2024 14:25:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTv-0000000DjXE-326p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFFBC5C5855;
	Tue, 17 Dec 2024 14:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EE6C4CEDD;
	Tue, 17 Dec 2024 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445406;
	bh=42QPzG6jqI1WKcHLJXMq8RvCPT15C7DIifzJ6603+4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2fCC5iya4XJ2a70uJNxasOhde5GWWOD03zql70chEcfsEiagzOgpW5DvZrnIkLol
	 b8DC0D1dsa0Q48OWmcJ/4+EQ4wu99vRk34/lw76JqqJLiiG3XgnjoQJvvRXovczg/q
	 m5uwoRvVsy49YWn98RHdLNX/FTffi2QORDaYyfMus/zUgs58h/zWaG/nkHkHVvvsx7
	 h0QCSrBHm/LW5R0dLv+YPeaItnR87k1jyeyy4Pge6BuXAb1/oOm+TjfgQDq/rGrUk/
	 QA4YoCOR6Jscy0sFwi2WzkP4oBSfIWFDl5PwXNvpt1WeOPGlBwAcvUs6axupMBQqRF
	 gCURfL2GfwIcQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTs-004aJx-Ga;
	Tue, 17 Dec 2024 14:23:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 01/12] KVM: arm64: nv: Add handling of EL2-specific timer registers
Date: Tue, 17 Dec 2024 14:23:09 +0000
Message-Id: <20241217142321.763801-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_062327_851654_13668FEB 
X-CRM114-Status: GOOD (  12.40  )
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

Add the required handling for EL2 and EL02 registers, as
well as EL1 registers used in the E2H context. This includes
handling the virtual timer accesses when CNTHCTL_EL2.EL1TVT
or CNTHCTL_EL2.EL1TVCT are set.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h      |   4 +
 arch/arm64/kvm/sys_regs.c            | 143 +++++++++++++++++++++++++++
 include/clocksource/arm_arch_timer.h |   2 +
 3 files changed, 149 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b8303a83c0bff..2ed33737c7a99 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -477,6 +477,7 @@
 #define SYS_CNTFRQ_EL0			sys_reg(3, 3, 14, 0, 0)
 
 #define SYS_CNTPCT_EL0			sys_reg(3, 3, 14, 0, 1)
+#define SYS_CNTVCT_EL0			sys_reg(3, 3, 14, 0, 2)
 #define SYS_CNTPCTSS_EL0		sys_reg(3, 3, 14, 0, 5)
 #define SYS_CNTVCTSS_EL0		sys_reg(3, 3, 14, 0, 6)
 
@@ -484,14 +485,17 @@
 #define SYS_CNTP_CTL_EL0		sys_reg(3, 3, 14, 2, 1)
 #define SYS_CNTP_CVAL_EL0		sys_reg(3, 3, 14, 2, 2)
 
+#define SYS_CNTV_TVAL_EL0		sys_reg(3, 3, 14, 3, 0)
 #define SYS_CNTV_CTL_EL0		sys_reg(3, 3, 14, 3, 1)
 #define SYS_CNTV_CVAL_EL0		sys_reg(3, 3, 14, 3, 2)
 
 #define SYS_AARCH32_CNTP_TVAL		sys_reg(0, 0, 14, 2, 0)
 #define SYS_AARCH32_CNTP_CTL		sys_reg(0, 0, 14, 2, 1)
 #define SYS_AARCH32_CNTPCT		sys_reg(0, 0, 0, 14, 0)
+#define SYS_AARCH32_CNTVCT		sys_reg(0, 1, 0, 14, 0)
 #define SYS_AARCH32_CNTP_CVAL		sys_reg(0, 2, 0, 14, 0)
 #define SYS_AARCH32_CNTPCTSS		sys_reg(0, 8, 0, 14, 0)
+#define SYS_AARCH32_CNTVCTSS		sys_reg(0, 9, 0, 14, 0)
 
 #define __PMEV_op2(n)			((n) & 0x7)
 #define __CNTR_CRm(n)			(0x8 | (((n) >> 3) & 0x3))
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 83c6b4a07ef56..986e63d4f9faa 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1412,26 +1412,146 @@ static bool access_arch_timer(struct kvm_vcpu *vcpu,
 
 	switch (reg) {
 	case SYS_CNTP_TVAL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HPTIMER;
+		else
+			tmr = TIMER_PTIMER;
+		treg = TIMER_REG_TVAL;
+		break;
+
+	case SYS_CNTV_TVAL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HVTIMER;
+		else
+			tmr = TIMER_VTIMER;
+		treg = TIMER_REG_TVAL;
+		break;
+
 	case SYS_AARCH32_CNTP_TVAL:
+	case SYS_CNTP_TVAL_EL02:
 		tmr = TIMER_PTIMER;
 		treg = TIMER_REG_TVAL;
 		break;
+
+	case SYS_CNTV_TVAL_EL02:
+		tmr = TIMER_VTIMER;
+		treg = TIMER_REG_TVAL;
+		break;
+
+	case SYS_CNTHP_TVAL_EL2:
+		tmr = TIMER_HPTIMER;
+		treg = TIMER_REG_TVAL;
+		break;
+
+	case SYS_CNTHV_TVAL_EL2:
+		tmr = TIMER_HVTIMER;
+		treg = TIMER_REG_TVAL;
+		break;
+
 	case SYS_CNTP_CTL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HPTIMER;
+		else
+			tmr = TIMER_PTIMER;
+		treg = TIMER_REG_CTL;
+		break;
+
+	case SYS_CNTV_CTL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HVTIMER;
+		else
+			tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CTL;
+		break;
+
 	case SYS_AARCH32_CNTP_CTL:
+	case SYS_CNTP_CTL_EL02:
 		tmr = TIMER_PTIMER;
 		treg = TIMER_REG_CTL;
 		break;
+
+	case SYS_CNTV_CTL_EL02:
+		tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CTL;
+		break;
+
+	case SYS_CNTHP_CTL_EL2:
+		tmr = TIMER_HPTIMER;
+		treg = TIMER_REG_CTL;
+		break;
+
+	case SYS_CNTHV_CTL_EL2:
+		tmr = TIMER_HVTIMER;
+		treg = TIMER_REG_CTL;
+		break;
+
 	case SYS_CNTP_CVAL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HPTIMER;
+		else
+			tmr = TIMER_PTIMER;
+		treg = TIMER_REG_CVAL;
+		break;
+
+	case SYS_CNTV_CVAL_EL0:
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			tmr = TIMER_HVTIMER;
+		else
+			tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CVAL;
+		break;
+
 	case SYS_AARCH32_CNTP_CVAL:
+	case SYS_CNTP_CVAL_EL02:
 		tmr = TIMER_PTIMER;
 		treg = TIMER_REG_CVAL;
 		break;
+
+	case SYS_CNTV_CVAL_EL02:
+		tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CVAL;
+		break;
+
+	case SYS_CNTHP_CVAL_EL2:
+		tmr = TIMER_HPTIMER;
+		treg = TIMER_REG_CVAL;
+		break;
+
+	case SYS_CNTHV_CVAL_EL2:
+		tmr = TIMER_HVTIMER;
+		treg = TIMER_REG_CVAL;
+		break;
+
 	case SYS_CNTPCT_EL0:
 	case SYS_CNTPCTSS_EL0:
+		if (is_hyp_ctxt(vcpu))
+			tmr = TIMER_HPTIMER;
+		else
+			tmr = TIMER_PTIMER;
+		treg = TIMER_REG_CNT;
+		break;
+
 	case SYS_AARCH32_CNTPCT:
+	case SYS_AARCH32_CNTPCTSS:
 		tmr = TIMER_PTIMER;
 		treg = TIMER_REG_CNT;
 		break;
+
+	case SYS_CNTVCT_EL0:
+	case SYS_CNTVCTSS_EL0:
+		if (is_hyp_ctxt(vcpu))
+			tmr = TIMER_HVTIMER;
+		else
+			tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CNT;
+		break;
+
+	case SYS_AARCH32_CNTVCT:
+	case SYS_AARCH32_CNTVCTSS:
+		tmr = TIMER_VTIMER;
+		treg = TIMER_REG_CNT;
+		break;
+
 	default:
 		print_sys_reg_msg(p, "%s", "Unhandled trapped timer register");
 		return undef_access(vcpu, p, r);
@@ -2901,11 +3021,17 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	AMU_AMEVTYPER1_EL0(15),
 
 	{ SYS_DESC(SYS_CNTPCT_EL0), access_arch_timer },
+	{ SYS_DESC(SYS_CNTVCT_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTPCTSS_EL0), access_arch_timer },
+	{ SYS_DESC(SYS_CNTVCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_CTL_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
 
+	{ SYS_DESC(SYS_CNTV_TVAL_EL0), access_arch_timer },
+	{ SYS_DESC(SYS_CNTV_CTL_EL0), access_arch_timer },
+	{ SYS_DESC(SYS_CNTV_CVAL_EL0), access_arch_timer },
+
 	/* PMEVCNTRn_EL0 */
 	PMU_PMEVCNTR_EL0(0),
 	PMU_PMEVCNTR_EL0(1),
@@ -3057,9 +3183,24 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG_VNCR(CNTVOFF_EL2, reset_val, 0),
 	EL2_REG(CNTHCTL_EL2, access_rw, reset_val, 0),
+	{ SYS_DESC(SYS_CNTHP_TVAL_EL2), access_arch_timer },
+	EL2_REG(CNTHP_CTL_EL2, access_arch_timer, reset_val, 0),
+	EL2_REG(CNTHP_CVAL_EL2, access_arch_timer, reset_val, 0),
+
+	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_arch_timer },
+	EL2_REG(CNTHV_CTL_EL2, access_arch_timer, reset_val, 0),
+	EL2_REG(CNTHV_CVAL_EL2, access_arch_timer, reset_val, 0),
 
 	{ SYS_DESC(SYS_CNTKCTL_EL12), access_cntkctl_el12 },
 
+	{ SYS_DESC(SYS_CNTP_TVAL_EL02), access_arch_timer },
+	{ SYS_DESC(SYS_CNTP_CTL_EL02), access_arch_timer },
+	{ SYS_DESC(SYS_CNTP_CVAL_EL02), access_arch_timer },
+
+	{ SYS_DESC(SYS_CNTV_TVAL_EL02), access_arch_timer },
+	{ SYS_DESC(SYS_CNTV_CTL_EL02), access_arch_timer },
+	{ SYS_DESC(SYS_CNTV_CVAL_EL02), access_arch_timer },
+
 	EL2_REG(SP_EL2, NULL, reset_unknown, 0),
 };
 
@@ -3879,9 +4020,11 @@ static const struct sys_reg_desc cp15_64_regs[] = {
 	{ SYS_DESC(SYS_AARCH32_CNTPCT),	      access_arch_timer },
 	{ Op1( 1), CRn( 0), CRm( 2), Op2( 0), access_vm_reg, NULL, TTBR1_EL1 },
 	{ Op1( 1), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_ASGI1R */
+	{ SYS_DESC(SYS_AARCH32_CNTVCT),	      access_arch_timer },
 	{ Op1( 2), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_SGI0R */
 	{ SYS_DESC(SYS_AARCH32_CNTP_CVAL),    access_arch_timer },
 	{ SYS_DESC(SYS_AARCH32_CNTPCTSS),     access_arch_timer },
+	{ SYS_DESC(SYS_AARCH32_CNTVCTSS),     access_arch_timer },
 };
 
 static bool check_sysreg_table(const struct sys_reg_desc *table, unsigned int n,
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index cbbc9a6dc5715..877dcbb2601ae 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -22,6 +22,8 @@
 #define CNTHCTL_EVNTDIR			(1 << 3)
 #define CNTHCTL_EVNTI			(0xF << 4)
 #define CNTHCTL_ECV			(1 << 12)
+#define CNTHCTL_EL1TVT			(1 << 13)
+#define CNTHCTL_EL1TVCT			(1 << 14)
 
 enum arch_timer_reg {
 	ARCH_TIMER_REG_CTRL,
-- 
2.39.2


