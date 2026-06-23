Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F9CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qp76MOZfkgfbvVC3NAMXAD7D03E4T9rNo0rJqkiEJiI=; b=MR/c9+DXi0H9ml3BMxy7EyOyO6
	h0T0+1IAKEFAXguWSg+KFKorhXAFESIiMezkugvXivhv41hmiSdPC5vVYi4aV1ZJg8XL6qmbMEYX1
	hC+UsCumcMotzArl7fuZHJUnR6le3YKE8+om2T4ozRSEUAd6wtv/sP9ahNDMkvijpTzkeAlpyVtPa
	Jm5mgO9II4RoBti6Tka3qZ1bCrZAfOrrCEKUsasUlTAEC/7nulrzHnNLNHGS0vCxBEvAI+4agVQ1Y
	rTpPkbOvDQZQw/Mf2KmZNslrgBObGo7jt6LYV4LxyO1VE7wK/8YnxsiW8qmQT9nsDnBDzNetCEXe1
	zgiwDbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3bL-00000006bAR-246L;
	Tue, 23 Jun 2026 16:03:51 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3bI-00000006b9D-3Q3a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782230623;
	bh=qp76MOZfkgfbvVC3NAMXAD7D03E4T9rNo0rJqkiEJiI=;
	h=From:To:Cc:Subject:Date:From;
	b=roH4qtC/vCJAmrGeyJBBp+EBB3owg2oMpGfPEaMRjNOAHg+SZF+HbaoH7bG+8ARfx
	 yJC1StVlOmpPO41qaaT090JQeNsMxzxy3dj2t3pZ2vozAHaQ8/gG/z4iiTiGQXj1aj
	 JaiMqrPOchzCEWycjntF7H8RSOUdN6qXqfCDOtw4=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gl8xq50DFz110W;
	Tue, 23 Jun 2026 16:03:43 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gl8xp6CCYz10hk;
	Tue, 23 Jun 2026 16:03:42 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: skip pKVM cache flushes for non cacheable mappings
Date: Tue, 23 Jun 2026 16:03:39 +0000
Message-ID: <20260623160339.15143-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090349_289326_A8D6C0B6 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/include/asm/kvm_pkvm.h | 1 +
 arch/arm64/kvm/pkvm.c             | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..d9dd8239910d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -196,6 +196,7 @@ struct pkvm_mapping {
 	u64 gfn;
 	u64 pfn;
 	u64 nr_pages;
+	bool cacheable;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 428723b1b0f5..105ab1258066 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -473,6 +473,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
 	mapping->nr_pages = size / PAGE_SIZE;
+	mapping->cacheable = !(prot & (KVM_PGTABLE_PROT_DEVICE |
+				       KVM_PGTABLE_PROT_NORMAL_NC));
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -517,9 +519,13 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	struct pkvm_mapping *mapping;
 
 	lockdep_assert_held(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
+	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
+		if (!mapping->cacheable)
+			continue;
+
 		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
 					  PAGE_SIZE * mapping->nr_pages);
+	}
 
 	return 0;
 }
-- 
2.53.0


