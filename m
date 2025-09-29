Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF7CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=046dUAAUDXC0dFgDi0u6hSt2DCeOCshjmlivOl8pYlk=; b=yRM6w2ogBWEgwrFDIDnEbIGS+Y
	ah0DEQ97jLR2MVRZUZmmku8TVjSb7c8WuPVsbbJTpA09sr5Pdu5BwWRHOx01IO2k07bqW4mmrtwhs
	NlrysXuSyAyoSwCRAHXqNxHV906ZJpH0qaKmTi3sjGAzt2ib+WheXKWydWZm0+olZ1e/OkJS9hAS5
	Bg9/S6cG1dFIYVnBP1/E5NVBNoWyeBI9DvEUhp4zDRzs9Y3LlkELHN2dFOSQXHMrWOcnMAE9voydH
	V/66zMe3UnPfnQmJEqJxoG+FlIjH6zuUkI+nh3hYmHoXSdxIHyJxf79XMLTpakPQIurjnHRxfdxFr
	NzPKgg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNC-00000002tzc-0gff;
	Mon, 29 Sep 2025 16:05:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN8-00000002tth-3psP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D55745A02;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1173DC4CEF7;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161906;
	bh=z47eQXmPqELAIC07k/JfWGUuYUKspnNPJi/PZ2oNhgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M2uEAYqG52BearS49ye/deTX/tADcOEGOQgJE7uQ05zEvd9gaXGQ8GQxD3gjPklCA
	 SGlE1SIH9LZmRWbYvRGetNcNRGfMCmEJr/qzuTOYvcWYB2j5H9GjmwpwFxcCm9MGYC
	 kgSU8jG4h07abz9Hby/MJhksPUNz4B1Ms6epwTAi0EhgJKT/E+Geb84iOjaXeOo2NU
	 0wEu4hCaByW30CMF37eMzN6tviLr4ZrJi/h14cZvCzMsTPZJ4dfz68OX0F0mdtCNb5
	 uU0YhGBV1+o9YwTnNMdkZD+ZniGCnyEmOp1vLSGU1biL51nhqHPl2WC3U52Jin7MYt
	 ZcobvWzQoQq6w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN5-0000000AHqo-2foL;
	Mon, 29 Sep 2025 16:05:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 02/13] KVM: arm64: Introduce timer_context_to_vcpu() helper
Date: Mon, 29 Sep 2025 17:04:46 +0100
Message-ID: <20250929160458.3351788-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090506_994424_AA2939BE 
X-CRM114-Status: GOOD (  15.57  )
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

We currently have a vcpu pointer nested into each timer context.

