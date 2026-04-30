Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8600FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H+FQQdUSUjqMNY6tDv8YsPpTF+bSTCh8bi8zB1UIfgM=; b=LJ1Y2snP6SMQGDFFwGlQbjY0HN
	jtppKsrP2P7xVY8YYXmPHmAQG9nN7+awKLGPH/7kd6gtigRpxBVvLhW6s+iNFYb34oTFZQga14CKJ
	LYOvO0RT9NK0ZShKWasoSiF/YeJx65ybB4VaSSB3zvilDYqoqhf+naOLurzNq0OBaUfAKVIzPx4G0
	jzfMKYNGc538hb/p8yWL2IJNvoWdBYacYt8FsbHD4CBprTLrjv6CfcSgQarEhGM+1G+yy1dADYRps
	K6MSEGZ5HvPq1lts8rSdhVZa2WT2zGTvgE8vW/9O0CxOHTXdG/NjtnLvoo8duN79blBkhy8cvf6F6
	/lerjWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRNG-00000005X8g-444f;
	Thu, 30 Apr 2026 13:24:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRNF-00000005X8E-0gA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:24:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC361AED;
	Thu, 30 Apr 2026 06:24:03 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 229D53F7B4;
	Thu, 30 Apr 2026 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777555449; bh=tQL3fqiLMsmztWBDjtrNObpqhCigVhOEjUfSXQJGAkE=;
	h=From:To:Cc:Subject:Date:From;
	b=LqevOcygKlIOkcNc7je+oj65sTA5Yyblv8SN9nHge2edOhj4JWH+BkMBlkm4zxdZI
	 LfTI9lZ+5Eezxd/AgevHwVJYESRDwG6JRgvCnb7oUmywsZEyOfkhtteod5aIU+c8Ue
	 3gOzUn+he2VILqZRPs8vjE0dam/J/cR1FbAkpQTU=
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
Subject: [PATCH] KVM: arm64: Handle permission faults with guest_memfd
Date: Thu, 30 Apr 2026 14:23:51 +0100
Message-ID: <20260430132351.280766-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_062413_325868_228E837D 
X-CRM114-Status: GOOD (  17.39  )
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

Lightly tested on an Orion O6 board, without pkvm, and without nested
virtualisation.

Doesn't apply cleanly on top of a7b57e099592, I can send a patch for that if
needed.

 arch/arm64/kvm/mmu.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d089c107d9b7..dff58de7703b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1576,6 +1576,7 @@ struct kvm_s2_fault_desc {
 static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
+	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
@@ -1587,10 +1588,12 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
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
@@ -1631,9 +1634,16 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		goto out_unlock;
 	}
 
-	ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-						 __pfn_to_phys(pfn), prot,
-						 memcache, flags);
+	if (perm_fault) {
+		/* Preserve the software bits from the existing table entry. */
+		prot &= ~KVM_NV_GUEST_MAP_SZ;
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms(pgt, s2fd->fault_ipa,
+								prot, flags));
+	} else {
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
+							 __pfn_to_phys(pfn), prot,
+							 memcache, flags);
+	}
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0


