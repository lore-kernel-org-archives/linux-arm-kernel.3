Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B87EFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mIvGxu5m9pMe0NnWhFeeUzdpahhLfbDW91P8rqtuJw=; b=Tb550qmRpiq/oK3qs0nJ5YIO6w
	2mYaCGvkJUPrOUlOpOhaICtoWtmLuEKxuVUV0X3G57DBrDHFuFnCrZh7wkGJCyouwlASEu+PwXWw4
	qTILJVs3vs9OaiBhmAqIXnSBZeKJSiN4PE/tUrfUtSmiGe/09UhnKuEYU2b6FHdV34tl8txlk+Qzc
	mUTOqZ/oVc5PgRcnlCuAb8Bdv0+WghWYPsZgNTcjZh/HXgUI9vH+GpDwYPbr4DP4dI9hipG4MyfUa
	54j5rl2b/1JSm2JPHz09RBKYJuM4fmA8eTx91dMSjfLwBEwKlguiDb5lVP6oqDMN88FiYNOD4oZAm
	dNn4UpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHL4-0000000GSmQ-0DWq;
	Mon, 27 Apr 2026 08:29:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHL1-0000000GSkH-1Pgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 010C243859;
	Mon, 27 Apr 2026 08:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37188C2BCB4;
	Mon, 27 Apr 2026 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777278546;
	bh=5SU9hiceDEieVMjK83mZntxO9wZ9JXg8R4Ezb9ZyoxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkSZ/ppesy61ker3Jkwkk5hTM+fFQXy4GJV7E2cfaeCXf21wVzfeHmS3kvwg/mxGM
	 FD+ER02Sl8HpdWe7jAD2H6ooHDXq9EfAX3wUp8ZbdnN4nYAPfeDaKbD1u13v1bRKfc
	 HRdDs7j5FB3er+3KMKTPrgXAZvoH9wZgi22oz/i4H+PBuWZmG1N38Pgnq8GGzXnWKE
	 dyQEqUSXoTTr3wdydX/C06qwbVKvvzhRg+wdstXy/FFLIcrV/Gq2v+4Ps6erU1bJr6
	 hjpywogzfZ2A0AyMbjFBXRw4QTD56jG0LoF0P9fwxEX6nMPPI45OFQxmlejN7xWBRe
	 9l0tjqhIKljCw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [RFC PATCH v4 10/11] coco: arm64: dma: Update force_dma_unencrypted for accepted devices
Date: Mon, 27 Apr 2026 13:58:04 +0530
Message-ID: <20260427082805.931832-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427082805.931832-1-aneesh.kumar@kernel.org>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_012907_412631_96DBC479 
X-CRM114-Status: GOOD (  17.85  )
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
index c94abc2dcae3..f0d4b9f799bf 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1651,6 +1651,9 @@ bool is_swiotlb_active(struct device *dev)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
+	if (device_cc_accepted(dev))
+		return false;
+
 	return mem && mem->nslabs;
 }
 
-- 
2.43.0


