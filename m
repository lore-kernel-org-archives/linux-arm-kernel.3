Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms+eZ9VYXM6V7Boi5mdckWNHFOqVBHK0EgCJAB399g8=; b=Ef+Hxx+4UvY3+ySoxWb5LzrlXo
	S+SYg0NOvFCEuJ3iAOv0h/dU/PXmDURu+dTfHzJI+5OZr23HSnq9XGUb1lc8JRPqXDD6iKYeflJO/
	Uc5Gz1fkntBVe3O9+RvfVnNCS7cm2C+Ya8eBm4T/Bzc4wXvMCKPat4fc4EQjurAhRrZDSawyV/F0r
	aAfCK8EkeNyW8f2htuwArlYKAZdGO0OKGVs891qkfJpvq78JxRdz8keOhyurWtw0CrUVocuoqlrsl
	GAWYJZG3qiQwoypeAdWqrnaKKFhA9EdgImQDltBlAFe/tdBVIQ75MqHHlAIw9ckVk8nLojBFLy0ab
	25dLYuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uom4U-0000000ESCD-0ZZ4;
	Wed, 20 Aug 2025 16:53:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokFv-0000000EAEE-3DN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:57:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3A511D31;
	Wed, 20 Aug 2025 07:57:30 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.2.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652673F738;
	Wed, 20 Aug 2025 07:57:34 -0700 (PDT)
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
Subject: [PATCH v10 06/43] arm64: RME: Define the user ABI
Date: Wed, 20 Aug 2025 15:55:26 +0100
Message-ID: <20250820145606.180644-7-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
References: <20250820145606.180644-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075739_881329_217AD009 
X-CRM114-Status: GOOD (  21.55  )
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

There is one (multiplexed) CAP which can be used to create, populate and
then activate the realm.

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v9:
 * Improvements to documentation.
 * Bump the magic number for KVM_CAP_ARM_RME to avoid conflicts.
Changes since v8:
 * Minor improvements to documentation following review.
 * Bump the magic numbers to avoid conflicts.
Changes since v7:
 * Add documentation of new ioctls
 * Bump the magic numbers to avoid conflicts
Changes since v6:
 * Rename some of the symbols to make their usage clearer and avoid
   repetition.
Changes from v5:
 * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
   KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
---
 Documentation/virt/kvm/api.rst    | 71 +++++++++++++++++++++++++++++++
 arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++
 include/uapi/linux/kvm.h          | 10 +++++
 3 files changed, 130 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 6aa40ee05a4a..69c0a9eba6c5 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3549,6 +3549,11 @@ Possible features:
 	  Depends on KVM_CAP_ARM_EL2_E2H0.
 	  KVM_ARM_VCPU_HAS_EL2 must also be set.
 
+	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
+	  VCPU. This must be specified on all VCPUs created in a Realm VM.
+	  Depends on KVM_CAP_ARM_RME.
+	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
@@ -5122,6 +5127,7 @@ Recognised values for feature:
 
   =====      ===========================================
   arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
+  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
   =====      ===========================================
 
 Finalizes the configuration of the specified vcpu feature.
@@ -6476,6 +6482,30 @@ the capability to be present.
 
 `flags` must currently be zero.
 
+4.144 KVM_ARM_VCPU_RMM_PSCI_COMPLETE
+------------------------------------
+
+:Capability: KVM_CAP_ARM_RME
+:Architectures: arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_arm_rmm_psci_complete (in)
+:Returns: 0 if successful, < 0 on error
+
+::
+
+  struct kvm_arm_rmm_psci_complete {
+	__u64 target_mpidr;
+	__u32 psci_status;
+	__u32 padding[3];
+  };
+
+Where PSCI functions are handled by user space, the RMM needs to be informed of
+the target of the operation using `target_mpidr`, along with the status
+(`psci_status`). The RMM v1.0 specification defines two functions that require
+this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
+
+If the kernel is handling PSCI then this is done automatically and the VMM
+doesn't need to call this ioctl.
 
 .. _kvm_run:
 
@@ -8662,6 +8692,47 @@ This capability indicate to the userspace whether a PFNMAP memory region
 can be safely mapped as cacheable. This relies on the presence of
 force write back (FWB) feature support on the hardware.
 
