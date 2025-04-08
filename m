Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743ECC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeBQc9h5M7q3UQfwf0irk0KULxQkJimYw7hKr7BXjvM=; b=bigbiDTCiUOsvnfPWM0iXZQIA9
	TLqLh0f2DtUSBkRZmAyIqZSDgYfETfRz8Iy5D2mwQDORAqvMA9qoktoQkf98N5vw728Lb0uQOpD01
	6kluOsW8OuVj6FqyF503/XHV5ErapTC5oo3nmiOPprYVP0caLQZjcP0kM6/H05b9tkuIp0V9yuhXP
	Id+RmesdwF9uJe7gQFE/CSMZBSUAWGLFnA2gm12btdiwfXR0oiCE3m/+QvWL2Lt3ebiR1SDKqXrbj
	sJ1Z5cOvPSxe6YibsTqHvmgSgUQ94ECT38Qs6FX3W3ZwM8gMLEH5k3B9QyRMO2rYvyqKBIcEnGDxn
	kausom/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DuM-000000058lu-0tHJ;
	Tue, 08 Apr 2025 18:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CYe-00000004whb-3eer
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 17:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SeBQc9h5M7q3UQfwf0irk0KULxQkJimYw7hKr7BXjvM=; b=BWdIpTqVOwI8IrgxlK8ifcBXrg
	RuTbNJyP/qucSyjmd0WsHSSWM3Zoimb6vi1qX0UksIR+5w2yh1n1Mq4iohMipiER1K/LX+gEL0zV9
	X+RuXojS4LDbS5uSxYY55RenFCDieN5VXcY6cX/pIMt/Emd4wVEoR6mnFPPOstvxnyOQgY6hFaQl+
	hv9o5k9fp/nxqyl522vYtVsjNA+3r9ZKamA3LT7jGpKbvFm05pvcUMkgNmjiT5ee+Km2PXMDm+IXP
	ImJK+w+pxssZPibUouxQ3p/FPMEdLv4t1h6XrQFccFiYY7ArtnUJEoqq6S0g4qi9bPkkbEMkgzg0O
	kTmO32SA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CYb-00000008LaS-0S5S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:16:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D4E71688;
	Tue,  8 Apr 2025 10:16:17 -0700 (PDT)
