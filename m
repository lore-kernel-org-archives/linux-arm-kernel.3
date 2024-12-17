Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTUFPPanC6ddStsNbNlj+uoyYckerTXcMFVF+XCRY68=; b=ldwRas9bGZzhbuRTfft374CqAe
	HNDVBJLt/a40F3nb3MCRwVmtxXt+eeFUs7P19rXSSWYY7nWs6lLVU0wyu2o/kLOdqPqjLSw0o47F4
	YTYUvWIFQYRvdcV3c6Lqvmsua+2SXugcPa5lHZaJXT7Ik9EYe8XphvvVA9Fk2M9fA+rQ8F/QWJimD
	Lg57rJz7fevesrpx2rsW7LX6uvEt+4GWLE/rcVh+XoxwM44zXqrPBRtosWxXv0s+B6uAZGIsvXEea
	Vb+NaTZ5UZQkCyVKd94KLkeHqmxBphWKu5Eu+fLiiio/T4BPhl4Hy+masssz14BSYMN8W5erJMje5
	llLnlxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYdS-0000000Dldz-3GoO;
	Tue, 17 Dec 2024 14:33:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYU2-0000000DjZN-0cuc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 14:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rTUFPPanC6ddStsNbNlj+uoyYckerTXcMFVF+XCRY68=; b=XixyR3FtjZzrUl/oyy112JEnlk
	sg6f6CaOCq/uAmMSVcQwHeLN0P0rd9fKHUBfilAOI3E351uyf+qJPV6oE1RNiXuYTWshuaUuSSW4K
	PVFqHoYiQ13aOuuR+dKri79E50sU//sGaORXLqq0uMUOggS7zMePkiz3QMh1RL/rgOJjo0mv/tQ3z
	/SP5zZZkc/S4TJ2QCql8roz3JmXZGwRjRTX09/nOtb3mKdHe28+TUM4CyGpsRDIxQ3ZxAudVemU6Z
	tVQsMWx19MXKAuUwLxmz4ptfcZ/WDGAAqLQ/9AP0rFEi8wez2Vx8B1TuqukMyO8GBwA5fW2lhgeQe
	F9mTtvEg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTy-000000055Wz-26B4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3E585C590C;
	Tue, 17 Dec 2024 14:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFDFC4CED4;
	Tue, 17 Dec 2024 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445408;
	bh=CoOnX/hzc+Zpn2UPDBxSfXiFz117lrAvmCt/lMNCmRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZPAXWkbSBFQuCMgBFqorJPdTahFFMX9Z+MRxw2NU+voyytiovQ+UiT62So1iiEBB
	 b6ttrBTDZHsVRlEjgNnU6wjP7N+Y3zzTh8uDiYFjGE/daDQHIHsv/Eo2+L9QfGlJfw
	 TatkXhRtfnx1tZ5ggkrFuReO1BomD4KYG2ECLM8BKR6MYH1ndNjrjTK/fPdco8O8Xm
	 GEbtaQKqYsQ2FO7k/m2fkSGSDBGDEXA0fJD8PJ0NicIM2FBssW/O12LSWYhDRbHPVd
	 jJTQn7L4Ca7NdgJqwQGxhJNM797hnR5aJKuCHbAXL8I+TS/HcvG/vBfZRM8iWn3FIO
	 tCbiszQM1oDpw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTu-004aJx-IF;
	Tue, 17 Dec 2024 14:23:26 +0000
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
Subject: [PATCH v2 10/12] KVM: arm64: nv: Sanitise CNTHCTL_EL2
Date: Tue, 17 Dec 2024 14:23:18 +0000
Message-Id: <20241217142321.763801-11-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241217_142330_840212_B8733F59 
X-CRM114-Status: GOOD (  12.87  )
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

Inject some sanity in CNTHCTL_EL2, ensuring that we don't handle
more than we advertise to the guest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h    |  2 +-
 arch/arm64/kvm/nested.c              | 15 +++++++++++++++
 include/clocksource/arm_arch_timer.h |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e18e9244d17a4..cf571d41faa89 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -490,7 +490,6 @@ enum vcpu_sysreg {
 	VBAR_EL2,	/* Vector Base Address Register (EL2) */
 	RVBAR_EL2,	/* Reset Vector Base Address Register */
 	CONTEXTIDR_EL2,	/* Context ID Register (EL2) */
-	CNTHCTL_EL2,	/* Counter-timer Hypervisor Control register */
 	SP_EL2,		/* EL2 Stack Pointer */
 	CNTHP_CTL_EL2,
 	CNTHP_CVAL_EL2,
@@ -501,6 +500,7 @@ enum vcpu_sysreg {
 	MARKER(__SANITISED_REG_START__),
 	TCR2_EL2,	/* Extended Translation Control Register (EL2) */
 	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
+	CNTHCTL_EL2,	/* Counter-timer Hypervisor Control register */
 
 	/* Any VNCR-capable reg goes after this point */
 	MARKER(__VNCR_START__),
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 9b36218b48def..9113c6025d6f3 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1271,6 +1271,21 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= MDCR_EL2_EnSTEPOP;
 	set_sysreg_masks(kvm, MDCR_EL2, res0, res1);
 
+	/* CNTHCTL_EL2 */
+	res0 = GENMASK(63, 20);
+	res1 = 0;
+	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RME, IMP))
+		res0 |= CNTHCTL_CNTPMASK | CNTHCTL_CNTVMASK;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, CNTPOFF)) {
+		res0 |= CNTHCTL_ECV;
+		if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, ECV, IMP))
+			res0 |= (CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT |
+				 CNTHCTL_EL1NVPCT | CNTHCTL_EL1NVVCT);
+	}
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
+		res0 |= GENMASK(11, 8);
+	set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
+
 	return 0;
 }
 
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index c62811fb41309..ce6521ad04d12 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -26,6 +26,8 @@
 #define CNTHCTL_EL1TVCT			(1 << 14)
 #define CNTHCTL_EL1NVPCT		(1 << 15)
 #define CNTHCTL_EL1NVVCT		(1 << 16)
+#define CNTHCTL_CNTVMASK		(1 << 18)
+#define CNTHCTL_CNTPMASK		(1 << 19)
 
 enum arch_timer_reg {
 	ARCH_TIMER_REG_CTRL,
-- 
2.39.2


