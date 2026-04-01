Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF07BD35174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNjQpWmaun4KzwokZektXaceWKJQTIN6FON8kkOIRjc=; b=V40q1YLZu3dHyq21eRcliJI2Xv
	zhegaxK/5/KCAUYSotnSgQFQ7HJ99UfDY3eZLrdlsxNIBhw3EVeevzOLcdUWIlL8PnmtTjVZ8oj1c
	WIMeWxp6ivi4iOIZwNwzVg2GxUNJQc6QZA9NcyHOVS99VEM4jgK9VN/xFdV2Hg4LgmySWEofxnDPF
	melabnWy8RGYkwV4P6bzUJ0KwYSk0Ylv+dEW9BJq0dznXyx0HeDarR0e4p4PbfNwWPraXi4ih2tAO
	PSR/021vZMvmK5YU8T6GFgxp4JLrusKOBHitLn2wj+f7y27qBZqiz4F58sWoKveM9BQ52lqmzpoWL
	if7tp5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw8-0000000EWGe-3LT2;
	Wed, 01 Apr 2026 10:36:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw5-0000000EWBx-1aN0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5DA46015B;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819DFC2BC9E;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039792;
	bh=tCagDxGfX64OrjM6zObYSFRfzhSvNvykWS0XRcrR0rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DWR9bW+iPs3/2IeSxx+TfhxLe6EwPAHTZt3djdzrr9iOWLN6v/qZUB6wg8LSo7riQ
	 ffTjLzRSTeXXVOa9KgPwrnJWNZN1OAKmD97r+5fRjlxfN0Dwa9HgvkUZaHIAEPh2WE
	 01Rpcaz0THHECF7iMnjBxnDtveyrbbaWk8Qw9SFRKi+MkXRCCquG3oQgkUOWHw8RQZ
	 ZLLfCZeTn18S6bLTl0bUHDJmioh6gi3Jt6OhUZ1kglNdRrJP0thjhh0JjNUITYu67G
	 Smw5wo8WgQkBcOvGyxZq71v9Yy6UQ3dPCxGw2Q6Zsbq0LNY/BSXePKyjtirsA05VPA
	 euHc7HY4WOmeA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw2-00000007oRQ-31R8;
	Wed, 01 Apr 2026 10:36:30 +0000
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
Subject: [PATCH v2 07/16] KVM: arm64: vgic-v5: Transfer edge pending state to ICH_PPI_PENDRx_EL2
Date: Wed,  1 Apr 2026 11:36:02 +0100
Message-ID: <20260401103611.357092-8-maz@kernel.org>
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

While it is perfectly correct to leave the pending state of a level
interrupt as is when queuing it (it is, after all, only driven by
the line), edge pending state must be transfered, as nothing will
lower it.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: 4d591252bacb2 ("KVM: arm64: gic-v5: Implement PPI interrupt injection")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 119d7d01d0e77..422741c86c6a8 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -445,8 +445,11 @@ void vgic_v5_flush_ppi_state(struct kvm_vcpu *vcpu)
 
 		irq = vgic_get_vcpu_irq(vcpu, intid);
 
-		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
 			__assign_bit(i, pendr, irq_is_pending(irq));
+			if (irq->config == VGIC_CONFIG_EDGE)
+				irq->pending_latch = false;
+		}
 
 		vgic_put_irq(vcpu->kvm, irq);
 	}
-- 
2.47.3


