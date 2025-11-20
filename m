Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617D7CF885C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYEUXbq/P3eNmO4MTKANd7oabWq13PZ2XL3+afH3WM=; b=ehBd/vOVpQjlfe920pC+Cq2TFu
	hd9XJPOe5BfK7l22HpMMMWFH0YNjX1juGDCoAX1Y45+fNG4veuLlZhuhiOo6w2/URF3RqlJr4wfAP
	pKmhLongOFPS7KgGhBmUcNiLl1ZO9VyQxusdSG0cD/mfM4t5BdZtpMI6kNXEywjiaRl1jfuLmK/Vv
	T/GeH6lv5lOaqiWK93OZSUj+S+FzP3ILpfLCYRhgtawdE3JLVATBGahZhTO2C/Y8Stlavq1BNVKcx
	ggj+fPRgfExdmgLFsE96VS18ZUcUWImhz8Tb8y1Yx6WouuSIUx5kBAUrfOyC3+h1pqSiBIPQ/mB+J
	yEDmllcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Ic-00000006o3Z-3f9M;
	Thu, 20 Nov 2025 14:06:14 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5IZ-00000006o1w-2oDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647571; x=1795183571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hOYEUXbq/P3eNmO4MTKANd7oabWq13PZ2XL3+afH3WM=;
  b=I2ozenjk48VmMmERUVceANggvy7x8OC4blERRQmFu28/pdTAF91xWRKv
   tVA+LK7FTr/2RTXYlBfIH6+Gp5E5a7sh0NwHTHeEmfR4+QY3IXDUYrMnH
   a6CYASMC0hCMmWZa4+TWdIWv+yvvhaThfArKmwrQnBGL4FUplMY+9RZMP
   JB6IEVJxdIVbU6gToAkMtmF9tXQBD7Ivb2E3eU2GdZDu9dshyPrxIdcpM
   iH+zYMGWyZA7TLW59+d+4A+lHN9NWr5wZfe/HHkqi26xQuHLnEeSjTWH+
   snimS4m8ZU7cCmJPUk7CH1jnUkdWqPRV9qUqkrmewd1571JQttkv3wDSG
   Q==;
X-CSE-ConnectionGUID: a1mK0HneSjOuePqoh0HOFA==
X-CSE-MsgGUID: hgxrk10SRWG0Rljxo+y4ng==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7439097"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:06:06 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:3713]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.1:2525] with esmtp (Farcaster)
 id b13f35b6-e600-42b1-abb3-a386aa569b80; Thu, 20 Nov 2025 14:06:06 +0000 (UTC)
X-Farcaster-Flow-ID: b13f35b6-e600-42b1-abb3-a386aa569b80
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:06:06 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:06:03 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>
Subject: [RFC PATCH 11/13] KVM: Ioctl to set up userspace-injected MSIs as software-bypassing vLPIs
Date: Thu, 20 Nov 2025 15:03:00 +0100
Message-ID: <20251120140305.63515-12-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D037UWB004.ant.amazon.com (10.13.138.84) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060611_780862_B8718E2E 
X-CRM114-Status: GOOD (  22.90  )
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

At the moment, all MSIs injected from userspace using KVM_SIGNAL_MSI
are preempted by the hypervisor and handled by software. To properly
test GICv4 direct vLPI injection from KVM selftests, we write a
KVM_DEBUG_GIC_MSI_SETUP ioctl that manually creates an IRQ routing
table entry for the specified MSI, and populates ITS structures
(device, collection, and interrupt translation table entries) to map
the MSI to a vLPI. We then call GICv4 kvm_vgic_v4_set_forwarding to
let the vLPI bypass hypervisor traps and inject directly to the vCPU.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
---
 arch/arm64/kvm/arm.c               |  34 +++++++
 arch/arm64/kvm/vgic/vgic-its.c     | 138 +++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.h         |   1 +
 include/linux/irqchip/arm-gic-v3.h |   1 +
 include/uapi/linux/kvm.h           |  15 ++++
 5 files changed, 189 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c2224664f05e..ecc3c87889db 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -45,6 +45,8 @@
 #include <kvm/arm_pmu.h>
 #include <kvm/arm_psci.h>
 
+#include <vgic/vgic.h>
+
 #include "sys_regs.h"
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
@@ -1992,6 +1994,38 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		guard(mutex)(&vcpu->arch.vgic_cpu.vlpi_toggle_mutex);
 		return kvm_vgic_query_vcpu_vlpi(vcpu);
 	}
