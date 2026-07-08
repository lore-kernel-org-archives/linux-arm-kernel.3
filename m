Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D24C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15Evjjv6nOA2ibwzSz3yiXrKqJJ4uuMjXI71hmBUmYc=; b=AJOwruxyc2/bfKZTsmmSIGb2FO
	gmuZQXjKax0BdECMK2JS45w2wUsZFMDv92z647NI3e2bc9GaA/zKr7QemW4iDyoqBV0rDdJrml18Q
	K75+ALeGP8nrpamvii5G9GaJBqli4pxpzIrjU4lRVy9FayLoK5N3MZKbXubgw1apzhm0yIb4DvZYu
	/0jo4ssjgegu5Yv7trIptdO+8i7B8i8Vrfc93SNPpRFS4HzGPuL1mTKuxrXh1g6w5/39W1niCnGgA
	WuBQp9t5FKioVSk/VcC7S18mu5w94t+m/vsFM0vk3T+sCFRnTt6UHb3h0DRCrD1JfLigrHNCa7RiK
	0c4yHFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWh-0000000HCrh-2uUN;
	Wed, 08 Jul 2026 13:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSWa-0000000HCpI-0Zy2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:41:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC16E1E2F;
	Wed,  8 Jul 2026 06:41:10 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 995C53F66F;
	Wed,  8 Jul 2026 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783518075; bh=NW6eWueBtLdx5hfRlGevqmEOA+KOqE48kzpV7R9aUS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yi0TuugKrNBHvyRgzBnPvfGJHG6S9Z3kcQlmsy33xioh+aN2NY26pWken/pE1rkd4
	 gbh/jmKPv94zewFdU926jXi/GKa7/VNnXyOa9jrBkrzclBLTs1H7loevVP2u6640go
	 IGDXmruDcrmeVOjYHsB7OOjgavfLgFRgFNgcPVdA=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
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
Subject: [PATCH v3 2/3] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Wed,  8 Jul 2026 14:40:58 +0100
Message-ID: <20260708134101.2514759-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708134101.2514759-1-leo.bras@arm.com>
References: <20260708134101.2514759-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4894; i=leo.bras@arm.com; h=from:subject; bh=NW6eWueBtLdx5hfRlGevqmEOA+KOqE48kzpV7R9aUS0=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLL8/Gdldu/gEdxRNTOw7GN+mZhQlpJj1O0b9mfeqAu4u qotu+DXUcrCIMbFICumyCL7aP4qnu9TMo5c+bEAZg4rE8gQBi5OAZiICicjw7oXxs16/01uXjyo Fv778j+HU07nXWbeEes3F+lI0PaQa2ZkuNPPvm3RVD/Xc/nni9dfDtD/dJ49NNi3n/Nmi9PeOVE veQA=
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064116_265216_C8530B0C 
X-CRM114-Status: GOOD (  14.46  )
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

Add the new walking flags that tell kvm_pgtable_walk() to skip lower levels
when walking the pagetables.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 19 ++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..20c7c12e0e76 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -311,31 +311,44 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
  * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
  *					with other software walkers.
  * @KVM_PGTABLE_WALK_IGNORE_EAGAIN:	Don't terminate the walk early if
  *					the walker returns -EAGAIN.
  * @KVM_PGTABLE_WALK_SKIP_BBM_TLBI:	Visit and update table entries
  *					without Break-before-make's
  *					TLB invalidation.
  * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
  *					without Cache maintenance
  *					operations required.
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level-0+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level-1+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level-2+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level-3 entries
  */
 enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_LEAF			= BIT(0),
 	KVM_PGTABLE_WALK_TABLE_PRE		= BIT(1),
 	KVM_PGTABLE_WALK_TABLE_POST		= BIT(2),
 	KVM_PGTABLE_WALK_SHARED			= BIT(3),
 	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
 	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
 	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
+	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
+	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
+	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
+	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
 };
 
+#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
+					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
+					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
+					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
+
 struct kvm_pgtable_visit_ctx {
 	kvm_pte_t				*ptep;
 	kvm_pte_t				old;
 	void					*arg;
 	struct kvm_pgtable_mm_ops		*mm_ops;
 	u64					start;
 	u64					addr;
 	u64					end;
 	s8					level;
 	enum kvm_pgtable_walk_flags		flags;
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 4be1d51a6ac5..b9a2078efc51 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -137,20 +137,33 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Ignore the return code altogether for walkers outside a fault handler
 	 * (e.g. write protecting a range of memory) and chug along with the
 	 * page table walk.
 	 */
 	if (r == -EAGAIN)
 		return walker->flags & KVM_PGTABLE_WALK_IGNORE_EAGAIN;
 
 	return !r;
 }
 
+static __always_inline bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
+{
+	flags &= KVM_PGTABLE_WALK_SKIP_LEVELS;
+
+	if (likely(!flags))
+		return false;
+
+	if (level >= (ffs(flags) - ffs(KVM_PGTABLE_WALK_SKIP_LEVELS)))
+		return true;
+
+	return false;
+}
+
 static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level);
 
 static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 				      struct kvm_pgtable_mm_ops *mm_ops,
 				      kvm_pteref_t pteref, s8 level)
 {
 	enum kvm_pgtable_walk_flags flags = data->walker->flags;
 	kvm_pte_t *ptep = kvm_dereference_pteref(data->walker, pteref);
 	struct kvm_pgtable_visit_ctx ctx = {
@@ -185,35 +198,35 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	 * into a newly installed or replaced table.
 	 */
 	if (reload) {
 		ctx.old = READ_ONCE(*ptep);
 		table = kvm_pte_table(ctx.old, level);
 	}
 
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
 		return ret;
 
-	if (!table) {
+	if (!table || kvm_pgtable_skip_level(level + 1, ctx.flags)) {
 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
 		data->addr += kvm_granule_size(level);
 		goto out;
 	}
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
 		return ret;
 
-	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
+out:
+	if (table && ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
-out:
 	if (kvm_pgtable_walk_continue(data->walker, ret))
 		return 0;
 
 	return ret;
 }
 
 static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level)
 {
 	u32 idx;
-- 
2.55.0


