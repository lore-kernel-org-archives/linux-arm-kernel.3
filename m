Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67098CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADGARx1KLOHgEOtO0il4UC8SjMYfEzQDis7829dam38=; b=eFVRJ1nQJTuJgin4C7U+nB9YlM
	GS3Mnq2ze5kZ1BMNuvzv5hUQqM6Q5dpVAFbtYgKKiES37dVxMEejeroczHNL9lDt/DZn5jq6DJuw7
	XjTSMy6vqamxDmRM/5msKoL0f7/cDFtOr1ZzUlgOEowgz20dJPLg9PHXQOe75vv1kM80zPH61iytW
	DbMWMWhno6F4k/VtJUPEAe0cmXPUQDQh26PbuT8Uqkoq8mUKJVHaSFRwZR++SP6BIYN/evxWLhTCC
	LShgE6rmlPCQKqkqURilZAGklKmCh9iHEhBZfXAsVemNNnbxxDg1po0/sfhrymOQByPIr6QfPDhz0
	VJ12CGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPQw-00000008Jyj-3Ta7;
	Wed, 10 Jun 2026 20:21:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPQu-00000008Jy6-1GkX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:21:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2F5E202C;
	Wed, 10 Jun 2026 13:21:46 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247E73FB7F;
	Wed, 10 Jun 2026 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781122911; bh=zla4ojH7IRpK8neQWnjZ1NqqA2JQS5zWlyS67zi1LRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tloWJSi1orvV8CRFoDOd6u5uY5bAzN7N+NznpZxFoBiMdE3tdaPh+JoUHguue9l0P
	 jJ4P7yeKSSWQkrEuTRBVLxZsDawpUg4AVLIoEBjoe9aaBuGjLsqkIsuPVME88jbOy9
	 H1ke7mKUP8TEnwA+sWGcNQqMbL9d3YnwX5qFoRJQ=
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
Subject: [PATCH v1 1/2] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Wed, 10 Jun 2026 21:21:08 +0100
Message-ID: <20260610202112.2695205-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610202112.2695205-2-leo.bras@arm.com>
References: <20260610202112.2695205-2-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4434; i=leo.bras@arm.com; h=from:subject; bh=zla4ojH7IRpK8neQWnjZ1NqqA2JQS5zWlyS67zi1LRE=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLI0j4veuf4rduXMCY4/J+64yWF44IzrqpvCgqo70vLWB DbVWOnwdZSyMIhxMciKKbLIPpq/iuf7lIwjV34sgJnDygQyhIGLUwAm8t2RkaFRe9Gljjkm5bGe Qg6Xvm6wf+i3/27nVQfe53fu8p/YqO7PyDCrVaPrcUpNaMzhj9yxnkxP2gPr6qqFbUX5vYvsbtV Y8AIA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_132152_456747_79C60D8A 
X-CRM114-Status: GOOD (  14.33  )
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
 arch/arm64/kvm/hyp/pgtable.c         | 15 ++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

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
index 91a7dfad6686..48d88a290a53 100644
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
+	if (level >= (fls(flags) - ffs(KVM_PGTABLE_WALK_SKIP_LEVELS)))
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
@@ -185,21 +198,21 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	 * into a newly installed or replaced table.
 	 */
 	if (reload) {
 		ctx.old = READ_ONCE(*ptep);
 		table = kvm_pte_table(ctx.old, level);
 	}
 
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
 		goto out;
 
-	if (!table) {
+	if (!table || kvm_pgtable_skip_level(level + 1, ctx.flags)) {
 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
 		data->addr += kvm_granule_size(level);
 		goto out;
 	}
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
 		goto out;
 
-- 
2.54.0


