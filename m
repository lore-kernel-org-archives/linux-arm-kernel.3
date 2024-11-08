Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616BD64077
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxCr4qQA4aC2h9ra2sShYbJDWFfOQvznIQb2Fcx2Nfs=; b=R1TSpyodgKxBAT+1Z/LWXr5gBG
	GSEae7v/gvNviWOOuh9ZchUZwuHT7vpJ1ugAqwmyJIx8uPOkBiTSUCGWNTo9+Af+a98Jidg/BFc9v
	V4WhoqUvnWVKGkncsoGRHH10HcbUjHNrGtR6eSCKbO9RBFgvVfaVMYHhxbCWLFXTdl2ov38Z+G5nY
	1yz9YwksMYZaye2yE4fG8o1+U3ETbndift5zjCR+mlwxOe8BGBNAgDjzSAkfmapCDcyLcv3e/ppSx
	1vnw/Oxs+4CUZltIXbDM04shtlh/H96C9c8OzzguYS810liUkEPFadWBBmHTyrPQWvytYfytAOhbh
	tklxL9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TmM-0000000BbYi-1jWa;
	Fri, 08 Nov 2024 18:32:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TkZ-0000000BbJw-2eGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:30:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0CE4153B;
	Fri,  8 Nov 2024 10:30:54 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B6A43F6A8;
	Fri,  8 Nov 2024 10:30:24 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] iommu/arm-smmu: Make instance lookup robust
Date: Fri,  8 Nov 2024 18:30:15 +0000
Message-Id: <9d2ec624a640c421e97334deff537a2e899356c7.1731088789.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1731088789.git.robin.murphy@arm.com>
References: <cover.1731088789.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_103027_847879_9A20494A 
X-CRM114-Status: GOOD (  17.81  )
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

Relying on the driver list was a cute idea for minimising the scope of
our SMMU device lookups, however it turns out to have a subtle flaw. The
SMMU device only gets added to that list after arm_smmu_device_probe()
returns success, so there's actually no way the iommu_device_register()
call from there could ever work as intended, even if it wasn't already
hampered by the fwspec setup not happening early enough.

Switch both arm_smmu_get_by_fwnode() implementations to use a platform
bus lookup instead, which *will* reliably work. Also make sure that we
don't register SMMUv2 instances until we've fully initialised them, to
avoid similar consequences of the lookup now finding a device with no
drvdata. Moving that code is also a perfect excuse to give it a little
dev_err_probe() tidyup as well.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

This should in theory replace 229e6ee43d2a ("iommu/arm-smmu: Defer
probe of clients after smmu device bound"), or at least allow it to be
reverted going forward.

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  4 +--
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 31 ++++++++++-----------
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 737c5b882355..b7dcb1494aa4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3171,8 +3171,8 @@ static struct platform_driver arm_smmu_driver;
 static
 struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 {
-	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
-							  fwnode);
+	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+
 	put_device(dev);
 	return dev ? dev_get_drvdata(dev) : NULL;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8321962b3714..aba315aa6848 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1411,8 +1411,8 @@ static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
 static
 struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 {
-	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
-							  fwnode);
+	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+
 	put_device(dev);
 	return dev ? dev_get_drvdata(dev) : NULL;
 }
@@ -2232,21 +2232,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 					i, irq);
 	}
 
-	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
-				     "smmu.%pa", &smmu->ioaddr);
-	if (err) {
-		dev_err(dev, "Failed to register iommu in sysfs\n");
-		return err;
-	}
-
-	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
-				    using_legacy_binding ? NULL : dev);
-	if (err) {
-		dev_err(dev, "Failed to register iommu\n");
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return err;
-	}
-
 	platform_set_drvdata(pdev, smmu);
 
 	/* Check for RMRs and install bypass SMRs if any */
@@ -2255,6 +2240,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	arm_smmu_device_reset(smmu);
 	arm_smmu_test_smr_masks(smmu);
 
+	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
+				     "smmu.%pa", &smmu->ioaddr);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register iommu in sysfs\n");
+
+	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
+				    using_legacy_binding ? NULL : dev);
+	if (err) {
+		iommu_device_sysfs_remove(&smmu->iommu);
+		return dev_err_probe(dev, err, "Failed to register iommu\n");
+	}
+
 	/*
 	 * We want to avoid touching dev->power.lock in fastpaths unless
 	 * it's really going to do something useful - pm_runtime_enabled()
-- 
2.39.2.101.g768bb238c484.dirty


