Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C34D606A949
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZZbl5PL;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LFAgAyuT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wgbqMxG+rMSoSEghwC8Ab1bjmOfWy1U7IH8igckfst0=; b=YZZbl5PLuuNNNg
	flf//98NTlybQ7gTgE6cSwc10dsxZaDO0yEeen3GgfbXpkgfn2VM/3oOJ/q9DmdUtQx3Tcr9Sj8mK
	PqpLjJCUhocRztdOcj51atd9H1atLPpD/PFqqcmgBzJwtSTZ9z/b3vef0nRDwQB0kBT7xpotLNhnY
	+/9NFEJOAq+yIBu/LuL+zlHhY560nf8Q2J8DsByGsRq4WIMqGs7iskqGVrOGmZeIwHiNAsdDFqwNS
	wPm1DhYQPrZk3TG6MR7thK6pMX46DbCmOHjmaGuwiL7i4gyycO7wXBHaDc+2bSCG8+NiZmOTn3DJ1
	owmnibTbEQXRzejKz7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABL-00000001cvf-34gX;
	Tue, 03 Nov 2026 08:47:51 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABH-00000001csP-3hDr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:47:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wk8krk/WXEgB1deJlYK3BeClqHTd5FTckwLdnXhB1Ik=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793695664; v=1; x=1794300464;
 b=LFAgAyuTgd/RSNGMFRU6qPs2/rSl9fS1OsnEtXMEewVzTod0YQ1gJNECV9IzMEp/mV2IpARu
 9ho6aIWx4q0MA81MiXb+fvHAB69OqTD3SU6twxzUEeIxTLnr/oYgpLRtJ8/AxluETx/K98iwLX6
 IxsKnyUNGKQfr1h/rn7q9gkE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e56060b775514378;
	Tue, 03 Nov 2026 08:47:44 +0000
X-Mizu-Trace-ID: e56060b775514378
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
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 3/3] KVM: arm64: Move stage-2 teardown into kvm_vm_s2_ops
Date: Tue,  3 Nov 2026 08:47:42 +0000
Message-ID: <20261103084742.1302597-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103084742.1302597-1-fuad.tabba@linux.dev>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004748_072325_C3EC28CD 
X-CRM114-Status: GOOD (  12.84  )
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

Replace kvm_stage2_destroy()'s is_protected_kvm_enabled() and
KVM_PGT_FN() dispatch with a vm_stage2_destroy hook in kvm_vm_s2_ops,
like the other stage-2 operations. Both pKVM flavors share
pkvm_stage2_destroy(). Like kvm_vm_stage2_destroy(), it takes the range
from kvm_phys_size().

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 24 +++++++++++++-----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..b36779bafae9b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -233,6 +233,7 @@ struct kvm_vcpu_ops {
 
 struct kvm_gfn_range;
 struct kvm_s2_fault_desc;
+struct kvm_pgtable;
 
 struct kvm_vm_s2_ops {
 	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
@@ -243,6 +244,7 @@ struct kvm_vm_s2_ops {
 	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start, u64 size,
 				      bool may_block);
+	void (*vm_stage2_destroy)(struct kvm_pgtable *pgt);
 	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
 };
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 10b425a0141be..9df3c80a5acd1 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1029,17 +1029,16 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 	} while (addr = next, addr != end);
 }
 
-static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
+static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
 {
-	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
+	stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
+	kvm_pgtable_stage2_destroy_pgd(pgt);
+}
 
-	/* pKVM walks its mapping tree, not the IPA space, and reschedules per mapping */
-	if (is_protected_kvm_enabled())
-		pkvm_pgtable_stage2_destroy_range(pgt, 0, BIT(ia_bits));
-	else
-		stage2_destroy_range(pgt, 0, BIT(ia_bits));
-
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
+static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	pkvm_pgtable_stage2_destroy_range(pgt, 0, kvm_phys_size(pgt->mmu));
+	pkvm_pgtable_stage2_destroy_pgd(pgt);
 }
 
 /**
@@ -1126,7 +1125,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	kvm_stage2_destroy(pgt);
+	kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
 	mmu->pgt = NULL;
 out_free_pgtable:
 	kfree(pgt);
@@ -1246,7 +1245,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		kvm_stage2_destroy(pgt);
+		kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
 		kfree(pgt);
 	}
 
@@ -3152,6 +3151,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
 	.vm_age_gfn			= no_age_gfn,
 	.vm_test_age_gfn		= no_age_gfn,
 	.vm_stage2_unmap_range		= no_stage2_unmap_range,
+	.vm_stage2_destroy		= pkvm_stage2_destroy,
 	.vm_mem_abort			= protected_pkvm_mem_abort,
 };
 
@@ -3161,6 +3161,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
 	.vm_age_gfn			= pkvm_age_gfn,
 	.vm_test_age_gfn		= pkvm_test_age_gfn,
 	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
+	.vm_stage2_destroy		= pkvm_stage2_destroy,
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
@@ -3170,6 +3171,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_stage2_destroy		= kvm_vm_stage2_destroy,
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
-- 
2.47.3


