Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28C8103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lrh2wrl7WfT6cli4lMFBTU+EKp/gl0XsVHde/Ui2vTQ=; b=LbLk9C3cCFbXpkdvaJMCPHiOVr
	XjQ2DdN9y+pU0Ed5eTlrqNWJPJsO3voTR0DDh3Odoy/EvG8d1szVPYSbhHIPUZbvSPR8pA6VwNLaK
	gpKA7bOPSl4X0ytwieh9Lo94mssPUuiD9slEr3Hsr2maw2HOkfdP+oNUjxarpPPDBacNmTVQeRzkb
	09Kwonzvd5+TeE9L8qwvGk5rf0EPtzLQA3JOiq3kMckQ78o0V7GGdveAHjxDessw4SZCQScjkf+Hp
	EQ7wjzozje6KZRYFc45vz4cEnbjd2KUZGkkzTmScndKS9ygDFLim2giAPITreRskeRI8U2hD8PZv4
	HsVqauFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEw-00000008odd-2jci;
	Wed, 18 Mar 2026 15:55:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEk-00000008oTs-1Et2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Lrh2wrl7WfT6cli4lMFBTU+EKp/gl0XsVHde/Ui2vTQ=; b=Iu4fYA3gRfJu/qpCTsRztKJ2Ql
	7kwtxdU8O3T6njqiu7j1ZgUAm6tk3N/78DhiWEYFhCiNbngfc3XJbpf/Lswz0sXWV221lzFZXxNiF
	a8lHBtrY/+Mn6GHNii1cqnRE9wu/2V6/8ot0LJAlF3IobawNtRYngd/k9G/9r6OWW6JusZmx0jZCr
	EptPUiVlAvgibiFiQwuaW7FJl+BgyeCFjoOaNm+bTMwvCWeSDeL3iSiaoTS47+W3veBrh24MSkxpc
	AZObKJDgk9RWb6NMQT2lpuUAKzVX0yjK0ZBeCmKVhdyQRyEmYlkm36H5OLESZOcreg9lhYDr758tR
	Om4cppjg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEg-0000000BdRE-3t1b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:55:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8FA82008;
	Wed, 18 Mar 2026 08:54:59 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40CA83F73B;
	Wed, 18 Mar 2026 08:55:02 -0700 (PDT)
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
Subject: [PATCH v13 11/48] arm64: RMI: Define the user ABI
Date: Wed, 18 Mar 2026 15:53:35 +0000
Message-ID: <20260318155413.793430-12-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155507_294506_7A404EB0 
X-CRM114-Status: GOOD (  17.65  )
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

There is one CAP which identified the presence of CCA, and two ioctls.
One ioctl is used to populate memory and the other is used when user
space is providing the PSCI implementation to identify the target of the
operation.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v12:
 * Change KVM_ARM_RMI_POPULATE to update the structure with the amount
   that has been progressed rather than return the number of bytes
   populated.
 * Describe the flag KVM_ARM_RMI_POPULATE_FLAGS_MEASURE.
 * CAP number is bumped.
 * NOTE: The PSCI ioctl may be removed in a future spec release.
Changes since v11:
 * Completely reworked to be more implicit. Rather than having explicit
   CAP operations to progress the realm construction these operations
   are done when needed (on populating and on first vCPU run).
 * Populate and PSCI complete are promoted to proper ioctls.
Changes since v10:
 * Rename symbols from RME to RMI.
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
 Documentation/virt/kvm/api.rst | 65 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/kvm.h       | 22 ++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fc5736839edd..72a2ce96d1ba 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6553,6 +6553,62 @@ KVM_S390_KEYOP_SSKE
   Sets the storage key for the guest address ``guest_addr`` to the key
   specified in ``key``, returning the previous value in ``key``.
 
+4.145 KVM_ARM_VCPU_RMI_PSCI_COMPLETE
+------------------------------------
+
+:Capability: KVM_CAP_ARM_RMI
+:Architectures: arm64
+:Type: vcpu ioctl
+:Parameters: struct kvm_arm_rmi_psci_complete (in)
+:Returns: 0 if successful, < 0 on error
+
+::
+
+  struct kvm_arm_rmi_psci_complete {
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
+
+4.146 KVM_ARM_RMI_POPULATE
+--------------------------
+
+:Capability: KVM_CAP_ARM_RMI
+:Architectures: arm64
+:Type: vm ioctl
+:Parameters: struct kvm_arm_rmi_populate (in)
+:Returns: 0 on success, < 0 on error
+
+::
+
+  struct kvm_arm_rmi_populate {
+	__u64 base;
+	__u64 size;
+	__u64 source_uaddr;
+	__u32 flags;
+	__u32 reserved;
+  };
+
+Populate a region of protected address space by copying the data from the
+(non-protected) user space pointer provided into a protected region (backed by
+guestmem_fd). It implicitly sets the destination region to RIPAS RAM. This is
+only valid before any VCPUs have been run. The ioctl might not populate the
+entire region and updates the fields `base`, `size` and `source_uaddr`. User
+space may have to repeatedly call it until `size` is 0 to populate the entire
+region.
+
+`flags` can be set to `KVM_ARM_RMI_POPULATE_FLAGS_MEASURE` to request that the
+populated data is hashed and added to the guest's Realm Initial Measurement
+(RIM).
+
 .. _kvm_run:
 
 5. The kvm_run structure
@@ -8896,6 +8952,15 @@ helpful if user space wants to emulate instructions which are not
 This capability can be enabled dynamically even if VCPUs were already
 created and are running.
 
+7.47 KVM_CAP_ARM_RMI
+--------------------
+
+:Architectures: arm64
+:Target: VM
+:Parameters: None
+
+This capability indicates that support for CCA realms is available.
+
 8. Other capabilities.
 ======================
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 65500f5db379..6ec140ab0ed1 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -985,6 +985,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_SEA_TO_USER 245
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
+#define KVM_CAP_ARM_RMI 248
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1650,4 +1651,25 @@ struct kvm_pre_fault_memory {
 	__u64 padding[5];
 };
 
+/* Available with KVM_CAP_ARM_RMI, only for VMs with KVM_VM_TYPE_ARM_REALM  */
+#define KVM_ARM_VCPU_RMI_PSCI_COMPLETE	_IOW(KVMIO, 0xd6, struct kvm_arm_rmi_psci_complete)
+
+struct kvm_arm_rmi_psci_complete {
+	__u64 target_mpidr;
+	__u32 psci_status;
+	__u32 padding[3];
+};
+
+/* Available with KVM_CAP_ARM_RMI, only for VMs with KVM_VM_TYPE_ARM_REALM */
+#define KVM_ARM_RMI_POPULATE	_IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
+#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE	(1 << 0)
+
+struct kvm_arm_rmi_populate {
+	__u64 base;
+	__u64 size;
+	__u64 source_uaddr;
+	__u32 flags;
+	__u32 reserved;
+};
+
 #endif /* __LINUX_KVM_H */
-- 
2.43.0


