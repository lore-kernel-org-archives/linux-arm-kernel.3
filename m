Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C83CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ydmoZMzugj7h4YD3/pIgewAgf7xI6DveijyUSQg1bH4=; b=PhcoQlO2k7fcNGa3+hH+gBvyeh
	O28wubJD4gNYieG8LEjImbm0NuCKji7/SKFwfErNZMLopHH5wR9I7gUjRR5JHPmdQLl5dw01YylFj
	yzL5fPuP/KDK0CPlRgJgMphfL5TmrPI/ek9uYuVfdAqmOBM+ct2ebx9ffHtu9gpQPRcz86ULSpHJN
	n7glvTlmuEYxL4QKd6sqpkXsFZ2+1PwSNP2Gu9jl6ti4yD7Ialzqsz+IaSRN2vYEFoRaQKoof090+
	nuwkME5d+FzTd9FuGwVpw6o5i9BFx5tPmw8IIEgrxIfKJ3csD4RmZ11VRLR9Vck6DIwBFSepVhUQt
	/Dvgn2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj2Z-0000000GBPk-3wmf;
	Tue, 12 May 2026 09:04:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj2X-0000000GBPA-0Kj9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259FC43D73;
	Tue, 12 May 2026 09:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5B7C2BCC7;
	Tue, 12 May 2026 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778576671;
	bh=61tXliQ/XBJoYkUBUBG8gxT+9Bu+8tJYiCkn9FV4ylo=;
	h=From:To:Cc:Subject:Date:From;
	b=oJTobraKOVigupVmeMOO2+Q1wWOaVGKhX/GzhO1CR+oMrH2HI51YYrr008C537v+G
	 UUVmRUhwCUoGaExJMCFAz+hSb3R4HWDxAxNODc6Y4bmdjdIXAVj78RFh9mwRcqVLgb
	 Fx8/aKJ77PvgASKN7hafTS/YFqKFOGxS5qXl95RkVPeuKoTEH3cP7zNJjuPaMUb+gZ
	 V0V/jF3o7H6NpExI8piAPfpZwpG6PjdGI1VEOZLtFahXamXt2PkTVP2U5Iv1vt/4b8
	 kqZmwZ86YGl97t8WiCSsqraIBEIvzUK06TVDfB50pvAxePXnFWAsKttcJ5wH4cvaYs
	 OSuujN6V1HRVQ==
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
Subject: [PATCH v4 00/13] dma-mapping: Use DMA_ATTR_CC_SHARED through direct, pool and swiotlb paths
Date: Tue, 12 May 2026 14:33:55 +0530
Message-ID: <20260512090408.794195-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_020433_155887_E1B7EB51 
X-CRM114-Status: GOOD (  11.25  )
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

This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
are handled consistently.

Today, the direct DMA path mostly relies on force_dma_unencrypted() for
shared/decrypted buffer handling. This series consolidates the
force_dma_unencrypted() checks in the top-level functions and ensures
that the remaining DMA interfaces use DMA attributes to make the correct
decisions.

The series:
- moves swiotlb-backed allocations out of __dma_direct_alloc_pages(),
- propagates DMA_ATTR_CC_SHARED through the dma-direct alloc/free
  paths
- teaches the atomic DMA pools to track encrypted versus decrypted
  state
- tracks swiotlb pool encryption state and enforces strict pool
  selection
- centralizes encrypted/decrypted pgprot handling in dma_pgprot() using
  DMA attributes
- passes DMA attributes down to dma_capable() so capability checks can
  validate whether the selected DMA address encoding matches
  DMA_ATTR_CC_SHARED
- makes dma_direct_map_phys() choose the DMA address encoding from
  DMA_ATTR_CC_SHARED and fall back to swiotlb when a shared DMA request
  cannot use the direct mapping, which lets arm64 and x86 CCA guests stop
  relying on SWIOTLB_FORCE for DMA mappings
- use the selected swiotlb pool state to derive the returned DMA
  address.

Changes from v3:
https://lore.kernel.org/all/20260427055509.898190-1-aneesh.kumar@kernel.org
* Handle DMA_ATTR_MMIO correctly in dma_direct_map_phys()
* Address most of sashiko review
* Rebase to latest kernel
* drop SWIOTLB_FORCE for s390 and powerpc secure guest.
 
Changes from v2:
https://lore.kernel.org/all/20260420061415.3650870-1-aneesh.kumar@kernel.org
* pass attrs to dma_capable() and update direct, swiotlb, Xen swiotlb, and
  x86 GART paths so the capability checks see the DMA address attr value
  DMA_ATTR_CC_SHARED.
* rework dma_direct_map_phys() so DMA_ATTR_CC_SHARED selects
  phys_to_dma_unencrypted() while the default path uses
  phys_to_dma_encrypted(), with swiotlb fallback when the requested
  shared/private state cannot be satisfied by a direct DMA address.
* stop relying on SWIOTLB_FORCE for arm64 and x86 CC guest DMA mappings;
  swiotlb is still enabled there, but shared mappings is now selected
  through the generic dma_direct_map_phys()/dma_capable() decision instead
  of a global force-bounce flag.

Changes from v1:
https://lore.kernel.org/all/20260417085900.3062416-1-aneesh.kumar@kernel.org
* rebased to latest kernel (change from DMA_ATTR_CC_DECRYPTED -> DMA_ATTR_CC_SHARED)
* update the alloc path so DMA_ATTR_CC_SHARED is not a caller-visible attribute.

Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>
Cc: Petr Tesarik <ptesarik@suse.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: x86@kernel.org 

Aneesh Kumar K.V (Arm) (13):
  dma-direct: swiotlb: handle swiotlb alloc/free outside
    __dma_direct_alloc_pages
  dma-direct: use DMA_ATTR_CC_SHARED in alloc/free paths
  dma-pool: track decrypted atomic pools and select them via attrs
  dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED
  dma-mapping: make dma_pgprot() honor DMA_ATTR_CC_SHARED
  dma-direct: pass attrs to dma_capable() for DMA_ATTR_CC_SHARED checks
  dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED
  dma-direct: set decrypted flag for remapped DMA allocations
  dma-direct: select DMA address encoding from DMA_ATTR_CC_SHARED
  dma-pool: fix page leak in atomic_pool_expand() cleanup
  dma-direct: rename ret to cpu_addr in alloc helpers
  dma-direct: return struct page from dma_direct_alloc_from_pool()
  x86/amd-gart: preserve the direct DMA address until GART mapping
    succeeds

 arch/arm64/mm/init.c                 |   4 +-
 arch/powerpc/platforms/pseries/svm.c |   2 +-
 arch/s390/mm/init.c                  |   2 +-
 arch/x86/kernel/amd_gart_64.c        |  36 ++--
 arch/x86/kernel/pci-dma.c            |   4 +-
 drivers/iommu/dma-iommu.c            |   2 +-
 drivers/xen/swiotlb-xen.c            |  10 +-
 include/linux/dma-direct.h           |  19 ++-
 include/linux/dma-map-ops.h          |   2 +-
 include/linux/swiotlb.h              |   8 +-
 kernel/dma/direct.c                  | 243 ++++++++++++++++++++-------
 kernel/dma/direct.h                  |  40 ++---
 kernel/dma/mapping.c                 |  16 +-
 kernel/dma/pool.c                    | 165 +++++++++++-------
 kernel/dma/swiotlb.c                 | 109 +++++++++---
 15 files changed, 459 insertions(+), 203 deletions(-)


base-commit: 50897c955902c93ae71c38698abb910525ebdc89
-- 
2.43.0


