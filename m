Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A47CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LKEOMyqjqgBvPHQx5V7MbLjfxSu8M1O7xqqETG0HSs=; b=hkOJjz9vX3SDua7WkFHuAGDHpG
	O66mVkEU3h+o8Bgs8UGDD3Nay5hrwmRo3z/jvy9HLBXB928WQilV598Bz2J8SxKt2iFAq7wWybQnC
	4hU++bw71X3EwFVyqRuhh0d70M2uk9v2MjSTj4ldqdir4HdUO97qURYaKKzD6JC5nAjXcoJsMBMo8
	57F/INAgTy+QZfAX38zI7hg5JN8HV+LBr+3ay3n1SXxNG5IdQR6amBJZgFkLWRI67shQnti5zOVCZ
	TkXux/NYHnyXtj/70Klgh5kkomr/yfHEcYpgobz4q7YjyZ7mUtgAW/ScMZ4EYb8ILUgYp4QvD4+kY
	kp7PIfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtlC-00000009p9f-1Sb3;
	Mon, 03 Nov 2025 12:34:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtl9-00000009p6R-2itV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:34:08 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-427015f63faso2306705f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762173245; x=1762778045; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LKEOMyqjqgBvPHQx5V7MbLjfxSu8M1O7xqqETG0HSs=;
        b=kTr5zcnhcfeP/rNj3lwXOyxfKIVavO4ymMOYvCDrg9ThE4otm7IVelYrh1j4d5vh31
         m4dvceltBMZjfJd7c1h02aN+2tgFVdXDjqMEhncDbWFleT9eB7ZzmgIcnm08ABiYt1xa
         fsIvkEX+lrf0AafTagYwmDp1JSiOFJ3mXJZZlbGOy4cWtTtYkp0QzxeHwmxzILkixOtD
         AjGU57vwsAiAAubGr7SDfEPMyXpm1hUip4DoRfMQKujjKqMF3WGwQCY39RzI0RxxbxsC
         KbeD77DmL99JA7xy+B+lyQhifvWhej1FsnP3MHGdLwrtX3/zsC6fYBHJxywAPLmhDMvU
         O4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173245; x=1762778045;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LKEOMyqjqgBvPHQx5V7MbLjfxSu8M1O7xqqETG0HSs=;
        b=sdaafyYsNuCQIzk7uUdcZMgG1tpwEOOeTXO0Mz3jKKDn7ygOvqS17GcRG7atSsClwz
         SjNhdQG+FIg/2lNQ0GklKOB3PKrQsle42sUpzx9OjmLr2zi+ZbOatdAhsm0crH7ee9fb
         g5yIyddwERcdRw11jkmQXQn0FOV0Eg+DTwq2hzDA7WwoMt4o6Yylnu3uEF/b8vjgroVA
         FXJxRO3T+T4I4+/SJxbbIKOtwIShX3LowfIuEYDGj0trHbP7ZNRTd97BwMCJN37Vz3Tu
         3FjgFOdrx7JgIchBfJ8JHu4XiaBgYpY+noZqMTlI+uBiEAOENm7U6BEbmH8tkWm5noSe
         hdiA==
X-Forwarded-Encrypted: i=1; AJvYcCXApCdaVg8kg94g8SJBP07ZWJU8pMBJv0Nict0pHbh68WyBTudEX/6OuIbVot/hD5zF37oE20imsJIaVLYkcMEd@lists.infradead.org
X-Gm-Message-State: AOJu0YygqawlQ076cjPUC2UBeFrpR48BujSKu01X5msiDG+uZxK5KQHe
	ASWF4prY/7pCQx582KXjFOaCZ+q9FIUWc7f8+BJfDhuc5dFrYnV5RDhVgd8jSyfzQEZoRBWFPq1
	FJF2uNfGK6N7pCg==
