Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A195ED132CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXCdoRKt7Rne/pKH5oiyWCxEYoVlk91YPJHINOsPplo=; b=3ei0hN/VyZJimoy08ZKLnyeQVP
	WHmRG32ryEOTgOJYcEIs5NRCu4VWCcUW1T/QQqrVA2St8AfQvQnUF35oWJTgJ8JC+IlD6AeLl7wLJ
	ZmObMzT6TLx+/iuB3vWfAxHqFLjp9G/T+e/RAQERMMwWu2BQojRRK7kejBkmwt5Jlt5u/vsLni/f6
	oqG0Of5q+Zpnkj6TfTkW7N05P+Bf8qxRbCygnCUCYY7G2O6WX8xXSg3sjXHg5yGCM59qThEtzjl+A
	QVwnkQkKOiBSgM/dYhfckLOo5t4S8oS0+BW4WbGQgCgHbYmuixlz1Di4BoBTAyqiEAMRK7UWfYdCg
	YHElHXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xnw-0000000E09j-1UYz;
	Mon, 04 Nov 2024 14:11:40 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCO-0000000DsVD-2t1Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2b9f2c6559so6261042276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727171; x=1731331971; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NXCdoRKt7Rne/pKH5oiyWCxEYoVlk91YPJHINOsPplo=;
        b=Rnbg6wq/HpdeuMIRTnHjCqE9bnw5iaaBDgE7sMUJfFBJW6ujkidLZLIHq2IW9OYv78
         XVCi+IYftsCOtpDm9kdwOUwlE19/AaIjT5fn1MpcL/y/lhZsGQ1FTWnXG/aoOcrbra/w
         vsb9FhX9TsXH0dXO2h25D/io1CnIc+zBf5WS46ftBJBCbIxlUGX4PxNEFg56GqlduQv9
         0wWsOyroIR6MsaiqEeXmnvn5jQNJLprHN33ZrxcG2NMWfPsQJOD1JvH0PHR+nPijyL/J
         h0dbSTFThxnFvj5u1UlMZOYhQVZgrlprCbtVhuR5fmuKRh/fDVDuJ4undI1CfpV52Dt4
         +lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727171; x=1731331971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXCdoRKt7Rne/pKH5oiyWCxEYoVlk91YPJHINOsPplo=;
        b=SIyaEsBIUrCGz46Uh8Lo7HesuFBGNG87v/7jAOwoVZZJCmnj/qPA9Q54yAdzijwmWT
         3lzqkT3Pm9S38ykUdLHkorCb/YGbmid3qIiN2ehGXBgOV77mW5DbPwPYjDwQjKfMtUhM
         MpS5BwLlpIB0glXXmA6ebxaeN9h03Y8w3vkHJASwpqpElpOJ8T0YbG6p3+fOQYCca2vD
         y4bBDG6Jh5rW7q/OKMY2pUWmQkL/ogaDwZhlaeu2wxTiiqBlL//xubEYTYW5TOcCmpN3
         OwgFcpHAlAeQ331AjcsTNUt4jtYrTjsbK6MGc6T+L3sphXwzeaJ6mAVv3yqa58THKmQ5
         t65Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVoueeFo+uhEYZBOwj7a6J2sYIaEj8i6n/5zBt+LGES77CwwdULNx9N27eO5oZWAlzGrYnoM+N9dxI/ohVPVbv@lists.infradead.org
X-Gm-Message-State: AOJu0YxqcDj7o/c5rB3lsa3H0mqnXNQ1REArr6LOSghoTsanPoPihI1T
	FaMAF0GmgxK/1ZXj2XLsrrfMlbrlcGs8GknajaFFDN8KWgCnvYNU6DP9OMONoE4EoHIMcPc86n3
	3S+n7UQ==
X-Google-Smtp-Source: AGHT+IGyq0e2NqBrezYd4WLx5KMstrrmZ9yqIIsqORj6Yky486c6IZYV1KwtX6oHvgtlaeUeDVltT641hEpU
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:aa83:0:b0:e30:c235:d79f with SMTP id
 3f1490d57ef6-e30e5b282d1mr8312276.8.1730727171460; Mon, 04 Nov 2024 05:32:51
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:32:04 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-19-qperret@google.com>
Subject: [PATCH 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053252_759181_CCE11F75 
X-CRM114-Status: GOOD (  20.40  )
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

Introduce the KVM_PGT_S2() helper macro to allow switching from the
traditional pgtable code to the pKVM version easily in mmu.c. The cost
of this 'indirection' is expected to be very minimal due to
is_protected_kvm_enabled() being backed by a static key.

With this, everything is in place to allow the delegation of
non-protected guest stage-2 page-tables to pKVM, so let's stop using the
host's kvm_s2_mmu from EL2 and enjoy the ride.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/arm.c               |   9 ++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |   2 -
 arch/arm64/kvm/mmu.c               | 104 +++++++++++++++++++++--------
 3 files changed, 84 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2bf168b17a77..890c89874c6b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -506,7 +506,10 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	if (vcpu_has_run_once(vcpu) && unlikely(!irqchip_in_kernel(vcpu->kvm)))
 		static_branch_dec(&userspace_irqchip_in_use);
 
-	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+	if (!is_protected_kvm_enabled())
+		kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+	else
+		free_hyp_memcache(&vcpu->arch.pkvm_memcache);
 	kvm_timer_vcpu_terminate(vcpu);
 	kvm_pmu_vcpu_destroy(vcpu);
 	kvm_vgic_vcpu_destroy(vcpu);
@@ -578,6 +581,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
 
+	if (is_protected_kvm_enabled())
+		goto nommu;
+
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_load_hw_mmu(vcpu);
 
@@ -598,6 +604,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		*last_ran = vcpu->vcpu_idx;
 	}
 
