Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825CCE9D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4tTu3qvNIk0Zd0pHUMp6PcLs/3guYAtRPLVzmQRoTw=; b=MwRbnXeUO5wosdZ24rfKRTIKk4
	qOOsoQcbyUA1kni2RXgJLDUJUTB4eNxqbDI5RpfoRP6AgxsQOkiyY+FmlxGZXjJelCIcACcOI8m+v
	IMqxHR8PYaVhmas959a58962osplopAGgkEnVBRR3DtV3AiN9e3KbnAPG23ruvDC6Huq9ndB/gueQ
	XwB8/jxpYr38wxq8V+0VmqSu01z8+GIeWnE+XTxXT2gRi4nsRuUYI8MxD3XYU6GzyWFwa67AmfIRy
	LWWIBMKNtGQ0uDyUCfFFi30QYFNkKTnzrVFrPHWE+7aOZbUxaKbUsKn6Dciv3264xrbzGadk+sRO4
	y7mxGTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0V-00000004HEw-2M6K;
	Sun, 05 Apr 2026 15:03:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0T-00000004HCk-0oAn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C23326BE;
	Sun,  5 Apr 2026 08:03:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474283F62B;
	Sun,  5 Apr 2026 08:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401400; bh=WdcTte650M77YokXGamFSD8DnutzZbOYv7TJTefCO3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H4hKAIpK5RQMsKMzKVUploRSDe9AaiQTjNBRLLmbWpW6BAaEHjRgSGuJc+YkffOb2
	 YTNlxVmDJKo8fg//6i1+AUedeSa5Q6GGpPZ34vnmfnWY2wWPWOkrK2D5ymX3+eBB10
	 kQO7oQZtNmMvJD09d0wg/vf/p2b9Hm8CDayCA854=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:42 +0100
Subject: [PATCH v10 06/20] coresight: etm3x: Set per-CPU path on local CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-6-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=2497;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WdcTte650M77YokXGamFSD8DnutzZbOYv7TJTefCO3I=;
 b=iliFG80cIcZwFkrzEiixG87mSRI8gkzeCe5aR3+ielxUQBfBXtkgV2MM1DlC/F9iX3mo6x+cx
 3+MbBA3V+1CC5rs4bGbOZBj2cE0ZMsCOWhbXTBCkZHJDQ04YalK0wS5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080321_371701_A6E876BC 
X-CRM114-Status: GOOD (  12.49  )
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

Set the path pointer on the local CPU during ETMv3 enable and disable
operations.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index aeeb284abdbe4b6a0960da45baa1138e203f3e3c..46ea66b5cf1985bd7129688f175f6f92372d04ad 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -441,6 +441,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
+	struct coresight_path *path;
 	int rc;
 };
 
@@ -462,8 +463,12 @@ static void etm_enable_sysfs_smp_call(void *info)
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return;
+	}
+
+	coresight_set_percpu_local_path(arg->path);
 }
 
 void etm_release_trace_id(struct etm_drvdata *drvdata)
@@ -492,10 +497,13 @@ static int etm_enable_perf(struct coresight_device *csdev,
 	ret = etm_enable_hw(drvdata);
 
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
+	if (ret) {
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
-	return ret;
+	coresight_set_percpu_local_path(path);
+	return 0;
 }
 
 static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -514,6 +522,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	 */
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
+		arg.path = path;
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
 		if (!ret)
@@ -583,6 +592,7 @@ static void etm_disable_sysfs_smp_call(void *info)
 
 	etm_disable_hw(drvdata);
 
+	coresight_set_percpu_local_path(NULL);
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -607,6 +617,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	coresight_set_percpu_local_path(NULL);
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


