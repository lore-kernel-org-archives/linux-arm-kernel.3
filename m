Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2DBFED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zULIrIcNoLtRjsdTYSgSbcWZ1g8+zI94IHaUaZ8NeCs=; b=djqf3ZPn85wyCGM37YgkIcNEDd
	R5c3fG/hzrCQYCXEofggi7AbB3TeoGuNl+y8w/6gMt22GdWovBek9i5eJxT4/ME5tk16oVEwp/ZVW
	owgszqrDj8Zs+QiieFyThvMLoqPUvu5DjrB6GnJFdlfzxwLBSJ0sNjih0Z04G44uvojPb7Te8DRZg
	vrvmORoiJH9Keey9xwO7UfLz580T3qk+Y9bM79CMBtBUMUYla91SvSmX3lwPHlpJSEtxowwlPUs0w
	YfYBSS9ftVLOJclWMpaVyqe9E688RVoXH+M9BcrCerr9aSag12KjRFYcu3vB8g5Tuv3JpWs4ceoXr
	inxBEkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b3N-0000000Dakx-2ZBp;
	Thu, 12 Mar 2026 08:05:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b3K-0000000Dai7-3tVO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F9F60142;
	Thu, 12 Mar 2026 08:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AA6C116C6;
	Thu, 12 Mar 2026 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302753;
	bh=0csSeUlZauiC2yr1plM5karIEhjfC8fi+r1dZY3rwSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JqlfWZu6rAXAO6dOU+A7Udf1owiqizRBdGd5Fxek3Tg01XikVLdTgHoaqxvctiRhw
	 1UHWSTIz7/tPg+ALJjvzgN7v3hRQX++h4R6CW6ZHnyH5UQ0l36AOhghni3/EOQde4+
	 dQoqDARtwAZBcPBn4jG2Thfq+m/FnJH7Xh6gAXlMHeSXo4DMR1Gki/oWw8uW+VNqcm
	 nEOyKZybp+2hmv2MBHymY9aRpDn19IJTft1b6fNR1l37IyFMfJfDi17FL9dqw2hGdq
	 zymbPb8uYf+MW1qrYU3Xyfs2xrtbns5mLGRCW8ajZAPFZ6cdRXiJ9J7pV5EZcRAgNi
	 9eGoXOQbyyGOQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Dan Williams <dan.j.williams@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [RFC PATCH v3 10/11] coco: arm64: dma: Update force_dma_unencrypted for accepted devices
Date: Thu, 12 Mar 2026 13:34:41 +0530
Message-ID: <20260312080442.3485633-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
References: <20260312080442.3485633-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This change updates the DMA behavior for accepted devices by assuming
they access only private memory. Currently, the DMA API does not provide
a mechanism for allocating shared memory that can be accessed by both
the secure realm and the non-secure host. Accepted devices are therefore
expected to operate entirely within the private memory space.

If future use cases require accepted devices to interact with shared
memory— for example, for host-device communication, we will need to
extend the DMA interface to support such allocation semantics. This
commit lays the groundwork for that by clearly defining the current
assumption and isolating the enforcement to force_dma_unencrypted.

Treat swiotlb and decrypted DMA pools as shared-memory paths and avoid them
for accepted devices by:
- returning false from is_swiotlb_for_alloc() for accepted devices
- returning false from is_swiotlb_active() for accepted devices
- bypassing dma-direct atomic pool usage for accepted devices

This is based on the current assumption that accepted devices operate on private
Realm memory only, and prevents accidental fallback to shared/decrypted DMA
backends.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/include/asm/mem_encrypt.h |  6 +-----
 arch/arm64/mm/mem_encrypt.c          | 10 ++++++++++
 include/linux/swiotlb.h              |  3 +++
 kernel/dma/direct.c                  |  8 ++++++++
 kernel/dma/swiotlb.c                 |  3 +++
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index 5541911eb028..ae0b0cac0900 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -15,17 +15,13 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
+bool force_dma_unencrypted(struct device *dev);
 
 #define mem_decrypt_granule_size mem_decrypt_granule_size
 size_t mem_decrypt_granule_size(void);
 
 int realm_register_memory_enc_ops(void);
 
-static inline bool force_dma_unencrypted(struct device *dev)
-{
-	return is_realm_world();
-}
-
 /*
  * For Arm CCA guests, canonical addresses are "encrypted", so no changes
  * required for dma_addr_encrypted().
diff --git a/arch/arm64/mm/mem_encrypt.c b/arch/arm64/mm/mem_encrypt.c
index f5d64bc29c20..18dea5d879b8 100644
--- a/arch/arm64/mm/mem_encrypt.c
+++ b/arch/arm64/mm/mem_encrypt.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/mm.h>
 #include <linux/mem_encrypt.h>
+#include <linux/device.h>
 
 static const struct arm64_mem_crypt_ops *crypt_ops;
 
@@ -67,3 +68,12 @@ size_t mem_decrypt_granule_size(void)
 	return PAGE_SIZE;
 }
 EXPORT_SYMBOL_GPL(mem_decrypt_granule_size);
+
+bool force_dma_unencrypted(struct device *dev)
+{
+	if (device_cc_accepted(dev))
+		return false;
+
+	return is_realm_world();
+}
+EXPORT_SYMBOL_GPL(force_dma_unencrypted);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0efb9b8e5dd0..224dcec6a58f 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -296,6 +296,9 @@ bool swiotlb_free(struct device *dev, struct page *page, size_t size);
 
 static inline bool is_swiotlb_for_alloc(struct device *dev)
 {
+	if (device_cc_accepted(dev))
+		return false;
+
 	return dev->dma_io_tlb_mem->for_alloc;
 }
 #else
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 34eccd047e9b..a7a9984db342 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -158,6 +158,14 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
  */
 static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
 {
+	/*
+	 * Atomic pools are marked decrypted and are used if we require
+	 * updation of pfn mem encryption attributes or for DMA non-coherent
+	 * device allocation. Both is not true for trusted device.
+	 */
+	if (device_cc_accepted(dev))
+		return false;
+
 	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
 }
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 309a8b398a7d..339147d1d42f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1634,6 +1634,9 @@ bool is_swiotlb_active(struct device *dev)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
+	if (device_cc_accepted(dev))
+		return false;
+
 	return mem && mem->nslabs;
 }
 
-- 
2.43.0


