Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7673CD35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsK6EJr+a6Y4cWaCeixgjD8N1PP3rlwUA5YezfIhGv8=; b=rJhAsxxnrSguUYvpdgTsjDpJrR
	Z2IIJP5ccn0v3PW1mL5AvbgTHK+7h5GASRJAbs8QCLQulgvwnnQdtRKeC4uyKEodrm6XmFmqMCmuI
	VBiaHj+1ie9s98SFljUCZfaUKcuh3p3ikZOdL/A9BEs/Qm/0hsuHerd+suPem7ukNR6VjZF3/8miT
	AckeCM06iB+h9Lgd0W4MzXTDI34xwKE1zxRsNGgisKa7pLmfACIKARoaKefyEASWyw1wFYOb8edQe
	WqGBVdn/5Rr9+Zz7WmBoF92vCx38hhXOzU8Y57QeMDOL+myReD8BKTrW3MDwednYBuzq+TMAcrKSB
	88EdHFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swB-0000000EWKH-0hgJ;
	Wed, 01 Apr 2026 10:36:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWBx-3Hgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 989AF60135;
	Wed,  1 Apr 2026 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A029C4CEF7;
	Wed,  1 Apr 2026 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039794;
	bh=GQhFrmkuyWUBaXsD29CDtR+HCaiJ41YoBp5ffynPz3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JoH93mRj7hRRZQ+3C5XX8xFim4jSlKld2WsdPtMW5ufufOeyZpxSBZFNw4Am2PbfL
	 2DlfXAGOgw3peRP9LRQGkec151DGEo8TrsUOK74gisdvB1/rwp+LEf81mbw2m8YLE5
	 Cp9aEJ+bqoJWKeEEE61qYQBNi/OKSEZYeamdbRpj4hQFfT0OJnaqlMA78fc3AFvP6Q
	 uSwePCjUemZwrhM/Axic7txDr7F5u0sVseXpsHAX36N+PmrLzLED0jmAcBMKEfaK/h
	 oI9XADuHGDwrfUWoME21vSTe8ExF3itLWT8TDk/YZJHCFKNedZL0dg1MS8yAnHKgLx
	 Jc/vpQc3T59RA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw4-00000007oRQ-2Cxs;
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
Subject: [PATCH v2 15/16] KVM: arm64: Don't advertises GICv3 in ID_PFR1_EL1 if AArch32 isn't supported
Date: Wed,  1 Apr 2026 11:36:10 +0100
Message-ID: <20260401103611.357092-16-maz@kernel.org>
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

Although the AArch32 ID regs are architecturally UNKNOWN when AArch32
isn't supported at any EL, KVM makes a point in making them RAZ.

Therefore, advertising GICv3 in ID_PFR1_EL1 must be gated on AArch32
being supported at least at EL0.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: a258a383b9177 ("KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index ecb0aea180327..5c684ecf79e66 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -700,7 +700,8 @@ void kvm_vgic_finalize_idregs(struct kvm *kvm)
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V3:
 		aa64pfr0 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
-		pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
+		if (kvm_supports_32bit_el0())
+			pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V5:
 		aa64pfr2 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR2_EL1, GCIE, IMP);
-- 
2.47.3


