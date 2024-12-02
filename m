Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C8CE69E86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTUFPPanC6ddStsNbNlj+uoyYckerTXcMFVF+XCRY68=; b=FJ2yOgMPNln9I8oCA+HUUJH4x6
	zbMLaxMjpBM1MfctRL86ZaoAmd4jVn4BoSnvhF/+1gIb9AlKlMmrULhlrcu8AxVjndlW3GyWzuGkI
	jBpoeaQlOZmv+HHjj6V+zbaCIZoD0hKZndJknEZGLtBeeJ7SVmncguKlrWBx6QGaM/PyzVAxh7sZm
	v/D8n8ncc72WWBX2w20pIYxWfdp8xC8zepC8b5KfjvSsrcF85+PvKmMXob235QdCju44pWzPs3Cnq
	Uit/ygWag09ka7ImxsBHeVh1Ltk4eL91rk97yjODA+4cEojWLsqJ1XIp+ORbjOxZGGX8wFKw9Lzn3
	xGRAjrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBOd-00000007CGi-2EtM;
	Mon, 02 Dec 2024 18:43:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7t-00000006zzV-3n7w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32655C58FB;
	Mon,  2 Dec 2024 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34D9C4CED2;
	Mon,  2 Dec 2024 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160139;
	bh=CoOnX/hzc+Zpn2UPDBxSfXiFz117lrAvmCt/lMNCmRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGABxW+N605E2ciLQQiog5+QuvAtrGCzd2SfGtkE0Tc0BLaySEI4yfnYnBjA3wrpH
	 p7ajh6/4aIo4GvRAhtkXKrYOwA7MqIN7wxCFnJjbD5IM1A9lO7cm56qtSuiDoXPDt3
	 fggfSgnGmuSTYw7LqeJsh7M66DkPiKPFDTeyOymvzpuUj2/xoN6Nd6REo1fKNBX6k0
	 e7yKA4cTzEujfNaMIjWEEllBpLPX+kdNE4LUnVgMubvLgEBV/y4Je9SZkkCIgorK34
	 TeQ36chZzTtIQoqnYzSY8jcMhzcqRrUBrn4ADXY9FwzPkk32gf6b9FpfLh5s9lg1Lz
	 s6Clu7b3lI6SA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7l-00HQcf-Nj;
	Mon, 02 Dec 2024 17:22:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 10/11] KVM: arm64: nv: Sanitise CNTHCTL_EL2
Date: Mon,  2 Dec 2024 17:21:33 +0000
Message-Id: <20241202172134.384923-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_092226_026865_AE655D7D 
X-CRM114-Status: GOOD (  13.21  )
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


