Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF136C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yckfu0YMs9LPRaCXZeFWGx2xunf0uWukaoGETxJtBJo=; b=KTkBVmcI6wp3wN4uWErnG3/JqX
	0Yo0KDs6JXbHFFB+9Tk/Lzm/n5Y8CjXpT4JhPgkS6pBgDcpysNE4paRrZG/zvvPj+qPUVTX0AF1OL
	BF5lP1JKkq65FacFqcJ6+POEGCpYQnVsLJJUYwHPTFQ7bsQbpw1nOM2ijKpsQwBVx+ESYZmKiOyKT
	urP+kM9yFxUER3zW+ZC7UGiqhQbqou05e7uOFWRyLe5PtxDN5wbgPjlcNp6yf7bwVKMDGVQDo++z0
	3tSXYHb4YgGIgIYctUjT/mnZgKnXalMNdeVyiPPKShNsfy0+sVf/GKwN01jlkXczC9kY4zNrzVods
	h2ZPqV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fN-0000000GoHY-0ZIe;
	Fri, 11 Sep 2026 13:51:45 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000GnqX-05JM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:16 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so10709905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134673; x=1789739473; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yckfu0YMs9LPRaCXZeFWGx2xunf0uWukaoGETxJtBJo=;
        b=BJTjPSqD75AMM/mlEijtr8y3bBJ4FTIvhDbW7ipE+oLk3lgqe4GUNsm0VlF23Mqd+J
         50L0Xory9z2ozHT85vcrM0g6QZiSyOLpI6sDk1BLVtAQ8bQsLWesA/wPS+7qNBoFHQUM
         eADQQMfJTRHcnyoACZAeodCoLJgDCpt2sr/hqJ6pLVlQkUNUkm2Hfv3ZbEKt3CHYqKcX
         zYCzqIY1Y+pG1TXDfppgwDGbChrWLRJSLf4gPjswOPrULggOT/Twe8+3LCoymuERzXQw
         Ra2OktphNf/YbfUSSzthhxea67Ql1em9+Ah3aktiRiSiYSHXfnafkTUH97jwECNOd9cW
         r3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134673; x=1789739473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yckfu0YMs9LPRaCXZeFWGx2xunf0uWukaoGETxJtBJo=;
        b=UgWyqTxs7SisEYZSW3EJ4zTuKIFyk4eV8Tz1tkk3lYFblCeBij7e+D9r9rhCQyUDQP
         +GUpmYQ/UCExCNUI96Gw0+6TVmjmO6oQtFF7IUKSXLCxBWMJbSbY+/BaqjfWhN7FqmjB
         QiRcMLMtlyioiWSTwS4SleF07bPvk1e/cN/SvZKOpxXHfMXys/JKfGv3Vdygew512LKJ
         IqVwTkeuZxc4XJGCIKtWqMKgyv57uI1mdyP2PPuJaWd2lUrcvzqpHfAdDV8CB1UcCW0s
         NoCDH4wgx569TIx1FQkbNjvyD7OPdMjM7a9suqajtDV56CvAEBkhSYQCzYobaLDjKdJU
         RgEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUNrvilU+pRihBBDUUuV4wffFeAybkhmKqO42Wb9nnLIkleh/k2TAvodUZG3GWaeE2Q2c76sojuwE081j5SdDy@lists.infradead.org
X-Gm-Message-State: AFuF++lzIfIsllXSs9h1OcAHi1475ticQS1tDfYobzo0CnL4nCUNmP/d
	se76+Et2OwLxyWaIm2WAfAPVwCq1pV+pBUMLwZmlvmRsB6vh3iiZhunnmBfjtOWyT3ee9i/iaoO
	kt7yjMdWFy9tymQqcm1JYug==
X-Received: from wmv6.prod.google.com ([2002:a05:600c:26c6:b0:49c:d3c6:97b4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:358c:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49e619bb961mr60811275e9.16.1789134672498;
 Fri, 11 Sep 2026 06:51:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:40 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-10-vdonnefort@google.com>
Subject: [PATCH v2 09/22] KVM: arm64: Add a range to __pkvm_host_reclaim_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065115_148753_76F10B25 
X-CRM114-Status: GOOD (  17.22  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
add a nr_pages argument to the __pkvm_host_reclaim_guest() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Also, rename both the mem_protect function and the HVC to
__pkvm_host_reclaim_guest() as it can now operate on a range.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  7 ++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 58 +++++++++++--------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 +-
 arch/arm64/kvm/pkvm.c                         |  5 +-
 7 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 7fdec5d98201..95dd62e5601b 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -109,7 +109,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_in_poison_fault,
 	__KVM_HOST_SMCCC_FUNC___pkvm_force_reclaim_guest_page,
-	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest_page,
+	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index c13f258fffb7..646d2335e5c1 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,7 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
-int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
+int __pkvm_host_reclaim_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index f04cea5ff389..4183614055bc 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -74,7 +74,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		     unsigned long vcpu_hva);
 
-int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
+int __pkvm_reclaim_dying_guest(pkvm_handle_t handle, u64 gfn, u64 nr_pages);
 int __pkvm_start_teardown_vm(pkvm_handle_t handle);
 int __pkvm_finalize_teardown_vm(pkvm_handle_t handle);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 84ff87d4e18d..ce816f01ab4f 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -814,12 +814,13 @@ static void handle___pkvm_force_reclaim_guest_page(struct kvm_cpu_context *host_
 	cpu_reg(host_ctxt, 1) = __pkvm_host_force_reclaim_page_guest(phys);
 }
 
-static void handle___pkvm_reclaim_dying_guest_page(struct kvm_cpu_context *host_ctxt)
+static void handle___pkvm_reclaim_dying_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 
-	cpu_reg(host_ctxt, 1) = __pkvm_reclaim_dying_guest_page(handle, gfn);
+	cpu_reg(host_ctxt, 1) = __pkvm_reclaim_dying_guest(handle, gfn, nr_pages);
 }
 
 static void handle___pkvm_start_teardown_vm(struct kvm_cpu_context *host_ctxt)
@@ -961,7 +962,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_init_vcpu),
 	HANDLE_FUNC(__pkvm_vcpu_in_poison_fault),
 	HANDLE_FUNC(__pkvm_force_reclaim_guest_page),
