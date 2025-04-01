Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C732EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm8oudI7/pZicboTm9VPiitCVBKSSnS9ZtUUDslPdS4=; b=LeY+ddxzmtZmoSk3Wt9n0unpF2
	KDIpKI3C3YyQSQGRRV6M7lM4dt+/nRwJh0kZ1cTBDH3oZTn9ZMnJBp2E0+p6lAR4aCNwHAahJp2CO
	fcOkzYfKlWSdMYB58CsN8s1CnRpZIb3AQgLy3Ibc0h8kZ5AzAnM3UTcmNnOBkmKavhVZjBicY7GXg
	NElesK54mN0MQSQgyvlaaAQb4GnTmQkLVtMptD4VjTLSzeaiZ5O4K/rUn9AJHteyOIt9tR0aAE/gs
	DngOqaMat4vAUCPTm2JPFIgaag4PUnoxQiaQeNbHIvsIZ/P2Bbt5+OocODHgymFwHww3g/536ls5N
	nz149krA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzgEj-000000046BL-0ytd;
	Tue, 01 Apr 2025 18:21:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg1I-000000044dY-2KHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:07:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81CD81655;
	Tue,  1 Apr 2025 11:07:31 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FD143F59E;
	Tue,  1 Apr 2025 11:07:26 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 6/7] coresight: perf: Update buffer on AUX pause
Date: Tue,  1 Apr 2025 19:07:07 +0100
Message-Id: <20250401180708.385396-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110728_638888_9EB4E806 
X-CRM114-Status: GOOD (  16.53  )
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

Due to sinks like ETR and ETB don't support interrupt handling, the
hardware trace data might be lost for continuous running tasks.

This commit takes advantage of the AUX pause for updating trace buffer
to mitigate the trace data losing issue.

The per CPU sink has its own interrupt handling.  Thus, there will be a
race condition between the updating buffer in NMI and sink's interrupt
handler.  To avoid the race condition, this commit disallows updating
buffer on AUX pause for the per CPU sink.  Currently, this is only
applied for TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 2dcf1809cb7f..f1551c08ecb2 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -574,14 +574,53 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 }
 
-static void etm_event_pause(struct coresight_device *csdev,
+static void etm_event_pause(struct perf_event *event,
+			    struct coresight_device *csdev,
 			    struct etm_ctxt *ctxt)
 {
+	int cpu = smp_processor_id();
+	struct coresight_device *sink;
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct coresight_path *path;
+	unsigned long size;
+
 	if (!ctxt->event_data)
 		return;
 
 	/* Stop tracer */
 	coresight_pause_source(csdev);
+
+	path = etm_event_cpu_path(ctxt->event_data, cpu);
+	sink = coresight_get_sink(path);
+	if (WARN_ON_ONCE(!sink))
+		return;
+
+	/*
+	 * The per CPU sink has own interrupt handling, it might have
+	 * race condition with updating buffer on AUX trace pause if
+	 * it is invoked from NMI.  To avoid the race condition,
+	 * disallows updating buffer for the per CPU sink case.
+	 */
+	if (coresight_is_percpu_sink(sink))
+		return;
+
+	if (WARN_ON_ONCE(handle->event != event))
+		return;
+
+	if (!sink_ops(sink)->update_buffer)
+		return;
+
+	size = sink_ops(sink)->update_buffer(sink, handle,
+					     ctxt->event_data->snk_config);
+	if (READ_ONCE(handle->event)) {
+		if (!size)
+			return;
+
+		perf_aux_output_end(handle, size);
+		perf_aux_output_begin(handle, event);
+	} else {
+		WARN_ON_ONCE(size);
+	}
 }
 
 static void etm_event_stop(struct perf_event *event, int mode)
@@ -595,7 +634,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct coresight_path *path;
 
 	if (mode & PERF_EF_PAUSE)
-		return etm_event_pause(csdev, ctxt);
+		return etm_event_pause(event, csdev, ctxt);
 
 	/*
 	 * If we still have access to the event_data via handle,
-- 
2.34.1