Received: from e128066.cambridge.arm.com (e128066.cambridge.arm.com [10.1.26.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFB703F59E;
	Tue,  8 Apr 2025 10:16:12 -0700 (PDT)
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
Subject: [PATCH v4 2/5] perf: Allow periodic events to alternate between two sample periods
Date: Tue,  8 Apr 2025 18:15:27 +0100
Message-Id: <20250408171530.140858-3-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408171530.140858-1-mark.barnett@arm.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_181617_466190_E1E37569 
X-CRM114-Status: GOOD (  24.27  )
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
 include/linux/perf_event.h      | 12 +++++-
 include/uapi/linux/perf_event.h | 10 +++++
 kernel/events/core.c            | 69 +++++++++++++++++++++++++++++----
 3 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5a9bf15d4461..be006965054e 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -229,7 +229,11 @@ struct hw_perf_event {
 #define PERF_HES_UPTODATE	0x02 /* event->count up-to-date */
 #define PERF_HES_ARCH		0x04
 
-	int				state;
+	u32				state;
+
+#define PERF_SPS_HF_ON			0x00000001
+#define PERF_SPS_HF_SAMPLE		0x00000002
+	u32				sample_period_state;
 
 	/*
 	 * The last observed hardware counter value, updated with a
@@ -242,6 +246,12 @@ struct hw_perf_event {
 	 */
 	u64				sample_period;
 
+	/*
+	 * The original sample_period value before being modified with
+	 * a high-frequency sampling window.
+	 */
+	u64				sample_period_base;
+
 	union {
 		struct { /* Sampling */
 			/*
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 5fc753c23734..1529f97fb15d 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: hf_sample */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -533,6 +534,15 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+
+	union {
+		__u64 hf_sample;
+		struct {
+			__u64 hf_sample_period : 32,
+			      hf_sample_rand   :  4,
+			      __reserved_4     : 28;
+		};
+	};
 };
 
 /*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 128db74e9eab..5752ac7408b1 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4195,19 +4195,19 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
 
 	period = perf_calculate_period(event, nsec, count);
 
-	delta = (s64)(period - hwc->sample_period);
+	delta = (s64)(period - hwc->sample_period_base);
 	if (delta >= 0)
 		delta += 7;
 	else
 		delta -= 7;
 	delta /= 8; /* low pass filter */
 
-	sample_period = hwc->sample_period + delta;
+	sample_period = hwc->sample_period_base + delta;
 
 	if (!sample_period)
 		sample_period = 1;
 
-	hwc->sample_period = sample_period;
+	hwc->sample_period_base = sample_period;
 
 	if (local64_read(&hwc->period_left) > 8*sample_period) {
 		if (disable)
@@ -6179,7 +6179,7 @@ static void __perf_event_period(struct perf_event *event,
 		event->attr.sample_freq = value;
 	} else {
 		event->attr.sample_period = value;
-		event->hw.sample_period = value;
+		event->hw.sample_period_base = value;
 	}
 
 	active = (event->state == PERF_EVENT_STATE_ACTIVE);
@@ -10064,7 +10064,7 @@ __perf_event_account_interrupt(struct perf_event *event, int throttle)
 		}
 	}
 
-	if (event->attr.freq) {
+	if (event->attr.freq && !(hwc->sample_period_state & PERF_SPS_HF_SAMPLE)) {
 		u64 now = perf_clock();
 		s64 delta = now - hwc->freq_time_stamp;
 
@@ -10197,6 +10197,8 @@ static int __perf_event_overflow(struct perf_event *event,
 				 int throttle, struct perf_sample_data *data,
 				 struct pt_regs *regs)
 {
+	struct hw_perf_event *hwc = &event->hw;
+	u64 sample_period;
 	int events = atomic_read(&event->event_limit);
 	int ret = 0;
 
@@ -10212,6 +10214,33 @@ static int __perf_event_overflow(struct perf_event *event,
 	if (event->attr.aux_pause)
 		perf_event_aux_pause(event->aux_event, true);
 
+	sample_period = hwc->sample_period_base;
+
+	/*
+	 * High Freq samples are injected inside the larger period:
+	 *
+	 *   |------------|-|------------|-|
+	 *   P0          HF P1          HF
+	 *
+	 * By ignoring the HF samples, we measure the actual period.
+	 */
+	if (hwc->sample_period_state & PERF_SPS_HF_ON) {
+		u64 hf_sample_period = event->attr.hf_sample_period;
+
+		if (sample_period <= hf_sample_period)
+			goto set_period;
+
+		if (hwc->sample_period_state & PERF_SPS_HF_SAMPLE)
+			sample_period = hf_sample_period;
+		else
+			sample_period -= hf_sample_period;
+
+		hwc->sample_period_state ^= PERF_SPS_HF_SAMPLE;
+	}
+
+set_period:
+	hwc->sample_period = sample_period;
+
 	if (event->prog && event->prog->type == BPF_PROG_TYPE_PERF_EVENT &&
 	    !bpf_overflow_handler(event, data, regs))
 		goto out;
@@ -11694,6 +11723,7 @@ static void perf_swevent_init_hrtimer(struct perf_event *event)
 		long freq = event->attr.sample_freq;
 
 		event->attr.sample_period = NSEC_PER_SEC / freq;
+		hwc->sample_period_base = event->attr.sample_period;
 		hwc->sample_period = event->attr.sample_period;
 		local64_set(&hwc->period_left, hwc->sample_period);
 		hwc->last_period = hwc->sample_period;
@@ -12675,12 +12705,25 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	pmu = NULL;
 
 	hwc = &event->hw;
+	hwc->sample_period_base = attr->sample_period;
 	hwc->sample_period = attr->sample_period;
-	if (attr->freq && attr->sample_freq)
+	if (attr->freq && attr->sample_freq) {
 		hwc->sample_period = 1;
-	hwc->last_period = hwc->sample_period;
+		hwc->sample_period_base = 1;
+	}
 
-	local64_set(&hwc->period_left, hwc->sample_period);
+	/*
+	 * If the user requested a high-frequency sample period subtract that
+	 * from the first period (the larger one), and set the high-frequency
+	 * value to be used next.
+	 */
+	u64 first_sample_period = hwc->sample_period;
+	if (attr->hf_sample_period && attr->hf_sample_period < hwc->sample_period) {
+		first_sample_period -= attr->hf_sample_period;
+		hwc->sample_period = attr->hf_sample_period;
+	}
+	hwc->last_period = first_sample_period;
+	local64_set(&hwc->period_left, first_sample_period);
 
 	/*
 	 * We do not support PERF_SAMPLE_READ on inherited events unless
@@ -12710,6 +12753,9 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 			return ERR_PTR(err);
 	}
 
+	if (attr->hf_sample_period)
+		hwc->sample_period_state |= PERF_SPS_HF_ON;
+
 	/*
 	 * Disallow uncore-task events. Similarly, disallow uncore-cgroup
 	 * events (they don't make sense as the cgroup will be different
@@ -13131,6 +13177,12 @@ SYSCALL_DEFINE5(perf_event_open,
 	} else {
 		if (attr.sample_period & (1ULL << 63))
 			return -EINVAL;
+		if (attr.hf_sample_period) {
+			if (!attr.sample_period)
+				return -EINVAL;
+			if (attr.hf_sample_period >= attr.sample_period)
+				return -EINVAL;
+		}
 	}
 
 	/* Only privileged users can get physical addresses */
@@ -14054,6 +14106,7 @@ inherit_event(struct perf_event *parent_event,
 		struct hw_perf_event *hwc = &child_event->hw;
 
 		hwc->sample_period = sample_period;
+		hwc->sample_period_base = sample_period;
 		hwc->last_period   = sample_period;
 
 		local64_set(&hwc->period_left, sample_period);
-- 
2.43.0