-	HANDLE_FUNC(__pkvm_reclaim_dying_guest_page),
+	HANDLE_FUNC(__pkvm_reclaim_dying_guest),
 	HANDLE_FUNC(__pkvm_start_teardown_vm),
 	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 642096b2e711..25a86b318dfc 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -898,7 +898,8 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 	return check_page_state_range(&vm->pgt, addr, size, &d);
 }
 
-static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep, u64 *physp)
+static int __get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa,
+				 kvm_pte_t *ptep, u64 *physp, s8 *levelp)
 {
 	kvm_pte_t pte;
 	u64 phys;
@@ -912,20 +913,32 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
 		return -EHWPOISON;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
-		return -E2BIG;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + kvm_granule_size(level));
 	if (WARN_ON(ret))
 		return ret;
 
 	*ptep = pte;
 	*physp = phys;
+	*levelp = level;
 
 	return 0;
 }
 
+static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, u64 size,
+			       kvm_pte_t *ptep, u64 *physp)
+{
+	s8 level;
+	int ret;
+
+	ret = __get_valid_guest_pte(vm, ipa, ptep, physp, &level);
+	if (ret)
+		return ret;
+
+	return kvm_granule_size(level) == size ? 0 : -E2BIG;
+}
+
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
@@ -1008,7 +1021,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
 	if (ret)
 		goto unlock;
 
@@ -1040,7 +1053,7 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
 	if (ret)
 		goto unlock;
 
@@ -1346,7 +1359,7 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 
 	ipa = hyp_pfn_to_phys(gfn);
 	guest_lock_component(vm);
-	ret = get_valid_guest_pte(vm, ipa, &pte, &pa);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
 	if (ret)
 		goto unlock_guest;
 
@@ -1374,35 +1387,40 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	return ret;
 }
 
-int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_reclaim_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	u64 phys;
+	u64 size;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	switch (guest_get_page_state(pte, ipa)) {
 	case PKVM_PAGE_OWNED:
-		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
-		hyp_poison_range(phys, PAGE_SIZE);
+		WARN_ON(__host_check_page_state_range(phys, size, PKVM_NOPAGE));
+		hyp_poison_range(phys, size);
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
-		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+		WARN_ON(__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED));
 		break;
 	default:
 		ret = -EPERM;
 		goto unlock;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE));
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size));
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 
 unlock:
 	guest_unlock_component(vm);
@@ -1555,11 +1573,10 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = __get_valid_guest_pte(vm, ipa, &pte, &phys, &level);
 	if (ret)
 		return ret;
-	if (!kvm_pte_valid(pte))
-		return -ENOENT;
+
 	if (size && kvm_granule_size(level) != size)
 		return -E2BIG;
 
@@ -1570,11 +1587,6 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (state != PKVM_PAGE_SHARED_BORROWED)
 		return -EPERM;
 
-	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + size);
-	if (WARN_ON(ret))
-		return ret;
-
 	for_each_hyp_page(page, phys, size) {
 		if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
 			return -EPERM;
@@ -1946,7 +1958,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn + 1, vm);
+	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + 1, 1, vm);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ad9afe2cd1b9..6590c4de7fd2 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -965,7 +965,7 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 	unmap_donated_memory_noclear(addr, size);
 }
 
-int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
+int __pkvm_reclaim_dying_guest(pkvm_handle_t handle, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
 	int ret = -EINVAL;
@@ -974,7 +974,7 @@ int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
 		return ret;
 
 	if (hyp_vm->kvm.arch.pkvm.is_dying)
-		ret = __pkvm_host_reclaim_page_guest(gfn, hyp_vm);
+		ret = __pkvm_host_reclaim_guest(gfn, nr_pages, hyp_vm);
 
 	put_pkvm_hyp_vm(hyp_vm);
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 99100204b093..5b4256b19507 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -369,8 +369,9 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		struct page *page;
 
-		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
-					handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest,
+					handle, mapping->gfn,
+					(u64)mapping->nr_pages);
 		if (WARN_ON(ret))
 			continue;
 
-- 
2.55.0.1007.g17ff1f9808-goog


