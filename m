Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BDEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8uaKB+erLgoGRRliSGgNeAl6w8yoVZVFzLWho+NHNyA=; b=XN+aAFka/KUzB03rx//oFJThOP
	XWYCzL1uAUWcSzVAykBuJpmcFmcj1X1gNc1QmIRI1hXxPbhO6rGRcjMEiALtxv6DsVaBMIwHQ4BpN
	uZH9YuxMpYTMwoSPbzFcDxzezNsgFDwglWWfbZZ38tXMl3MomZdHxrARjpwdqLZPqGz09MncgwNhg
	D2fL1fNtY4q6wem7+1Eb7+eOLmfIjWa7SolFb1cQnVlHIEdYHLb4jusKo3MUIXJf64qavZGp9R3tX
	Ns7lhRpObGI685EbtLs8wGMVuKoI0K1x+mvxED+b1L5+7VuVG4dl7qMVKCpq/NvdJhKKUxdk3mHds
	mAXi5dKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wex87-00000002QbC-2UuJ;
	Wed, 01 Jul 2026 15:45:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wex86-00000002Qaz-0O1E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 15:45:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77B7740E89;
	Wed,  1 Jul 2026 15:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD4B1F000E9;
	Wed,  1 Jul 2026 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920737;
	bh=8uaKB+erLgoGRRliSGgNeAl6w8yoVZVFzLWho+NHNyA=;
	h=From:To:Cc:Subject:Date;
	b=WnWiJ+NP0SOka904WY52aACOyO2t2A0ssND3U7OY3dci5+oywsOOZG+XP+34PmaU2
	 6hOYOLiBjrqhoYpsUxdCRPk1sEbHQ3MkHtXWQ0EXFyUpFxm0DLfXPiZBGj5wfwf9ns
	 8na8+I4k76Jmmq27sKSkeBcX9BXGtEKm3fOHJwbYP9IAhV6kLEZWfm2ib54JNZF4aE
	 WYACK/vUJ2OoIBRzQET8nax8+IbG/Pb1epKNltQJKsfkBpm1XdTQxBkIvAbEWI6Ydv
	 rPolX0KA2kSrBGqPjBuS7D7H88INZ/TtWRW1Tdg+pOWGTbRoM4NjfV9fhsRzV51gAC
	 5yGvuJFzBeOEg==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 216EDF4006A;
	Wed,  1 Jul 2026 11:45:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 01 Jul 2026 11:45:36 -0400
X-ME-Sender: <xms:IDZFagfvseMWKSVeticHnUvvm3LkuxiAJDyhZ3lVxBNhohZTF6Rmrw>
    <xme:IDZFaqXh9WYDsZIVcGZsQAA5gq6o8qUoZ-zJ1YcdOBV0PeiYtRJQ7ufLUwUjb3_k_
    AK40wyFCNXBNRu3lTUgTFrid4_P5OZ791s84d_uxzZvo4nvmLsrLw>
X-ME-Received: <xmr:IDZFahBfIKOhDFlY9CMUqIqryA09rPxmeyYC2Ouy-0VJfmq774ZqDUtyWsOUFA>
X-ME-Proxy-Cause: dmFkZTFCe0Qg8LePbnO0tVViZYir7gYWYFiJi9FChNr/c+BoUiXMnAjJHzn194QSG8/hmE
    er9oQOSseZew0j1bWXWyBPXr67FVctHtt01gmE3489L1P+Gx2psn4JZ0E+oki4I/XmVSjv
    sab8pDNDBaBDmFMoKJOTZAhGMsFJhqmYcFrdjq35kCv78wFKzHVql2YMMAoOc7QejNctHl
    ndCOFPQRb+3ETTE2bACiBK1HKTklEgZfUaOEg7qEaLYL6SdMiXE5AiAJVzwWv+tOVsjPIj
    KefxDv54AyNdZFvrK5Lw6WxPOD/ohy38tR6PLST5NqEZERqlSE6w82lhlgi80Lm5+aordQ
    wr0rPQXwBNooBWHEILFP7z3nXEm0TppdHpyGb/q8PdoCG80/CGslcFma3K0Ztn+vLZSeg5
    0RSmZlxB+XGat748J1JC1Btf/yrM7usWj6kvXABDu6cJlcW6IH0IKrqGfOnlsCyXmtjbke
    +18SfuRawLi8YgFr/0hXZONT13KJRwvIPHznaJSa7sgLRIq6eXzccC23HvgG3ZsbwsPmxr
    T3qpDEdK1sWE7MbXeMTHsfpG1X1Q6Y8hQSNXlGUnJSNVDMc4Ku60ucAq2eN0km6phtQDvU
    /hR/zlhr4V+Xo9qF/rgo01n25IqQ7LsO99LI7S1fe2v6zkMo6tUzo73aEtKg
X-ME-Proxy: <xmx:IDZFal5YW1-CQ_lqZHgP0fDhCEcq-sXE-IWOV7vT7rfRSow22HiMkA>
    <xmx:IDZFao014SKzL0DVXmE6VsFKJU3Bd8CgOX_QNRa-p7Hr-4GIxUsbIQ>
    <xmx:IDZFapkaajlGfFVtiFThuEWrIVZHfc2u9h3d6pC2yFotyyiQpPSWMA>
    <xmx:IDZFau7TCJJgqonLF73HtJWaCad4iIJbzY3ov8POiw86331Ox5xmNA>
    <xmx:IDZFaklcPO15aUFndgnZJ7xXqu3Fau_1hwSe8owB4Ed82ha6gl0IfeJC>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jul 2026 11:45:35 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kyle McMartin <jkkm@meta.com>,
	Breno Leitao <leitao@debian.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH] iommu/arm-smmu-v3: Shrink command/event/PRI queues in kdump kernel
Date: Wed,  1 Jul 2026 16:45:28 +0100
Message-ID: <20260701154528.768976-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The command, event and PRI queues are sized from the maxima the hardware
advertises in IDR1, which can be several megabytes each. On systems with
many SMMUv3 instances that cost is paid per instance and adds up to tens
of megabytes of coherent DMA in the capture kernel.

A kdump capture kernel runs from a small crashkernel reservation and only
has to drive the few devices used to save the dump, so deep queues serve
no purpose. The queues carry invalidation commands and fault records, not
DMA data, so dump throughput is unaffected; a shallower queue only bounds
how many commands may be in flight before a sync, which does not matter for
the capture kernel's small device count and modest I/O.

Clamp every queue to a single page when is_kdump_kernel() is true. Doing
it in arm_smmu_init_one_queue() covers the command, event and PRI queues
in one place. The command queue still holds at least one batch plus a sync
(256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
command batching keeps working.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..6ec3ef5ee0da 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4414,6 +4414,20 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 {
 	size_t qsz;
 
+	/*
+	 * A kdump capture kernel runs from a small crashkernel reservation and
+	 * only has to drive the few devices used to save the dump, so there is
+	 * no point sizing the queues for the (multi-megabyte) maxima the
+	 * hardware advertises. Clamp each queue to a single page. ent_sz_shift
+	 * is the log2 of the entry size in bytes (dwords * 8).
+	 */
+	if (is_kdump_kernel()) {
+		u32 ent_sz_shift = ilog2(dwords) + 3;
+
+		q->llq.max_n_shift = min_t(u32, q->llq.max_n_shift,
+					   PAGE_SHIFT - ent_sz_shift);
+	}
+
 	do {
 		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
 		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
-- 
2.54.0


