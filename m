Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B07F3092B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCspI7l9AWSe6OL8d3xVMUvxcQGVlx0j9Y84qBFwhlw=; b=TKd2co43606kRjhds54+bo0SBG
	NV72IAmHpg0VX4aYuelsFx+f4Q445t5bFOzoToaphx8kbWuC2yrAkvbluxl2Uh8VUqajEq9ign6eh
	M27MrPLxQh5ZO2INbUktSNnaFH2aa+EexGPXriNfrdQk4Cd3yI1p+krLCAJ316zKkqcVJlqrgCwXx
	+NFGqP+Xu+vE6pgLjuD0zLsPHMNZh07BRXDQd3qQZeWbb1KedsmIhY9OVspFlmLyEMeqZeEcqOetk
	MWbhmm6LOhRIsGKnxNPNMLSRaLwtifBjCHx9GcKMcXy99CM8JIlxU2G0HORARWC7TrxtlswCZEEQY
	4fG3FhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mS-00000001Xwo-401G;
	Thu, 05 Mar 2026 10:18:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mQ-00000001XpP-3sLv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:18:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A252D339;
	Thu,  5 Mar 2026 02:17:59 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D83C3F694;
	Thu,  5 Mar 2026 02:18:03 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:40 +0000
Subject: [PATCH v6 09/19] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-9-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=2665;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gJEFIA8aD+DLHureQKsIlzomHCI2sdFtLHTwjmlzxBw=;
 b=TPQM+oeztZbqOqkEwvVDZsJnF6nYJULQhkF3LqktOpWpAxnw/FV7WwYRstfNtpPJo11lz4k7z
 FDv7ZqGjO4AC79khOPwQ6j2/Q/9yGkhUlSBt2a4H43KV1Pl2sWPxDSY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021807_106896_23A256A3 
X-CRM114-Status: GOOD (  14.19  )
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

Store the active path in the source device structure for system
tracers (e.g. STM).

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 22 ++++++++++++++++++++--
 include/linux/coresight.h                    |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8e22f0993631fa3749437175ecc984ccb1cffc13..80489d38f690e0139c8712161c663ee63a8a7fb3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -451,14 +451,32 @@ int coresight_enable_source(struct coresight_device *csdev,
 			    struct perf_event *event, enum cs_mode mode,
 			    struct coresight_path *path)
 {
-	return source_ops(csdev)->enable(csdev, event, mode, path);
+	int ret;
+
+
+	ret = source_ops(csdev)->enable(csdev, event, mode, path);
+	if (ret)
+		return ret;
+
+	/*
+	 * The per-CPU source has updated its path pointer in the enable()
+	 * callback, ensuring synchronization on the target CPU. Set the
+	 * path pointer here for non per-CPU sources.
+	 */
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = path;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_source);
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev, NULL);
+	coresight_disable_helpers(csdev, csdev->path);
+
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = NULL;
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2de2ef94d2e046effb264cc97e5cd1a61e609249..96a1af3425a5d588fccb185a428cef5c88febdbd 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -264,6 +264,7 @@ struct coresight_trace_id_map {
  *		spinlock.
  * @orphan:	true if the component has connections that haven't been linked.
  * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
+ * @path:	Activated path pointer (only used for source device).
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -291,6 +292,7 @@ struct coresight_device {
 	int refcnt;
 	bool orphan;
 	int cpu;
+	struct coresight_path *path;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;

-- 
2.34.1


