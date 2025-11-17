Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F318CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa06yX889DYuT+oZK4r6IpdtcQ56yZdpVOQD3ivoTx4=; b=O5zeI460rAawwmQmxw9/IP6zFJ
	24ZZtAQ8x6nd743gH63TTuZhsMZA5Kg/EE4BwevhHXwipOSXUU+YVSD/KOCiU45MYJUuLYCRMJ6RC
	x9leN53q/mu8nHf8f/UPGcxXfyZlsXwI2oLgSM0KuQYqwEqNGPK1ozuH7QAd0OXFraBPHsKEIDf2i
	SCQ2qUf43rhCH9vUK64kCdJapZ+qXxLE3G0fngPOu8PLKj4BgLBwJgFMd1uSRgJf7b/rF8kcMEDNp
	rWZKL5OV2aTVzZjJHnnGB10uGh8A0tNkv4aj//eq+cxTdtz2qavoOc0lbX5cIg13VbZWE4fBVytNO
	z7TlVSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HG-0000000GdT4-0MFy;
	Mon, 17 Nov 2025 18:48:38 +0000
Received: from mail-wr1-f73.google.com ([209.85.221.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HA-0000000GdPY-3npF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:34 +0000
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b30184be7so214240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405310; x=1764010110; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pa06yX889DYuT+oZK4r6IpdtcQ56yZdpVOQD3ivoTx4=;
        b=RiCm8Zdh/wOc4X4taKLGUbYQizT/Yjm5Gxph7SI4FI3sI9tOLRzu+AJFza3CYxGxYx
         tyPXTQfPn4QDFjUAjzfba5z92WSMz4jG07w9/f1YYe+UcRJTjXZ+JdlagvQeLrWigZ9a
         mkaPePorO3QrZlTV+gNislXZT5p30UBvPsdHGAqHoHZZadms/PRppPIGPekc8loR6Jom
         fVC6p8PLBBFP7y0PqmaPIDi5Igb+tmtSzRyO/RQRoHetINnKJvzvzQRorfTU5RH9459P
         myYTKZJo5T6v0fUtPvTucJvSDvcVhtF9h+vmBapCU7DnRxQTzWPh5YqOxdTjRUX0HSDs
         NzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405310; x=1764010110;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pa06yX889DYuT+oZK4r6IpdtcQ56yZdpVOQD3ivoTx4=;
        b=WU6ZBopvKR3UW5SaWaKtMZghSw8Gf6am2yfwqqNeTJ6K6iwic0Hj4t/MjXfcGdZ33B
         Jh8GE37Pc2NgQno6/uPI9E/hdb9gvSubMJm1cC6gBBtYb/BBjxpNeJHn817ElP+WexpX
         HisOpN++phYdxFpbU2Bg+Ow2FYhFvq1PmCtdl8KLTUdRzVegdDkbwNmZQ5vwqcLpM0u3
         Mv4i/MAfPSTUNPDu3Xc8mcz5Czwq/WO5bSFR23rex3pSwYZKsTGssxhafacsNtzsVRKY
         72HY9qsyXZAec3goo5eBVerp9fFRxWQCbzjEQOQptgeGb/6rarJ4ZGV4tnOutJ5gWGUJ
         OMjg==
X-Gm-Message-State: AOJu0Yz2GQrj1umLuQhpflaba1CEiKiUXb0q7Lf9WdxWjcFNIs40iKiO
	5QHv+dV14XvcbwjXa3bGkJ6ev9ffGYlqQm/TQUqsy79sfp+4fTAjspBmMLpkPMM0ADqP5QPIDT5
	ETjKrOo7vAQsajvl2WiYtdM6xEe/85UCcnWteQVM7zyg3TVE7SIFN8/3WMN13AASP6Y8B/UMvrG
	IEA7YhT3X2asMo9ThIS3l2guf193KjmJjjHt0Xh+DMahtXIy/NrNBRG9UgkokS8ZcHQA==
X-Google-Smtp-Source: AGHT+IEpCDIon+7uG37hSzh8xEnVSPrSqapIC6AAiKmu0f1Bo4efhhsle4hTqBMXTR+Cl+gfspw5gNrrIxHwpg==
X-Received: from wrao26.prod.google.com ([2002:adf:8b9a:0:b0:42b:4c63:868a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3108:b0:42b:30d4:e3f0 with SMTP id ffacd0b85a97d-42b5933b5c7mr14452962f8f.22.1763405309761;
 Mon, 17 Nov 2025 10:48:29 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:51 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-5-smostafa@google.com>
Subject: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific code out
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104832_994197_7FF2BC99 
X-CRM114-Status: GOOD (  27.19  )
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

Some of the used APIs are only part of the kernel and are not
available in the hypervisor, factor those out:
- alloc/free memory
- CMOs
- virt/phys conversions

Which are implemented by the kernel in io-pgtable-arm-kernel.c and
similarly for the hypervisor later in this series.

va/pa conversion kept as macros.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Makefile                |   2 +-
 drivers/iommu/io-pgtable-arm-kernel.c | 103 ++++++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c        | 101 +++----------------------
 drivers/iommu/io-pgtable-arm.h        |  19 +++++
 4 files changed, 133 insertions(+), 92 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-kernel.c

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 8e8843316c4b..439431fd4bc5 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_IOMMU_DEBUGFS) += iommu-debugfs.o
 obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
-obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
+obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o io-pgtable-arm-kernel.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST) += io-pgtable-arm-selftests.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
diff --git a/drivers/iommu/io-pgtable-arm-kernel.c b/drivers/iommu/io-pgtable-arm-kernel.c
new file mode 100644
index 000000000000..d025f7c180f9
--- /dev/null
+++ b/drivers/iommu/io-pgtable-arm-kernel.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CPU-agnostic ARM page table allocator.
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+#include <linux/dma-mapping.h>
+
+#include <linux/io-pgtable.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include "io-pgtable-arm.h"
+#include "iommu-pages.h"
+
+static dma_addr_t __arm_lpae_dma_addr(void *pages)
+{
+	return (dma_addr_t)virt_to_phys(pages);
+}
+
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg,
+			     void *cookie)
+{
+	struct device *dev = cfg->iommu_dev;
+	size_t alloc_size;
+	dma_addr_t dma;
+	void *pages;
+
+	/*
+	 * For very small starting-level translation tables the HW requires a
+	 * minimum alignment of at least 64 to cover all cases.
+	 */
+	alloc_size = max(size, 64);
+	if (cfg->alloc)
+		pages = cfg->alloc(cookie, alloc_size, gfp);
+	else
+		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
+						  alloc_size);
+
+	if (!pages)
+		return NULL;
+
+	if (!cfg->coherent_walk) {
+		dma = dma_map_single(dev, pages, size, DMA_TO_DEVICE);
+		if (dma_mapping_error(dev, dma))
+			goto out_free;
+		/*
+		 * We depend on the IOMMU being able to work with any physical
+		 * address directly, so if the DMA layer suggests otherwise by
+		 * translating or truncating them, that bodes very badly...
+		 */
+		if (dma != virt_to_phys(pages))
+			goto out_unmap;
+	}
+
+	return pages;
+
+out_unmap:
+	dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
+	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
+
+out_free:
+	if (cfg->free)
+		cfg->free(cookie, pages, size);
+	else
+		iommu_free_pages(pages);
+
+	return NULL;
+}
+
+void __arm_lpae_free_pages(void *pages, size_t size,
+			   struct io_pgtable_cfg *cfg,
+			   void *cookie)
+{
+	if (!cfg->coherent_walk)
+		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
+				 size, DMA_TO_DEVICE);
+
+	if (cfg->free)
+		cfg->free(cookie, pages, size);
+	else
+		iommu_free_pages(pages);
+}
+
+void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
+			 struct io_pgtable_cfg *cfg)
+{
+	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
+				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
+}
+
+void *__arm_lpae_alloc_data(size_t size, gfp_t gfp)
+{
+	return kmalloc(size, gfp);
+}
+
+void __arm_lpae_free_data(void *p)
+{
+	return kfree(p);
+}
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e6626004b323..377c15bc8350 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -15,12 +15,10 @@
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/dma-mapping.h>
 
 #include <asm/barrier.h>
 
 #include "io-pgtable-arm.h"
