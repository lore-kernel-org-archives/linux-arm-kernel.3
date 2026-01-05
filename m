Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203C7C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCYsmcwG+vupArs9CCstylj8tFZzAy5OKOVUFDzDTtc=; b=XLDHIPPqpcMQQVk10oPXH+9Um6
	0q7CX8UjWegX7utmo7tqXE3i5pOVKdcMmp++AoUsD40fsfGZIXq3tqc9zvn6Px0PCbAnF3bGNVt9L
	OQt1nAQ2JxpiR6t5cEOQrOfbFRo+Tua84gyDTviTO2WCGBynEYt19ehWTmf/GNjxODlV5uNIyFqAX
	YxaTcUesVumc34lC2EzW+gRDk9GZlRqTghGTGDltjORhr1aTDmLXwRLmWpLfyGWN4glpg4gzL7p17
	jfmF8d0lFu0j6qWDbKnGjhiCmDjiOxWv0RAcf2cWv/bNEMGULlWl1z8lCRFkMEGWLsVf9Q09AHJ0f
	/yO1CJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmr5-0000000BeGf-1CxJ;
	Mon, 05 Jan 2026 15:50:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmr0-0000000BeAB-25IK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29BDE406AD;
	Mon,  5 Jan 2026 15:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBFEC116D0;
	Mon,  5 Jan 2026 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628246;
	bh=vgLyn6tJZl/IzUA/ABSnXGcwxUN7qnglUo+W23OuePQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLfh4s7U/2r8ZZGsSED3Z7sdHutH5ikw+xVospiq87BO5lP6IDbG1uSqEqrUOO6rJ
	 UsddN8WMrSufxfPrn4EUQehcO05ZiSfmsDPoi8t4HYNupxL5DSTpkgbROHIdZsk2q9
	 S1SViVnjFBcTtb3tbLmqQwXJfI3P9Oa/VFUxgBky3GQalThACNBoNMje38gemwrXth
	 C1zs6fliaPcqEnvZqs0qXQXVen5xyni8ljyTC24nib+sAJQ7kIGcmOUpr7Aym7sR2q
	 D9rt5Jn5s6dXVGdHLt7fDbRUzRXXNA2EnIsGeGnVLVhGKmpVtQdDgq/LOUUgx16XnJ
	 Q22BvbFAyRfVQ==
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
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 18/30] KVM: arm64: Introduce host_stage2_set_owner_metadata_locked()
Date: Mon,  5 Jan 2026 15:49:26 +0000
Message-ID: <20260105154939.11041-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075046_629865_32A06138 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

Rework host_stage2_set_owner_locked() to add a new helper function,
host_stage2_set_owner_metadata_locked(), which will allow us to store
additional metadata alongside the owner ID for invalid host stage-2
entries.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 6c32bdc689ed..7d1844e2888d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -539,12 +539,8 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 		set_host_state(page, state);
 }
 
-static kvm_pte_t kvm_init_invalid_leaf_owner(u8 owner_id)
-{
-	return FIELD_PREP(KVM_INVALID_PTE_OWNER_MASK, owner_id);
-}
-
-int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
+static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
+						 u8 owner_id, u64 meta)
 {
 	kvm_pte_t annotation;
 	int ret;
@@ -552,10 +548,14 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	if (!FIELD_FIT(KVM_INVALID_PTE_OWNER_MASK, owner_id))
 		return -EINVAL;
 
+	if (!FIELD_FIT(KVM_INVALID_PTE_EXTRA_MASK, meta))
+		return -EINVAL;
+
 	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
-	annotation = kvm_init_invalid_leaf_owner(owner_id);
+	annotation = FIELD_PREP(KVM_INVALID_PTE_OWNER_MASK, owner_id) |
+		     FIELD_PREP(KVM_INVALID_PTE_EXTRA_MASK, meta);
 	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
 			      addr, size, &host_s2_pool, annotation);
 	if (ret)
@@ -570,6 +570,11 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	return 0;
 }
 
+int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
+{
+	return host_stage2_set_owner_metadata_locked(addr, size, owner_id, 0);
+}
+
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
 {
 	/*
-- 
2.52.0.351.gbe84eed79e-goog


