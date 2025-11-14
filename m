Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFD8CE8D51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhOCvazbjdj4Stesw99gc0Yuwdb3B/fEsYl0uuL1k5Q=; b=g0+ujrkR56Due/Xn3hdO4/v/3J
	jEE4D37X7iiyfEjgMpXvw8U90utnEwvAEc12BF7AErKtqraPBLL2MvaBzCGUZlTQyyaCS73n3SHT1
	qbx3qeXNBgSVGGqXtXfoRjCfa4ypVwqKhMs6/2chQ2N/0ps0DzRrcW4LZcdpHClPEkyx4858/YhHB
	PvrNvszEBy9Ii03Tg2PZ8mxb2EPcZVgPvGu7pPQkkQqL1n3mE/AMA2o7Szt2ONQwLkehwYfQKJKTg
	mnLhk0LOZVQmheyKJIZCdkHeaL3ssa36LWALu/vywW+TjzDy1VSOx2DvJTqfX/K7wkDHwOY5Ck4M/
	ft5IzVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLM-0000000CfLJ-1Tdx;
	Fri, 14 Nov 2025 16:08:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLH-0000000CfFw-20Jj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QhOCvazbjdj4Stesw99gc0Yuwdb3B/fEsYl0uuL1k5Q=; b=lUe0r85HafwGtdno2AKB4HI3Yy
	z55Xbr4Kdf02+JuFGUXCCcY5cPw9ZQN2UMR2ZEJ39q7Z06fa3NbB+5yExnrjMTR5Th4jVtT3Ef1Tc
	9NMwMzJ4CUF6pv5eAkc9idu7yd1tJx3BsF9CoYhvZ/hQhEJs0o8fhc+yqj3K69t4SpdqovibRp9cH
	VZx5dzmnIh1/3ftnECyqQfuodGPvuJHIRut+waiefI2ls5r0qpePFVfsuGUwVpegJSS4uILAaoWwh
	Gxfu/cfd6d86E8Xy878CFwGNQXdScFLo9YYXFfC803AGhcqR4DnvxuwPnMc++vY8oMRwKqUcuK2yP
	d5g6vqpA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTY-00000002vPx-2Hr0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:12:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FDE71AC1;
	Fri, 14 Nov 2025 08:07:54 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F733F5A1;
	Fri, 14 Nov 2025 08:07:59 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH v6 11/35] KVM: arm64: Add SPE VCPU device attribute to set the interrupt number
Date: Fri, 14 Nov 2025 16:06:52 +0000
Message-ID: <20251114160717.163230-12-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151236_920397_B6254DA0 
X-CRM114-Status: GOOD (  17.08  )
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

From: Sudeep Holla <sudeep.holla@arm.com>

Add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_IRQ) to allow the user to set
the interrupt number for the buffer management interrupt.

