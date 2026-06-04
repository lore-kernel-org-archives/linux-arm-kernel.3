Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9ABCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ74WE3NPJcGhukL6BHrevm7m6Mzo9c9NrhYN47Aay0=; b=zpugj8gv+WDlx8zyZi6/Aipnyw
	yhRtrrCHB+qfGurQoTrD7BvA2YoY5GUbB01PUexy1NNdCfxZHHQDotKd/01CbQnd2v551+aakhnKN
	lZC47jenabh7/J/hjYJUltOIcLTcL7DIwT1UxCWNO1EwL6P9sNIc/Or4DuhhFaKVliqa0jMh0NzEa
	NOOG8SzopKsgFgn8T4wGgZbb6S5yN3LXytzpyDhhvIm6khTeGUN1r3AgyGkmZ/jYNUbmZE1k6OEHR
	yrSi8mLQxmiblPNQ5IOvOBARaUjU5/+GUuxd7UQqLaT9CLNdoCQo+JMXggDb1tw3KhiWFhS7F7QiW
	/uV2jI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3eZ-0000000GP2Z-2mpA;
	Thu, 04 Jun 2026 08:42:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3eY-0000000GP1v-18Fc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0F606014B;
	Thu,  4 Jun 2026 08:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50521F00898;
	Thu,  4 Jun 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562533;
	bh=zZ74WE3NPJcGhukL6BHrevm7m6Mzo9c9NrhYN47Aay0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JMg19boI0cLz/7ejQT9QzBE9Im2xv53R2G16c5U/p5BuEcJSqYgf0U1zEliZFa6+C
	 eNRR0hp91nfODNozHPMR4LbGZeSLnEpft46UimZUCkmRL8+9aD/b9Rp86uXEYDzPyD
	 re+5opN/jBK5GhvJF4YckHXOJaU6pof4ksDfUDeLQTpyPbWxgnqEpYAI/aJiiEbFCI
	 p+KC+RS+ukCf2WuHbJ5mw/tI0sFilqtSgqP9f2GMe80M2kjNQ7uYXY+ko8szGo/nJB
	 PZThVarr8r6zhCgVXB0ZRCgiJyR0HJquVz/o66+yDuenfY9z7ekPE1wHRZ5TesHSwm
	 NVWsugctx9cfA==
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
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v6 13/20] dma-direct: rename ret to cpu_addr in alloc helpers
Date: Thu,  4 Jun 2026 14:09:52 +0530
Message-ID: <20260604083959.1265923-14-aneesh.kumar@kernel.org>
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

ret in dma_direct_alloc() and dma_direct_alloc_pages() holds the returned
CPU mapping, not a generic return value. Rename it to cpu_addr and update
the remaining uses to match.

This makes the allocation paths easier to follow and keeps the local naming
consistent with what the variable actually represents.

Tested-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/direct.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index aa3489aa10a0..4e446aa4130e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -204,7 +204,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	bool mark_mem_decrypt = false;
 	bool allow_highmem = true;
 	struct page *page;
-	void *ret;
+	void *cpu_addr;
 
 	/*
 	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
@@ -318,34 +318,33 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		arch_dma_prep_coherent(page, size);
 
 		/* create a coherent mapping */
-		ret = dma_common_contiguous_remap(page, size, prot,
-				__builtin_return_address(0));
-		if (!ret)
+		cpu_addr = dma_common_contiguous_remap(page, size, prot,
+					__builtin_return_address(0));
+		if (!cpu_addr)
 			goto out_encrypt_pages;
 	} else {
-		ret = page_address(page);
+		cpu_addr = page_address(page);
 	}
 
-	memset(ret, 0, size);
+	memset(cpu_addr, 0, size);
 
 	if (set_uncached) {
 		void *uncached_cpu_addr;
 
 		arch_dma_prep_coherent(page, size);
-		uncached_cpu_addr = arch_dma_set_uncached(ret, size);
+		uncached_cpu_addr = arch_dma_set_uncached(cpu_addr, size);
 		if (IS_ERR(uncached_cpu_addr))
 			goto out_free_remap_pages;
-		ret = uncached_cpu_addr;
+		cpu_addr = uncached_cpu_addr;
 	}
 
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
 					 !!(attrs & DMA_ATTR_CC_SHARED));
-	return ret;
-
+	return cpu_addr;
 
 out_free_remap_pages:
 	if (remap)
-		dma_common_free_remap(ret, size);
+		dma_common_free_remap(cpu_addr, size);
 
 out_encrypt_pages:
 	if (mark_mem_decrypt &&
@@ -439,7 +438,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 {
 	unsigned long attrs = 0;
 	struct page *page;
-	void *ret;
+	void *cpu_addr;
 
 	if (force_dma_unencrypted(dev))
 		attrs |= DMA_ATTR_CC_SHARED;
@@ -453,7 +452,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 		if (!page)
 			return NULL;
 
-		ret = page_address(page);
+		cpu_addr = page_address(page);
 		goto setup_page;
 	}
 
@@ -461,11 +460,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	if (!page)
 		return NULL;
 
-	ret = page_address(page);
-	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, ret, size))
+	cpu_addr = page_address(page);
+	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, cpu_addr, size))
 		goto out_leak_pages;
 setup_page:
-	memset(ret, 0, size);
+	memset(cpu_addr, 0, size);
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
 					 !!(attrs & DMA_ATTR_CC_SHARED));
 	return page;
-- 
2.43.0


