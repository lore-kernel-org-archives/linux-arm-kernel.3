Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529ED6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7X5E9dxUyzXiE8KAQ0BZjHPKiuD80J/ngJMTIXXIxc=; b=roCdfSRjYR7Pp4EzHDzsYvyqGi
	gP5CwX5TQroKrSPFxsyXZGolYGBeUZnLKc6rysNSVirqk11RfwhKhOxRW2pD4MUM84U6EIcgmCh4B
	P8WQBiOgTJhe4zK/8huY5RHdnLjvxwopeTjjxN8HVXRenXivFnq9aN0XZQ0177tqa4wgsWp5wiAA5
	Eqt2DEkNnWCepDEI0XMlkZjk3S/rYW4Hf0BvTno43Dvgox5EC2jS22tBeNK+MHMagtdT4gnCg9eg5
	0pgGfkSI8pRat9bVwHN59ZW5S2dqdqulSXycRTjrrhV8QJNLheL9Un66FxQZ04JN6sN6UNvuIMVl/
	fRtdEFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoWi-00000006WjX-2FoM;
	Wed, 17 Dec 2025 10:13:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoWY-00000006WZR-4BwH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:12:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8041517;
	Wed, 17 Dec 2025 02:12:42 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CB2B3F73B;
	Wed, 17 Dec 2025 02:12:44 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v12 13/46] KVM: arm64: vgic: Provide helper for number of list registers
Date: Wed, 17 Dec 2025 10:10:50 +0000
Message-ID: <20251217101125.91098-14-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021251_150609_CC50AC53 
X-CRM114-Status: GOOD (  14.57  )
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

Currently the number of list registers available is stored in a global
(kvm_vgic_global_state.nr_lr). With Arm CCA the RMM is permitted to
reserve list registers for its own use and so the number of available
list registers can be fewer for a realm VM. Provide wrapper functions
to fetch the global in preparation for restricting nr_lr when dealing
with a realm VM.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes in v12:
 * Upstream changes mean that vcpu isn't available everywhere we need
   it, so update helpers to take vcpu.
 * Note that the VGIC handling will be reworked for the RMM 2.0 spec.
New patch for v6
---
 arch/arm64/kvm/vgic/vgic-v2.c |  6 +++---
 arch/arm64/kvm/vgic/vgic-v3.c |  8 ++++----
 arch/arm64/kvm/vgic/vgic.c    |  6 +++---
 arch/arm64/kvm/vgic/vgic.h    | 18 ++++++++++++------
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 585491fbda80..990bf693f65d 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -34,11 +34,11 @@ void vgic_v2_configure_hcr(struct kvm_vcpu *vcpu,
 
 	cpuif->vgic_hcr = GICH_HCR_EN;
 
-	if (irqs_pending_outside_lrs(als))
+	if (irqs_pending_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= GICH_HCR_NPIE;
-	if (irqs_active_outside_lrs(als))
+	if (irqs_active_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= GICH_HCR_LRENPIE;
-	if (irqs_outside_lrs(als))
+	if (irqs_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= GICH_HCR_UIE;
 
 	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & GICH_VMCR_ENABLE_GRP0_MASK) ?
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 1d6dd1b545bd..c9ff4f90c975 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -31,11 +31,11 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 
 	cpuif->vgic_hcr = ICH_HCR_EL2_En;
 
-	if (irqs_pending_outside_lrs(als))
+	if (irqs_pending_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_NPIE;
-	if (irqs_active_outside_lrs(als))
+	if (irqs_active_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_LRENPIE;
-	if (irqs_outside_lrs(als))
+	if (irqs_outside_lrs(als, vcpu))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_UIE;
 
 	if (!als->nr_sgi)
@@ -60,7 +60,7 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 	 * can change behind our back without any warning...
 	 */
 	if (!cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR) ||
-	    irqs_active_outside_lrs(als)		     ||
+	    irqs_active_outside_lrs(als, vcpu)		     ||
 	    atomic_read(&vcpu->kvm->arch.vgic.active_spis))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 430aa98888fd..2fdcef3d28d1 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -957,7 +957,7 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 
 	summarize_ap_list(vcpu, &als);
 
-	if (irqs_outside_lrs(&als))
+	if (irqs_outside_lrs(&als, vcpu))
 		vgic_sort_ap_list(vcpu);
 
 	list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list) {
@@ -967,12 +967,12 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 			}
 		}
 
-		if (count == kvm_vgic_global_state.nr_lr)
+		if (count == kvm_vcpu_vgic_nr_lr(vcpu))
 			break;
 	}
 
 	/* Nuke remaining LRs */
-	for (int i = count ; i < kvm_vgic_global_state.nr_lr; i++)
+	for (int i = count ; i < kvm_vcpu_vgic_nr_lr(vcpu); i++)
 		vgic_clear_lr(vcpu, i);
 
 	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif)) {
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 5f0fc96b4dc2..55a1142efc6f 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -7,6 +7,7 @@
 
 #include <linux/irqchip/arm-gic-common.h>
 #include <asm/kvm_mmu.h>
+#include <asm/kvm_rmi.h>
 
 #define PRODUCT_ID_KVM		0x4b	/* ASCII code K */
 #define IMPLEMENTER_ARM		0x43b
@@ -242,14 +243,19 @@ struct ap_list_summary {
 	unsigned int	nr_sgi;		/* any SGI */
 };
 
-#define irqs_outside_lrs(s)						\
-	 (((s)->nr_pend + (s)->nr_act) > kvm_vgic_global_state.nr_lr)
+static inline int kvm_vcpu_vgic_nr_lr(struct kvm_vcpu *vcpu)
+{
+	return kvm_vgic_global_state.nr_lr;
+}
+
+#define irqs_outside_lrs(s, vcpu)					\
+	 (((s)->nr_pend + (s)->nr_act) > kvm_vcpu_vgic_nr_lr(vcpu))
 
-#define irqs_pending_outside_lrs(s)			\
-	((s)->nr_pend > kvm_vgic_global_state.nr_lr)
+#define irqs_pending_outside_lrs(s, vcpu)			\
+	((s)->nr_pend > kvm_vcpu_vgic_nr_lr(vcpu))
 
-#define irqs_active_outside_lrs(s)		\
-	((s)->nr_act &&	irqs_outside_lrs(s))
+#define irqs_active_outside_lrs(s, vcpu)		\
+	((s)->nr_act &&	irqs_outside_lrs(s, vcpu))
 
 int vgic_v3_parse_attr(struct kvm_device *dev, struct kvm_device_attr *attr,
 		       struct vgic_reg_attr *reg_attr);
-- 
2.43.0


