Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98168C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Wn6zhqxqnbU1p86TXej1/jJjfDyee2BMfeuYDcg6r0=; b=jAbmhEv5mSD90k8TUuRUCJldHg
	Jpe9tCV/sINPsO72SYj3cx0IQzQRY6VqPxupDG1ad5srb8brj0flIvAj+8n+bjv4mI9gvL58rFKdd
	MJd977HFus0RM1XeFkFuSzNKSAG+uZKBnfkcLMv31wcc2plpO8eDbvdk+TelMVG+XA7OCuoCFlsRg
	fL4GRcbaeqQ9wPOx2XbJtWghhGYudaJjjPWHaW2AuCkvqnSR5vz0o6fd6SjjJiwfa90Q45bJIohh0
	eSGAL7smMpzDPDQpdr6xvG7XMQF8i5qMFWbPkk2hbCaHJv/d1tXQthLYdNPdAnDl3g3lg7MlusJNB
	BNjwqwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueznc-000000088ZX-0fly;
	Thu, 24 Jul 2025 17:32:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexmk-00000007pkh-231L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 988A91A00;
	Thu, 24 Jul 2025 08:22:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754CF3F6A8;
	Thu, 24 Jul 2025 08:23:04 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 24 Jul 2025 16:22:40 +0100
Subject: [PATCH v5 10/10] coresight: Refactor runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-arm_cs_fix_clock_v4-v5-10-63f648dae021@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370566; l=10111;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QYQq2YcDQOXsLMTAkPoxjDTuSL9GWCMfBPj887Rmhpg=;
 b=KjUTuMRSUD2BOqBkGHc3f5mHu+v+pNB8dxVJy3z8V3s8TXvhx4req4oIcRBz5TOfgDJzkLgwG
 o2NonGqz40KDWLRorZrHcBaeyfE5hSFCrOQg32zxtvAJigD+jx/ueUm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082306_615277_C6F4E6AC 
X-CRM114-Status: GOOD (  12.68  )
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

The validation for driver data pointers and clock pointers are redundant
in the runtime PM callbacks.  After a driver's probing, its driver data
and clocks have been initialized successfully, this ensures it is safe
to access driver data and clocks in the runtime PM callbacks.  A corner
case is a clock pointer is NULL, in this case, the clock core layer can
handle it properly.  So remove these redundant checking.

In runtime resume, respect values returned from clock function and add
error handling.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 +++-----
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++------
 drivers/hwtracing/coresight/coresight-etb10.c      |  8 ++------
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  8 ++------
 drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++----------
 drivers/hwtracing/coresight/coresight-replicator.c | 20 +++++++++++---------
 drivers/hwtracing/coresight/coresight-stm.c        | 20 +++++++++++---------
 drivers/hwtracing/coresight/coresight-tpiu.c       | 20 +++++++++++---------
 8 files changed, 53 insertions(+), 60 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3edfb5d3d02056afcaab4da575d1101c68aeac80..5f21366406aae03edef9e4fb737e19941afb9ac2 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -731,8 +731,8 @@ static int debug_runtime_suspend(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->pclk);
+
 	return 0;
 }
 
@@ -740,9 +740,7 @@ static int debug_runtime_resume(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
-	return 0;
+	return clk_prepare_enable(drvdata->pclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 75b5114ef652e4a47c53fbd2b7811c1bab575645..c586495e9a088a63cec481a82fd9f4ec7c645160 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -278,8 +278,7 @@ static int ctcu_runtime_suspend(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
-		clk_disable_unprepare(drvdata->apb_clk);
+	clk_disable_unprepare(drvdata->apb_clk);
 
 	return 0;
 }
@@ -288,10 +287,7 @@ static int ctcu_runtime_resume(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->apb_clk))
-		clk_prepare_enable(drvdata->apb_clk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->apb_clk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 8e81b41eb22264f17606050fa8da277aae05c5cc..35db1b6093d154d67dc567df42f838e2ba3d1d58 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -809,8 +809,7 @@ static int etb_runtime_suspend(struct device *dev)
 {
 	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
 
 	return 0;
 }
@@ -819,10 +818,7 @@ static int etb_runtime_resume(struct device *dev)
 {
 	struct etb_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->atclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index baba2245b1dfb31f4bf19080e20c33df3a5b854f..45630a1cd32fbd05ec8b2a6979f0174cacce365e 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -925,8 +925,7 @@ static int etm_runtime_suspend(struct device *dev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
 
 	return 0;
 }
@@ -935,10 +934,7 @@ static int etm_runtime_resume(struct device *dev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-
-	return 0;
+	return clk_prepare_enable(drvdata->atclk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 9dcfc5ce8845d9e01bb956dddab0d64de51ec397..3b248e54471a38f501777fe162fea850d1c851b3 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -284,11 +284,8 @@ static int funnel_runtime_suspend(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
-
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
@@ -296,13 +293,17 @@ static int funnel_runtime_suspend(struct device *dev)
 static int funnel_runtime_resume(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e53095603b0c0419bc96a66b23d15bb54e75e634..e6472658235dc479cec91ac18f3737f76f8c74f0 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -323,24 +323,26 @@ static int replicator_runtime_suspend(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 7b1e289f17ab2000816d8641fe0a79759452d3b4..e68529bf89c9815a8118955bf3114ad1ed4fb346 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -957,24 +957,26 @@ static int stm_runtime_suspend(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int stm_runtime_resume(struct device *dev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 1c5c2a82971490888c45508c68b516ab7dbf3eeb..9463afdbda8ad74eee78c72185fe7603f81b7888 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -206,24 +206,26 @@ static int tpiu_runtime_suspend(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_disable_unprepare(drvdata->pclk);
 	return 0;
 }
 
 static int tpiu_runtime_resume(struct device *dev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
-	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
-		clk_prepare_enable(drvdata->pclk);
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
 
-	if (drvdata && !IS_ERR(drvdata->atclk))
-		clk_prepare_enable(drvdata->atclk);
-	return 0;
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
 }
 #endif
 

-- 
2.34.1


