Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B902E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEglUpkX5hhqQjwTzS016A/2qsEy/DKKRg5xFskANcA=; b=M3n9l8sueUt5aBXH7ZBZy4RXC4
	g/ROC4N8qqXHfYI+9IQFdUHXiaKQVziKSUP4Etb7+2wJ+pGybRwpxrIKQZdHqIU9UB4TGmKVyAF5d
	AUgYWh9g4cMU9GYX8Yp2JhfvdnXDwjtJC3oLCMOSFDD3oIoAPkpQXk9jUE3LmazFL4bmWPk95ZYgB
	nz/y8DxJBxt+0qzVwyheQcxNljC6f0IbS7POpLBiDa2eOlijOrqj11POIJwUSyift6twm+wAA9nW+
	6o6DHFV9Gk8/QcHrmAHWkjed6kOPTfk52Tf/usP7tlhoJdkuaPesdwFD/zM9KKoXF5tPwbQ8jnFV7
	Z0cOhGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P10-00000004Hth-29cp;
	Sun, 05 Apr 2026 15:03:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0x-00000004HpG-2rkm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B5BC26BE;
	Sun,  5 Apr 2026 08:03:45 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55F6C3F62B;
	Sun,  5 Apr 2026 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401431; bh=payx2C2rQ+j4ZUNG51DXGuD0c0fz1h5v+A97XdNDA/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QooK79PHWnDWELp1369dGIv2egxCIl8UW11nvsHQqpTOLY5Uf6qVerEvPJ0W7Ywhr
	 7YEnNQlSvXcC/ocv7Xpyuuyd2gG0C3Fzej3GNLssmtOlkel6FaMbG5EyQZFUrxuANg
	 qgaQhuaNvK5q9jwaFngAWDhdQQcprSIXgfhpfJK4=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:52 +0100
Subject: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=4080;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=payx2C2rQ+j4ZUNG51DXGuD0c0fz1h5v+A97XdNDA/8=;
 b=JlobQ0I/Un1C8YyePoadFMDUj9eno1zNcaBlAF2/eGbZ42Faup6aIAPUOcGNzI4SQ4Y79S4z/
 6emO/l7TNzAA2ogCchwJGOgzO7xdALdRVX+NHPQJQZyLNhYnuHcUvKI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080351_850760_4A7841FB 
X-CRM114-Status: GOOD (  18.54  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
 /* Return: 1 if PM is required, 0 if skip, <0 on error */
 static int coresight_pm_check(struct coresight_path *path)
 {
-	struct coresight_device *source;
-	bool source_has_cb;
+	struct coresight_device *source, *sink;
+	bool source_has_cb, sink_has_cb;
 
 	if (!path)
 		return 0;
 
 	source = coresight_get_source(path);
-	if (!source)
+	sink = coresight_get_sink(path);
+	if (!source || !sink)
 		return 0;
 
 	/* Don't save and restore if the source is inactive */
@@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct coresight_path *path)
 	if (source_has_cb)
 		return 1;
 
+	sink_has_cb = coresight_ops(sink)->pm_save_disable &&
+		      coresight_ops(sink)->pm_restore_enable;
+	/*
+	 * It is not permitted that the source has no callbacks while the sink
+	 * does, as the sink cannot be disabled without disabling the source,
+	 * which may lead to lockups. Alternatively, the ETM driver should
+	 * enable self-hosted PM mode at probe (see etm4_probe()).
+	 */
+	if (sink_has_cb) {
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
 
@@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	ret = coresight_pm_device_save(coresight_get_sink(path));
+	if (ret)
+		goto sink_failed;
+
 	return 0;
+
+sink_failed:
+	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
+					   from, to))
+		coresight_pm_device_restore(source);
+
+	pr_err("Failed in coresight PM save on CPU%d: %d\n",
+	       smp_processor_id(), ret);
+	this_cpu_write(percpu_pm_failed, true);
+	return ret;
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
 	/* Up to the node before sink to avoid latency */
 	to = list_prev_entry(coresight_path_last_node(path), link);
@@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	return;
 
 path_failed:
+	coresight_pm_device_save(sink);
+
 	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
 	       smp_processor_id(), ret);
 

-- 
2.34.1


