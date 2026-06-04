Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE816CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=na5iA7JJF5EbHB1DYhHq0zpzWxfHieUed4f5owflzmA=; b=qUc+AK4VU4GFwqYR/XQCBlLkn4
	5z5TWu6kujjhL++cuolh0S1Nxe+9DgOsivSN71uXkgMDzaM0YMNs2HZD/WTG1Ys+hD1Gq4fJEbsTw
	lJxIJ7o6928kzNXGcbjWg0xP48cubjYrKbReWHJIUnZI2DQlLOPQhaD/gCIJDiNGn7hnh87lk0dXj
	aS7T7aygBVWSq/zETAhALkStC48XHtV1ymYYXFbkTVJb35zKdP+2INutWRak8wJOkTGE1ybOi216o
	dlAY6YCjYryiePw7Loj7D5Flc5U2PinPDzXkFdvTGkmZZs0xffynUoqh1c9D4PKFz06j7eeIiaRro
	uNU+WhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3ei-0000000GP96-3C6o;
	Thu, 04 Jun 2026 08:42:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3eg-0000000GP7N-44Ip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B78F040B28;
	Thu,  4 Jun 2026 08:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C031F0089A;
	Thu,  4 Jun 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562542;
	bh=na5iA7JJF5EbHB1DYhHq0zpzWxfHieUed4f5owflzmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yn5AXRgpAXhRhafyxaaxRkC67nV6/1y/+hBVV4GhrE+hn6mZ914QVIlT0cp2sEANU
	 31krwTQNaQEGArg+jE8pLIZkcV3lRKxHmCqg4rcunxn9SFCQnW57tpDUoTy0SNTkgu
	 ug+9vIb5NLvIr86ZUT042mohsW/DLHJv+3rBczDVcJUdLS7DDks0QbxpRqZE4ibDtC
	 HMKeGTAd4ndhTvuwabYB5tD3VDr6Dks37RULt/QS8FLqWMEA94m+73lteArVYW9JX2
	 DrxMbFoSPumqXO6By77oyJZRIcyY7l+Csbe6fG6Z2+SORBo3XY6fEaYwqzhXw5lzKR
	 xdLBKCIH+4CSQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org,
	stable@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v6 14/20] dma-direct: return struct page from dma_direct_alloc_from_pool()
Date: Thu,  4 Jun 2026 14:09:53 +0530
Message-ID: <20260604083959.1265923-15-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
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

Commit 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool
helper") changed dma_direct_alloc_from_pool() to return the CPU address
from dma_alloc_from_pool(). That fits dma_direct_alloc(), but
dma_direct_alloc_pages() also uses the helper and expects a struct page *.

Fix this by making dma_direct_alloc_from_pool() return the struct page *
again, and pass the CPU address back through an out-parameter for the
dma_direct_alloc() caller.

Fixes: 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool helper")
Cc: stable@vger.kernel.org

Tested-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/direct.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4e446aa4130e..e0ab9ff3f1d6 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -157,24 +157,24 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
 	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
 }
 
-static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
+static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp,
+		unsigned long attrs)
 {
 	struct page *page;
 	u64 phys_limit;
-	void *ret;
 
 	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
 		return NULL;
 
 	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
-	page = dma_alloc_from_pool(dev, size, &ret, gfp, attrs,
+	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, attrs,
 				   dma_coherent_ok);
 	if (!page)
 		return NULL;
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
 					 !!(attrs & DMA_ATTR_CC_SHARED));
-	return ret;
+	return page;
 }
 
 static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
@@ -270,9 +270,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	 * the atomic pools instead if we aren't allowed block.
 	 */
 	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
-	    dma_direct_use_pool(dev, gfp))
-		return dma_direct_alloc_from_pool(dev, size, dma_handle,
-						  gfp, attrs);
+	    dma_direct_use_pool(dev, gfp)) {
+		page = dma_direct_alloc_from_pool(dev, size,
+					dma_handle, &cpu_addr,
+					gfp, attrs);
+		return page ? cpu_addr : NULL;
+	}
 
 	if (is_swiotlb_for_alloc(dev)) {
 		page = dma_direct_alloc_swiotlb(dev, size, attrs);
@@ -445,7 +448,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle,
-						  gfp, attrs);
+						  &cpu_addr, gfp, attrs);
 
 	if (is_swiotlb_for_alloc(dev)) {
 		page = dma_direct_alloc_swiotlb(dev, size, attrs);
-- 
2.43.0


