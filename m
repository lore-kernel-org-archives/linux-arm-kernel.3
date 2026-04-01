Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AC0D35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp6relFoxzaNyCVCyxhiYfpD1OI++tp8JtWG/Q5TMyI=; b=vu+xMFpLRkXYMO4FsOhH6pmSrn
	bAGg5av0W6MRlhZPNlU7cr5Q1KqkQtPdZRbYPYynluwV8+Yj4mgCrGx1ZxP5DBwXIC5v13ag5rRdW
	O8rI/vLDNE+NNodgRcJqRCe477rsQHN+K6IVGSk8yPfFKXyFqbvan/pkXKIHtxMADIRgyyblR1EPR
	gITDpGMxMaXnm+Elkl60ePUoZG8ywM9h1UL/cI/T82xxOUEpj1N6CIjZlN4JSeijOvPbHhAJ8Lsac
	Np8vIFSW9QQSO+KoqLWGr5U2fc7H8nOmJuuiIwkc8wyaqWiK6w9INzUygV+IOXQewPESaFzo/gPBV
	+2GlDMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swA-0000000EWJ9-2CqE;
	Wed, 01 Apr 2026 10:36:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw6-0000000EWD8-1bQv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBD4860126;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C83AC2BCB5;
	Wed,  1 Apr 2026 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039793;
	bh=H6jm/RYaSFrmN5gb3D/jhBBnlIwUM3w23KPKgkQu2iA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ci5WlcT7A+fThmLbBA3Q3bdbAEnVfj0eh2s187ofpuwyjNfCNKx3TNPJDIlpUswhV
	 jq/yhtfSgIRhvNF93KD8BQ3a7KmVsrmhNjLuEifAFKGlOWCFywLmgh9odXZ83CukrT
	 lYGy88XXlvNMQDMOSB0wxQDFFuVkKKOUkZ71bdw+k8RzagS6sUnEP88w/i4F/K8gN5
	 gyJuAt1kLvi+2TBQiuWLZxwhnY8NR8fXYEPzsw4z2ByKIR+ZVx1RtN1zKPynFcaH87
	 aGltsiOBK0bGieeWxzvH54aktyG0sTaujZLrYZaYdLd87KMbuUjjhtZNVjhPKEmVUN
	 0zOUdGz9Zggxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw3-00000007oRQ-3bHI;
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
Subject: [PATCH v2 12/16] KVM: arm64: Remove evaluation of timer state in kvm_cpu_has_pending_timer()
Date: Wed,  1 Apr 2026 11:36:07 +0100
Message-ID: <20260401103611.357092-13-maz@kernel.org>
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

The vgic-v5 code added some evaluations of the timers in a helper funtion
(kvm_cpu_has_pending_timer()) that is called to determine whether
the vcpu can wake-up.

But looking at the timer there is wrong:

- we want to see timers that are signalling an interrupt to the
  vcpu, and not just that have a pending interrupt

- we already have kvm_arch_vcpu_runnable() that evaluates the
  state of interrupts

- kvm_cpu_has_pending_timer() really is about WFIT, as the timeout
  does not generate an interrupt, and is therefore distinct from
  the point above

As a consequence, revert these changes and teach vgic_v5_has_pending_ppi()
about checking for pending HW interrupts instead.

Fixes: 9491c63b6cd7b ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c   | 6 +-----
 arch/arm64/kvm/vgic/vgic-v5.c | 4 ++--
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 37279f8748695..6608c47d1f628 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -402,11 +402,7 @@ static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx)
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 {
-	struct arch_timer_context *vtimer = vcpu_vtimer(vcpu);
-	struct arch_timer_context *ptimer = vcpu_ptimer(vcpu);
-
-	return kvm_timer_should_fire(vtimer) || kvm_timer_should_fire(ptimer) ||
-	       (vcpu_has_wfit_active(vcpu) && wfit_delay_ns(vcpu) == 0);
+	return vcpu_has_wfit_active(vcpu) && wfit_delay_ns(vcpu) == 0;
 }
 
 /*
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 31040cfb61fc7..8680a8354db9d 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -366,8 +366,8 @@ bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu)
 		irq = vgic_get_vcpu_irq(vcpu, intid);
 
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
-			has_pending = (irq->enabled && irq_is_pending(irq) &&
-				       irq->priority < priority_mask);
+			if (irq->enabled && irq->priority < priority_mask)
+				has_pending = irq->hw ? vgic_get_phys_line_level(irq) : irq_is_pending(irq);
 
 		vgic_put_irq(vcpu->kvm, irq);
 
-- 
2.47.3


