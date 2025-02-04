Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF7AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdNUpKRa/P3rwD0jNO4fZ2P5b7NNNmPB0fnsmsXmHDI=; b=NetPgvD4eMf5w9dOIdn0CFv5Va
	r76XfBUVmj1gL+Dm6lC5BkaRxvrdQJ7SXlXLrsN5v40zzy5plQei2Ch9R3GXWlzXVCj0bHSUZmp47
	Kbf9EK3DuZpC8vMM97G36rYTeqdCulSmqUP8QgMhFC9/K+jRAHeWtB4O4r1PQVWJCNb2eoAKP3Npl
	8I1WVfoLTXrMdApHjq4jQfn80N9EfPVcNBguGaZe3RtQYr06F5+4z7x3Te3T+3NdyauAtk65d4KYD
	KB5EvRoo31ja7Myd9VJcDMBIA0vVVCaZvn6QFqjcksQRTpYL66rsYV2QxGTowaxjR4Bty0CHNuODq
	6P7qJEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGl2-00000000DjQ-1k2l;
	Tue, 04 Feb 2025 11:06:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGfp-00000000D9K-2wKn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE9395C5D37;
	Tue,  4 Feb 2025 11:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C27CC4CEE2;
	Tue,  4 Feb 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738666856;
	bh=PNu3hTn0GvE3wS0oJZaBn6WB6mPAiAa0NyTaE8ZHxk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uu8bKH36KjjeeU051Now/50sGoT4+NtDJWgKPF+9Twkm5dDDHE0FtcMsM/AEpt4TD
	 bzldocaQ3Fg0lb7CVzu78hIDztsJ711T5EtE1BVaccjRKXfB1HBEiUVjN59B87Q+cH
	 moSRH8lF3RmicHbwpMbPrNVW/2BJveFE684HVDJPNvJFWQFMHvD/4poGZASob5QEkw
	 +CyXsQxgvdtjmRacI/LQPaiPLaXX/ryA6yHsYqEpIaPsjk1Le8OMH33BAkItJ1XYOE
	 tGDDb98xpMKV+Xqy9VCAn+Rq2iaV9Fzoqn96awor0l9/rCel31gE1Qw6Cx3NWWDWXX
	 wNOZoVN+itdkA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfGfm-000OVe-Fb;
	Tue, 04 Feb 2025 11:00:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 2/3] KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_ECV
Date: Tue,  4 Feb 2025 11:00:49 +0000
Message-Id: <20250204110050.150560-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250204110050.150560-1-maz@kernel.org>
References: <20250204110050.150560-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_030057_823121_92D89E9F 
X-CRM114-Status: GOOD (  18.85  )
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

Both Wei-Lin Chang and Volodymyr Babchuk report that the way we
handle the emulation of EL1 timers with NV is completely wrong,
specially in the case of HCR_EL2.E2H==0.

There are three problems in about as many lines of code:

- With E2H==0, the EL1 timers are overwritten with the EL1 state,
  while they should actually contain the EL2 state (as per the timer
  map)

- With E2H==1, we run the full EL1 timer emulation even when ECV
  is present, hiding a bug in timer_emulate() (see previous patch)

- The comments are actively misleading, and say all the wrong things.

This is only attributable to the code having been initially written
for FEAT_NV, hacked up to handle FEAT_NV2 *in parallel*, and vaguely
hacked again to be FEAT_NV2 only. Oh, and yours truly being a gold
plated idiot.

The fix is obvious: just delete most of the E2H==0 code, have a unified
handling of the timers (because they really are E2H agnostic), and
make sure we don't execute any of that when FEAT_ECV is present.

Fixes: 4bad3068cfa9f ("KVM: arm64: nv: Sync nested timer state with FEAT_NV2")
Reported-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Reported-by: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/fqiqfjzwpgbzdtouu2pwqlu7llhnf5lmy4hzv5vo6ph4v3vyls@jdcfy3fjjc5k
Link: https://lore.kernel.org/r/87frl51tse.fsf@epam.com
---
 arch/arm64/kvm/arch_timer.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 035e43f5d4f9a..e59836e0260cf 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -974,31 +974,21 @@ void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
 	 * which allows trapping of the timer registers even with NV2.
 	 * Still, this is still worse than FEAT_NV on its own. Meh.
 	 */
-	if (!vcpu_el2_e2h_is_set(vcpu)) {
-		if (cpus_have_final_cap(ARM64_HAS_ECV))
-			return;
-
-		/*
-		 * A non-VHE guest hypervisor doesn't have any direct access
-		 * to its timers: the EL2 registers trap (and the HW is
-		 * fully emulated), while the EL0 registers access memory
-		 * despite the access being notionally direct. Boo.
-		 *
-		 * We update the hardware timer registers with the
-		 * latest value written by the guest to the VNCR page
-		 * and let the hardware take care of the rest.
-		 */
-		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CTL_EL0),  SYS_CNTV_CTL);
-		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CVAL_EL0), SYS_CNTV_CVAL);
-		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CTL_EL0),  SYS_CNTP_CTL);
-		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CVAL_EL0), SYS_CNTP_CVAL);
-	} else {
+	if (!cpus_have_final_cap(ARM64_HAS_ECV)) {
 		/*
 		 * For a VHE guest hypervisor, the EL2 state is directly
-		 * stored in the host EL1 timers, while the emulated EL0
+		 * stored in the host EL1 timers, while the emulated EL1
 		 * state is stored in the VNCR page. The latter could have
 		 * been updated behind our back, and we must reset the
 		 * emulation of the timers.
+		 *
+		 * A non-VHE guest hypervisor doesn't have any direct access
+		 * to its timers: the EL2 registers trap despite being
+		 * notionally direct (we use the EL1 HW, as for VHE), while
+		 * the EL1 registers access memory.
+		 *
+		 * In both cases, process the emulated timers on each guest
+		 * exit. Boo.
 		 */
 		struct timer_map map;
 		get_timer_map(vcpu, &map);
-- 
2.39.2


