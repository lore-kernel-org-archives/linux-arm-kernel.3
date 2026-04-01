Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5939CD35179
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEPnQhRp23iNLqd1p2fZPXC3jLh/OcjjWgl86IUqHhc=; b=uPFHsHsHPw4i2sj3sQ1aaIK3NR
	zuErWowAsODX+RaCv3e3frY4o7pskV8nahsHxcJYyzrTTDYdB2r63gDj6l6EmC/HFY+WVKNiaxK9Y
	j0ODWlnU3DO3PTXu9G2qyH0NYAMNBmWZ35pDix8wIdlAmGW9UgeqBs0w8ENhiTCOOGdAcKDX6trQm
	a8Y6xZ64Wu365HM4CxWwCD8FlpBSfOe+XSrYO6JMEkMXsugCGxDA4RiHKQrY1EHqoFWnvPgPpJSRi
	6f9E4MxeOcQDT4wMT3zLWswhvDcogI9K4VGEOJBXP1P2dzYOd4BrUoZrZp0Y2cRV6BRtl24y7/k4v
	/8cE9uvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swB-0000000EWLY-3jb4;
	Wed, 01 Apr 2026 10:36:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw5-0000000EWCX-3oIH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C4A840825;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE2AC2BC9E;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039792;
	bh=Tlhke2n7aD76htBjxfrB0HrLonqyMetbPN+e9m7UcW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ciddHgOgia7Z20hKHC2pyMgokHByfwqHdnVvb4qmt9BiA1NRLsy05uv+6hAfFIP2w
	 jEonT2LzGH8I+pvWpnS4jiLHKuixQJMkINOfrGO7XBJainlLmkHyjcJJH8ZEdjCY4v
	 yipskR8QmKGKdeI8owE8gNbzn77CwPPvatFpDoJfu4oJ3qgSPUZBWOtIuQKHnMKw/O
	 DF4A/yVYKvDFuddryXlwZGEShlbtHSgHZQZ6ftp0R/yfeZ14Vp9OuVLr1c4JTa0XVc
	 qG4h+Kg/M8rZWyX4fa7AiBt5MAhGnJWIIPbNkTw1ZKLzCKHp44nll73tJ07WFa0269
	 WkSQSDZZx1J6w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw3-00000007oRQ-0lx6;
	Wed, 01 Apr 2026 10:36:31 +0000
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
Subject: [PATCH v2 09/16] KVM: arm64: vgic-v5: Make the effective priority mask a strict limit
Date: Wed,  1 Apr 2026 11:36:04 +0100
Message-ID: <20260401103611.357092-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033633_977499_6CA59CBA 
X-CRM114-Status: GOOD (  12.81  )
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

The way the effective priority mask is compared to the priority of
an interrupt to decide whether to wake-up or not, is slightly odd,
and breaks at the limits.

This could result in spurious wake-ups that are undesirable.

Make the computed priority mask comparison a strict inequality, so
that interrupts that have the same priority as the mask are not
signalled.

Fixes: 933e5288fa971 ("KVM: arm64: gic-v5: Check for pending PPIs")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 0f269321ece4b..31040cfb61fc7 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -367,7 +367,7 @@ bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu)
 
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
 			has_pending = (irq->enabled && irq_is_pending(irq) &&
-				       irq->priority <= priority_mask);
+				       irq->priority < priority_mask);
 
 		vgic_put_irq(vcpu->kvm, irq);
 
-- 
2.47.3


