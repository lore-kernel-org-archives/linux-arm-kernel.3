Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE6FCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pO2YE+QLHcZDr5ERfg64RTVx9rRsQJCpks4Jpbfd5g=; b=mw5HnL2Kt6QFg8hrKaZbrocKvb
	Egwq8q8Jywr5xV7YUg7MbJfW46WAjgN0RC+eiTPkkIvjsvQKB9nK/6VyTMy8nf+mcGTbpOzx+ENAD
	tEIjAtpciR+s4r0eU/NxICLg49P6MCxrfnDtIdgK2IKB578Oxgm2WV/Jf8+lfgbYiTmcEHyvZ+TZM
	/JUoxvAMGU2yur8H2N3LJbhah+2O2PKhYWRcPJDHXbYZyU6lKKkE/2W7L0CAJRNjariNVf7dAmiid
	ynzlEezR9GpxJAlJReE/Y90CAZquE688TiTPhOatYM0M3d/XsCeca8d8Rxwrh8Iq8gC4+008Zrhwq
	pTQQxBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWlt-0000000Bxne-2Htt;
	Wed, 20 Aug 2025 00:33:45 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUFp-0000000BfPJ-2Bok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0514a5so25507225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640348; x=1756245148; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pO2YE+QLHcZDr5ERfg64RTVx9rRsQJCpks4Jpbfd5g=;
        b=pmFZKJJbjirAesTuNxE1rgK11VOd9wLmNsOjgzmFh/OKhyDzYORbwF7YXLeoH81bSH
         GKr4JQaZSxlAbyNs+1c/ct3w8EQ8kyCDI28U+XtpUY5jf4dHjS44JTD085PygD/VITYl
         BRsqjcdFapgGY3mEPvYCLTLN2ymAvyjPGEKn47uoUDgN+XsZRfIf5R86ZAq+jyDzxOJJ
         9oGqTf/b7k2p85VyfKRBmDij8A5EaTDDCLIgGR2IhDMWsX8ZShRjg2BUNT5KWiyDmz0V
         6ed6Sy8Cck5u2NRoQ30rgBd4jAUbRfAn7KxZQoOSHhCy051hAVlO8gIc0gEte9JZuYRP
         fYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640348; x=1756245148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pO2YE+QLHcZDr5ERfg64RTVx9rRsQJCpks4Jpbfd5g=;
        b=o06S9/OD/6XaiWvLdOzDfXSSNGc7oeg9wzlO1NYxV+qUTsHG2t0z2Wb6CFcNhyfz5w
         aYb7oGRh9Gn9V+D7oSY0qCguLpe5eok0REYw+RrNNzZ10auC78tfET8Ew1dbcZG51tu8
         GFdVK2ZUP8BHJdXAaBwQDyuUcZbz7H8cmzM9njOe9juc5zsddQu0Wro3A+PYrtE3rtHJ
         SF9Qg4dZdQlRFI4RnBftL0jsCA/AfRV7LIEdeOfr9d/GeseA4vIafz0nn4HmUBODLNhg
         D6TpkiWWuLK6bc43jMUtXLL55uvlLrC3UDp/7Mve5oRU655G8lQhTKXLSNhTN0tNuvGG
         AY2g==
X-Forwarded-Encrypted: i=1; AJvYcCWjERBDtljFadBH8WAwfXlr36D18Piwl2LA/8K1KolQ+mpvgmy16FwjHd8hjMosrnELTTuBwwaLOr2J7G5+sbEU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/os+RoJNLNoTFaDgOTJDLfR0IN2J9vtApT9MXAf7PZIiTCS2/
	GAKAIm1QvezlQXUOuJGR4FUTVLad5pscI0Vw+YYPIagX3JZMmO8sWl5Dr/0CkDVs8fXEWjC2CU5
	YWpIs4cNTYxmpdA==
X-Google-Smtp-Source: AGHT+IGJ3zxP4tZSJCnPpnLfo8kuY9/ChMlhp2Vc3i11mcX5tsN9jlzR3HCoS4DbN8uykW/2HzhGSH0eYEjOYg==
X-Received: from wmbhh7.prod.google.com ([2002:a05:600c:5307:b0:458:bfa7:dd5b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6216:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45b47b50207mr2162775e9.4.1755640348094;
 Tue, 19 Aug 2025 14:52:28 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:33 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-6-smostafa@google.com>
Subject: [PATCH v4 05/28] iommu/io-pgtable-arm: Factor kernel specific code out
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145229_567748_F675A4AC 
X-CRM114-Status: GOOD (  24.01  )
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

Some of the currently used APIs are only part of the kernel and not
available in the hypervisor, factor those out of the common file:
- alloc/free memory
- CMOs
- virt/phys conversions

Which is implemented by the kernel in io-pgtable-arm-kernel.c and
similarly for the hypervisor later in this series.

va/pa conversion kept as macros.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm-kernel.c | 89 ++++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c        | 99 +++------------------------
 drivers/iommu/io-pgtable-arm.h        | 14 ++++
 3 files changed, 113 insertions(+), 89 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-kernel.c b/drivers/iommu/io-pgtable-arm-kernel.c
index f3b869310964..d3056487b0f6 100644
--- a/drivers/iommu/io-pgtable-arm-kernel.c
+++ b/drivers/iommu/io-pgtable-arm-kernel.c
@@ -9,10 +9,99 @@
 #define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
 
 #include <linux/device/faux.h>
+#include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 
 #include "io-pgtable-arm.h"
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
 
 #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
 
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 791a2c4ecb83..2ca09081c3b0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -12,12 +12,10 @@
 #include <linux/io-pgtable.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
-#include <linux/dma-mapping.h>
 
 #include <asm/barrier.h>
 
 #include "io-pgtable-arm.h"
-#include "iommu-pages.h"
 
 /*
  * Calculate the index at level l used to map virtual address a using the
@@ -118,7 +116,7 @@
 #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
 
 /* IOPTE accessors */
-#define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
+#define iopte_deref(pte,d) __arm_lpae_phys_to_virt(iopte_to_paddr(pte, d))
 
 #define iopte_type(pte)					\
 	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)
@@ -208,83 +206,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
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
@@ -360,7 +281,7 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 	arm_lpae_iopte old, new;
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 
-	new = paddr_to_iopte(__pa(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
+	new = paddr_to_iopte(__arm_lpae_virt_to_phys(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
 		new |= ARM_LPAE_PTE_NSTABLE;
 
@@ -581,7 +502,7 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
 	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
-	kfree(data);
+	__arm_lpae_free_data(data);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -895,7 +816,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = __arm_lpae_alloc_data(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return NULL;
 
@@ -1018,11 +939,11 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
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
 
@@ -1114,11 +1035,11 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
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
 
@@ -1188,7 +1109,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	/* Ensure the empty pgd is visible before TRANSTAB can be written */
 	wmb();
 
-	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
+	cfg->arm_mali_lpae_cfg.transtab = __arm_lpae_virt_to_phys(data->pgd) |
 					  ARM_MALI_LPAE_TTBR_READ_INNER |
 					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
 	if (cfg->coherent_walk)
@@ -1197,7 +1118,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	__arm_lpae_free_data(data);
 	return NULL;
 }
 
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index a06a23543cff..7d9f0b759275 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -68,4 +68,18 @@ struct arm_lpae_io_pgtable {
 
 typedef u64 arm_lpae_iopte;
 
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
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.51.0.rc1.167.g924127e9c0-goog


