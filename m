Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BDFC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzDdrPtSHerqN6kFxdXwmdTAIwrbO/nA7wxQQ+uXlpY=; b=Uugrla95rQcWqCRs0h+HtsfWJm
	63SUpJYHLvIgudZTRRIVJnGXjcgO/0h679hW9Nr8opnYKLraKAoQrmgPeCLs7ll4p1ak982sTGuv2
	ymHCdd3gFFO9IcG/p64SKVPr4XfVatSJQ98bjEMvkghPPGUqBswDmuIccoy6TE95+Qm7nI4ep6YHz
	E3IBhglGaUrtgO3Ui2vxN2mtQVHJmGSFrI+uITfEKT+hgcBKu+yPmx2+NB7/dqsBEAwSZ+w+MKtaW
	4BHjxLcRGOyepyUTHnM2JkeqPj7aOby6eqtPf299H4JVKqs4Jx5cgPBv7Vp1q8yNWwir/RPVcQA3e
	eleReeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPX-00000007Hmf-3Wfv;
	Tue, 15 Sep 2026 15:49:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPH-00000007HgF-1GYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A040215A1;
	Tue, 15 Sep 2026 08:49:10 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D45ED3F882;
	Tue, 15 Sep 2026 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487354; bh=WbRS/Ap5Om/Fa2STqxqbiF5EMD3hpUj6Nz87W986fSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SlXuDNmquYrW0O4NHVPVD9q9KwtgKyf0TRfzbDnSwgt/D5odHlAORmKE7/fCkR02F
	 n1IyZBZIoly0Jn8hj/1LWeKGNfbzDbsJ3VC09KMO9wCcbIKAKcJN6ufMxfBXT+EonX
	 rUjvT66vyjQIm1Ikl8qL5aOSQsEDYmNT+S6LS99o=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:50 +0100
Subject: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-4-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=4688;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WbRS/Ap5Om/Fa2STqxqbiF5EMD3hpUj6Nz87W986fSw=;
 b=e3BQsslojgwRU2uNLB4vpSsPSM4tMUfDSc0pAs9nnrNLoQelZXXm/2xqF7xcg4KzpdRQ4PJ+Z
 FUS3jLp68qtAwDz+SzIFhOqUuBtdcYpMvxTNNxWa2Yy3GMNCj+1SMsP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084915_650387_6BA70F2A 
X-CRM114-Status: GOOD (  19.49  )
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

Since commit 9734e25fbf5a ("perf: Fix the throttle logic for a
group"), the perf core stops every event in a throttled group by calling
the PMU stop callback with flags set to zero:

  perf_event_throttle()
    `> event->pmu->stop(event, 0)

The ETM perf stop callback only ends the AUX output handle when
PERF_EF_UPDATE was set. For throttling with mode is zero, it skips to
end the AUX handle. When the event is later unthrottled and ETM tracing
is started again, perf_aux_output_begin() sees the perf handle is nest
enabled and triggers a warning:

  [  181.161897] ------------[ cut here ]------------
  [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
  [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
  [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
  [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
  [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
  [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
  [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
  [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
  [  181.351280] sp : ffff800080003be0
  [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
  [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
  [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
  [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
  [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
  [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
  [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
  [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
  [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
  [  181.426411] Call trace:
  [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
  [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
  [  181.438665]  perf_event_unthrottle+0x70/0xa8
  [  181.442964]  perf_event_unthrottle_group+0x40/0x170
  [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
  [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
  [  181.458120]  perf_event_task_tick+0xa8/0x290
  [  181.462418]  sched_tick+0x144/0x2c8
  [  181.465937]  update_process_times+0xc0/0x198

Reproduce this with the command:

  perf record -a -e cs_etm/aux-action=start-paused/k \
	-e cycles/aux-action=pause,period=3000/ \
	-e cycles/aux-action=resume,period=1500/ -- sleep 10

An update of the sink buffer is unnecessary when PERF_EF_UPDATE is not
set, but the AUX output operation must still be terminated. End it with
a size of zero so that a later restart can acquire a new handle.

Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a8764ea429d712890265c84648e889e..a45f69f39f175f3044322b25fe5413fb97154496 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -748,13 +748,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 * handle due to lack of buffer space), we don't
 	 * have to do anything here.
 	 */
-	if (handle->event && (mode & PERF_EF_UPDATE)) {
+	if (!handle->event)
+		goto out;
+
+	if (mode & PERF_EF_UPDATE) {
 		if (WARN_ON_ONCE(handle->event != event))
-			return;
+			goto out;
 
 		/* update trace information */
 		if (!sink_ops(sink)->update_buffer)
-			return;
+			goto out;
 
 		size = sink_ops(sink)->update_buffer(sink, handle,
 					      event_data->snk_config);
@@ -773,8 +776,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
 			perf_aux_output_end(handle, size);
 		else
 			WARN_ON(size);
+	} else {
+		perf_aux_output_end(handle, 0);
 	}
 
+out:
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
 }

-- 
2.34.1


