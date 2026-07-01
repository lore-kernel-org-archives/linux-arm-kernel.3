Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723AEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/Bk6tzCc0Ng60ebNXKHAwFhGzmK1E5JjUoQiZztakc=; b=qvSuo/sPol8pS/7s2cPJP+/awI
	O2IOqTzrnPkQxd5uXzy7Kz/vR1q20M+xAjzcTUMJV/vcA+HgJVkZVpU+N19Qr9cx+MWLqmBSAv01A
	X//ToyR+GQUX9J1fjTTKedS72rfM+H+ElZGdaVve985XooyXLrjigtlQaG4NzjWpzewZmDT36XhgW
	H+z2YFhKEVKAUmNiEyb11vMiMWpS6NtSmvTeIBAfXI0kMIbKZMFgX5j4FCXDe72PUbyXX3CQBddcZ
	VX6BKu0pN+oD27KTac5O0HjzzYvZuMbYNWNfWnfdAXdddvDxI1rUwxHd2vxDden7LVcwcIrb3zelS
	sIM1IhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenr2-00000000iaZ-0GNe;
	Wed, 01 Jul 2026 05:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenr1-00000000iZU-0RpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD9964011E;
	Wed,  1 Jul 2026 05:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D91F000E9;
	Wed,  1 Jul 2026 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782885082;
	bh=Z/Bk6tzCc0Ng60ebNXKHAwFhGzmK1E5JjUoQiZztakc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BFbJEcer+pvCfD4YUpM6qeq3850G1Mf8qSExScerA+W0eWoi6XkmzRrs1MKSikMPN
	 HQ2Vgf9e9NSsfd0JZNbKIGNd1wnyyP/Ms2Y1tLNUCFysjaIWLP+rQt4vtypalBqYYM
	 I0e/MDGxfVD3X+0UOxTf7PJ6hwtX4DSZiiuYzr4G9pZ0DkFmH+21HSoXAqVhgIhr2y
	 zo8uXi2DVCyxNogKLik9E5TcSNrEPJmKHIIo4WpHBUiPmAKszp78s/FAvPQlqjG9BF
	 FKlCxXd9QiM4LWVLynylWeb94+bHhfXl/HMqFn/DV38j2ejGShzAvogtCgSIoHwVZW
	 eATAbo7Q3VnpQ==
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
Subject: [PATCH v7 09/22] dma-mapping: Add internal shared allocation attribute
Date: Wed,  1 Jul 2026 11:19:13 +0530
Message-ID: <20260701054926.825925-10-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701054926.825925-1-aneesh.kumar@kernel.org>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
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

DMA_ATTR_CC_SHARED describes an existing DMA mapping whose backing memory
is already shared, or decrypted, for confidential computing. It is a
mapping attribute: callers use it to request a shared DMA address encoding
for memory that has already been prepared for shared DMA.

Allocation paths need a related but different state. Once the DMA core
decides that an allocation must use shared backing pages, the lower-level
allocation helpers need to select shared pools, decrypt newly allocated
pages, derive the DMA address with the shared-memory translation and
restore encryption on free. That state is internal to the DMA-mapping
implementation and should not be passed by drivers to dma_alloc_attrs().

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 Documentation/core-api/dma-attributes.rst | 29 +++++++++++++++++++++++
 include/linux/dma-mapping.h               |  8 +++++++
 include/trace/events/dma.h                |  3 ++-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 123c8468d58f..eee743184acd 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -179,3 +179,32 @@ interface when building their uAPIs, when possible.
 
 It must never be used in an in-kernel driver that only works with
 kernel memory.
+
+DMA_ATTR_CC_SHARED
+------------------
+
+This attribute indicates that a DMA mapping is shared, or decrypted, for
+confidential computing guests. For normal system memory, the caller must
+already have marked the memory decrypted with set_memory_decrypted(). CPU
+PTEs for the mapping must use pgprot_decrypted(), and the same shared
+semantic may be passed to a vIOMMU when it sets up the IOPTE.
+
+This attribute describes an existing mapping. It does not allocate shared
+backing pages and must not be passed to dma_alloc_attrs(). For MMIO, use
+this together with DMA_ATTR_MMIO to indicate shared MMIO. Unless
+DMA_ATTR_MMIO is provided, the mapping requires a struct page.
+
+__DMA_ATTR_ALLOC_CC_SHARED
+--------------------------
+
+This is an internal DMA-mapping attribute for confidential computing guests.
+It is used by allocation paths after the DMA core has determined that the
+backing pages must be shared, or decrypted. For example, the direct DMA and
+SWIOTLB allocation paths use it to select shared DMA pools, decrypt newly
+allocated pages, derive DMA addresses using the shared-memory translation, and
+restore encryption on free.
+
+__DMA_ATTR_ALLOC_CC_SHARED differs from DMA_ATTR_CC_SHARED in that it is not
+a caller-visible DMA API attribute. DMA_ATTR_CC_SHARED describes an
+already-shared mapping and requires the caller to have prepared normal
+system memory before mapping it.
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index cc0823a99cfd..a3e880649fa4 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -103,6 +103,14 @@
  */
 #define DMA_ATTR_CC_SHARED	(1UL << 13)
 
+/*
+ * __DMA_ATTR_ALLOC_CC_SHARED: Internal DMA-mapping attribute used by
+ * allocation paths that create shared (decrypted) backing pages for
+ * confidential computing guests. Drivers must not pass this attribute to
+ * dma_alloc_attrs().
+ */
+#define __DMA_ATTR_ALLOC_CC_SHARED	(1UL << 14)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index 31c9ddf72c9d..9df02c1511de 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -35,7 +35,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_MMIO, "MMIO" }, \
 		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
 		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
-		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
+		{ DMA_ATTR_CC_SHARED, "CC_SHARED" }, \
+		{ __DMA_ATTR_ALLOC_CC_SHARED, "ALLOC_CC_SHARED" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
-- 
2.43.0


