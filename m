Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04374C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qRzhMyRtUFwvrdRgEcMK88rCkmdI2qILS64BOePkLQ=; b=igJ3IDOk+oYZPiXaAshjaEcPY7
	Z5mCZWP1SmjClf9l1p14hlNOsMc8G4oknNYdhAc4VBZgFoIOIy0bFOK6sSbDLk+xPvLNCz/0VQMhH
	KkSLIPK/ITNCv0D/H8bYjF7u76WpOhRPF+rPF5f23AOsxJjU1KL9MiRzPvhrhdvVGnPggGs3DEPDp
	CduFwci/W1WFkQvPJQWKIThaPGVdWJxuFUMSP2fNw4oJnnyiUfOm3GRZ0tqlJjvsdOE21THIc0LCC
	4xodxQ0rYzFpg3HpqTRn+YzAETQacoDG571JOdugSXFyN3byDyQ2VexhBxT1JaVUrwKSWG2RLlWRO
	8HK+0piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvY-00000009gf4-1HxX;
	Thu, 30 Jul 2026 07:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuq-00000009gLB-2RGl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5582043F78;
	Thu, 30 Jul 2026 07:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B63E1F00ADF;
	Thu, 30 Jul 2026 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395452;
	bh=7qRzhMyRtUFwvrdRgEcMK88rCkmdI2qILS64BOePkLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KIo9XHb9dP0vIqp3GOidxqq2M38/H5iFKmNH2SuXGajo/ymqQXxvPMvZueHeXuT7n
	 zDzvLFBy+Qs7FfVQtkhYF9WcbB8nikLmJnyPktg4G+eUWzWOdcheMEvACaIloEA2pC
	 +lb6a3B3Hq8kb7u0f91OgQSF3qleTswqx90FML7o2Kmz+XURF6LyU+CZA1JK6KKcBF
	 M20FwRtifl2C+gJPmjzs2DCE/RsmTO1y5kjduJRHS/esIda+grUod3le+RH7QORgSz
	 Sqsjebg2x6HwRkr4lq8WCIAWKM3d6ut0UHYvPXC5aUykicgO2UVGYDIsSIM9+7PQMU
	 /Q7VAEAzG6b0A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKuo-0000000AOpW-2EJV;
	Thu, 30 Jul 2026 07:10:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 10/29] KVM: arm64: Relax CNTHCTL_EL2 handling when FEAT_NV2p1 is present
Date: Thu, 30 Jul 2026 08:10:03 +0100
Message-ID: <20260730071022.296811-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
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


