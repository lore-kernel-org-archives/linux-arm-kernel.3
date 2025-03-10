Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwlGj6Hchdxakq37kd6CdZyEXv9W6UVVmypf4GHk0yI=; b=cwtm5GaB+xWKSLa3Zu5yoUtNIP
	J9m1cvZu8fugZ0HDSyis6DPnIyQUxqpryMhmXXMo0NXGez5hqM608ATnkizEIFY5cV5JEozrAZeLI
	cjMXhGsQNq75muXEvtZSZ/+2EL0XFaJt4Rv8Fj+fjDyUutxlQmEvXPbdyDJe4jHbHuj0iMT5vrpJf
	byXRJDkiybd0BSLjNx/NKpRpV4gOgrFlCGH+xzfOCUMr15rDhgxWo0i8VFDopk6MLjvyGDbY2WZ6+
	19hckz0XhyP+okHayyMu1eO/DW7XVwk0N16+hdW8uglm92hNADawIdKe912vObRctax96n51CBpp+
	fgqYg1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbDU-00000002QCL-2qOV;
	Mon, 10 Mar 2025 11:22:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trahW-00000002JLu-41BG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:49:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 164C0153B;
	Mon, 10 Mar 2025 03:49:50 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE3223F5A1;
	Mon, 10 Mar 2025 03:49:36 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 5/8] coresight: etm: Add an attribute for updating buffer
Date: Mon, 10 Mar 2025 10:49:16 +0000
Message-Id: <20250310104919.58816-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104919.58816-1-leo.yan@arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034939_078390_CE84B3D1 
X-CRM114-Status: GOOD (  18.59  )
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

Add an attribute for updating buffer when the AUX trace is paused.  And
populate the value to the 'update_buf_on_pause' flag during the AUX
setting up.

If the AUX pause operation is attached to a PMU counter, when the
counter is overflow and if the PMU interrupt in an NMI, then AUX pause
operation will be triggered in the NMI context.  On the other hand, the
per CPU sink has its own interrupt handling.  Thus, there will be a race
condition between the updating buffer in NMI and sink's interrupt
handler.

To avoid the race condition, this commit disallows updating buffer on
AUX pause for the per CPU sink.  Currently, this is only applied for
TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  | 20 +++++++++++++++++++
 .../hwtracing/coresight/coresight-etm-perf.h  |  2 ++
 include/linux/coresight-pmu.h                 |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 29d52386ffbb..d759663a1f7d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -62,6 +62,8 @@ PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
 PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
 PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+PMU_FORMAT_ATTR(update_buf_on_pause,
+		"config:" __stringify(ETM_OPT_UPDATE_BUF_ON_PAUSE));
 /* preset - if sink ID is used as a configuration selector */
 PMU_FORMAT_ATTR(preset,		"config:0-3");
 /* Sink ID - same for all ETMs */
@@ -103,6 +105,7 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+	&format_attr_update_buf_on_pause.attr,
 	NULL,
 };
 
@@ -434,6 +437,23 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!sink)
 		goto err;
 
+	/* Populate the flag for updating buffer on AUX pause */
+	event_data->update_buf_on_pause =
+		!!(event->attr.config & BIT(ETM_OPT_UPDATE_BUF_ON_PAUSE));
+
+	if (event_data->update_buf_on_pause) {
+		/*
+		 * The per CPU sink has own interrupt handling, it might have
+		 * race condition with updating buffer on AUX trace pause if
+		 * it is invoked from NMI.  To avoid the race condition,
+		 * disallows updating buffer for the per CPU sink case.
+		 */
+		if (coresight_is_percpu_sink(sink)) {
+			dev_err(&sink->dev, "update_buf_on_pause is not permitted.\n");
+			goto err;
+		}
+	}
+
 	/* If we don't have any CPUs ready for tracing, abort */
 	cpu = cpumask_first(mask);
 	if (cpu >= nr_cpu_ids)
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 744531158d6b..52b9385f8c11 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -51,6 +51,7 @@ struct etm_filters {
  * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
  * @snk_config:		The sink configuration.
  * @cfg_hash:		The hash id of any coresight config selected.
+ * @update_buf_on_pause: The flag to indicate updating buffer on AUX pause.
  * @path:		An array of path, each slot for one CPU.
  */
 struct etm_event_data {
@@ -59,6 +60,7 @@ struct etm_event_data {
 	cpumask_t aux_hwid_done;
 	void *snk_config;
 	u32 cfg_hash;
+	bool update_buf_on_pause;
 	struct list_head * __percpu *path;
 };
 
diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 89b0ac0014b0..04147e30c2f2 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -35,6 +35,7 @@
 #define ETM_OPT_CTXTID2		15
 #define ETM_OPT_TS		28
 #define ETM_OPT_RETSTK		29
+#define ETM_OPT_UPDATE_BUF_ON_PAUSE	30
 
 /* ETMv4 CONFIGR programming bits for the ETM OPTs */
 #define ETM4_CFG_BIT_BB         3
-- 
2.34.1


