Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07BCCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xetvvJm0CyCkW4uUGidOGUy6EOw6fN+9sEkHdb/4iOk=; b=VC6T1wZUQw/F5yc9wyxzjZUPdI
	LsAyBoQ648D4aoOd94CsDIH7UqD615AEryAp2LsIUBiKvDAL9t5bF5AYQs6zgPrfeo7FUscUjih/H
	hYkC0uIk+NETFdxNkXAicrGTV80ddOsdDy/VPmv+/W4sysMjPdOZWaNQ3KcpOy4s+Ouh0AwjET1qa
	rlfZBd07b5v+5ZCP1X9N+MLdJ9vKqwZ0vg9rZCudNylu8ExhJ5DmNDaL/RlYnPe3Ts1rdnbUJ7SqF
	1wBhweLzWm8MkdbSLvKrlnPjjrG46bQdI04fZjzzulZ7F3xKgUdEzUPAVc3t2XxNuqhmG3g/+aoar
	Jxe51Glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgZ-000000026wt-34M1;
	Tue, 19 May 2026 15:48:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgV-000000026rO-0PDZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9B9F244C;
	Tue, 19 May 2026 08:48:35 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 119923F632;
	Tue, 19 May 2026 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205721; bh=gYtLnPv7rPiYhGOieebFzQQ+fCOZv3/9pQcWSgJHcrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SP/yP4BBbign08XZv9VIVvZRqdzom3kdpnLEFQhsX99B3FpMyLnxU/7D2SlibZdAr
	 19DA/so0zrg2Zeu2uOpqTkpswCGz4igWRwoA3ULrYsfr6km5m3dnp1AvRYO59msqkj
	 YZOUaApWHjZebqrBEAQDh2iRlu/M0QeJJShlqeJk=
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
Subject: [PATCH v7 09/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
Date: Tue, 19 May 2026 16:48:08 +0100
Message-Id: <20260519154812.254884-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519154812.254884-1-yeoreum.yun@arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084843_259909_4064C45F 
X-CRM114-Status: GOOD (  15.60  )
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

In the perf enable path, there are missing cases where
cscfg_csdev_disable_active_config() is not called:

  - Branch broadcast is selected but not supported by the hardware
  - etm4_enable_hw() fails

This can lead to a leak of config_desc->active_cnt.
Fix this by properly calling cscfg_csdev_disable_active_config()
in these error paths.

Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index f0a9f2ef4b27..0889937811cb 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -899,6 +899,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			 * Missing BB support could cause silent decode errors
 			 * so fail to open if it's not supported.
 			 */
+			if (cfg_hash)
+				cscfg_csdev_disable_active_config(csdev);
 			ret = -EINVAL;
 			goto out;
 		} else {
@@ -915,6 +917,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct perf_event_attr *attr = &event->attr;
 	int ret;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
@@ -926,7 +929,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	/* Configure the tracer based on the session's specifics */
 	ret = etm4_parse_event_config(csdev, event);
 	if (ret)
-		goto out;
+		goto err;
 
 	drvdata->trcid = path->trace_id;
 
@@ -935,16 +938,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
-
-out:
-	/* Failed to start tracer; roll back to DISABLED mode */
 	if (ret) {
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-		return ret;
+		if (ATTR_CFG_GET_FLD(attr, configid))
+			cscfg_csdev_disable_active_config(csdev);
+		goto err;
 	}
 
 	csdev->path = path;
 	return 0;
+
+err:
+	/* Failed to start tracer; roll back to DISABLED mode */
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	return ret;
 }
 
 static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


