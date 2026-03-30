Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771621061B0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1afaoUkgWpayglX7JaMUmVUsABX1EsIYOI23mIIngQ=; b=jq/JTC32RpalP/3m+mDrqv5C2O
	f7a2CNo0aRyOVG5NI3ukvwr5E7zN6SaK5Qr95v1kEwat/bNChbbN9Gf3TLwOQB3Y14MkBXG6pbZHU
	j+TO3UJ7eDK5/BcupGQLQuHOCNVtYBmT7FW1SbyyCqc3HovzH85AOYJ5m6GaPWvH+FdvBBhN4Kr6Q
	qJ5i84B/LP4ontVZDo9ylBG68VR0AREiLyAzlXpDLJCQn3+ygLKXmzWHjoiZQo3ytRkksWvYDK8+n
	piQ3NfZB1wd39ksr2sM3rUMbk8ymFS8ZryOrkey9beNImBBkud92DsPbVNGQ8kAj2XWBy1HjJ+46g
	ljYGYmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dxd-0000000BUmA-3mB4;
	Mon, 30 Mar 2026 14:51:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dwy-0000000BUKU-3I1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39BC360054;
	Mon, 30 Mar 2026 14:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32796C4CEF7;
	Mon, 30 Mar 2026 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882243;
	bh=hpR4vunYs1NRpLwCfnwo5nIvJ4sowBJ/HXKzz+/erhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RjqxzQnogh38wEMc6fMwfmjBeq0lqNnE4Dlur958z2UuUEczONnvyuqvuGYlvmAB3
	 ljCVmIA8PR+Ekqr3iF/DiWrzUuDxlo45igdNnkdisrrObxcJ3H0uzAtsgtvtsybiPx
	 iKq9n4nWeHZoFxJRn/iiUtD0NjFzXUtREB32Da3exmNh0cMYq1vPbx39mjJLwqCvY8
	 WjBPl6wGlS88wZp85CtwIgjrznG+LGanMMZdzgPuWkx+hDjfMeOtxCFY81ddFGDFUN
	 XJyCUzeV3zDZG5EklLNnthAAmOf0AoOJOz1njFBQb+gx00ZZ0JCm+HX47EmzIeLMDe
	 BbzTE5uAdVtjQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 34/38] KVM: arm64: Register 'selftest_vm' in the VM table
Date: Mon, 30 Mar 2026 15:48:35 +0100
Message-ID: <20260330144841.26181-35-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In preparation for extending the pKVM page ownership selftests to cover
forceful reclaim of donated pages, rework the creation of the
'selftest_vm' so that it is registered in the VM table while the tests
are running.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 53 ++++---------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 49 +++++++++++++++++
 3 files changed, 61 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 99d8398afe20..5031879ccb87 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -76,6 +76,8 @@ static __always_inline void __load_host_stage2(void)
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
 void pkvm_ownership_selftest(void *base);
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt);
+void teardown_selftest_vm(void);
 #else
 static inline void pkvm_ownership_selftest(void *base) { }
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 13d2cb2f5fab..d8f8ebe59129 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1648,53 +1648,18 @@ struct pkvm_expected_state {
 
 static struct pkvm_expected_state selftest_state;
 static struct hyp_page *selftest_page;
-
-static struct pkvm_hyp_vm selftest_vm = {
-	.kvm = {
-		.arch = {
-			.mmu = {
-				.arch = &selftest_vm.kvm.arch,
-				.pgt = &selftest_vm.pgt,
-			},
-		},
-	},
-};
-
-static struct pkvm_hyp_vcpu selftest_vcpu = {
-	.vcpu = {
-		.arch = {
-			.hw_mmu = &selftest_vm.kvm.arch.mmu,
-		},
-		.kvm = &selftest_vm.kvm,
-	},
-};
-
-static void init_selftest_vm(void *virt)
-{
-	struct hyp_page *p = hyp_virt_to_page(virt);
-	int i;
-
-	selftest_vm.kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
-	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, virt));
-
-	for (i = 0; i < pkvm_selftest_pages(); i++) {
-		if (p[i].refcount)
-			continue;
-		p[i].refcount = 1;
-		hyp_put_page(&selftest_vm.pool, hyp_page_to_virt(&p[i]));
-	}
-}
+static struct pkvm_hyp_vcpu *selftest_vcpu;
 
 static u64 selftest_ipa(void)
 {
-	return BIT(selftest_vm.pgt.ia_bits - 1);
+	return BIT(selftest_vcpu->vcpu.arch.hw_mmu->pgt->ia_bits - 1);
 }
 
 static void assert_page_state(void)
 {
 	void *virt = hyp_page_to_virt(selftest_page);
 	u64 size = PAGE_SIZE << selftest_page->order;
-	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
+	struct pkvm_hyp_vcpu *vcpu = selftest_vcpu;
 	u64 phys = hyp_virt_to_phys(virt);
 	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
 	struct pkvm_hyp_vm *vm;
@@ -1709,10 +1674,10 @@ static void assert_page_state(void)
 	WARN_ON(__hyp_check_page_state_range(phys, size, selftest_state.hyp));
 	hyp_unlock_component();
 
-	guest_lock_component(&selftest_vm);
+	guest_lock_component(vm);
 	WARN_ON(__guest_check_page_state_range(vm, ipa[0], size, selftest_state.guest[0]));
 	WARN_ON(__guest_check_page_state_range(vm, ipa[1], size, selftest_state.guest[1]));
-	guest_unlock_component(&selftest_vm);
+	guest_unlock_component(vm);
 }
 
 #define assert_transition_res(res, fn, ...)		\
