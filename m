Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60713CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbS5VM8JWBvxciJaUjLtcORna4KntSfvz669tBLnIuo=; b=zn9kS4s+hzY7kJcXsVZF4gDBrQ
	dTARChKbhQpX4snV3RUGSmkYPVV4zbgmF4z5kIMDlp+iDyG5OhiQq2iho8mh4upqKBZG6KL3C/oiw
	/DemAv8AfWteE3Jsc7s2gPuW/1Ta8WTYBNnnViVeEvmWKOGuPIzwfBfz6OSH6j4wsGmqnV+FxPptl
	lAd3LeHvWDLd/tdGsZNDztPGKuLHq6J5OhHVHyuMgnRscP2BSp8zsb/Ay3+0Kbz8Yu7JCwmLpP0dC
	FgRhC0/8wh/Opfc3BIp0wy45uJ2o4sMf6P4klNvOFwu3l3yndj+5A9E27XvXy+pcpqOvt4oEX3Spt
	x7gAq00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyslV-0000000C0EG-1eET;
	Wed, 17 Sep 2025 14:04:09 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysk0-0000000BxyB-2N2u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:38 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b04827ca035so792146366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758117753; x=1758722553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbS5VM8JWBvxciJaUjLtcORna4KntSfvz669tBLnIuo=;
        b=nA4LX87wGX7JkQan9PRsB7Y53Bia3HOFsdujYDZELd11lapY39aadKKt3Vk3SpoETq
         /en1qSpauZNf6kxwlTxMpfuYqFziRi6jfsejExjS20vwglatBQaoeu9RtgKHOy0qVi6z
         GSaJqIA9xrw3h0BtLSP8Ff7N17d1+eGF/xhoOrX++FC66BFDXW7aSCk24dy3WuTI/Mmi
         7t3i8f1eW5u9HfQYng6io2PdPb6sNMnuO8PxJXfGg2ZN4bUjElWz0LMh7WHipGs4+/M+
         CIvvRvT9zYeM0zV+wgerx+bttVHTfjGYREnlKQWEBbdh6NS0CKOEA+9kVtinppJx5lmf
         eRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117753; x=1758722553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbS5VM8JWBvxciJaUjLtcORna4KntSfvz669tBLnIuo=;
        b=hXSVsU+8zLH/h+lczr6DyVnYXZ5w4XYFg73QemXYk64EuMt3BtmSTJoKzV9aB14vUR
         tRnFrJu5vnG/b8I0Qwup4p5p0JvZavhoxqnN2SVuD/hwxg2x8HB5EKA60Vl32tf7mEu+
         FsNQhUFrWRnyCrHlIBJCucR2tYS5108i1rN6x9VDq5IURyK92b22qk+6NP3Ph4c7er1p
         8lPNKSErfCCa9YRixLdlFSj2K/39aF5ZTSmcst4fAVHGIUwYwmd1EYPofZayOaUBrcLb
         J1X5sqxf0rGfHwqyXUqffsicKX5levMBMUKaDNE5f3g4lEktMPFLvGB9eeMrgYo+Ze4q
         6JgA==
X-Forwarded-Encrypted: i=1; AJvYcCVMF/jclqdLyG2F9y7jdYI0a2zo1dZiG6J0mtJVn2xG5yWBkLehY5AzWewXNcXEsYDTvtcoQ/lAlGRPoHg2FW0Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxWlZUegtRUSZg58eQgNwRrOwWx0u2QhxNETgGSG6xw+5jS48fr
	3LhSb7OHXkGDtRX/YbqeUJlM5jPM9pEAIPOclu+57eR7M2GyGcRtvfbotiNyJ4kaG2DUbhRyyj8
	v5KgFwIekIvSGJA==
X-Google-Smtp-Source: AGHT+IE3jLGXIoEmh8JZSWjISt/98EKsWlH7hx945hGGOLLiBVFnNJMHLIN27ohSmsi4BE4MwPLjrgToCtD6zg==
X-Received: from edben16.prod.google.com ([2002:a05:6402:5290:b0:62f:464a:b98b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f0a:b0:b0c:6cae:51e3 with SMTP id a640c23a62f3a-b1bb8ca5382mr283095066b.35.1758117752675;
 Wed, 17 Sep 2025 07:02:32 -0700 (PDT)
Date: Wed, 17 Sep 2025 14:02:03 +0000
In-Reply-To: <20250917140216.2199055-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250917140216.2199055-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250917140216.2199055-3-smostafa@google.com>
Subject: [PATCH 2/2] iommu/io-pgtable-arm-selftest: Use KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070236_676626_5604B864 
X-CRM114-Status: GOOD (  18.60  )
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

Integrate the selftests as part of kunit, this makes the results of
the test available through debugfs later.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Kconfig                    |  2 +-
 drivers/iommu/io-pgtable-arm-selftests.c | 90 ++++++++++++++----------
 2 files changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 70d29b14d851..52c2fcb0e77f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -42,7 +42,7 @@ config IOMMU_IO_PGTABLE_LPAE
 
 config IOMMU_IO_PGTABLE_LPAE_SELFTEST
 	bool "LPAE selftests"
-	depends on IOMMU_IO_PGTABLE_LPAE
+	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT=y
 	help
 	  Enable self-tests for LPAE page table allocator. This performs
 	  a series of page-table consistency checks during boot.
diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
index f7746ff2c7a0..3775936d07c7 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -6,6 +6,8 @@
  *
  * Author: Will Deacon <will.deacon@arm.com>
  */
+#include <kunit/device.h>
+#include <kunit/test.h>
 #include <linux/device/faux.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -39,25 +41,26 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
 	.tlb_add_page	= dummy_tlb_add_page,
 };
 
-static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
+static void __init arm_lpae_dump_ops(struct kunit *test, struct io_pgtable_ops *ops)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 
-	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
-		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
-		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
-		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
+	kunit_err(test, "cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
+		  cfg->pgsize_bitmap, cfg->ias);
+	kunit_err(test, "data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
+		  ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
+		  ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
 }
 
-#define __FAIL(ops, i)	({						\
-		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
-		arm_lpae_dump_ops(ops);					\
-		-EFAULT;						\
+#define __FAIL(test, ops, i)	({						\
+		KUNIT_FAIL(test, "");						\
+		kunit_err(test, "selftest: test failed for fmt idx %d\n", (i));	\
+		arm_lpae_dump_ops(test, ops);					\
+		-EFAULT;							\
 })
 
