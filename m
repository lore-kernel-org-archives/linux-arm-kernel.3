Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192B2F55102
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6QHwd8aq3meynmkWxN3W/UzWsgyPrGAJWhNz0LNaV4=; b=m/DWgpwmifZ7qqCZ1fqblU+MHl
	zOWMH6ep8PUjS7TLxAA6jWDALXf9E0l+FEe6CQjAN0O5dICW1RPIXKxFgFH9zQUpC70+k+bnsy3qK
	o6O7nxYVK+cxlzwcJ+QlVQM0QyAPgt4qU/O20ZmkGjsWkwE0TnAhu9dR5lRGENYgaY5tK5rkNVYy5
	C56TjCpIi+wC6A9lHo06bT+SCO5GmOXGaaup4qsb5002DOw/09/+IVQLYztGS6W28OLu3E9fMdOBZ
	e7h1mg4GlROVao0tsdKuTHEdpJc8Afy3nZU+eCoNQxY+obkZ299H1qK2kPkVLdynlJrklDqF02ddm
	fErJvMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyx4J-00000005RlA-2pt6;
	Sat, 07 Mar 2026 19:12:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyx4I-00000005Rkl-06uJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 19:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4BFC402A3;
	Sat,  7 Mar 2026 19:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8CAC19422;
	Sat,  7 Mar 2026 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772910723;
	bh=U0bx546GUhSs5kWuV55s7Je4/66laLCM9ZkK+yH6rE0=;
	h=From:To:Cc:Subject:Date:From;
	b=by9VUMS2f9v6ZULnjaKMZ8hWzpm8SRaq6Q9cEZo7d8Y84f1loEucYgGvKanTjRuLp
	 PWLtVKXFrG8aHU+WCs0hYozG8VADMSYzeIJdKRSZhkCpNuxhZjlkFIN/Yb7t1JSDTU
	 STkQi2uYkKCQrf6CqCU2mNauIgAfnS8ktwCYZgGwUMxIRMZbqi8qBTGQpI3vtP3zpZ
	 0AgRWf2rSzjilUu00MSWsTPPOrcQiryILh9EJlq0YtpP2n9X5bRIx7AXJVOifGnUfI
	 Xx4MyYK2xpNoqCkeOVQKGvHGLvZ1Ocklr/XwpnrCGR07X11MFm8HjR2xAX2VQLxrRV
	 Q3ntrU1xIPBuw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vyx4D-0000000HDlE-19vJ;
	Sat, 07 Mar 2026 19:12:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Valentine Burley <valentine.burley@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
Date: Sat,  7 Mar 2026 19:11:51 +0000
Message-ID: <20260307191151.3781182-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, valentine.burley@collabora.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_111206_102004_05E80CB5 
X-CRM114-Status: GOOD (  20.78  )
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

Valentine reports that their guests fail to boot correctly, losing
interrupts, and indicates that the wrong interrupt gets deactivated.

What happens here is that if the maintenance interrupt is slow enough
to kick us out of the guest, extra interrupts can be activated from
the LRs. We then exit and proceed to handle EOIcount deactivations,
picking active interrupts from the AP list. But we start from the
top of the list, potentially deactivating interrupts that were in
the LRs, while EOIcount only denotes deactivation of interrupts that
are not present in an LR.

Solve this by tracking the last interrupt that made it in the LRs,
and start the EOIcount deactivation walk *after* that interrupt.
Since this only makes sense while the vcpu is loaded, stash this
in the per-CPU host state.

Huge thanks to Valentine for doing all the detective work and
providing an initial patch.

Fixes: 3cfd59f81e0f3 ("KVM: arm64: GICv3: Handle LR overflow when EOImode==0")
Fixes: 281c6c06e2a7b ("KVM: arm64: GICv2: Handle LR overflow when EOImode==0")
Reported-by: Valentine Burley <valentine.burley@collabora.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20260307115955.369455-1-valentine.burley@collabora.com
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/vgic/vgic-v2.c     |  4 ++--
 arch/arm64/kvm/vgic/vgic-v3.c     | 12 ++++++------
 arch/arm64/kvm/vgic/vgic.c        |  6 ++++++
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2ca264b3db5fa..70cb9cfd760a3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -784,6 +784,9 @@ struct kvm_host_data {
 	/* Number of debug breakpoints/watchpoints for this CPU (minus 1) */
 	unsigned int debug_brps;
 	unsigned int debug_wrps;
+
+	/* Last vgic_irq part of the AP list recorded in an LR */
+	struct vgic_irq *last_lr_irq;
 };
 
 struct kvm_host_psci_config {
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 585491fbda807..cafa3cb32bda6 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -115,7 +115,7 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
 	u32 eoicount = FIELD_GET(GICH_HCR_EOICOUNT, cpuif->vgic_hcr);
-	struct vgic_irq *irq;
+	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
@@ -123,7 +123,7 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
 	/* See the GICv3 equivalent for the EOIcount handling rationale */
-	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u32 lr;
 
 		if (!eoicount) {
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 386ddf69a9c51..6a355eca19348 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -148,7 +148,7 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
 	u32 eoicount = FIELD_GET(ICH_HCR_EL2_EOIcount, cpuif->vgic_hcr);
-	struct vgic_irq *irq;
+	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
@@ -158,12 +158,12 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	/*
 	 * EOIMode=0: use EOIcount to emulate deactivation. We are
 	 * guaranteed to deactivate in reverse order of the activation, so
-	 * just pick one active interrupt after the other in the ap_list,
-	 * and replay the deactivation as if the CPU was doing it. We also
-	 * rely on priority drop to have taken place, and the list to be
-	 * sorted by priority.
+	 * just pick one active interrupt after the other in the tail part
+	 * of the ap_list, past the LRs, and replay the deactivation as if
+	 * the CPU was doing it. We also rely on priority drop to have taken
+	 * place, and the list to be sorted by priority.
 	 */
-	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
+	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u64 lr;
 
 		/*
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 430aa98888fda..e22b79cfff965 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -814,6 +814,9 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 
 static inline void vgic_fold_lr_state(struct kvm_vcpu *vcpu)
 {
+	if (!*host_data_ptr(last_lr_irq))
+		return;
+
 	if (kvm_vgic_global_state.type == VGIC_V2)
 		vgic_v2_fold_lr_state(vcpu);
 	else
@@ -960,10 +963,13 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 	if (irqs_outside_lrs(&als))
 		vgic_sort_ap_list(vcpu);
 
+	*host_data_ptr(last_lr_irq) = NULL;
+
 	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
 		scoped_guard(raw_spinlock,  &irq->irq_lock) {
 			if (likely(vgic_target_oracle(irq) == vcpu)) {
 				vgic_populate_lr(vcpu, irq, count++);
+				*host_data_ptr(last_lr_irq) = irq;
 			}
 		}
 
-- 
2.47.3


