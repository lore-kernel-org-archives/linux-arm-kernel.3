Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6264FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7ERPbLHu4sHtJtwvlLEMBzhOV5RdwLpU5jWMZfXG4o=; b=STXQfSxW4dlo9sAfAXtFdNQnEV
	32Fwc01VQrml6X8/bCuzsSneFnZYSN2pt36/x6yXjGUtyRe8G+vrL1eXuMTar1ypBStdBJcId+vw8
	QSKtGzYNYFBUuXQcCOC0Zh7Rtf61Rbo7ant1ok6jogkizpAy4OgEJxDI+hthCi8tcpQTIlWLxl6Pe
	UGY43Xw1q95Zw83SsooTUCgMhnlif9kSQn2ktdF9z5eJxy1GCYt/z4HMGBwszWjp+n5TYg+cteYnB
	ldVKiLT/H4b2oX7z6EupGQlb6Rm8Rf5nLRZQ50JN4F5Iyr5w51eEIGh7+nXKRXXYf6xm3ye1GwSrM
	pk+YnoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xaI-000000015Ni-2Rox;
	Wed, 15 Oct 2025 09:14:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xa3-000000014zm-1aqJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A99C41ABA;
	Wed, 15 Oct 2025 09:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA70C116D0;
	Wed, 15 Oct 2025 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519638;
	bh=jbBStLIP7sXhH5ASWp90/3Kel7nJYFQjjdng7+NCqnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cYni+pn0hntzXMjiHeAuS5C74xt5skwmhT36I3n+0lgrdCfhhRxdMz4DFq9bbtcE6
	 KyshYgEW2BEQMCguUhfamAui6SDGk97Pwkv6cy20V4cWR1TsHKQXW5pPWPZJB0bROU
	 z4ZKgWbbq79xXqedNuYW1MC9dow455r9BBysavYn2gIaxdDnPgefyKpbQmttDiywRR
	 XVHkKv/NSbuh2sEJWfTis1y15Zck5wSXJQZhSm+nGRhMqLrjGmqENY85tfi+Y0OYZP
	 t5B2ZZLAkMXiTAZ3Qc6jG3RANx5TxKdOkQVsq+nUWiPqAyNSSsDxWgXnNXCMBoBXwP
	 N8uyupiJgjgjg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 14/14] dma-mapping: remove unused map_page callback
Date: Wed, 15 Oct 2025 12:13:00 +0300
Message-ID: <20251015-remove-map-page-v5-14-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021359_615997_9A743D7B 
X-CRM114-Status: GOOD (  12.90  )
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

From: Leon Romanovsky <leonro@nvidia.com>

After conversion of arch code to use physical address mapping,
there are no users of .map_page() and .unmap_page() callbacks,
so let's remove them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 include/linux/dma-map-ops.h |  7 -------
 kernel/dma/mapping.c        | 12 ------------
 kernel/dma/ops_helpers.c    |  8 +-------
 3 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 2e98ecc313a3..4809204c674c 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -31,13 +31,6 @@ struct dma_map_ops {
 			void *cpu_addr, dma_addr_t dma_addr, size_t size,
 			unsigned long attrs);
 
-	dma_addr_t (*map_page)(struct device *dev, struct page *page,
-			unsigned long offset, size_t size,
-			enum dma_data_direction dir, unsigned long attrs);
-	void (*unmap_page)(struct device *dev, dma_addr_t dma_handle,
-			size_t size, enum dma_data_direction dir,
-			unsigned long attrs);
-
 	dma_addr_t (*map_phys)(struct device *dev, phys_addr_t phys,
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 32a85bfdf873..37163eb49f9f 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -171,16 +171,6 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
 		addr = ops->map_phys(dev, phys, size, dir, attrs);
-	else if (!is_mmio && ops->map_page) {
-		struct page *page = phys_to_page(phys);
-		size_t offset = offset_in_page(phys);
-
-		/*
-		 * The dma_ops API contract for ops->map_page() requires
-		 * kmappable memory.
-		 */
-		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	}
 
 	if (!is_mmio)
 		kmsan_handle_dma(phys, size, dir);
@@ -222,8 +212,6 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, addr, size, dir, attrs);
-	else
-		ops->unmap_page(dev, addr, size, dir, attrs);
 	trace_dma_unmap_phys(dev, addr, size, dir, attrs);
 	debug_dma_unmap_phys(dev, addr, size, dir);
 }
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
index 1eccbdbc99c1..20caf9cabf69 100644
--- a/kernel/dma/ops_helpers.c
+++ b/kernel/dma/ops_helpers.c
@@ -76,11 +76,8 @@ struct page *dma_common_alloc_pages(struct device *dev, size_t size,
 	if (use_dma_iommu(dev))
 		*dma_handle = iommu_dma_map_phys(dev, phys, size, dir,
 						 DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->map_phys)
-		*dma_handle = ops->map_phys(dev, phys, size, dir,
-					    DMA_ATTR_SKIP_CPU_SYNC);
 	else
-		*dma_handle = ops->map_page(dev, page, 0, size, dir,
+		*dma_handle = ops->map_phys(dev, phys, size, dir,
 					    DMA_ATTR_SKIP_CPU_SYNC);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		dma_free_contiguous(dev, page, size);
@@ -102,8 +99,5 @@ void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
 	else if (ops->unmap_phys)
 		ops->unmap_phys(dev, dma_handle, size, dir,
 				DMA_ATTR_SKIP_CPU_SYNC);
-	else if (ops->unmap_page)
-		ops->unmap_page(dev, dma_handle, size, dir,
-				DMA_ATTR_SKIP_CPU_SYNC);
 	dma_free_contiguous(dev, page, size);
 }

-- 
2.51.0


