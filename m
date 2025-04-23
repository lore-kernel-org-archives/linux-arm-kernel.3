Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87311C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdnSMw6us/ZpbE+Qa7Hkni51lBgmLWFKTV+3tmiDHKc=; b=G3cZWovzYvrqktlMfyO4mgZNS6
	MpAJw/jYnKF6TlUufklJivkHV2l6KYgfdl1InO5pc7HJRuWfWm9VJTOHsSfcKPlIvYuf+wrKFVoDR
	DZ2psM2ohhbrwcRnlC6BTqmz3hb4fYzx9/V13//68yrInAB+Z+gFmGPbAzl5TWD0lMCFQaRnxUvrZ
	ZincV4AEynJXWSGUwJpvrG1LjNwhfcuhCcWsNf1L+yvQXV2OTfOLGy4bveYblid+IiKcEnDsLSpD0
	wPemmSXDCRK4axSME9ik8uMVoMyoVmIVSjWYXjFsJgvPE5yZiYlZb4nOmCu9N7x3ldVVivjgYQBat
	0zCQLA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e94-0000000BOUw-3qfI;
	Wed, 23 Apr 2025 17:44:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dGz-0000000BBR6-379u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFFCC5C597C;
	Wed, 23 Apr 2025 16:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DA3C4CEE8;
	Wed, 23 Apr 2025 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745426912;
	bh=DT2vdXkm5UTmWS58pbDzSP2uTIp7fiBR1eJQ+9e9UMI=;
	h=From:To:Cc:Subject:Date:From;
	b=kpQSXkaICpkzZ85VDQxj7jy1Bsx9d36+2o7RD6suAZam+Qz8iAU3ZXGGMEoI84UjR
	 S9+zC70OJ0b4r4Prz6c8evH4/Dlu/YJd6rphhF4ecKgW2xw2iFiw/780ZHEKec8DPg
	 g6rD9pD0TKJAtYfc8Yiwr3I314Vf55tVWwPuhG9WNHhP2oJTmYBfZBcR03qoUh5WZp
	 sd2vF53MvXxmqLsE7hEOhoKFBgDxc5cRr4sv5vMyBBQyt+Kco4pL/GBlmaIIb/Xk96
	 37uYkmpUqvJ/FBbbj3rsYnX4of6vmJrPIciBEklfktvC+w/i9aS9faia7MedbplwI3
	 F6amN7bzOvcgQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Rob Clark <robdclark@chromium.org>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] iommu/io-pgtable-arm: dynamically allocate selftest device struct
Date: Wed, 23 Apr 2025 18:48:16 +0200
Message-Id: <20250423164826.2931382-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_094833_896125_B42D3E12 
X-CRM114-Status: GOOD (  16.30  )
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

Change the function to use a dynamically allocated faux_device
instead of the on-stack device structure.

Fixes: ca25ec247aad ("iommu/io-pgtable-arm: Remove iommu_dev==NULL special case")
Link: https://lore.kernel.org/all/ab75a444-22a1-47f5-b3c0-253660395b5a@arm.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use faux device instead of platform_device, as Robin suggested.
    The faux device is more appropriate here since the is no actual physical
    device, though on the other hand the v1 patch had the advantage of not
    actually needing to register the device.
---
 drivers/iommu/io-pgtable-arm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 545229cf62d2..bbd42323c029 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/device/faux.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -1437,15 +1438,17 @@ static int __init arm_lpae_do_selftests(void)
 	};
 
 	int i, j, k, pass = 0, fail = 0;
-	struct device dev;
+	struct faux_device *dev;
 	struct io_pgtable_cfg cfg = {
 		.tlb = &dummy_tlb_ops,
 		.coherent_walk = true,
-		.iommu_dev = &dev,
 	};
 
-	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
-	set_dev_node(&dev, NUMA_NO_NODE);
+	dev = faux_device_create("io-pgtable-test", NULL, 0);
+	if (!dev)
+		return -ENOMEM;
+
+	cfg.iommu_dev = &dev->dev;
 
 	for (i = 0; i < ARRAY_SIZE(pgsize); ++i) {
 		for (j = 0; j < ARRAY_SIZE(address_size); ++j) {
@@ -1465,6 +1468,8 @@ static int __init arm_lpae_do_selftests(void)
 	}
 
 	pr_info("selftest: completed with %d PASS %d FAIL\n", pass, fail);
+	faux_device_destroy(dev);
+
 	return fail ? -EFAULT : 0;
 }
 subsys_initcall(arm_lpae_do_selftests);
-- 
2.39.5