-static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
+static int __init arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 {
 	static const enum io_pgtable_fmt fmts[] __initconst = {
 		ARM_64_LPAE_S1,
@@ -73,7 +76,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
 		if (!ops) {
-			pr_err("selftest: failed to allocate io pgtable ops\n");
+			kunit_err(test, "selftest: failed to allocate io pgtable ops\n");
 			return -ENOMEM;
 		}
 
@@ -82,13 +85,13 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		 * Empty page tables shouldn't provide any translations.
 		 */
 		if (ops->iova_to_phys(ops, 42))
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 
 		if (ops->iova_to_phys(ops, SZ_1G + 42))
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 
 		if (ops->iova_to_phys(ops, SZ_2G + 42))
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 
 		/*
 		 * Distinct mappings of different granule sizes.
@@ -101,16 +104,16 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 					   IOMMU_READ | IOMMU_WRITE |
 					   IOMMU_NOEXEC | IOMMU_CACHE,
 					   GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			/* Overlapping mappings */
 			if (!ops->map_pages(ops, iova, iova + size, size, 1,
 					    IOMMU_READ | IOMMU_NOEXEC,
 					    GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			iova += SZ_1G;
 		}
@@ -121,18 +124,18 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 			size = 1UL << j;
 
 			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			if (ops->iova_to_phys(ops, iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			/* Remap full block */
 			if (ops->map_pages(ops, iova, iova, size, 1,
 					   IOMMU_WRITE, GFP_KERNEL, &mapped))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(ops, i);
+				return __FAIL(test, ops, i);
 
 			iova += SZ_1G;
 		}
@@ -148,11 +151,11 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 				   IOMMU_READ | IOMMU_WRITE |
 				   IOMMU_NOEXEC | IOMMU_CACHE,
 				   GFP_KERNEL, &mapped))
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 		if (mapped != size)
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-			return __FAIL(ops, i);
+			return __FAIL(test, ops, i);
 
 		free_io_pgtable_ops(ops);
 	}
@@ -160,7 +163,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	return 0;
 }
 
-static int __init arm_lpae_do_selftests(void)
+static void __init io_pgtable_arm_test_run(struct kunit *test)
 {
 	static const unsigned long pgsize[] __initconst = {
 		SZ_4K | SZ_2M | SZ_1G,
@@ -173,18 +176,19 @@ static int __init arm_lpae_do_selftests(void)
 	};
 
 	int i, j, k, pass = 0, fail = 0;
-	struct faux_device *dev;
+	struct device *dev;
 	struct io_pgtable_cfg cfg = {
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
 		.quirks = IO_PGTABLE_QUIRK_NO_WARN,
 	};
 
-	dev = faux_device_create("io-pgtable-test", NULL, 0);
-	if (!dev)
-		return -ENOMEM;
+	dev = kunit_device_register(test, "io-pgtable-test");
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, dev);
+	if (IS_ERR_OR_NULL(dev))
+		return;
 
-	cfg.iommu_dev = &dev->dev;
+	cfg.iommu_dev = dev;
 
 	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
 		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
@@ -193,9 +197,9 @@ static int __init arm_lpae_do_selftests(void)
 				cfg.pgsize_bitmap = pgsize[i];
 				cfg.ias = address_size[k];
 				cfg.oas = address_size[j];
-				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
-					pgsize[i], cfg.ias, cfg.oas);
-				if (arm_lpae_run_tests(&cfg))
+				kunit_info(test, "selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
+					   pgsize[i], cfg.ias, cfg.oas);
+				if (arm_lpae_run_tests(test, &cfg))
 					fail++;
 				else
 					pass++;
@@ -203,9 +207,17 @@ static int __init arm_lpae_do_selftests(void)
 		}
 	}
 
-	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
-	faux_device_destroy(dev);
-
-	return fail ? -EFAULT : 0;
+	kunit_info(test, "selftest: completed with %d PASS %d FAIL\n", pass, fail);
 }
-subsys_initcall(arm_lpae_do_selftests);
+
+static struct kunit_case io_pgtable_arm_test_cases[] __refdata = {
+	KUNIT_CASE(io_pgtable_arm_test_run),
+	{},
+};
+
+static struct kunit_suite io_pgtable_arm_test = {
+	.name = "io-pgtable-arm-test",
+	.test_cases = io_pgtable_arm_test_cases,
+};
+
+kunit_test_init_section_suite(io_pgtable_arm_test);
-- 
2.51.0.384.g4c02a37b29-goog


