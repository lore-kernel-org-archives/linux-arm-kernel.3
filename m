Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2756ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP/Bm+5e3mSkOukBBhCRTkrnvruqWsZSDU04xkfK8rg=; b=QxMluUcwoOyz+1hfj3Cfs95o4i
	oIqu0SQz579V70gmeks3Chn+VoSFoJtFS4qmXClAxmaAH3bdqc3+XSV4q3np4sQmautl2vaSa5pH0
	yGvo2I3PN3w3bGwF7viPQHosKJsjhlv2Bm0AnughB/SKtaMrSn2L1pASPwb/JwGYtXjind9dugqWS
	Gg89qpzjKJeEA/R4TaToYix3x9u5gjsyH2MrLI7AhxPWHue6PQ13DT5oBlakC2PQIHXD0iJfnAi/5
	YjEd25LDAC9AbbHmgY6HgAsGNs2t1jkALogXIZ9OyyWMKfUrr0Vnv1U4V581xKpZzervV+hWSXZXw
	tP3bRvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbF7-000000030G5-2Ffc;
	Fri, 19 Sep 2025 13:33:41 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbEu-0000000304y-2Duk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:33:29 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3ece0cb7c9cso1590352f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758288806; x=1758893606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DP/Bm+5e3mSkOukBBhCRTkrnvruqWsZSDU04xkfK8rg=;
        b=1Wfu3pFuyJ1r7J2W78KibSQdOu2EZbpkFb7tge30VYMQRDgFhEQtKB5NWpOQlN36lQ
         PI77KDLVmhE/BDaA5Ii20k4oDnak/A4803MZu5qBzfhOR3vdw38L5WgoduddjMX61Hbi
         QpqCGmGdr+vr3WFkhUimEss2Lvj5g72RtTfnaGM8hbWhk4rGVLJpmtYmSyWzICXiFIgj
         V4TH3lXxXzq+zXg0omRZzsHGdLgsuDrQ5PdC4MB9QRckKfR6CBCj0nXxbW2400xrFjhv
         1AAVIRgfZoZhC8c5/u3jqnUQon6pGC+WkCXDeun0H7jsG0iJvADQ9cWEAsosIIdSGfjV
         I/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288806; x=1758893606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DP/Bm+5e3mSkOukBBhCRTkrnvruqWsZSDU04xkfK8rg=;
        b=Dx/HrOSE6tc9Q300oCjH3GSQXRxaYd085zH/R4mi4hf4FI9VyfjjnPBjATxva4GOEO
         y2uFZkz7/Tp2xLulkzXgyWgdb42E/dw83vPqzNQ3Rwih7n+xxAviiNj+2+v6TvHUmvsq
         4LS1iroXUFZn9MhdpHGke9wBZ9FB09vP75pXWPrp17jNFeDVkJWeFX9mZJYltzKp9RLH
         t0SI5fzycd+YHpJI84ZNIjvp3wk2eTBod1IYXJbO+1euh9JE3yNV/WqP5eooSMKhO000
         Xg4CskW+1TZ9YDIy8P7hfJXBTJTCAzWP7iQjtkLHfbOh+HsRREtDJalRAmD+h6JzY/fa
         ScXg==
X-Forwarded-Encrypted: i=1; AJvYcCWj0Hjq5RLsdLGubC7XXwRXGwReXQ55/+3LMuB7QkyN1qHTpObLHqXDpkFV4vK/NTACV/9V7FFvFS6MVeqXX83E@lists.infradead.org
X-Gm-Message-State: AOJu0YwFazDw4oei5bnm6cK9wfEdCiR42+kz+La/vi1XbiqDauH2CBPg
	OQ3RoY22Q5I9GQ0VEI4e7XAnenjtppxe01olzTlGMhMe4YCUJK2z5mUHVI6/w73Pq3OvG9OY4IO
	EwuFoMCFSiTTn/w==
