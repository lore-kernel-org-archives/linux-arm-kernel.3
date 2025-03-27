Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47806C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LW1DPaAe0hjqoHGmNxMZCZwBddjuiwd4qsPqFFubmoI=; b=BFun8shFVeFhEf4K9YiRz/Ylxx
	mpA5y3hMpgx5qSM92DnGsGlGKSYqY2NSul38fubVoRSkQX/y7s18QdBDXNKh4ZrHumiqeC/wU12ol
	gUZBxgoE0RE0fXavQv2erdbmBrWjUZVGmDbyi9hAb9L6gOirmtmYeF3tq965V4yJpLxiCyiOxPrMF
	SUUqAH+bMQLE6rVadnAD+uaRsSjiXAbcpURFjREgdSg6UIn6CGqLDXnEnW59bCzjVwBQmPVn+rfPz
	Vg+/E9qVobTZ8kOWp4h11kbARCjf1hR1ymXUfpCevR31l6BDx5qqrlXca+pc0DrJLgdsA1bg5CwzN
	KHq/uedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlr9-0000000AtNA-28bW;
	Thu, 27 Mar 2025 11:57:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlZJ-0000000AqKP-2Ru1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 11:38:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615CF1762;
	Thu, 27 Mar 2025 04:38:46 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45C4A3F58B;
	Thu, 27 Mar 2025 04:38:39 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 9/9] coresight: Consolidate clock enabling
Date: Thu, 27 Mar 2025 11:38:03 +0000
Message-Id: <20250327113803.1452108-10-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327113803.1452108-1-leo.yan@arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_043842_130220_F5E4A671 
X-CRM114-Status: GOOD (  19.15  )
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

CoreSight drivers enable pclk and atclk conditionally.  For example,
pclk is only enabled in the static probe, while atclk is an optional
clock that it is enabled for both dynamic and static probes, if it is
present.  In the current CoreSight drivers, these two clocks are
initialized separately.  This causes complex and duplicate codes.

This patch consolidates clock enabling into a central place.  It renames
coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
encapsulates clock initialization logic:

 - If a clock is initialized successfully, its clock pointer is assigned
   to the double pointer passed as an argument.
 - If pclk is skipped for an AMBA device, or if atclk is not found, the
   corresponding double pointer is set to NULL.  The function returns
   Success (0) to guide callers can proceed with no error.
 - Otherwise, an error number is returned for failures.

CoreSight drivers are refined so that clocks are initialized in one go.
As a result, driver data no longer needs to be allocated separately in
the static and dynamic probes.  Moved the allocation into a low-level
function to avoid code duplication.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 30 ++++++++++--------------------
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 +++++++++++------------------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
 drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
 drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
 drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 ++++++++++--------------------
 drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
 include/linux/coresight.h                          | 38 +++++++++++++++++++++++++++-----------
 10 files changed, 81 insertions(+), 106 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index c0a51ab0312c..c63dee1ac997 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -508,14 +508,20 @@ static int __catu_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
 	u32 dma_mask;
-	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct catu_drvdata *drvdata;
 	struct coresight_desc catu_desc;
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
 	if (!catu_desc.name)
@@ -571,14 +577,8 @@ static int __catu_probe(struct device *dev, struct resource *res)
 
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
@@ -618,22 +618,12 @@ static struct amba_driver catu_driver = {
 static int catu_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct catu_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
-	dev_set_drvdata(&pdev->dev, drvdata);
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 5f90351778ee..dff663ac7805 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -562,10 +562,20 @@ static void debug_func_exit(void)
 
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
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, NULL);
+	if (ret)
+		return ret;
+
 	drvdata->cpu = coresight_get_cpu(dev);
 	if (drvdata->cpu < 0)
 		return drvdata->cpu;
@@ -625,13 +635,6 @@ static int __debug_probe(struct device *dev, struct resource *res)
 
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
 
