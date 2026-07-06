Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A43C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRAlXDC5oqmsaoNnYadnzJXzxvCqL4owp1KVT95a8j0=; b=QwZWBTARLeoliLQLWrGq4Er0or
	G/55f5s2D07s9L+IzB4dYSeGmZDG0N5jckLqKo+MMGpsPubK/ND044OWP5wLm8MKtOhR9GHRP3ObN
	fOwlzunp+IVlqSl2WqGL+K35kvyy5H4xlmtwkT+r5UNx3UT09dulq8mwgLU9fUvbfLtkZMNrfxcFb
	cUpSYAKjWJ4duka8h1aBWp9SFrVgdXxemWuKELGYOwk4TuDKvzARtQuFlh6t+BhOunT93KBbxLqyh
	eGg/EPXSgHPxc4mW5zj9v+VTN6FdRyKj3TP5GX7mCwMgBXH2A69WD991qUcLbnqMPdoawvpUtqzL9
	Vi9kE9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSZ-0000000BZQ9-1MYf;
	Mon, 06 Jul 2026 06:05:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcSY-0000000BZOs-0N1n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:05:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5DCB41767;
	Mon,  6 Jul 2026 06:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D851C1F00A3A;
	Mon,  6 Jul 2026 06:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317937;
	bh=SRAlXDC5oqmsaoNnYadnzJXzxvCqL4owp1KVT95a8j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RgVB/Zmypcck62R5YgLImy6Oj1gZRgAEeXjBj/gKMiPfIOY6j9s/98FSqsVFJbmSQ
	 aZn6wrKVYBrWDyVoausJoTqSGqheZbDd7dOooqRMaBtNq9Dbf5u9p9ltFJZ7uYM5xa
	 v7GnRcBSSAYSTVc5YJ7Y31ZCsKJCytnqVo5U6hcINLcno6iich7TluhQz/8xIy9E7S
	 9ehmgxB+pqapzYiIOohuZNZxqv1UXbLIUWB4tS2VS7RIkR2VTc74BDL5TiVTLnlUSX
	 PC4iKfv6yBtW47OtPQr9fFWE7QfoEPP0kielTDEvGapndbSMMOaqx+DvvWdyomQFXa
	 KpOOIsjYEEeIQ==
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
Subject: [PATCH v5 07/10] dma-buf: system_heap: Enforce shared-granule alignment for cc-shared buffers
Date: Mon,  6 Jul 2026 11:34:29 +0530
Message-ID: <20260706060432.1375570-8-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
References: <20260706060432.1375570-1-aneesh.kumar@kernel.org>
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