+	case KVM_DEBUG_GIC_MSI_SETUP: {
+		/* Define interrupt ID boundaries for input validation */
+		#define GIC_LPI_OFFSET    8192
+		#define GIC_LPI_MAX       65535
+		#define SPI_INTID_MIN     32
+		#define SPI_INTID_MAX     1019
+
+		struct kvm_debug_gic_msi_setup params;
+		struct kvm_vcpu *vcpu;
+
+		if (copy_from_user(&params, argp, sizeof(params)))
+			return -EFAULT;
+
+		/* validate vcpu_id is in range and exists */
+		vcpu = kvm_get_vcpu_by_id(kvm, params.vcpu_id);
+		if (!vcpu)
+			return -EINVAL;
+
+		/* validate vintid is in LPI range */
+		if (params.vintid < GIC_LPI_OFFSET || params.vintid > GIC_LPI_MAX)
+			return -EINVAL;
+
+		/*
+		 * Validate host_irq is in safe range -- we use SPI range since
+		 * selftests guests will have no shared peripheral devices
+		 */
+		if (params.host_irq < SPI_INTID_MIN || params.host_irq > SPI_INTID_MAX)
+			return -EINVAL;
+
+		/* Mock single MSI for testing */
+		return debug_gic_msi_setup_mock_msi(kvm, &params);
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 5f3bbf24cc2f..a0d140ce35d1 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2815,3 +2815,141 @@ int kvm_vgic_register_its_device(void)
 	return kvm_register_device_ops(&kvm_arm_vgic_its_ops,
 				       KVM_DEV_TYPE_ARM_VGIC_ITS);
 }
+
+static struct vgic_its *vgic_get_its(struct kvm *kvm,
+					struct kvm_kernel_irq_routing_entry *irq_entry)
+{
+	struct kvm_msi msi  = (struct kvm_msi) {
+		.address_lo	= irq_entry->msi.address_lo,
+		.address_hi	= irq_entry->msi.address_hi,
+		.data		= irq_entry->msi.data,
+		.flags		= irq_entry->msi.flags,
+		.devid		= irq_entry->msi.devid,
+	};
+
+	return vgic_msi_to_its(kvm, &msi);
+}
+
+/*
+ * debug_gic_msi_setup_mock_msi - manually set up vLPI direct injection infrastructure
+ * for an MSI upon userspace request. Used for testing vLPIs from selftests.
+ *
+ * Creates an IRQ routing entry mapping the specified MSI signature to a mock
+ * host IRQ, then populates ITS structures (device, collection, ITE) to establish
+ * the DevID/EventID to LPI translation. Finally enables GICv4 vLPI forwarding
+ * to bypass software emulation and inject interrupts directly to the vCPU.
+ *
+ * This function is intended solely for KVM selftests via KVM_DEBUG_GIC_MSI_SETUP.
+ * It uses mock host IRQs in the SPI range assuming no real hardware devices are
+ * present on a selftest guest. Using this interface in production will corrupt the
+ * IRQ routing table.
+ */
+int debug_gic_msi_setup_mock_msi(struct kvm *kvm, struct kvm_debug_gic_msi_setup *params)
+{
+	struct kvm_irq_routing_entry user_entry;
+	struct kvm_kernel_irq_routing_entry entry;
+	struct vgic_its *its;
+	struct its_device *device;
+	struct its_collection *collection;
+	struct its_ite *ite;
+	struct vgic_irq *irq;
+	struct kvm_vcpu *vcpu;
+	u64 doorbell_addr = GITS_BASE_GPA + GITS_TRANSLATER;
+	u32 device_id = params->device_id;
+	u32 event_id = params->event_id;
+	u32 coll_id = params->vcpu_id;
+	u32 lpi_nr = params->vintid;
+	gpa_t itt_addr = params->itt_addr;
+	int ret;
+	int host_irq = params->host_irq;
+
+	/* Get target vCPU, validate it has a vPE for direct injection */
+	vcpu = kvm_get_vcpu(kvm, params->vcpu_id);
+	if (!vcpu)
+		return -EINVAL;
+	else if (!vcpu->arch.vgic_cpu.vgic_v3.its_vpe.its_vm)
+		return -ENXIO; /* vPE not currently enabled for this vCPU */
+
+	/*
+	 * Enable this vLPIs for this vCPU manually for testing, normally
+	 * done by guest writing GICR_CTLR
+	 */
+	atomic_set(&vcpu->arch.vgic_cpu.ctlr, GICR_CTLR_ENABLE_LPIS);
+
+	// Unmap any existing vLPI on the mock host IRQ (remnants from prior mocks)
+	kvm_vgic_v4_unset_forwarding(kvm, host_irq);
+
+	/* Create mock user IRQ routing entry using kvm_set_routing_entry function */
+	memset(&user_entry, 0, sizeof(user_entry));
+	user_entry.gsi = host_irq;
+	user_entry.type = KVM_IRQ_ROUTING_MSI;
+	user_entry.u.msi.address_lo = doorbell_addr & 0xFFFFFFFF;
+	user_entry.u.msi.address_hi = doorbell_addr >> 32;
+	user_entry.u.msi.data = event_id;
+	user_entry.u.msi.devid = device_id;
+	user_entry.flags = KVM_MSI_VALID_DEVID;
+
+	/* Initialize kernel routing entry */
+	memset(&entry, 0, sizeof(entry));
+
+	/* Use vgic-irqfd.c function to create entry */
+	ret = kvm_set_routing_entry(kvm, &entry, &user_entry);
+	if (ret)
+		return ret;
+
+	/* Now that we created an MSI -> ITS mapping, we can populate the ITS for this MSI */
+
+	/* Get ITS instance */
+	its = vgic_get_its(kvm, &entry);
+	if (IS_ERR(its))
+		return PTR_ERR(its);
+
+	/* Enable ITS manually for testing, normally done by guest writing to GITS_CTLR register */
+	its->enabled = true;
+
+	mutex_lock(&its->its_lock);
+
+	/* Create ITS device */
+	device = vgic_its_alloc_device(its, device_id, itt_addr, 8);
+	if (IS_ERR(device)) {
+		ret = PTR_ERR(device);
+		goto unlock;
+	}
+
+	/* Create collection mapped to inputted vcpu */
+	ret = vgic_its_alloc_collection(its, &collection, coll_id);
+	if (ret)
+		goto unlock;
+
+	collection->target_addr = params->vcpu_id;  // Map to specified vcpu
+
+	/* Create ITE */
+	ite = vgic_its_alloc_ite(device, collection, event_id);
+	if (IS_ERR(ite)) {
+		ret = PTR_ERR(ite);
+		vgic_its_free_collection(its, coll_id);
+		goto unlock;
+	}
+
+	/* Create LPI */
+	irq = vgic_add_lpi(kvm, lpi_nr, vcpu);
+	if (IS_ERR(irq)) {
+		ret = PTR_ERR(irq);
+		its_free_ite(kvm, ite);
+		vgic_its_free_collection(its, coll_id);
+		goto unlock;
+	}
+
+	ite->irq = irq;
+	update_affinity_ite(kvm, ite);
+
+	/* Now that routing entry is initialized, call v4 forwarding setup */
+	ret = kvm_vgic_v4_set_forwarding_locked(kvm, host_irq, &entry, its);
+
+	mutex_unlock(&its->its_lock);
+	return ret;
+
+unlock:
+	mutex_unlock(&its->its_lock);
+	return ret;
+}
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index b16419eb9121..9f8be87e3294 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -475,5 +475,6 @@ bool kvm_per_vcpu_vlpi_supported(void);
 int kvm_vgic_enable_vcpu_vlpi(struct kvm_vcpu *vcpu);
 int kvm_vgic_disable_vcpu_vlpi(struct kvm_vcpu *vcpu);
 int kvm_vgic_query_vcpu_vlpi(struct kvm_vcpu *vcpu);
