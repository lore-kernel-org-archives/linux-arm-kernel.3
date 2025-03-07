Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80F6C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlcdbkrabUG2lcUBU5BlLlpmLXWnOKhgRPLM1uz4Ib0=; b=nXgf05RwycXjZQsEObzQ6mBZrB
	0fA9QdjX+k4M1Qfwt6hLBEyF8aFFTsFLsPy2e1MDzK2vJOgzwisQoMtmuusEhf4drgPmpp9a/+JGJ
	vcYqfHohH7BIIYbAxdxqyvFme3EIXC7aT8v42STWlNBEHSkv6aXYXrS2RvPfc4LSVg4s3GbLjmg7h
	6b6EmA/6IkajVh+5bZtcBg7xQZ8OH84k4Ym36AsDje8/hXAyraFvKZEAIGLIPFf4HWzjaKV8voRnk
	FuWFxL0UP1ZeQDVkuaqFx9hxW2mkmVjGdiXYWGpnV1ri4IT+9ozLPJymb5PY+FVMpd3SHXYOSrDCd
	qQbENyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeJV-0000000FUNl-3Y3h;
	Fri, 07 Mar 2025 20:28:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeEu-0000000FTnK-02mF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:24:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E667716A3;
	Fri,  7 Mar 2025 12:24:23 -0800 (PST)
Received: from e128066.arm.com (unknown [10.57.40.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A99083F5A1;
	Fri,  7 Mar 2025 12:24:07 -0800 (PST)
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
Subject: [PATCH v3 2/5] perf: Allow periodic events to alternate between two sample periods
Date: Fri,  7 Mar 2025 20:22:44 +0000
Message-Id: <20250307202247.648633-3-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307202247.648633-1-mark.barnett@arm.com>
References: <20250307202247.648633-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122412_134598_D8D3F77B 
X-CRM114-Status: GOOD (  21.23  )
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

This change modifies perf_event_attr to add a second, alternative
sample period field, and modifies the core perf overflow handling
such that when specified an event will alternate between two sample
periods.

Currently, perf does not provide a  mechanism for decoupling the period
over which counters are counted from the period between samples. This is
problematic for building a tool to measure per-function metrics derived
from a sampled counter group. Ideally such a tool wants a very small
sample window in order to correctly attribute the metrics to a given
function, but prefers a larger sample period that provides representative
coverage without excessive probe effect, triggering throttling, or
generating excessive amounts of data.

By alternating between a long and short sample_period and subsequently
discarding the long samples, tools may decouple the period between
samples that the tool cares about from the window of time over which
interesting counts are collected.

It is expected that typically tools would use this feature with the
cycles or instructions events as an approximation for time, but no
restrictions are applied to which events this can be applied to.

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
Signed-off-by: Mark Barnett <mark.barnett@arm.com>
---
 include/linux/perf_event.h      |  5 +++++
 include/uapi/linux/perf_event.h |  3 +++
 kernel/events/core.c            | 39 ++++++++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 8333f132f4a9..99ba72c8fb6d 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -276,6 +276,11 @@ struct hw_perf_event {
 	 */
 	u64				freq_time_stamp;
 	u64				freq_count_stamp;
+
+	/*
+	 * Indicates that the alternative sample period is used
+	 */
+	bool				using_alt_sample_period;
 #endif
 };
 
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 0524d541d4e3..499a8673df8e 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: alt_sample_period */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -531,6 +532,8 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+	__u64	alt_sample_period;
 };
 
 /*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index bcb09e011e9e..7ec8ec6ba7ef 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4178,6 +4178,8 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
 	s64 period, sample_period;
 	s64 delta;
 
+	WARN_ON_ONCE(hwc->using_alt_sample_period);
+
 	period = perf_calculate_period(event, nsec, count);
 
 	delta = (s64)(period - hwc->sample_period);
@@ -9894,6 +9896,7 @@ static int __perf_event_overflow(struct perf_event *event,
 				 int throttle, struct perf_sample_data *data,
 				 struct pt_regs *regs)
 {
+	struct hw_perf_event *hwc = &event->hw;
 	int events = atomic_read(&event->event_limit);
 	int ret = 0;
 
@@ -9913,6 +9916,18 @@ static int __perf_event_overflow(struct perf_event *event,
 	    !bpf_overflow_handler(event, data, regs))
 		goto out;
 
+	/*
+	 * Swap the sample period to the alternative period
+	 */
+	if (event->attr.alt_sample_period) {
+		bool using_alt = hwc->using_alt_sample_period;
+		u64 sample_period = (using_alt ? event->attr.sample_period
+					       : event->attr.alt_sample_period);
+
+		hwc->sample_period = sample_period;
+		hwc->using_alt_sample_period = !using_alt;
+	}
+
 	/*
 	 * XXX event_limit might not quite work as expected on inherited
 	 * events
@@ -12335,9 +12350,19 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	if (attr->freq && attr->sample_freq)
 		hwc->sample_period = 1;
 	hwc->last_period = hwc->sample_period;
-
 	local64_set(&hwc->period_left, hwc->sample_period);
 
+	/*
+	 * alt_sample_period cannot be used with freq
+	 */
+	if (attr->freq && attr->alt_sample_period)
+		goto err_ns;
+
+	if (attr->alt_sample_period) {
+		hwc->sample_period = attr->alt_sample_period;
+		hwc->using_alt_sample_period = true;
+	}
+
 	/*
 	 * We do not support PERF_SAMPLE_READ on inherited events unless
 	 * PERF_SAMPLE_TID is also selected, which allows inherited events to
@@ -12807,9 +12832,21 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (attr.freq) {
 		if (attr.sample_freq > sysctl_perf_event_sample_rate)
 			return -EINVAL;
+		if (attr.alt_sample_period)
+			return -EINVAL;
 	} else {
 		if (attr.sample_period & (1ULL << 63))
 			return -EINVAL;
+		if (attr.alt_sample_period) {
+			if (!attr.sample_period)
+				return -EINVAL;
+			if (attr.alt_sample_period & (1ULL << 63))
+				return -EINVAL;
+			if (attr.alt_sample_period > attr.sample_period)
+				return -EINVAL;
+			if (attr.alt_sample_period == attr.sample_period)
+				attr.alt_sample_period = 0;
+		}
 	}
 
 	/* Only privileged users can get physical addresses */
-- 
2.43.0


