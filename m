Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF29CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8UoIByuxhzADXO+k9OFhOe+fcXzESCOC+jX2cMh8ss=; b=m1pHOzy7UMNptWSKTBvWF/mqhx
	BgmEvNfYGEqEhfVbTNHbutwzkbdMITeuAXZNePD8zQ97fCfskNyVaGJvdtm2Hx/WAExSoObwKxb4Z
	UNDSBMrDHqxMjyDnuj6i7+2xlSeiaHhRvn/iXfrcCmiRfnF6Ku6lW1IJTFsFkTGqAUtM71DeTD1FZ
	fXAhwn7X8yflwyqSpE9RMivTPnHF8mIdEUYLVeIB2Ca32pGYbJolEoYDqrQ4RSRIYEkvOjDGs+xHJ
	iTVal9FtqH/77fpXagusJXb0UmILmqu1aiYRwkUF9ETqjMDcAguPSO7pHnnrglEu3LcDMnULuuLa5
	x5Om1p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QC-000000075uR-0vjr;
	Thu, 20 Nov 2025 17:26:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Px-000000075ch-3ore
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50B0F601F1;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BFBC16AAE;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659561;
	bh=Wne+A8EYEvVAkzxyqVearpf9rf8Dhb8b8xWDhsiAlHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ib/KQUfr+I/dKWLtDhG4jMPbPOdn+OKJMfqcWAvMOXGUp/4ZXYHhXJ5OEqZSvMlR7
	 y2qGjr6x9ZX/3qtjrYfxI5JAwIXUgroaRtCK5xAR9LVeABxSet4QBbwW551kmG06Vk
	 N0Mif7sbmGu0g590U0bBdL2zNOdidBOmmGipM9CToDJhuiZcSFnjQh1wuBcW/O8SUO
	 GLvUkEGuWYJhDaxActxGOlXlzzMzVEH5ad40enQ2eyNkov7+rGi+KEutqK1X5M31H+
	 MLguqUIJcTd9pk4E0LH2Sosx0X20WPUP6n/BhedgDnPBlcbBYLpmzwmPi0DeThUYTm
	 N0AAKhYvEzTDQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pv-00000006y6g-0uU3;
	Thu, 20 Nov 2025 17:25:59 +0000
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
Subject: [PATCH v4 22/49] KVM: arm64: Turn kvm_vgic_vcpu_enable() into kvm_vgic_vcpu_reset()
Date: Thu, 20 Nov 2025 17:25:12 +0000
Message-ID: <20251120172540.2267180-23-maz@kernel.org>
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

Now that we always reconfigure the vgic HCR register on entry,
the "enable" part of kvm_vgic_vcpu_enable() is pretty useless.

Removing the enable bits from these functions makes it plain that
they are just about computing the reset state. Just rename the
functions accordingly.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 8 ++++----
 arch/arm64/kvm/vgic/vgic-v2.c   | 5 +----
 arch/arm64/kvm/vgic/vgic-v3.c   | 5 +----
 arch/arm64/kvm/vgic/vgic.h      | 4 ++--
 4 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1796b1a22a72a..6d5e5d708f23a 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -353,12 +353,12 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static void kvm_vgic_vcpu_enable(struct kvm_vcpu *vcpu)
+static void kvm_vgic_vcpu_reset(struct kvm_vcpu *vcpu)
 {
 	if (kvm_vgic_global_state.type == VGIC_V2)
-		vgic_v2_enable(vcpu);
+		vgic_v2_reset(vcpu);
 	else
-		vgic_v3_enable(vcpu);
+		vgic_v3_reset(vcpu);
 }
 
 /*
@@ -405,7 +405,7 @@ int vgic_init(struct kvm *kvm)
 	}
 
 	kvm_for_each_vcpu(idx, vcpu, kvm)
-		kvm_vgic_vcpu_enable(vcpu);
+		kvm_vgic_vcpu_reset(vcpu);
 
 	ret = kvm_vgic_setup_default_irq_routing(kvm);
 	if (ret)
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index f53bc55288978..18856186be7be 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -285,7 +285,7 @@ void vgic_v2_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcrp)
 			GICH_VMCR_PRIMASK_SHIFT) << GICV_PMR_PRIORITY_SHIFT;
 }
 
-void vgic_v2_enable(struct kvm_vcpu *vcpu)
+void vgic_v2_reset(struct kvm_vcpu *vcpu)
 {
 	/*
 	 * By forcing VMCR to zero, the GIC will restore the binary
@@ -293,9 +293,6 @@ void vgic_v2_enable(struct kvm_vcpu *vcpu)
 	 * anyway.
 	 */
 	vcpu->arch.vgic_cpu.vgic_v2.vgic_vmcr = 0;
-
-	/* Get the show on the road... */
-	vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr = GICH_HCR_EN;
 }
 
 /* check for overlapping regions and for regions crossing the end of memory */
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 81f1de9e3897b..780cc92c79e04 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -293,7 +293,7 @@ void vgic_v3_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcrp)
 	GIC_BASER_CACHEABILITY(GICR_PENDBASER, OUTER, SameAsInner)	| \
 	GIC_BASER_SHAREABILITY(GICR_PENDBASER, InnerShareable))
 
-void vgic_v3_enable(struct kvm_vcpu *vcpu)
+void vgic_v3_reset(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *vgic_v3 = &vcpu->arch.vgic_cpu.vgic_v3;
 
@@ -323,9 +323,6 @@ void vgic_v3_enable(struct kvm_vcpu *vcpu)
 						    kvm_vgic_global_state.ich_vtr_el2);
 	vcpu->arch.vgic_cpu.num_pri_bits = FIELD_GET(ICH_VTR_EL2_PRIbits,
 						     kvm_vgic_global_state.ich_vtr_el2) + 1;
-
-	/* Get the show on the road... */
-	vgic_v3->vgic_hcr = ICH_HCR_EL2_En;
 }
 
 void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 4a0733869cb5f..e48294521541e 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -285,7 +285,7 @@ int vgic_v2_cpuif_uaccess(struct kvm_vcpu *vcpu, bool is_write,
 			  int offset, u32 *val);
 void vgic_v2_set_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr);
 void vgic_v2_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr);
-void vgic_v2_enable(struct kvm_vcpu *vcpu);
+void vgic_v2_reset(struct kvm_vcpu *vcpu);
 int vgic_v2_probe(const struct gic_kvm_info *info);
 int vgic_v2_map_resources(struct kvm *kvm);
 int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
@@ -320,7 +320,7 @@ void vgic_v3_clear_lr(struct kvm_vcpu *vcpu, int lr);
 void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu, struct ap_list_summary *als);
 void vgic_v3_set_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr);
 void vgic_v3_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcr);
-void vgic_v3_enable(struct kvm_vcpu *vcpu);
+void vgic_v3_reset(struct kvm_vcpu *vcpu);
 int vgic_v3_probe(const struct gic_kvm_info *info);
 int vgic_v3_map_resources(struct kvm *kvm);
 int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq);
-- 
2.47.3


