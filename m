Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80A9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ivc4Ew6RtkewqbXfeERM9YlzozOUwZTMIA5HjaS/4RY=; b=QhjoKWzLxaSu+4ShVzylaHS5Pn
	pbO1WhbZ2shSc3a4Ib/Onb9Ct2Sik0D0YS6XbDfrUOCsSgx3W87rI4ZD0UjbPEfnXSxMsob2aRbGP
	Cr3k2xKk1BHvy1mCcsAlMRvEPfYnyWHkSf5dWAVSzJ9LETBxgQwehivbYY0ty7wUFR0k5gdAEIcKC
	9nSv2rcdMReKwPUwHiLIO1yBWQz50McoU4aK7C1ng00H99pnQBLYJbLYTpNbiRc3QtiVzIJAb3/uD
	VOMP3yg77pg4g/x9ZNeLhlt4+yps1Up0Ye/5QudhtvJ4hnEYk0F06uOgiKatMkuISUPDu2PfjlMQH
	bI+1ODeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkg-00000004GOb-3CEh;
	Wed, 20 May 2026 10:02:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdke-00000004GMw-3xo9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 204A86012B;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81481F00894;
	Wed, 20 May 2026 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271327;
	bh=Ivc4Ew6RtkewqbXfeERM9YlzozOUwZTMIA5HjaS/4RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WkF2IyP8PHyU9H4zvNiUMePbvKrRdcsoMoOWag0pUOo3z3aIaHMCjaogCDM5MRTTr
	 cTmr4ezZCxi4EXF40evFk3xHYOvn/O0qY95JbN+L8jdzXI1NugE4kwvqpdi5RhfZvU
	 7K0v4m9udccIC18AXMCgo6MSlmOKG/KRx+tBlIBB/Mj9j3lhp7FCKVHT6s+l7n7gz8
	 DSgRJjzx2xOcVOlm2W5k9FuJmA8PCIjCs9yYy8tyCM8QNUWfZJlp9TUix6exv6iD03
	 bJj0zjq4KWTg8k0vDxow6LDR6MNFN9WSoapi5S30pHl0qUKbn0tUgsE96d60teSKxV
	 qSYYowmrWnCGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPdkc-00000004Jio-08Bs;
	Wed, 20 May 2026 10:02:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 3/6] KVM: arm64: timer: Kill the per-timer irq level cache
Date: Wed, 20 May 2026 11:01:57 +0100
Message-ID: <20260520100200.543845-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

The timer code makes use of a per-timer irq level cache, which
looks like a very minor optimisation to avoid taking a lock upon
updating the GIC view of the interrupt when it is unchanged from
the previous state.

This is coming in the way of more important correctness issues,
so get rid of the cache, which simplifies a couple of minor things.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 20 +++++++++-----------
 include/kvm/arm_arch_timer.h |  5 -----
 2 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 7236dd6a99e67..c3b8257888e89 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -453,9 +453,8 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 {
 	kvm_timer_update_status(timer_ctx, new_level);
 
-	timer_ctx->irq.level = new_level;
 	trace_kvm_timer_update_irq(vcpu->vcpu_id, timer_irq(timer_ctx),
-				   timer_ctx->irq.level);
+				   new_level);
 
 	if (userspace_irqchip(vcpu->kvm))
 		return;
@@ -473,7 +472,7 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 
 	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
 			    timer_irq(timer_ctx),
-			    timer_ctx->irq.level,
+			    new_level,
 			    timer_ctx);
 }
 
@@ -484,10 +483,7 @@ static void timer_emulate(struct arch_timer_context *ctx)
 
 	trace_kvm_timer_emulate(ctx, pending);
 
-	if (pending != ctx->irq.level)
-		kvm_timer_update_irq(timer_context_to_vcpu(ctx), pending, ctx);
-
-	kvm_timer_update_status(ctx, pending);
+	kvm_timer_update_irq(timer_context_to_vcpu(ctx), pending, ctx);
 
 	/*
 	 * If the timer is pending, we don't need to have a soft timer
@@ -684,6 +680,7 @@ static inline void set_timer_irq_phys_active(struct arch_timer_context *ctx, boo
 static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
 {
 	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctx);
+	bool pending = kvm_timer_pending(ctx);
 	bool phys_active = false;
 
 	/*
@@ -692,12 +689,12 @@ static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
 	 * this point and the register restoration, we'll take the
 	 * interrupt anyway.
 	 */
-	kvm_timer_update_irq(vcpu, kvm_timer_pending(ctx), ctx);
+	kvm_timer_update_irq(vcpu, pending, ctx);
 
 	if (irqchip_in_kernel(vcpu->kvm))
 		phys_active = kvm_vgic_map_is_active(vcpu, timer_irq(ctx));
 
-	phys_active |= ctx->irq.level;
+	phys_active |= pending;
 	phys_active |= vgic_is_v5(vcpu->kvm);
 
 	set_timer_irq_phys_active(ctx, phys_active);
@@ -706,6 +703,7 @@ static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
 static void kvm_timer_vcpu_load_nogic(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_context *vtimer = vcpu_vtimer(vcpu);
+	bool pending = kvm_timer_pending(vtimer);
 
 	/*
 	 * Update the timer output so that it is likely to match the
@@ -713,7 +711,7 @@ static void kvm_timer_vcpu_load_nogic(struct kvm_vcpu *vcpu)
 	 * this point and the register restoration, we'll take the
 	 * interrupt anyway.
 	 */
-	kvm_timer_update_irq(vcpu, kvm_timer_pending(vtimer), vtimer);
+	kvm_timer_update_irq(vcpu, pending, vtimer);
 
 	/*
 	 * When using a userspace irqchip with the architected timers and a
@@ -725,7 +723,7 @@ static void kvm_timer_vcpu_load_nogic(struct kvm_vcpu *vcpu)
 	 * being de-asserted, we unmask the interrupt again so that we exit
 	 * from the guest when the timer fires.
 	 */
-	if (vtimer->irq.level)
+	if (pending)
 		disable_percpu_irq(host_vtimer_irq);
 	else
 		enable_percpu_irq(host_vtimer_irq, host_vtimer_irq_flags);
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 9e4076eebd29f..15a4f97f81051 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -66,11 +66,6 @@ struct arch_timer_context {
 	 */
 	bool				loaded;
 
-	/* Output level of the timer IRQ */
-	struct {
-		bool			level;
-	} irq;
-
 	/* Who am I? */
 	enum kvm_arch_timers		timer_id;
 
-- 
2.47.3


