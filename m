Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A8CFA763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSG5z7NezWuc0avnwC5SfAzocygjZiNaU3gOAAGSw08=; b=15VthgzL8iBeq91YgMo3ml4isa
	3i9hXxdiRIcCMTMeRYjwXEqn21UiW0scnaWy95Itxc6qLnvCrtRmZ03PTOPsbM8F7nhaMPgGe9g9Z
	LFyUuuuvxF8KHdBiPSwH8/r4KiM7SAbO2Kkzjmh9kgJnSCZUab0e0ogMIxNfFCXWIrWlhW2iG16SK
	0jD34uh+1r3ZaLkQIkgrT1zWK+K3A1vio6sUsRlhotxwfGyRjDO5pvn8JGWtB3cUIpRpm8l22c0IY
	GwiAvY7+Ehv1c5OlZc9hFn2cAOyPXUXwUafOKwR6fzPfEE06NKtHbI5lN733DxFCSLlXFLzY6ltRW
	GXoE1V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNN6-000000088nJ-00lH;
	Fri, 21 Nov 2025 09:24:04 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMw-000000088hm-46AG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:23:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XSG5z7NezWuc0avnwC5SfAzocygjZiNaU3gOAAGSw08=;
	b=NHtZg8euW9umBzAFbKKuTno6mueSgWMgcjgqSAsN4SNFgEVkFhh4PxkGHnIKfJeAg7qbhyoF9
	mdq2Vr/FDTfM3qWwOvHcfhj+KrtHIaoYNlT15NFg4wTOtz/UYcn3urnXMWOt2qcjXEUhzu7ww7M
	a46AtZbRptp5H2obWVOpDDI=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dCV941023zLlSZ;
	Fri, 21 Nov 2025 17:22:00 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id B76CB140295;
	Fri, 21 Nov 2025 17:23:44 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Nov
 2025 17:23:44 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <zhengtian10@huawei.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v2 3/5] KVM: arm64: Add support for FEAT_HDBSS
Date: Fri, 21 Nov 2025 17:23:40 +0800
Message-ID: <20251121092342.3393318-4-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251121092342.3393318-1-zhengtian10@huawei.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012355_334214_6B78AF53 
X-CRM114-Status: GOOD (  16.99  )
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

From: eillon <yezhenyu2@huawei.com>

Armv9.5 introduces the Hardware Dirty Bit State Structure (HDBSS) feature,
indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100.

Add the Kconfig for FEAT_HDBSS and support detecting and enabling the
feature. A CPU capability is added to notify the user of the feature.

Add KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl and basic framework for
ARM64 HDBSS support. Since the HDBSS buffer size is configurable and
cannot be determined at KVM initialization, an IOCTL interface is
required.

Actually exposing the new capability to user space happens in a later
patch.

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/Kconfig                  | 14 ++++++++++++++
 arch/arm64/include/asm/cpucaps.h    |  2 ++
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/include/asm/kvm_host.h   |  4 ++++
 arch/arm64/include/asm/sysreg.h     | 12 ++++++++++++
 arch/arm64/kernel/cpufeature.c      |  9 +++++++++
 arch/arm64/tools/cpucaps            |  1 +
 include/uapi/linux/kvm.h            |  1 +
 tools/include/uapi/linux/kvm.h      |  1 +
 9 files changed, 49 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..1edf75888a09 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2201,6 +2201,20 @@ config ARM64_GCS

 endmenu # "ARMv9.4 architectural features"

+menu "ARMv9.5 architectural features"
+
+config ARM64_HDBSS
+	bool "Enable support for Hardware Dirty state tracking Structure (HDBSS)"
+	help
+	  Hardware Dirty state tracking Structure(HDBSS) enhances tracking
+	  translation table descriptors' dirty state to reduce the cost of
+	  surveying for dirtied granules.
+
+	  The feature introduces new assembly registers (HDBSSBR_EL2 and
+	  HDBSSPROD_EL2), which are accessed via generated register accessors.
+
+endmenu # "ARMv9.5 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 9d769291a306..5e5a26f28dec 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -48,6 +48,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_GCS);
 	case ARM64_HAFT:
 		return IS_ENABLED(CONFIG_ARM64_HAFT);
+	case ARM64_HAS_HDBSS:
+		return IS_ENABLED(CONFIG_ARM64_HDBSS);
 	case ARM64_UNMAP_KERNEL_AT_EL0:
 		return IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0);
 	case ARM64_WORKAROUND_843419:
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e223cbf350e4..b231415a2b76 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
 	return cpus_have_final_cap(ARM64_HAFT);
 }

+static inline bool system_supports_hdbss(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_HDBSS);
+}
+
 static __always_inline bool system_supports_mpam(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MPAM);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 64302c438355..d962932f0e5f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -60,6 +60,10 @@

 #define KVM_HAVE_MMU_RWLOCK

+/* HDBSS entry field definitions */
+#define HDBSS_ENTRY_VALID BIT(0)
+#define HDBSS_ENTRY_IPA GENMASK_ULL(55, 12)
+
 /*
  * Mode of operation configurable with kvm-arm.mode early param.
  * See Documentation/admin-guide/kernel-parameters.txt for more information.
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index c231d2a3e515..3511edea1fbc 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1129,6 +1129,18 @@
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)

+/*
+ * Definitions for the HDBSS feature
+ */
+#define HDBSS_MAX_SIZE		HDBSSBR_EL2_SZ_2MB
+
+#define HDBSSBR_EL2(baddr, sz)	(((baddr) & GENMASK(55, 12 + sz)) | \
+				 FIELD_PREP(HDBSSBR_EL2_SZ_MASK, sz))
+#define HDBSSBR_BADDR(br)	((br) & GENMASK(55, (12 + HDBSSBR_SZ(br))))
+#define HDBSSBR_SZ(br)		FIELD_GET(HDBSSBR_EL2_SZ_MASK, br)
+
+#define HDBSSPROD_IDX(prod)	FIELD_GET(HDBSSPROD_EL2_INDEX_MASK, prod)
+
 #define ARM64_FEATURE_FIELD_BITS	4

 #ifdef __ASSEMBLY__
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e25b0f84a22d..f39973b68bdb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2710,6 +2710,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
 	},
+#endif
+#ifdef CONFIG_ARM64_HDBSS
+	{
+		.desc = "Hardware Dirty state tracking structure (HDBSS)",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HDBSS,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
+	},
 #endif
 	{
 		.desc = "CRC32 instructions",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1b32c1232d28..4be19bb4543e 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -64,6 +64,7 @@ HAS_TLB_RANGE
 HAS_VA52
 HAS_VIRT_HOST_EXTN
 HAS_WFXT
+HAS_HDBSS
 HAFT
 HW_DBM
 KVM_HVHE
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 52f6000ab020..59340189afac 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -963,6 +963,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
+#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 245

 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 52f6000ab020..59340189afac 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -963,6 +963,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
+#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 245

 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
--
2.33.0


