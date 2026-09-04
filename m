Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E98AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRAlXDC5oqmsaoNnYadnzJXzxvCqL4owp1KVT95a8j0=; b=hAYPDlaQZ1nk+OXlXpVvibnams
	LrjrE0tsQI8AV4flQBB2cvxzvFLQwr/pMuip3VqdlpoP6kXOFVJm3A1LM7OFDvABXGNFFa31wbuDf
	uk+z4OjWldwrzDAjrhPOfHmGYKF5pXSHZBs/bMzf2hFECCMnZ+xMp5kMTmwAYCkTuBfDRVVSfkX1A
	CpjblYR9eWAwiMZ7qAvAM9kXCcqHC8Y3oDkMiOms9Hzwv21rdzLcYYyDt7Bjmv4Kzvf/iZWMXqCOA
	C+dC5dcfbPO4aed3RtWAZrDMCNtclGglgtO1jndeVcV85KfSIZDcbj91WgagYqT+KV/0EGP3fgh+P
	rzPjA29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGr-00000001gkg-0BZc;
	Fri, 04 Sep 2026 10:35:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGq-00000001gjU-0CX2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B19A6024D;
	Fri,  4 Sep 2026 10:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3DB1F00A3E;
	Fri,  4 Sep 2026 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518142;
	bh=SRAlXDC5oqmsaoNnYadnzJXzxvCqL4owp1KVT95a8j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HmBc88SdcpB3sLSsxItcqYlx2jCkHAbj9Bncs+n91l+n9B+Stp2LJFgicwO3sQY+o
	 q3ZNLnkrb8TZA/OiFg+s/ASpmDPKvhP1dap1Tw6rHbrSQqu8Mtuq2hadF0l5fNZODj
	 U9o4opHpdRWCrUjRhPgaJ7km1q+9LW58RP0ftAw1jiFbJ0gY/rCDl3xwFaHd9pnhmY
	 7vwK5pqh+HiXjnPllikjkUPkZ8acS+SSdD0BidBGJa1hZqGoR3edxRSJ4i7qb1Kh7h
	 jEMgZJRCqJEXhzlOgXRAJp2gB6mnsYT01Ouwbqpr+J4H5fr1fsnc5MBylkorftR155
	 159D+KNtdrmYw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule alignment for cc-shared buffers
Date: Fri,  4 Sep 2026 16:04:50 +0530
Message-ID: <20260904103452.1197239-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
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

The system heap can allocate buffers that are decrypted and shared with the
host. For confidential-computing guests, those shared buffers must cover
whole shared-buffer granule; otherwise a userspace mmap of the dma-buf may
expose only part of a host-managed granule and allow unintended access to
adjacent private memory.

Require cc-shared system-heap allocations to have a size aligned to
mem_cc_shared_granule_size(), and allocate pages at least as large as the
required granule. Keep the allocation bounded by the existing heap orders,
but fall back to an exact minimum-order allocation when the required
granule is not one of the preferred heap orders.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 50 +++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..9cbfcebe2088 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -55,7 +55,6 @@ struct dma_heap_attachment {
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
 				| __GFP_COMP)
-static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
@@ -375,26 +374,44 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 	.release = system_heap_dma_buf_release,
 };
 
+static struct page *system_heap_alloc_order(unsigned int order)
+{
+	gfp_t flags = order ? HIGH_ORDER_GFP : LOW_ORDER_GFP;
+
+	if (mem_accounting)
+		flags |= __GFP_ACCOUNT;
+
+	return alloc_pages(flags, order);
+}
+
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    unsigned int min_order)
 {
 	struct page *page;
 	int i;
-	gfp_t flags;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
 		if (size <  (PAGE_SIZE << orders[i]))
 			continue;
-		if (max_order < orders[i])
+
+		if (max_order < orders[i] || orders[i] < min_order)
 			continue;
-		flags = order_flags[i];
-		if (mem_accounting)
-			flags |= __GFP_ACCOUNT;
-		page = alloc_pages(flags, orders[i]);
+
+		page = system_heap_alloc_order(orders[i]);
 		if (!page)
 			continue;
 		return page;
 	}
+	/*
+	 * The required minimum order might not be one of the preferred heap
+	 * orders. Allocate exactly min_order when it does not exceed the
+	 * remaining size.
+	 */
+	if (min_order && min_order <= max_order &&
+	    size >= (PAGE_SIZE << min_order))
+		return system_heap_alloc_order(min_order);
+
 	return NULL;
 }
 
@@ -409,6 +426,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	unsigned int max_order = orders[0];
 	struct system_heap_priv *priv = dma_heap_get_drvdata(heap);
 	bool cc_shared = priv->cc_shared;
+	unsigned int min_order = 0;
+	size_t cc_granule_size;
 	struct dma_buf *dmabuf;
 	struct sg_table *table;
 	struct scatterlist *sg;
@@ -425,6 +444,18 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	buffer->heap = heap;
 	buffer->len = len;
 	buffer->cc_shared = cc_shared;
+	if (cc_shared_buffer(buffer)) {
+		cc_granule_size = mem_cc_shared_granule_size();
+		if (!IS_ALIGNED(len, cc_granule_size)) {
+			ret = -EINVAL;
+			goto free_buffer;
+		}
+		min_order = get_order(cc_granule_size);
+		if (min_order > max_order) {
+			ret = -EINVAL;
+			goto free_buffer;
+		}
+	}
 
 	INIT_LIST_HEAD(&pages);
 	i = 0;
@@ -438,7 +469,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 			goto free_buffer;
 		}
 
-		page = alloc_largest_available(size_remaining, max_order);
+		page = alloc_largest_available(size_remaining, max_order,
+					       min_order);
 		if (!page)
 			goto free_buffer;
 
-- 
2.43.0


