Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD64DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uNO4PEhVf4JNqQZWER19oMfwYf9gjlkkCYqsW2dWds=; b=LhNVK3w/t+z9PTjG+TcHLoU9o4
	CTtwltDLT122KyrglE+cTvqJptF+dJ+Jol8DrUs9r8fRWglzqotx1F5P1MW5CSNwHY8zhdpcveb1L
	qQBBtDQ3gd5gCBq1DZR0pfbGvW4dTOSgPI4Aj90qXdYVeHIxIasynTsra5Nije4wiJvGq5MF/dmL3
	oMKW57hk5fbRrRCqJo/AkM+4waXR608OAlG5F2Oxb5Y6UxQL3c2WK/OLdxhwPeB5Vvrvpuh6fD0EL
	FC2OFRQTEPvzTz8a5E5rnDMn+jgMWxIl5UpEHW+O1kjJSgbPMQVmRCajEKFnyq+EEy4c8Eg5Pu7RM
	XCHKpBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3G-00000007S7K-1ydP;
	Fri, 01 May 2026 16:49:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3C-00000007S1S-4BLn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 659651692;
	Fri,  1 May 2026 09:49:08 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F20D3F7B4;
	Fri,  1 May 2026 09:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654153; bh=u8oKz9ssedqh7mX9Yq53WjIvhmntM5uSafooyX/L8lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JIbojdoeXyPp95Qsuw1Q7StzrV1bEBeregGB9Rn7OaehnnmFP6tiRB5PyPJtS0Egi
	 Tixvj6NDgs43Zx2NhBG9agvvovhJDtr1x4oSUhjCziAFpp1GsMHZh83fZ4dowFbFeu
	 3RJ4rp6WvDHLX7Bvo0H4BpRfR91gmooeoTEs2unA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:04 +0100
Subject: [PATCH v11 23/27] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-23-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=4031;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=u8oKz9ssedqh7mX9Yq53WjIvhmntM5uSafooyX/L8lo=;
 b=Rnkg9hNPqDsK/UX/QWRdsHAwm82jy0e3RmqQ9xFpUBRJ8vn7xD8YpxK/EnE5L9UqXMeJ3aoJS
 oUPDeq9Kg/eBirm43kjzTEGF8JecUH8ycrpdjmaOFyMlOt4QJFUSzhc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094915_191890_15C28F70 
X-CRM114-Status: GOOD (  17.54  )
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
index d65bb2ea7b0560d44abf302a3939b3744ca0c880..b2301ae0fd358242c59b9f4da99faae0db5ff894 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1850,7 +1850,7 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
 static int coresight_pm_is_needed(struct coresight_path *path)
 {
-	struct coresight_device *source;
+	struct coresight_device *source, *sink;
 
 	if (this_cpu_read(percpu_pm_failed))
 		return -EIO;
@@ -1859,7 +1859,8 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 		return 0;
 
 	source = coresight_get_source(path);
-	if (!source)
+	sink = coresight_get_sink(path);
+	if (!source || !sink)
 		return 0;
 
 	/* pm_save_disable() and pm_restore_enable() must be paired */
@@ -1867,16 +1868,35 @@ static int coresight_pm_is_needed(struct coresight_path *path)
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
 
@@ -1895,15 +1915,24 @@ static int coresight_pm_save(struct coresight_path *path)
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
@@ -1916,6 +1945,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	return;
 
 path_failed:
+	coresight_pm_device_save(sink);
+
 	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
 	       smp_processor_id(), ret);
 

-- 
2.34.1