@@ -690,18 +693,8 @@ static struct amba_driver debug_driver = {
 static int debug_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct debug_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index edd93ff2d3c5..c586495e9a08 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -188,7 +188,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	const struct ctcu_config *cfgs;
 	struct ctcu_drvdata *drvdata;
 	void __iomem *base;
-	int i;
+	int i, ret;
 
 	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
 	if (!desc.name)
@@ -207,9 +207,9 @@ static int ctcu_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->apb_clk))
-		return PTR_ERR(drvdata->apb_clk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->apb_clk, NULL);
+	if (ret)
+		return ret;
 
 	cfgs = of_device_get_match_data(dev);
 	if (cfgs) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index ff4ac4b686c4..ba5d1a015140 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2145,13 +2145,14 @@ static int etm4_probe(struct device *dev)
 	struct csdev_access access = { 0 };
 	struct etm4_init_arg init_arg = { 0 };
 	struct etm4_init_arg *delayed;
+	int ret;
 
 	if (WARN_ON(!drvdata))
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
@@ -2235,10 +2236,6 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
 	if (res) {
 		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(drvdata->base))
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index fd60491c9a19..6494a3b5d18e 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -217,6 +217,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	struct funnel_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
@@ -230,13 +231,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	/*
 	 * Map the device base for dynamic-funnel, which has been
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index aeb2b3d8e210..8595dc104795 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -223,6 +223,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	struct replicator_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
 	void __iomem *base;
+	int ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
@@ -237,13 +238,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	/*
 	 * Map the device base for dynamic-replicator, which has been
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index d589fc61a00e..f859ab932d22 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -842,13 +842,10 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	base = devm_ioremap_resource(dev, res);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 86ea3fea7abb..745d33d0646f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -785,13 +785,19 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	u32 devid;
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
-	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tmc_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
 	ret = -ENOMEM;
 
@@ -897,14 +903,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 
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
@@ -981,18 +981,8 @@ static struct amba_driver tmc_driver = {
 static int tmc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct tmc_drvdata *drvdata;
 	int ret = 0;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
-
-	dev_set_drvdata(&pdev->dev, drvdata);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 5821ae73a34a..a68ed6b97bf7 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -132,6 +132,7 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	struct tpiu_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret;
 
 	desc.name = coresight_alloc_device_name(&tpiu_devs, dev);
 	if (!desc.name)
@@ -143,13 +144,10 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 
 	spin_lock_init(&drvdata->spinlock);
 
-	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
-	if (IS_ERR(drvdata->atclk))
-		return PTR_ERR(drvdata->atclk);
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
 
-	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
-	if (IS_ERR(drvdata->pclk))
-		return PTR_ERR(drvdata->pclk);
 	dev_set_drvdata(dev, drvdata);
 
 	/* Validity for the resource is already checked by the AMBA core */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 26eb4a61b992..cf3fbbc0076a 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -471,25 +471,41 @@ static inline bool is_coresight_device(void __iomem *base)
 }
 
 /*
- * Attempt to find and enable "APB clock" for the given device
+ * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
+ * for the given device.
  *
- * Returns:
+ * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
+ * skip to get and enable the pclk for an AMBA device.
  *
- * clk   - Clock is found and enabled
- * NULL  - Clock is not needed as it is managed by the AMBA bus driver
- * ERROR - Clock is found but failed to enable
+ * atclk is an optional clock, it will be only enabled when it is existed.
+ * Otherwise, a NULL pointer will be returned to caller.
+ *
+ * Returns: '0' on Success; Error code otherwise.
  */
-static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
+static inline int coresight_get_enable_clocks(struct device *dev,
+					      struct clk **pclk,
+					      struct clk **atclk)
 {
-	struct clk *pclk = NULL;
+	WARN_ON(!pclk);
 
 	if (!dev_is_amba(dev)) {
-		pclk = devm_clk_get_enabled(dev, "apb_pclk");
-		if (IS_ERR(pclk))
-			pclk = devm_clk_get_enabled(dev, "apb");
+		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
+		if (IS_ERR(*pclk))
+			*pclk = devm_clk_get_enabled(dev, "apb");
+		if (IS_ERR(*pclk))
+			return PTR_ERR(*pclk);
+	} else {
+		/* Don't enable pclk for an AMBA device */
+		*pclk = NULL;
 	}
 
-	return pclk;
+	if (atclk) {
+		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
+		if (IS_ERR(*atclk))
+			return PTR_ERR(*atclk);
+	}
+
+	return 0;
 }
 
 #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))
-- 
2.34.1


