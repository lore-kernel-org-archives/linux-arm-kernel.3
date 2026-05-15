Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A389CD4F46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcuAAxA/tjpUmTzoe/krwru3IJGBoAD8mPjVnZU2mxo=; b=jr1FmYX95wL7/+N9EQJ/pDQSDt
	1ZwUp5VOvH/4BGcowNSMFqpVXpVSq8I0dktOsK32tCw33K+rHwOjszqpg6D/idm27uGZVYwVk+csg
	f8+kAT/MT+fec9Fay55zX4bvAVTLEdKu9SAEYM7tgBvngifObzV4VI6uc8f55Yr/OJCc/oFdWIlTi
	e82sLKJooKLEuxOQu12yyrdvmIwW4XW8V7OB6IHsb1nvqD9O8Yy9Yq77FJh38W7hn3tP8bxps92Jp
	CMO8fDU/xSsma8pfAAcLCGAEBzo9yAAEWsM+KVtgwoqmcKOlf92U2079UNd3sj3AiAInWdjcMqbkc
	dudqZ4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNygw-00000009HKC-2YM2;
	Fri, 15 May 2026 19:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNygr-00000009HI5-0jKO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 19:59:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C66035E0;
	Fri, 15 May 2026 12:59:14 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A0D3F85F;
	Fri, 15 May 2026 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875159; bh=ANB+N5ALL8GrDgSnqrQPn2rmLF0xA2vzhIEyI0qmn+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hItY5Zz0SI1/y/zje5+NpG7/mkO/BP+jwI/OqEdg6t3y7cpHvbmRAEmpwXg36Ki8D
	 WxEhoQxQ7t9xT0ywXfhIdCCZU3xEQ/IeH5U0oMFWXHvGW41d+Bd9tiUTqeal79EazH
	 deSofA9HwSPn3C+oaJqx0Y/A5/qaBnHAHKKWHKvs=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] KVM: arm64: Improve splitting performance by using SKIP return values
Date: Fri, 15 May 2026 20:59:03 +0100
Message-ID: <20260515195904.2466381-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515195904.2466381-1-leo.bras@arm.com>
References: <20260515195904.2466381-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3112; i=leo.bras@arm.com; h=from:subject; bh=ANB+N5ALL8GrDgSnqrQPn2rmLF0xA2vzhIEyI0qmn+c=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLYS7/7yJ05FLSn05FD/b/Uk02yf+Y+6Fh6fO2tw2wS3 CkL7BaWd5SyMIhxMciKKbLIPpq/iuf7lIwjV34sgJnDygQyhIGLUwAm8pmL4a+0QfeiOUIHLxue u/93fQxbBP+8WxcFF318mNj6cesX5k+5jAzvgpbdaZPzqNx/2fjUeys2zs17nukXWy7k36L0xPD 2DGY+AA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_125921_288049_96A5C1E4 
X-CRM114-Status: GOOD (  17.58  )
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

Splitting an S2 pagetable is needed when using dirty-bit tracking.

Currently, when splitting, all the child and sibling nodes will be walked,
with the walker just returning earlier if there is nothing to do. This
means all pagetable entries in the splitting range get a callback from the
walker function, even if it was just split, or it's a level-3 entry.

Optimize splitting in two cases:
- If a level-3 entry is walked, it means the parent level-2 entry is split,
  so avoid walking all level-3 siblings.
- If a split just succeeded in an table entry, it means all children nodes
  are already split, so skip walking this entry's children.

Optimization measured on a 1GB VM, running on the model, splitting all at
the beginning (no manual protect):
- Memory was already split (4k pages): 	-97.33% runtime (-172ms) - 20 runs
- THP backed memory: 			-19.82% runtime (-153ms) - 10 runs
- 1x1GB hugetlb memory:			-20.65% runtime (-150ms) - 10 runs

(Above runtime is measured on kvm_mmu_split_huge_pages(), using
ktime_get_real_ns() before and after function call)

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 4e43339522bb..164c5bcd6026 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1502,23 +1502,27 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 	struct kvm_mmu_memory_cache *mc = ctx->arg;
 	struct kvm_s2_mmu *mmu;
 	kvm_pte_t pte = ctx->old, new, *childp;
 	enum kvm_pgtable_prot prot;
 	s8 level = ctx->level;
 	bool force_pte;
 	int nr_pages;
 	u64 phys;
 
-	/* No huge-pages exist at the last level */
+	/*
+	 * No huge-pages exist at the last level
+	 * Also, if one PTE exist in the last level, the whole block is already
+	 * split, so skip walking it's siblings.
+	 */
 	if (level == KVM_PGTABLE_LAST_LEVEL)
-		return 0;
+		return SKIP_SIBLINGS;
 
 	/* We only split valid block mappings */
 	if (!kvm_pte_valid(pte))
 		return 0;
 
 	nr_pages = stage2_block_get_nr_page_tables(level);
 	if (nr_pages < 0)
 		return nr_pages;
 
 	if (mc->nobjs >= nr_pages) {
@@ -1554,21 +1558,23 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 		return -EAGAIN;
 	}
 
 	/*
 	 * Note, the contents of the page table are guaranteed to be made
 	 * visible before the new PTE is assigned because stage2_make_pte()
 	 * writes the PTE using smp_store_release().
 	 */
 	new = kvm_init_table_pte(childp, mm_ops);
 	stage2_make_pte(ctx, new);
-	return 0;
+
+	/* All child entries are already split, so skip walking them */
+	return SKIP_CHILDREN;
 }
 
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_split_walker,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
 		.arg	= mc,
 	};
-- 
2.54.0


