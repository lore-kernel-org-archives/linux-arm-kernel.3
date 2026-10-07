Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96772CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM4i4peWH/XTPXvOZHR4HJ+6NY5SkeeDs8fJ5CkYJX0=; b=W/ZETMhxspNRfO8d3mjLQ+MQgY
	YH7VmZxmw/JrW9wcmnd+5Cr7t/6vlEq9n+md12WN+FwEEKLzcBzGHJDAAThy1zYu7h01Z+CQ0usxX
	RmrkEGAopyhruV69Svg3THhu6hKR9zZ78OamG9wF1968UmHFeVfHPI5voi7XoSIzHjaqA0VtFkigU
	KttLgWoTsOLaaXYKI7sNBW3W67c7iQRy0b6zVQ2JcvBdP33Q6ZBaKTtvJW2cmIbdjG5lTOF6p21NL
	LwElayBF0sU+5YzIKuImPgc6SPc5gPU47gd/Qh2wUvwMJ8oUNSWoqci/SbceuStu55N3ZfWM7q/WU
	AsHXebig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCW-00000001rFZ-1zH6;
	Wed, 07 Oct 2026 07:36:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCS-00000001rBb-3YPy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:36:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71921595;
	Wed,  7 Oct 2026 00:36:24 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCE0C3F763;
	Wed,  7 Oct 2026 00:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791358588; bh=TjKkhM+frRfcM0bc2L5+jyBRWDYandy4RJ5zfNjmIOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hqDAphNmu7ZXid7W+EE9VIHH5p7C3uLft3UrE3xiYOYV+Z2o1adeZwOnTbr0W1dho
	 KsC6HJx3Sc0LsAKpjDFoqM4vznCPOQXEVSIs3oP6b7rRU+kK2wM6pU+Yi661OVQ45/
	 WSGcaPmN+EeMMrZq5p3BhDSqDyIVW6vbNTJBz/Bo=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v23 10/14] KVM: arm64: Add VM specific callback for S2 MMU operations
Date: Wed,  7 Oct 2026 08:35:33 +0100
Message-ID: <20261007073537.2454351-11-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_003629_221021_E04CD6F3 
X-CRM114-Status: GOOD (  18.19  )
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

Add VM type specific S2 MMU operation backends which can be initialized per
VM flavor, to keep the handling cleaner.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v22:
 - Add '()' around flavor in KVM_VM_S2_OPS
Change since v21:
 - Define all vm_s2_ops call back. All calls are mandatory.
 - Define callback for each flavor, disjointing the non-protetcted pKVM and
   normal KVM (VHE & nVHE) and remove the KVM_PGT_FN() hacks.
 - Dropped Reviews due to the changes.
 - Add "no_age_gfn" and "no_stage2_unmap_range" for pKVM callbacks, no_age_*
   to be also reused by Realms later.
 - Move kvm_vm_s2_ops field to keep the structure packed
---
 arch/arm64/include/asm/kvm_host.h |  14 +++
 arch/arm64/kvm/mmu.c              | 173 +++++++++++++++++++++++++-----
 2 files changed, 160 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7e0d2d4fcf834..296a6b0323e47 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -155,6 +155,19 @@ struct kvm_vcpu_ops {
 	void (*vcpu_put)(struct kvm_vcpu *vcpu);
 };
 
+struct kvm_gfn_range;
+
+struct kvm_vm_s2_ops {
+	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
+	bool (*vm_test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
+	int (*vm_flush_remote_tlbs)(struct kvm *kvm);
+	int (*vm_flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
+					  u64 nr_pages);
+	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
+				      phys_addr_t start, u64 size,
+				      bool may_block);
+};
+
 struct kvm_s2_mmu {
 	struct kvm_vmid vmid;
 
@@ -321,6 +334,7 @@ enum kvm_arm_vm_flavor {
 
 struct kvm_arch {
 	struct kvm_s2_mmu mmu;
+	const struct kvm_vm_s2_ops *vm_s2_ops;
 
 	enum kvm_arm_vm_flavor vm_flavor;
 	/* Mandated version of PSCI */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 3fef16393f568..65592feaa6a96 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
 
 #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
 
+static int kvm_vm_init_vm_s2_ops(struct kvm *kvm);
+
 static phys_addr_t __stage2_range_addr_end(phys_addr_t addr, phys_addr_t end,
 					   phys_addr_t size)
 {
@@ -166,6 +168,18 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
 	return memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
 }
 
+static int pkvm_flush_remote_tlbs(struct kvm *kvm)
+{
+	kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
+	return 0;
+}
+
+static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
+{
+	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
+	return 0;
+}
+
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -174,26 +188,31 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
  */
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
-	if (is_protected_kvm_enabled())
-		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
-	else
-		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
-	return 0;
+	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
 }
 
-int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
-				      gfn_t gfn, u64 nr_pages)
+static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
+					gfn_t gfn, u64 nr_pages)
+{
+	return pkvm_flush_remote_tlbs(kvm);
+}
+
+static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
+					 gfn_t gfn, u64 nr_pages)
 {
 	u64 size = nr_pages << PAGE_SHIFT;
 	u64 addr = gfn << PAGE_SHIFT;
 
-	if (is_protected_kvm_enabled())
-		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
-	else
-		kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
+	kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
 	return 0;
 }
 
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+				     gfn_t gfn, u64 nr_pages)
+{
+	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range(kvm, gfn, nr_pages);
+}
+
 static void *stage2_memcache_zalloc_page(void *arg)
 {
 	struct kvm_mmu_memory_cache *mc = arg;
@@ -289,6 +308,27 @@ static void invalidate_icache_guest_page(void *va, size_t size)
 	__invalidate_icache_guest_page(va, size);
 }
 
