Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CE8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/6QCDeil0i4wpPLRy/lh5myzwbTMSRGajg6rLXjcnQ=; b=HhFqwtnKDCguWxV0n3zDyBizpS
	HjaagtIg8xV7Oz2Oy//VM6n5r3UlfAUsDN6WgukcOtz0jq+jCLX2YajqqhczkcuD+7FzZijwARKYL
	WjIGiNv9wJrL9h5pkBw0sSC61Ffn+fiyFnqgvMn5aK8T8j7y5UCYyTwH/22m2YNsyZ4ENlbcVLeqX
	bbg/INz/RtXZx3VjTtku9UwSUUPPHNoak+skkQC5pGhLIS9/BH/k/DEomUCYeM8VfLuvLkmQOBM6N
	eXuv6fVO6VVQFinpxEoDAz7Jhxf5W4l3MiVby19I8J5s6z8HNl2jngq7MbpcAbX2h/kosG21iS6ax
	5bOSwPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcRz-0000000BZ82-32KB;
	Mon, 06 Jul 2026 06:05:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcRy-0000000BZ7L-2JSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:05:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0436D600BB;
	Mon,  6 Jul 2026 06:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A2A1F000E9;
	Mon,  6 Jul 2026 06:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783317901;
	bh=r/6QCDeil0i4wpPLRy/lh5myzwbTMSRGajg6rLXjcnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AeQvRqngK209IZbTEJdvoEFXWzsasnIiz0BF4GHk03AcWpk81M2iDCjTl4avLbvD7
	 hAvYX22sB47e9A54rbl/U86iI6fuKU7lb6JnqE2f597IJ3VLp+bsp3eavf2VXQ0Iwh
	 8Bfaa+V1OEbvGg8y8TCPVnEA5t4n9LHIY5bFOX71vwTF74RLqlD/C2Gj5+pTZinGSQ
	 lgC2CALzEgO+JfsSFHHh7uWFiuk2jd16MZAPXlPa1ch/4hkq7bxNX+9dP2wLz45//P
	 aWQkggnoQKBqp1BVKpXaqviWku5PXU9EL9Vcr+wJcCCHlXecKym1SpLjJ0tJMkU2wA
	 RiFBu6r3vhuWQ==
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
Subject: [PATCH v5 02/10] irqchip/gic-v3-its: Align shared ITS allocations to the CoCo shared granule size
Date: Mon,  6 Jul 2026 11:34:24 +0530
Message-ID: <20260706060432.1375570-3-aneesh.kumar@kernel.org>
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

ITS tables allocated by the coco guest are shared with the hypervisor.
These allocations must satisfy the host shared-buffer granule size so that
the full converted range is safe for host access.

Allocate ITS pages using a size rounded up to the shared granule size and
use the same allocation order when encrypting, decrypting and freeing the
memory. Also grow the ITT cache in shared-granule sized chunks instead of
assuming PAGE_SIZE is sufficient.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0..5d6d38aa0dae 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -213,16 +213,17 @@ static gfp_t gfp_flags_quirk;
 static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 					 unsigned int order)
 {
+	unsigned int alloc_order;
 	struct page *page;
 	int ret = 0;
 
-	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
-
+	alloc_order = get_order(mem_cc_align_to_shared_granule(PAGE_SIZE << order));
+	page = alloc_pages_node(node, gfp | gfp_flags_quirk, alloc_order);
 	if (!page)
 		return NULL;
 
 	ret = set_memory_decrypted((unsigned long)page_address(page),
-				   1 << order);
+				   1 << alloc_order);
 	/*
 	 * If set_memory_decrypted() fails then we don't know what state the
 	 * page is in, so we can't free it. Instead we leak it.
@@ -241,13 +242,16 @@ static struct page *its_alloc_pages(gfp_t gfp, unsigned int order)
 
 static void its_free_pages(void *addr, unsigned int order)
 {
+	int alloc_order;
+
+	alloc_order = get_order(mem_cc_align_to_shared_granule(PAGE_SIZE << order));
 	/*
 	 * If the memory cannot be encrypted again then we must leak the pages.
 	 * set_memory_encrypted() will already have WARNed.
 	 */
-	if (set_memory_encrypted((unsigned long)addr, 1 << order))
+	if (set_memory_encrypted((unsigned long)addr, 1 << alloc_order))
 		return;
-	free_pages((unsigned long)addr, order);
+	free_pages((unsigned long)addr, alloc_order);
 }
 
 static struct gen_pool *itt_pool;
@@ -272,7 +276,8 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		gen_pool_add(itt_pool, (unsigned long)page_address(page),
+			     mem_cc_align_to_shared_granule(PAGE_SIZE), node);
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.43.0


