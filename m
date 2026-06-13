Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6C1CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRmyPRAFuevqTsUvI5TWwwBpkZJdoLOQStZBNs50ckM=; b=VvcNA84jSmJp8UNxaL1scATVuQ
	i5PiN9mLVF9Z3PvJAYV9OtvqtDg69h/NwAKgNZ2AiyLdtmiPYqPubRn+N+Byv08JuqB3Y68BlMoEW
	nMaLHTa3OA0nZ+ukgWsoHmu8vweW9y0yb7f1Encrs0nbNEb056FNzl7z3PjzvjoIYt/dkXZRcwBnf
	knOB6vVxoIMVKnZYAat7HaTZu/H4MZRmld43PPr01Noi31DyaxoOAlmkDpdeWkgYhXbi+pdt7B1gw
	IBtu0tP3SYvm3uK+ADgEcVSU3TAQjQzV8/ehIN1WPIo/ipNgnlpU+zUkdjXYuj0QQ2wfbwKEGIEaW
	PDpJkRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIKB-0000000C0q1-3LKx;
	Sat, 13 Jun 2026 06:58:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIK6-0000000C0lr-0lV0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490be03d47bso16719165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333908; x=1781938708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRmyPRAFuevqTsUvI5TWwwBpkZJdoLOQStZBNs50ckM=;
        b=InBXeg2Gu8yfBwn04op5gj4eixAZSkqUQcDdK8GUBK7GP8GoO8zdFydMLiGU0Vdbrt
         ASC3qofsZL5TGDn9rIrhA2cf0AcNzG/FdzG0pk4XBLJTmUsCVybFCuMdADVG0gONMHOx
         EBF0W5+rOdpccg7RWGMamK1Il9hAr5qsgpMeFSWg/TGfSDFUXaHu66QBVPpBpX26zYWC
         ZftZXMRgBGQlkQGaQHJHNGjXo+sE80VfCVQTI1/YvoMy3gBOfrvpBMapuiWJaHW7xp4D
         J9wmHW9t93lAtGp2ccKzuMtiMuYvwfZGhf92LsPrJNRMgPm/vFGjoVymNpqAkI+lKU0Z
         xcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333908; x=1781938708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CRmyPRAFuevqTsUvI5TWwwBpkZJdoLOQStZBNs50ckM=;
        b=A04n9RamoAwFQ9QRRQ65kai6WObn0UVgnBEvrvXypKK4koXRhzpeWPVWpWh5MSnIIy
         aZBNp7q4t4swvis0dPRhivk2NjRufa8tQwYcERrpcai9X2gYk+tyKdC9mMbZhK4SGuM7
         NHKAica09bc4P6eQ/8pq4xqVNi6tHJ0De0QJZVYZjNwdo8WWLKt4V1sQkkPTlrhlI12y
         wc3v9TQZCIO0HSCmVlJAJ3g+oqaa/4dzYiDqAe6WcBQXcBK/c9MQjqacpdBGJjZ+iAql
         6fAHaF/DB/fPFxM8pT9He585lJRHhcWV08SyLAmcnQjXOFjiwwJ/jbp51J9NwSciw6i7
         wszA==
X-Forwarded-Encrypted: i=1; AFNElJ/p2IW34hIXDsx4Nfq8sKfLK634FI7xuxciZ5XKjGIs1MyBvZO2JXkI9OtA8eAeDlLWhKIRlVbd3hHOfgBmD2Mu@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6XpiJIiMg+CyJZeoNZIbwCr/VAdUMkpNXOBtMHye0rQR8chn
	Kuo6PI6da8jZqGCiFW/+P2TeJ4H9nvvABjFxeXK/K5Vm5wK9pZxzxMBh
X-Gm-Gg: Acq92OET7SBCxPD/FpFdE0NdWaSwBwdZy6NZzRcAdu1sNa0q6kawIpNRjy/bOG4KcSO
	PchPInKZppKR23T0OOpZYmm4z4i6/HRIynjpR7moSWHVRraAHsipd9VB8tNZraSlXETxP08gT5F
	hl6DmzGAXtOSid1W/4zED/0fgq/6PxzJqCi8jWa/PuzwwMHSSaX8ELDTDU/itE/wx4siWWsFl/t
	dsa+OB7+jgHnFn5RrgwlKhHUE+abQsVwQxdrR8PPdSrMLyI8XHuLE35dNzMh2hsIiYCwj9ov5Rk
	KLgTBwUDT8PUZ/et+38pzwdnBT8by7fPthu6c9IgAgv1yPzqz4q6V2BXBaf5xPGUApDO5AWCXK9
	z/DsX41b7iMyMJ4FMR86zMuHp4syliWMjKqCxft2JyVrDRTo98B5CRAtLmkDUuiGkQEgGP3MiOk
	p579AdMHLI6AP7YkKqXADpqcuDOkoeXMN9onudZn85iQ==
