Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE9F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTwzbFSmlbXHRE29PYWEvM30bUow78aea81TH6yFVOU=; b=lVcivijlT6WKRlVkROTvxZKTgo
	+S8FJr6xPu0i8Rx5MtYgNcG2Jf0NCuzbYYU9CfiEl+Ks6+aEVxfwPbO+DqCkwoR4UakKSvPoLbT4a
	LPqKRcsvQjvr2Ioqo0saHlXmVSHCnQAMBmjCfGm8m7a0oRIkA0sZOoWsb35kyDCk/xyNR2VZzigyV
	hH2TXYyU2DteHXnTGBWP9dOp/nTNDIvhOvM/YfURAA0KmgnIzZxpfV5yQvFJnE+qr7CSCdVO9yKBZ
	7Q+qN58LbGqzE1gUVK4hIyL3scsdPXoWxu8Cz8RwSXWcVQuWV9NwUBFumtkBbDazf+1QhKxFHP1KI
	S+QStdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xu-0000000239O-0zBz;
	Thu, 05 Mar 2026 14:46:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xr-0000000234O-0wLd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zTwzbFSmlbXHRE29PYWEvM30bUow78aea81TH6yFVOU=; b=rajxQ0wKnXzFkdQooXBL7nIFei
	LH3PdsxaaPyeTtm9mIgYY0vqqR+c1vGoCqG02Mkpj7Zfv61skBtGrCr5vucuiaCj/YTozeS6yM+Ud
	5LBvfTxM9YpL7OlJknE4BuL8Ua1ladZ6U0bEEm0TqA8f2/ucJOvi2cYw5OlJqp2TOtHDYniegz8Sq
	y9ZNXQGT1wTmWDafD1aGuYZy+jCyk1hvtm37EYQle2ZwveeJ1nxsn1IMgVRo9nViW9hlUwsVXR37c
	aMQ30DdiZmjnquBKKBzCGw1BiunlMPnmGbDEJysLStnE45FKn/RWu83qU6F87l3sJtiPZw9ZpRr+/
	BawSbvCA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xm-00000006yeS-2FIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37F4244051;
	Thu,  5 Mar 2026 14:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B09C116C6;
	Thu,  5 Mar 2026 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721965;
	bh=mT8UicIidpZbyG333ACFJzdZXDZVxwAGVewwY1/K3SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N36nOofWHNWUn8FiBNv/+vzZHZZ7sVmpXAYLWYIetuILggwl3GoXw8rbdw+jb5Ouz
	 pOfi6+ASl86Ipqc0vcBgSIgmkIuhirHeo8iLZg4oNyi/D6mADbU5vRxDo108znfCEA
	 hYsnL7dEF+9a0+i2ZCSXaeqenBt7vDN+Q8YMsrNgSAB9AW37ZtSh20RBcNlkDySBg2
	 6kLPH0Khwip1vjssrb23Wk8YY/ahWl6e8vBCMqjLNkp9/pMbLe9mQooCCmFd15S57e
	 i4xpMH2rW0GL7y3xKn+mEZPynNpji9/yYE3Lk1zaRBbOOlUkPxX7/YG/4bF3pbtdzS
	 89wsewZ6A/4Aw==
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
Subject: [PATCH v3 33/36] KVM: arm64: Register 'selftest_vm' in the VM table
Date: Thu,  5 Mar 2026 14:43:46 +0000
Message-ID: <20260305144351.17071-34-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144606_937703_7E897271 
X-CRM114-Status: GOOD (  18.59  )
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 53 ++++---------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 49 +++++++++++++++++
 3 files changed, 61 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index e41a128b0854..3ad644111885 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -77,6 +77,8 @@ static __always_inline void __load_host_stage2(void)
 
 #ifdef CONFIG_NVHE_EL2_DEBUG
 void pkvm_ownership_selftest(void *base);
+struct pkvm_hyp_vcpu *init_selftest_vm(void *virt);
+void teardown_selftest_vm(void);
 #else
 static inline void pkvm_ownership_selftest(void *base) { }
 #endif
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d13ea7b7e878..1f461a0e9a77 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1646,53 +1646,18 @@ struct pkvm_expected_state {
 
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
@@ -1707,10 +1672,10 @@ static void assert_page_state(void)
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
@@ -1723,14 +1688,15 @@ void pkvm_ownership_selftest(void *base)
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
@@ -1854,6 +1820,7 @@ void pkvm_ownership_selftest(void *base)
 	selftest_state.hyp = PKVM_PAGE_OWNED;
 	assert_transition_res(0,	__pkvm_host_donate_hyp, pfn, 1);
 
+	teardown_selftest_vm();
 	selftest_page->refcount = 1;
 	hyp_put_page(&host_s2_pool, virt);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ebfd9904ede6..794a19fa911d 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -727,6 +727,55 @@ void __pkvm_unreserve_vm(pkvm_handle_t handle)
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
2.53.0.473.g4a7958ca14-goog


