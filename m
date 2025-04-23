Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B252C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0vKyl5GFtZQa62SIwU5D+7YsDfICv/NdcJuT9qeeKM=; b=ckUAKwKoTeq+YeKxq+JFelYn0y
	QF8YHqYoYNTFKOb/K4xNzOhNNrK52jIAeMAEt90hKyJ73T9E6ROBoqFtc9BJZo3V1u/PDfAORN5Dl
	GYAdM2Tnejj8tl+9Bl/o0B+ROPiRkoe4cNfSoFqZ5g0Pk/NtdzeKg62dHZ26BzpdIc6O6jRm+kLVl
	H+nS0Wnf9p/ZPCIs5yRqcpO0c5Y7turNmXcooi2rHt+EBqiCw7a+RQMO/uehAjDumWbRMNjWUgh6z
	au0VrcABZ3aapLiD4M88mpwSg1+BKwHGAiM0Ra3gt9ynrUksU6sxWGY2v0fcFeWFOORnbrtgyGhQm
	jayRoSJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7C-0000000BLEN-3xBz;
	Wed, 23 Apr 2025 17:42:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7br8-0000000AwGS-48cm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:17:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6242106F;
	Wed, 23 Apr 2025 08:17:40 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7A863F66E;
	Wed, 23 Apr 2025 08:17:43 -0700 (PDT)
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
Subject: [PATCH v2 1/9] coresight: tmc: Support atclk
Date: Wed, 23 Apr 2025 16:17:18 +0100
Message-Id: <20250423151726.372561-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423151726.372561-1-leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_081747_155964_CB153E9E 
X-CRM114-Status: GOOD (  19.73  )
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

The atclk is an optional clock for the CoreSight TMC, but the driver
misses to initialize it.  In most cases, TMC shares the atclk clock with
other CoreSight components.  Since these components enable the clock
before the TMC device is initialized, the TMC continues properly,
which is why we don’t observe any lockup issues.

This change enables atclk in probe of the TMC driver.  Given the clock
is optional, it is possible to return NULL if the clock does not exist.
IS_ERR() is tolerant for this case.

Dynamically disable and enable atclk during suspend and resume.  The
clock pointers will never be error values if the driver has successfully
probed, and the case of a NULL pointer case will be handled by the clock
core layer.  The driver data is always valid after probe. Therefore,
remove the related checks.  Also in the resume flow adds error handling.

Fixes: bc4bf7fe98da ("coresight-tmc: add CoreSight TMC driver")
Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 22 +++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 ++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index a7814e8e657b..ddca5ddf4ed2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
 
+	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
+	if (IS_ERR(drvdata->atclk))
+		return PTR_ERR(drvdata->atclk);
+
 	ret = -ENOMEM;
 
 	/* Validity for the resource is already checked by the AMBA core */
@@ -1019,18 +1023,26 @@ static int tmc_runtime_suspend(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
 	return 0;
 }
 
 static int tmc_runtime_resume(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
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
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..cbb4ba439158 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -210,6 +210,7 @@ struct tmc_resrv_buf {
 
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
+ * @atclk:	optional clock for the core parts of the TMC.
  * @pclk:	APB clock if present, otherwise NULL
  * @base:	memory mapped base address for this component.
  * @csdev:	component vitals needed by the framework.
@@ -244,6 +245,7 @@ struct tmc_resrv_buf {
  *		 Used by ETR/ETF.
  */
 struct tmc_drvdata {
+	struct clk		*atclk;
 	struct clk		*pclk;
 	void __iomem		*base;
 	struct coresight_device	*csdev;
-- 
2.34.1


