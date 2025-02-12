Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7193FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOM3EuTbD6fKRReLvu4SPrwTzKAwb2vCA82u+MCQ9ZE=; b=K7QTfi3qIM554Rf9vZfRCQwlin
	Ibn9qyUHLjglyaNsKGQIN/q+JhX6wZCrIffVtn1gEBGeyQsHAyF5jvr/H176Nv9YryzzmxQV6fHZt
	uLMFSiXmb28NnmWFV4mCVFI32Uv8bZf7qOO/5u/De+dWuM4Nc/o5mZftR8bx04BgmKzWd1MxoE12Z
	3OA2YyNg9KAVsW/2PsvgU8to/y1kVLV+q/Kb/qa7w7jf9Z21AN0G9U0TgLCoVGgTLScVzu1SSzkvN
	tEfA2GpAHHA3/Wi11vOq1S2BHCEwe+UPm6SGbG5KJHO9CEZTbAc6Irsbl/GT70fRzLECGXH0fCTAt
	KFZOYC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHVB-00000008Tr0-35MH;
	Wed, 12 Feb 2025 18:30:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHQy-00000008TDs-3rTP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8BA85C6176;
	Wed, 12 Feb 2025 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A54C4CEE4;
	Wed, 12 Feb 2025 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384764;
	bh=yuI+PECZbLFotsavzZF231/Cmz0gJvhWqdNSzbk7BQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t8gMpc6+yMelKvFPQcDMCiiTNada/vjQOPGhftZ0hJImn0PuC8Eae0EaU/mumS0Sx
	 pH2Yxp7MJWz3vcYKCJrsaan7ygKbRcxgvTMNy4pENIYRl6nC2qIR0eGFg8gE5ziSvw
	 knqysUmFkqa7xl4vKsILig0+KVoiHlOr9W3GWIvuJI9urXJIySmuygcg4y7lgCxDEZ
	 CIQNHf2hfTOrs0LuYSkhH8OILdlFN8j4xwgiKAyAQc04+J7+Y2on0G2gcSuXhJv8+B
	 71MUmyhapiksUjXwQUefxu49cbxnKrGOT3WXG0nmmQ6274a87Sg1CAgVkwZSC6Re06
	 aYX6kWeeofMqw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tiHQw-003RQt-0Q;
	Wed, 12 Feb 2025 18:26:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 2/2] KVM: arm64: vgic: Hoist SGI/PPI alloc from vgic_init() to kvm_create_vgic()
Date: Wed, 12 Feb 2025 18:25:58 +0000
Message-Id: <20250212182558.2865232-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250212182558.2865232-1-maz@kernel.org>
References: <20250212182558.2865232-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_102605_075647_26FDD2E9 
X-CRM114-Status: GOOD (  20.79  )
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

If userspace creates vcpus, then a vgic, we end-up in a situation
where irqchip_in_kernel() will return true, but no private interrupt
has been allocated for these vcpus. This situation will continue
until userspace initialises the vgic, at which point we fix the
early vcpus. Should a vcpu run or be initialised in the interval,
bad things may happen.

An obvious solution is to move this fix-up phase to the point where
the vgic is created. This ensures that from that point onwards,
all vcpus have their private interrupts, as new vcpus will directly
allocate them.

With that, we have the invariant that when irqchip_in_kernel() is
true, all vcpus have their private interrupts.

Reported-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 74 ++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index bc7e22ab5d812..775461cf2d2db 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -34,9 +34,9 @@
  *
  * CPU Interface:
  *
- * - kvm_vgic_vcpu_init(): initialization of static data that
- *   doesn't depend on any sizing information or emulation type. No
- *   allocation is allowed there.
+ * - kvm_vgic_vcpu_init(): initialization of static data that doesn't depend
+ *   on any sizing information. Private interrupts are allocated if not
+ *   already allocated at vgic-creation time.
  */
 
 /* EARLY INIT */
@@ -58,6 +58,8 @@ void kvm_vgic_early_init(struct kvm *kvm)
 
 /* CREATION */
 
+static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type);
+
 /**
  * kvm_vgic_create: triggered by the instantiation of the VGIC device by
  * user space, either through the legacy KVM_CREATE_IRQCHIP ioctl (v2 only)
@@ -112,6 +114,22 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		goto out_unlock;
 	}
 
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		ret = vgic_allocate_private_irqs_locked(vcpu, type);
+		if (ret)
+			break;
+	}
+
+	if (ret) {
+		kvm_for_each_vcpu(i, vcpu, kvm) {
+			struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+			kfree(vgic_cpu->private_irqs);
+			vgic_cpu->private_irqs = NULL;
+		}
+
+		goto out_unlock;
+	}
+
 	kvm->arch.vgic.in_kernel = true;
 	kvm->arch.vgic.vgic_model = type;
 
@@ -180,7 +198,7 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	return 0;
 }
 
-static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
+static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	int i;
@@ -218,17 +236,28 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
 			/* PPIs */
 			irq->config = VGIC_CONFIG_LEVEL;
 		}
+
+		switch (type) {
+		case KVM_DEV_TYPE_ARM_VGIC_V3:
+			irq->group = 1;
+			irq->mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
+			break;
+		case KVM_DEV_TYPE_ARM_VGIC_V2:
+			irq->group = 0;
+			irq->targets = BIT(vcpu->vcpu_id);
+			break;
+		}
 	}
 
 	return 0;
 }
 
-static int vgic_allocate_private_irqs(struct kvm_vcpu *vcpu)
+static int vgic_allocate_private_irqs(struct kvm_vcpu *vcpu, u32 type)
 {
 	int ret;
 
 	mutex_lock(&vcpu->kvm->arch.config_lock);
-	ret = vgic_allocate_private_irqs_locked(vcpu);
+	ret = vgic_allocate_private_irqs_locked(vcpu, type);
 	mutex_unlock(&vcpu->kvm->arch.config_lock);
 
 	return ret;
@@ -258,7 +287,7 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
 	if (!irqchip_in_kernel(vcpu->kvm))
 		return 0;
 
-	ret = vgic_allocate_private_irqs(vcpu);
+	ret = vgic_allocate_private_irqs(vcpu, dist->vgic_model);
 	if (ret)
 		return ret;
 
@@ -295,7 +324,7 @@ int vgic_init(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 	struct kvm_vcpu *vcpu;
-	int ret = 0, i;
+	int ret = 0;
 	unsigned long idx;
 
 	lockdep_assert_held(&kvm->arch.config_lock);
@@ -315,35 +344,6 @@ int vgic_init(struct kvm *kvm)
 	if (ret)
 		goto out;
 
-	/* Initialize groups on CPUs created before the VGIC type was known */
-	kvm_for_each_vcpu(idx, vcpu, kvm) {
-		ret = vgic_allocate_private_irqs_locked(vcpu);
-		if (ret)
-			goto out;
-
-		for (i = 0; i < VGIC_NR_PRIVATE_IRQS; i++) {
-			struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, i);
-
-			switch (dist->vgic_model) {
-			case KVM_DEV_TYPE_ARM_VGIC_V3:
-				irq->group = 1;
-				irq->mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
-				break;
-			case KVM_DEV_TYPE_ARM_VGIC_V2:
-				irq->group = 0;
-				irq->targets = 1U << idx;
-				break;
-			default:
-				ret = -EINVAL;
-			}
-
-			vgic_put_irq(kvm, irq);
-
-			if (ret)
-				goto out;
-		}
-	}
-
 	/*
 	 * If we have GICv4.1 enabled, unconditionally request enable the
 	 * v4 support so that we get HW-accelerated vSGIs. Otherwise, only
-- 
2.39.2