+7.44 KVM_CAP_ARM_RME
+--------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: args[0] provides an action, args[1] points to a structure in
+             memory for the action.
+:Returns: 0 on success, negative value on error
+
+Used to configure and set up the memory for a Realm. The available actions are:
+
+================================= =============================================
+ KVM_CAP_ARM_RME_CONFIG_REALM     Takes struct arm_rme_config as args[1] and
+                                  configures realm parameters prior to it being
+                                  created.
+
+                                  Options are ARM_RME_CONFIG_RPV to set the
+                                  "Realm Personalization Value" and
+                                  ARM_RME_CONFIG_HASH_ALGO to set the hash
+                                  algorithm.
+
+ KVM_CAP_ARM_RME_CREATE_REALM     Request the RMM to create the realm. The
+                                  realm's configuration parameters must be set
+                                  first.
+
+ KVM_CAP_ARM_RME_INIT_RIPAS_REALM Takes struct arm_rme_init_ripas as args[1]
+                                  and sets the RIPAS (Realm IPA State) to
+                                  RIPAS_RAM of a specified area of the realm's
+                                  IPA.
+
+ KVM_CAP_ARM_RME_POPULATE_REALM   Takes struct arm_rme_populate_realm as
+                                  args[1] and populates a region of protected
+                                  address space by copying the data from the
+                                  shared alias.
+
+ KVM_CAP_ARM_RME_ACTIVATE_REALM   Request the RMM to activate the realm. No
+                                  changes can be made to the Realm's populated
+                                  memory, IPA state, configuration parameters
+                                  or vCPU additions after this step.
+================================= =============================================
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index ed5f3892674c..9b5d67ecbc5e 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
+#define KVM_ARM_VCPU_REC		9 /* VCPU REC state as part of Realm */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -429,6 +430,54 @@ enum {
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
 #define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
+/* KVM_CAP_ARM_RME on VM fd */
+#define KVM_CAP_ARM_RME_CONFIG_REALM		0
+#define KVM_CAP_ARM_RME_CREATE_REALM		1
+#define KVM_CAP_ARM_RME_INIT_RIPAS_REALM	2
+#define KVM_CAP_ARM_RME_POPULATE_REALM		3
+#define KVM_CAP_ARM_RME_ACTIVATE_REALM		4
+
+/* List of configuration items accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
+#define ARM_RME_CONFIG_RPV			0
+#define ARM_RME_CONFIG_HASH_ALGO		1
+
+#define ARM_RME_CONFIG_HASH_ALGO_SHA256		0
+#define ARM_RME_CONFIG_HASH_ALGO_SHA512		1
+
+#define ARM_RME_CONFIG_RPV_SIZE 64
+
+struct arm_rme_config {
+	__u32 cfg;
+	union {
+		/* cfg == ARM_RME_CONFIG_RPV */
+		struct {
+			__u8	rpv[ARM_RME_CONFIG_RPV_SIZE];
+		};
+
+		/* cfg == ARM_RME_CONFIG_HASH_ALGO */
+		struct {
+			__u32	hash_algo;
+		};
+
+		/* Fix the size of the union */
+		__u8	reserved[256];
+	};
+};
+
+#define KVM_ARM_RME_POPULATE_FLAGS_MEASURE	(1 << 0)
+struct arm_rme_populate_realm {
+	__u64 base;
+	__u64 size;
+	__u32 flags;
+	__u32 reserved[3];
+};
+
+struct arm_rme_init_ripas {
+	__u64 base;
+	__u64 size;
+	__u64 reserved[2];
+};
+
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
 #define   KVM_ARM_VCPU_PMU_V3_IRQ		0
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index f0f0d49d2544..7dafb443368a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -962,6 +962,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
+#define KVM_CAP_ARM_RME 244
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1614,4 +1615,13 @@ struct kvm_pre_fault_memory {
 	__u64 padding[5];
 };
 
+/* Available with KVM_CAP_ARM_RME, only for VMs with KVM_VM_TYPE_ARM_REALM  */
+struct kvm_arm_rmm_psci_complete {
+	__u64 target_mpidr;
+	__u32 psci_status;
+	__u32 padding[3];
+};
+
+#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE	_IOW(KVMIO, 0xd6, struct kvm_arm_rmm_psci_complete)
+
 #endif /* __LINUX_KVM_H */
-- 
2.43.0


