Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA87C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrQ2ljoFm2d+a0d/oN3ou2xmvRCECg6mUL/hAdwSdzo=; b=muHhbibWwCup/enShqy5oEzbOV
	/tqjbrL2s3JG/UTy5D2l692Lt/QaSqL6mWixuMC41YfLRGYy/IOp4dNZtq5RwIJgIRfVmslQlUgMa
	jWvTqPIq/+6nN6f9hZi+cxQhFOAUjtXOKT0bHYhDXDBOaymGDgomApoqpcbFMzq3g4N23D2XN+NR+
	O07WIllN+5MDUoeKLQWk33Cc0vDnOzr2ICjipT7bP91jE/JLMTgJ1+A3vZKUSF2WU9roGdISj3K09
	jxl2QCXfPc02eKuhhf4Btfh8SkQ0VgHisj3z/lNHnubPAaX/Ej+OW5Rtw4Wwf1wZbzc/LM346i6NF
	qFUIiWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0lb-00000008CoO-2C6l;
	Thu, 24 Jul 2025 18:34:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexmb-00000007pgk-2WBj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 15:22:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF8D31CC4;
	Thu, 24 Jul 2025 08:22:50 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F83A3F6A8;
	Thu, 24 Jul 2025 08:22:55 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 24 Jul 2025 16:22:35 +0100
Subject: [PATCH v5 05/10] coresight: Appropriately disable trace bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-arm_cs_fix_clock_v4-v5-5-63f648dae021@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370566; l=9799;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Unzx+X8kYvvG22acAc+m+Cy1GOMbnzgW9oH/2DOjrMs=;
 b=wz6ttu328Vb3WOs37aLPi8yhCDeaBGPlI5HgW3sW8Dcz73vV96qJegh8XtIGzaiMbVBSQh6G/
 HPa/dXL4Y8AAZhekeGD9ibbiq9luwuqy0uBmzDVu/HH2ZzRRxQ3Vr3m
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082257_723007_26D47146 
X-CRM114-Status: GOOD (  15.71  )
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

Some CoreSight components have trace bus clocks 'atclk' and are enabled
using clk_prepare_enable().  These clocks are not disabled when modules
exit.

As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
The benefit is the driver model layer can automatically disable and
release clocks.

Check the returned value with IS_ERR() to detect errors but leave the
NULL pointer case if the clock is not found.  And remove the error
handling codes which are no longer needed.

Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etb10.c      | 10 +++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++----
 drivers/hwtracing/coresight/coresight-funnel.c     | 36 +++++++---------------
 drivers/hwtracing/coresight/coresight-replicator.c | 34 ++++++--------------
 drivers/hwtracing/coresight/coresight-stm.c        |  9 ++----
 drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++----
 6 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index d5efb085b30d36b51ca591c1b595ef82481f5569..8e81b41eb22264f17606050fa8da277aae05c5cc 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -730,12 +730,10 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	dev_set_drvdata(dev, drvdata);
 
 	/* validity for the resource is already checked by the AMBA core */
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 1c6204e1442211be6f3d7ca34bd2251ba796601b..baba2245b1dfb31f4bf19080e20c33df3a5b854f 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -832,12 +832,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->spinlock);
 
-	drvdata->atclk = devm_clk_get(&adev->dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
 
 	drvdata->cpu = coresight_get_cpu(dev);
 	if (drvdata->cpu < 0)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 36fc4e991458c112521c4261d73f3e58e9a3f995..b044a4125310ba4f8c88df295ec3684ab266682f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -213,7 +213,6 @@ ATTRIBUTE_GROUPS(coresight_funnel);
 
 static int funnel_probe(struct device *dev, struct resource *res)
 {
-	int ret;
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
 	struct funnel_drvdata *drvdata;
@@ -231,12 +230,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
@@ -248,10 +244,8 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	 */
 	if (res) {
 		base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(base)) {
-			ret = PTR_ERR(base);
-			goto out_disable_clk;
-		}
+		if (IS_ERR(base))
+			return PTR_ERR(base);
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
@@ -261,10 +255,9 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	dev_set_drvdata(dev, drvdata);
 
 	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata)) {
-		ret = PTR_ERR(pdata);
-		goto out_disable_clk;
-	}
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
@@ -274,17 +267,10 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	desc.pdata = pdata;
 	desc.dev = dev;
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto out_disable_clk;
-	}
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
 
-	ret = 0;
-
-out_disable_clk:
-	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
-	return ret;
+	return 0;
 }
 
 static int funnel_remove(struct device *dev)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 6dd24eb10a94b0eb28f4f27afab845227e22b96c..9e8bd36e7a9a2fd061f41c56242ac2b11549daf5 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -219,7 +219,6 @@ static const struct attribute_group *replicator_groups[] = {
 
 static int replicator_probe(struct device *dev, struct resource *res)
 {
-	int ret = 0;
 	struct coresight_platform_data *pdata = NULL;
 	struct replicator_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -238,12 +237,9 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
@@ -255,10 +251,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	 */
 	if (res) {
 		base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(base)) {
-			ret = PTR_ERR(base);
-			goto out_disable_clk;
-		}
+		if (IS_ERR(base))
+			return PTR_ERR(base);
 		drvdata->base = base;
 		desc.groups = replicator_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
@@ -272,10 +266,8 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	dev_set_drvdata(dev, drvdata);
 
 	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata)) {
-		ret = PTR_ERR(pdata);
-		goto out_disable_clk;
-	}
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
@@ -286,17 +278,11 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.dev = dev;
 
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto out_disable_clk;
-	}
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
 
 	replicator_reset(drvdata);
-
-out_disable_clk:
-	if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
-	return ret;
+	return 0;
 }
 
 static int replicator_remove(struct device *dev)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index f2de16e4d3b4cc0fc3fa06654fc7ddd9dee1e302..275d67b91dfd58002918c3e0ec0be077467c601a 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -842,12 +842,9 @@ static int __stm_probe(struct device *dev, struct resource *res)
 	if (!drvdata)
 		return -ENOMEM;
 
-	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index b2559c6fac6d2f02e0038e583cd324d7165c5aee..8d6179c83e5d3194d1f90e10c88fcc1faccf0cd7 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -128,7 +128,6 @@ static const struct coresight_ops tpiu_cs_ops = {
 
 static int __tpiu_probe(struct device *dev, struct resource *res)
 {
-	int ret;
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
 	struct tpiu_drvdata *drvdata;
@@ -144,12 +143,9 @@ static int __tpiu_probe(struct device *dev, struct resource *res)
 
 	spin_lock_init(&drvdata->spinlock);
 
-	drvdata->atclk = devm_clk_get(dev, "atclk"); /* optional */
-	if (!IS_ERR(drvdata->atclk)) {
-		ret = clk_prepare_enable(drvdata->atclk);
-		if (ret)
-			return ret;
-	}
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
 
 	drvdata->pclk = coresight_get_enable_apb_pclk(dev);
 	if (IS_ERR(drvdata->pclk))

-- 
2.34.1


