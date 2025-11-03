Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FBECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnNVG2vhHfC1gt/qitZLpmBchowi40mXLPD49k6Q4P8=; b=qSZpN+WRYeiRYmETV3O2c7D/PS
	4HKz/BOK6fY60nU4PrP+E5ruEkrHVuIzHJraWdB4rS9Wu/9qG6miqE8VMsyn/MaD6xFtus5hbP4N9
	8ec8nqyrrzu9edjrQZKeFw3rYh1qwDQPpv7HW28qHR7ADGsmNNkqZsEBodbiViWaxjc0A3lmcyzT6
	VWM+bF601gFeoEYvAn1O0JNVToM5BxKjYBQBomJzAKMxBggbHmzfp2Xf/N06qmXMVKf8JnEUyQPJu
	hVds1BCOOWfztwp/pd6CV3kZeigp9xuLwmTP0U5snhK+w5D9Tl1+D5UzP0zHOvvVd3NPvI31RD3/e
	R0Eabj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl9-00000009p7I-0yOU;
	Mon, 03 Nov 2025 12:34:07 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl7-00000009p5b-1gdk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:34:06 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e39567579so23328455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762173243; x=1762778043; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnNVG2vhHfC1gt/qitZLpmBchowi40mXLPD49k6Q4P8=;
        b=zXkbwdxpKgxVe6J4Xs2WkINvLnEzizlesYIB5TvGYYPhD0GtMB2XyyQC9vO5zBgJbZ
         gh+cLhDAeiCMnfe83U5HN14n5bAH7O2RT0KLU+9f7seEjIPYIfkT+umlJpQ2eIn8Ry8u
         Q/4EIsw5ghU8xu0v0rfxvczmlFfg6Nr+6yNgyJrLuDlGEfPOfsM6LWUO9wzdiGs2f1Ut
         oPHgky8ndf5hL8F300orqp4Ni/X5fPDtEGwZYl1qkzf3leYH0flXdbugK0IsVfCCznGb
         bFbx/GcVRmY8YSQreHrC/hibygjFRAfK3wADsFhHSZQvtHB/FOuAEGlZgnVioFNuAaB3
         /InA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173243; x=1762778043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnNVG2vhHfC1gt/qitZLpmBchowi40mXLPD49k6Q4P8=;
        b=ZyxrCJ943SR4nRxmgDC2TV6PAEkYbCCh/D65ITyU7w2oUTiFDVYFd/Tg/0gVhP9Ji1
         xRvYLTAxIuJcnLt0L6ZfegfnICe/zVg4fWFxlReFrss3VYu4/e11HtIVyY/2H8ASBMYM
         Co9HLsZWtFo+209qo8bi+f0k9JE4ViGpItRnXER+56xMdiNlKFuh8zsw2RD3pILzOATv
         qytnoyTNo+ZO8o0nDmDWWu2ZalJuZ8ol0MgFgTqZNgmHVMBRhEV5clQZInfoM8bC+RHr
         5sUin3efqntePNrB7d3ukjrnD2L7aK1HIeS9glE9TrUD08d3s7lpjMmlGEBbb/8GRynh
         D/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVnOkvOqJy2R/CjY3JOmmM30cBcq9DOJiDspwFGDVc43MUkfuXGlSsX9lW7szHpYGWUgTYEvDkpatU39exN0H9w@lists.infradead.org
X-Gm-Message-State: AOJu0YxzGGLXo5Fl9XyqFcEwtmWRiDUsrtMUH4hWuCZCiIpkd19JjKrm
	QezKy1JheiJEXUyG7eLBZohZwNR0ENoZvPbcymlCL5fWUPtLiXN0OI4Efn9w7Dy6yugs9hYgqyb
	I8B78PI/6GtRF7w==
X-Google-Smtp-Source: AGHT+IHA8/ok6+XXuQ9VXgpdq0czkrD75t7WqBNgPYie2CXvz0gEKxvUiOAYrX3UQcN/obgIYlDq5IcvFyCXfQ==
X-Received: from wmd16.prod.google.com ([2002:a05:600c:6050:b0:46e:37d6:c1a6])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3149:b0:477:942:7521 with SMTP id 5b1f17b1804b1-477307e285dmr107319205e9.14.1762173243360;
 Mon, 03 Nov 2025 04:34:03 -0800 (PST)
Date: Mon,  3 Nov 2025 12:33:50 +0000
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251103123355.1769093-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103123355.1769093-3-smostafa@google.com>
Subject: [PATCH v6 2/4] iommu/io-pgtable-arm: Move selftests to a separate file
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_043405_504925_CF3131BB 
X-CRM114-Status: GOOD (  25.20  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Makefile                   |   1 +
 drivers/iommu/io-pgtable-arm-selftests.c | 201 +++++++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c           | 190 ---------------------
 3 files changed, 202 insertions(+), 190 deletions(-)
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
index 000000000000..5da6d4b69920
--- /dev/null
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CPU-agnostic ARM page table allocator.
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
+ */
+
+#define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
+
+#include <linux/device/faux.h>
+#include <linux/io-pgtable.h>
+#include <linux/kernel.h>
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
+#define __FAIL(i) ({							\
+		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
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
+			return __FAIL(i);
+
+		if (ops->iova_to_phys(ops, SZ_1G + 42))
+			return __FAIL(i);
+
+		if (ops->iova_to_phys(ops, SZ_2G + 42))
+			return __FAIL(i);
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
+				return __FAIL(i);
+
+			/* Overlapping mappings */
+			if (!ops->map_pages(ops, iova, iova + size, size, 1,
+					    IOMMU_READ | IOMMU_NOEXEC,
+					    GFP_KERNEL, &mapped))
+				return __FAIL(i);
+
+			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+				return __FAIL(i);
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
+				return __FAIL(i);
+
+			if (ops->iova_to_phys(ops, iova + 42))
+				return __FAIL(i);
+
+			/* Remap full block */
+			if (ops->map_pages(ops, iova, iova, size, 1,
+					   IOMMU_WRITE, GFP_KERNEL, &mapped))
+				return __FAIL(i);
+
+			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+				return __FAIL(i);
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
+			return __FAIL(i);
+		if (mapped != size)
+			return __FAIL(i);
+		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
+			return __FAIL(i);
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
index 7d6d7221f540..e6626004b323 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -12,8 +12,6 @@
 #include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
-#include <linux/kernel.h>
-#include <linux/device/faux.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -1267,191 +1265,3 @@ struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
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
-#define __FAIL(i) ({							\
-		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
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
-			return __FAIL(i);
-
-		if (ops->iova_to_phys(ops, SZ_1G + 42))
-			return __FAIL(i);
-
-		if (ops->iova_to_phys(ops, SZ_2G + 42))
-			return __FAIL(i);
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
-				return __FAIL(i);
-
-			/* Overlapping mappings */
-			if (!ops->map_pages(ops, iova, iova + size, size, 1,
-					    IOMMU_READ | IOMMU_NOEXEC,
-					    GFP_KERNEL, &mapped))
-				return __FAIL(i);
-
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(i);
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
-				return __FAIL(i);
-
-			if (ops->iova_to_phys(ops, iova + 42))
-				return __FAIL(i);
-
-			/* Remap full block */
-			if (ops->map_pages(ops, iova, iova, size, 1,
-					   IOMMU_WRITE, GFP_KERNEL, &mapped))
-				return __FAIL(i);
-
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(i);
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
-			return __FAIL(i);
-		if (mapped != size)
-			return __FAIL(i);
-		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-			return __FAIL(i);
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
-- 
2.51.1.930.gacf6e81ea2-goog