+static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
+				      phys_addr_t start,
+				      u64 size, bool may_block)
+{
+	WARN_ON(stage2_apply_range(mmu, start, start + size,
+				   kvm_pgtable_stage2_unmap, may_block));
+}
+
+static void pkvm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
+				    phys_addr_t start,
+				    u64 size, bool may_block)
+{
+	WARN_ON(stage2_apply_range(mmu, start, start + size,
+				   pkvm_pgtable_stage2_unmap, may_block));
+}
+
+static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
+				  phys_addr_t start, u64 size, bool may_block)
+{
+}
+
 /*
  * Unmapping vs dcache management:
  *
@@ -329,15 +369,10 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 
-	if (kvm_vm_is_protected(kvm))
-		return;
-
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
 
-	WARN_ON(stage2_apply_range(mmu, start, start + size,
-				   KVM_PGT_FN(kvm_pgtable_stage2_unmap),
-				   may_block));
+	kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size, may_block);
 }
 
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
@@ -977,6 +1012,12 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	int cpu, err;
 	struct kvm_pgtable *pgt;
 
+	/* Initialize the VM ops for the VM instance for the first time */
+	if (mmu == &kvm->arch.mmu) {
+		err = kvm_vm_init_vm_s2_ops(kvm);
+		if (err)
+			return err;
+	}
 	/*
 	 * If we already have our page tables in place, and that the
 	 * MMU context is the canonical one, we have a bug somewhere,
@@ -2441,34 +2482,68 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+static bool kvm_vm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
-		return false;
-
-	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
+	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, true);
+}
+
+static bool pkvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	u64 size = (range->end - range->start) << PAGE_SHIFT;
+
+	return pkvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, true);
+}
+
+static bool no_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	/* The hypervisor doesn't support aging */
+	return false;
+}
+
+bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	if (!kvm->arch.mmu.pgt)
+		return false;
+
+	return kvm->arch.vm_s2_ops->vm_age_gfn(kvm, range);
 	/*
 	 * TODO: Handle nested_mmu structures here using the reverse mapping in
 	 * a later version of patch series.
 	 */
 }
 
-bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+static bool kvm_vm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
-		return false;
-
-	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
+	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, false);
 }
 
+static bool pkvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	u64 size = (range->end - range->start) << PAGE_SHIFT;
+
+	return pkvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, false);
+}
+
+bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	if (!kvm->arch.mmu.pgt)
+		return false;
+
+	return kvm->arch.vm_s2_ops->vm_test_age_gfn(kvm, range);
+}
+
 phys_addr_t kvm_mmu_get_httbr(void)
 {
 	return __pa(hyp_pgtable->pgd);
@@ -2790,3 +2865,47 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 
 	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
 }
+
+static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
+	.vm_age_gfn			= no_age_gfn,
+	.vm_test_age_gfn		= no_age_gfn,
+	.vm_stage2_unmap_range		= no_stage2_unmap_range,
+};
+
+static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
+	.vm_age_gfn			= pkvm_age_gfn,
+	.vm_test_age_gfn		= pkvm_test_age_gfn,
+	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
+};
+
+static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= kvm_vm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= kvm_vm_flush_remote_tlbs_range,
+	.vm_age_gfn			= kvm_vm_age_gfn,
+	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
+	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+};
+
+#define KVM_VM_S2_OPS(flavor, ops)		\
+		[(flavor)] = &(ops)
+
+static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
+	KVM_VM_S2_OPS(VM_VHE, kvm_default_vm_s2_ops),
+	KVM_VM_S2_OPS(VM_NVHE, kvm_default_vm_s2_ops),
+	KVM_VM_S2_OPS(VM_PKVM, pkvm_vm_s2_ops),
+	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, protected_pkvm_vm_s2_ops),
+};
+
+static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX);
+
+	kvm->arch.vm_s2_ops = arm64_vm_s2_ops[kvm->arch.vm_flavor];
+	if (WARN_ON(!kvm->arch.vm_s2_ops))
+		return -EINVAL;
+	return 0;
+}
-- 
2.43.0