+int debug_gic_msi_setup_mock_msi(struct kvm *kvm, struct kvm_debug_gic_msi_setup *params);
 
 #endif
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 5031a4c25543..1ab1eb80e685 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -378,6 +378,7 @@
 #define GITS_CIDR3			0xfffc
 
 #define GITS_TRANSLATER			0x10040
+#define GITS_BASE_GPA           0x8000000ULL
 
 #define GITS_SGIR			0x20020
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 002fe0f4841d..057eb9e61ac8 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1457,6 +1457,21 @@ struct kvm_enc_region {
 #define KVM_DISABLE_VCPU_VLPI    _IOW(KVMIO, 0xf1, int)
 #define KVM_QUERY_VCPU_VLPI    _IOR(KVMIO, 0xf2, int)
 
+/*
+ * Generate an IRQ routing entry and vLPI tables for userspace-sourced
+ * MSI, enabling direct vLPI injection testing from selftests
+ */
+#define KVM_DEBUG_GIC_MSI_SETUP    _IOW(KVMIO, 0xf3, struct kvm_debug_gic_msi_setup)
+
+struct kvm_debug_gic_msi_setup {
+	__u32 device_id;
+	__u32 event_id;
+	__u32 vcpu_id;
+	__u32 vintid;
+	__u32 host_irq;
+	__u64 itt_addr;
+};
+
 #define KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE    (1 << 0)
 #define KVM_DIRTY_LOG_INITIALLY_SET            (1 << 1)
 
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


