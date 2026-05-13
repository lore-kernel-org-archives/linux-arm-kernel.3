Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5D3CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FlFwWHyfeLVSzy7dxeX6YuLnhCqsxZ+9PmC5R6EYAE=; b=He3pQml19FAMcKFKFzK9A/FIMO
	+AP/U31tPULrFxCsXlhbMWiNpcntEycwWerIqICaJyXBc4DQuspoXslomjNx7AGHhYklUc9sGhGdw
	CKqKOZwBcuGHPbT28l2LxfRje/JuasrpqTYi8yVF2IJTLrhsuE8B/66G5QrFW7516H+28m/uNeKUn
	sjSVC4+6bORiQXbH+PDYbc51G9mZB2/x3k1do+MPTkMc5oWZeN/oicKNeXbxr9sSNXNn7TrsRG5Jx
	m7lFnfhrOwDkQltEl8/iBQrWaiDKLsrjedVQcqsBoColX/6rc5Hp7UwLei7anc5qMxXbIGmdEXSmv
	6O5ymhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9W4-00000002gs1-1c4f;
	Wed, 13 May 2026 13:20:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Vu-00000002gfG-1I6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:20:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 728F330B1;
	Wed, 13 May 2026 06:20:31 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B5773F836;
	Wed, 13 May 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678436; bh=YndVBENKT7za7Eh2CgyvzwtNsJtX3XG29UQvOY5vpGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxXlHadbmDg6/uoY8VbuxewTVGFI8q1uoTPhTJ2hyFqYxekVi5Vf3AJge5+vIDD0K
	 TVhxdF5mw0hjyHqK5GaPsWbJ++vc3s1ofLEGE1DJLOcQZAZMW+f4VMJMdalAGzs++6
	 XiVuOsAC/5IDR9JqRFjvJE9IZPYjhXR+UB9CB3+4=
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
Subject: [PATCH v14 25/44] KVM: arm64: Expose support for private memory
Date: Wed, 13 May 2026 14:17:33 +0100
Message-ID: <20260513131757.116630-26-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062038_551756_E66B0F85 
X-CRM114-Status: GOOD (  14.08  )
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

Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
functions.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * Also update documentation to show that KVM_CAP_MEMORY_ATTRIBUTES is
   used on arm64.
Changes since v12:
 * Only define kvm_arch_has_private_mem() when
   CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES is set to avoid build issues
   when KVM is disabled.
Changes since v10:
 * KVM_GENERIC_PRIVATE_MEM replacd with KVM_GENERIC_MEMORY_ATTRIBUTES.
Changes since v9:
 * Drop the #ifdef CONFIG_KVM_PRIVATE_MEM guard from the definition of
   kvm_arch_has_private_mem()
Changes since v2:
 * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
   function call.
 * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
 * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
   should trigger.
---
 Documentation/virt/kvm/api.rst    |  2 +-
 arch/arm64/include/asm/kvm_host.h |  4 ++++
 arch/arm64/kvm/Kconfig            |  1 +
 arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 31a5919d8d5f..a47c60490475 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6379,7 +6379,7 @@ Returns -EINVAL if called on a protected VM.
 -------------------------------
 
 :Capability: KVM_CAP_MEMORY_ATTRIBUTES
-:Architectures: x86
+:Architectures: x86, arm64
 :Type: vm ioctl
 :Parameters: struct kvm_memory_attributes (in)
 :Returns: 0 on success, <0 on error
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 39b5de03d0fe..11e7b629c950 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1531,6 +1531,10 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
+#endif
+
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449154f9a485..4e16719fda22 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
+	select KVM_GENERIC_MEMORY_ATTRIBUTES
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 10ca9dbe40a0..ac2a0f0106b0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2684,6 +2684,30 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	return ret;
 }
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
+					struct kvm_gfn_range *range)
+{
+	WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm));
+	return false;
+}
+
+bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
+					 struct kvm_gfn_range *range)
+{
+	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
+		return false;
+
+	if (range->arg.attributes & KVM_MEMORY_ATTRIBUTE_PRIVATE)
+		range->attr_filter = KVM_FILTER_SHARED;
+	else
+		range->attr_filter = KVM_FILTER_PRIVATE;
+	kvm_unmap_gfn_range(kvm, range);
+
+	return false;
+}
+#endif
+
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
 }
-- 
2.43.0


