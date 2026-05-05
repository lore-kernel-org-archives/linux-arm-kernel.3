Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2500FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8eaSiikbA3CFaqlA4O4HHdnlmfO8rSCrFnUvShumAlg=; b=2eSQge/NQ0AeMHlHGJbhnguY6Y
	Gq0U51kfFn8x1hXUfcbTmWKwhIcBVYsRast8hphwCFsEVOtlBBs68F+UNxQ9uju17+cpibDMLabcS
	p5ljaTkC0tuGV8dwS68C1KGJJjfoeAwvJb76vLr1st14OuDsEGf7ItrJ9YpTx19BXx21no+vdIRLi
	rGg8InjYlKlyuTUOI7RH4xZVqMXuIMubLAMUVSi2zyVQQ7Y0h9pPdKRPkb28ibAU0wk6Ls+IFD9tB
	o+J/kKBDEhMjD7CR09tGhOM8DQsrwZ3+0wLz7TAKFyKm4PX2Mfkn5ZgHefmo1kljnLEdBpRI3VlTu
	qnzTtO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCPF-0000000FhiG-3kGQ;
	Tue, 05 May 2026 09:49:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCPC-0000000Fhhi-31Wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:49:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09335293B;
	Tue,  5 May 2026 02:49:21 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFDD23F836;
	Tue,  5 May 2026 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777974566; bh=aqm/uVvLu0DWgsxmTnZocXFueY6Lf/rU5yzfpqC6n3A=;
	h=From:To:Cc:Subject:Date:From;
	b=qwIMQKGrdP67REy19yNT+t5KV0G8VpMpEWaUlM8zhUwjBhI5mfpV1KwNZMMhJfJlx
	 LFwsZ14s4FpIMoOMYzjoWAe+6YHBdL0fuMpwDsgWxwyWAkuEdpuZMZdffFY+2M3erp
	 GD6H3sz2i2Oa5u1uDrfcF40RFyRELGzVOmE/wjYM=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	tabba@google.com
Cc: mark.rutland@arm.com
Subject: [PATCH v2] KVM: arm64: Handle permission faults with guest_memfd
Date: Tue,  5 May 2026 10:49:13 +0100
Message-ID: <20260505094913.75317-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_024930_993003_C82387C3 
X-CRM114-Status: GOOD (  18.29  )
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

gmem_abort() calls kvm_pgtable_stage2_map() to make changes to stage 2. It
does this for both relaxing permissions on an existing mapping and to
install a missing mapping.

kvm_pgtable_stage2_map() doesn't make changes to stage 2 if there is an
existing, valid entry and the new entry modifies only the permissions.
This is checked in:

kvm_pgtable_stage2_map()
  stage2_map_walk_leaf()
     stage2_map_walker_try_leaf()
       stage2_pte_needs_update()

and if only the permissions differ, kvm_pgtable_stage2_map() returns
-EAGAIN and KVM returns to the guest to replay the instruction. The
assumption is that a concurrent fault on a different VCPU already mapped
the faulting IPA, and replaying the instruction will either succeed, or
cause a permission fault, which should be handled with
kvm_pgtable_stage2_relax_perms().

gmem_abort(), on a read or write fault on a system without DIC (instruction
cache invalidation required for data to instruction coherence), installs a
valid entry with read and write permissions, but without executable
permissions. On an execution fault on the same page, gmem_abort() attempts
to relax the permissions to allow execution, but calls
kvm_pgtable_stage2_map() to change the existing, valid, entry.
kvm_pgtable_stage2_map() returns -EAGAIN and KVM resumes execution from the
faulting instruction, which leads to an infinite loop of permission faults
on the same instruction.

Allow the guest to make progress by using kvm_pgtable_stage2_relax_perms()
to relax permissions.

Fixes: a7b57e099592 ("KVM: arm64: Handle guest_memfd-backed guest page faults")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

v1: https://lore.kernel.org/kvmarm/20260430132351.280766-1-alexandru.elisei@arm.com/

Changes from v1:
- Rebased on top of v7.1-rc2.
- Initialised memcache to NULL (Fuad).
- Copied kvm_pgtable_stage2_relax_perms() comment from kvm_s2_fault_map()
  (Fuad).
- Fixed KVM_PGT_FN() macro invocation (Fuad).

Same as before, tested booting a linux VM on Orion O6, no pkvm, no nested virt.

 arch/arm64/kvm/mmu.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..4da9281312eb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1576,21 +1576,24 @@ struct kvm_s2_fault_desc {
 static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
+	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
 	unsigned long mmu_seq;
 	struct page *page;
 	struct kvm *kvm = s2fd->vcpu->kvm;
-	void *memcache;
+	void *memcache = NULL;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
 	int ret;
 
-	memcache = get_mmu_memcache(s2fd->vcpu);
-	ret = topup_mmu_memcache(s2fd->vcpu, memcache);
-	if (ret)
-		return ret;
+	if (!perm_fault) {
+		memcache = get_mmu_memcache(s2fd->vcpu);
+		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
+		if (ret)
+			return ret;
+	}
 
 	if (s2fd->nested)
 		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
@@ -1631,9 +1634,19 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		goto out_unlock;
 	}
 
-	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-						 __pfn_to_phys(pfn), prot,
-						 memcache, flags);
+	if (perm_fault) {
+		/*
+		 * Drop the SW bits in favour of those stored in the
+		 * PTE, which will be preserved.
+		 */
+		prot &= ~KVM_NV_GUEST_MAP_SZ;
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+								 prot, flags);
+	} else {
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
+							 __pfn_to_phys(pfn), prot,
+							 memcache, flags);
+	}
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.54.0


