Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDFFC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5mooXssIfONamFT13G1WImO+CZOWJEhgLulOiiLxr0=; b=3se8C8jHHamvfcCKIVKNI1fxTR
	iym88WHX5xF4z9ak0CxM3/U7H85UvYlhjHB5OnCKsucCqy/5A2T8PEaB0HhNiHV4Jkxigc4etRT0u
	Zf0aVfZtEZm+xLHaHgJk+iLXhBRDdfNUzsbU5kD9jyEf43oR5mi8XOVYQ+TWcbjdDMwBWwBJHxaeK
	qq08I5plEPqknrHrVevN3FxmkFmUrPUjim7W9lepJe8lCqV/qo1hM8lxJmM9+/n55szf7jUx7n6Xc
	ULcpzntiVb5di7ANl6ahVxf9jHH+Z9fvWBctbsvMvewZP2Fdgw7iRp3uvawCG2Sj0RMpqaDb27jw3
	ccwH2mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRIt-00000003n5i-3weQ;
	Fri, 23 May 2025 12:15:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRGp-00000003moH-3fbv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C0E4A4F765;
	Fri, 23 May 2025 12:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84FDC4CEE9;
	Fri, 23 May 2025 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002382;
	bh=hcgJywXUeqcfDYKiMg3vHV01/zX3zwztfEiViOg12aE=;
	h=From:To:Cc:Subject:Date:From;
	b=qcmuQ6FUdDpddr5PnkdyEGBTodooVk9KnxKHBGspPYq9i7COvkSZe0MALo22vQ7M2
	 4WO9QXIYgdFKj6M3pXQL0RlfPYeRsbNINEjxh+UamxbQPyXgvHSuHOZ8o8V1i+d0G0
	 6j+wKXoMeIKHbJj0copuFoNuDcVOyn3CeqvNvC4p8rAEOfifwU7RdxzYijOnKCiTMG
	 oRhrIi/XsJ0UAtrJ/82A3hFIK02EQECEi3QWJhQogroBDEKQLYoKaJfxEYF/nNAr0l
	 W0EJqm5gQ9ljEZm3uCbdEhYl3+vUuYksaPc0QeffPw7Q4uJUTueqmBOJ1XM29wP10L
	 iJiAOZG2movLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Rolf Eike Beer <eb@emlix.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: arm: fix building smmuv3 as loadable module
Date: Fri, 23 May 2025 14:12:53 +0200
Message-Id: <20250523121257.2340274-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_051303_973721_3165D322 
X-CRM114-Status: GOOD (  13.48  )
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

The smmu-v3 kunit test fail to link when the SMMU driver is configured
as a loadable mdoule:

ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!

The problem is that the drivers/iommu/arm/arm-smmu-v3/Makefile only gets
parsed while building modules, but the driver itself is accidentally marked
as built-in unconditionally, so not only does the kunit test fail, but the
entire driver is missing.

Change the driver configuration back to $(CONFIG_ARM_SMMU_V3) so it
actually gets build here.

Fixes: e436576b0231 ("iommu: make inclusion of arm/arm-smmu-v3 directory conditional")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 6cc7c8557b9e..493a659cc66b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += arm_smmu_v3.o
+obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
 arm_smmu_v3-y := arm-smmu-v3.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
-- 
2.39.5


