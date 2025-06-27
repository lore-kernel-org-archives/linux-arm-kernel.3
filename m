Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80F1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQzuBmHUidNeWn0IowK1QHhHAGDyOzJjBbdBPRqdCDs=; b=LYmqRoJG2QcgfDRyEIabYVoyuf
	hfzjfJk5VBUVoMbxuz9gmmwVQWwt20WKPurlzFh/ilIbRfq+Ok25d7q1Yz9y8nhOuMyGVk3LNE85X
	kzUg9caS+jJzP2KnDMtey7rFQYN/2NE8VAjTe8TnRI8mY/yZTBh6jzFyFA46hcF7OQ1mwoUDTE835
	q4A+hpELt0JSTnvQaKVmjvBjTxmrQiGjh9wuqa99aYx9RjjAWHtJOzoIxDeXrV6NmavxgSgrvL48V
	FDgYUoUWGn8gcL8mTTK9bwzIAmSl+muz9JsrdGDwzBZdXEtkGTkGppXuiukOJFvjHfQ1NNfwjyr1Z
	xJ4YsUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV80x-0000000EcVy-1OCf;
	Fri, 27 Jun 2025 12:17:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7dD-0000000EYXD-3QBs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E1922C7;
	Fri, 27 Jun 2025 04:52:18 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6A813F58B;
	Fri, 27 Jun 2025 04:52:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:55 +0100
Subject: [PATCH v4 09/10] coresight: Make clock sequence consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-9-0ce0009c38f8@arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=3530;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=n87S/2oSxpnOkHLiSzhmE46RIApYY231MlBT/6pX/wo=;
 b=r0plWUwY17xPYYj2d4wdSo08zRwttIV3zgPGRNmG8MTDPy5juWIxE4bdDU3yApkKCFR1gTaZs
 4RlTB8Bdk4JAMJ4n8eytPWW/JFMe6z4Vvy66QgjSfiIkbXVKE8wLo7S
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_045235_974709_6DB4B09D 
X-CRM114-Status: GOOD (  10.03  )
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

Since atclk is enabled after pclk during the probe phase, this commit
maintains the same sequence for the runtime resume flow.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c     | 6 +++---
 drivers/hwtracing/coresight/coresight-replicator.c | 6 +++---
 drivers/hwtracing/coresight/coresight-stm.c        | 6 +++---
 drivers/hwtracing/coresight/coresight-tpiu.c       | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 02e0dc678a32c3b1f32fc955bf8871142e3412e1..9dcfc5ce8845d9e01bb956dddab0d64de51ec397 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -297,11 +297,11 @@ static int funnel_runtime_resume(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index f1bbd12e63e0c130f945d8df34fb2334bd21336f..e53095603b0c0419bc96a66b23d15bb54e75e634 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -335,11 +335,11 @@ static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index a931282ec0eaf1b2a5db8ccc8f21789441cd634d..ed68d8280b1945f38d1294a5b5f557a614c90c94 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -969,11 +969,11 @@ static int stm_runtime_resume(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 5e47d761e1c4e99072eeb492c1eac7dd4285a591..1c5c2a82971490888c45508c68b516ab7dbf3eeb 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -218,11 +218,11 @@ static int tpiu_runtime_resume(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
 	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
 		clk_prepare_enable(drvdata->pclk);
+
+	if (drvdata && !IS_ERR(drvdata->atclk))
+		clk_prepare_enable(drvdata->atclk);
 	return 0;
 }
 #endif

-- 
2.34.1


