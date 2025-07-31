Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7439C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xviOTq8ysB+92oBG9CCV3kb0Zv6liiDdaUQXROK8AI=; b=Op7k41QoarxSLkcZmEfY0x+spG
	oisWi3Msm5MZYTYaz+wtlaRaGO/bJyR14y2j0Sy7R/UqOw+zxlUyewm7ryz5Fs2e679gC0YzQP0qP
	mII07Z5dGNSgXS8DwxNe8ufGnhWL+gFqB0Rp20Mqe3icWoXDnTj2jAtJ5u8aDIogrLMG+u/axaPqt
	YDBfbzKJwskJSE5Z0A9JcmUq+oTB8ieN8PQevXjpXtpxnDLJWHEQQAaMQXS9GHpjzIN1fPqk3A8Q7
	uDPzvBc0+cnImg5C84FuA0bxeK33m1KP0z/c3bkXR/pYqsCWWA+Bh1yEk599Uf5p9jmPCc98Tmv8g
	vLG28K5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSWQ-00000003bPU-3i0d;
	Thu, 31 Jul 2025 12:36:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSKC-00000003ZHJ-3fzz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:23:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AE612C41;
	Thu, 31 Jul 2025 05:23:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69BCA3F673;
	Thu, 31 Jul 2025 05:23:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 13:23:38 +0100
Subject: [PATCH v6 02/10] coresight: catu: Support atclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_cs_fix_clock_v4-v6-2-1dfe10bb3f6f@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753964630; l=2806;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=32YBZVpnq5FoHjaGA4Y0J5jJQ8sAi9FM2wJFn8p9BiY=;
 b=Txoj5ztL+U6zLYwQwYDKI82ZQMH3VC8kBd+sHj4jEsBwt+T5473czgVPrapRih1eCkvRI0X+m
 gasl89v68Y2DOTUeA/YZdgqHRvNeW7ERmSrUO3GrCx9fYD8OJsF6TR+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_052357_039136_40F740FE 
X-CRM114-Status: GOOD (  16.08  )
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

The atclk is an optional clock for the CoreSight CATU, but the driver
misses to initialize it.

This change enables atclk in probe of the CATU driver, and dynamically
control the clock during suspend and resume.

The checks for driver data and clocks in suspend and resume are not
needed, remove them.  Add error handling in the resume function.

Fixes: fcacb5c154ba ("coresight: Introduce support for Coresight Address Translation Unit")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 22 +++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-catu.h |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 5058432233da1932f1965008fc1b98b560490414..af2a55f0c907c392d092a50612b23c115a1b0f5f 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -520,6 +520,10 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	struct coresight_platform_data *pdata = NULL;
 	void __iomem *base;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
 	if (!catu_desc.name)
 		return -ENOMEM;
@@ -668,18 +672,26 @@ static int catu_runtime_suspend(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
 	return 0;
 }
 
 static int catu_runtime_resume(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 755776cd19c5bb724845ca586ace1e0b29e72556..6e6b7aac206dcae9ff062355e50179637b4d1703 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -62,6 +62,7 @@
 
 struct catu_drvdata {
 	struct clk *pclk;
+	struct clk *atclk;
 	void __iomem *base;
 	struct coresight_device *csdev;
 	int irq;

-- 
2.34.1


