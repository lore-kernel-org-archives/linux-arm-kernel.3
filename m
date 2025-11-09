Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B870CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxfAyNlCq3+4HRXMcRJGrvF0TrlkacTAOL5BA+d2bYg=; b=F95QzNxCQHUcfMnig7pcWAkJNK
	kQz1VdKw6iIaAUc+2FOeO7l5Pca7Ci4N164O0k8OoHyMIkFetAckwp5rviZf7QVLlBQ8VMkkJzLlp
	gQfA59jTIfcVS1/vM6JI07s77rgOXwqEp/hKGybWOJAicoJvq97tw0YF/qLXPpoa4Bfqq7AMRq5jA
	AEqSjobAzzjE/dFrnXGiy/LmxK9mMebJyecZaFEuF6dE1JRiVazOLPbwKJpxhLU8qfawW/hM+lbfV
	BSwk0yD8PXo4efEYhF5hOTczGwOqwtm3kGAm0wAFyR1ylz+c33zwzVagDGXSBg7hFrcnD9sEW7eAt
	KSdvnhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI921-00000004CVd-1AJI;
	Sun, 09 Nov 2025 17:16:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91l-00000004CAR-0bXl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D2E0446CC;
	Sun,  9 Nov 2025 17:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78773C19422;
	Sun,  9 Nov 2025 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708591;
	bh=sl9GQ+eCd9YeaPox1o9+QT172u2XBZJU09zMnj3EflU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HwR7zOQG8On2fKLzsC/mR+dq+qw1t+vfMMjCZDgSk0/eV9oFuS8HF01YhbDvgK6i+
	 26ydCEaUzRTlM6xcjmaCrRu7DcWO1QBp2eWZiMGzFgf1JOKlo68crriA2RT9i008lU
	 3EFiq7j9JPeB6lOYjRA7h20mrOclzRyqhmmZi3sfH2FduNdPW857qkZ1tm8yGBCzjM
	 6+wDKF8sJwvmqjBjf6K08eVjBh0qfscIrcsCBNEK3YEzUvTefsHEGtcrJDJFNaRoFc
	 vqx0Y3cc7Iwt5D2QJ3ahqSX+TIKb7ZgW57F6ZIoZTp3bA/CSvRefvowroZ19Idofhk
	 6oF++43Hn3aOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91h-00000003exw-1sIB;
	Sun, 09 Nov 2025 17:16:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 07/45] KVM: arm64: Add tracking of vgic_irq being present in a LR
Date: Sun,  9 Nov 2025 17:15:41 +0000
Message-ID: <20251109171619.1507205-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091633_299139_111E7DAA 
X-CRM114-Status: GOOD (  13.28  )
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

We currently cannot identify whether an interrupt is queued into
a LR. It wasn't needed until now, but that's about to change.

Add yet another flag to track that state.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 6 ++++++
 arch/arm64/kvm/vgic/vgic-v3.c | 6 ++++++
 include/kvm/arm_vgic.h        | 1 +
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 441efef80d609..74efacba38d42 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -101,6 +101,8 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & GICH_LR_PENDING_BIT);
 
+		irq->on_lr = false;
+
 		raw_spin_unlock(&irq->irq_lock);
 		vgic_put_irq(vcpu->kvm, irq);
 	}
@@ -124,6 +126,8 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	u32 val = irq->intid;
 	bool allow_pending = true;
 
+	WARN_ON(irq->on_lr);
+
 	if (irq->active) {
 		val |= GICH_LR_ACTIVE_BIT;
 		if (vgic_irq_is_sgi(irq->intid))
@@ -194,6 +198,8 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	/* The GICv2 LR only holds five bits of priority. */
 	val |= (irq->priority >> 3) << GICH_LR_PRIORITY_SHIFT;
 
+	irq->on_lr = true;
+
 	vcpu->arch.vgic_cpu.vgic_v2.vgic_lr[lr] = val;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 473252c98367b..58942abd2f4e7 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -97,6 +97,8 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & ICH_LR_PENDING_BIT);
 
+		irq->on_lr = false;
+
 		raw_spin_unlock(&irq->irq_lock);
 		vgic_put_irq(vcpu->kvm, irq);
 	}
@@ -111,6 +113,8 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	u64 val = irq->intid;
 	bool allow_pending = true, is_v2_sgi;
 
+	WARN_ON(irq->on_lr);
+
 	is_v2_sgi = (vgic_irq_is_sgi(irq->intid) &&
 		     model == KVM_DEV_TYPE_ARM_VGIC_V2);
 
@@ -185,6 +189,8 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	val |= (u64)irq->priority << ICH_LR_PRIORITY_SHIFT;
 
 	vcpu->arch.vgic_cpu.vgic_v3.vgic_lr[lr] = val;
+
+	irq->on_lr = true;
 }
 
 void vgic_v3_clear_lr(struct kvm_vcpu *vcpu, int lr)
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index e84a1bc5cf172..ec349c5a4a8b6 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -149,6 +149,7 @@ struct vgic_irq {
 	bool enabled:1;
 	bool active:1;
 	bool hw:1;			/* Tied to HW IRQ */
+	bool on_lr:1;			/* Present in a CPU LR */
 	refcount_t refcount;		/* Used for LPIs */
 	u32 hwintid;			/* HW INTID number */
 	unsigned int host_irq;		/* linux irq corresponding to hwintid */
-- 
2.47.3


