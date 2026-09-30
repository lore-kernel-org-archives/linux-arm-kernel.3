Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9829CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJj2Ky8pH7lIMpN+abk904Q1k5JCLuKoxwtnWERtq04=; b=S5fYhkMMxdt6a5fAwJv7yO5kLd
	3ZLOm9I+lX4u5CGrUDSLMf4PBgKxQNDppMnAbdk4pqxcuOQM4aNKJFNCcMhdnwQCnwL9OOdMnFepu
	pmmdZ+N3g753AUMckrTn1kZw3WZvDEoXRgmlickm3GsAnnFIxg6wec8J8k1oTgjQfDa4FXzW6JKwC
	j+sdEvvDI5ey66DhqYFs74aqEKON4v5Z7B3JHkNSDeMXllB2FMG/mULTCraMndZk36xlVzVdbkKVB
	sRw+LFChzAFXFaRq5mdU60fCXMjxGux8S242wzBqJu26kQA/ZEoJQhCuSIGiXC2UBsbkq4C+2F6e4
	teBcolDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy2H-00000006oVH-0vD1;
	Wed, 30 Sep 2026 17:24:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy1x-00000006oNp-3RLD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FJj2Ky8pH7lIMpN+abk904Q1k5JCLuKoxwtnWERtq04=; b=HU3XFGodyJUI7xTEcgiovbPdnO
	H/sVhRHjt+Z6x+qqKTQu2b7aEJzMmzcsiGiMFCFGt9SavrtNvBqBqqZZn+GiIsAPjJ213QeDxOVPR
	a7mfzRyoL34kDovl64/Oecbi74OkzuJS312LnpR5YYrVzDnQ4NrFpsjDtVWWlLJlP7Ap2jS2nLie+
	2eL9JAnQYnubRZbEMgFBl+wyph94cFIqIHC5yLQ+HY26JNyJmyXnqDpPOGjlrT9EZIVOCYsrqFCIf
	51NOiFfimcDBfJY5qz2hCkHzuSfiKUE03eN4qDf4MEdJScrGaNwGIm8Cr6LaVmj0Y1zCsrFJdnWxv
	rXS2YI1Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy1u-000000048MG-3lg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:23:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60F9E168F;
	Wed, 30 Sep 2026 10:23:38 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E528E3F86F;
	Wed, 30 Sep 2026 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790789021; bh=cu7+TuF4iOJLVQBarMTLvn8c4+pOh0ctODB9kp4SISg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s3HgTofFLWe44G+SZwXkIBMpaBtvAcQUNN+46z0tm5v2TBDA6ZrORcZTHv7Z5/8/m
	 1NAS6MGJmPJXvqtSYS0rQlzb5oR9YCvvJIBJk7Ed+HUplbDOUZB+1Mrrh7CnYCgA/M
	 uISjLg675UJ+EQMeauUmi3wu1Enp2zCRTnD9AHIU=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Wed, 30 Sep 2026 18:22:22 +0100
Message-ID: <20260930172226.2459423-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930172226.2459423-2-leo.bras@arm.com>
References: <20260930172226.2459423-2-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5694; i=leo.bras@arm.com; h=from:subject; bh=cu7+TuF4iOJLVQBarMTLvn8c4+pOh0ctODB9kp4SISg=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLL2uvp++DXla6vdr7DJOp0uCbyzOGQqp32PNy9nuL9wq slyO8U1HaUsDGJcDLJiiiyyj+av4vk+JePIlR8LYOawMoEMYeDiFICJJLQy/BWV2ZMvNWG7/OcZ J3YKrAm423FppmD86pWelU4/Xtun7H/B8D9UjyF+P8/BB1bTrmx/qXIiP37HtCm7TlSVnfvY5mb 7QJUJAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182343_206509_C0FDBA3E 
X-CRM114-Status: GOOD (  18.56  )
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

Add new walking flags KVM_PGTABLE_WALK_SKIP_LEVEL{0-3}.
When used, they make the kvm_pgtable_walk() skip the given level, as well
as levels higher than that.

Being able to skip levels substancially decreases the runtime of a
pagetable walk when the callback function does nothing on that level.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 14 ++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..5f37ceef8d63 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -311,31 +311,45 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
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
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level 0+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level 1+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level 2+ entries
+ * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level 3 entries
  */
 enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_LEAF			= BIT(0),
 	KVM_PGTABLE_WALK_TABLE_PRE		= BIT(1),
 	KVM_PGTABLE_WALK_TABLE_POST		= BIT(2),
 	KVM_PGTABLE_WALK_SHARED			= BIT(3),
 	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
 	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
 	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
+	/* SKIP_LEVEL* flags should not be split nor reordered */
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
index 7a51f78b6446..80744478c810 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -137,20 +137,27 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Ignore the return code altogether for walkers outside a fault handler
 	 * (e.g. write protecting a range of memory) and chug along with the
 	 * page table walk.
 	 */
 	if (r == -EAGAIN)
 		return walker->flags & KVM_PGTABLE_WALK_IGNORE_EAGAIN;
 
 	return !r;
 }
 
+static bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
+{
+	u32 skip = FIELD_GET(KVM_PGTABLE_WALK_SKIP_LEVELS, flags);
+
+	return unlikely(skip && level >= ffs(skip) - 1);
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
@@ -185,35 +192,35 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
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
@@ -242,20 +249,23 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
 	u32 idx;
 	int ret = 0;
 	u64 limit = BIT(pgt->ia_bits);
 
 	if (data->addr > limit || data->end > limit)
 		return -ERANGE;
 
 	if (!pgt->pgd)
 		return -EINVAL;
 
+	if (kvm_pgtable_skip_level(pgt->start_level, data->walker->flags))
+		return 0;
+
 	for (idx = kvm_pgd_page_idx(pgt, data->addr); data->addr < data->end; ++idx) {
 		kvm_pteref_t pteref = &pgt->pgd[idx * PTRS_PER_PTE];
 
 		ret = __kvm_pgtable_walk(data, pgt->mm_ops, pteref, pgt->start_level);
 		if (ret)
 			break;
 	}
 
 	return ret;
 }
-- 
2.55.0