X-Received: by 2002:a05:600d:8489:20b0:490:b724:507d with SMTP id 5b1f17b1804b1-490ec4cec11mr54479185e9.11.1781333908035;
        Fri, 12 Jun 2026 23:58:28 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:27 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 2/9] accel: rocket: Derive DMA width and core count from match data
Date: Sat, 13 Jun 2026 09:01:09 +0200
Message-Id: <20260613070116.438906-3-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235830_274766_8077DD42 
X-CRM114-Status: GOOD (  19.72  )
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

From: Midgy BALON <midgy971@gmail.com>

The probe already has the per-SoC match data, which now records the core
count and DMA width.  Use it for the cores array allocation and the
device DMA mask instead of re-scanning the device tree for available core
nodes.

While at it, reject a device tree that declares more NPU core nodes than
the SoC has, so the fixed-size cores array can never be overrun.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.h   |  2 ++
 drivers/accel/rocket/rocket_device.c | 15 +++++----------
 drivers/accel/rocket/rocket_device.h |  3 ++-
 drivers/accel/rocket/rocket_drv.c    | 13 ++++++++++++-
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index 8ee105a0be40e..d6421251670dc 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -16,9 +16,11 @@ struct rocket_core;
 
 /**
  * struct rocket_soc_data - per-SoC configuration data
+ * @num_cores: Number of NPU cores in this SoC.
  * @dma_bits: Physical address width reachable by the NPU's AXI master.
  */
 struct rocket_soc_data {
+	unsigned int num_cores;
 	unsigned int dma_bits;
 };
 
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index 46e6ee1e72c5f..6186f4faa3a2a 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -6,18 +6,16 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 
 #include "rocket_device.h"
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
-					 const struct drm_driver *rocket_drm_driver)
+					 const struct drm_driver *rocket_drm_driver,
+					 const struct rocket_soc_data *soc_data)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *core_node;
 	struct rocket_device *rdev;
 	struct drm_device *ddev;
-	unsigned int num_cores = 0;
 	int err;
 
 	rdev = devm_drm_dev_alloc(dev, rocket_drm_driver, struct rocket_device, ddev);
@@ -27,17 +25,14 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
 	ddev = &rdev->ddev;
 	dev_set_drvdata(dev, rdev);
 
-	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
-		if (of_device_is_available(core_node))
-			num_cores++;
-
-	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
+	rdev->cores = devm_kcalloc(dev, soc_data->num_cores, sizeof(*rdev->cores),
+				   GFP_KERNEL);
 	if (!rdev->cores)
 		return ERR_PTR(-ENOMEM);
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(soc_data->dma_bits));
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index ce662abc01d3d..2f74e078974e3 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -22,7 +22,8 @@ struct rocket_device {
 };
 
 struct rocket_device *rocket_device_init(struct platform_device *pdev,
-					 const struct drm_driver *rocket_drm_driver);
+					 const struct drm_driver *rocket_drm_driver,
+					 const struct rocket_soc_data *soc_data);
 void rocket_device_fini(struct rocket_device *rdev);
 #define to_rocket_device(drm_dev) \
 	((struct rocket_device *)(container_of((drm_dev), struct rocket_device, ddev)))
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 384c38e13acce..f0beed2d522c7 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -159,11 +159,15 @@ static const struct drm_driver rocket_drm_driver = {
 
 static int rocket_probe(struct platform_device *pdev)
 {
+	const struct rocket_soc_data *soc_data = of_device_get_match_data(&pdev->dev);
 	int ret;
 
+	if (!soc_data)
+		return -EINVAL;
+
 	if (rdev == NULL) {
 		/* First core probing, initialize DRM device. */
-		rdev = rocket_device_init(drm_dev, &rocket_drm_driver);
+		rdev = rocket_device_init(drm_dev, &rocket_drm_driver, soc_data);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to initialize rocket device\n");
 			return PTR_ERR(rdev);
@@ -172,6 +176,12 @@ static int rocket_probe(struct platform_device *pdev)
 
 	unsigned int core = rdev->num_cores;
 
+	if (core >= soc_data->num_cores) {
+		dev_err(&pdev->dev, "too many NPU core nodes (max %u)\n",
+			soc_data->num_cores);
+		return -EINVAL;
+	}
+
 	dev_set_drvdata(&pdev->dev, rdev);
 
 	rdev->cores[core].rdev = rdev;
@@ -214,6 +224,7 @@ static void rocket_remove(struct platform_device *pdev)
 }
 
 static const struct rocket_soc_data rk3588_soc_data = {
+	.num_cores = 3,
 	.dma_bits = 40,
 };
 
-- 
2.39.5