-#include "iommu-pages.h"
 
 #define ARM_LPAE_MAX_ADDR_BITS		52
 #define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
@@ -143,7 +141,7 @@
 #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
 
 /* IOPTE accessors */
-#define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
+#define iopte_deref(pte,d) __arm_lpae_phys_to_virt(iopte_to_paddr(pte, d))
 
 #define iopte_type(pte)					\
 	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)
@@ -164,8 +162,6 @@ struct arm_lpae_io_pgtable {
 	void			*pgd;
 };
 
-typedef u64 arm_lpae_iopte;
-
 static inline bool iopte_leaf(arm_lpae_iopte pte, int lvl,
 			      enum io_pgtable_fmt fmt)
 {
@@ -243,83 +239,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
 	       (data->start_level == 1) && (oas == 40);
 }
 
-static dma_addr_t __arm_lpae_dma_addr(void *pages)
-{
-	return (dma_addr_t)virt_to_phys(pages);
-}
-
-static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
-				    struct io_pgtable_cfg *cfg,
-				    void *cookie)
-{
-	struct device *dev = cfg->iommu_dev;
-	size_t alloc_size;
-	dma_addr_t dma;
-	void *pages;
-
-	/*
-	 * For very small starting-level translation tables the HW requires a
-	 * minimum alignment of at least 64 to cover all cases.
-	 */
-	alloc_size = max(size, 64);
-	if (cfg->alloc)
-		pages = cfg->alloc(cookie, alloc_size, gfp);
-	else
-		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
-						  alloc_size);
-
-	if (!pages)
-		return NULL;
-
-	if (!cfg->coherent_walk) {
-		dma = dma_map_single(dev, pages, size, DMA_TO_DEVICE);
-		if (dma_mapping_error(dev, dma))
-			goto out_free;
-		/*
-		 * We depend on the IOMMU being able to work with any physical
-		 * address directly, so if the DMA layer suggests otherwise by
-		 * translating or truncating them, that bodes very badly...
-		 */
-		if (dma != virt_to_phys(pages))
-			goto out_unmap;
-	}
-
-	return pages;
-
-out_unmap:
-	dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
-	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
-
-out_free:
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
-	else
-		iommu_free_pages(pages);
-
-	return NULL;
-}
-
-static void __arm_lpae_free_pages(void *pages, size_t size,
-				  struct io_pgtable_cfg *cfg,
-				  void *cookie)
-{
-	if (!cfg->coherent_walk)
-		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
-				 size, DMA_TO_DEVICE);
-
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
-	else
-		iommu_free_pages(pages);
-}
-
-static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
-				struct io_pgtable_cfg *cfg)
-{
-	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
-				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
-}
-
 static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)
 {
 	for (int i = 0; i < num_entries; i++)
@@ -395,7 +314,7 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 	arm_lpae_iopte old, new;
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 
-	new = paddr_to_iopte(__pa(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
+	new = paddr_to_iopte(__arm_lpae_virt_to_phys(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
 		new |= ARM_LPAE_PTE_NSTABLE;
 
@@ -616,7 +535,7 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
 	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
-	kfree(data);
+	__arm_lpae_free_data(data);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -930,7 +849,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = __arm_lpae_alloc_data(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return NULL;
 
@@ -1053,11 +972,11 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	wmb();
 
 	/* TTBR */
-	cfg->arm_lpae_s1_cfg.ttbr = virt_to_phys(data->pgd);
+	cfg->arm_lpae_s1_cfg.ttbr = __arm_lpae_virt_to_phys(data->pgd);
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	__arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1149,11 +1068,11 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	wmb();
 
 	/* VTTBR */
-	cfg->arm_lpae_s2_cfg.vttbr = virt_to_phys(data->pgd);
+	cfg->arm_lpae_s2_cfg.vttbr = __arm_lpae_virt_to_phys(data->pgd);
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	__arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1223,7 +1142,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	/* Ensure the empty pgd is visible before TRANSTAB can be written */
 	wmb();
 
-	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
+	cfg->arm_mali_lpae_cfg.transtab = __arm_lpae_virt_to_phys(data->pgd) |
 					  ARM_MALI_LPAE_TTBR_READ_INNER |
 					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
 	if (cfg->coherent_walk)
@@ -1232,7 +1151,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	__arm_lpae_free_data(data);
 	return NULL;
 }
 
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..62d127dae1c2 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -2,6 +2,8 @@
 #ifndef IO_PGTABLE_ARM_H_
 #define IO_PGTABLE_ARM_H_
 
+#include <linux/io-pgtable.h>
+
 #define ARM_LPAE_TCR_TG0_4K		0
 #define ARM_LPAE_TCR_TG0_64K		1
 #define ARM_LPAE_TCR_TG0_16K		2
@@ -27,4 +29,21 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+typedef u64 arm_lpae_iopte;
+
+void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
+			 struct io_pgtable_cfg *cfg);
+void __arm_lpae_free_pages(void *pages, size_t size,
+			   struct io_pgtable_cfg *cfg,
+			   void *cookie);
+void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+			     struct io_pgtable_cfg *cfg,
+			     void *cookie);
+void *__arm_lpae_alloc_data(size_t size, gfp_t gfp);
+void __arm_lpae_free_data(void *p);
+#ifndef __KVM_NVHE_HYPERVISOR__
+#define __arm_lpae_virt_to_phys	__pa
+#define __arm_lpae_phys_to_virt	__va
+#endif /* !__KVM_NVHE_HYPERVISOR__ */
+
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.52.0.rc1.455.g30608eb744-goog


