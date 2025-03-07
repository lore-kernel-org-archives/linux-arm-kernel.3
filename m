Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471DEC28B27
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flp3IMUSsMJZJ0dlK5G3dBfDptX1d3Zaq6rpN6QKmvc=; b=0SJmb+9rf6wsiR6aPc0f0hrWrT
	oE4fhIvMMMmMpQzoWXtNnk5UFd+Ms1dvtF3mWOZpXYP27JWAhn6xfzy//BiLE9oLWKUI/7QdxMhAt
	qyxh1imRFN2JUuGZ8dyJ1Nd4Nsn/cbuo8rWxMmCe5ohiIdbS4W+COXOGmIs+NbfaruHrbIiI4RWBM
	U6jvf3ij/z7T7d6tFHj0dooZT9bC8RCB6zP8WHPpTsHG3FKoCBkEQeyJowFyTMc5PCgqfyw2Mlr86
	GdcOMPj0pZ0bJ5kevWJJm56UXvcY+3NDSMW/4RkstIsAkL/ad7N9oI/0Cz2DCTasFsvfgFKBbmBRq
	aLRL6ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeL7-0000000FUYR-23yo;
	Fri, 07 Mar 2025 20:30:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeF3-0000000FTpZ-3HKJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:24:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20631A2D;
	Fri,  7 Mar 2025 12:24:31 -0800 (PST)
Received: from e128066.arm.com (unknown [10.57.40.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 453603F5A1;
	Fri,  7 Mar 2025 12:24:15 -0800 (PST)
From: mark.barnett@arm.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: ben.gainey@arm.com,
	deepak.surti@arm.com,
	ak@linux.intel.com,
	will@kernel.org,
	james.clark@arm.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Barnett <mark.barnett@arm.com>
Subject: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the alternate sampling period
Date: Fri,  7 Mar 2025 20:22:45 +0000
Message-Id: <20250307202247.648633-4-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307202247.648633-1-mark.barnett@arm.com>
References: <20250307202247.648633-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122421_858130_FC6C6FF8 
X-CRM114-Status: GOOD (  14.67  )
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

From: Ben Gainey <ben.gainey@arm.com>

This change modifies the core perf overflow handler, adding some small
random jitter to each sample period whenever an event switches between the
two alternate sample periods. A new flag is added to perf_event_attr to
opt into this behaviour.

This change follows the discussion in [1], where it is recognized that it
may be possible for certain patterns of execution to end up with biased
results.

[1] https://lore.kernel.org/linux-perf-users/Zc24eLqZycmIg3d2@tassilo/

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
Signed-off-by: Mark Barnett <mark.barnett@arm.com>
---
 include/uapi/linux/perf_event.h | 7 ++++++-
 kernel/events/core.c            | 9 ++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 499a8673df8e..c0076ce8f80a 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -461,7 +461,12 @@ struct perf_event_attr {
 				inherit_thread :  1, /* children only inherit if cloned with CLONE_THREAD */
 				remove_on_exec :  1, /* event is removed from task on exec */
 				sigtrap        :  1, /* send synchronous SIGTRAP on event */
-				__reserved_1   : 26;
+				/*
+				 * Add a limited amount of jitter on each alternate period, where
+				 * the jitter is between [0, (2<<jitter_alt_period) - 1]
+				 */
+				jitter_alt_period : 3,
+				__reserved_1   : 23;
 
 	union {
 		__u32		wakeup_events;	  /* wakeup every n events */
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7ec8ec6ba7ef..be271e21cd06 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -15,6 +15,7 @@
 #include <linux/idr.h>
 #include <linux/file.h>
 #include <linux/poll.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/hash.h>
 #include <linux/tick.h>
@@ -9922,7 +9923,10 @@ static int __perf_event_overflow(struct perf_event *event,
 	if (event->attr.alt_sample_period) {
 		bool using_alt = hwc->using_alt_sample_period;
 		u64 sample_period = (using_alt ? event->attr.sample_period
-					       : event->attr.alt_sample_period);
+					       : event->attr.alt_sample_period)
+				  + (event->attr.jitter_alt_period
+					? get_random_u32_below(2 << event->attr.jitter_alt_period)
+					: 0);
 
 		hwc->sample_period = sample_period;
 		hwc->using_alt_sample_period = !using_alt;
@@ -12849,6 +12853,9 @@ SYSCALL_DEFINE5(perf_event_open,
 		}
 	}
 
+	if (attr.jitter_alt_period && !attr.alt_sample_period)
+		return -EINVAL;
+
 	/* Only privileged users can get physical addresses */
 	if ((attr.sample_type & PERF_SAMPLE_PHYS_ADDR)) {
 		err = perf_allow_kernel(&attr);
-- 
2.43.0


