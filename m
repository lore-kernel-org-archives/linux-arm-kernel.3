Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446C0C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEbO4sxz9pHnBSx3pNPxBuHVK9OhbQ6SnGUVlt6k4PE=; b=pTEbEHVtr/8gRaYxWXLpZOUyJ/
	/9Iz1LZeRAQhIuy0ix+6+hRDa68+vVU9wyR7H7Nzq+wXbCYLLFUsjh9r8K9JkVR2IuqmnjnQkJapj
	Ug56FAuvHsiQPnou4Fpc3xsildhhCMLneu2l4okI3Alcb40c/DSX2udX7rtgqj9HVE2Cwh7rWyUow
	YYAdRW0iuDptxyidOjtIcTaKumrcUb3UOHrVbjWKPV8aMgyxUvT8K/D0JVfKmwF+ueuuUT/Ouni+n
	Q9y5VU85iw8z5OJfCsrXamEt8xMhkF33r9igWkUboQWOfHPVltxm1FQCmrJMX8RLNXETrE9k3l0Wx
	Wr/kwZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPm-00000007Hwz-0lSY;
	Tue, 15 Sep 2026 15:49:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPS-00000007Hjp-2YN3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZEbO4sxz9pHnBSx3pNPxBuHVK9OhbQ6SnGUVlt6k4PE=; b=XgryfbcY8IybgTBd3Tn/pMBaYl
	EENywApMtBP88rHHB0wGDW5rcnP8QoQgZQV5bV3fykiDEidXHRd77pdWjPvO/t4bC15NA3KWG5QlR
	JTDW6ygtXQdQ3+AgpnlNisqYJPKZJ9dqzVdDpJK1eBgOrXUe6WmK5ZzKfvrjo18yF+Z2cxNPkunD9
	jo62Qj06xhxpYloybfdPx4tLmlxv4zsAA3g1cIVwtkXFj9cDh6Tt6awZGGztUpZz21VskYAPCIXNB
	2ZeHn+JFAXDfV4dWlOKS88p4QLSnNRup4chW/iTuXgJyO6hyG50dGrH3jgwTyJMgJNlElvGRjdZdE
	lbHOru8Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VPP-00000006ySA-2h0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9562E1BF3;
	Tue, 15 Sep 2026 08:49:18 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA7D43F882;
	Tue, 15 Sep 2026 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487362; bh=e9fTX9+bNoGVkOFH4Qc5xPv659tjBz3BDwn9aDSMUtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OcpG6wCuLJZbJyoRHTAmFgIhDIqBD427Ejsgpg1A/PC01RCeX1KEH+dva5tye+j3J
	 XpczWbIXuuBXKCvtgua8QL/HvBW7dc/jbKnvcCvBwFGzRv6EFyx9mbIws9nH9VERl+
	 tf3l3wEQyP2CYcPmbGHQfJ9BVp6CdEpkblYnp7Vw=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:53 +0100
Subject: [PATCH 07/25] coresight: perf: Validate the live context through
 its path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-7-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=2724;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=e9fTX9+bNoGVkOFH4Qc5xPv659tjBz3BDwn9aDSMUtw=;
 b=lAdf8oZUCVNhZymCOH1NZ4X3CSaEiL4HcJYo0fhzXenTJ7he1VwNMBIwQjGySYJvN/gS0w8Cv
 cpstf1Hx1ohDR7sa43msEv1h/iZY9/3BfcDYV2SEEmv71gVGkNuVTvL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164924_016244_7BCCDD6A 
X-CRM114-Status: GOOD (  15.82  )
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

etm_event_get_ctxt_path() returns a path only when the per-CPU
context has published event data and that data contains a path for the
current CPU. Perf PMU callbacks run on the same CPU in atomic context,
and only the normal stop clears the event data. A returned path therefore
establishes that the pause and stop callbacks have a live ETM context.

The AUX handle has a separate lifetime. It can be absent after an AUX
transaction could not be restarted while the CoreSight path still needs
to be paused or disabled. The handle is acquired for the callback event
before event data is published, and another ETM event cannot replace it
while the published context remains live. Thus any active handle belongs
to that context, and etm_event_update_buffer() uses perf_get_aux() to
determine whether it remains valid.

Remove the redundant comparisons of the handle with the event and event
data, together with the redundant event_data check. Use the path to
validate the ETM context lifetime and perf_get_aux() to validate the AUX
handle lifetime.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index afd22fd4a851e600ab69fd5b6883e6f8518b2cab..c7454da5c881c4a8eea5cc77902c9113c297096e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -698,9 +698,6 @@ static void etm_event_pause(struct coresight_path *path,
 	if (coresight_is_percpu_sink(sink))
 		return;
 
-	if (WARN_ON_ONCE(handle->event != event))
-		return;
-
 	event_data = READ_ONCE(ctxt->event_data);
 	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
 
@@ -728,14 +725,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		return;
 	}
 
-	/*
-	 * If we still have access to the event_data via handle,
-	 * confirm that we haven't messed up the tracking.
-	 */
-	if (handle->event &&
-	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
-		return;
-
 	event_data = READ_ONCE(ctxt->event_data);
 	/* Clear the event_data as this ETM is stopping the trace. */
 	WRITE_ONCE(ctxt->event_data, NULL);
@@ -743,10 +732,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	if (event->hw.state == PERF_HES_STOPPED)
 		return;
 
-	/* We must have a valid event_data for a running event */
-	if (WARN_ON(!event_data))
-		return;
-
 	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
 	if (!source || !sink)

-- 
2.34.1


