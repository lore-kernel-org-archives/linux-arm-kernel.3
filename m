Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97333CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ew/LlPLw3Lt+f/j01bC1s7trU+R/AxgJa4nxqXWW84s=; b=y/OTbUdNOBVMj1HDaTk1LTWs9Y
	+bI+8ZFQkHXz3E93HxtPUmYQ6Vyp7XvLVS2bZCtH7ngIxSZ527wWzzWXAJpFdRdunEeN+GDTRQJm1
	7I4sQwFiJk4TZ2EvopJmd0t6++OcCfCaPLwxOrzjZQJ1CAlKw17YQTbIf8Qoy2+hRW0Yab6HND3+O
	+fyNTqwyHyDC5IJJ0UvXWT4OkRrhMcuygZGQE/h9Zj+m62Qt0M6qit1CFvORa0xpMCj+8CKy0AA4F
	2grmfUgibhM8CLU5f1y9Smf5155Uro4mag/bWbTbTxZDD1fWKdd1lP7zNPnch5ehese97L1jsj/ke
	vrgvF0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc48T-00000006e3B-30wp;
	Tue, 23 Jun 2026 16:38:05 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc48R-00000006e2L-3426
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782232681;
	bh=ew/LlPLw3Lt+f/j01bC1s7trU+R/AxgJa4nxqXWW84s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SOUjBCpRFJEBDCvpTKdlmUMx771wapPNm6YSGdCtwMiaY+dxe2a26oik5hWlSYj+d
	 8mG5IsXmotNVJiQcPgStBJr+2uU2HpQ2J572izQknyn8RDKpF6cdXSImocThXlxTT/
	 5v1tndf+BiDSt/jOHeSsg2ymmR3K+C4LsT7yKblA=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gl9jP4zf7z110k;
	Tue, 23 Jun 2026 16:38:01 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gl9jN59Clz10xM;
	Tue, 23 Jun 2026 16:38:00 +0000 (UTC)
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
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: skip pKVM cache flushes for non cacheable mappings
Date: Tue, 23 Jun 2026 16:37:55 +0000
Message-ID: <20260623163756.4591-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623160339.15143-1-include@grrlz.net>
References: <20260623160339.15143-1-include@grrlz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_093803_919556_7DEC71DC 
X-CRM114-Status: GOOD (  13.49  )
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
Changes in v2:
- Add patch 2 for the pKVM permission fault mapping cache bug.

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

