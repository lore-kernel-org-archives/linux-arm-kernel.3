Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9DCAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPTm9ldH05FB4Yw+nXjL4CLcI1O0tCdKN6q7o4MyyHk=; b=43YGWVq2P3byId7ss3nbCyYph4
	bFZwYOCCRAGKvWeK75yL2veBlS12upANM3KKtPP7d2tJHrR04/owgOwMJs59LmsO9ws9hwysnqH1R
	y0fHrRfQj0G8/9qTyTsBCUTVP7O/Tz/HOTqB87OV7zcd7AnO58QCUu/Icmvi8eCzHhJhoS3dr28TV
	/F1T65tQoDjRIp4QFYOe6ZRRkxOIHlkQko4gq6KgOwkcSfnKoqDfRDamFW0Cv4ON05MThztFGvZkP
	L8uEeu5qg8+aOe9liBzk+aIj5QIHlwTuAFeSK/DgV8esbBgeSPB2xu/KhAS/+9Tf7rwHKSmGkDT95
	fTzIibKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyslQ-0000000C06c-0gg2;
	Wed, 17 Sep 2025 14:04:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysjv-0000000Bxqj-3MS2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:33 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3eb536ac039so2077347f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758117749; x=1758722549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPTm9ldH05FB4Yw+nXjL4CLcI1O0tCdKN6q7o4MyyHk=;
        b=frj1hul7lr5AO0HUwbZ11oAHvPTps35yWUZWNOxfKAVuGkBx1VjxzdlqQMBcLdNjCo
         Ts2AgQOOJPaRiYUnFghyezmjQhbQZR0inXDw+C2QBSRxNxoN/IJymjm+tMYGru5YOaJf
         /zwqftCCyXzp1j38teUai3j3UsuHKzDktxnyP5gz4K+uOz17ozqntQ3aQ9OUyCja+4iU
         ZEVQCSDHoew6ixL0Qb1z/kr9xoKJB16sV4LEcSzfd9LqBvBt4hn9L1wLoMuCnEgDavYk
         lWHX9R3LpOHoF0BpzGqKbx1ySaFCm136uf3sSjCswUYUYjW+sBXraPilAjcS2iQ2nklL
         UN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117749; x=1758722549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPTm9ldH05FB4Yw+nXjL4CLcI1O0tCdKN6q7o4MyyHk=;
        b=q8pQsro6u5bQrLRjT7VM7pRx4OjvwOknfXnDGKDBDXH7G6Co8unF1SWYxavptVg0pC
         XdudMBMa6dolUX/fmzZ65Y7FAhPFCUVo3N403w26cnieCFlt6dhNN40uFtCXfvNCFLZb
         vPb+hxu3iKhPj94vIt3nII05S3LF2mf9y+VobIBl//NIU9i9G/4E8in5qqXXKgZVYBgZ
         zINRMkqZSaT0JkWq05/FVPbnAZgTG0AZsglFA825Ns9RgGZ2RkhWxgoBA8S7jLPvJ9J1
         +qULeHH/NBEOhzUnNfElfIbPiwS5u8kLbHDWrZFwSnDg9zTvR9Dt6mR/y7bRhsRvDD+N
         mH0A==
X-Forwarded-Encrypted: i=1; AJvYcCXcs84+xfb4edxysXBcqBo8k+6YtBLwgAkmJkl17X745ppZ/xZVesEi65z7/nUF1RdyyNnORNVMF5f2GxQ13zsO@lists.infradead.org
X-Gm-Message-State: AOJu0YzuKQixS5PH0s/pYRvqWD2OW2n0Hc3UVK7/nm/pbPV0qYd+2ybF
	nyui2BFAQ5gLG4ypi7WdCgyb2THS8CEhcFZRbvyL/+qbeIWuV0olK99dhpmyE6QrzuMgtoov1ey
	sAKHP9KZaaGSteg==