As we are about to remove this pointer, introduce a helper (aptly
named timer_context_to_vcpu()) that returns this pointer, at least
until we repaint the data structure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  | 25 +++++++++++++------------
 include/kvm/arm_arch_timer.h |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index dbd74e4885e24..e5a25e743f5be 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -66,7 +66,7 @@ static int nr_timers(struct kvm_vcpu *vcpu)
 
 u32 timer_get_ctl(struct arch_timer_context *ctxt)
 {
-	struct kvm_vcpu *vcpu = ctxt->vcpu;
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctxt);
 
 	switch(arch_timer_ctx_index(ctxt)) {
 	case TIMER_VTIMER:
@@ -85,7 +85,7 @@ u32 timer_get_ctl(struct arch_timer_context *ctxt)
 
 u64 timer_get_cval(struct arch_timer_context *ctxt)
 {
-	struct kvm_vcpu *vcpu = ctxt->vcpu;
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctxt);
 
 	switch(arch_timer_ctx_index(ctxt)) {
 	case TIMER_VTIMER:
@@ -104,7 +104,7 @@ u64 timer_get_cval(struct arch_timer_context *ctxt)
 
 static void timer_set_ctl(struct arch_timer_context *ctxt, u32 ctl)
 {
-	struct kvm_vcpu *vcpu = ctxt->vcpu;
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctxt);
 
 	switch(arch_timer_ctx_index(ctxt)) {
 	case TIMER_VTIMER:
@@ -126,7 +126,7 @@ static void timer_set_ctl(struct arch_timer_context *ctxt, u32 ctl)
 
 static void timer_set_cval(struct arch_timer_context *ctxt, u64 cval)
 {
-	struct kvm_vcpu *vcpu = ctxt->vcpu;
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctxt);
 
 	switch(arch_timer_ctx_index(ctxt)) {
 	case TIMER_VTIMER:
@@ -343,7 +343,7 @@ static enum hrtimer_restart kvm_hrtimer_expire(struct hrtimer *hrt)
 	u64 ns;
 
 	ctx = container_of(hrt, struct arch_timer_context, hrtimer);
-	vcpu = ctx->vcpu;
+	vcpu = timer_context_to_vcpu(ctx);
 
 	trace_kvm_timer_hrtimer_expire(ctx);
 
@@ -436,8 +436,9 @@ static void kvm_timer_update_status(struct arch_timer_context *ctx, bool level)
 	 *
 	 * But hey, it's fast, right?
 	 */
-	if (is_hyp_ctxt(ctx->vcpu) &&
-	    (ctx == vcpu_vtimer(ctx->vcpu) || ctx == vcpu_ptimer(ctx->vcpu))) {
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctx);
+	if (is_hyp_ctxt(vcpu) &&
+	    (ctx == vcpu_vtimer(vcpu) || ctx == vcpu_ptimer(vcpu))) {
 		unsigned long val = timer_get_ctl(ctx);
 		__assign_bit(__ffs(ARCH_TIMER_CTRL_IT_STAT), &val, level);
 		timer_set_ctl(ctx, val);
@@ -470,7 +471,7 @@ static void timer_emulate(struct arch_timer_context *ctx)
 	trace_kvm_timer_emulate(ctx, should_fire);
 
 	if (should_fire != ctx->irq.level)
-		kvm_timer_update_irq(ctx->vcpu, should_fire, ctx);
+		kvm_timer_update_irq(timer_context_to_vcpu(ctx), should_fire, ctx);
 
 	kvm_timer_update_status(ctx, should_fire);
 
@@ -498,7 +499,7 @@ static void set_cntpoff(u64 cntpoff)
 
 static void timer_save_state(struct arch_timer_context *ctx)
 {
-	struct arch_timer_cpu *timer = vcpu_timer(ctx->vcpu);
+	struct arch_timer_cpu *timer = vcpu_timer(timer_context_to_vcpu(ctx));
 	enum kvm_arch_timers index = arch_timer_ctx_index(ctx);
 	unsigned long flags;
 
@@ -609,7 +610,7 @@ static void kvm_timer_unblocking(struct kvm_vcpu *vcpu)
 
 static void timer_restore_state(struct arch_timer_context *ctx)
 {
-	struct arch_timer_cpu *timer = vcpu_timer(ctx->vcpu);
+	struct arch_timer_cpu *timer = vcpu_timer(timer_context_to_vcpu(ctx));
 	enum kvm_arch_timers index = arch_timer_ctx_index(ctx);
 	unsigned long flags;
 
@@ -668,7 +669,7 @@ static inline void set_timer_irq_phys_active(struct arch_timer_context *ctx, boo
 
 static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
 {
-	struct kvm_vcpu *vcpu = ctx->vcpu;
+	struct kvm_vcpu *vcpu = timer_context_to_vcpu(ctx);
 	bool phys_active = false;
 
 	/*
@@ -677,7 +678,7 @@ static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
 	 * this point and the register restoration, we'll take the
 	 * interrupt anyway.
 	 */
-	kvm_timer_update_irq(ctx->vcpu, kvm_timer_should_fire(ctx), ctx);
+	kvm_timer_update_irq(vcpu, kvm_timer_should_fire(ctx), ctx);
 
 	if (irqchip_in_kernel(vcpu->kvm))
 		phys_active = kvm_vgic_map_is_active(vcpu, timer_irq(ctx));
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df4..d188c716d03cb 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -128,7 +128,7 @@ void kvm_timer_init_vhe(void);
 #define vcpu_hptimer(v)	(&(v)->arch.timer_cpu.timers[TIMER_HPTIMER])
 
 #define arch_timer_ctx_index(ctx)	((ctx) - vcpu_timer((ctx)->vcpu)->timers)
-
+#define timer_context_to_vcpu(ctx)	((ctx)->vcpu)
 #define timer_vm_data(ctx)		(&(ctx)->vcpu->kvm->arch.timer_data)
 #define timer_irq(ctx)			(timer_vm_data(ctx)->ppi[arch_timer_ctx_index(ctx)])
 
-- 
2.47.3


