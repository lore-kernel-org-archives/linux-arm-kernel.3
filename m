Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D36CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcTjFHwFOJxLBwACviHhxhs7BeZXvGwmnurx6bXu33Q=; b=UGnev5sHR2NCiJWmNPPTHKGivk
	I/uHViYK7RFeUjoMpWYJqMYEIRAc2HQYFcZUgfEyj1Fgcjf8Zb0B46fZ//yhi3l9pVfjFozSz85ol
	PGugtlBc+JshpJODtrwHGyNhHt9b1vHHp9ZyjrI6Vo53otlhL3POvDtoA+OkaBWw2F15lF+9lP5QZ
	EHfO/p902vzrQN9XbWSg7lVbN3F12JOrf2f6CsBG0saCz9nS7sZQC6zbJY8Ls20Q5ar6yBeVOTuk2
	1nCHbucj8/C7+gbOjcLQcUW6me45sQoP4wHY0CHEoL1YPZLPPDAy17vHaHC5jLuTM0zFKYKIPV5Zu
	GDPK+aMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRT-00000003ZCA-45Mr;
	Wed, 19 Nov 2025 15:49:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRD-00000003Yjy-08gE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80D212FC;
	Wed, 19 Nov 2025 07:49:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1A8D3F66E;
	Wed, 19 Nov 2025 07:49:40 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:07 +0000
Subject: [PATCH v5 09/19] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-9-f615a301ad0b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=2665;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=KsEb00761zLaZsg+llWf4FFbkOpgNSQjXvCE7Ak4pyQ=;
 b=fmUjWZe0P8+lIF80/GWCBdyK4ulPH0FJTSTOpBdYCBnCV8IcEDONGdmwRAct+SL5keE49PN7U
 jjq2G/Z0XXMDwV44NkiLOVfI8ijveD9q3kVrdteYy6JSIuYZmnYfXnW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074943_155573_18D0112B 
X-CRM114-Status: GOOD (  14.00  )
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
index 2c287ceaa2aaf0dcb7a5243c8743f401f8500100..e8efb09dd8fc5d94d7a07ddd86f3270bab424f54 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -414,14 +414,32 @@ int coresight_enable_source(struct coresight_device *csdev,
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
index e5ce9b956deeac1a303a7250b48a4083d580f55a..9e1edff3ace951146f1801a732105d8560fa2356 100644
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


