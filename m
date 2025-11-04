Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C9CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jJP2ZwoptvTTV+epGbpz67UiJ4YNK1Xzp/wtwTt6EY=; b=dTkJ1gztrPk4Q4PzTybo08LJ07
	oF8l8FCgvtMftY+k62edkLbRyj790mDiQlqPnETQ92RR54QsVof4CSJXT3VAqNxrEqvAQHn+VE/LA
	Yj5Jc2qxvuG++qs7MqpJE+4iSQLhBmGklVtcRvjwbkTvTcTjFtnclF2/IEpKPlmjG+MreV+SEIqpn
	alhCghO5A2ex4hHu1VgaTqLs4UwIWkqQUSDqbjjTGfhQbDKplz9iH9SQmcMPCoS1H93c3upygjUJU
	svhNLVntZFj1TQ6LD3kctnC1iz0jAljQxRAQhNeI1akbaep1MsgFow/3nY5takc0vRfwH8sQDQLRh
	1Q3+/fLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs2-0000000C4F9-0rG5;
	Tue, 04 Nov 2025 15:22:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIry-0000000C49S-1yQ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAE6A2C41;
	Tue,  4 Nov 2025 07:22:41 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 096833F66E;
	Tue,  4 Nov 2025 07:22:47 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:53 +0000
Subject: [PATCH v4 09/15] coresight: Save activated path into source device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-9-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=3593;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Fhn3+nT6R/3Dhs4RSbOPBF0yzSklz2limcT6oCD2XFo=;
 b=ldXvE8AChyARu+xx6fSPG7eAOt03xMk4sAhA7bO9OOtV7aNx7p1D4dhAHqNuTLHOb0WqruO1m
 3s/AJq/HMsZDO9+31NOy+JtUcLR/RGKPBSPELMq0JkJe7mXM20Tizg4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072250_642532_B15A170E 
X-CRM114-Status: GOOD (  17.61  )
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

Save activated path into the source device's coresight_device structure.
The path pointer will be used by later changes for controlling the path
during CPU idle.

The path pointer is assigned before setting the source device mode to
active, and it is cleared after the device is changed to an inactive
mode. So safe access to path pointers is guaranteed when the device is
in an active mode.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 39 +++++++++++++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c28f3d255b0e19b3d982de95b8e34d0fc2954b95..3ea31ed121f7b59d7822fba4df4c43efb1c76fe7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -399,13 +399,50 @@ int coresight_enable_source(struct coresight_device *csdev,
 			    struct perf_event *event, enum cs_mode mode,
 			    struct coresight_path *path)
 {
-	return source_ops(csdev)->enable(csdev, event, mode, path);
+	int ret;
+
+	/*
+	 * Record the path in the source device. The path pointer is first
+	 * assigned, followed by transitioning from DISABLED mode to an enabled
+	 * state on the target CPU. Conversely, during the disable flow, the
+	 * device mode is set to DISABLED before the path pointer is cleared.
+	 *
+	 * This ordering ensures the path pointer to be safely access under the
+	 * following race condition:
+	 *
+	 *  CPU(a)                          CPU(b)
+	 *
+	 *  coresight_enable_source()
+	 *    STORE source->path;
+	 *    smp_mb();
+	 *    source_ops(csdev)->enable();
+	 *                              `-> etm4_enable_sysfs_smp_call()
+	 *                                    STORE source->mode;
+	 *
+	 * This sequence ensures that accessing the path pointer is safe when
+	 * the device is in enabled mode.
+	 */
+	csdev->path = path;
+
+	/* Synchronization between csdev->path and csdev->mode */
+	smp_mb();
+
+	ret = source_ops(csdev)->enable(csdev, event, mode, path);
+	if (ret)
+		csdev->path = NULL;
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_source);
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
+
+	/* Synchronization between csdev->path and csdev->mode */
+	smp_mb();
+	csdev->path = NULL;
+
 	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 3d59be214dd25dfa7ad9148a6688628e0d1a98dd..58484c225e58a68dd74739a48c08a409ce9ddd73 100644
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


