Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C91099B33
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V27SqsHj7cmJ5XkfOS5AHO+hOSVKgxsWMQscoloP1Sc=; b=LcvLIqKOu/Pcy4RBGWV9v8hNSC
	fiKPj+Iv2rah8UfE9tTSIwV3DQa136mYMZ69A9dgG3P+hhyxaCV/GQjj66/mDocsgWMD2NldP6dk1
	zil9AfG2yVPs3AfWas5HDgZHeWQ9HU/As5N4dB7mVHmm68D8zhSesOx8c7U+2L5c41LH4ZVjzb7ht
	+Nshem9pZnvSiGqON3dK4dK2o1XqMjxx3qIRcHFlRkn3yU8NigLZkdiIEAPgGYMmlNkrWCUF3sDAe
	hoDBhh5/qj+eb3m6sv5+M6vMw/twFZWuR99c+DWOZtN/M9tT2iHFof+/gLJRC0LBwy6ew4MlmoElf
	h30eaNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dt5-0000000DINR-2vWe;
	Fri, 20 Mar 2026 17:43:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsh-0000000DI1j-3y5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41D0E165C;
	Fri, 20 Mar 2026 10:43:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BD683FA1F;
	Fri, 20 Mar 2026 10:43:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:54 +0000
Subject: [PATCH v7 12/20] coresight: etm3x: Set active path on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-12-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=2448;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TSeea50H8xNUyQTe7HpLMLLgQ7pQWKWC/H01Lek2xyY=;
 b=dLPD5F/GaomABT/KS9mivhjqhl7f4Fu+Rm12iOSNfkceeJ+Kq2pkisuC8Gd8ijRLL+fUgUtfO
 d7QMub9P9MhA/Pdgns3U+B1a43+SEMfPolMEciFsKsa4XsWXyp4FIWc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104332_157257_26BC9855 
X-CRM114-Status: GOOD (  11.52  )
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

Set and clear the path pointer on the target CPU during ETM enable
and disable operations.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index ab47f69e923fb191b48b82367dce465c79b3a93d..c2b8c096cbe9e9759b3d17f019a2d73f59234ac9 100644
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


