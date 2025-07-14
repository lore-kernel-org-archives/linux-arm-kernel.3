Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526F4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljJjV3qLnFZnkasZyrd3QhzQcC4LH7ocw3JOnmpyUgQ=; b=D0arSOHKcf9hRRbA7ZvWcmfq9H
	yxMT516eJH7fKTBMW2Pf3myz64snYvgReH7DIvbEAdxTDmmFmuvywbYMZgnWSCkNjSU21N75s/q3h
	M9FtQQN1mqc1Ui154LrxImGdzCGJlymB0khyk/OJdycxnHvnxZkpJkVv8+QJGLAXVvP1cIvotIRTs
	rba7zidJdX/7fp0I/zWyb130vh8sfVp6WeaGjQZ0J/PhfP5NuW6SjZ7gKK9P4Mb543EveItN+1B4E
	Kd0bNqbElcAysMiqqJNUPzQYy0uPkFIrg0F6AKycaRifBAesC4i/waEN3912uYZxhyoyFTVjmD8qH
	gec/FmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIkk-00000002DLS-0rsB;
	Mon, 14 Jul 2025 12:57:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029jI-1wHS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF2A543AC8;
	Mon, 14 Jul 2025 12:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC0EC4CEF6;
	Mon, 14 Jul 2025 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496003;
	bh=yiBRnZF8C0L+8x0bFktDQLA16K927PmzOB5cfTo+bDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLUPtta3XYsfcmUjFlYXz/3u7AmtUGY/pQX9L0B50qG1hobRkf/kS4vn0kjK5YSp+
	 gtOVhhRbswJ1/jghJ5ATvFweu2MCtw7y1K6IqsPnvFx2tyQK3lVW33ylqoVjlJxXze
	 H5zHQUK9/H+nq04YQ/m3esgO6MkjNt/pWxvr6shOVSOAOKlwsTrfsKqP3yJA0YynDu
	 bzZk0KUyq0Uil0FHQBTekrhx15OcLTyqtZrUl2/HWm+lfuvGUZVtka1ZJPq2M2ymAY
	 6aVhTSX96TWYSjOKHrQL5Fkld4DgtdY818DzQQq7UzsEDSJ+GbQR0SZDuoMEStmy+v
	 AdP+xaVaugCaQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGY-00FW7V-0f;
	Mon, 14 Jul 2025 13:26:42 +0100
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
Subject: [PATCH 02/11] KVM: arm64: Don't advertise ICH_*_EL2 registers through GET_ONE_REG
Date: Mon, 14 Jul 2025 13:26:25 +0100
Message-Id: <20250714122634.3334816-3-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250714_052645_545858_299C2FF1 
X-CRM114-Status: GOOD (  12.36  )
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

It appears that exposing the GICv3 EL2 registers through the usual
sysreg interface is not consistent with the way we expose the EL1
registers. The latter are exposed via the GICv3 device interface
instead, and there is no reason why the EL2 registers should get
a different treatement.

Hide the registers from userspace until the GICv3 code grows the
required infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 64 ++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3f226cd5b502e..dceb4f8f242a7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -772,6 +772,12 @@ static u64 reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return mpidr;
 }
 
+static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
+				      const struct sys_reg_desc *r)
+{
+	return REG_HIDDEN;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -2324,6 +2330,10 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	EL2_REG_FILTERED(name, acc, rst, v, el2_visibility)
 
 #define EL2_REG_VNCR(name, rst, v)	EL2_REG(name, bad_vncr_trap, rst, v)
+#define EL2_REG_VNCR_FILT(name, vis)			\
+	EL2_REG_FILTERED(name, bad_vncr_trap, reset_val, 0, vis)
+#define EL2_REG_VNCR_GICv3(name)			\
+	EL2_REG_VNCR_FILT(name, hidden_visibility)
 #define EL2_REG_REDIR(name, rst, v)	EL2_REG(name, bad_redir_trap, rst, v)
 
 /*
@@ -3372,40 +3382,40 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_RVBAR_EL2), undef_access },
 	{ SYS_DESC(SYS_RMR_EL2), undef_access },
 
-	EL2_REG_VNCR(ICH_AP0R0_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP0R1_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP0R2_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP0R3_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP1R0_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP1R1_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP1R2_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_AP1R3_EL2, reset_val, 0),
+	EL2_REG_VNCR_GICv3(ICH_AP0R0_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP0R1_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP0R2_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP0R3_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP1R0_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP1R1_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP1R2_EL2),
+	EL2_REG_VNCR_GICv3(ICH_AP1R3_EL2),
 
 	{ SYS_DESC(SYS_ICC_SRE_EL2), access_gic_sre },
 
-	EL2_REG_VNCR(ICH_HCR_EL2, reset_val, 0),
+	EL2_REG_VNCR_GICv3(ICH_HCR_EL2),
 	{ SYS_DESC(SYS_ICH_VTR_EL2), access_gic_vtr },
 	{ SYS_DESC(SYS_ICH_MISR_EL2), access_gic_misr },
 	{ SYS_DESC(SYS_ICH_EISR_EL2), access_gic_eisr },
 	{ SYS_DESC(SYS_ICH_ELRSR_EL2), access_gic_elrsr },
-	EL2_REG_VNCR(ICH_VMCR_EL2, reset_val, 0),
-
-	EL2_REG_VNCR(ICH_LR0_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR1_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR2_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR3_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR4_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR5_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR6_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR7_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR8_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR9_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR10_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR11_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR12_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR13_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR14_EL2, reset_val, 0),
-	EL2_REG_VNCR(ICH_LR15_EL2, reset_val, 0),
+	EL2_REG_VNCR_GICv3(ICH_VMCR_EL2),
+
+	EL2_REG_VNCR_GICv3(ICH_LR0_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR1_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR2_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR3_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR4_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR5_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR6_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR7_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR8_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR9_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR10_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR11_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR12_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR13_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR14_EL2),
+	EL2_REG_VNCR_GICv3(ICH_LR15_EL2),
 
 	EL2_REG(CONTEXTIDR_EL2, access_rw, reset_val, 0),
 	EL2_REG(TPIDR_EL2, access_rw, reset_val, 0),
-- 
2.39.2


