Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2367E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC7yyzeXOC+UH+jNqkG+NN1+OnfPH4vQAkvXjDwu0gE=; b=zv7JQzQksawNEKEzgUs+Lfz6Ai
	1K3gmp19j8k6SLmBytl0Gw/9iN0K3ztqLjbtDyRCqRg2ixu8WCV2a8ICW28YTTht/EIzMlWBOPIN+
	Ino22LUbWyOZWXBXB05wHdskI1IrsrAVmR4+Wo+0vRYaG4Po1PcdPcP0T4Kqaoo/kl3epk8neEmCN
	+XWPqjh+MQEb5KbNerfcAeB7dDqEBT4jvP2u+Jr82KKDo4LroQT+gTaC0DyIt8QkUcXriILGCy3qI
	cloOiD1OSZaK6PS2iHuteHpPzDrOqEtb5Rcdyt2R92fq4HJJvc+jql4eaZGKZYhCxkNTXaN98pJg4
	rNHC+l1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2u8-00000007DER-0mMj;
	Sat, 21 Dec 2024 17:04:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2pM-00000007ChT-1nq6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 16:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BABBD1AC1;
	Sat, 21 Dec 2024 09:00:11 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D4BE3F528;
	Sat, 21 Dec 2024 08:59:42 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 4/4] coresight/etm3x: remove redundant usage of drvdata->spinlock
Date: Sat, 21 Dec 2024 16:59:34 +0000
Message-Id: <20241221165934.1161856-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_085944_560251_1DB883AA 
X-CRM114-Status: GOOD (  13.67  )
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

Remove redundant usage of drvdata->spinlock in etm_starting/dying_cpu()
by preventing cpu hotplug while enabling etm3x via sysfs since
 - perf and sysfs enable method are serialized by csdev->mode
 - etm_starting/dying_cpu() aren't called concurrently with
   etm_enable_perf/sysfs() because they're called in cpu offline status.
 - while etm_enable_sysfs(), config isn't changed since csdev->mode is
   not DISABLED.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-core.c          | 33 ++++++++-----------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..5ec871979ef7 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -519,7 +519,12 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	spin_lock(&drvdata->spinlock);
+	cpus_read_lock();
+
+	if (cpu_is_offline(drvdata->cpu)) {
+		ret = -ENODEV;
+		goto unlock_sysfs_enable;
+	}
 
 	/* sysfs needs to allocate and set a trace ID */
 	ret = etm_read_alloc_trace_id(drvdata);
@@ -530,23 +535,19 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
 	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		ret = smp_call_function_single(drvdata->cpu,
-					       etm_enable_hw_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-		if (!ret)
-			drvdata->sticky_enable = true;
-	} else {
-		ret = -ENODEV;
-	}
+	arg.drvdata = drvdata;
+	ret = smp_call_function_single(drvdata->cpu,
+				       etm_enable_hw_smp_call, &arg, 1);
+	if (!ret)
+		ret = arg.rc;
+	if (!ret)
+		drvdata->sticky_enable = true;
 
 	if (ret)
 		etm_release_trace_id(drvdata);
 
 unlock_enable_sysfs:
-	spin_unlock(&drvdata->spinlock);
+	cpus_read_unlock();
 
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
@@ -646,7 +647,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * DYING hotplug callback is serviced by the ETM driver.
 	 */
 	cpus_read_lock();
-	spin_lock(&drvdata->spinlock);
 
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
@@ -654,7 +654,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 */
 	smp_call_function_single(drvdata->cpu, etm_disable_hw, drvdata, 1);
 
-	spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
 
 	/*
@@ -722,7 +721,6 @@ static int etm_starting_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (!etmdrvdata[cpu]->os_unlock) {
 		etm_os_unlock(etmdrvdata[cpu]);
 		etmdrvdata[cpu]->os_unlock = true;
@@ -730,7 +728,6 @@ static int etm_starting_cpu(unsigned int cpu)
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm_enable_hw(etmdrvdata[cpu]);
-	spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -739,10 +736,8 @@ static int etm_dying_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm_disable_hw(etmdrvdata[cpu]);
-	spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


