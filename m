Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F6F41998
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXcreO94mAHxUUV+r1v33IxGiQVSrYQ5hhb+6CVEgik=; b=cpCfJjlcL/EjMKYE1YhhFHoScW
	IpSeeHcpzJ+1Gv4855mkDZYKx0tXXtywwggx0v4OwUwOZvEacprUcmVn9hl24HiTUVocnVpanoKB2
	Tt1wK+BOVaPRTzQlQU3rtMu6jcq+Y1ZXyRoFzoL6SSn9oWSKFwigwsnDFtIi+2TTFVzgSJf2CGMEz
	Ql++2JOIgb86YDcHLFc1OIzWpNb6+qQmZzyhSMUdMVJFQCshjb6uuPI0XuH8ifd3rOUhf3Kk6f0+n
	MeY5CEn1sAahhziuGjQ7sgqWQCdy1gYiF4Bpb4rD/wFXIa17HRrwUcuePV6bCnDwRoP251KJFGEIf
	GG+h1T8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr4-0000000148a-0BAF;
	Wed, 15 Apr 2026 11:56:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr1-0000000145j-177X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4393060132;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA65FC2BCB3;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=zg/O1lbhHNxnBcNkT9hwR81QOn47rC0ck3ZBFsXd2YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbeHPz1g4mEyWA9GwSEgi1uKCEyuCl03GJfmac+kxOxtbAKxcSioOZdB7Ccu4t6ek
	 C0BmPvy19Ad/P1VtU+hVIERWdM1mEpz4hVF+CJOY+dbPiXZsJ5NIJ8zbhdefbUvqpX
	 mqCuCoEkiJoGpqkHFCQnJPilgST949w7icwsSTq+WAtn714/1FrmU2KwCCu7T+X/vG
	 QA0y/eHxOZvnVTok5yDDgiVUL8zfIvXMqDVTTNaLG/8C4b7NtVau0m+4wGr0DDpujq
	 Y61iXE9N1Eel6sBL+ujl/JpNpHSCMr4vV7/EmqZ8w4GbCSFMCZqC1mAUNvKGzCC0gR
	 QYby/Yzrtqktw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqy-0000000Bqsi-0at1;
	Wed, 15 Apr 2026 11:56:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 05/18] KVM: arm64: vgic: Constify struct irq_ops usage
Date: Wed, 15 Apr 2026 12:55:46 +0100
Message-ID: <20260415115559.2227718-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

vgic-v5 has introduced much more prevalent usage of the struct
irq_ops mechanism.

In the process, it becomes evident that suffers from two related
problems:

- it contains flags, rather than only callbacks
- it is mutable, because we need to update the above flags

Swap the flags for a helper retrieving the flags, and make all
irq_ops const, something that is slightly satisfying.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c   | 14 +++++++++-----
 arch/arm64/kvm/vgic/vgic-v5.c |  2 +-
 arch/arm64/kvm/vgic/vgic.c    |  2 +-
 include/kvm/arm_vgic.h        |  9 +++++----
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index cbea4d9ee9552..f003df76fdda7 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -52,11 +52,17 @@ static u64 kvm_arm_timer_read(struct kvm_vcpu *vcpu,
 			      enum kvm_arch_timer_regs treg);
 static bool kvm_arch_timer_get_input_level(int vintid);
 
-static struct irq_ops arch_timer_irq_ops = {
+static unsigned long kvm_arch_timer_get_irq_flags(void)
+{
+	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
+}
+
+static const struct irq_ops arch_timer_irq_ops = {
+	.get_flags	 = kvm_arch_timer_get_irq_flags,
 	.get_input_level = kvm_arch_timer_get_input_level,
 };
 
-static struct irq_ops arch_timer_irq_ops_vgic_v5 = {
+static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
 	.get_input_level = kvm_arch_timer_get_input_level,
 	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
 	.set_direct_injection = vgic_v5_set_ppi_dvi,
@@ -1392,8 +1398,6 @@ static int kvm_irq_init(struct arch_timer_kvm_info *info)
 			return -ENOMEM;
 		}
 
-		if (kvm_vgic_global_state.no_hw_deactivation)
-			arch_timer_irq_ops.flags |= VGIC_IRQ_SW_RESAMPLE;
 		WARN_ON(irq_domain_push_irq(domain, host_vtimer_irq,
 					    (void *)TIMER_VTIMER));
 	}
@@ -1591,8 +1595,8 @@ static bool kvm_arch_timer_get_input_level(int vintid)
 int kvm_timer_enable(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
+	const struct irq_ops *ops;
 	struct timer_map map;
-	struct irq_ops *ops;
 	int ret;
 
 	if (timer->enabled)
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 0101ec3f55283..757484d2493b2 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -285,7 +285,7 @@ void vgic_v5_set_ppi_dvi(struct kvm_vcpu *vcpu, struct vgic_irq *irq, bool dvi)
 	__assign_bit(ppi, cpu_if->vgic_ppi_dvir, dvi);
 }
 
-static struct irq_ops vgic_v5_ppi_irq_ops = {
+static const struct irq_ops vgic_v5_ppi_irq_ops = {
 	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
 	.set_direct_injection = vgic_v5_set_ppi_dvi,
 };
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..3ac6d49bc4876 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -573,7 +573,7 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
 }
 
 void kvm_vgic_set_irq_ops(struct kvm_vcpu *vcpu, u32 vintid,
-			  struct irq_ops *ops)
+			  const struct irq_ops *ops)
 {
 	struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, vintid);
 
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index ea793479ab254..fe49fb56dc3c9 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -205,7 +205,7 @@ struct vgic_irq;
  */
 struct irq_ops {
 	/* Per interrupt flags for special-cased interrupts */
-	unsigned long flags;
+	unsigned long (*get_flags)(void);
 
 #define VGIC_IRQ_SW_RESAMPLE	BIT(0)	/* Clear the active state for resampling */
 
@@ -271,7 +271,7 @@ struct vgic_irq {
 	u8 priority;
 	u8 group;			/* 0 == group 0, 1 == group 1 */
 
-	struct irq_ops *ops;
+	const struct irq_ops *ops;
 
 	void *owner;			/* Opaque pointer to reserve an interrupt
 					   for in-kernel devices. */
@@ -279,7 +279,8 @@ struct vgic_irq {
 
 static inline bool vgic_irq_needs_resampling(struct vgic_irq *irq)
 {
-	return irq->ops && (irq->ops->flags & VGIC_IRQ_SW_RESAMPLE);
+	return irq->ops && irq->ops->get_flags &&
+	       (irq->ops->get_flags() & VGIC_IRQ_SW_RESAMPLE);
 }
 
 struct vgic_register_region;
@@ -557,7 +558,7 @@ void kvm_vgic_init_cpu_hardware(void);
 int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
 			unsigned int intid, bool level, void *owner);
 void kvm_vgic_set_irq_ops(struct kvm_vcpu *vcpu, u32 vintid,
-			  struct irq_ops *ops);
+			  const struct irq_ops *ops);
 void kvm_vgic_clear_irq_ops(struct kvm_vcpu *vcpu, u32 vintid);
 int kvm_vgic_map_phys_irq(struct kvm_vcpu *vcpu, unsigned int host_irq,
 			  u32 vintid);
-- 
2.47.3


