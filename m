Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0EBCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUM21N8H9cbnVrkhebUQZj/U7quxLhz/Jj2o3d8g+FM=; b=tBE9WnbuNR/kfIsVieofTw4lje
	ja2YKnxJvRxvEnFi9jFUOOI23xrwoz0xxvSusaFWXZykjVXfhhIUO8rafhmyIpF29PFy8a/MocyRT
	I8DEcKZgTwh9EqNKfacIXwdEAzi9fc01SuotWvtjvn53PckMYops31PLptCiAbYDwo5iXfz23X9+2
	RSV58rI8fQ6xpWKS6HWk/Jsc6DvGdS31beQ5J0uH4y0zwKAl0eaSkeImiebCfejbaOdhwtl05moR0
	ZMzoBVdYNrwe4gBVFynaVrPpokyKo6wRXtV9OoIvtarpKAvMw7DmNl+LKIerR2BHJbaeBGVNOQzle
	YGAf9LSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYl-0000000DGLx-2X8F;
	Mon, 11 May 2026 11:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYN-0000000DFk7-0lRn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2EF16F8;
	Mon, 11 May 2026 04:11:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 947253F85F;
	Mon, 11 May 2026 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497922; bh=f41UpXZ504oDLA+F8MKyLG53vBJDdW/0DDvQfsTR3Ps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CMqiNsAFypfQYJkG6jSLiF2GAwT+AJrB/NBWGzn0LCdBi0ax+7lSCSoXpGIe0Ec9M
	 m8skd4quRec8pTKMIA8qyrbEFu3V6XSpOWdw5j65XJdWmBw3MekHnIz7SvO0PCC8Hx
	 RAvOwaZOucjiNLxpo94BH7uw5LwgQSY0o2TpNGFU=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:05 +0100
Subject: [PATCH v12 21/28] coresight: etm3x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-21-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=2592;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=f41UpXZ504oDLA+F8MKyLG53vBJDdW/0DDvQfsTR3Ps=;
 b=wYPjM3W0H87FjaMbv2RTHdlP8+b/kFFC2EHTpmpJVEUZoAb4ryDn3QfayKYnr/zhAZo0MEM04
 zXuLmUYb7gZBlYSkPyW6HOcOdhZU6WbL5pRkoXbMLhIG22i+J1Ozq5V
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041203_437220_8B6B0FD3 
X-CRM114-Status: GOOD (  13.11  )
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

Set the path pointer on the target CPU during ETM enable and disable.

This ensures the device mode and path pointer are updated together and
observed atomically by the CPU PM notifier.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index aeeb284abdbe4b6a0960da45baa1138e203f3e3c..c6fe8b25b855a4119110fee4162f55c0154c3d05 100644
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
+	csdev->path = arg->path;
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
+	csdev->path = path;
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
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -607,6 +617,7 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	drvdata->csdev->path = NULL;
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 
 	/*

-- 
2.34.1


