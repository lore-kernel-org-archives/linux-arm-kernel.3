Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0BECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHsgjMFSTHL4ShQnQ7ohgLVFEwIpfdSpYjWp8aIaPfs=; b=0/n3pVbNjLPR5spe5GiY4ko5lG
	ynd6UtGlFyIhg7tl7CCSY9TpPt9iWQvJwCaI+7OVj3hSrejDbZZl/cMn369Wn9lQdn+B8u+Aeqtws
	R72GiAKi/uR3Jqa8kg95rpmoHDtBOkcQyT0w0P3FkPJuCeRUIayjxfYVE5Z7VZSe3i+OGFCJT/TQn
	peGwPRMXXV77rc3deAIoYqBiMfUesAecY7NCpnTYoAFZlHjsl5PXi3tZ7ui8dPZijynaPUj8jf68p
	7tBOCjYnVcDyM0dbL6CL9VXrPTNSGjGD6jHDSJDId7syJNyLQsARQky4qYryGLJLN00EIV6yXpc/S
	ofU7Ue6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqd-0000000AKx5-0FmS;
	Mon, 03 Nov 2025 16:56:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqA-0000000AK0S-2b1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 720E143C97;
	Mon,  3 Nov 2025 16:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5171EC19421;
	Mon,  3 Nov 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188934;
	bh=1mIPCQAmFQ4SUc8uHFMSk1nEW7q40NxnGo6tyZ3rNV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=avy75bU6UP0QNxNHYTGLYenhFa8tLWi/IIUzP4j1xl41AU7UcQom3OJBUz/srxChE
	 ljQ8i17V68/alb630p+u7YY4E0YSQTrsJgWPVF8jIQ6taILrz6pIeZp9jH9z9Z1MmF
	 cXF8MOYJcjSo6TTWypVSYlsHwW3xTX9ld8Loa9Aqrb6E9sW+3LRUitSkQmaYZhlFTQ
	 vmFpON1OVhBklS8uYq6Du23LFS43AguKlU4yu9ZCXNe08x4/Y5+i+jbGaasjb0QG7V
	 kS7Qc8tyuEGiQi4sPp93mOvCdZ+rjKJFM2fyQ1y7i/LVHd6UwKV3ZswUgaxzpHvDUv
	 MWOkJJuNcGeIw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq8-000000021VN-2Ngk;
	Mon, 03 Nov 2025 16:55:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 33/33] KVM: arm64: GICv3: Add SPI tracking to handle asymmetric deactivation
Date: Mon,  3 Nov 2025 16:55:17 +0000
Message-ID: <20251103165517.2960148-34-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085534_775695_67C908FC 
X-CRM114-Status: GOOD (  22.45  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c |  1 +
 arch/arm64/kvm/vgic/vgic-v3.c   | 21 +++++++++++++++------
 arch/arm64/kvm/vgic/vgic.c      | 14 ++++++++++++--
 arch/arm64/kvm/vgic/vgic.h      |  6 ++++++
 include/kvm/arm_vgic.h          |  3 +++
 5 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index f03cbf0ad154a..54f6c1df9d996 100644
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
index f638fd1f95020..2ec8b66e56e72 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -44,10 +44,17 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
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
+	if (irqs_active_outside_lrs(als) ||
+	    atomic_read(&vcpu->kvm->arch.vgic.active_spis))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
 
@@ -75,11 +82,6 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
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
@@ -114,6 +116,13 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
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
index 4f9f88ef737e3..5d380ed7e23cf 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -379,6 +379,7 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
 			   unsigned long flags) __releases(&irq->irq_lock)
 {
 	struct kvm_vcpu *vcpu;
+	bool bcast;
 
 	lockdep_assert_held(&irq->irq_lock);
 
@@ -453,11 +454,20 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic_irq *irq,
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
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index cf41864736204..c932bfd89d70c 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -164,6 +164,12 @@ static inline int vgic_write_guest_lock(struct kvm *kvm, gpa_t gpa,
 	return ret;
 }
 
+static inline bool vgic_model_needs_bcst_kick(struct kvm *kvm)
+{
+	return (cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDS) &&
+		kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
+}
+
 /*
  * This struct provides an intermediate representation of the fields contained
  * in the GICH_VMCR and ICH_VMCR registers, such that code exporting the GIC
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index caa72a92cb5d9..1eff4ff5f295d 100644
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


