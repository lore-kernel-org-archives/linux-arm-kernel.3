Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ECAC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsscYiG/gL4xhTMrjkxU0qJ/qD9k5nNL1GSdo6GQ6Ew=; b=tyfffv5zWpx8df7LE9JJ54Ez6T
	FeBB/6nVKKbe7eaSS+nsswJEZalBFsIJ5Vha86hhcNjgor9U5dwK3U/0rCoyzTHkOEfEnPPQTq6JR
	lKJ+8A0l/qynKjitATcEb5SKBEGH+80zo6bovMGri/8/3cYeQ4aIZctti+dJkjJGVHeYtKBBI4bUQ
	Y1tjL/7Yhwv0wZZOie2IZQzrV21cO1q1tL6P7s10xY8q8dtRGLms6AKd+ogyFNLv0HA7yR47epkIz
	nx/3eqv0UooVUw/3kb09lDAn9ttGgXfTQjS/rU/o09Xu6gx8eR8Ek4VOcO938/Zk1OKCYKaVtTumc
	tgLlJn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsz2-0000000HCkv-0j0l;
	Mon, 03 Aug 2026 13:45:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsyz-0000000HChQ-34r5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:45:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76081655;
	Mon,  3 Aug 2026 06:45:27 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 350B63F66F;
	Mon,  3 Aug 2026 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764732; bh=fpzfERsy2u8KGN3uMqoxXEuQcKvM63ltT7aRUzheLWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcqA/ZcchKrTFecaMxjpxFmLhay53GZrGNTiFNQWtOwL5hixC3vRsRJuPWlpYu+97
	 wqDq5GaOrJCQLRpj6RKMZtSyLJ8lG+R4C8dYurJhYT8ug4/lLd/tYk8arS0cQ1V+vA
	 AH6fcpOOsnBuS/pa9TGm9/KOlB94E8nPtDFRrygI=
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 16/45] KVM: arm64: CCA: Allow passing the machine type in KVM creation
Date: Mon,  3 Aug 2026 14:43:32 +0100
Message-ID: <20260803134403.80630-17-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064533_998492_53C09A7C 
X-CRM114-Status: GOOD (  20.34  )
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

Previously machine type was used purely for specifying the physical
address size of the guest. Reserve the higher bits to specify an ARM
specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
used to create a realm guest.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Specify the encoding for each VM type in the documentation.
Changes since v13:
 * Rework to use the two top bits for the machine type now that pKVM has
   merged and used the top bit for KVM_VM_TYPE_ARM_PROTECTED.
 * Update the documentation to include KVM_VM_TYPE_ARM_PROTECTED as
   well.
Changes since v9:
 * Explictly set realm.state to REALM_STATE_NONE rather than rely on the
   zeroing of the structure.
Changes since v7:
 * Add some documentation explaining the new machine type.
Changes since v6:
 * Make the check for kvm_rme_is_available more visible and report an
   error code of -EPERM (instead of -EINVAL) to make it explicit that
   the kernel supports RME, but the platform doesn't.
---
 Documentation/virt/kvm/api.rst | 21 +++++++++++++++++++--
 arch/arm64/kvm/arm.c           | 11 +++++++++++
 include/uapi/linux/kvm.h       |  7 ++++++-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index ce588c05b26a..802601eaf560 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -181,8 +181,25 @@ flag KVM_VM_MIPS_VZ.
 ARM64:
 ^^^^^^
 
-On arm64, the physical address size for a VM (IPA Size limit) is limited
-to 40bits by default. The limit can be configured if the host supports the
+On arm64, the machine type identifier is used to encode a type and the
+physical address size for the VM. The lower byte (bits[7:0]) encodes the
+address size and the upper bits[31:30] encode a machine type. The machine
+types that might be available are:
+
+ =========================   =======   ========================================
+ Type                        [31:30]   Description
+ =========================   =======   ========================================
+ KVM_VM_TYPE_ARM_NORMAL      0b00      A standard VM
+ KVM_VM_TYPE_ARM_REALM       0b01      A "realm" VM using the Arm Confidential
+                                       Compute extensions, the VM's memory is
+                                       protected from the host.
+ KVM_VM_TYPE_ARM_PROTECTED   0b10      A "protected" VM using pKVM to
+                                       isolate the VM from the host.
+ Reserved                    0b11      Reserved for future use
+ =========================   =======   ========================================
+
+The physical address size for a VM (IPA Size limit) is limited to 40bits
+by default. The limit can be configured if the host supports the
 extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
 KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
 identifier, where IPA_Bits is the maximum width of any physical
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6f39831dcf5d..9881fd6c511c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -249,6 +249,17 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	mutex_unlock(&kvm->lock);
 #endif
 
+	if ((type & KVM_VM_TYPE_ARM_PROTECTED) &&
+	    (type & KVM_VM_TYPE_ARM_REALM))
+		return -EINVAL;
+
+	if (type & KVM_VM_TYPE_ARM_REALM) {
+		if (!static_branch_unlikely(&kvm_rmi_is_available))
+			return -EINVAL;
+		kvm_set_realm_state(kvm, REALM_STATE_NONE);
+		kvm->arch.is_realm = true;
+	}
+
 	kvm_init_nested(kvm);
 
 	ret = kvm_share_hyp(kvm, kvm + 1);
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 0231ff174a50..adee3936d6ae 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -700,14 +700,19 @@ struct kvm_enable_cap {
  * address size for the VM. Bits[7-0] are reserved for the guest
  * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
  * value 0 implies the default IPA size, 40bits.
+ *
+ * Bits[30-31] are reserved for the VM type
  */
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
 
+#define KVM_VM_TYPE_ARM_NORMAL		0
+#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
 #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
 #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
-					 KVM_VM_TYPE_ARM_PROTECTED)
+					 KVM_VM_TYPE_ARM_PROTECTED | \
+					 KVM_VM_TYPE_ARM_REALM)
 
 /*
  * ioctls for /dev/kvm fds:
-- 
2.43.0