+nommu:
 	vcpu->cpu = cpu;
 
 	kvm_vgic_load(vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 1d8baa14ff1c..cf0fd83552c9 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -103,8 +103,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	/* Limit guest vector length to the maximum supported by the host.  */
 	hyp_vcpu->vcpu.arch.sve_max_vl	= min(host_vcpu->arch.sve_max_vl, kvm_host_sve_max_vl);
 
-	hyp_vcpu->vcpu.arch.hw_mmu	= host_vcpu->arch.hw_mmu;
-
 	hyp_vcpu->vcpu.arch.hcr_el2	= host_vcpu->arch.hcr_el2;
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 80dd61038cc7..fcf8fdcccd22 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_arm.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
+#include <asm/kvm_pkvm.h>
 #include <asm/kvm_ras.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
@@ -31,6 +32,14 @@ static phys_addr_t __ro_after_init hyp_idmap_vector;
 
 static unsigned long __ro_after_init io_map_base;
 
+#define KVM_PGT_S2(fn, ...)								\
+	({										\
+		typeof(kvm_pgtable_stage2_ ## fn) *__fn = kvm_pgtable_stage2_ ## fn;	\
+		if (is_protected_kvm_enabled())						\
+			__fn = pkvm_pgtable_ ## fn;					\
+		__fn(__VA_ARGS__);							\
+	})
+
 static phys_addr_t __stage2_range_addr_end(phys_addr_t addr, phys_addr_t end,
 					   phys_addr_t size)
 {
@@ -147,7 +156,7 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 			return -EINVAL;
 
 		next = __stage2_range_addr_end(addr, end, chunk_size);
-		ret = kvm_pgtable_stage2_split(pgt, addr, next - addr, cache);
+		ret = KVM_PGT_S2(split, pgt, addr, next - addr, cache);
 		if (ret)
 			break;
 	} while (addr = next, addr != end);
@@ -168,15 +177,23 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
  */
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
-	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
+	if (is_protected_kvm_enabled())
+		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
+	else
+		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
 	return 0;
 }
 
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
 				      gfn_t gfn, u64 nr_pages)
 {
-	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
-				gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
+	u64 size = nr_pages << PAGE_SHIFT;
+	u64 addr = gfn << PAGE_SHIFT;
+
+	if (is_protected_kvm_enabled())
+		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
+	else
+		kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
 	return 0;
 }
 
@@ -225,7 +242,7 @@ static void stage2_free_unlinked_table_rcu_cb(struct rcu_head *head)
 	void *pgtable = page_to_virt(page);
 	s8 level = page_private(page);
 
-	kvm_pgtable_stage2_free_unlinked(&kvm_s2_mm_ops, pgtable, level);
+	KVM_PGT_S2(free_unlinked, &kvm_s2_mm_ops, pgtable, level);
 }
 
 static void stage2_free_unlinked_table(void *addr, s8 level)
@@ -316,6 +333,12 @@ static void invalidate_icache_guest_page(void *va, size_t size)
  * destroying the VM), otherwise another faulting VCPU may come in and mess
  * with things behind our backs.
  */
+
+static int kvm_s2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	return KVM_PGT_S2(unmap, pgt, addr, size);
+}
+
 static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64 size,
 				 bool may_block)
 {
@@ -324,8 +347,7 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
-	WARN_ON(stage2_apply_range(mmu, start, end, kvm_pgtable_stage2_unmap,
-				   may_block));
+	WARN_ON(stage2_apply_range(mmu, start, end, kvm_s2_unmap, may_block));
 }
 
 void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
@@ -334,9 +356,14 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 	__unmap_stage2_range(mmu, start, size, may_block);
 }
 
