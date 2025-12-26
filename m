Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53302E8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CBlUJRZIbYM1prFWy/0G8KDccWD/YxTB/AJqWrZ/Ys=; b=K6yKbV/LunrxSY
	vDwaj8XWCsovIl/ZMgo86cbbu0L0sdTsj2Xe0u5d35y3EYJ5ADjun+TSD4zFCXH5QuTBsX6CRXhBL
	4q+wfOBRadv9rPtXfVtrjU4msRq/nWpQvm+/c27xjAu0bWxgh/Q3NlbadQ6Lde3VoU6JwSj1aWdtY
	buhf58zDXkEeJ0hwTPocLDRK5C2eXUA0XI6gs0WVup73ixRxTUUzB4yTe6h+k/9o6ZmkwKQJhPi62
	5vOPCSXDYR1pV4IEQMjDMklxjC2i57hQhubNnvCJcDqSGkZXmQqN9kiNoXTBzGK03RZeaDiHor48e
	Hxvzd0OeWqlWRikB0iNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgz-00000001XAb-140E;
	Fri, 26 Dec 2025 22:53:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgw-00000001X9a-0pdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:53:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-34c363eb612so7495633a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789629; x=1767394429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CBlUJRZIbYM1prFWy/0G8KDccWD/YxTB/AJqWrZ/Ys=;
        b=eeEShbDKvhRvdjhcSWqwAPk9fIbl8WKndJaCI3KcueqRFQmM1QSZnH0dvysgjgDwJa
         Xa0/8j3QxoIPPWctcTbMBxl/xn76x7HZeb37EuSeq5a0p/uNPLZGrxa6EYYCvPpK8GSh
         yr8NyM68xSpXTriTr9L/pxGg5UmcKlMuiof6K5+5QKacShem7zJrAG24RKzze9hNBBTz
         cBX2lcoP9fnrBu0zPfj6MMTxdcYTulMyYPeRNTSKbJwtUM/r7xMHi+D06TEJoDfel0aD
         qHc/ilv9OkDPIeRsP+cN8nBQqfEODeZx98IqTGjkSra+CaVzHhMU7rS84nR7W9Q71Mrj
         +gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789629; x=1767394429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CBlUJRZIbYM1prFWy/0G8KDccWD/YxTB/AJqWrZ/Ys=;
        b=ay6AiyoPKLYkgYPpFKCKe4IcvGGI1udEgWT1plZN4N23K2SBjZJVq/nYvPee1+lzH1
         jz0x8pzSVR+373tJ21/XL87dXC4CKqORdrpMX8/O/KO0f44zUoD20BfYBb8s9HI8QYQo
         YpvEGWEJj1f1INQ8hDmMNBmaJi9l5DONGyKNq0u+uJ+ybh4SMaw8RMcrhXP3LcFL4BQd
         caSzPbKSMBayClammI+D+6viED+l05p2sXaG5pGVtCNdKIfYJz6GqJQVL8bLGiHbQRQa
         aVZ4vLreXE+a3ul7vA5hxRKmRNRWdg46D1aeSz0/Fm9dYUHYOMidosAhlr5R3ifXKLoy
         GEZg==
X-Forwarded-Encrypted: i=1; AJvYcCW8T5+SNR7pupcNwNgSBTVR/BLQZyDf0z9L7nI+4HviuHIq493EgBJKZYTadDm7wNfUZYDhJGgY/LbOGCcBuST8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+tF7Yofd/87Bw2CWp407p5133EPjWC2oEva6d8/ksrbAQnYGZ
	ifUp7w4TPBxpDRuQrPVO81ebbRR/RvSXvsmH7TwEeg4Ox89PCWLtoW6X
X-Gm-Gg: AY/fxX7r0H5LCwWS9PHvWZaQUCbf4p+OHg2b7sBQkWvzAGx4PBurwWrTviOdzhRrPig
	Rz28+tL2ECLd5QKFcDo9WJd3U7XzyDUIl7IzNfXlNhYrxFd0EyYDVa22/BoehWeZ0j367eyRSKq
	2k2YMjLUSqzOoZwQs4BhWbQUbLtibb17FdfCC47/0dLxy6yjDRZ1dKxKUEPqg4A3S/JNJ1GKcei
	wLgafJJY1XccGlciWgltLbs/iahBdBG5+Zqr1G6I2owP/OJG9GXYili+lAVMaHNvqMnlowD4PDE
	f+SpPsLk/g8C90tPveSVWJXK7JL5ZGAxQTmUJqyRhZQ+IqeIS5dusQgPWlG44cY0eEMhippAD5V
	+SpwYNqHw4iMTzCioLTlnJ55uemElze2WQi4q/xy3GI+cBIf7qcR1H0hWf05Y1d5+CLf7HVGFse
	Dr/kQzTZW9Kg3q
