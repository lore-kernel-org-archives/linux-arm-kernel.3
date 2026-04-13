Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB9FF34C59
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO64SVeF86ReUBEKH7LVqdzeS3lL5rsCwvrOkWEIz4w=; b=Vn/Ti6DOvzAFR09nqqx6YZMThr
	azFH0XcIHpl3onNcnhDtp9CN+sVrsXxnKD9jiqaOt7kKyq5CGelWfJgQLRvP/o2SLTVIcD/wVJyBa
	ACctSSE3j8oYIH4vSoBTRr9nZdVRlQzM0wXnzsB1HwvYto+8/nVfXosywTSaCH3xRQ9GI9TeP+RIA
	krItHcnoKEmp1/KuGvLkK3DD1FXc/jxvu7fVzLQQrkZCwE0yQOfmFzhgPAtR7q/osSnbYeGoSiJU6
	SM9rV+LMiqcaJeDtUcBqks1p+se3X+VBEH6RplKK/9mIxo0MGYpUaBtdsSQ7wpsC26tFO/s3BwTa7
	6jnqZyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9P-0000000FqhI-1R6v;
	Mon, 13 Apr 2026 14:20:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9J-0000000Fqc1-3jjM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:20:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4E66359A;
	Mon, 13 Apr 2026 07:20:19 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE5AA3F641;
	Mon, 13 Apr 2026 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776090025; bh=Qwt8jUbbvMo92bDPS6T3dox0x9gyvJKy4t2N4lfA8uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofYF9Btyz0Itq1rCHMGyxlKDCTtniuQuVyRoAFwqXJu5rQRRf02ImodpwuzoQsSzT
	 igua5GyuTdCbfyFZqHfGwwqplT/2psbP1e5ugqpRdv3RBtBpHx+KskFTLNGs6QnQMW
	 b43YLtXpxDRPzXeozyZkDDdw5KjmAJvw7LMnZr9w=
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
Subject: [PATCH v4 9/9] coresight: etm3x: remove redundant call etm_enable_hw() with hotplug
Date: Mon, 13 Apr 2026 15:20:03 +0100
Message-Id: <20260413142003.3549310-11-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413142003.3549310-1-yeoreum.yun@arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_072025_967513_69DE074E 
X-CRM114-Status: GOOD (  12.51  )
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
 .../coresight/coresight-etm3x-core.c          | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index b7e3b5eea3f9..5dc5492a1fb5 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -522,26 +522,26 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
+	arg.drvdata = drvdata;
+	arg.traceid = path->trace_id;
+
+	raw_spin_lock(&drvdata->spinlock);
+	arg.config = drvdata->config;
+	raw_spin_unlock(&drvdata->spinlock);
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
 	 */
-	if (cpu_online(drvdata->cpu)) {
-		arg.drvdata = drvdata;
-		arg.traceid = path->trace_id;
-
-		raw_spin_lock(&drvdata->spinlock);
-		arg.config = drvdata->config;
-		raw_spin_unlock(&drvdata->spinlock);
-
+	cpus_read_lock();
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
-		if (!ret)
-			ret = arg.rc;
-	} else {
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