X-Google-Smtp-Source: AGHT+IEeYIjFUdrZpu4l4ib2e0zrBNK41Il+QS1uUdlEcvl9aDJoHa5mpKNWO9cQe02uAQGChLkaUrNjED4NBw==
X-Received: from wrad11.prod.google.com ([2002:adf:a40b:0:b0:429:d0c9:ed74])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4b0f:b0:429:c965:afa with SMTP id ffacd0b85a97d-429c9650c2emr5684998f8f.36.1762173245204;
 Mon, 03 Nov 2025 04:34:05 -0800 (PST)
Date: Mon,  3 Nov 2025 12:33:52 +0000
In-Reply-To: <20251103123355.1769093-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251103123355.1769093-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103123355.1769093-5-smostafa@google.com>
Subject: [PATCH v6 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_043407_727434_23299E64 
X-CRM114-Status: GOOD (  20.15  )
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

Integrate the selftests as part of kunit.

Now instead of the test only being run at boot, it can run:

- With CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST=y
  It will automatically run at boot as before.

- Otherwise with CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST=m:
  1) on module load:
     Once the module load the self test will run
     # modprobe io-pgtable-arm-selftests

  2) debugfs
     With CONFIG_KUNIT_DEBUGFS=y You can run the test with
     # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run

  3) Using kunit.py
     You can also use the helper script which uses Qemu in the background

     # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 \
       --make_options LLVM=1 --kunitconfig ./kunit/kunitconfig
      [18:01:09] ============= io-pgtable-arm-test (1 subtest) ==============
      [18:01:09] [PASSED] arm_lpae_do_selftests
      [18:01:09] =============== [PASSED] io-pgtable-arm-test ===============
      [18:01:09] ============================================================

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Kconfig                    | 11 ++--
 drivers/iommu/Makefile                   |  2 +-
 drivers/iommu/io-pgtable-arm-selftests.c | 81 +++++++++++++-----------
 3 files changed, 50 insertions(+), 44 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 553522ef3ca9..d50685433347 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -40,12 +40,13 @@ config IOMMU_IO_PGTABLE_LPAE
 	  sizes at both stage-1 and stage-2, as well as address spaces
 	  up to 48-bits in size.
 
-config IOMMU_IO_PGTABLE_LPAE_SELFTEST
-	tristate "LPAE selftests"
-	depends on IOMMU_IO_PGTABLE_LPAE
+config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
+	tristate "KUnit tests for LPAE"
+	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT
+	default KUNIT_ALL_TESTS
 	help
-	  Enable self-tests for LPAE page table allocator. This performs
-	  a series of page-table consistency checks during boot.
+	  Enable kunit tests for LPAE page table allocator. This performs
+	  a series of page-table consistency checks.
 
 	  If unsure, say N here.
 
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 5250a2eea13f..ac3851570303 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
-obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST) += io-pgtable-arm-selftests.o
+obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST) += io-pgtable-arm-selftests.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
index 8361d01b49c5..334e70350924 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -9,7 +9,8 @@
 
 #define pr_fmt(fmt)	"arm-lpae io-pgtable: " fmt
 
-#include <linux/device/faux.h>
+#include <kunit/device.h>
+#include <kunit/test.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
 
@@ -42,12 +43,12 @@ static const struct iommu_flush_ops dummy_tlb_ops = {
 	.tlb_add_page	= dummy_tlb_add_page,
 };
 
-#define __FAIL(i) ({							\
-		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
-		-EFAULT;						\
+#define __FAIL(test, i) ({							\
+		KUNIT_FAIL(test, "test failed for fmt idx %d\n", (i));		\
+		-EFAULT;							\
 })
 
