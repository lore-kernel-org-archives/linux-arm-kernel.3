Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE27CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7iFLc2YetIBIBMXxvEsIzrOdnlUsu46sE+s8r8pIh0=; b=YtzrYlu0d/kPyhFSgPxVN9cgca
	xT+AZwuJMZ+kSUoSPyyvEDJnAv/Y5Yd6PMkP3nDzpEy8r2cv/kWQcr+Nhk1pkJ6EuwHfA4xLyCaB1
	vqSHMKGOEvHDgEb3SB9ZMpdk9/jIrgIuwl1luvcCETR9+RtC2Eo5UHoIFKXy1OpSXc3F1LN65xElN
	rqXE9ACD6gB30R6BOnKeIvqfVN1qwqI6mP/bVQWGLwHCfbUZN1RbsSOdpx0bZmxoR5XVyPaS6ZDwC
	c+utwUvAy8wsvhw2EOl1/DdBX3IcoSAXztFGn0yWbsldYlRzntyafyxwXJB6xso5UB25dRK6Df+au
	qnOeRIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92m-00000004DZw-3DhF;
	Sun, 09 Nov 2025 17:17:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91q-00000004CBP-3Nwh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3FF141A62;
	Sun,  9 Nov 2025 17:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B134C4CEFB;
	Sun,  9 Nov 2025 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708598;
	bh=txs4K6cdIUiNSU/yfdrmcTDTzUiHOnY2hV2al7+wpLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RFuH3fjb+pXQ4dX7yu/F1fcNok02/P95N+QhqsK2H3PkFxzhhPycpeMymSjRORb/9
	 CDzBtzu+3rLVJmqTW+nmnY7qfkffFPEAy7HRbofTOxsSZjA/QW5NxZmRkGn8AJPbQx
	 Nya1tRbJWWllvfwrj1NQd1Gn48MZhL9hV0i7xYeY1e18C8h90vlW/WbOt1k1l0QBSq
	 cGUDy5iuspdDs3hCuO6wjWb5rMrMeWywTLr6SoU0gK9JbYrF4c2c7C3HwWKT97LJ58
	 zvp18cnLy3QADxrxSf36Pzk1ggQwRk69KwIvD5eID73M2iRttv6GURLgihluYnTRkS
	 4q0zvMsXGzIfw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91o-00000003exw-1gRA;
	Sun, 09 Nov 2025 17:16:36 +0000
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
Subject: [PATCH v2 34/45] KVM: arm64: GICv2: Handle deactivation via GICV_DIR traps
Date: Sun,  9 Nov 2025 17:16:08 +0000
Message-ID: <20251109171619.1507205-35-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091638_950139_D6253281 
X-CRM114-Status: GOOD (  23.21  )
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

Add the plumbing of GICv2 interrupt deactivation via GICV_DIR.
This requires adding a new device so that we can easily decode
the DIR address.

The deactivation itself is very similar to the GICv3 version.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-mmio-v2.c | 24 +++++++++
 arch/arm64/kvm/vgic/vgic-mmio.h    |  1 +
 arch/arm64/kvm/vgic/vgic-v2.c      | 85 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.h         |  1 +
 include/kvm/arm_vgic.h             |  1 +
 5 files changed, 112 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index f25fccb1f8e63..406845b3117cf 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -359,6 +359,16 @@ static void vgic_mmio_write_vcpuif(struct kvm_vcpu *vcpu,
 	vgic_set_vmcr(vcpu, &vmcr);
 }
 
+static void vgic_mmio_write_dir(struct kvm_vcpu *vcpu,
+				gpa_t addr, unsigned int len,
+				unsigned long val)
+{
+	if (kvm_vgic_global_state.type == VGIC_V2)
+		vgic_v2_deactivate(vcpu, val);
+	else
+		vgic_v3_deactivate(vcpu, val);
+}
+
 static unsigned long vgic_mmio_read_apr(struct kvm_vcpu *vcpu,
 					gpa_t addr, unsigned int len)
 {
@@ -482,6 +492,10 @@ static const struct vgic_register_region vgic_v2_cpu_registers[] = {
 	REGISTER_DESC_WITH_LENGTH(GIC_CPU_IDENT,
 		vgic_mmio_read_vcpuif, vgic_mmio_write_vcpuif, 4,
 		VGIC_ACCESS_32bit),
+	REGISTER_DESC_WITH_LENGTH_UACCESS(GIC_CPU_DEACTIVATE,
+		vgic_mmio_read_raz, vgic_mmio_write_dir,
+		vgic_mmio_read_raz, vgic_mmio_uaccess_write_wi,
+		4, VGIC_ACCESS_32bit),
 };
 
 unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev)
@@ -494,6 +508,16 @@ unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev)
 	return SZ_4K;
 }
 
+unsigned int vgic_v2_init_cpuif_iodev(struct vgic_io_device *dev)
+{
+	dev->regions = vgic_v2_cpu_registers;
+	dev->nr_regions = ARRAY_SIZE(vgic_v2_cpu_registers);
+
+	kvm_iodevice_init(&dev->dev, &kvm_io_gic_ops);
+
+	return KVM_VGIC_V2_CPU_SIZE;
+}
+
 int vgic_v2_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr)
 {
 	const struct vgic_register_region *region;
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmio.h
index 5b490a4dfa5e9..50dc80220b0f3 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.h
+++ b/arch/arm64/kvm/vgic/vgic-mmio.h
@@ -213,6 +213,7 @@ void vgic_write_irq_line_level_info(struct kvm_vcpu *vcpu, u32 intid,
 				    const u32 val);
 
 unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev);