X-Google-Smtp-Source: AGHT+IGfd9H6PFBnWGC9u0o/DJ1VDVi6YMq0gft0vsd6mTOo7SapURN04FyPK7q0T/gUAS8fpfu5CNP10jZbcQ==
X-Received: from wrbgv25.prod.google.com ([2002:a05:6000:4619:b0:3ec:df9b:56a4])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400c:b0:3ea:9042:e682 with SMTP id ffacd0b85a97d-3ee7c55430amr2660786f8f.11.1758288806436;
 Fri, 19 Sep 2025 06:33:26 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:33:13 +0000
In-Reply-To: <20250919133316.2741279-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250919133316.2741279-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919133316.2741279-5-smostafa@google.com>
Subject: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_063328_611454_002D177C 
X-CRM114-Status: GOOD (  21.68  )
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

- Otherwise with CONFIG_IOMMU_IO_PGTABLE_KUNIT_TEST=m:
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
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/Kconfig                    | 10 +--
 drivers/iommu/Makefile                   |  2 +-
 drivers/iommu/io-pgtable-arm-selftests.c | 82 +++++++++++++-----------
 3 files changed, 51 insertions(+), 43 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 553522ef3ca9..f7e80c3c1f2a 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -40,12 +40,14 @@ config IOMMU_IO_PGTABLE_LPAE
 	  sizes at both stage-1 and stage-2, as well as address spaces
 	  up to 48-bits in size.
 
-config IOMMU_IO_PGTABLE_LPAE_SELFTEST
+config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
 	tristate "LPAE selftests"
-	depends on IOMMU_IO_PGTABLE_LPAE
+	select IOMMU_IO_PGTABLE_LPAE
+	depends on KUNIT
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
index 4c3dee4ba895..9d9acb91d823 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -6,7 +6,8 @@
  *
  * Author: Will Deacon <will.deacon@arm.com>
  */
-#include <linux/device/faux.h>
+#include <kunit/device.h>
+#include <kunit/test.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -48,13 +49,14 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
 }
 
-#define __FAIL(ops, i)	({						\
-		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
-		arm_lpae_dump_ops(ops);					\
-		-EFAULT;						\
+#define __FAIL(test, ops, i)	({						\
+		KUNIT_FAIL(test, "");						\
+		kunit_err(test, "selftest: test failed for fmt idx %d\n", (i));	\
+		arm_lpae_dump_ops(ops);						\
+		-EFAULT;							\
 })
 
-static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
+static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 {
 	static const enum io_pgtable_fmt fmts[] = {
 		ARM_64_LPAE_S1,
@@ -70,7 +72,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 		cfg_cookie = cfg;
 		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
 		if (!ops) {
-			pr_err("selftest: failed to allocate io pgtable ops\n");
+			kunit_err(test, "selftest: failed to allocate io pgtable ops\n");
 			return -ENOMEM;
 		}
 
@@ -79,13 +81,13 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
@@ -98,16 +100,16 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
@@ -118,18 +120,18 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
@@ -145,11 +147,11 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
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
@@ -157,7 +159,7 @@ static int arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	return 0;
 }
 
-static int arm_lpae_do_selftests(void)
+static void arm_lpae_do_selftests(struct kunit *test)
 {
 	static const unsigned long pgsize[] = {
 		SZ_4K | SZ_2M | SZ_1G,
@@ -170,18 +172,19 @@ static int arm_lpae_do_selftests(void)
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
@@ -190,9 +193,9 @@ static int arm_lpae_do_selftests(void)
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
@@ -200,17 +203,20 @@ static int arm_lpae_do_selftests(void)
 		}
 	}
 
-	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
-	faux_device_destroy(dev);
-
-	return fail ? -EFAULT : 0;
+	kunit_info(test, "selftest: completed with %d PASS %d FAIL\n", pass, fail);
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
 MODULE_DESCRIPTION("io-pgtable-arm library selftest");
 MODULE_LICENSE("GPL");
-- 
2.51.0.534.gc79095c0ca-goog


