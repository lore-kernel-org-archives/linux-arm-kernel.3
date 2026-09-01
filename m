Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E18C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyHs4S0dc94/NUToDxmHqTGMasZcTDyzb455/LwWY0c=; b=r5/NklVp/KHA73LDUJlNaXubN0
	j94HX7wiMduHy32VFhlE8eYNvebNLWltv2rhE85I/NpEax5FIjMyu57uNYsOQW+RgUjp4CfsOV7+A
	/ag8274M0PhlzELuxoNY8b/6F8APx+N9+hNIgKCuLCwwVOmH6ru7ca+e9xbmG8voOtNhQjMpxan/b
	gNd8sfi4PqSyCk6zS0hrccXybJX67YoLPcTFakwU/PlCNoTwGI+fvV9c3cs88sSMuQQsudtDq1WOh
	eslluXnhavFhpbI8Z8pQLdYxpJVlRxtIl8dwwse5IOFB/x8xYs5/Z1CRA8FlNjYDR0N8czi2wDSrM
	cX3oYe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5q-0000000CnMs-2X2M;
	Tue, 01 Sep 2026 17:16:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S5j-0000000CnGv-1RQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:16:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A731CE0;
	Tue,  1 Sep 2026 10:16:07 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D902A3F7D8;
	Tue,  1 Sep 2026 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788282970; bh=cUkDq0mjr3TsA7BpjTcTYdqNjWROCRQ9y+M5Y07ELLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nt9Elcsvd3jZ+LcqUqz1b+KB9JX1ovs+EflajajcYUOxxMmm27aBQ9hPb61JgRE1h
	 C8n5H+fQF0osMb4k1W0lZn7okuI3B0i5oBIL/EvgSymIg17RJup5E+mLzQHi818l29
	 E3grDL3AYL4u1r42PQTWxIhJfjfF12WXGAo7F/lw=
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
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/5] KVM: arm64: Introduce a dedicated walker for stage2 write-protect
Date: Tue,  1 Sep 2026 18:15:54 +0100
Message-ID: <20260901171558.2674031-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901171558.2674031-1-leo.bras@arm.com>
References: <20260901171558.2674031-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=leo.bras@arm.com; h=from:subject; bh=cUkDq0mjr3TsA7BpjTcTYdqNjWROCRQ9y+M5Y07ELLk=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKms839fqptm9uuVyxG3C8UWvP+Z230rRcKjkyzP3Mxl 8WR03BFRykLgxgXg6yYIovso/mreL5PyThy5ccCmDmsTCBDGLg4BWAiiiUM/0x4nv4SvsdpK7Zn ju37c39F1q6wulF7tm25x+Sj/1Zu/sjB8Jtd9s2qFrdzCeXz0x69q5i/Zp9rgXyi710tJZ/Lq48 FlfABAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_101611_510515_5A8029F5 
X-CRM114-Status: GOOD (  13.56  )
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

The new walker cleans the dirty bit on leaf entries, as well as clean
the DBM bit in blocks so it still faults for lazy hugepage splitting when
we enable FEAT_HDBSS in future patches.

With disabled HDBSS, there should be no change in faulting behavior.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 2ff33d3e371e..2849c136f366 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1287,26 +1287,44 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 		return ret;
 
 	if (orig_pte)
 		*orig_pte = data.pte;
 
 	if (level)
 		*level = data.level;
 	return 0;
 }
 
+static int stage2_wrprotect_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				   enum kvm_pgtable_walk_flags visit)
+{
+	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+
+	/* We remove DBM on blocks so they can fault and get split */
+	if (ctx->level < KVM_PGTABLE_LAST_LEVEL)
+		new &= ~KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
+	if (kvm_pte_valid(ctx->old) && ctx->old != new)
+		WRITE_ONCE(*ctx->ptep, new);
+
+	return 0;
+}
+
+
 int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	return stage2_update_leaf_attrs(pgt, addr, size, 0,
-					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-					NULL, NULL,
-					KVM_PGTABLE_WALK_IGNORE_EAGAIN);
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_wrprotect_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+
+	return kvm_pgtable_walk(pgt, addr, size, &walker);
 }
 
 void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
 				       NULL, NULL, flags);
 	if (!ret)
-- 
2.55.0


