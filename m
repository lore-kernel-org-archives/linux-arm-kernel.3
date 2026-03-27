Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC3410ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYDydTf6oyVDmClkCBu9tc7/UCL1TAmrdZNjMVHqy2Q=; b=b2SWxwouPuJqgnzdZAuyer8Ykv
	bt3N2kDhXrg9mKKaIfXXEY4CZer6x1ZSVix3DAratI/QOHCnC39L+4dXTL/DtpKjYOUkPGnFlGgcM
	BoxSrXSPst0g/9kisbkwpK/bK3EaRAUhB1YKxyG5cp+tBuyqo0Pp+9snHjiJOmoiitz0EQntoq27m
	wwSRComkXom1FIBH8hqcdW07WoeBSwf5CmxhDODm6Jmb87UboXlrKED2FdSmlHYfg43TMLRZn2VVq
	NDub+HBdXo3sVwphPyI/f7Ep0EE2A8a09UpK80o6ceiZiklCf1IG45xX5V7kK332WoCBZyXC4+3j+
	u9n0I+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uu-00000007Fpx-2PJl;
	Fri, 27 Mar 2026 11:37:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UN-00000007F56-2YY0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C2BF4473E;
	Fri, 27 Mar 2026 11:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E85CC2BCB5;
	Fri, 27 Mar 2026 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611391;
	bh=DX7aaCvaBWxdbCRuXoGc5YzRwc4DA18NuzPAQdjcd0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIpdiGBrKxpULDWAqEXqsGUizeVPFrS2LckaFMPTszUTCMO4dTzmFnhhZteX4ZxoR
	 iijcGCBOOpJTWamqzf5sCWqKlQC7Sx/qX3vkmYhOGWI6BzepVFuOd2FOZzBINRlheV
	 5suedTlyUcWHY1kKevszZbNpzAjr8OYIhtyfwDWqccwTygmOUX3Hk0oJ5wQEzYi0YD
	 NeOruieJJSLmBTd9DqhUmF2HQQOhh0ugCw1ZcgI8L1gl9KFBoTFLGnTkqHiqv0VDCO
	 T7N2cZ8Li5BAFSBMa3cCzSc8Am/dK9oMccXesf0d2JzFfCgFqGtM+b2nCHbaoDqE4a
	 glfTEJXVhUwhA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UL-00000006K4a-1XHZ;
	Fri, 27 Mar 2026 11:36:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 30/30] KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
Date: Fri, 27 Mar 2026 11:36:18 +0000
Message-ID: <20260327113618.4051534-31-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043631_721931_37065EA0 
X-CRM114-Status: GOOD (  13.21  )
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

Having fully converted user_mem_abort() to kvm_s2_fault_desc and
co, convert gmem_abort() to it as well. The change is obviously
much simpler.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index f4c8f72642e02..1fe7182be45ac 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1575,33 +1575,31 @@ struct kvm_s2_fault_desc {
 	unsigned long		hva;
 };
 
-static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-		      struct kvm_s2_trans *nested,
-		      struct kvm_memory_slot *memslot, bool is_perm)
+static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
-	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
 	unsigned long mmu_seq;
 	struct page *page;
-	struct kvm *kvm = vcpu->kvm;
+	struct kvm *kvm = s2fd->vcpu->kvm;
 	void *memcache;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
 	int ret;
 
-	ret = prepare_mmu_memcache(vcpu, true, &memcache);
+	ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
 	if (ret)
 		return ret;
 
-	if (nested)
-		gfn = kvm_s2_trans_output(nested) >> PAGE_SHIFT;
+	if (s2fd->nested)
+		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
 	else
-		gfn = fault_ipa >> PAGE_SHIFT;
+		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
 
-	write_fault = kvm_is_write_fault(vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
+	write_fault = kvm_is_write_fault(s2fd->vcpu);
+	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
 
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
@@ -1609,24 +1607,24 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
 	smp_rmb();
 
-	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
 	if (ret) {
-		kvm_prepare_memory_fault_exit(vcpu, fault_ipa, PAGE_SIZE,
+		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
 					      write_fault, exec_fault, false);
 		return ret;
 	}
 
-	if (!(memslot->flags & KVM_MEM_READONLY))
+	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
 		prot |= KVM_PGTABLE_PROT_W;
 
-	if (nested)
-		prot = adjust_nested_fault_perms(nested, prot);
+	if (s2fd->nested)
+		prot = adjust_nested_fault_perms(s2fd->nested, prot);
 
 	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		prot |= KVM_PGTABLE_PROT_X;
 
-	if (nested)
-		prot = adjust_nested_exec_perms(kvm, nested, prot);
+	if (s2fd->nested)
+		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 
 	kvm_fault_lock(kvm);
 	if (mmu_invalidate_retry(kvm, mmu_seq)) {
@@ -1634,7 +1632,7 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		goto out_unlock;
 	}
 
-	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, PAGE_SIZE,
+	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
 						 __pfn_to_phys(pfn), prot,
 						 memcache, flags);
 
@@ -1643,7 +1641,7 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	kvm_fault_unlock(kvm);
 
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
 
 	return ret != -EAGAIN ? ret : 0;
 }
@@ -2300,8 +2298,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	};
 
 	if (kvm_slot_has_gmem(memslot))
-		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
-				 esr_fsc_is_permission_fault(esr));
+		ret = gmem_abort(&s2fd);
 	else
 		ret = user_mem_abort(&s2fd);
 
-- 
2.47.3


