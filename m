Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B9EFCD74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzLVpAcvZeXCH+LFxjzrWb8NgAmYmRR+w6HmZxQeg+s=; b=YusySt5Q4F7EGcCIRKyUC4w/0Z
	CqDToong1Sqf7dVfAlW0wUt82yljq759d1HkbU2sZAmjAxsNl0MddiJ7uEVbYyWlpiRAWddYbZ/6t
	eTV6ilSN4Q/cGdTvUy3Mbgs1izVVdx2SvS1djQ2Bx250X4J0B93aTltQAVg6KXojRFcjMM1xC7R8M
	AYqlTPz7Aav1nlVBxxnVNnCoczu9doM3BjwVRGJTMbKnxwXkw9yL3v2CjTbh3W+VULOk9mx9ktEUV
	Y99otcgYjlH7e0eFbqSu2vLkkJRnc9hMZP3hayaOQqmQhqYWdGH/KYE35yn9UtPeeg0SFIV8he6Hn
	aOAoZV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXpU-000000075I5-3z4G;
	Mon, 09 Mar 2026 10:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXpT-000000075HH-0Kby
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2750760133;
	Mon,  9 Mar 2026 10:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD31C19423;
	Mon,  9 Mar 2026 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052033;
	bh=SMTPZxBrGWET40HHUPAfjE8Aok3FvJ1waxDLjxRSjT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WK857DbDpZjUPyKPeB50mTNcwMLoM5eVrz1wSTBgLaVOBsk2whOdFv+BqYJwVdX6B
	 GMDg4fjiTN4UODkGmh9Qnk8l6ckEuExugKRY2G/wj/xvUatbwEpntG0uyI5nrOGhPE
	 /FfL3mspCZXeT/YCNajJ09ODj4V4y8+fnMcI6H6DOXTwpcuxntd5K/uu2HQu1vIUHD
	 pZqJTARert+a0vuo4tZhdioXG8Upw3cZLtS0MdpySaHCyyOVnbFg2wkOV2C0lZLvhT
	 4hG9tMDThEDzuXxZfW1B40ChRpabHx1E/hDwcS7gW/l9R4shnG20pUekrh6rSA1R9N
	 thXJ01zx/O+hg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v3 1/3] dma-direct: swiotlb: handle swiotlb alloc/free outside __dma_direct_alloc_pages
Date: Mon,  9 Mar 2026 15:56:23 +0530
Message-ID: <20260309102625.2315725-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309102625.2315725-1-aneesh.kumar@kernel.org>
References: <20260309102625.2315725-1-aneesh.kumar@kernel.org>
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

Move swiotlb allocation out of __dma_direct_alloc_pages() and handle it in
dma_direct_alloc() / dma_direct_alloc_pages().

This is needed for follow-up changes that align shared decrypted buffers to
hypervisor page size. swiotlb pool memory is decrypted as a whole and does
not need per-allocation alignment handling.

swiotlb backing pages are already mapped decrypted by
swiotlb_update_mem_attributes() and rmem_swiotlb_device_init(), so
dma-direct should not call dma_set_decrypted() on allocation nor
dma_set_encrypted() on free for swiotlb-backed memory.

Update alloc/free paths to detect swiotlb-backed pages and skip
encrypt/decrypt transitions for those paths. Keep the existing highmem
rejection in dma_direct_alloc_pages() for swiotlb allocations.

Only for "restricted-dma-pool", we currently set `for_alloc = true`, while
rmem_swiotlb_device_init() decrypts the whole pool up front. This pool is
typically used together with "shared-dma-pool", where the shared region is
accessed after remap/ioremap and the returned address is suitable for
decrypted memory access. So existing code paths remain valid.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/direct.c | 44 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 8f43a930716d..c2a43e4ef902 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -125,9 +125,6 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
-	if (is_swiotlb_for_alloc(dev))
-		return dma_direct_alloc_swiotlb(dev, size);
-
 	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
 	page = dma_alloc_contiguous(dev, size, gfp);
 	if (page) {
@@ -204,6 +201,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
 	bool remap = false, set_uncached = false;
+	bool mark_mem_decrypt = true;
 	struct page *page;
 	void *ret;
 
@@ -250,11 +248,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	    dma_direct_use_pool(dev, gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
+	if (is_swiotlb_for_alloc(dev)) {
+		page = dma_direct_alloc_swiotlb(dev, size);
+		if (page) {
+			mark_mem_decrypt = false;
+			goto setup_page;
+		}
+		return NULL;
+	}
+
 	/* we always manually zero the memory once we are done */
 	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
 	if (!page)
 		return NULL;
 
+setup_page:
 	/*
 	 * dma_alloc_contiguous can return highmem pages depending on a
 	 * combination the cma= arguments and per-arch setup.  These need to be
@@ -281,7 +289,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			goto out_free_pages;
 	} else {
 		ret = page_address(page);
-		if (dma_set_decrypted(dev, ret, size))
+		if (mark_mem_decrypt && dma_set_decrypted(dev, ret, size))
 			goto out_leak_pages;
 	}
 
@@ -298,7 +306,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	return ret;
 
 out_encrypt_pages:
-	if (dma_set_encrypted(dev, page_address(page), size))
+	if (mark_mem_decrypt && dma_set_encrypted(dev, page_address(page), size))
 		return NULL;
 out_free_pages:
 	__dma_direct_free_pages(dev, page, size);
@@ -310,6 +318,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 void dma_direct_free(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
+	bool mark_mem_encrypted = true;
 	unsigned int page_order = get_order(size);
 
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
@@ -338,12 +347,15 @@ void dma_direct_free(struct device *dev, size_t size,
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
 		return;
 
+	if (swiotlb_find_pool(dev, dma_to_phys(dev, dma_addr)))
+		mark_mem_encrypted = false;
+
 	if (is_vmalloc_addr(cpu_addr)) {
 		vunmap(cpu_addr);
 	} else {
 		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
 			arch_dma_clear_uncached(cpu_addr, size);
-		if (dma_set_encrypted(dev, cpu_addr, size))
+		if (mark_mem_encrypted && dma_set_encrypted(dev, cpu_addr, size))
 			return;
 	}
 
@@ -359,6 +371,19 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
 		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
 
+	if (is_swiotlb_for_alloc(dev)) {
+		page = dma_direct_alloc_swiotlb(dev, size);
+		if (!page)
+			return NULL;
+
+		if (PageHighMem(page)) {
+			swiotlb_free(dev, page, size);
+			return NULL;
+		}
+		ret = page_address(page);
+		goto setup_page;
+	}
+
 	page = __dma_direct_alloc_pages(dev, size, gfp, false);
 	if (!page)
 		return NULL;
@@ -366,6 +391,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	ret = page_address(page);
 	if (dma_set_decrypted(dev, ret, size))
 		goto out_leak_pages;
+setup_page:
 	memset(ret, 0, size);
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
@@ -378,13 +404,17 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 		enum dma_data_direction dir)
 {
 	void *vaddr = page_address(page);
+	bool mark_mem_encrypted = true;
 
 	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
 	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
 	    dma_free_from_pool(dev, vaddr, size))
 		return;
 
-	if (dma_set_encrypted(dev, vaddr, size))
+	if (swiotlb_find_pool(dev, page_to_phys(page)))
+		mark_mem_encrypted = false;
+
+	if (mark_mem_encrypted && dma_set_encrypted(dev, vaddr, size))
 		return;
 	__dma_direct_free_pages(dev, page, size);
 }
-- 
2.43.0


