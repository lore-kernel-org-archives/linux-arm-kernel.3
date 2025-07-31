Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLpNMv+bZEByGALEhb1heH4DJO2biHzK5MVcBfwImB0=; b=WGZD5aqhObRWjcR7cdr9sBn2Kk
	1LxOHPT0ciF+k+q1tcYSTr1der6cz7/K2GeWVhhpywGY5jxCPrkGdDF/X67ZyVbx1dDe1gyhSgVgl
	Spvg9tXcvmG1IFCObkSvcx+/bd9aM0GoHQIykmOp+SDM1YavHypo6rNKxrC/SDpXpcFG9fUzy6Yxz
	j5+5+TLa8SlAGzJe8wZjIRlXyLY3qFZ4RNk7NF1fhSJVAKg+/MmithigWiN9qj7gzVmnxDWutwYH9
	t78Mrlt8t6XaEKe9ituuOr3DImuhhafFYy80/efK5Q2MvBFZeTFcPXCL1+jpPxXzYuc67i+ZrrCb5
	jYXUQrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSYz-00000003bfp-38l8;
	Thu, 31 Jul 2025 12:39:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSKE-00000003ZHu-1x7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:23:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74FB2BC3;
	Thu, 31 Jul 2025 05:23:49 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5378B3F77D;
	Thu, 31 Jul 2025 05:23:56 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 13:23:39 +0100
Subject: [PATCH v6 03/10] coresight: etm4x: Support atclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_cs_fix_clock_v4-v6-3-1dfe10bb3f6f@arm.com>
References: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
In-Reply-To: <20250731-arm_cs_fix_clock_v4-v6-0-1dfe10bb3f6f@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753964630; l=3527;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Vzt9Vj1KRivQZywVEZNoWvXi0zeDwDE/e7tEQlILTqo=;
 b=HtWuY4PrNfzEfoxG22+J4yGsImamJ6nCm6a1cuPejlC42JkmwbT3PoeErubPYZuLW90HOsWAP
 IQszg25EIZwAoDvvv3aJkrECY54F2183PUxlRyxlCQz7mEChz9EKaYj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_052358_633395_810B05FC 
X-CRM114-Status: GOOD (  19.06  )
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

The atclk is an optional clock for the CoreSight ETMv4, but the driver
misses to initialize it.

This change enables atclk in probe of the ETMv4 driver, and dynamically
control the clock during suspend and resume.

No need to check the driver data and clock pointer in the runtime
suspend and resume, so remove checks.  And add error handling in the
resume function.

Add a minor fix to the comment format when adding the atclk field.

Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 20 +++++++++++++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index cbea200489c8f3676d08c6bc6334ecd71d2569ca..36cbf60f24f1e86b466c9c216d33c74393f65504 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2216,6 +2216,10 @@ static int etm4_probe(struct device *dev)
 	if (WARN_ON(!drvdata))
 		return -ENOMEM;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
@@ -2464,8 +2468,8 @@ static int etm4_runtime_suspend(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
@@ -2473,11 +2477,17 @@ static int etm4_runtime_suspend(struct device *dev)
 static int etm4_runtime_resume(struct device *dev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata->pclk && !IS_ERR(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
 
-	return 0;
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d905fa365203bd35f1d839b03292f..96c14ec26893a489a96c7acfe9ba308e0e890917 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -919,7 +919,8 @@ struct etmv4_save_state {
 
 /**
  * struct etm4_drvdata - specifics associated to an ETM component
- * @pclk        APB clock if present, otherwise NULL
+ * @pclk:       APB clock if present, otherwise NULL
+ * @atclk:      Optional clock for the core parts of the ETMv4.
  * @base:       Memory mapped base address for this component.
  * @csdev:      Component vitals needed by the framework.
  * @spinlock:   Only one at a time pls.
@@ -988,6 +989,7 @@ struct etmv4_save_state {
  */
 struct etmv4_drvdata {
 	struct clk			*pclk;
+	struct clk			*atclk;
 	void __iomem			*base;
 	struct coresight_device		*csdev;
 	raw_spinlock_t			spinlock;

-- 
2.34.1


