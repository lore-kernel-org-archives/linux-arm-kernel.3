Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7F6CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj4Qbqx4AgV4Fb62/GMGzpvSGPBW7fXyscMBnBIxscY=; b=2TNGPIy8vzEmDZVKtrNBBHWqKs
	3E7B5PFr5WT6+516lSEmLb2bnz4tUPcPCXk2djMVonoAMIywekF30f7l+vcywHLTgPOGjoBEoCrBs
	KOyfIsox4cknseD4vmCYRCe7NvIJN/xg/HrmhiOrauZti35mwLvcR4o0Dx0N2+KwWUBx6c2pyFyL+
	PQUYPGRsZ5SqwKbxtw8HeHlbuq1bOznQJUKZGcqEwQ3MQAqJH21wqQ8g7I0nPtSvObO8mElJppVL8
	ufd745zMDuHnTjscVNAdXe5EgkjBS01uqjzW+rRdsm8Uwjzo2Jll5Q91it1jC2hV95OzEVeT/Bt6d
	/ikSLVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkL4-00000003MUh-3ulq;
	Fri, 16 Oct 2026 15:59:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkL2-00000003MTB-3ugP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:59:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9B621516;
	Fri, 16 Oct 2026 08:59:16 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613E03F673;
	Fri, 16 Oct 2026 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792166359; bh=EFWe3JzDHiibDzlo+CnC1H8s1rdNlxIpI2/pwx3Nr4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pqj8mxxtI0vJeNb0bfvEfknBS9m49uNxIhaCRUmFZgWO+NNzYTpnJZds/5tSDJDhG
	 dUXhv28V00UeZ/mgVjU2qLj8j4aO0aM9b47g03gGp2IQpvwOa0/6tXemgYyYYgxcZZ
	 l65zonFSAsdtRKx7DwReYxPvNIMGr/Fu/sFNZTl8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH 09/16] KVM: arm64: gic-v5: Add ITS MSI injection
Date: Fri, 16 Oct 2026 16:57:34 +0100
Message-Id: <20261016155741.979985-10-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016155741.979985-1-sascha.bischoff@arm.com>
References: <20261016155741.979985-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_085921_074906_616CF350 
X-CRM114-Status: GOOD (  18.40  )
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

Now that KVM can resolve GICv5 ITS translations from guest memory,
allow userspace and irqfd MSI injection to target a virtual GICv5 ITS.

Add helpers to validate that an MSI address resolves to a GICv5 ITS
IODEV, find the ITS for an MSI, resolve the DeviceID/EventID pair to a
vgic_irq, and inject the resulting LPI with the GICv5 VDPEND path.
GICv5 MSIs require KVM_MSI_VALID_DEVID, as the DeviceID is part of the
ITS translation key.

Although MSI data is 32 bits, GICv5 supports only 16-bit EventIDs.
Reject a nonzero upper half before narrowing the EventID for cache
lookups, so malformed MSI data cannot alias a valid translation.

Provide both the slow path, which resolves the translation from guest
memory and populates the ITS cache, and the inatomic cached path used
by irqfd. If the cached path misses, irqfd retries in a work item. The
worker borrows the VM's mm while walking the guest tables, then drops
it before injecting the LPI.

Wire kvm_set_msi() and kvm_arch_set_irq_inatomic() to use the GICv5
ITS injection helpers for GICv5 VMs, while keeping the existing GICv3
ITS path unchanged for GICv3 VMs.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c  |   8 ++
 arch/arm64/kvm/vgic/vgic-its-v5.c | 127 +++++++++++++++++++++++++++++-
 arch/arm64/kvm/vgic/vgic-v5.c     |  25 ++++++
 arch/arm64/kvm/vgic/vgic.h        |   7 ++
 4 files changed, 164 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index ee1a1b214f03c..c5f5ce8b80c1d 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -114,6 +114,10 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
 		return -1;
 
 	kvm_populate_msi(e, &msi);
+
+	if (vgic_is_v5(kvm))
+		return vgic_v5_its_inject_msi(kvm, &msi);
+
 	return vgic_its_inject_msi(kvm, &msi);
 }
 
@@ -135,6 +139,10 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
 			break;
 
 		kvm_populate_msi(e, &msi);