-static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
+static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 {
 	static const enum io_pgtable_fmt fmts[] = {
 		ARM_64_LPAE_S1,
@@ -63,7 +64,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
 		if (!ops) {
-			pr_err("selftest: failed to allocate io pgtable ops\n");
+			kunit_err(test, "failed to allocate io pgtable ops\n");
 			return -ENOMEM;
 		}
 
@@ -72,13 +73,13 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		 * Empty page tables shouldn't provide any translations.
 		 */
 		if (ops->iova_to_phys(ops, 42))
-			return __FAIL(i);
+			return __FAIL(test, i);
 
 		if (ops->iova_to_phys(ops, SZ_1G + 42))
-			return __FAIL(i);
+			return __FAIL(test, i);
 
 		if (ops->iova_to_phys(ops, SZ_2G + 42))
-			return __FAIL(i);
+			return __FAIL(test, i);
 
 		/*
 		 * Distinct mappings of different granule sizes.
@@ -91,16 +92,16 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 					   IOMMU_READ | IOMMU_WRITE |
 					   IOMMU_NOEXEC | IOMMU_CACHE,
 					   GFP_KERNEL, &mapped))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			/* Overlapping mappings */
 			if (!ops->map_pages(ops, iova, iova + size, size, 1,
 					    IOMMU_READ | IOMMU_NOEXEC,
 					    GFP_KERNEL, &mapped))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			iova += SZ_1G;
 		}
@@ -111,18 +112,18 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 			size = 1UL << j;
 
 			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			if (ops->iova_to_phys(ops, iova + 42))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			/* Remap full block */
 			if (ops->map_pages(ops, iova, iova, size, 1,
 					   IOMMU_WRITE, GFP_KERNEL, &mapped))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
-				return __FAIL(i);
+				return __FAIL(test, i);
 
 			iova += SZ_1G;
 		}
@@ -138,11 +139,11 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 				   IOMMU_READ | IOMMU_WRITE |
 				   IOMMU_NOEXEC | IOMMU_CACHE,
 				   GFP_KERNEL, &mapped))
-			return __FAIL(i);
+			return __FAIL(test, i);
 		if (mapped != size)
-			return __FAIL(i);
+			return __FAIL(test, i);
 		if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
-			return __FAIL(i);
+			return __FAIL(test, i);
 
 		free_io_pgtable_ops(ops);
 	}
@@ -150,7 +151,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	return 0;
 }
 
-static int arm_lpae_do_selftests(void)
+static void arm_lpae_do_selftests(struct kunit *test)
 {
 	static const unsigned long pgsize[] = {
 		SZ_4K | SZ_2M | SZ_1G,
@@ -163,18 +164,19 @@ static int arm_lpae_do_selftests(void)
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
@@ -183,9 +185,9 @@ static int arm_lpae_do_selftests(void)
 				cfg.pgsize_bitmap = pgsize[i];
 				cfg.ias = address_size[k];
 				cfg.oas = address_size[j];
-				pr_info("selftest: pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
-					pgsize[i], cfg.ias, cfg.oas);
-				if (arm_lpae_run_tests(&cfg))
+				kunit_info(test, "pgsize_bitmap 0x%08lx, IAS %u OAS %u\n",
+					   pgsize[i], cfg.ias, cfg.oas);
+				if (arm_lpae_run_tests(test, &cfg))
 					fail++;
 				else
 					pass++;
@@ -193,17 +195,20 @@ static int arm_lpae_do_selftests(void)
 		}
 	}
 
-	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
-	faux_device_destroy(dev);
-
-	return fail ? -EFAULT : 0;
+	kunit_info(test, "completed with %d PASS %d FAIL\n", pass, fail);
 }
 
-static void arm_lpae_exit_selftests(void)
-{
-}
+static struct kunit_case io_pgtable_arm_test_cases[] = {
+	KUNIT_CASE(arm_lpae_do_selftests),
+	{},
+};
+
+static struct kunit_suite io_pgtable_arm_test = {
+	.name = "io-pgtable-arm-test",
+	.test_cases = io_pgtable_arm_test_cases,
+};
+
+kunit_test_suite(io_pgtable_arm_test);
 
-subsys_initcall(arm_lpae_do_selftests);
-module_exit(arm_lpae_exit_selftests);
-MODULE_DESCRIPTION("io-pgtable-arm library selftest");
+MODULE_DESCRIPTION("io-pgtable-arm library kunit tests");
 MODULE_LICENSE("GPL");
-- 
2.51.1.930.gacf6e81ea2-goog


