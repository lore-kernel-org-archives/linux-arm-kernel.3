Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F821606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vmbpULkc;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LJ4IguBc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=txtaZAcRMKdG/6PvTtOqQBPubj70UFKtaDsquMMzFvw=; b=vmbpULkcbKyNk0
	odF/OhOcEDz6875zAGjPyBt5u++oU21Ow9i1l1R9DaUDsY+yEq+ID3rXnb9awXcNw2u6oQCJx3nI6
	ggqxYCMsOhrtAKP2n5SPSKl6Y+pairXGVglFMK96/bFwLqURgLfw8wt1cp8Y6m6l1XWIj9bl+zGYx
	3eyjgU6djYkA8box96V0GdFXWgKddzZHGSK+k2dGeLl1HeskJLGjARYm3FJfqPn19e2SrZXQtO2jO
	vYrelzvigsUEN8eDquyTNa7ujKck4nTZE11PqG5LsYqSLHWmbADtzLIMnsCPAiGbxmT1Hn0mNeYbg
	hRMTF4JzLMbt8uZg220Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMO-00000005Mmg-06Qg;
	Wed, 04 Nov 2026 12:45:00 +0000
Received: from out-152.mta1.migadu.com ([95.215.58.152] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMJ-00000005Mkv-2H6d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:44:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QEva7TCaSMpCjlP1oVH5gOdE6FBEUp30xJbq+yDM/Y0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793796293; v=1; x=1794401093;
 b=LJ4IguBc02zgkRjzp5f0Z2EurZt1jYdFb4ffyLRG9VK5ObfCDxQmBNZ2sUzTo8FIKWyfVdTu
 PQC4fr/4DSYkvOhK/Z4GINxzS/4ERWdXxAJYErs274q7t5B98uuUPLW14xLy7VgoRC04ty/bb/X
 XPfPZw8jc1nq4G1k6QrYdaVA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 05ef130eda10926c;
	Wed, 04 Nov 2026 12:44:53 +0000
X-Mizu-Trace-ID: 05ef130eda10926c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping
Date: Wed,  4 Nov 2026 12:44:51 +0000
Message-ID: <20261104124451.2148724-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104124451.2148724-1-fuad.tabba@linux.dev>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044456_924181_6EA5A069 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pKVM keeps a VM's stage-2 mappings in an interval tree, and
pkvm_pgtable_stage2_destroy_range() releases the ones in its range.
stage2_destroy_range() still calls it for every block-sized chunk of the
IPA space. As pKVM gives every VM the host's IPA limit, a teardown with
LPA2 makes 2^27 calls with 16K pages (2^22 with 4K), however little the
VM maps.

Return the address of the next mapping instead, or U64_MAX when none is
left, so that the teardown skips the space between mappings. No mapping
crosses a chunk boundary, as pKVM maps at most PMD_SIZE, so the next one
starts at or above the end of the range. A VM without a handle doesn't
have anything mapped, so return U64_MAX for it straight away.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f21c3326dda68..77315c83c61b3 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -504,9 +504,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+	struct pkvm_mapping *mapping;
 
 	if (!handle)
-		return addr + size;
+		return U64_MAX;
 
 	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
@@ -518,7 +519,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 	else
 		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 
-	return addr + size;
+	/* Mappings left by a failed release are still in the tree, so look past the range. */
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
+
+	return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3


