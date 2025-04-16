Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODpU5P/1BL0SwKVTx47XnEt9xyAB8XHxXBqM1t+8BpA=; b=4qMU7BWu5Na1XRi5SobMHHxHK0
	DoMJP0AlFg0XxmhK5VDZiukuydT/MtwmZHRenu8pC5s37v41RRm6G0HLuShwiPIIEUSmc8+AxO1M5
	iepzsLAypcXJDvStTIHBcZ40aPbfddDOrQ8cTC179mO+4YTGT5fLkMi2ZQrUCV1Othxd86y9VjPFP
	mpPAWKSWJpwt7yi7XRf0eTZeobtsQIJGjFxSoMFcQwi3k+HGrN3gEQSVSpCH0tcgWAcMWEhNvMrsC
	OSknDN1fnWYcpDI7Xw5oi5K/7OmolmmcDvJ5h60LFPnJ3jDPK5J6rsnx8bvkyzIcyVbh+iOyMZWvZ
	VokqDbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53Fp-00000009kqW-0zH4;
	Wed, 16 Apr 2025 13:56:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u533V-00000009hPt-0ln2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:43:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B1E1692;
	Wed, 16 Apr 2025 06:43:51 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.90.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54AA03F59E;
	Wed, 16 Apr 2025 06:43:49 -0700 (PDT)
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
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [PATCH v8 06/43] arm64: RME: Define the user ABI
Date: Wed, 16 Apr 2025 14:41:28 +0100
Message-ID: <20250416134208.383984-7-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416134208.383984-1-steven.price@arm.com>
References: <20250416134208.383984-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_064357_322706_36755678 
X-CRM114-Status: GOOD (  21.23  )
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
---
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
 Documentation/virt/kvm/api.rst    | 70 +++++++++++++++++++++++++++++++
 arch/arm64/include/uapi/asm/kvm.h | 49 ++++++++++++++++++++++
 include/uapi/linux/kvm.h          | 10 +++++
 3 files changed, 129 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1f8625b7646a..99ba6c82cf37 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3527,6 +3527,11 @@ Possible features:
 	      - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
 	        no longer be written using KVM_SET_ONE_REG.
 
+	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
+	  VCPU. This must be specified on all VCPUs created in a Realm VM.
+	  Depends on KVM_CAP_ARM_RME.
+	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
@@ -5098,6 +5103,7 @@ Recognised values for feature:
 
   =====      ===========================================
   arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
+  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
   =====      ===========================================
 
 Finalizes the configuration of the specified vcpu feature.
@@ -6452,6 +6458,30 @@ the capability to be present.
 
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
 
@@ -8280,6 +8310,46 @@ aforementioned registers before the first KVM_RUN. These registers are VM
 scoped, meaning that the same set of values are presented on all vCPUs in a
 given VM.
 
+7.38 KVM_CAP_ARM_RME
+--------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: args[0] provides an action, args[1] points to a structure in
+	     memory for some actions.
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
+ KVM_CAP_ARM_RME_CREATE_REALM     Request the RMM create the realm. The realm's
+                                  configuration parameters must be set first.
+
+ KVM_CAP_ARM_RME_INIT_RIPAS_REALM Takes struct arm_rme_init_ripas as args[1]
+                                  and sets the RIPAS (Realm IPA State) to
+                                  RIPAS_RAM of a specified area of the realm's
+                                  IPA.
+
+ KVM_CAP_ARM_RME_POPULATE_REALM   Takes struct arm_rme_init_ripas as args[1]
+                                  and populates a region of protected address
+                                  space by copying the data from the shared
+                                  alias.
+
+ KVM_CAP_ARM_RME_ACTIVATE_REALM   Request the RMM activate the realm. No
+                                  further changes can be made to the realm's
+                                  configuration, and VCPUs are not permitted to
+                                  enter the realm until it has been activated.
+================================= =============================================
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index af9d9acaf997..b57712880605 100644
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
+#define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA256		0
+#define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA512		1
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
 #define   KVM_ARM_VCPU_PMU_V3_IRQ	0
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b6ae8ad8934b..0b8479985581 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -930,6 +930,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_RME 240
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1582,4 +1583,13 @@ struct kvm_pre_fault_memory {
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