@@ -1725,14 +1690,15 @@ void pkvm_ownership_selftest(void *base)
 {
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_RWX;
 	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
-	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
-	struct pkvm_hyp_vm *vm = &selftest_vm;
+	struct pkvm_hyp_vcpu *vcpu;
 	u64 phys, size, pfn, gfn;
+	struct pkvm_hyp_vm *vm;
 
 	WARN_ON(!virt);
 	selftest_page = hyp_virt_to_page(virt);
 	selftest_page->refcount = 0;
-	init_selftest_vm(base);
+	selftest_vcpu = vcpu = init_selftest_vm(base);
+	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
 	size = PAGE_SIZE << selftest_page->order;
 	phys = hyp_virt_to_phys(virt);
@@ -1856,6 +1822,7 @@ void pkvm_ownership_selftest(void *base)
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
 
+	teardown_selftest_vm();
 	selftest_page->refcount = 1;
 	hyp_put_page(&host_s2_pool, virt);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 6f3b94a37fe3..8b906217c4c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -733,6 +733,55 @@ void __pkvm_unreserve_vm(pkvm_handle_t handle)
 	hyp_spin_unlock(&vm_table_lock);
 }
 
+#ifdef CONFIG_NVHE_EL2_DEBUG
+static struct pkvm_hyp_vm selftest_vm = {
+	.kvm = {
+		.arch = {
+			.mmu = {
+				.arch = &selftest_vm.kvm.arch,
+				.pgt = &selftest_vm.pgt,
+			},
+		},
+	},
+};
+
+static struct pkvm_hyp_vcpu selftest_vcpu = {
+	.vcpu = {
+		.arch = {
+			.hw_mmu = &selftest_vm.kvm.arch.mmu,
+		},
+		.kvm = &selftest_vm.kvm,
+	},
+};
+
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt)
+{
+	struct hyp_page *p = hyp_virt_to_page(virt);
+	int i;
+
+	selftest_vm.kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
+	WARN_ON(kvm_guest_prepare_stage2(&selftest_vm, virt));
+
+	for (i = 0; i < pkvm_selftest_pages(); i++) {
+		if (p[i].refcount)
+			continue;
+		p[i].refcount = 1;
+		hyp_put_page(&selftest_vm.pool, hyp_page_to_virt(&p[i]));
+	}
+
+	selftest_vm.kvm.arch.pkvm.handle = __pkvm_reserve_vm();
+	insert_vm_table_entry(selftest_vm.kvm.arch.pkvm.handle, &selftest_vm);
+	return &selftest_vcpu;
+}
+
+void teardown_selftest_vm(void)
+{
+	hyp_spin_lock(&vm_table_lock);
+	remove_vm_table_entry(selftest_vm.kvm.arch.pkvm.handle);
+	hyp_spin_unlock(&vm_table_lock);
+}
+#endif /* CONFIG_NVHE_EL2_DEBUG */
+
 /*
  * Initialize the hypervisor copy of the VM state using host-donated memory.
  *
-- 
2.53.0.1018.g2bb0e51243-goog


