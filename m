Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DD6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hq76C0i0VFiKmpuymHUrXDuiHlVCseo0cE1S/KD2bKc=; b=hwbeJAcSWYD4cK2jMgZKD/tsKP
	j10GEIbBS3MUi9YcclTf5IIPdT0goOdJpzgKOlyquHltizoq4PExSCs4lMKsNK3rFYEadWIlpzbX0
	fLPttptpCWdn6uuVQGd9yuXNQeQ4GuaalumzpauyYXet0aR+e0+50VEPj3W5drp9oUqjGHusparWs
	sPMxT16valkLEQADK/cODff7uWUuc+GfFpaxfPJpY3eV881BA7TfiOnfNyhDKg33EJUstkDib1mEn
	Nu4RD2VFVM0+tenStdkdGitVXKUgtfTB/P4OZo12uE+cj8YR/VJUKZxi/FONxvvxOP/fWa7qmd99w
	G390Mtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EL0-0000000DtbY-3W1h;
	Fri, 11 Apr 2025 13:22:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dtt-0000000DonO-1Q4v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C80444DF;
	Fri, 11 Apr 2025 12:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873B7C4CEE2;
	Fri, 11 Apr 2025 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744376068;
	bh=lr+VhLf3eXJXBu37NmhSosbRGBfKF2EPlcRShgMJRbA=;
	h=From:To:Cc:Subject:Date:From;
	b=TdPxPKev03UUFySrQxT/GFeKWB+7u5ocABW13IchDRYBUzEp6eeDdTAvl/yId1hjN
	 LjOe6EafD6mB2dmf1r0ShO0aXU4lYlOlnEwMxPJQiw+J9yiH1VcywfFEE27RNg94pK
	 raYsx2DIaa+vKq0BjWx8OLfnrZx1cS1crT/Ug8Lzporamz5UOnflqv5RgTIHJwBtBk
	 E0Wy3g37/Izdj8/ZuT7yQCCuAcKgS44nW72bx/rWqVcRnNq4Irwej7+4N9gvQY9x7n
	 Y54gAWBWwDmXyYPFRkWoR/KMNYu24g5xtKHIE4FmC7cxzSmgIzjXMj4eHa6zdlHK7m
	 fOk7PWDK+KxeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Rob Clark <robdclark@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/io-pgtable-arm: dynamically allocate selftest device struct
Date: Fri, 11 Apr 2025 14:54:11 +0200
Message-Id: <20250411125423.1411061-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_055429_395879_9EC8343F 
X-CRM114-Status: GOOD (  16.50  )
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

From: Arnd Bergmann <arnd@arndb.de>

In general a 'struct device' is way too large to be put on the kernel
stack. Apparently something just caused it to grow a slightly larger,
which pushed the arm_lpae_do_selftests() function over the warning
limit in some configurations:

drivers/iommu/io-pgtable-arm.c:1423:19: error: stack frame size (1032) exceeds limit (1024) in 'arm_lpae_do_selftests' [-Werror,-Wframe-larger-than]
 1423 | static int __init arm_lpae_do_selftests(void)
      |                   ^

Change the function to use a dynamically allocated platform_device
instead of the on-stack device structure. The device is not actually
registered with the system, but is initialized enough to be used here.

Fixes: ca25ec247aad ("iommu/io-pgtable-arm: Remove iommu_dev==NULL special case")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iommu/io-pgtable-arm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7632c80edea6..9f3bf0b5e8da 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -1433,15 +1434,17 @@ static int __init arm_lpae_do_selftests(void)
 	};
 
 	int i, j, k, pass = 0, fail = 0;
-	struct device dev;
+	struct platform_device *pdev;
 	struct io_pgtable_cfg cfg = {
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
-		.iommu_dev = &dev,
 	};
 
-	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
-	set_dev_node(&dev, NUMA_NO_NODE);
+	pdev = platform_device_alloc("io-pgtable-test", 0);
+	if (!pdev)
+		return -ENOMEM;
+
+	cfg.iommu_dev = &pdev->dev;
 
 	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
 		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
@@ -1461,6 +1464,8 @@ static int __init arm_lpae_do_selftests(void)
 	}
 
 	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
+	platform_device_put(pdev);
+
 	return fail ? -EFAULT : 0;
 }
 subsys_initcall(arm_lpae_do_selftests);
-- 
2.39.5


