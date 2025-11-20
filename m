Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0516ECF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shDKGcWBAoxD4Is43ziB+MJVAlAlPpDyMP5mWf3fwPg=; b=rmv6i51q+nZeqH2/euwQrf7Pxb
	fv1pdRHBeZZx9JRaVYuZWT2wCNA5A18L32NRy3afDN1+ZZpH5HAkypIuawoCfq6stSrSMpSzJVQMn
	qoBqtMTCZj5Ytzs3EqoJkdE60xuGSzgHcat5ATmsqJbtRkGipw/zFWTfdTX5MZQfKRG1jwsTjmP1Q
	GoicXBGkdblB/iPdXgNiAS73UyDkU1FTdvffnIpdxVsyg03bCwxWAsUHEMeVqXtPbb7Epd4NvrOvI
	wFpR8367XV1wufCQ8j6hPyW9C5dROpYTrFA+yO+EvGLZfyTMXAkFzCnpWgSDDUwDBOo3A3SKUD6Ev
	0X2brSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QH-0000000766F-2DC6;
	Thu, 20 Nov 2025 17:26:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q0-000000075fO-0BXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 778006020A;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8CCC4CEF1;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659563;
	bh=LHqUcb+tJUupZZoYM9EwnQbskYpg2Xq5fcvWjP+wWko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IhmUhjar43fLf8ojeSZaGrPpmecmiLALNm0JFFMb3HmUR50AoIsg/a3BZHn04Pe8F
	 SSVS5Aro3xnqDfMoeKfLv9JfjHxWY1DzoN+mlTZ2zoc4VXj8loW3veANrKflrHuHPq
	 SCdDq3C40iBvTUAUJP0Z5zFd2KNCa8Lhy5rvk3XKWloenVS5YYFDKi5nP/BVM27D+k
	 A+ZBeOLoPoP1atb1PXhjIIxo2LuovLE4/ShYaTuzRq1FdxmY8HkBovp8ggYXJ5SVHF
	 GC2zwGD0b6g7D1Ilg8BSxTxTSGKrzhSVCE1hEKnS1I8PdFJtU8zBfDyzhx05wdTeYj
	 moWXpvsUEtzwQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Px-00000006y6g-1oj1;
	Thu, 20 Nov 2025 17:26:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 31/49] KVM: arm64: GICv3: Add SPI tracking to handle asymmetric deactivation
Date: Thu, 20 Nov 2025 17:25:21 +0000
Message-ID: <20251120172540.2267180-32-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

SPIs are specially annpying, as they can be activated on a CPU and
deactivated on another. WHich means that when an SPI is in flight
anywhere, all CPUs need to have their TDIR trap bit set.

This translates into broadcasting an IPI across all CPUs to make sure
they set their trap bit, The number of in-flight SPIs is kept in
an atomic variable so that CPUs can turn the trap bit off as soon
as possible.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c |  1 +
 arch/arm64/kvm/vgic/vgic-v3.c   | 21 +++++++++++++++------
 arch/arm64/kvm/vgic/vgic.c      | 25 +++++++++++++++++++++++--
 include/kvm/arm_vgic.h          |  3 +++
 4 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 6d5e5d708f23a..52de99c0f01ce 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -188,6 +188,7 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	struct kvm_vcpu *vcpu0 = kvm_get_vcpu(kvm, 0);
 	int i;
 
+	dist->active_spis = (atomic_t)ATOMIC_INIT(0);
 	dist->spis = kcalloc(nr_spis, sizeof(struct vgic_irq), GFP_KERNEL_ACCOUNT);
 	if (!dist->spis)
 		return  -ENOMEM;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 09f86bf6fe7b8..55847fbad4d0d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -47,10 +47,17 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 		ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
 
 	/*
+	 * Dealing with EOImode=1 is a massive source of headache. Not
+	 * only do we need to track that we have active interrupts
+	 * outside of the LRs and force DIR to be trapped, we also
+	 * need to deal with SPIs that can be deactivated on another
+	 * CPU.
+	 *
 	 * Note that we set the trap irrespective of EOIMode, as that
 	 * can change behind our back without any warning...
 	 */
-	if (irqs_active_outside_lrs(als))
+	if (irqs_active_outside_lrs(als)		     ||
+	    atomic_read(&vcpu->kvm->arch.vgic.active_spis))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
 
@@ -78,11 +85,6 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 	if (!irq)	/* An LPI could have been unmapped. */
 		return;
 
-	/* Notify fds when the guest EOI'ed a level-triggered IRQ */
-	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
-		kvm_notify_acked_irq(vcpu->kvm, 0,
-				     intid - VGIC_NR_PRIVATE_IRQS);
-
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
@@ -117,6 +119,13 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		irq->on_lr = false;
 	}
 
+	/* Notify fds when the guest EOI'ed a level-triggered SPI, and drop the refcount */
+	if (deactivated && lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid)) {
+		kvm_notify_acked_irq(vcpu->kvm, 0,
+				     intid - VGIC_NR_PRIVATE_IRQS);
+		atomic_dec_if_positive(&vcpu->kvm->arch.vgic.active_spis);
+	}
+
 	vgic_put_irq(vcpu->kvm, irq);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index cbba6c2988d1d..83969c18ef035 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -367,6 +367,17 @@ static bool vgic_validate_injection(struct vgic_irq *irq, bool level, void *owne
 	return false;
 }
 
+static bool vgic_model_needs_bcst_kick(struct kvm *kvm)
+{
+	/*
+	 * A GICv3 (or GICv3-like) system exposing a GICv3 to the
+	 * guest needs a broadcast kick to set TDIR globally, even if
+	 * the bit doesn't really exist (we still need to check for
+	 * the shadow bit in the DIR emulation fast-path).
+	 */
+	return (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
+}
+
 /*
  * Check whether an IRQ needs to (and can) be queued to a VCPU's ap list.
  * Do the queuing if necessary, taking the right locks in the right order.
@@ -379,6 +390,7 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 			   unsigned long flags) __releases(&irq->irq_lock)
 {
 	struct kvm_vcpu *vcpu;
+	bool bcast;
 
 	lockdep_assert_held(&irq->irq_lock);
 
@@ -453,11 +465,20 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 	list_add_tail(&irq->ap_list, &vcpu->arch.vgic_cpu.ap_list_head);
 	irq->vcpu = vcpu;
 
+	/* A new SPI may result in deactivation trapping on all vcpus */
+	bcast = (vgic_model_needs_bcst_kick(vcpu->kvm) &&
+		 vgic_valid_spi(vcpu->kvm, irq->intid) &&
+		 atomic_fetch_inc(&vcpu->kvm->arch.vgic.active_spis) == 0);
+
 	raw_spin_unlock(&irq->irq_lock);
 	raw_spin_unlock_irqrestore(&vcpu->arch.vgic_cpu.ap_list_lock, flags);
 
-	kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
-	kvm_vcpu_kick(vcpu);
+	if (!bcast) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+		kvm_vcpu_kick(vcpu);
+	} else {
+		kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_IRQ_PENDING);
+	}
 
 	return true;
 }
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index b798546755a34..6a4d3d2055966 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -263,6 +263,9 @@ struct vgic_dist {
 	/* The GIC maintenance IRQ for nested hypervisors. */
 	u32			mi_intid;
 
+	/* Track the number of in-flight active SPIs */
+	atomic_t		active_spis;
+
 	/* base addresses in guest physical address space: */
 	gpa_t			vgic_dist_base;		/* distributor */
 	union {
-- 
2.47.3


