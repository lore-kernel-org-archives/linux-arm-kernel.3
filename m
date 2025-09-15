Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B4CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MyRi66ehv8eMgAGglOu2Yhjn0VrJE0YAewKAMiGaX4=; b=2xR159lN1xERqCeHHn6m1qApst
	df5LybiZZs8TPsnWEa0vK9wWPkJqHzWNVUXb4u9vxb4xdbn7ckQu9GV44Xn5Txbbd7ZkfIe7nPRo2
	et65kJVXOT8Uxo2rfJuD+gGYVt+fEUPoiVhg5w9RsS36WjM0WD7zRCZDqLIIBCdCTkNGuOsix78Yn
	1uyqU4jawOhhz/n6LVUKlDktoPLOiOB3pwTMxe6/P1zh/vR4NLiZFaNYEcpqC/FYOowXZlLVa3+bM
	3HS2eL/KGbmnJA2NwboMWnQUsDZN/MEzqUdPq3g8jtDfo5kjNtLqNiDsxv5beo48ZQ6tq0pTtcwTU
	uwVn6gPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xu-00000003gfQ-1Q8y;
	Mon, 15 Sep 2025 10:34:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xa-00000003gDN-05oj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5321E1C2B;
	Mon, 15 Sep 2025 03:34:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E99823F66E;
	Mon, 15 Sep 2025 03:34:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:50 +0100
Subject: [PATCH v3 27/31] coresight: Add PM callbacks for percpu sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-27-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=5895;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=2nrCz8ebdM+X/8JMktB2062XDBMV1Z2lR/MANA8dBVc=;
 b=bV28bIviSyqxNz96ssG3S2RT/Bjrmx0J2G/RDUu7Qu9hkmUieR2Rt8QjwL/JxVXsKnaMie0ag
 V1YvnFmWyAwCdesoJaxlz2FhOvzVR5sUKDcCjNUSp5la2ApGM1U8Dgf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033434_159649_6FB5D10A 
X-CRM114-Status: GOOD (  18.86  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.
This commit registers save and restore callbacks for the per-CPU sink
via the PM notifier.

There are no changes to the coresight_enable_helpers() function; the
code movement is solely for compilation purposes.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 101 +++++++++++++++++++++------
 include/linux/coresight.h                    |   4 ++
 2 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 04e8c3b862494abb2a5a46d385f0ff4cad93b71f..ef9dbba285710fe508580ee2726e22bcc654014e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -393,6 +393,25 @@ static void coresight_disable_helper(struct coresight_device *csdev, void *data)
 	helper_ops(csdev)->disable(csdev, data);
 }
 
+static int coresight_enable_helpers(struct coresight_device *csdev,
+				    enum cs_mode mode, void *data)
+{
+	int i, ret = 0;
+	struct coresight_device *helper;
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		ret = coresight_enable_helper(helper, mode, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
 {
 	int i;
@@ -480,6 +499,43 @@ static void coresight_restore_source(struct coresight_device *csdev)
 		source_ops(csdev)->restore(csdev);
 }
 
+static int coresight_save_percpu_sink(struct coresight_device *csdev)
+{
+	int ret;
+
+	if (csdev && sink_ops(csdev)->save) {
+		ret = sink_ops(csdev)->save(csdev);
+		if (ret)
+			return ret;
+
+		coresight_disable_helpers(csdev, NULL);
+	}
+
+	/* Return success if callback is not supported */
+	return 0;
+}
+
+static int coresight_restore_percpu_sink(struct coresight_device *csdev,
+					 struct coresight_path *path,
+					 enum cs_mode mode)
+{
+	int ret = 0;
+
+	if (csdev && sink_ops(csdev)->restore) {
+		ret = coresight_enable_helpers(csdev, mode, path);
+		if (ret)
+			return ret;
+
+		ret = sink_ops(csdev)->restore(csdev);
+		if (ret) {
+			coresight_disable_helpers(csdev, path);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -553,25 +609,6 @@ void coresight_disable_path(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
-static int coresight_enable_helpers(struct coresight_device *csdev,
-				    enum cs_mode mode, void *data)
-{
-	int i, ret = 0;
-	struct coresight_device *helper;
-
-	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
-		helper = csdev->pdata->out_conns[i]->dest_dev;
-		if (!helper || !coresight_is_helper(helper))
-			continue;
-
-		ret = coresight_enable_helper(helper, mode, data);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int _coresight_enable_path(struct coresight_path *path,
 				  enum cs_mode mode, void *sink_data,
 				  bool in_idle)
@@ -1670,9 +1707,12 @@ EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
+	int ret;
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
 	struct coresight_path *path;
+	struct coresight_device *sink;
+	enum cs_mode mode;
 
 	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
@@ -1685,18 +1725,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	if (WARN_ON(!path))
 		return NOTIFY_BAD;
 
+	sink = coresight_get_sink(path);
+	mode = coresight_get_mode(source);
+
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
 
-		coresight_disable_path_from(path, NULL, true);
+		ret = 0;
+		if (coresight_is_percpu_sink(sink))
+			ret = coresight_save_percpu_sink(sink);
+		else
+			coresight_disable_path_from(path, NULL, true);
+
+		if (ret) {
+			coresight_restore_source(source);
+			return NOTIFY_BAD;
+		}
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
-		if (_coresight_enable_path(path,
-					   coresight_get_mode(source),
-					   NULL, true))
+		if (coresight_is_percpu_sink(sink))
+			ret = coresight_restore_percpu_sink(sink, path, mode);
+		else
+			ret = _coresight_enable_path(path, mode, NULL, true);
+
+		if (ret)
 			return NOTIFY_BAD;
 
 		coresight_restore_source(source);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 462876b5a870f3e93ad2a1807a9045d5eb115ccd..21bb99f9684747d7a610aa7185e1ba5f987248d9 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -363,6 +363,8 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @save:		save context for a sink.
+ * @restore:		restore context for a sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -375,6 +377,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	int (*save)(struct coresight_device *csdev);
+	int (*restore)(struct coresight_device *csdev);
 };
 
 /**

-- 
2.34.1