+unsigned int vgic_v2_init_cpuif_iodev(struct vgic_io_device *dev);
 
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
 
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index bbd4d003fde86..bc52d44a573d5 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -9,6 +9,7 @@
 #include <kvm/arm_vgic.h>
 #include <asm/kvm_mmu.h>
 
+#include "vgic-mmio.h"
 #include "vgic.h"
 
 static inline void vgic_v2_write_lr(int lr, u32 val)
@@ -147,6 +148,79 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	cpuif->used_lrs = 0;
 }
 
+void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
+	struct kvm_vcpu *target_vcpu = NULL;
+	bool mmio = false;
+	struct vgic_irq *irq;
+	unsigned long flags;
+	u64 lr = 0;
+	u8 cpuid;
+
+	/* Snapshot CPUID, and remove it from the INTID */
+	cpuid = FIELD_GET(GENMASK_ULL(12, 10), val);
+	val &= ~GENMASK_ULL(12, 10);
+
+	/* We only deal with DIR when EOIMode==1 */
+	if (!(cpuif->vgic_vmcr & GICH_VMCR_EOI_MODE_MASK))
+		return;
+
+	/* Make sure we're in the same context as LR handling */
+	local_irq_save(flags);
+
+	irq = vgic_get_vcpu_irq(vcpu, val);
+	if (WARN_ON_ONCE(!irq))
+		goto out;
+
+	/* See the corresponding v3 code for the rationale */
+	scoped_guard(raw_spinlock, &irq->irq_lock) {
+		target_vcpu = irq->vcpu;
+
+		/* Not on any ap_list? */
+		if (!target_vcpu)
+			goto put;
+
+		/*
+		 * Urgh. We're deactivating something that we cannot
+		 * observe yet... Big hammer time.
+		 */
+		if (irq->on_lr) {
+			mmio = true;
+			goto put;
+		}
+
+		/* SGI: check that the cpuid matches */
+		if (val < VGIC_NR_SGIS && irq->active_source != cpuid) {
+			target_vcpu = NULL;
+			goto put;
+		}
+
+		/* (with a Dalek voice) DEACTIVATE!!!! */
+		lr = vgic_v2_compute_lr(vcpu, irq) & ~GICH_LR_ACTIVE_BIT;
+	}
+
+	if (lr & GICH_LR_HW)
+		writel_relaxed(FIELD_GET(GICH_LR_PHYSID_CPUID, lr),
+			       kvm_vgic_global_state.gicc_base + GIC_CPU_DEACTIVATE);
+
+	vgic_v2_fold_lr(vcpu, lr);
+
+put:
+	vgic_put_irq(vcpu->kvm, irq);
+
+out:
+	local_irq_restore(flags);
+
+	if (mmio)
+		vgic_mmio_write_cactive(vcpu, (val / 32) * 4, 4, BIT(val % 32));
+
+	/* Force the ap_list to be pruned */
+	if (target_vcpu)
+		kvm_make_request(KVM_REQ_VGIC_PROCESS_UPDATE, target_vcpu);
+}
+
 static u32 vgic_v2_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq)
 {
 	u32 val = irq->intid;
@@ -346,6 +420,7 @@ static bool vgic_v2_check_base(gpa_t dist_base, gpa_t cpu_base)
 int vgic_v2_map_resources(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
+	unsigned int len;
 	int ret = 0;
 
 	if (IS_VGIC_ADDR_UNDEF(dist->vgic_dist_base) ||
@@ -369,6 +444,16 @@ int vgic_v2_map_resources(struct kvm *kvm)
 		return ret;
 	}
 
+	len = vgic_v2_init_cpuif_iodev(&dist->cpuif_iodev);
+	dist->cpuif_iodev.base_addr = dist->vgic_cpu_base;
+	dist->cpuif_iodev.iodev_type = IODEV_CPUIF;
+	dist->cpuif_iodev.redist_vcpu = NULL;
+
+	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, dist->vgic_cpu_base,
+				      len, &dist->cpuif_iodev.dev);
+	if (ret)
+		return ret;
+
 	if (!static_branch_unlikely(&vgic_v2_cpuif_trap)) {
 		ret = kvm_phys_addr_ioremap(kvm, dist->vgic_cpu_base,
 					    kvm_vgic_global_state.vcpu_base,
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 01ff6d4aa9dad..ec3a61e8e6b30 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -277,6 +277,7 @@ int vgic_check_iorange(struct kvm *kvm, phys_addr_t ioaddr,
 
 void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu);
 void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr);
+void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val);
 void vgic_v2_clear_lr(struct kvm_vcpu *vcpu, int lr);
 void vgic_v2_configure_hcr(struct kvm_vcpu *vcpu, struct ap_list_summary *als);
 int vgic_v2_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 6a4d3d2055966..b261fb3968d03 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -287,6 +287,7 @@ struct vgic_dist {
 	struct vgic_irq		*spis;
 
 	struct vgic_io_device	dist_iodev;
+	struct vgic_io_device	cpuif_iodev;
 
 	bool			has_its;
 	bool			table_write_in_progress;
-- 
2.47.3