+
+		if (vgic_is_v5(kvm))
+			return vgic_v5_its_inject_cached_translation(kvm, &msi);
+
 		return vgic_its_inject_cached_translation(kvm, &msi);
 	}
 
diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
index e4c0415137605..5920fa1bcb2cf 100644
--- a/arch/arm64/kvm/vgic/vgic-its-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2025 ARM Limited, All Rights Reserved.
  */
 
+#include <linux/kthread.h>
 #include <linux/kvm_host.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 
 #include <asm/kvm_arm.h>
@@ -475,8 +477,45 @@ static int get_itte(struct kvm *kvm, u32 event_id, gpa_t itt_base,
 				   itt_l2_entry);
 }
 
+struct vgic_v5_its *vgic_v5_msi_to_its(struct kvm *kvm, struct kvm_msi *msi)
+{
+	struct kvm_io_device *kvm_io_dev;
+	struct vgic_io_device *iodev;
+	u64 address;
+
+	if (!vgic_has_its(kvm))
+		return ERR_PTR(-ENODEV);
+
+	if (!(msi->flags & KVM_MSI_VALID_DEVID))
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * MSI data is 32 bits, but GICv5 limits EventIDs to 16 bits.
+	 * Match that limit in the vITS.
+	 */
+	if (msi->data >> VITS_V5_EVENT_ID_BITS)
+		return ERR_PTR(-EINVAL);
+
+	address = (u64)msi->address_hi << 32 | msi->address_lo;
+
+	guard(srcu)(&kvm->srcu);
+
+	kvm_io_dev = kvm_io_bus_get_dev(kvm, KVM_MMIO_BUS, address);
+	if (!kvm_io_dev)
+		return ERR_PTR(-EINVAL);
+
+	if (kvm_io_dev->ops != &kvm_io_gic_ops)
+		return ERR_PTR(-EINVAL);
+
+	iodev = container_of(kvm_io_dev, struct vgic_io_device, dev);
+	if (iodev->iodev_type != IODEV_GICV5_ITS)
+		return ERR_PTR(-EINVAL);
+
+	return iodev->v5its;
+}
+
 static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
-				     u32 device_id, u16 event_id,
+				     u32 device_id, u32 event_id,
 				     struct vgic_irq **irq)
 {
 	unsigned int itt_l2sz, event_id_bits;
@@ -488,13 +527,15 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 	int ret;
 
 	lockdep_assert_held(&its->its_lock);
+	if (event_id >> VITS_V5_EVENT_ID_BITS)
+		return -EINVAL;
 
 	if (!its->enabled) {
 		kvm_debug("Cannot look up LPI; vITS is disabled\n");
 		return -ENXIO;
 	}
 
-	ret = its_cache_look_up_translation(its, device_id, event_id, irq);
+	ret = its_cache_look_up_translation(its, device_id, (u16)event_id, irq);
 	if (!ret)
 		return 0;
 
@@ -531,7 +572,8 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 		return PTR_ERR(*irq);
 
 	vgic_get_irq_ref(*irq);
-	ret = its_cache_add_translation(kvm, its, device_id, event_id, *irq);
+	ret = its_cache_add_translation(kvm, its, device_id, (u16)event_id,
+					 *irq);
 	if (ret) {
 		vgic_put_irq(kvm, *irq);
 		vgic_put_irq(kvm, *irq);
@@ -541,12 +583,91 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 	return ret;
 }
 
+int vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
+			    u32 device_id, u32 event_id,
+			    struct vgic_irq **irq)
+{
+	guard(mutex)(&its->its_lock);
+
+	return __vgic_v5_its_resolve_lpi(kvm, its, device_id, event_id, irq);
+}
+
 static void vgic_v5_its_inject_lpi(struct kvm *kvm, struct vgic_irq *irq)
 {
 	kvm_call_hyp(__vgic_v5_vdpend, irq->intid, true,
 		     kvm->arch.vgic.gicv5_vm.vm_id);
 }
 
