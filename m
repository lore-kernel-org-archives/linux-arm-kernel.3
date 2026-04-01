Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE04D35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLiQ2zflHH8KMWR/ZQUtQd4xqihNtrsAgvBdZOJePCc=; b=Rrr3sEEpySTnkCS+6CrAVHUGZL
	PGymVNck6trvJkgtPX5L69nBIoVot3wT3TfUFraA7UGcTyqGUeB8Nh/OmAm/WlX1eC1I2M5C8Z2Vt
	l0ZWZuf6tR4ZR4Dribhm/vzdeXMzz+ralxGy6yDZpHlURmAbVgV9ywVIfDUzpErBfieLUC8bXLx/u
	L2RVbCioKfRjrnmPCte1Mw0T2GxvDel1cE6EBvYVntA4eE7UplmxHC1936QD2JYmxW7P7pzia3gE1
	QAJO/ryvs3bls9H4NfaIaxofYgSm3019XUq0gpQ3sLoPG9QBrdhgNzEAACUDTKF8R0GO6efiSCZbs
	lPYE8YSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swA-0000000EWJk-3cK1;
	Wed, 01 Apr 2026 10:36:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWDT-2tut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15C3760138;
	Wed,  1 Apr 2026 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF6FC2BCB0;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039793;
	bh=unCumAo0FvxOksp9TXMe2/NnurGbkE3Ux578+2gQCNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTl0NHUMbS9tpyNXmYGW5eZb5IK07xBfA6L7Z46cUxSHGL09i7DPwF0nzUTqI4Xjj
	 CXVBMmmQG98uOvS9seRfpvNOGq+6/EX+PG+emIHf3ha0BCXYSBf/93K+xoksP67VJL
	 ybJycCwLViLp4WngQplDYOdIW3PJFBzgBvAAsmWyjjGckvaZm0BpgNIGUaSs1HsQOy
	 gYzrHwjfR6xUfYaWuFQAQKDJmw5nhVT9uRyUhNY2k77VKtVm5p8Mrck7MP9t63tzjD
	 4WDRcQElFfCM4V9e+S5xhg1b3uk3LZUMfJHmVhqaKABhRCpC4OnI+CUzjWEt87Lhs4
	 BOTiGVTaGS06A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw4-00000007oRQ-0M8j;
	Wed, 01 Apr 2026 10:36:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 13/16] KVM: arm64: Move GICv5 timer PPI validation into timer_irqs_are_valid()
Date: Wed,  1 Apr 2026 11:36:08 +0100
Message-ID: <20260401103611.357092-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
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

Userspace can set the timer PPI numbers way before a GIC has been
created, leading to odd behaviours on GICv5 as we'd accept non
architectural PPI numbers.

Move the v5 check into timer_irqs_are_valid(), which aligns the
behaviour with the pre-v5 GICs, and is also guaranteed to run
only once a GIC has been configured.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: 9491c63b6cd7b ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6608c47d1f628..cbea4d9ee9552 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1543,6 +1543,10 @@ static bool timer_irqs_are_valid(struct kvm_vcpu *vcpu)
 		if (kvm_vgic_set_owner(vcpu, irq, ctx))
 			break;
 
+		/* With GICv5, the default PPI is what you get -- nothing else */
+		if (vgic_is_v5(vcpu->kvm) && irq != get_vgic_ppi(vcpu->kvm, default_ppi[i]))
+			break;
+
 		/*
 		 * We know by construction that we only have PPIs, so all values
 		 * are less than 32 for non-GICv5 VGICs. On GICv5, they are
@@ -1678,13 +1682,6 @@ int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 		return -ENXIO;
 	}
 
-	/*
-	 * The PPIs for the Arch Timers are architecturally defined for
-	 * GICv5. Reject anything that changes them from the specified value.
-	 */
-	if (vgic_is_v5(vcpu->kvm) && vcpu->kvm->arch.timer_data.ppi[idx] != irq)
-		return -EINVAL;
-
 	/*
 	 * We cannot validate the IRQ unicity before we run, so take it at
 	 * face value. The verdict will be given on first vcpu run, for each
-- 
2.47.3


