Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92044CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr15tvS2+bhuYWrHw/nHSfRhPCSeQtC8JEWBc4uW7mk=; b=sLRrLfVwznLHmDnPWUM+w2wuSU
	oQ3wtHGhrp0iOXsq/D7ZEPHCq2Cuj1iUT4lOMETjpQyKHS6TZdCYGf3QoD6g1ZUX79MrgQ37M03TS
	kS1rvFHjhN+tjUYr5caf2L5OqFgfAj9QuGKSe02DG7DC7WJwPP3LH1QaXgi0l8gH62lCDOxaN7rY5
	DqjQhJKXgfaeXR7UF9Rn13+v3sL7NQrvF9TIG8vRXa3rW2M0qRL6zsGP7H9+LZqikTCjdz6IwmVgw
	ci5ULikOEh79ox+whuNrJnYBhg7E3aqltW9Zq5nFSe94hExcRYQjvZe56jBFrB0lDkAe9ja64G98m
	YJu6Uw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxem-00000009950-35AP;
	Fri, 15 May 2026 18:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeb-000000098qy-1kgM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:53:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905DF27D3;
	Fri, 15 May 2026 11:52:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046EF3F836;
	Fri, 15 May 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871176; bh=0TJqmgODZmPG4bPREIjFxLv5HTGAUUqdY+bBYn2MR/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fU3s3G8u3QjJHCpOppPPjZCLjlYUiD45+fyzxZjG6EkT9iK7FM64dX7KKECI83Amw
	 kW1x1XTOAPRZC41NDRnWTyBSnq7lql0EqqOeCaMpSfGaH5KVMKowSvzQec2VQQEf4a
	 jdCJPpZF2ljzA4ydkU0LkdAF//2/EAm8Oc+VslnM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:47 +0100
Subject: [PATCH v13 24/28] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-24-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=4031;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0TJqmgODZmPG4bPREIjFxLv5HTGAUUqdY+bBYn2MR/0=;
 b=fpQmtSTt/xrv8sILa2mVF2I6oGXdHliNb4AbLayqp3fVY+JdNfkvEEMfSuCXa+nr+OdYU8YIW
 zvWaWOqzXp4BA2scTf1Eux4r9DgaTSrQd2Z8IF7giKovhbLyM4CXmXi
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115258_019296_8FD0BFF8 
X-CRM114-Status: GOOD (  17.42  )
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

Unlike system level sinks, per-CPU sinks may lose power during CPU idle
states.  Currently, this applies specifically to TRBE.  This commit
invokes save and restore callbacks for the sink in the CPU PM notifier.

If the sink provides PM callbacks but the source does not, this is
unsafe because the sink cannot be disabled safely unless the source
can also be controlled, so veto low power entry to avoid lockups.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 23c2719c95d5b04077a4c63246f21f59b67998f4..7c7503d7eeb3967efd179d5f91df578d5827bcd3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1874,7 +1874,7 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
 static int coresight_pm_is_needed(struct coresight_path *path)
 {
-	struct coresight_device *source;
+	struct coresight_device *source, *sink;
 
 	if (this_cpu_read(percpu_pm_failed))
 		return -EIO;
@@ -1883,7 +1883,8 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 		return 0;
 
 	source = coresight_get_source(path);
-	if (!source)
+	sink = coresight_get_sink(path);
+	if (!source || !sink)
 		return 0;
 
 	/* pm_save_disable() and pm_restore_enable() must be paired */
@@ -1891,16 +1892,35 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 	    coresight_ops(source)->pm_restore_enable)
 		return 1;
 
+	/*
+	 * It is not permitted that the source has no callbacks while the sink
+	 * does, as the sink cannot be disabled without disabling the source,
+	 * which may lead to lockups. Fix this by enabling self-hosted PM
+	 * mode for ETM (see etm4_probe()).
+	 */
+	if (coresight_ops(sink)->pm_save_disable &&
+	    coresight_ops(sink)->pm_restore_enable) {
+		pr_warn_once("coresight PM failed: source has no PM callbacks; "
+			     "cannot safely control sink\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
 static int coresight_pm_device_save(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
+		return 0;
+
 	return coresight_ops(csdev)->pm_save_disable(csdev);
 }
 
 static void coresight_pm_device_restore(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
+		return;
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
@@ -1919,15 +1939,24 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	/*
+	 * Save the sink. Most sinks do not implement a save callback to avoid
+	 * latency from memory copying. We assume the sink's save and restore
+	 * always succeed.
+	 */
+	coresight_pm_device_save(coresight_get_sink(path));
 	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *from, *to;
 	int ret;
 
+	coresight_pm_device_restore(sink);
+
 	from = coresight_path_first_node(path);
 	/* Enable up to the node before sink */
 	to = list_prev_entry(coresight_path_last_node(path), link);
@@ -1940,6 +1969,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	return;
 
 path_failed:
+	coresight_pm_device_save(sink);
+
 	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
 	       smp_processor_id(), ret);
 

-- 
2.34.1