X-Google-Smtp-Source: AGHT+IF6GTCerKOqMOKSYSeLfAiimvUN3+7D1SxAsR14bBFsurGjwmGev9rAORcjp7S0YIZTn6CThQ==
X-Received: by 2002:a17:90b:560c:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-34e921c3003mr16987619a91.22.1766789629137;
        Fri, 26 Dec 2025 14:53:49 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:48 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/8] dma-mapping: Separate DMA sync issuing and completion waiting
Date: Sat, 27 Dec 2025 11:52:44 +1300
Message-ID: <20251226225254.46197-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145350_270760_79A47EC0 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Juergen Gross <jgross@suse.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

Currently, arch_sync_dma_for_cpu and arch_sync_dma_for_device
always wait for the completion of each DMA buffer. That is,
issuing the DMA sync and waiting for completion is done in a
single API call.

For scatter-gather lists with multiple entries, this means
issuing and waiting is repeated for each entry, which can hurt
performance. Architectures like ARM64 may be able to issue all
DMA sync operations for all entries first and then wait for
completion together.

To address this, arch_sync_dma_for_* now issues DMA operations in
batch, followed by a flush. On ARM64, the flush is implemented
using a dsb instruction within arch_sync_dma_flush().

For now, add arch_sync_dma_flush() after each
arch_sync_dma_for_*() call. arch_sync_dma_flush() is defined as a
no-op on all architectures except arm64, so this patch does not
change existing behavior. Subsequent patches will introduce true
batching for SG DMA buffers.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cache.h |  6 ++++++
 arch/arm64/mm/dma-mapping.c    |  4 ++--
 drivers/iommu/dma-iommu.c      | 37 +++++++++++++++++++++++++---------
 drivers/xen/swiotlb-xen.c      | 24 ++++++++++++++--------
 include/linux/dma-map-ops.h    |  6 ++++++
 kernel/dma/direct.c            |  8 ++++++--
 kernel/dma/direct.h            |  9 +++++++--
 kernel/dma/swiotlb.c           |  4 +++-
 8 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index dd2c8586a725..487fb7c355ed 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -87,6 +87,12 @@ int cache_line_size(void);
 
 #define dma_get_cache_alignment	cache_line_size
 
+static inline void arch_sync_dma_flush(void)
+{
+	dsb(sy);
+}
+#define arch_sync_dma_flush arch_sync_dma_flush
+
 /* Compress a u64 MPIDR value into 32 bits. */
 static inline u64 arch_compact_of_hwid(u64 id)
 {
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..ae1ae0280eef 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 {
 	unsigned long start = (unsigned long)phys_to_virt(paddr);
 
-	dcache_clean_poc(start, start + size);
+	dcache_clean_poc_nosync(start, start + size);
 }
 
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
@@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	if (dir == DMA_TO_DEVICE)
 		return;
 
-	dcache_inval_poc(start, start + size);
+	dcache_inval_poc_nosync(start, start + size);
 }
 
 void arch_dma_prep_coherent(struct page *page, size_t size)
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c92088855450..6827763a3877 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1095,8 +1095,10 @@ void iommu_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	swiotlb_sync_single_for_cpu(dev, phys, size, dir);
 }
@@ -1112,8 +1114,10 @@ void iommu_dma_sync_single_for_device(struct device *dev, dma_addr_t dma_handle,
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
 	swiotlb_sync_single_for_device(dev, phys, size, dir);
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 }
 
 void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
@@ -1122,13 +1126,16 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	int i;
 
-	if (sg_dma_is_swiotlb(sgl))
+	if (sg_dma_is_swiotlb(sgl)) {
 		for_each_sg(sgl, sg, nelems, i)
 			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
 						      sg->length, dir);
-	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i)
+	} else if (!dev_is_dma_coherent(dev)) {
+		for_each_sg(sgl, sg, nelems, i) {
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
+			arch_sync_dma_flush();
+		}
+	}
 }
 
 void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
