Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D73C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/ini8kD3nUA59uqM+gLbebyJCrK6MqYkhfyFWWkqvw=; b=Ucfoq2RakWBZI+jhu3WLlMVpw3
	qFO6idBDQAs5O6ig0PU8RjbVA4zsJdPMEpI6aHeT7oaKbY0U1sCT9TtEyke7/YObaNFMC0bylVEz9
	6pmOBVpzFSSB3tzNrxFindEF/UfOZUuUayt6YikhiMlWzzKStK6a4IT+SPcoRZJygBmsfjvkLab2H
	gheO17QNbaO8Gl18QaSHpzJOnjhBd0cRUJIaQ+Q9Jmm4bgMeXJWlHbW/+tqaJ4Ac571HYEdP9XUN8
	Db+qwQnYSHilaWY3UiGtpJjyQd/8Kd81Jv7HPGSRiLWndbAwsGCBlCqGoTL23sMEeSEXhDq5bFDrg
	H84kdujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xv-000000005Nu-0IW2;
	Thu, 03 Sep 2026 16:07:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xt-000000005KH-069M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5C721D34;
	Thu,  3 Sep 2026 09:06:56 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D7263F673;
	Thu,  3 Sep 2026 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451620; bh=pNq9nTMAIPUQA4Ji23znNHSvdazZ4B9jcKnv+m2hL5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yd0GizvdJjcm00m4lpd0BAAb75vEoWq3r/pg6H5tv9ExlvBYQFmJOmVgZCnjnFlnb
	 WwkOyhcxkQxcQqG/Fz5LRXp9Ev+Cbsvvp/rdycgzNBtIvvVx55JGPQ3Ua1ut+gdrGB
	 XtBfUByPHK2B/9S/B5u7YxF3G+5zm2wm04tkszy8=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH v7 12/28] KVM: arm64: Add SPE VCPU device attribute to set the interrupt number
Date: Thu,  3 Sep 2026 17:06:07 +0100
Message-ID: <20260903160623.315525-13-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090701_156261_FBBADC6D 
X-CRM114-Status: GOOD (  18.01  )
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
 arch/arm64/include/asm/kvm_spe.h        | 11 ++++
 arch/arm64/include/uapi/asm/kvm.h       |  1 +
 arch/arm64/kvm/guest.c                  |  2 +
 arch/arm64/kvm/spe.c                    | 82 +++++++++++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index e0a7fa35dfd2..d30b2f7fec9a 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -307,3 +307,25 @@ From the destination VMM process:
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
index 27fe0cd5b2d7..e7332bd82bf3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -27,6 +27,7 @@
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
+#include <asm/kvm_spe.h>
 #include <asm/vncr_mapping.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
@@ -918,6 +919,7 @@ struct kvm_vcpu_arch {
 	struct vgic_cpu vgic_cpu;
 	struct arch_timer_cpu timer_cpu;
 	struct kvm_pmu pmu;
+	struct kvm_vcpu_spe vcpu_spe;
 
 	/* vcpu power state */
 	struct kvm_mp_state mp_state;
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 1327064d0984..8ded2d821bff 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -6,7 +6,15 @@
 #ifndef __ARM64_KVM_SPE_H__
 #define __ARM64_KVM_SPE_H__
 
+struct kvm;
+struct kvm_vcpu;
+struct kvm_device_attr;
+
 #ifdef CONFIG_KVM_ARM_SPE
+struct kvm_vcpu_spe {
+	int irq_num;		/* Buffer management interrupt number */
+};
+
 bool kvm_supports_spe(void);
 
 #define vcpu_has_spe(vcpu)					\
@@ -16,6 +24,9 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 #else
+struct kvm_vcpu_spe {
+};
+
 static __always_inline bool kvm_supports_spe(void)
 {
 	return false;
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index e8a68e34be63..b9e5019181eb 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -447,6 +447,7 @@ enum {
 #define KVM_ARM_VCPU_PVTIME_CTRL	2
 #define   KVM_ARM_VCPU_PVTIME_IPA	0
 #define KVM_ARM_VCPU_SPE_CTRL		3
+#define   KVM_ARM_VCPU_SPE_IRQ		0
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_VCPU2_SHIFT		28
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 56c5f937fcdb..f953b235b458 100644
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
index fe45ad4c703a..dd5f80318ba4 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -59,17 +59,99 @@ bool kvm_supports_spe(void)
 	return !list_empty(&spe_pmus);
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
+		if (!irq_is_ppi(kvm, irq))
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
2.43.0


