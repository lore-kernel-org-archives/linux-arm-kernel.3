Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A90CF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyV5ARhqsSmICr0/rt4atxDnrYKRd28y+LeGWlosbpA=; b=tnTqiVuHceQau7UvkJGsx6qlMu
	FJFmqYnAbL7Ge7Y2ZaD0ppl8qN3JQop/TfHqnSLn+1DnWhpWOzjMT5Mi+a+PULJOdg6d2ly9tALPW
	yrz7dO9RbkAnGmej94h+S6csOiJXSGZ7ONqOm4crdlObI9OBy/Ew9IueO+A06+JsURM6kX/WsesqR
	R97r4oA2Qgv/WC3tcTgOk748W+tJAZevmFeJlbMpruGTtx8qH2aToAYP8X9v0mJduKuzor3mhfwe4
	cclngPWNznf7pfX5CES4uFmSVW4zPcBVej87gPgb1HE8q6xyBX3GhNqeWYpizJTBXOrO2fA4XU/yZ
	eTV3LKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRb-00000003ZMn-1wRE;
	Wed, 19 Nov 2025 15:50:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRM-00000003Z02-2dAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B8DFEC;
	Wed, 19 Nov 2025 07:49:44 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EF453F66E;
	Wed, 19 Nov 2025 07:49:50 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:12 +0000
Subject: [PATCH v5 14/19] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-14-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=1838;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ImNp+dXWvdkLgqkP0jIk2shbXUskF7qwT+rkK0Cd+cY=;
 b=c27OIIJu1dkLMFngLW8cGQ73U2+NnT9+Fafsk+SD5re7cSrcBIEhDsrDPrnsCAh27sJ/KmcgE
 8Becu753UpsBQyaePLa4eLzV3TnCcOu2FmDAnOR0dYw+y+HI7Wo1X9a
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074952_724918_BA98C6F4 
X-CRM114-Status: GOOD (  11.37  )
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

Control links and helpers on an activated path during CPU idle.  Set the
"path->in_idle" flag to true during idle to guide path control.

Since coresight_disable_path() doesn't handle a source device's helpers,
explicitly disable them alongside the source device.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index e3efa7c9ef9fa1bf7b2f727205abe577bfc493e3..7a9f2c1b105d097cee846ba7ff54475483a0c8e0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1649,12 +1649,33 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 
 static int coresight_pm_save(struct coresight_device *csdev)
 {
-	return coresight_ops(csdev)->pm_save_disable(csdev);
+	int ret;
+
+	if (WARN_ON(!csdev->path))
+		return -EINVAL;
+
+	/* in_idle flag will be used for path controlling */
+	csdev->path->in_idle = true;
+
+	ret = coresight_ops(csdev)->pm_save_disable(csdev);
+	if (ret) {
+		csdev->path->in_idle = false;
+		return ret;
+	}
+
+	coresight_disable_helpers(csdev, csdev->path);
+	coresight_disable_path(csdev->path);
+	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
 {
+	if (WARN_ON(!csdev->path))
+		return;
+
+	coresight_enable_path(csdev->path, coresight_get_mode(csdev));
 	coresight_ops(csdev)->pm_restore_enable(csdev);
+	csdev->path->in_idle = false;
 }
 
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,

-- 
2.34.1


