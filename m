Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7652AC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USA7u0YQM6oG7EAU6cRFbKheGPOdERNsFibgfdO1GPw=; b=QULgtbnx6nwfFBIzxp3rxWVJ1E
	17hjZZBwa09xxFa8tzh9zEh/bQrFlfVAiA/F/DminacRiBk4NZfs9NxenNEhH1UzipUycD0VFSURT
	Q1ibBzMDVrt2SDNvXbVcl/LFje2+uHdEj6Lfuc0BkMghgmNN3h5nl/TwgWiR0b4R8kgz8ER4oLY9e
	3I/SNsNL7qkeT1CjbBiIK/Ef2cYaDLAlcvSAyZaBz08hr399nUVLtq2GjjkzLSneimNW3Xv4dwnXi
	ni5S0A4iLhGO9BdDhcd3BWNUcU8Itc6mkv1tii0i73HXti/aShGoM+GXqgmr9eDZ+nOzSinSc00d4
	fQ0mEjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezin-000000088Cn-0kHR;
	Thu, 24 Jul 2025 17:27:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexmg-00000007pjA-3QyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D8E71A00;
	Thu, 24 Jul 2025 08:22:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E18053F6A8;
	Thu, 24 Jul 2025 08:23:00 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 24 Jul 2025 16:22:38 +0100
Subject: [PATCH v5 08/10] coresight: Refactor driver data allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-arm_cs_fix_clock_v4-v5-8-63f648dae021@arm.com>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
In-Reply-To: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370566; l=6211;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Bkyx16zAC/Zhi8k6mZ50LLP67jxDf1yRoCusQNuxLg8=;
 b=mqTeL3QrEwhkxBOQPleM2nVX79I3WyBT0KsuVi2K6LreWVw8o8S+JSbZTwC+0dduDkINfKmN/
 uBcOOW+BpXHDfiu95XCvWTj4PR7O7h0g27dbnmF8F+zdk4ss186mA3M
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082302_948327_DBB3CBDC 
X-CRM114-Status: GOOD (  12.99  )
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

The driver data no longer needs to be allocated separately in the static
and dynamic probes. Moved the allocation into the low-level functions to
avoid code duplication.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c      | 20 +++++++-------------
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 21 +++++++--------------
 drivers/hwtracing/coresight/coresight-tmc-core.c  | 20 +++++++-------------
 3 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 0f476a0cbd740c233d039c5c411ca192681e2023..a3ccb7034ae14d7339bc2549bccadf11e28c45e2 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -515,11 +515,17 @@ static int __catu_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
 	u32 dma_mask;
-	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct catu_drvdata *drvdata;
 	struct coresight_desc catu_desc;
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
 	if (ret)
 		return ret;
@@ -580,14 +586,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
 
 static int catu_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct catu_drvdata *drvdata;
 	int ret;
 
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	ret = __catu_probe(&adev->dev, &adev->res);
 	if (!ret)
 		pm_runtime_put(&adev->dev);
@@ -627,18 +627,12 @@ static struct amba_driver catu_driver = {
 static int catu_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct catu_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	dev_set_drvdata(&pdev->dev, drvdata);
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 5f6db2fb95d4623a0bab08828ae00442870abd7d..3edfb5d3d02056afcaab4da575d1101c68aeac80 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -562,10 +562,16 @@ static void debug_func_exit(void)
 
 static int __debug_probe(struct device *dev, struct resource *res)
 {
-	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
+	struct debug_drvdata *drvdata;
 	void __iomem *base;
 	int ret;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
 	if (ret)
 		return ret;
@@ -629,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
 
 static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct debug_drvdata *drvdata;
-
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	return __debug_probe(&adev->dev, &adev->res);
 }
 
@@ -694,14 +693,8 @@ static struct amba_driver debug_driver = {
 static int debug_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct debug_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 25c987e2d114881a4e4d8f6ed1791d183a64da5a..36599c431be6203e871fdcb8de569cc6701c52bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -775,10 +775,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	u32 devid;
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tmc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
 	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
 	if (ret)
 		return ret;
@@ -888,14 +894,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 
 static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	struct tmc_drvdata *drvdata;
 	int ret;
 
-	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	amba_set_drvdata(adev, drvdata);
 	ret = __tmc_probe(&adev->dev, &adev->res);
 	if (!ret)
 		pm_runtime_put(&adev->dev);
@@ -972,14 +972,8 @@ static struct amba_driver tmc_driver = {
 static int tmc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct tmc_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);

-- 
2.34.1