X-Google-Smtp-Source: AGHT+IEaQio/Zs7puieg6tM047i35YMeLXuQUx6Kkae+qk+M5jpGAX1GbglUvmZjLAougtbpym7PZT/84AZH5g==
X-Received: from wrfu4.prod.google.com ([2002:a05:6000:384:b0:3ea:af7:bb94])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420a:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-3ecdfa2af44mr2483150f8f.45.1758117748915;
 Wed, 17 Sep 2025 07:02:28 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:02:02 +0000
In-Reply-To: <20250917140216.2199055-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250917140216.2199055-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917140216.2199055-2-smostafa@google.com>
Subject: [PATCH 1/2] iommu/io-pgtable-arm: Move selftests to a separate file
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070232_119945_A56B88EE 
X-CRM114-Status: GOOD (  27.83  )
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

Clean up the io-pgtable-arm library by moving the selftests out.
Next the tests will be registered with kunit.

This is useful also to factor out kernel specific code out, so
it can compiled as part of the hypervisor object.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 211 ++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 243 -----------------------
 drivers/iommu/io-pgtable-arm.h           |  41 ++++
 4 files changed, 253 insertions(+), 243 deletions(-)
 create mode 100644 drivers/iommu/io-pgtable-arm-selftests.c

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 355294fa9033..5250a2eea13f 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
+obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST) += io-pgtable-arm-selftests.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
new file mode 100644
index 000000000000..f7746ff2c7a0
--- /dev/null
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CPU-agnostic ARM page table allocator.
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+#include <linux/device/faux.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include "io-pgtable-arm.h"
+
+static struct io_pgtable_cfg *cfg_cookie __initdata;
+
+static void __init dummy_tlb_flush_all(void *cookie)
+{
+	WARN_ON(cookie != cfg_cookie);
+}
+
+static void __init dummy_tlb_flush(unsigned long iova, size_t size,
+				   size_t granule, void *cookie)
+{
+	WARN_ON(cookie != cfg_cookie);
+	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
+}
+
+static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
+				      unsigned long iova, size_t granule,
+				      void *cookie)
+{
+	dummy_tlb_flush(iova, granule, granule, cookie);
+}
+
+static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
+	.tlb_flush_all	= dummy_tlb_flush_all,
+	.tlb_flush_walk	= dummy_tlb_flush,
+	.tlb_add_page	= dummy_tlb_add_page,
+};
+
+static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+
+	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
+		cfg->pgsize_bitmap, cfg->ias);
+	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
+		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
+		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
+}
+
+#define __FAIL(ops, i)	({						\
+		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
+		arm_lpae_dump_ops(ops);					\
+		-EFAULT;						\
+})
+
+static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
+{
+	static const enum io_pgtable_fmt fmts[] __initconst = {
+		ARM_64_LPAE_S1,
+		ARM_64_LPAE_S2,
+	};
+
+	int i, j;
+	unsigned long iova;
+	size_t size, mapped;
+	struct io_pgtable_ops *ops;
+
+	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
+		cfg_cookie = cfg;
+		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
+		if (!ops) {
+			pr_err("selftest: failed to allocate io pgtable ops\n");
+			return -ENOMEM;
+		}
+
+		/*
+		 * Initial sanity checks.
+		 * Empty page tables shouldn't provide any translations.
+		 */
+		if (ops->iova_to_phys(ops, 42))
+			return __FAIL(ops, i);
+
+		if (ops->iova_to_phys(ops, SZ_1G + 42))
+			return __FAIL(ops, i);
+
+		if (ops->iova_to_phys(ops, SZ_2G + 42))
+			return __FAIL(ops, i);
+
+		/*
+		 * Distinct mappings of different granule sizes.
+		 */
+		iova = 0;
+		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
+			size = 1UL << j;
+
+			if (ops->map_pages(ops, iova, iova, size, 1,
+					   IOMMU_READ | IOMMU_WRITE |
+					   IOMMU_NOEXEC | IOMMU_CACHE,
+					   GFP_KERNEL, &mapped))
+				return __FAIL(ops, i);
+
+			/* Overlapping mappings */
+			if (!ops->map_pages(ops, iova, iova + size, size, 1,
+					    IOMMU_READ | IOMMU_NOEXEC,
+					    GFP_KERNEL, &mapped))
+				return __FAIL(ops, i);
+
+			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+				return __FAIL(ops, i);
+
+			iova += SZ_1G;
+		}
+
+		/* Full unmap */
+		iova = 0;
+		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
+			size = 1UL << j;
+
+			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
+				return __FAIL(ops, i);
+
+			if (ops->iova_to_phys(ops, iova + 42))
+				return __FAIL(ops, i);
+
+			/* Remap full block */
+			if (ops->map_pages(ops, iova, iova, size, 1,
+					   IOMMU_WRITE, GFP_KERNEL, &mapped))
+				return __FAIL(ops, i);
+
+			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+				return __FAIL(ops, i);
+
+			iova += SZ_1G;
+		}
+
+		/*
+		 * Map/unmap the last largest supported page of the IAS, this can
+		 * trigger corner cases in the concatednated page tables.
+		 */
+		mapped = 0;
+		size = 1UL << __fls(cfg->pgsize_bitmap);
+		iova = (1UL << cfg->ias) - size;
+		if (ops->map_pages(ops, iova, iova, size, 1,
+				   IOMMU_READ | IOMMU_WRITE |
+				   IOMMU_NOEXEC | IOMMU_CACHE,
+				   GFP_KERNEL, &mapped))
+			return __FAIL(ops, i);
+		if (mapped != size)
+			return __FAIL(ops, i);
+		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
+			return __FAIL(ops, i);
+
+		free_io_pgtable_ops(ops);
+	}
+
+	return 0;
+}
+
+static int __init arm_lpae_do_selftests(void)
+{
+	static const unsigned long pgsize[] __initconst = {
+		SZ_4K | SZ_2M | SZ_1G,
+		SZ_16K | SZ_32M,
+		SZ_64K | SZ_512M,
+	};
+
+	static const unsigned int address_size[] __initconst = {
+		32, 36, 40, 42, 44, 48,
+	};
+
+	int i, j, k, pass = 0, fail = 0;
+	struct faux_device *dev;
+	struct io_pgtable_cfg cfg = {
+		.tlb = &dummy_tlb_ops,
+		.coherent_walk = true,
+		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
+	};
+
+	dev = faux_device_create("io-pgtable-test", NULL, 0);
+	if (!dev)
+		return -ENOMEM;
+
+	cfg.iommu_dev = &dev->dev;
+
+	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
+		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
+			/* Don't use ias > oas as it is not valid for stage-2. */
+			for (k = 0; k <= j; ++k) {
+				cfg.pgsize_bitmap = pgsize[i];
+				cfg.ias = address_size[k];
+				cfg.oas = address_size[j];
+				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
+					pgsize[i], cfg.ias, cfg.oas);
+				if (arm_lpae_run_tests(&cfg))
+					fail++;
+				else
+					pass++;
+			}
+		}
+	}
+
+	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
+	faux_device_destroy(dev);
+
+	return fail ? -EFAULT : 0;
+}
+subsys_initcall(arm_lpae_do_selftests);
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e8e2216c294..b1d968edccd6 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -12,10 +12,7 @@
 #include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
