Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6078F9EDCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKSBtTRLTTYq7LfPLBhn3LGU+p1Uv8YSmTsz+6+K0EY=; b=DvxdoKbV5IClmihy7nTOmoXKL4
	rxtvaM025v83uas9ArMpjW9mh9+Kk8dk6SkcNScZLzCNaYCSW78FX1x616n1nHRfEfVAIHklXgrYe
	AiVVqSdvh4Q1U7ag6f3GFyoOni6Y6ocAysBzBx1qBuKpKXdktECE8EnhkGU8ZAjki9UAyvitc1Rzn
	61QdrqrtP5aHHcO6x/SMPmKrOsmFWTMQ25OAM3c7p+lnhyLI9bQ/O7zaWPEQoMjFHi57qr6AbFlrI
	pIWlSNwvcsVUOo9toGTDicDdZGqO6uRwg9MU8W3koMgx3mJzZo8COPPJzmVHBOCX3jmPm8HHJEPxj
	udNyj6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXXd-0000000AI7Z-0a7Q;
	Wed, 22 Apr 2026 13:22:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXXK-0000000AHe0-1fe2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235E02454;
	Wed, 22 Apr 2026 06:22:31 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D75C23FDBD;
	Wed, 22 Apr 2026 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864156; bh=UKXdFxldnBDOvnnwJq1j2HA+gw2wAptUrDXrQFQYulM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcKxXEsIlQV0jvEz8jx4hQtR+vV1dmzFMe6VPJCYhB4q6evsOa39zY6yLeX6zelE3
	 Z/xFaaVCNnkitJTe6KmvYOly4gxxH8usr9sCyjEwYYiX5rBC11g8L3P1ILV7MjPjrR
	 LyKcHQCmfY8oia3h+MW+Yke7Ebg/6S50YGiuHfIw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 13/13] coresight: etm3x: remove redundant call etm_enable_hw() with hotplug
Date: Wed, 22 Apr 2026 14:22:03 +0100
Message-Id: <20260422132203.977549-14-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062238_508515_9CD48723 
X-CRM114-Status: GOOD (  12.50  )
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

The cpu_online_mask is set at the CPUHP_BRINGUP_CPU step.
In other words, if etm4_enable_sysfs() is called between
CPUHP_BRINGUP_CPU and CPUHP_AP_ARM_CORESIGHT_STARTING,
etm_enable_hw() may be invoked in etm_enable_sysfs_smp_call()
and then executed again in etm_starting_cpu().

To remove this redundant call, take the hotplug lock before executing
etm_enable_sysfs_smp_call().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm3x-core.c          | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 85778e6349f4..72219bbbf616 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -521,25 +521,26 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
+	arg.drvdata = drvdata;
+	arg.path = path;
+
+	raw_spin_lock(&drvdata->spinlock);
+	arg.config = drvdata->config;
+	raw_spin_unlock(&drvdata->spinlock);
+
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
 	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		arg.path = path;
-
-		raw_spin_lock(&drvdata->spinlock);
-		arg.config = drvdata->config;
-		raw_spin_unlock(&drvdata->spinlock);
-
-		ret = smp_call_function_single(drvdata->cpu,
-					       etm_enable_sysfs_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-	} else {
+	cpus_read_lock();
+	ret = smp_call_function_single(drvdata->cpu,
+				       etm_enable_sysfs_smp_call, &arg, 1);
+	cpus_read_unlock();
+
+	if (!ret)
+		ret = arg.rc;
+	else
 		ret = -ENODEV;
-	}
 
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


