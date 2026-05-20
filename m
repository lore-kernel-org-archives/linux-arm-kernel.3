Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9172CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTLxlivkME/czNHyhw9EkvAVtPi+VjAelN5GZKQJJEQ=; b=DRF9hUsWPRCW4zuc0ndMdiynNs
	nPzosKtgnLFey2xS8Al5AkR2fjjWdHRj+ke5G5+DB0W9pvSJKPYVJuP1AMG1c2O0a2+Ri2WI86Gzo
	UWiSmyP02LA4z4eb9yrBbg6Qv5rKyj+0Vl4ADBgCYUpBaRzEYUceivpvc373Rk3AeHK8a/hG5nHYa
	+Uc0mZmgFqfI4SV3k8L7nXJJRDWEl2ckzRvm91dzYJoKaQ2IzrnKGSVMmBk8sWZSZ/p8IJb05+Afs
	kZO75wEkjBX9/9ZSqt5Xb+aMnsZj2cl0z8pkI6sldBvD14UKZTSJ+5aGoj14mvTULzGBHUjcSxoXQ
	g6POtWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6X-000000047hL-0G0g;
	Wed, 20 May 2026 09:20:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6L-000000047NW-2g94
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VTLxlivkME/czNHyhw9EkvAVtPi+VjAelN5GZKQJJEQ=; b=HU4ABVPVu8d7hgIeJc1+/bZuYs
	umnlDWbjc2EEa+ivkscC7VFltM2LPvgRI5j4xPoUrXZX2Y9pnfVfk2qW3vpypUtSaK5rm6n/Ldeff
	7pJ27B2yNS++qmV6iCgY7RTK7rNTfSDByxbHk5SgaGsYVBDWLWF/8c/SCAsbeD3kQppoPQmJ+bJes
	n6xC22IuBv/sxUSBTz5VSr9iCJxGWeAjRDqE48DL9/qvdk2zBG4C35mO+PJlCtS4u1q8LYzP1gF3c
	+IyspdV2hHo2gNVz81zrEYWonE9dljqVok8z5a+0yrv8WcfWNLLQWK4s+JF6GxlpLv3mHjFguf/if
	/LxpoPqA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6I-00000006xOd-1XrR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E6C44509;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3F71F000E9;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268815;
	bh=VTLxlivkME/czNHyhw9EkvAVtPi+VjAelN5GZKQJJEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jazC8r9ZUguaHrDqiZC3qIUTt/z79p629oMA+INQYk+AkhcWivGvOcSFz55+35Vyk
	 XvXHowM4z2+uGpyTxsrQBKshN616XU9bxS4mLNlE/zWk7yiofe+HX3euoeflRoZ2Yf
	 BRSR/VJ64i1puZS26MCfLW6pnbINB8F3YslRLAtulaH3+0bO/7SthdcdB+TmLntAdA
	 8KYVLatZNSYmD1j3ZwoEXfHItwP9VVRk9/18kRL+I86npZ98OIWf0fVmREljv8SEdw
	 qysgd74ImyTHu8HEA9DLnPCXYFBkEQP9BnwOfo37c/SUrCdKor211fJHZoMvItpCSe
	 cI/HvsaQmLsEg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd65-00000004IaV-45ow;
	Wed, 20 May 2026 09:20:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 18/18] KVM: arm64: Fix arch timer interrupts for GICv3-on-GICv5 guests
Date: Wed, 20 May 2026 10:19:49 +0100
Message-ID: <20260520091949.542365-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102026_775081_0D1A9BE3 
X-CRM114-Status: GOOD (  16.33  )
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


