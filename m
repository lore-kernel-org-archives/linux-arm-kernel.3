Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C63CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzYdba36GspgDjYCPt5LO98rRURFAs6wAt+eFJNJspY=; b=H5Nlz9AEqRlgLxw36B3mzMMafF
	YBQU+jDLR0wsJJaIxM6pQuB333brBHspf1d3b76OFH+EY9oQJS8oO3fDMlhy5Ol2D8u7FsavRv38I
	PhNfHCmc17Gb9V8PBJsXZczZDINglvCcA20h2XxsY3+hMHYcWMZaHrzHQDeZTk6pOaxGb8/2x9LAw
	7YCiff257VYHK6/AcfK65bLaiI1vwT2vjYUkCrZuwMLsoOYtlu1V3LcVmDra9eNgJSz+hUFePMQnB
	gQdBaIUnDyRXFXjffpyl92BKEV1VY5EaM48dFEKUlvx7manvWzdzAST4YlcEtW+Xg89b75rgqOgOU
	MHflvE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy1y-00000006oOV-3yA4;
	Wed, 30 Sep 2026 17:23:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy1x-00000006oNo-2IqJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IzYdba36GspgDjYCPt5LO98rRURFAs6wAt+eFJNJspY=; b=QFqZLPcooGcoBnzYvj3Qpx7L7n
	8vui/mHrCEaEliRBiDv61tpCZqQlgRJzgAnsuHoC1spbhC7QMPPQkL/Ig/04GqKgwnZLOHuRILe3X
	uTOi2YHWfb3WpSPD1zJuW/McFuHyiRZ4VS7eAidwtTIMgmx/V8fYDJQOWgbLsu1froavp26DLSgBy
	ua7zXg3ahBTVowfa9Bk/GYYzcGqgdC2U3pnK1Yl5jTRYpjKjCA1F7Z4CHi5vr3iaHEYwlkdqJjLb6
	POwVXQQ/3WHO/1r2lPb1nUr65sSTM7AMhEmzaQCyiYrKl0yJBBvrB6i48jnB7+icUK4DIxLuxyCi4
	1+PRnp/w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy1u-000000048Lx-2hDE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:23:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369F4143D;
	Wed, 30 Sep 2026 10:23:36 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B95D03F86F;
	Wed, 30 Sep 2026 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790789019; bh=Br5fuZ4ryUMLMGwj9gH1YIvLvzgbJoEJcgmiUYmIM+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z/uYw6/l2jrEC4Fdn0qaIvThpjIvjR95Xmpk9kc4FaAXLcbQK4oWMU5DPDvXTDYMM
	 g/lWd0Lsmhmb1JvnjmJ+g429zdj12nlNGLON+zFh20ncv3c6AnVFB3CmtZME0M12Xe
	 gaaSm1ZGm8ntaX8mIUqkbgtBwYASeFLeWV+qgcw4=
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
Subject: [PATCH v4 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Wed, 30 Sep 2026 18:22:21 +0100
Message-ID: <20260930172226.2459423-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930172226.2459423-2-leo.bras@arm.com>
References: <20260930172226.2459423-2-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=leo.bras@arm.com; h=from:subject; bh=Br5fuZ4ryUMLMGwj9gH1YIvLvzgbJoEJcgmiUYmIM+E=; b=kA0DAAoW7HZo80cCoa8ByyZiAGq9RU2h0IdRfCiNcvabr5HQs/y9ucx40eg3mASTh9Qu7zzuu Ih1BAAWCgAdFiEEHeKfqgz3lGjE1Pig7HZo80cCoa8FAmq9RU0ACgkQ7HZo80cCoa8p0QEAhksf y8vzTm9mCl4nLyXCKjGIdJamwoWZTs4i4doprbsBAOBe3yX5vc+yIM7JChCUP45iFxcBk4Nzaky cgLN+0g0M
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182343_003811_E7BFACD9 
X-CRM114-Status: GOOD (  15.96  )
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

__kvm_pgtable_visit() performs a bunch of calls to
kvm_pgtable_walk_continue() to find out whether the walk can continue
further, and if not, 'goto out', which retests the possibility of
continuing the walk before exiting.

Given that it's testing the same ret variable again, there is no reason
the result of kvm_pgtable_walk_continue() would have changed since the
previous check. So turn this goto into an early return, simplifying the
code and paving the way for further rework."

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..7a51f78b6446 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -183,32 +183,32 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	 * Reload the page table after invoking the walker callback for leaf
 	 * entries or after pre-order traversal, to allow the walker to descend
 	 * into a newly installed or replaced table.
 	 */
 	if (reload) {
 		ctx.old = READ_ONCE(*ptep);
 		table = kvm_pte_table(ctx.old, level);
 	}
 
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (!table) {
 		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
 		data->addr += kvm_granule_size(level);
 		goto out;
 	}
 
 	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
 	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
 	if (!kvm_pgtable_walk_continue(data->walker, ret))
-		goto out;
+		return ret;
 
 	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
 		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
 
 out:
 	if (kvm_pgtable_walk_continue(data->walker, ret))
 		return 0;
 
 	return ret;
 }
-- 
2.55.0


