Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AB606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pK725HHB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K6bksjRZ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DP5v9FC4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o9Zj0uDrLtT59Cp5ilWqKygvn3OZ7IulIamM3tG1l8g=; b=pK725HHB/vBft/
	YyspHOiM9Ql+xHB5HnRN48B6mV1FsMJQCERhF4jKIF/BzRTHOFS6TdKRVPU5cZJVFFkhG+W3VgyGy
	GjsX/QzSmF/6FzNRAA2FYBUQLePrmETFjhV+5nx0allCVZccZCLz75BxuLcnssdx3cA5glY40qSJ6
	GZtnTTPsPby1qsbH+G18pNf+oVMjvCmZsI8syXVO2pTmaX/eyBJKBeLluxlbQ3xOJ2Fxqudo4CBbO
	T9Ai2kO2PeF6pWr74ov1+Nt6lpMaU0FV+93F4KXcVLhpjfmGAb1VjZCCcs0m/8xXCpuKmJg/ftkke
	pCqzv+EXV0yucsQSVtzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxzC-00000000Agx-0XhS;
	Mon, 02 Nov 2026 19:46:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxya-0000000098W-2JNL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 19:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o9Zj0uDrLtT59Cp5ilWqKygvn3OZ7IulIamM3tG1l8g=; b=K6bksjRZgMDHyFwA93DazgS5du
	U2dbEis64OeYPqkm4xUvcMHrmC3YJom/yc8C3saZ2tslnt/D9Syz0Flzd/d/kHv6DaaT8o8zeqBZi
	0W3tHPVtml3rG+sV6uFmuEgFxEVJSUE53mZsyftgYGTYh4Xvcn0K2Fyj9AzFPIXV8V13dbB2fTpOF
	kxSNS0UcT8Q4U99A1nBBpG5BVULfOeRDz13G9qNnEywchgswkZYRtV23MdqFPLS9BhF/Hx4g4+2TG
	OGGaYw6FitkGVlNoH2gissVohDM+hxZkT8uGs6xHiKUoMgUkJHZChokld18iq15c8PPUeZ4iNhlXr
	Rp1vZsXQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyU-000000031Ir-2BKp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7129D16A3;
	Mon,  2 Nov 2026 11:45:41 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA62B3F871;
	Mon,  2 Nov 2026 11:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648744; bh=alN/4224zFytf27w5ONkJJlEll5Qao+G1kFWCP+heqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DP5v9FC4bJANz8W8DHeF9GlYzUAEokxRLfnup46ImzhOGp8t0wEBUpCEyazHKpamb
	 nS849c+h66nsDk5y05HhgMtmLw4Pr86PQs9UbSkwcTOCNFd0NofmrRuvioOkOclMCb
	 4OFVMlbgfKSWDT2LVRH4D+Ipaw2lHnG2Xs7cs4ys=
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
Subject: [PATCH v2 09/16] KVM: arm64: gic-v5: Add ITS MSI injection
Date: Mon,  2 Nov 2026 19:44:47 +0000
Message-Id: <20261102194454.4086911-10-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_194546_870806_17360D5B 
X-CRM114-Status: GOOD (  21.10  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 arch/arm64/kvm/vgic/vgic-its-v5.c | 132 ++++++++++++++++++++++++++++--
 arch/arm64/kvm/vgic/vgic.h        |   6 ++
 3 files changed, 139 insertions(+), 7 deletions(-)

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
index 9f4783b243221..b69a1d107c0ae 100644
--- a/arch/arm64/kvm/vgic/vgic-its-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
@@ -3,8 +3,10 @@
  * Copyright (C) 2025 ARM Limited, All Rights Reserved.
  */
 
+#include <linux/kthread.h>
 #include <linux/kvm_host.h>
 #include <linux/rcupdate.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 
 #include <asm/kvm_arm.h>
@@ -19,6 +21,7 @@
 
 #define VITS_V5_DEVICE_ID_BITS		16
 #define VITS_V5_EVENT_ID_BITS		16
+#define VITS_V5_UNMAPPED		1
 
 struct its_cache_translation_entry {
 	struct rcu_head rcu;
@@ -359,8 +362,46 @@ static int get_itte(struct kvm *kvm, u32 event_id, gpa_t itt_base,
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
+/* A positive return means the guest has no usable translation. */
 static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
-				     u32 device_id, u16 event_id,
+				     u32 device_id, u32 event_id,
 				     struct vgic_irq **irq)
 {
 	unsigned int itt_l2sz, event_id_bits;
@@ -372,13 +413,15 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
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
 
@@ -389,23 +432,23 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 		      &event_id_bits, &itt_l2sz);
 	if (ret) {
 		kvm_debug("Error parsing guest's DT\n");
-		return ret;
+		return VITS_V5_UNMAPPED;
 	}
 
 	if (event_id >= 1UL << event_id_bits) {
 		kvm_debug("Event ID out of range\n");
-		return -E2BIG;
+		return VITS_V5_UNMAPPED;
 	}
 
 	ret = get_itte(kvm, event_id, itt_base, two_level_itt, itt_l2sz,
 		       &itt_l2_entry);
 	if (ret)
-		return ret;
+		return VITS_V5_UNMAPPED;
 
 	val = le64_to_cpu(itt_l2_entry);
 	if (!FIELD_GET(GICV5_ITTL2E_VALID, val)) {
 		kvm_debug("ITTE is not valid\n");
-		return -EINVAL;
+		return VITS_V5_UNMAPPED;
 	}
 
 	lpi = FIELD_GET(GICV5_ITTL2E_LPI_ID, val);
@@ -415,7 +458,8 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 		return PTR_ERR(*irq);
 
 	vgic_get_irq_ref(*irq);
-	ret = its_cache_add_translation(kvm, its, device_id, event_id, *irq);
+	ret = its_cache_add_translation(kvm, its, device_id, (u16)event_id,
+					 *irq);
 	if (ret) {
 		vgic_put_irq(kvm, *irq);
 		return 0;
@@ -424,12 +468,86 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
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
+	if (ret < 0)
+		return ret;
+	/* KVM_SIGNAL_MSI reports guest translation failures as blocked MSIs. */
+	if (ret)
+		return 0;
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
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 9e1cbcdedf3f5..64f6229fe555e 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -364,6 +364,12 @@ void vgic_v3_put(struct kvm_vcpu *vcpu);
 bool vgic_has_its(struct kvm *kvm);
 int kvm_vgic_register_its_device(void);
 int kvm_vgic_v5_register_its_device(void);
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


