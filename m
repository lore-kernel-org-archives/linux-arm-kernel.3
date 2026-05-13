Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18570CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBpDYfldfemPB6G4+AbtXHkiCcBLLmRsQyiKABOs5BM=; b=W15EiYe2G2CL2AO2K4cDNQMxLi
	VP5Z78eNFujuZ6PuLLIM7uzsLNkSqDTH9VUUOnZbjFo3DD6iNJwo2nEMymw3YFcUI9VUpFL3mug1X
	xhVre0g3VxLDODhCgdbqdO/1A1J3F8zC7auI9iaigq+bywNC87Itkj1nNaSESiA8KP66FybQnv+LO
	F5pN820BchBEOVu5Ty60X+4Z/e4o79x2eywYqRSUTQOW+DulJS0rAPnKifoCHwxM/NQLm8XcTnrdg
	ddMEuNB8vy02ySKLiP7B1jG14/Jd/PX9uql4IMmaWF/nUbHyiilB6X9cYPZpHH7R8RJ+mLNld0Jtn
	9qJ5FJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9V3-00000002fTN-08tr;
	Wed, 13 May 2026 13:19:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Ur-00000002fGm-3Yve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5337B2437;
	Wed, 13 May 2026 06:19:27 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A43F3F836;
	Wed, 13 May 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678372; bh=YGjzmqYxbgfsprhZpP3Dh515TKou9xZyKKjSouny438=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ad7IVwiGD0P/F+XM22ZzJW47BtIVh/q/fjphiqLJLSI6a6W+Q6OPtHI/wQMikUmjM
	 sfzDM5kg5Z7MVN2AXxCbgH3QlwShDZS46IwxCfQCxRyvw1snBkZSs/nIPcHMY4r0SA
	 21+O2SL3T+5srObg52uhhw87mmF/v2zc6KD5Bums=
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
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 13/44] arm64: RMI: Define the user ABI
Date: Wed, 13 May 2026 14:17:21 +0100
Message-ID: <20260513131757.116630-14-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061934_540962_33C2A2CE 
X-CRM114-Status: GOOD (  17.66  )
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

There is one CAP which identified the presence of CCA, and one ioctl.
The ioctl is used to populate memory during creation of the realm as
this requires the RMM to copy data from an unprotected address to the
protected memory - CCA does not support memory conversion where the
memory contents is preserved as this is incompatible with memory
encryption.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * KVM_ARM_VCPU_RMI_PSCI_COMPLETE removed.
 * KVM_ARM_RMI_POPULATE documentation updated to reflect that the
   structure is written by the kernel.
 * CAP number bumped.
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
 Documentation/virt/kvm/api.rst | 40 ++++++++++++++++++++++++++++++++++
 include/uapi/linux/kvm.h       | 13 +++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..ca68aae7faa2 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6553,6 +6553,37 @@ KVM_S390_KEYOP_SSKE
   Sets the storage key for the guest address ``guest_addr`` to the key
   specified in ``key``, returning the previous value in ``key``.
 
+4.145 KVM_ARM_RMI_POPULATE
+--------------------------
+
+:Capability: KVM_CAP_ARM_RMI
+:Architectures: arm64
+:Type: vm ioctl
+:Parameters: struct kvm_arm_rmi_populate (in/out)
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
+entire region and in this case the kernel updates the fields `base`, `size` and
+`source_uaddr`. User space may have to repeatedly call it until `size` is 0 to
+populate the entire region.
+
+`flags` can be set to `KVM_ARM_RMI_POPULATE_FLAGS_MEASURE` to request that the
+populated data is hashed and added to the guest's Realm Initial Measurement
+(RIM).
+
 .. _kvm_run:
 
 5. The kvm_run structure
@@ -8904,6 +8935,15 @@ helpful if user space wants to emulate instructions which are not
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
index 6c8afa2047bf..b8cff0938041 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -996,6 +996,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
 #define KVM_CAP_S390_VSIE_ESAMODE 248
+#define KVM_CAP_ARM_RMI 249
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1669,4 +1670,16 @@ struct kvm_pre_fault_memory {
 	__u64 padding[5];
 };
 
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


