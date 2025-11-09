Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C189BCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVTzQVEc8DxOpYZFDISsA053ccXiJSxVPFurmia7h2g=; b=aJCWAC39L7VVKY0oBu4D5xKzjP
	jMJ4iC274XPZQkL729JgfoDZAi1lq0jGo6sDL4HUjiNRE22yBG9SYjsk+/I8gwiI6A43HzMU1X6RT
	OVWU6d8E/Up+bdifUE7yG+udkJj+Ci/IoDxtxDuigguUmDuroXYudkyWzrY7TrGqHr/VolsPbNQcL
	8pdZNQzWjbZdQFg+W5JGXmqzYCc83j3VkxK1RTQtIg9luEYBEl6eVHTOWAp6wMpSBRks15UwvIFL+
	I0m7Tyt1PvlAD+YL3KBVO0+13rCnbgnAdYtEgViBi8VSseipqD31GhlAKlGFDo2J0T+0cIs5psy5y
	wRdUS8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92W-00000004D7L-3rBL;
	Sun, 09 Nov 2025 17:17:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91n-00000004CEp-3qMO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 850064471A;
	Sun,  9 Nov 2025 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E803C4CEFB;
	Sun,  9 Nov 2025 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708595;
	bh=lwZelCb2zI/5hNTrYmrdSX93P6CsTCa7DxiK7pZCVY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S7XUCFoFea+DVrlRjIq87gU2Gu3ljOn2SBXdqibwOuVFPAeUcmds9nLIQEzLQBWsO
	 NzhFxqsK9pft16aacZPoN2/o5YNxKbKsHz1OVV7K4l3PHRfBej75oJm8KtKF1tB8/k
	 nQdPOmvOTyi4rmpRgYSUKaiv/KAj87I4ym/MvMwuF8xhH2pYM4UFy/POjHHf+b9+Mg
	 vEImaFR+Y3zS0+Lclu05Mun4kyGuUddqd/nHvBLrgs63N6aY74taWIkPQAVir4btCD
	 FDMrznYrYhlhe/i1Y+w1HSZGtkSA9pqqMyps6sH/sdWBZ2hETNMC1+wJX//yG65yqd
	 aCBiZ6tEBqhug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91l-00000003exw-1JI1;
	Sun, 09 Nov 2025 17:16:33 +0000
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
Subject: [PATCH v2 21/45] KVM: arm64: Turn kvm_vgic_vcpu_enable() into kvm_vgic_vcpu_reset()
Date: Sun,  9 Nov 2025 17:15:55 +0000
Message-ID: <20251109171619.1507205-22-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091636_063319_5A1D0A9A 
X-CRM114-Status: GOOD (  15.95  )
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
index d23db8f7b450a..5a57f3c299b56 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -290,7 +290,7 @@ void vgic_v3_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcrp)
 	GIC_BASER_CACHEABILITY(GICR_PENDBASER, OUTER, SameAsInner)	| \
 	GIC_BASER_SHAREABILITY(GICR_PENDBASER, InnerShareable))
 
-void vgic_v3_enable(struct kvm_vcpu *vcpu)
+void vgic_v3_reset(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *vgic_v3 = &vcpu->arch.vgic_cpu.vgic_v3;
 
@@ -320,9 +320,6 @@ void vgic_v3_enable(struct kvm_vcpu *vcpu)
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


