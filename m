Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DBAC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=QPHti+tYcSVpO4hQcMTqKaG0wIX1o/VSV/ogYvDJO0k=; b=UOVvLKuPoJtL5TsheVbpTqQ0Kh
	CDgOLQ+sVaZ3/lOuYgaUr0DF92UY0NIV1mI43JXdStN26bH+alKRm0xOcgORJMrbx+eODem8k5qUQ
	sBPFkMr9DwqGXX2TUIoBinWftKPiFnBeLuDO/XD1y3/zIBOKuEFeA/qTPSVb8dCvo8V4DHrxKb2RX
	3SrzEt4WBHJ+vs8GGKk5sSugy+8H7mgSTL29SDjLdbMrt2wREWuVUuwHgCIBAbfrN23fHePRDG/j9
	FpfjOt/HWQxtV8QMAD7DJJta9mI55StpBkLElBQ3k5wK+AvUzvhPLbSoQzOc7SF20x5TpPiOYADma
	JwIJfbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW3E-0000000Gpzv-1kqa;
	Mon, 24 Aug 2026 14:53:28 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW2r-0000000Gprj-0zZB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:53:07 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260824145300euoutp02ad02e386ae74022edef8c000ccdc9245~OxW5_Q4gN2070920709euoutp02x
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:53:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260824145300euoutp02ad02e386ae74022edef8c000ccdc9245~OxW5_Q4gN2070920709euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787583180;
	bh=QPHti+tYcSVpO4hQcMTqKaG0wIX1o/VSV/ogYvDJO0k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HDQgsBxxkb/myGYnYy+EIEuoNngRN1mPdX+/5mhxzgDWBUAZDFxY/VyCUyUI4kh3J
	 +l6k0NkL/rEbDqDhw3cF3ycdGjNe8esOBxgKzD2bw8F9lLR/DYi/4dOA5HlaIQBHt9
	 SQwrR9mrkK0L9t8OyrEDnJKhGUtZyZV+9q3Y8X5k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38~OxW5s8MtT1924719247eucas1p1n;
	Mon, 24 Aug 2026 14:53:00 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260824145259eusmtip168e7593857659e7d1f65375fe2466874~OxW5SX3OE0313203132eusmtip1g;
	Mon, 24 Aug 2026 14:52:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Aneesh
 Kumar K . V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] second dma-mapping update for Linux 7.3
Date: Mon, 24 Aug 2026 16:52:51 +0200
Message-ID: <20260824145253.1740671-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38
X-EPHeader: CA
X-CMS-RootMailID: 20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38
References: <CGME20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_075305_878749_97DF1786 
X-CRM114-Status: GOOD (  12.13  )
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

The following changes since commit 221049874b6a78c7d87bc826581b0695cd338e2b:

  arm64: RSI: fix field-spanning write warning in attestation token init (2026-07-26 14:22:46 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.3-2026-08-24-2

for you to fetch changes up to 04a19b35dc05354445f0096befad63af885bb77e:

  swiotlb: remove unused SWIOTLB_FORCE flag (2026-07-31 08:44:52 +0200)

----------------------------------------------------------------
second dma-mapping update for Linux 7.3:

- important dma-mapping update for confidential-computing, which adds
proper tracking of the shared DMA state through direct, pool and swiotlb
paths (Aneesh Kumar K.V)

----------------------------------------------------------------
This pull-request is based on the already merged stable branch from
arm64 tree. The conflic in arch/s390/mm/init.c should be resolved to:

swiotlb_init(true, SWIOTLB_VERBOSE | SWIOTLB_ANY);

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (23):
      dma-direct: return struct page from dma_direct_alloc_from_pool()
      dma-pool: fix page leak in atomic_pool_expand() cleanup
      iommu/dma: Check atomic pool allocation result directly
      dma: free atomic pool pages by physical address
      swiotlb: Preserve allocation virtual address for dynamic pools
      s390: Expose protected virtualization through cc_platform_has()
      dma-direct: swiotlb: handle swiotlb alloc/free outside __dma_direct_alloc_pages
      coco: arm64: s390: powerpc: Mark secure guests with CC_ATTR_GUEST_MEM_ENCRYPT
      dma-mapping: Add internal shared allocation attribute
      dma-direct: use __DMA_ATTR_ALLOC_CC_SHARED in alloc/free paths
      dma-pool: track decrypted atomic pools and select them via attrs
      dma: swiotlb: pass mapping attributes by reference
      dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED
      dma-mapping: make dma_pgprot() honor __DMA_ATTR_ALLOC_CC_SHARED
      dma-direct: pass attrs to dma_capable() for DMA_ATTR_CC_SHARED checks
      dma-direct: Move dma_direct_map_phys() to dma/direct.c
      dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED
      dma-direct: set decrypted flag for remapped DMA allocations
      dma-direct: select DMA address encoding from __DMA_ATTR_ALLOC_CC_SHARED
      dma-direct: rename ret to cpu_addr in alloc helpers
      dma: swiotlb: free dynamic pools from process context
      dma: swiotlb: handle set_memory_decrypted() failures
      swiotlb: remove unused SWIOTLB_FORCE flag

 Documentation/core-api/dma-attributes.rst    |  29 +++
 arch/arm64/mm/init.c                         |   5 +-
 arch/powerpc/platforms/pseries/cc_platform.c |   1 +
 arch/powerpc/platforms/pseries/svm.c         |   2 +-
 arch/s390/Kconfig                            |   1 +
 arch/s390/mm/init.c                          |  17 +-
 arch/x86/kernel/amd_gart_64.c                |  30 +--
 arch/x86/kernel/pci-dma.c                    |   4 +-
 drivers/iommu/dma-iommu.c                    |  20 +-
 drivers/xen/swiotlb-xen.c                    |   8 +-
 include/linux/dma-direct.h                   |  20 +-
 include/linux/dma-map-ops.h                  |   3 +-
 include/linux/dma-mapping.h                  |   8 +
 include/linux/swiotlb.h                      |  25 +-
 include/trace/events/dma.h                   |   3 +-
 kernel/dma/direct.c                          | 326 ++++++++++++++++++++-------
 kernel/dma/direct.h                          |  56 +----
 kernel/dma/mapping.c                         |  25 +-
 kernel/dma/pool.c                            | 237 ++++++++++++++-----
 kernel/dma/swiotlb.c                         | 292 ++++++++++++++++++------
 20 files changed, 810 insertions(+), 302 deletions(-)

----------------------------------------------------------------

Thanks!

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