+static int kvm_s2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	return KVM_PGT_S2(flush, pgt, addr, size);
+}
+
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
 {
-	stage2_apply_range_resched(mmu, addr, end, kvm_pgtable_stage2_flush);
+	stage2_apply_range_resched(mmu, addr, end, kvm_s2_flush);
 }
 
 static void stage2_flush_memslot(struct kvm *kvm,
@@ -942,10 +969,14 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 		return -ENOMEM;
 
 	mmu->arch = &kvm->arch;
-	err = kvm_pgtable_stage2_init(pgt, mmu, &kvm_s2_mm_ops);
+	err = KVM_PGT_S2(init, pgt, mmu, &kvm_s2_mm_ops);
 	if (err)
 		goto out_free_pgtable;
 
+	mmu->pgt = pgt;
+	if (is_protected_kvm_enabled())
+		return 0;
+
 	mmu->last_vcpu_ran = alloc_percpu(typeof(*mmu->last_vcpu_ran));
 	if (!mmu->last_vcpu_ran) {
 		err = -ENOMEM;
@@ -959,7 +990,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
 	mmu->split_page_cache.gfp_zero = __GFP_ZERO;
 
-	mmu->pgt = pgt;
 	mmu->pgd_phys = __pa(pgt->pgd);
 
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
@@ -968,7 +998,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	kvm_pgtable_stage2_destroy(pgt);
+	KVM_PGT_S2(destroy, pgt);
 out_free_pgtable:
 	kfree(pgt);
 	return err;
@@ -1065,7 +1095,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		kvm_pgtable_stage2_destroy(pgt);
+		KVM_PGT_S2(destroy, pgt);
 		kfree(pgt);
 	}
 }
@@ -1082,9 +1112,11 @@ static void *hyp_mc_alloc_fn(void *unused)
 
 void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 {
-	if (is_protected_kvm_enabled())
-		__free_hyp_memcache(mc, hyp_mc_free_fn,
-				    kvm_host_va, NULL);
+	if (!is_protected_kvm_enabled())
+		return;
+
+	kfree(mc->mapping);
+	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, NULL);
 }
 
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
@@ -1092,6 +1124,12 @@ int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
 	if (!is_protected_kvm_enabled())
 		return 0;
 
+	if (!mc->mapping) {
+		mc->mapping = kzalloc(sizeof(struct pkvm_mapping), GFP_KERNEL_ACCOUNT);
+		if (!mc->mapping)
+			return -ENOMEM;
+	}
+
 	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
 				    kvm_host_pa, NULL);
 }
@@ -1130,8 +1168,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			break;
 
 		write_lock(&kvm->mmu_lock);
-		ret = kvm_pgtable_stage2_map(pgt, addr, PAGE_SIZE, pa, prot,
-					     &cache, 0);
+		ret = KVM_PGT_S2(map, pgt, addr, PAGE_SIZE, pa, prot, &cache, 0);
 		write_unlock(&kvm->mmu_lock);
 		if (ret)
 			break;
@@ -1143,6 +1180,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 	return ret;
 }
 
+static int kvm_s2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	return KVM_PGT_S2(wrprotect, pgt, addr, size);
+}
 /**
  * kvm_stage2_wp_range() - write protect stage2 memory region range
  * @mmu:        The KVM stage-2 MMU pointer
@@ -1151,7 +1192,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
  */
 void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
 {
-	stage2_apply_range_resched(mmu, addr, end, kvm_pgtable_stage2_wrprotect);
+	stage2_apply_range_resched(mmu, addr, end, kvm_s2_wrprotect);
 }
 
 /**
@@ -1431,9 +1472,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	unsigned long mmu_seq;
 	phys_addr_t ipa = fault_ipa;
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
 	struct vm_area_struct *vma;
 	short vma_shift;
+	void *memcache;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
@@ -1460,8 +1501,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
 	if (!fault_is_perm || (logging_active && write_fault)) {
-		ret = kvm_mmu_topup_memory_cache(memcache,
-						 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
+		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
+
+		if (!is_protected_kvm_enabled()) {
+			memcache = &vcpu->arch.mmu_page_cache;
+			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
+		} else {
+			memcache = &vcpu->arch.pkvm_memcache;
+			ret = topup_hyp_memcache(memcache, min_pages);
+		}
 		if (ret)
 			return ret;
 	}
@@ -1482,7 +1530,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active) {
+	if (logging_active || is_protected_kvm_enabled()) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1684,9 +1732,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot, flags);
+		ret = KVM_PGT_S2(relax_perms, pgt, fault_ipa, prot, flags);
 	} else {
-		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
+		ret = KVM_PGT_S2(map, pgt, fault_ipa, vma_pagesize,
 					     __pfn_to_phys(pfn), prot,
 					     memcache, flags);
 	}
@@ -1715,7 +1763,7 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	pte = kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa, flags);
+	pte = KVM_PGT_S2(mkyoung, mmu->pgt, fault_ipa, flags);
 	read_unlock(&vcpu->kvm->mmu_lock);
 
 	if (kvm_pte_valid(pte))
@@ -1758,7 +1806,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		}
 
 		/* Falls between the IPA range and the PARange? */
-		if (fault_ipa >= BIT_ULL(vcpu->arch.hw_mmu->pgt->ia_bits)) {
+		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
 			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
 
 			if (is_iabt)
@@ -1924,7 +1972,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+	return KVM_PGT_S2(test_clear_young, kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, true);
 	/*
@@ -1940,7 +1988,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+	return KVM_PGT_S2(test_clear_young, kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, false);
 }
-- 
2.47.0.163.g1226f6d8fa-goog


