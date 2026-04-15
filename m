Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD34F4198F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTLxlivkME/czNHyhw9EkvAVtPi+VjAelN5GZKQJJEQ=; b=SM/Ack01NZmZgXPePaLTMvyKqH
	zqUxS9lQfzcle2ImRbUd+7yc9oLx4LvdVQLl4/3DFm0fHfNd94H+VazyB/S6bNweCZ1Pd2k2z90/Q
	pU/I3nkK3bgNxmuGFXOTDtVOQtt4xH1m3RDipyS3bA1VpdwfA/XFcHCtgKzTEqZ2dyROyoq6Bzzxq
	8c1u2oJz1j6TmGeVwtJ4togfT4ctvnlW3z4UvSwp1s3pOc8DieLevkOuC7tgiydJzUT6t5pyLLYRl
	iwS2RRDE3owCCwBWdb1YoeqY8qD0+YEpFI+X3FIgh9BtJxXXNVVS8F3C8scimHfvQWyti3/0ggNvQ
	CYpRFjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyrI-000000014LD-31io;
	Wed, 15 Apr 2026 11:56:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr5-00000001478-2JLD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6EBB445A3;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E39C2BCB7;
	Wed, 15 Apr 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254184;
	bh=2XomehQKiUEMkDL/xL8zcJ058RSYu3stHmH3ujNqmjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DABC6DyMohWwM5zOFTaecGD6kbU44ytQDfOeXZzvkwXHE75aPxfuc2Duz1qLR+OI8
	 4Iw5tY1/rFEJYZkXgGBfs4GaHoBr8XWAXyKtACUCl9Tv++o7T6MG0deovDXK/3AopO
	 sDtO+eFgSkUy6RzWTRRBHvNXBBMzcXmlhqxkG/7dt+TZQ9oYcQ89GhglM/BoUrMUvF
	 zP+sZ798FFryb6OaUGkIV2hX18ULSkknWxKUaznEzzTmKu02odHf58g96/RvHfUYuD
	 87dtqqkQR7ePIv4TFI256/EBH+U52Z5hG+bmH2gW6aTudZ+7YNFOG5oOQ+7GiPfWDA
	 bcsB+AD6d/I2w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyr0-0000000Bqsi-3TB1;
	Wed, 15 Apr 2026 11:56:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 18/18] KVM: arm64: Fix arch timer interrupts for GICv3-on-GICv5 guests
Date: Wed, 15 Apr 2026 12:55:59 +0100
Message-ID: <20260415115559.2227718-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_045627_639166_3F43BC40 
X-CRM114-Status: GOOD (  17.12  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

When running on a GICv5 host, we push an arch-timer-specific interrupt
domain for the timer interrupts. This interrupt domain is used to mask
the host interrupt when a GICv5 guest is running. However, this
interrupt domain is still in place when running with a GICv3 guest on
GICv5 hardware. The result is that some interrupt state changes are
not correctly propragated to the host irqchip driver for legacy
guests.

Explicitly pass irqchip state changes though to the host irqchip
driver when running a GICv3-based guest on a GICv5 host. This bypasses
all masking, and thereby operates just as a native GICv3 guest would,
with the exception of having an additional irq domain in the
hierarchy.

Fixes: 9491c63b6cd7 ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index f003df76fdda7..53b67b4d0bf24 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1294,7 +1294,12 @@ static int timer_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu)
 static int timer_irq_set_irqchip_state(struct irq_data *d,
 				       enum irqchip_irq_state which, bool val)
 {
-	if (which != IRQCHIP_STATE_ACTIVE || !irqd_is_forwarded_to_vcpu(d))
+	bool passthrough = which != IRQCHIP_STATE_ACTIVE ||
+		!irqd_is_forwarded_to_vcpu(d) ||
+		(kvm_vgic_global_state.type == VGIC_V5 &&
+		 vgic_is_v3(kvm_get_running_vcpu()->kvm));
+
+	if (passthrough)
 		return irq_chip_set_parent_state(d, which, val);
 
 	if (val)
@@ -1307,15 +1312,7 @@ static int timer_irq_set_irqchip_state(struct irq_data *d,
 
 static void timer_irq_eoi(struct irq_data *d)
 {
-	/*
-	 * On a GICv5 host, we still need to call EOI on the parent for
-	 * PPIs. The host driver already handles irqs which are forwarded to
-	 * vcpus, and skips the GIC CDDI while still doing the GIC CDEOI. This
-	 * is required to emulate the EOIMode=1 on GICv5 hardware. Failure to
-	 * call EOI unsurprisingly results in *BAD* lock-ups.
-	 */
-	if (!irqd_is_forwarded_to_vcpu(d) ||
-	    kvm_vgic_global_state.type == VGIC_V5)
+	if (!irqd_is_forwarded_to_vcpu(d))
 		irq_chip_eoi_parent(d);
 }
 
-- 
2.47.3