+int vgic_v5_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi)
+{
+	struct vgic_v5_its *its;
+	struct vgic_irq *irq;
+	bool borrowed_mm = false;
+	int ret;
+
+	ret = vgic_v5_check_msi(kvm, msi);
+	if (ret)
+		return ret;
+
+	its = vgic_v5_msi_to_its(kvm, msi);
+	if (IS_ERR(its))
+		return PTR_ERR(its);
+
+	/* An irqfd cache miss is resolved by a worker outside the VM's mm. */
+	if (current->mm != kvm->mm) {
+		if (WARN_ON_ONCE(current->mm || !(current->flags & PF_KTHREAD)))
+			return -EWOULDBLOCK;
+
+		if (!mmget_not_zero(kvm->mm))
+			return -EFAULT;
+
+		kthread_use_mm(kvm->mm);
+		borrowed_mm = true;
+	}
+
+	ret = vgic_v5_its_resolve_lpi(kvm, its, msi->devid, msi->data, &irq);
+	if (borrowed_mm) {
+		kthread_unuse_mm(kvm->mm);
+		mmput(kvm->mm);
+	}
+
+	if (ret)
+		return ret;
+
+	vgic_v5_its_inject_lpi(kvm, irq);
+	vgic_put_irq(kvm, irq);
+
+	return 1;
+}
+
+int vgic_v5_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi)
+{
+	struct vgic_v5_its *its;
+	struct vgic_irq *irq;
+	int ret;
+
+	ret = vgic_v5_check_msi(kvm, msi);
+	if (ret)
+		return ret;
+
+	its = vgic_v5_msi_to_its(kvm, msi);
+	if (IS_ERR(its))
+		return PTR_ERR(its);
+
+	if (!READ_ONCE(its->enabled))
+		return -EWOULDBLOCK;
+
+	ret = its_cache_look_up_translation(its, msi->devid, (u16)msi->data,
+					    &irq);
+	if (ret)
+		return -EWOULDBLOCK;
+
+	vgic_v5_its_inject_lpi(kvm, irq);
+	vgic_put_irq(kvm, irq);
+
+	return 0;
+}
+
 static void vgic_v5_its_handle_read_event(struct kvm *kvm,
 					  struct vgic_v5_its *its)
 {
diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 18184020e188b..c90e00f56b298 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
 
+#include "vgic-mmio.h"
 #include "vgic-v5-tables.h"
 #include "vgic.h"
 
@@ -1635,3 +1636,27 @@ unsigned long vgic_v5_handle_guest_coresight_idreg_read(u32 offset)
 		return 0;
 	}
 }
+
+int vgic_v5_check_msi(struct kvm *kvm, struct kvm_msi *msi)
+{
+	struct kvm_io_device *kvm_io_dev;
+	struct vgic_io_device *iodev;
+	u64 address;
+
+	address = (u64)msi->address_hi << 32 | msi->address_lo;
+
+	guard(srcu)(&kvm->srcu);
+
+	kvm_io_dev = kvm_io_bus_get_dev(kvm, KVM_MMIO_BUS, address);
+	if (!kvm_io_dev)
+		return -EINVAL;
+
+	if (kvm_io_dev->ops != &kvm_io_gic_ops)
+		return -EINVAL;
+
+	iodev = container_of(kvm_io_dev, struct vgic_io_device, dev);
+	if (iodev->iodev_type != IODEV_GICV5_ITS)
+		return -EINVAL;
+
+	return 0;
+}
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 5a9aa9bd11dd7..3d06786142c2d 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -362,6 +362,13 @@ void vgic_v3_put(struct kvm_vcpu *vcpu);
 bool vgic_has_its(struct kvm *kvm);
 int kvm_vgic_register_its_device(void);
 int kvm_vgic_v5_register_its_device(void);
+int vgic_v5_check_msi(struct kvm *kvm, struct kvm_msi *msi);
+struct vgic_v5_its *vgic_v5_msi_to_its(struct kvm *kvm, struct kvm_msi *msi);
+int vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
+			    u32 device_id, u32 event_id,
+			    struct vgic_irq **irq);
+int vgic_v5_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
+int vgic_v5_its_inject_cached_translation(struct kvm *kvm, struct kvm_msi *msi);
 void vgic_enable_lpis(struct kvm_vcpu *vcpu);
 void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu);
 int vgic_its_inject_msi(struct kvm *kvm, struct kvm_msi *msi);
-- 
2.34.1