@@ -1143,8 +1150,10 @@ void iommu_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 							 sg_dma_address(sg),
 							 sg->length, dir);
 	else if (!dev_is_dma_coherent(dev))
-		for_each_sg(sgl, sg, nelems, i)
+		for_each_sg(sgl, sg, nelems, i) {
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
+			arch_sync_dma_flush();
+		}
 }
 
 static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
@@ -1219,8 +1228,10 @@ dma_addr_t iommu_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 			return DMA_MAPPING_ERROR;
 	}
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	iova = __iommu_dma_map(dev, phys, size, prot, dma_mask);
 	if (iova == DMA_MAPPING_ERROR && !(attrs & DMA_ATTR_MMIO))
@@ -1242,8 +1253,10 @@ void iommu_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 	if (WARN_ON(!phys))
 		return;
 
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	__iommu_dma_unmap(dev, dma_handle, size);
 
@@ -1836,8 +1849,10 @@ static int __dma_iova_link(struct device *dev, dma_addr_t addr,
 	bool coherent = dev_is_dma_coherent(dev);
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 
-	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	if (!coherent && !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 
 	return iommu_map_nosync(iommu_get_dma_domain(dev), addr, phys, size,
 			prot, GFP_ATOMIC);
@@ -2008,8 +2023,10 @@ static void iommu_dma_iova_unlink_range_slow(struct device *dev,
 			end - addr, iovad->granule - iova_start_pad);
 
 		if (!dev_is_dma_coherent(dev) &&
-		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+		    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 			arch_sync_dma_for_cpu(phys, len, dir);
+			arch_sync_dma_flush();
+		}
 
 		swiotlb_tbl_unmap_single(dev, phys, len, dir, attrs);
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ccf25027bec1..b79917e785a5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -262,10 +262,12 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
 			arch_sync_dma_for_device(phys, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_device(dev, dev_addr, size, dir);
+		}
 	}
 	return dev_addr;
 }
@@ -287,10 +289,12 @@ static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr)))) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
+		}
 	}
 
 	/* NOTE: We use dev_addr here, not paddr! */
@@ -308,10 +312,12 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	struct io_tlb_pool *pool;
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_cpu(dev, dma_addr, size, dir);
+		}
 	}
 
 	pool = xen_swiotlb_find_pool(dev, dma_addr);
@@ -331,10 +337,12 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		__swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
 			arch_sync_dma_for_device(paddr, size, dir);
-		else
+			arch_sync_dma_flush();
+		} else {
 			xen_dma_sync_for_device(dev, dma_addr, size, dir);
+		}
 	}
 }
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4809204c674c..e7dd8a63b40e 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
 
+#ifndef arch_sync_dma_flush
+static inline void arch_sync_dma_flush(void)
+{
+}
+#endif
+
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 void arch_sync_dma_for_cpu_all(void);
 #else
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 50c3fe2a1d55..a219911c7b90 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -402,9 +402,11 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 
 		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
 
-		if (!dev_is_dma_coherent(dev))
+		if (!dev_is_dma_coherent(dev)) {
 			arch_sync_dma_for_device(paddr, sg->length,
 					dir);
+			arch_sync_dma_flush();
+		}
 	}
 }
 #endif
@@ -421,8 +423,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (!dev_is_dma_coherent(dev))
+		if (!dev_is_dma_coherent(dev)) {
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
+			arch_sync_dma_flush();
+		}
 
 		swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
 
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index da2fadf45bcd..a69326eed266 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -60,8 +60,10 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 
 	swiotlb_sync_single_for_device(dev, paddr, size, dir);
 
-	if (!dev_is_dma_coherent(dev))
+	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_device(paddr, size, dir);
+		arch_sync_dma_flush();
+	}
 }
 
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
@@ -71,6 +73,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_flush();
 		arch_sync_dma_for_cpu_all();
 	}
 
@@ -109,8 +112,10 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	}
 
 	if (!dev_is_dma_coherent(dev) &&
-	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
+	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		arch_sync_dma_for_device(phys, size, dir);
+		arch_sync_dma_flush();
+	}
 	return dma_addr;
 
 err_overflow:
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a547c7693135..7cdbfcdfef86 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1595,8 +1595,10 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 		return DMA_MAPPING_ERROR;
 	}
 
-	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
 		arch_sync_dma_for_device(swiotlb_addr, size, dir);
+		arch_sync_dma_flush();
+	}
 	return dma_addr;
 }
 
-- 
2.43.0


