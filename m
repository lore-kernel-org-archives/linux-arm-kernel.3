Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349AAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ApOH0P25anaf8G9Ri8bIsKw129Af3l9xDMyuv0tC9qM=; b=pZ5BLSns2I/ohJWo8+iP50j77C
	bhchbNtUw7+7Sh8pH5SmmcB0peB66ufTJk6Xk4vL2TxI0d1s2Rxp+hBZ9r6OXJTWLvDbtzXEUhB+B
	YfZYOYprv3iB02UTcGUdAM7ky6Ut0DgmkGzqmRjqtypfRMnpHiS0VcMSFouVZgn/F0p7s0rB66hyK
	WwkdmRGp241P28+p2xZzcLjdzp1FxRLBPhtzpxZzE/42DM3E/VtclByPeq5Mdl5lo0CYkzJ5n8FC2
	k6UQAWuRMyGYbfyUZccmmIPGE/fduN4VwUxNXS5Bi2F9vi+xA6qeLdxPKXAoRTSXKxzT813yHt2Sp
	Ly7ZNq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf0Y1-00000002tfl-0Wij;
	Wed, 01 Jul 2026 19:24:37 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf0Xy-00000002te8-00mj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 19:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782933869;
	bh=ApOH0P25anaf8G9Ri8bIsKw129Af3l9xDMyuv0tC9qM=;
	h=From:To:Cc:Subject:Date:From;
	b=IOwZNiFZdBWwBCt2IuZiSddeTU0g11S2tUIJJKy9YTY23EeaxgvxYCMGyhRNOIAUy
	 jC/bANTXx7vvqa+HEHEC0GBj0nsmUDBP/XbZ5mGDFFopDYS9KfSRB0HQIjcsnVFCpt
	 QwLnMqJ+VeVLnsoPZI1r5bkJuCaOfan43oU3N8pQ=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gr91n0gF0z115b;
	Wed, 01 Jul 2026 19:24:29 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gr91l0mrkz112N;
	Wed, 01 Jul 2026 19:24:27 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>
Subject: [PATCH v4] KVM: arm64: Record whether pKVM stage 2 mapping is cacheable
Date: Wed,  1 Jul 2026 19:24:28 +0000
Message-ID: <20260701192428.17430-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_122434_505861_1D2D6AED 
X-CRM114-Status: GOOD (  13.70  )
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

pKVM keeps its own mapping list for stage 2 operations. Its flush path
uses that list directly, so it lost the PTE attribute check done by the
generic stage 2 walker.

Record whether a mapping is cacheable and skip cache maintenance for
mappings that are not cacheable.

Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
Changes since V3:
- addressed some review :)

 arch/arm64/kvm/pkvm.c | 51 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..6d1cad890c7e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -302,9 +302,32 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 	return m->gfn * PAGE_SIZE;
 }
 
+#define PKVM_MAPPING_NR_PAGES_MASK     GENMASK_ULL(47, 0)
+#define PKVM_MAPPING_NC                        BIT_ULL(48)
+
+static u64 pkvm_mapping_nr_pages(struct pkvm_mapping *m)
+{
+	return m->nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
+}
+
+static bool pkvm_mapping_is_nc(struct pkvm_mapping *m)
+{
+	return m->nr_pages & PKVM_MAPPING_NC;
+}
+
+static void pkvm_mapping_set_nr_pages(struct pkvm_mapping *m, u64 nr_pages,
+				      bool nc)
+{
+	WARN_ON_ONCE(nr_pages & ~PKVM_MAPPING_NR_PAGES_MASK);
+
+	m->nr_pages = nr_pages & PKVM_MAPPING_NR_PAGES_MASK;
+	if (nc)
+		m->nr_pages |= PKVM_MAPPING_NC;
+}
+
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
+	return (m->gfn + pkvm_mapping_nr_pages(m)) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -350,7 +373,7 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 			continue;
 
 		page = pfn_to_page(mapping->pfn);
-		WARN_ON_ONCE(mapping->nr_pages != 1);
+	       WARN_ON_ONCE(pkvm_mapping_nr_pages(mapping) != 1);
 		unpin_user_pages_dirty_lock(&page, 1, true);
 		account_locked_vm(current->mm, 1, false);
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -369,7 +392,7 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
-					mapping->nr_pages);
+				       pkvm_mapping_nr_pages(mapping));
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -448,7 +471,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		 * permission faults are handled in the relax_perms() path.
 		 */
 		if (mapping) {
-			if (size == (mapping->nr_pages * PAGE_SIZE))
+			if (size == (pkvm_mapping_nr_pages(mapping) * PAGE_SIZE))
 				return -EAGAIN;
 
 			/*
@@ -472,7 +495,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
-	mapping->nr_pages = size / PAGE_SIZE;
+	pkvm_mapping_set_nr_pages(mapping, size / PAGE_SIZE,
+				  (prot & (KVM_PGTABLE_PROT_DEVICE |
+					   KVM_PGTABLE_PROT_NORMAL_NC)));
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -503,7 +528,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
-					mapping->nr_pages);
+				       pkvm_mapping_nr_pages(mapping));
 		if (WARN_ON(ret))
 			break;
 	}
@@ -517,9 +542,13 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	struct pkvm_mapping *mapping;
 
 	lockdep_assert_held(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
+	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
+		if (pkvm_mapping_is_nc(mapping))
+			continue;
+
 		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
-					  PAGE_SIZE * mapping->nr_pages);
+					  PAGE_SIZE * pkvm_mapping_nr_pages(mapping));
+	}
 
 	return 0;
 }
@@ -536,8 +565,10 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mapping->nr_pages, mkold);
+		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest,
+					   handle, mapping->gfn,
+					   pkvm_mapping_nr_pages(mapping),
+					   mkold);
 
 	return young;
 }
-- 
2.53.0


