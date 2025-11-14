Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080B9CE8D50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=607Ts+/RSqtIZCBU9CYH9/Iewbt/XEi9rdCF8TnrEIs=; b=hFFDomvMJGm5mbkthitDu7VBuz
	92g8ety0y0QZWjJoj7cRfJdzWTD23b8X5ABcpXncL2l+niw2rwzk/lnAhvtJMeIq0xAO8vzhJJ9Ez
	vfGK4STPBITueA/KWY5lv/Bs6CnJe2u4vBfnw5tiqt3k/cd57fh+8pJilIAlLmMdxAC+Vnaqd2kNn
	AMLA5WE1gq0HjUJDr4m0XhV4MFSQq4RnxnleqMYLQ7PY4vAjNEyZbpah/KB8E8V0b+28ryQbVvJmI
	FAqriRVCRJBkgLcA3EeOHMehNVbU8c9AzU9k3B5lOA+hf8P6UVa7Yo0HoEhiSx/I4tcSyzQPz2+BC
	wqI2B7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLL-0000000CfKF-2nNZ;
	Fri, 14 Nov 2025 16:08:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLD-0000000CfAw-1yqz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=607Ts+/RSqtIZCBU9CYH9/Iewbt/XEi9rdCF8TnrEIs=; b=Dgc6IgRxiAQ0iQ9/t9obwAWaQH
	KnSv84dgafoLdkLrSRcdUV6laKQ7oFusF77BACewbbP5v8prWjUknfjy+j2xD1lKU0NAKhhZidDXr
	BDVcrRTYUVSfiK9vJ3z+YSm6zwPc9oZ+yqUhserudkQW9cpCZyJCG9Tjxs2Q5pJ62gxaOfDTqft19
	kOPHZZDDWRBkomzVa2rHGWvlzeMlwy0pTVoxoPTDijv3WB/i8ZTdpAw3+EUPgggd0qtTxy3xFnkiO
	9H+P0A30jhmvRbChFi6VlVb9XryyAfbQhI2lmhVQayoErC6Qv6x6TLtyAkKH07udeTAfp/G2350GS
	HqSwonFQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTV-00000002vOv-2aUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:12:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72DB1BC0;
	Fri, 14 Nov 2025 08:07:51 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4272A3F73B;
	Fri, 14 Nov 2025 08:07:57 -0800 (PST)
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
Subject: [RFC PATCH v6 10/35] KVM: arm64: Add a new VCPU device control group for SPE
Date: Fri, 14 Nov 2025 16:06:51 +0000
Message-ID: <20251114160717.163230-11-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151234_252706_596DA6A3 
X-CRM114-Status: GOOD (  10.51  )
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

Add a new VCPU device control group to control various aspects of KVM's SPE
emulation. Functionality will be added in later patches.

[ Alexandru E: Major rework ]

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/devices/vcpu.rst |  5 +++++
 arch/arm64/include/asm/kvm_spe.h        | 17 +++++++++++++++++
 arch/arm64/include/uapi/asm/kvm.h       |  1 +
 arch/arm64/kvm/guest.c                  | 10 ++++++++++
 arch/arm64/kvm/spe.c                    | 15 +++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 60bf205cb373..8c5208ccd107 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -291,3 +291,8 @@ From the destination VMM process:
 
 7. Write the KVM_VCPU_TSC_OFFSET attribute for every vCPU with the
    respective value derived in the previous step.
+
+5. GROUP: KVM_ARM_VCPU_SPE_CTRL
+===============================
+
+:Architectures: ARM64
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 8e8a5c6f7971..7c8268f6f507 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -16,9 +16,26 @@ static __always_inline bool kvm_supports_spe(void)
 
 #define vcpu_has_spe(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
+
+int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
+int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
+int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
 #else
 #define kvm_supports_spe()	false
 #define vcpu_has_spe(vcpu)	false
+
+static inline int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
+static inline int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
+static inline int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 5bdfe1f6d565..5e2d47572136 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -444,6 +444,7 @@ enum {
 #define   KVM_ARM_VCPU_TIMER_IRQ_HPTIMER	3
 #define KVM_ARM_VCPU_PVTIME_CTRL	2
 #define   KVM_ARM_VCPU_PVTIME_IPA	0
+#define KVM_ARM_VCPU_SPE_CTRL		3
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_VCPU2_SHIFT		28
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 1c87699fd886..d1bf8b154a31 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -25,6 +25,7 @@
 #include <asm/kvm.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_nested.h>
+#include <asm/kvm_spe.h>
 #include <asm/sigcontext.h>
 
 #include "trace.h"
@@ -918,6 +919,9 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 	case KVM_ARM_VCPU_PVTIME_CTRL:
 		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
 		break;
+	case KVM_ARM_VCPU_SPE_CTRL:
+		ret = kvm_spe_set_attr(vcpu, attr);
+		break;
 	default:
 		ret = -ENXIO;
 		break;
@@ -941,6 +945,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 	case KVM_ARM_VCPU_PVTIME_CTRL:
 		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
 		break;
+	case KVM_ARM_VCPU_SPE_CTRL:
+		ret = kvm_spe_get_attr(vcpu, attr);
+		break;
 	default:
 		ret = -ENXIO;
 		break;
@@ -964,6 +971,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 	case KVM_ARM_VCPU_PVTIME_CTRL:
 		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
 		break;
+	case KVM_ARM_VCPU_SPE_CTRL:
+		ret = kvm_spe_has_attr(vcpu, attr);
+		break;
 	default:
 		ret = -ENXIO;
 		break;
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 101258b55053..4d635e881620 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -40,3 +40,18 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
 	if (list_is_singular(&arm_spus))
 		static_branch_enable(&kvm_spe_available);
 }
+
+int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
+
+int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
+
+int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
+{
+	return -ENXIO;
+}
-- 
2.51.2


