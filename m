Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49809C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPyNVALIdQhnIRX1DJjmFOsyizuT6w3tXhqxhxQnuJM=; b=thqY+RAoMoanfotRMbR0UQAPyD
	GT3lK2fak6t7i+giFlpuDOWuj3us98ycryKhlx2R01ipRj8inRywU+hoy6ST5QN6WC7uEwUOszE6J
	nok6l51CXEIbjMcpBkpGzbP4p3TeAO7Bhd0qgm79DhOFoj4xV9UNjPUuWiP1WOBfQsWn3AdiyODLm
	7lj92ja5YJHftCUh/APuG1/VXmea2PYzxJ0vVur7uksszLqAEvTBxCTKmubermmSuiHkixzNR2XMB
	MttbXeNZx1TJcpo2ujgSwn9LH91Mqn3im+igVCu2kAjK7Az8SHXZpAezMw7AjhMoslCkrfO+hWmgk
	QHqyZH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPn-00000007I0e-2JMQ;
	Tue, 15 Sep 2026 15:49:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPh-00000007Htj-1Kg8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9DF1570;
	Tue, 15 Sep 2026 08:49:37 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 640363F882;
	Tue, 15 Sep 2026 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487380; bh=ZLhP9+hk4aabaXSGT54lI6NuOvSPZUJCkdIwDLOtAu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BdAXaQPhr83OQa7dCtrINo7V0Ik022DcCN3ePCCAPmH0rPYM2/ka84ZuMHgCI0Nj7
	 79/IvJE6eiWpBtG7rAU3MfDfD2yRisiHh3S6xevjvez5+zw3oui0mqnqIhhWqQNkcs
	 pzR8eFyE9xwoyT+/G2Kry12YSH7rPk0hUdw1k5mQ=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:00 +0100
Subject: [PATCH 14/25] coresight: perf: Look up the trace path in
 etm_event_pause()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-14-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=2117;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZLhP9+hk4aabaXSGT54lI6NuOvSPZUJCkdIwDLOtAu4=;
 b=xElk10YnXyUhppvLhUxoiFU+LW5Fv+8kQIwvgFAKzhUuLDJByQtapb0TsuCyCt6DtEpgYaPHC
 SD9k9LTKFx+B2aE3gtHt8F8WAVaE/zrwGnWOwU4xe+wyxQRCPwyqehr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084941_439858_81EFCF68 
X-CRM114-Status: GOOD (  13.39  )
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

Have etm_event_pause() retrieve the active path from the event context
instead of passing the path from etm_event_stop(). Move the stop path
lookup after the pause dispatch so each operation resolves its own path.

This prepares etm_event_stop() to coordinate hardware access before
looking up the active context.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f66c99b26e1862ab04105704276c901b21728207..8f803914e9abfb18e080ff68371ad8b32042f180 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -694,10 +694,10 @@ static void etm_event_update_buffer(struct perf_event *event,
 	perf_aux_output_end(handle, 0);
 }
 
-static void etm_event_pause(struct coresight_path *path,
-			    struct perf_event *event,
+static void etm_event_pause(struct perf_event *event,
 			    struct etm_ctxt *ctxt)
 {
+	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct etm_event_data *event_data;
@@ -735,7 +735,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct coresight_device *source, *sink;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
-	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
+	struct coresight_path *path;
 	struct hw_perf_event *hwc = &event->hw;
 	struct etm_event_data *event_data;
 
@@ -744,7 +744,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		return;
 
 	if (mode & PERF_EF_PAUSE)
-		return etm_event_pause(path, event, ctxt);
+		return etm_event_pause(event, ctxt);
+
+	path = etm_event_get_ctxt_path(ctxt);
 
 	/*
 	 * With no path enabled, there is no hardware to stop or trace data

-- 
2.34.1


