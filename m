Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E39DC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEwmDT2FqQtjUT6qD3zLfnGfUOm0Jk1WqVVN88AlR+M=; b=YpME34RIbPlnez2pqFpUiojIrV
	0OtWTfjAv8WZcUdcHkijT6MO65Mxi3aekNGGKy2U3oaMcZutYmeP87XzRmMLP5mc/WTkaDTC+8rbp
	lBFh5jOUpoloj2HsQs3y8g2M/hGuOwZR1LooVBfyw/tGPBaWf0keH04yBrsZh5Al2FvsdXy76CLLb
	TO2NjjunFJoU6IldBB/2oUJyicnen/EweefBWHmjhcqLyomW84qO1emBA1tBpo8RNxoECioDQDVPP
	1jBM89ZfWirFzHSVmfvgpAo1lyelCng76pRC+fpfzZOYGRsSjzbxv5mf9cgJnr+RyfLeIPuqBwb94
	xBnGmaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHo-00000000nZb-49RU;
	Sat, 12 Sep 2026 10:48:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHn-00000000nXq-0GiD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BC2F407BD;
	Sat, 12 Sep 2026 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5D31F00899;
	Sat, 12 Sep 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789210121;
	bh=VEwmDT2FqQtjUT6qD3zLfnGfUOm0Jk1WqVVN88AlR+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E2BJddTBwuWrJjIU4v4+PYgloq9biC5jl71n1lPOICSICFNTEoiJv5GCUNsBJ7J3u
	 d3aDwvTtNGLeUyDlKJbHVrdnBczVemlwrNY/+e9NUioRXFgY0zaxmqGG1cqGmVfZDN
	 VnxEShtgw9/sM7Qz5Ye0/h+xvjzuk5yrzIpxN6BMY/bg7vjllE+wqPko5pHOAd5Yzd
	 osJzwY2NO+iCMukB2lOu2dMIovntpia3HEhBfiq7/F0X4oLGzsVnTvNR1zuUOPurIL
	 Au5Uzy351VexmZwyrYe7sBq259lQ+0vYFimR0HMyC0YA1zufNmgTSQhUuTk/W8EDQ8
	 qBInpO3y6hdsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5LHj-000000084hK-2j68;
	Sat, 12 Sep 2026 10:48:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 1/4] KVM: arm64: pgtable: Add Stage-2 unmap without TLBI primitive
Date: Sat, 12 Sep 2026 11:48:31 +0100
Message-ID: <20260912104834.3093878-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260912104834.3093878-1-maz@kernel.org>
References: <20260912104834.3093878-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, weilin.chang@arm.com, wanghan@linux.alibaba.com, xueshuai@linux.alibaba.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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

kvm_pgtable_stage2_unmap() iterates over a range, unmapping whatever is
within the range, and always guarantees that that the corresponding TLBs
are invalidated when the function returns.

While this is safe, it means that iterating over empty range on a system
that supports range invalidation results in a TLBI per largest block
mapping size (1GB, 32MB or 512MB, depending on the base granule size).

This can be pretty expensive in situation where the whole address space
is being torn down, as it happens with NV (where S2 MMUs are recycled
regularly), and it would be more efficient to elide the per-subrange
TLBIs to solely rely on a VMID-wide TLBI.

For this, provide a kvm_pgtable_stage2_unmap_notlbi() helper that elides
all TLBIs, and relies on the caller to do the work.

Note that for  pKVM case, no additional helper is provided, and we
fallback on the TLBI-aware version.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h | 17 +++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h    |  1 +
 arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++-------
 arch/arm64/kvm/pkvm.c                |  2 ++
 4 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb6..c370196888d1d 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -318,6 +318,8 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
  * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
  *					without Cache maintenance
  *					operations required.
+ * @KVM_PGTABLE_WALK_SKIP_S2_TLBI:	Visit and update table entries
+ *					without Stage-2 TLB invalidation.
  */
 enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_LEAF			= BIT(0),
@@ -327,6 +329,7 @@ enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
 	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
 	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
+	KVM_PGTABLE_WALK_SKIP_S2_TLBI		= BIT(7),
 };
 
 struct kvm_pgtable_visit_ctx {
@@ -717,6 +720,20 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  */
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
 
+/**
+ * kvm_pgtable_stage2_unmap_notlbi() - Remove a mapping from a guest stage-2 page-table
+ *				       without TLB invalidation.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
+ * @addr:	Intermediate physical address from which to remove the mapping.
+ * @size:	Size of the mapping.
+ *
+ * Same as kvm_pgtable_stage2_unmap(), but does not invalidate the
+ * TLBs, which is the responsibility of the caller. Use with caution!
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int kvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size);
+
 /**
  * kvm_pgtable_stage2_wrprotect() - Write-protect guest stage-2 address range
  *                                  without TLB invalidation.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index beea00e693a0a..273013c98ff17 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -214,6 +214,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phy
 			    enum kvm_pgtable_prot prot, void *mc,
 			    enum kvm_pgtable_walk_flags flags);
 int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
+int pkvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd3..6603fc236daa2 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -29,6 +29,11 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
 	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
 }
 
+static bool kvm_pgtable_walk_skip_s2_tlbi(const struct kvm_pgtable_visit_ctx *ctx)
+{
+	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_S2_TLBI);
+}
+
 static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
 {
 	u64 granule = kvm_granule_size(ctx->level);
@@ -905,12 +910,14 @@ static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
 	if (kvm_pte_valid(ctx->old)) {
 		kvm_clear_pte(ctx->ptep);
 
-		if (kvm_pte_table(ctx->old, ctx->level)) {
-			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
-				     TLBI_TTL_UNKNOWN);
-		} else if (!stage2_unmap_defer_tlb_flush(pgt)) {
-			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
-				     ctx->level);
+		if (!kvm_pgtable_walk_skip_s2_tlbi(ctx)) {
+			if (kvm_pte_table(ctx->old, ctx->level)) {
+				kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
+					     TLBI_TTL_UNKNOWN);
+			} else if (!stage2_unmap_defer_tlb_flush(pgt)) {
+				kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr,
+					     ctx->level);
+			}
 		}
 	}
 
@@ -1195,23 +1202,36 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+static int __kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt,
+				      enum kvm_pgtable_walk_flags flags,
+				      u64 addr, u64 size)
 {
 	int ret;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_unmap_walker,
 		.arg	= pgt,
-		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST,
+		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_TABLE_POST | flags,
 	};
 
 	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
-	if (stage2_unmap_defer_tlb_flush(pgt))
+	if (stage2_unmap_defer_tlb_flush(pgt) &&
+	    !(flags & KVM_PGTABLE_WALK_SKIP_S2_TLBI))
 		/* Perform the deferred TLB invalidations */
 		kvm_tlb_flush_vmid_range(pgt->mmu, addr, size);
 
 	return ret;
 }
 
+int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	return __kvm_pgtable_stage2_unmap(pgt, 0, addr, size);
+}
+
+int kvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	return __kvm_pgtable_stage2_unmap(pgt, KVM_PGTABLE_WALK_SKIP_S2_TLBI, addr, size);
+}
+
 struct stage2_attr_data {
 	kvm_pte_t			attr_set;
 	kvm_pte_t			attr_clr;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8e4c6e4bec123..ec151005fbe4d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -488,6 +488,8 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 }
 
+int pkvm_pgtable_stage2_unmap_notlbi(struct kvm_pgtable *pgt, u64 addr, u64 size) __alias(pkvm_pgtable_stage2_unmap);
+
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
-- 
2.47.3


