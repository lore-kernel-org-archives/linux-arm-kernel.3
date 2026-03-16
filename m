Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA5AF53D86
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/gltErnyzpbonZeAD4a0mEiIqBsayxQ2i+AvDgyIjg=; b=x+LDREx29GtEPQ59KmrPQAfGt6
	2ZowhFz70KYPcnNuHxM/eNokG2tXc3BtdNGYpuK+Prch0V5lGx5ZU4OxqU+liE+Uq6uyiVlSgeJUE
	rq2J9qZ9jp2OtKR42XRRMfUkcATDoEiy0OSbT6a+x5F3LM/ZmpA5n5F/z5/IGFbOSHydwCmKJO+h+
	bdDJHEctu99ULpEh+uRY3XMUQD2aJc9+ajsRMc3+RDdxnzgk/7Fdjjzp2TlDh/16ilaxvJekGfIsq
	pwMq3WaOmJ56zvc34WBCi+4oMN2/Zd1TNlChBhWW30KcE5xo/VmX7vpsyD5cMi8LgNFSPM9XVlEqG
	IEoCXG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9n-00000004cqN-22ST;
	Mon, 16 Mar 2026 17:55:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C9h-00000004cl6-1H4c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7A566111B;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A978C19425;
	Mon, 16 Mar 2026 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683704;
	bh=Yhcoi82LDcFIJ95YljMG/cgOkIvsAJkNqfTlNH0oGkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qAR03LhDFV3kpzjK+ixo1mZWgNxg4KNv7qXd3SQQCVq+6hMiyigYNfTJRJiu71S8t
	 oSQ43y6jAyIh4P0WvOflWSJ2N9P6LZdWrJCSlgsS0HEpnym5ucZIS3kk/1Y7Fn6eqq
	 4sbc0FC4Tag/iSCFve2hB73DZYV93nHFK+/U30mHEDnEtM7N3zzVl6zNKhIxpEOzFJ
	 I7qHypPMDSJQ/S3+3MDc7pvKNh6Tf3Z7GXqLk/i2KGJup4RGBTJqbXlvteqYAWeQnz
	 Ml3+wW10eldd8NjzXb7YmqFPW3Zz/P5GSUJDmoT3/L/dLecJJ2jihUh3rCAC7IbT6y
	 oBKHFPE7H0aSg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w2C9e-00000002XDx-31wW;
	Mon, 16 Mar 2026 17:55:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 15/17] KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
Date: Mon, 16 Mar 2026 17:54:48 +0000
Message-ID: <20260316175451.1866175-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316175451.1866175-1-maz@kernel.org>
References: <20260316175451.1866175-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The 'prot' field is the only one left in kvm_s2_fault. Expose it
directly to the functions needing it, and get rid of kvm_s2_fault.

It has served us well during this refactoring, but it is now no
longer needed.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 45 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 97cb3585eba03..9b5df70807875 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1729,10 +1729,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 	return vma_shift;
 }
 
-struct kvm_s2_fault {
-	enum kvm_pgtable_prot prot;
-};
-
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 {
 	return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
@@ -1856,8 +1852,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 }
 
 static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
-				     struct kvm_s2_fault *fault,
-				     const struct kvm_s2_fault_vma_info *s2vi)
+				     const struct kvm_s2_fault_vma_info *s2vi,
+				     enum kvm_pgtable_prot *prot)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	bool writable = s2vi->map_writable;
@@ -1885,23 +1881,25 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 		return 1;
 	}
 
+	*prot = KVM_PGTABLE_PROT_R;
+
 	if (s2fd->nested)
-		adjust_nested_fault_perms(s2fd->nested, &fault->prot, &writable);
+		adjust_nested_fault_perms(s2fd->nested, prot, &writable);
 
 	if (writable)
-		fault->prot |= KVM_PGTABLE_PROT_W;
+		*prot |= KVM_PGTABLE_PROT_W;
 
 	if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
-		fault->prot |= KVM_PGTABLE_PROT_X;
+		*prot |= KVM_PGTABLE_PROT_X;
 
 	if (s2vi->map_non_cacheable)
-		fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
-			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
+		*prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
+			KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
 	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
-		fault->prot |= KVM_PGTABLE_PROT_X;
+		*prot |= KVM_PGTABLE_PROT_X;
 
 	if (s2fd->nested)
-		adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
+		adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 
 	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
@@ -1913,11 +1911,12 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 }
 
 static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
-			    struct kvm_s2_fault *fault,
-			    const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
+			    const struct kvm_s2_fault_vma_info *s2vi,
+			    enum kvm_pgtable_prot prot,
+			    void *memcache)
 {
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
-	bool writable = fault->prot & KVM_PGTABLE_PROT_W;
+	bool writable = prot & KVM_PGTABLE_PROT_W;
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	struct kvm_pgtable *pgt;
 	long perm_fault_granule;
@@ -1970,12 +1969,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		 * Drop the SW bits in favour of those stored in the
 		 * PTE, which will be preserved.
 		 */
-		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
+		prot &= ~KVM_NV_GUEST_MAP_SZ;
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
-								 fault->prot, flags);
+								 prot, flags);
 	} else {
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
-							 __pfn_to_phys(pfn), fault->prot,
+							 __pfn_to_phys(pfn), prot,
 							 memcache, flags);
 	}
 
@@ -1999,9 +1998,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	struct kvm_s2_fault_vma_info s2vi = {};
-	struct kvm_s2_fault fault = {
-		.prot = KVM_PGTABLE_PROT_R,
-	};
+	enum kvm_pgtable_prot prot;
 	void *memcache;
 	int ret;
 
@@ -2026,13 +2023,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret != 1)
 		return ret;
 
-	ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
+	ret = kvm_s2_fault_compute_prot(s2fd, &s2vi, &prot);
 	if (ret) {
 		kvm_release_page_unused(s2vi.page);
 		return ret;
 	}
 
-	return kvm_s2_fault_map(s2fd, &fault, &s2vi, memcache);
+	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.47.3


