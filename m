Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E87E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6TcaudDF9JPpLHodACMoPL+4kTGdc0BENzqpQfyDts=; b=WWgAOwMvmp8msIkTIXH5DxrXOm
	Eg+dYcwaWT9qNCjphCLdNArF+OwM69dVctMmqlrzB3aetelnTvM5k48+CEJMr+XLvme2hp7UaoDag
	WAYjI9cb9BA64/VEzt9vfao1M09bFZi0VFa8eZjoJSstTqxjO2Qec43hf3DRP4hLUbQ7p2oC1sFdA
	IFQH4TdzMBiaCswsNcXmpLcsHGz4N/YRv1U6bz+6LMLvcVVkwHEgYE8SmFtFerRUywyYZSQll7AN0
	RqJZm14ic9PlFne5tsuO1zLjiTOSLvgHPXRGvMYoKYmYh+d4E8rVlJ+Wj8NDFRoS1tzY7HIiAhLEd
	7CEzOi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2sz-00000007D8X-1x3o;
	Sat, 21 Dec 2024 17:03:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2pK-00000007Cgc-32Tw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 16:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A772B168F;
	Sat, 21 Dec 2024 09:00:08 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5105D3F528;
	Sat, 21 Dec 2024 08:59:39 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/4] coresight/etm4x: remove redundant usage of drvdata->spinlock
Date: Sat, 21 Dec 2024 16:59:32 +0000
Message-Id: <20241221165934.1161856-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_085942_855062_78F80FED 
X-CRM114-Status: GOOD (  11.27  )
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

Remove redundant usage of drvdata->spinlock in  etm4_starting/dying_cpu()
by preventing cpu hotplug while enabling etm4x via sysfs since
 - perf and sysfs enable method are serialized by csdev->mode
 - etm4_starting/dying_cpu() aren't called concurrently with
   etm4_enable_perf/sysfs() because they're called in cpu offline status.
 - while etm4x_enable_sysfs(), config isn't altered since csdev->mode
   isn't DISABLED.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 86893115df17..5c9475b44194 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -799,16 +799,21 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 	unsigned long cfg_hash;
 	int ret, preset;
 
+	cpus_read_lock();
+
+	if (cpu_is_offline(drvdata->cpu)) {
+		ret = -EPERM;
+		goto unlock_sysfs_enable;
+	}
+
 	/* enable any config activated by configfs */
 	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
 	if (cfg_hash) {
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
 		if (ret)
-			return ret;
+			goto unlock_sysfs_enable;
 	}
 
-	raw_spin_lock(&drvdata->spinlock);
-
 	/* sysfs needs to read and allocate a trace ID */
 	ret = etm4_read_alloc_trace_id(drvdata);
 	if (ret < 0)
@@ -830,10 +835,11 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 		etm4_release_trace_id(drvdata);
 
 unlock_sysfs_enable:
-	raw_spin_unlock(&drvdata->spinlock);
+	cpus_read_unlock();
 
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+
 	return ret;
 }
 
@@ -977,7 +983,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	 * DYING hotplug callback is serviced by the ETM driver.
 	 */
 	cpus_read_lock();
-	raw_spin_lock(&drvdata->spinlock);
 
 	/*
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
@@ -985,7 +990,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	 */
 	smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
 
 	/*
@@ -1663,13 +1667,11 @@ static int etm4_starting_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (!etmdrvdata[cpu]->os_unlock)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm4_enable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -1678,10 +1680,8 @@ static int etm4_dying_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm4_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


