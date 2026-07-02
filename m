Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D51FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qRzhMyRtUFwvrdRgEcMK88rCkmdI2qILS64BOePkLQ=; b=3+smjFdrOx50INWPMBBCTbPVf4
	PT3lZeujunmoc47O0xZRc5WYQfJXxEI1bOFp3Om94UMosr1t9QQN1ueIQ1TAOp2wFOV88FdV7+cj5
	La34XdGaD2KA1aOi/Y0i/NEMztbW+YTsRwrpKjKrgoiMIR98kDOlKLUUhhk/Mryl3vCg34YoW7PKy
	EsTU9pCOV7uXY/zhfW7egViRTGdB+n7JVeS9x+MdckzdzFakDV/T9kWPl4SrOmsAdziVlYPhYLkhh
	q9eoocZb4dith5xB2v/3DA//5luUAe2ktaqnTXNmx0FBj7UGmRF0mJ3bMVetVDCkE/RptRXtapl0e
	kK0x2TwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsZ-00000004uLs-3c7r;
	Thu, 02 Jul 2026 16:03:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uCy-0t7f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F31CD43E7F;
	Thu,  2 Jul 2026 16:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E7D1F00A3A;
	Thu,  2 Jul 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008181;
	bh=7qRzhMyRtUFwvrdRgEcMK88rCkmdI2qILS64BOePkLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mbYQR/YIol6wUFoMaGW3ZC6pVlXUZD0jVo8HHLFD0cvGLxBcGbrWsgm0LQqj1wLfZ
	 QvpZ7buwELXfha79xQPN+YRlEucIL8CSDgbbAMeYm2yKCgRpj9vVRwtIodgrIHaGkc
	 AyM3LSaor9A8k+XT98j9s51tLYoFtBpwyXNebornYmRHEpjXQ6b407w/ZatPOcJo5Q
	 zOTNV6lShdfoXKVbgoySYQtZTtQowmBPBQNbnto3uNVOaHU7mVASyfaoKItTsmTgb2
	 QTMwWyw0SGxDGnzd9ds2ssyIfZyX5H0QGh4Kub7q+XMnitpY3kStfdGT+Z3HSvBzLT
	 dJ6lETPQXRh0w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsS-00000000ojd-0aFx;
	Thu, 02 Jul 2026 16:03:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 10/28] KVM: arm64: Relax CNTHCTL_EL2 handling when FEAT_NV2p1 is present
Date: Thu,  2 Jul 2026 17:02:30 +0100
Message-ID: <20260702160248.1377250-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

With NV2p1, it is no longer necessary to use the split approach
where bits of CNTHCTL_EL2 cannot be accessed via CNTKCTL_EL1,
and we can treat the CNTKCTL_EL1 accessor as if it was "normal".

Key the special casing on FEAT_NV2P1 not being implemented.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c        | 10 ++++++++--
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 13 ++++++++++---
 arch/arm64/kvm/sys_regs.c          |  6 ++++--
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 4155fe89b58a1..db60facad9f3c 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -876,8 +876,14 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 	assign_clear_set_bit(tvt02, CNTHCTL_EL1NVVCT, clr, set);
 	assign_clear_set_bit(tpt02, CNTHCTL_EL1NVPCT, clr, set);
 
-	/* This only happens on VHE, so use the CNTHCTL_EL2 accessor. */
-	sysreg_clear_set(cnthctl_el2, clr, set);
+	/*
+	 * This only happens on VHE, so use the CNTHCTL_EL2 accessor, unless
+	 * we are sure CNTKCTL_EL1 is completely stateful with FEAT_NV2p1.
+	 */
+	if (!cpus_have_final_cap(ARM64_HAS_NV2P1))
+		sysreg_clear_set(cnthctl_el2, clr, set);
+	else
+		sysreg_clear_set(cntkctl_el1, clr, set);
 }
 
 void kvm_timer_vcpu_load(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 6f0f046e4ca4e..0c4ef1ce32ae7 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -69,11 +69,18 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
 		 * The EL1 view of CNTKCTL_EL1 has a bunch of RES0 bits where
 		 * the interesting CNTHCTL_EL2 bits live. So preserve these
 		 * bits when reading back the guest-visible value.
+		 *
+		 * While NV2p1 fixes some of that, it makes CNTHCTL_EL2.ECV
+		 * even more broken than it already was with NV2.
 		 */
 		val = read_sysreg_el1(SYS_CNTKCTL);
-		val &= CNTKCTL_VALID_BITS;
-		__vcpu_rmw_sys_reg(vcpu, CNTHCTL_EL2, &=, ~CNTKCTL_VALID_BITS);
-		__vcpu_rmw_sys_reg(vcpu, CNTHCTL_EL2, |=, val);
+		if (!cpus_have_final_cap(ARM64_HAS_NV2P1)) {
+			val &= CNTKCTL_VALID_BITS;
+			__vcpu_rmw_sys_reg(vcpu, CNTHCTL_EL2, &=, ~CNTKCTL_VALID_BITS);
+			__vcpu_rmw_sys_reg(vcpu, CNTHCTL_EL2, |=, val);
+		} else {
+			__vcpu_assign_sys_reg(vcpu, CNTHCTL_EL2, val);
+		}
 	}
 
 	__vcpu_assign_sys_reg(vcpu, SP_EL2,	 read_sysreg(sp_el1));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1dfc1f88bec82..9439c5b2b1fe8 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -322,8 +322,10 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 		switch (reg) {
 		case CNTHCTL_EL2:
 			val = read_sysreg_el1(SYS_CNTKCTL);
-			val &= CNTKCTL_VALID_BITS;
-			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
+			if (!cpus_have_final_cap(ARM64_HAS_NV2P1)) {
+				val &= CNTKCTL_VALID_BITS;
+				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
+			}
 			return val;
 		case CPTR_EL2:
 			if (cpus_have_final_cap(ARM64_HAS_NV2P1))
-- 
2.47.3


