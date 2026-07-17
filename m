Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD5CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwGwo2v1bc/tfRKKTB7zzFn/AHGX4mQVp7Ym9P3mvNc=; b=itSaGAJhfUIX2JxIjoK1A9bjK+
	ZOY7dDihl/AaXHlFxNUnkXdUxI9Qju7TchIkLMdzZloh92x6WzcOCZ9EEuwPvP3dKRzyEHsjX5NJW
	V+giVVHPdmhUpTPXtV0vC3B9kNRHL7LvAduW6ANRl4TXvY0bvB4EmeqnSH3i2fTrVqFe2cGSV3TI3
	UZzt/ttHrtPFKw6YbJWIt/rHlW7fxM97Mny7qKuBBRDTsQ8pYiUtypigHeFI6WwprOAsiTy26Mjed
	zPidQqfz9p9mqLvpq56ftpVtRet+If4EUWA9MPbeijtFiBkKnQIeSVwhNIhm9Sz1DMyAWkgMFhLqH
	2rCY3ZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmyn-00000002y0K-2d6c;
	Fri, 17 Jul 2026 18:08:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmym-00000002xzE-0BGR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:08:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B02C74188F;
	Fri, 17 Jul 2026 18:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABC81F000E9;
	Fri, 17 Jul 2026 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784311687;
	bh=PwGwo2v1bc/tfRKKTB7zzFn/AHGX4mQVp7Ym9P3mvNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BP5iTTw71m+JzUVT4oQamNjA8tRrSdlrhJHPabvG4jvbiWwSchW6LscApjzvzfSYm
	 MQCa8o0m1ipdDX7SdMuLHgTZ4IWXQxJktMmbiNLIQ+gJUPsFyi0XLXhJwYwxMpWaiL
	 SWcUDH7wvsith+5+bko8GxVl0wq3lBLtnfCOZfDXmaHKztP/qHL3IowfvzKQ5EzoBP
	 h4t+FDvFCW6cSzB18rA8aSxbkoiIIlsu9iUi8pNYrKPB6S3FtoxcP4so3dP5UOSKr3
	 fNoA1XnRHK/caUQEAWeczcbWRQAFkU5QeVq6grwcH/uSyIyJ/o5fqvAYN618S/gMjP
	 dLx40xNRBhQtw==
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
	x86@kernel.org
Subject: [PATCH v8 16/23] dma-direct: Move dma_direct_map_phys() to dma/direct.c
Date: Fri, 17 Jul 2026 23:34:34 +0530
Message-ID: <20260717180442.110954-17-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717180442.110954-1-aneesh.kumar@kernel.org>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
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

dma_direct_map_phys() is too large to benefit from being inlined. Move its
implementation to direct.c and leave the declaration in direct.h.

No functional change in this patch

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/direct.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 kernel/dma/direct.h | 56 +++------------------------------------------
 2 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f54c7929b97f..2413235c50f0 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -620,6 +620,59 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 			user_count << PAGE_SHIFT, vma->vm_page_prot);
 }
 
+dma_addr_t dma_direct_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir,
+		unsigned long attrs, bool flush)
+{
+	dma_addr_t dma_addr;
+
+	if (is_swiotlb_force_bounce(dev)) {
+		if (!(attrs & DMA_ATTR_CC_SHARED)) {
+			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
+				return DMA_MAPPING_ERROR;
+
+			return swiotlb_map(dev, phys, size, dir, attrs);
+		}
+	} else if (attrs & DMA_ATTR_CC_SHARED) {
+		return DMA_MAPPING_ERROR;
+	}
+
+	if (attrs & DMA_ATTR_MMIO) {
+		dma_addr = phys;
+		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
+			goto err_overflow;
+	} else if (attrs & DMA_ATTR_CC_SHARED) {
+		dma_addr = phys_to_dma_unencrypted(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
+			goto err_overflow;
+	} else {
+		dma_addr = phys_to_dma(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
+		    dma_kmalloc_needs_bounce(dev, size, dir)) {
+			if (is_swiotlb_active(dev) &&
+			    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
+				return swiotlb_map(dev, phys, size, dir, attrs);
+
+			goto err_overflow;
+		}
+	}
+
+	if (!dev_is_dma_coherent(dev) &&
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
+		arch_sync_dma_for_device(phys, size, dir);
+		if (flush)
+			arch_sync_dma_flush();
+	}
+	return dma_addr;
+
+err_overflow:
+	dev_WARN_ONCE(
+		dev, 1,
+		"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+		&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
+	return DMA_MAPPING_ERROR;
+}
+
 int dma_direct_supported(struct device *dev, u64 mask)
 {
 	u64 min_mask = ((u64)max_pfn << PAGE_SHIFT) - 1;
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index e05dc7649366..a7adadb1b2a5 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -17,6 +17,9 @@ bool dma_direct_can_mmap(struct device *dev);
 int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
+dma_addr_t dma_direct_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir,
+		unsigned long attrs, bool flush);
 bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr);
 int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		enum dma_data_direction dir, unsigned long attrs);
@@ -82,59 +85,6 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 	swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
 }
 
-static inline dma_addr_t dma_direct_map_phys(struct device *dev,
-		phys_addr_t phys, size_t size, enum dma_data_direction dir,
-		unsigned long attrs, bool flush)
-{
-	dma_addr_t dma_addr;
-
-	if (is_swiotlb_force_bounce(dev)) {
-		if (!(attrs & DMA_ATTR_CC_SHARED)) {
-			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
-				return DMA_MAPPING_ERROR;
-
-			return swiotlb_map(dev, phys, size, dir, attrs);
-		}
-	} else if (attrs & DMA_ATTR_CC_SHARED) {
-		return DMA_MAPPING_ERROR;
-	}
-
-	if (attrs & DMA_ATTR_MMIO) {
-		dma_addr = phys;
-		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
-			goto err_overflow;
-	} else if (attrs & DMA_ATTR_CC_SHARED) {
-		dma_addr = phys_to_dma_unencrypted(dev, phys);
-		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
-			goto err_overflow;
-	} else {
-		dma_addr = phys_to_dma(dev, phys);
-		if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
-		    dma_kmalloc_needs_bounce(dev, size, dir)) {
-			if (is_swiotlb_active(dev) &&
-			    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
-				return swiotlb_map(dev, phys, size, dir, attrs);
-
-			goto err_overflow;
-		}
-	}
-
-	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
-		arch_sync_dma_for_device(phys, size, dir);
-		if (flush)
-			arch_sync_dma_flush();
-	}
-	return dma_addr;
-
-err_overflow:
-	dev_WARN_ONCE(
-		dev, 1,
-		"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-		&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
-	return DMA_MAPPING_ERROR;
-}
-
 static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs,
 		bool flush)
-- 
2.43.0


