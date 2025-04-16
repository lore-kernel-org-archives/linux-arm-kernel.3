Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C908BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbsrojhYWV19+6vWcshKDGTBxDCsi/drJLJ7nEyeQG4=; b=wYEFOVhtB2UIIrRTDOHMIWlFL+
	EA1U52W3/Fi8bTNtOJiHCE2U89RfuaEjOlU10CsBqhQRa6EHcyEAR4gN+njKt/Dk/9TkS5r4tH65u
	P5rEU0gyqKpsiuBb3H0BUdo3FD3k0BuumT0+m6UD51Rb298oaFILL+7VyInyXN7TM6XKldSXnmFPb
	cd3bXvBHXPUgrM8shavfH+TDFKYW0DMQkEyrQWhRPsYvQniFN8ul35JjzqYrnCfESXgNvayLontc1
	/ackThPaPuEATyRrTpofzv7MELqm2MhnPJb0hbB62u2YdLC8wpgFvb82jhGCeLagXSYFvmTdVVXE/
	njo8nw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54JK-00000009zzM-3koa;
	Wed, 16 Apr 2025 15:04:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u536F-00000009iJN-0qZ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 909001E7D;
	Wed, 16 Apr 2025 06:46:44 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.90.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66E4D3F59E;
	Wed, 16 Apr 2025 06:46:42 -0700 (PDT)
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
Subject: [PATCH v8 41/43] KVM: arm64: Expose support for private memory
Date: Wed, 16 Apr 2025 14:42:03 +0100
Message-ID: <20250416134208.383984-42-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416134208.383984-1-steven.price@arm.com>
References: <20250416134208.383984-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_064647_327988_906DD460 
X-CRM114-Status: GOOD (  10.05  )
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

Select KVM_GENERIC_PRIVATE_MEM and provide the necessary support
functions.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v2:
 * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
   function call.
 * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
 * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
   should trigger.
---
 arch/arm64/include/asm/kvm_host.h |  6 ++++++
 arch/arm64/kvm/Kconfig            |  1 +
 arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1d2e871b8b63..3c61b84e5c4e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1460,6 +1460,12 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
+#ifdef CONFIG_KVM_PRIVATE_MEM
+#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
+#else
+#define kvm_arch_has_private_mem(kvm) false
+#endif
+
 int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 096e45acadb2..a5fbf51d57b5 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GENERIC_PRIVATE_MEM
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b861747ea1b3..55664ddeae42 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2364,6 +2364,30 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
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