-#include <linux/kernel.h>
-#include <linux/device/faux.h>
 #include <linux/sizes.h>
-#include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 
@@ -24,33 +21,6 @@
 #include "io-pgtable-arm.h"
 #include "iommu-pages.h"
 
-#define ARM_LPAE_MAX_ADDR_BITS		52
-#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
-#define ARM_LPAE_MAX_LEVELS		4
-
-/* Struct accessors */
-#define io_pgtable_to_data(x)						\
-	container_of((x), struct arm_lpae_io_pgtable, iop)
-
-#define io_pgtable_ops_to_data(x)					\
-	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
-
-/*
- * Calculate the right shift amount to get to the portion describing level l
- * in a virtual address mapped by the pagetable in d.
- */
-#define ARM_LPAE_LVL_SHIFT(l,d)						\
-	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
-	ilog2(sizeof(arm_lpae_iopte)))
-
-#define ARM_LPAE_GRANULE(d)						\
-	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
-#define ARM_LPAE_PGD_SIZE(d)						\
-	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
-
-#define ARM_LPAE_PTES_PER_TABLE(d)					\
-	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
-
 /*
  * Calculate the index at level l used to map virtual address a using the
  * pagetable in d.
@@ -156,18 +126,6 @@
 #define iopte_set_writeable_clean(ptep)				\
 	set_bit(ARM_LPAE_PTE_AP_RDONLY_BIT, (unsigned long *)(ptep))
 
-struct arm_lpae_io_pgtable {
-	struct io_pgtable	iop;
-
-	int			pgd_bits;
-	int			start_level;
-	int			bits_per_level;
-
-	void			*pgd;
-};
-
-typedef u64 arm_lpae_iopte;
-
 static inline bool iopte_leaf(arm_lpae_iopte pte, int lvl,
 			      enum io_pgtable_fmt fmt)
 {
@@ -1267,204 +1225,3 @@ struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
 	.alloc	= arm_mali_lpae_alloc_pgtable,
 	.free	= arm_lpae_free_pgtable,
 };
-
-#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
-
-static struct io_pgtable_cfg *cfg_cookie __initdata;
-
-static void __init dummy_tlb_flush_all(void *cookie)
-{
-	WARN_ON(cookie != cfg_cookie);
-}
-
-static void __init dummy_tlb_flush(unsigned long iova, size_t size,
-				   size_t granule, void *cookie)
-{
-	WARN_ON(cookie != cfg_cookie);
-	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
-}
-
-static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t granule,
-				      void *cookie)
-{
-	dummy_tlb_flush(iova, granule, granule, cookie);
-}
-
-static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
-	.tlb_flush_all	= dummy_tlb_flush_all,
-	.tlb_flush_walk	= dummy_tlb_flush,
-	.tlb_add_page	= dummy_tlb_add_page,
-};
-
-static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
-{
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
-
-	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
-		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
-		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
-		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
-}
-
-#define __FAIL(ops, i)	({						\
-		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
-		arm_lpae_dump_ops(ops);					\
-		-EFAULT;						\
-})
-
-static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
-{
-	static const enum io_pgtable_fmt fmts[] __initconst = {
-		ARM_64_LPAE_S1,
-		ARM_64_LPAE_S2,
-	};
-
-	int i, j;
-	unsigned long iova;
-	size_t size, mapped;
-	struct io_pgtable_ops *ops;
-
-	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
-		cfg_cookie = cfg;
-		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
-		if (!ops) {
-			pr_err("selftest: failed to allocate io pgtable ops\n");
-			return -ENOMEM;
-		}
-
-		/*
-		 * Initial sanity checks.
-		 * Empty page tables shouldn't provide any translations.
-		 */
-		if (ops->iova_to_phys(ops, 42))
-			return __FAIL(ops, i);
-
-		if (ops->iova_to_phys(ops, SZ_1G + 42))
-			return __FAIL(ops, i);
-
-		if (ops->iova_to_phys(ops, SZ_2G + 42))
-			return __FAIL(ops, i);
-
-		/*
-		 * Distinct mappings of different granule sizes.
-		 */
-		iova = 0;
-		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
-			size = 1UL << j;
-
-			if (ops->map_pages(ops, iova, iova, size, 1,
-					   IOMMU_READ | IOMMU_WRITE |
-					   IOMMU_NOEXEC | IOMMU_CACHE,
-					   GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
-
-			/* Overlapping mappings */
-			if (!ops->map_pages(ops, iova, iova + size, size, 1,
-					    IOMMU_READ | IOMMU_NOEXEC,
-					    GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
-
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
-
-			iova += SZ_1G;
-		}
-
-		/* Full unmap */
-		iova = 0;
-		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
-			size = 1UL << j;
-
-			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-				return __FAIL(ops, i);
-
-			if (ops->iova_to_phys(ops, iova + 42))
-				return __FAIL(ops, i);
-
-			/* Remap full block */
-			if (ops->map_pages(ops, iova, iova, size, 1,
-					   IOMMU_WRITE, GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
-
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
-
-			iova += SZ_1G;
-		}
-
-		/*
-		 * Map/unmap the last largest supported page of the IAS, this can
-		 * trigger corner cases in the concatednated page tables.
-		 */
-		mapped = 0;
-		size = 1UL << __fls(cfg->pgsize_bitmap);
-		iova = (1UL << cfg->ias) - size;
-		if (ops->map_pages(ops, iova, iova, size, 1,
-				   IOMMU_READ | IOMMU_WRITE |
-				   IOMMU_NOEXEC | IOMMU_CACHE,
-				   GFP_KERNEL, &mapped))
-			return __FAIL(ops, i);
-		if (mapped != size)
-			return __FAIL(ops, i);
-		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-			return __FAIL(ops, i);
-
-		free_io_pgtable_ops(ops);
-	}
-
-	return 0;
-}
-
-static int __init arm_lpae_do_selftests(void)
-{
-	static const unsigned long pgsize[] __initconst = {
-		SZ_4K | SZ_2M | SZ_1G,
-		SZ_16K | SZ_32M,
-		SZ_64K | SZ_512M,
-	};
-
-	static const unsigned int address_size[] __initconst = {
-		32, 36, 40, 42, 44, 48,
-	};
-
-	int i, j, k, pass = 0, fail = 0;
-	struct faux_device *dev;
-	struct io_pgtable_cfg cfg = {
-		.tlb = &dummy_tlb_ops,
-		.coherent_walk = true,
-		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
-	};
-
-	dev = faux_device_create("io-pgtable-test", NULL, 0);
-	if (!dev)
-		return -ENOMEM;
-
-	cfg.iommu_dev = &dev->dev;
-
-	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
-		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
-			/* Don't use ias > oas as it is not valid for stage-2. */
-			for (k = 0; k <= j; ++k) {
-				cfg.pgsize_bitmap = pgsize[i];
-				cfg.ias = address_size[k];
-				cfg.oas = address_size[j];
-				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
-					pgsize[i], cfg.ias, cfg.oas);
-				if (arm_lpae_run_tests(&cfg))
-					fail++;
-				else
-					pass++;
-			}
-		}
-	}
-
-	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
-	faux_device_destroy(dev);
-
-	return fail ? -EFAULT : 0;
-}
-subsys_initcall(arm_lpae_do_selftests);
-#endif
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..a06a23543cff 100644
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
@@ -27,4 +29,43 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+/* Struct accessors */
+#define io_pgtable_to_data(x)						\
+	container_of((x), struct arm_lpae_io_pgtable, iop)
+
+#define io_pgtable_ops_to_data(x)					\
+	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
+
+struct arm_lpae_io_pgtable {
+	struct io_pgtable	iop;
+
+	int			pgd_bits;
+	int			start_level;
+	int			bits_per_level;
+
+	void			*pgd;
+};
+
+#define ARM_LPAE_MAX_ADDR_BITS		52
+#define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
+#define ARM_LPAE_MAX_LEVELS		4
+
+/*
+ * Calculate the right shift amount to get to the portion describing level l
+ * in a virtual address mapped by the pagetable in d.
+ */
+#define ARM_LPAE_LVL_SHIFT(l,d)						\
+	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
+	ilog2(sizeof(arm_lpae_iopte)))
+
+#define ARM_LPAE_GRANULE(d)						\
+	(sizeof(arm_lpae_iopte) << (d)->bits_per_level)
+#define ARM_LPAE_PGD_SIZE(d)						\
+	(sizeof(arm_lpae_iopte) << (d)->pgd_bits)
+
+#define ARM_LPAE_PTES_PER_TABLE(d)					\
+	(ARM_LPAE_GRANULE(d) >> ilog2(sizeof(arm_lpae_iopte)))
+
+typedef u64 arm_lpae_iopte;
+
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.51.0.384.g4c02a37b29-goog