[ Alexandru E: Split from "KVM: arm64: Add a new VCPU device control group
               for SPE" ]

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/devices/vcpu.rst | 22 +++++++
 arch/arm64/include/asm/kvm_host.h       |  2 +
 arch/arm64/include/asm/kvm_spe.h        | 10 +++
 arch/arm64/include/uapi/asm/kvm.h       |  1 +
 arch/arm64/kvm/guest.c                  |  2 +
 arch/arm64/kvm/spe.c                    | 82 +++++++++++++++++++++++++
 6 files changed, 119 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 8c5208ccd107..9a26252d0a34 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -296,3 +296,25 @@ From the destination VMM process:
 ===============================
 
 :Architectures: ARM64
+
+5.1 ATTRIBUTE: KVM_ARM_VCPU_SPE_IRQ
+-----------------------------------
+
+:Parameters: in kvm_device_attr.addr the address for the Profiling Buffer
+             management interrupt number as a pointer to an int
+
+Returns:
+
+	 =======  ==========================================================
+	 -EFAULT  Error accessing the buffer management interrupt number
+	 -EINVAL  Invalid interrupt number or not using an in-kernel irqchip
+	 -ENODEV  KVM_ARM_VCPU_HAS_SPE VCPU feature not set
+	 -ENXIO   SPE not supported or not properly configured
+	 =======  ==========================================================
+
+Required.
+
+Specifies the Profiling Buffer management interrupt number. The interrupt number
+must be a PPI and the interrupt number must be the same for each VCPU. Arm
+recommends 21 as the interrupt number. SPE virtualization requires an in-kernel
+vGIC implementation.
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 64302c438355..bc7aeae39fb9 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -27,6 +27,7 @@
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_spe.h>
 #include <asm/vncr_mapping.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
@@ -865,6 +866,7 @@ struct kvm_vcpu_arch {
 	struct vgic_cpu vgic_cpu;
 	struct arch_timer_cpu timer_cpu;
 	struct kvm_pmu pmu;
+	struct kvm_vcpu_spe vcpu_spe;
 
 	/* vcpu power state */
 	struct kvm_mp_state mp_state;
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 7c8268f6f507..6855976b4c72 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -6,7 +6,14 @@
 #ifndef __ARM64_KVM_SPE_H__
 #define __ARM64_KVM_SPE_H__
 
+#include <linux/kvm.h>
+
 #ifdef CONFIG_KVM_ARM_SPE
+
+struct kvm_vcpu_spe {
+	int irq_num;		/* Buffer management interrupt number */
+};
+
 DECLARE_STATIC_KEY_FALSE(kvm_spe_available);
 
 static __always_inline bool kvm_supports_spe(void)
@@ -21,6 +28,9 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 #else
+struct kvm_vcpu_spe {
+};
+
 #define kvm_supports_spe()	false
 #define vcpu_has_spe(vcpu)	false
 
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 5e2d47572136..578a0f6c3f8f 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -445,6 +445,7 @@ enum {
 #define KVM_ARM_VCPU_PVTIME_CTRL	2
 #define   KVM_ARM_VCPU_PVTIME_IPA	0
 #define KVM_ARM_VCPU_SPE_CTRL		3
+#define   KVM_ARM_VCPU_SPE_IRQ		0
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_VCPU2_SHIFT		28
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index d1bf8b154a31..fbc17a71edc3 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -920,7 +920,9 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_SPE_CTRL:
+		mutex_lock(&vcpu->kvm->arch.config_lock);
 		ret = kvm_spe_set_attr(vcpu, attr);
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
 		break;
 	default:
 		ret = -ENXIO;
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 4d635e881620..c6b81a2ef71f 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -41,17 +41,99 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
 		static_branch_enable(&kvm_spe_available);
 }
 
+static bool kvm_spe_irq_is_valid(struct kvm *kvm, int irq)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_spe *vcpu_spe;
+	unsigned long i;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		vcpu_spe = &vcpu->arch.vcpu_spe;
+
+		if (!vcpu_spe->irq_num)
+			continue;
+
+		if (vcpu_spe->irq_num != irq)
+			return false;
+	}
+
+	return true;
+}
+
 int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+	struct kvm *kvm = vcpu->kvm;
+
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	if (!vcpu_has_spe(vcpu))
+		return -ENODEV;
+
+	switch (attr->attr) {
+	case KVM_ARM_VCPU_SPE_IRQ: {
+		int __user *uaddr = (int __user *)(long)attr->addr;
+		int irq;
+
+		if (!irqchip_in_kernel(kvm))
+			return -EINVAL;
+
+		if (get_user(irq, uaddr))
+			return -EFAULT;
+
+		if (!irq_is_ppi(irq))
+			return -EINVAL;
+
+		if (!kvm_spe_irq_is_valid(kvm, irq))
+			return -EINVAL;
+
+		vcpu_spe->irq_num = irq;
+		return 0;
+	}
+	}
+
 	return -ENXIO;
 }
 
 int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!vcpu_has_spe(vcpu))
+		return -ENODEV;
+
+	switch (attr->attr) {
+	case KVM_ARM_VCPU_SPE_IRQ: {
+		int __user *uaddr = (int __user *)(long)attr->addr;
+		int irq;
+
+		if (!irqchip_in_kernel(kvm))
+			return -EINVAL;
+
+		if (!vcpu_spe->irq_num)
+			return -ENXIO;
+
+		irq = vcpu_spe->irq_num;
+		if (put_user(irq, uaddr))
+			return -EFAULT;
+
+		return 0;
+	}
+	}
+
 	return -ENXIO;
 }
 
 int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
+	if (!vcpu_has_spe(vcpu))
+		return -ENODEV;
+
+	switch(attr->attr) {
+	case KVM_ARM_VCPU_SPE_IRQ:
+		return 0;
+	}
+
 	return -ENXIO;
 }
-- 
2.51.2


