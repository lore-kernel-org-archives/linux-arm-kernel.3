Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66365C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gX0oE5lGbaC5HsJCFKke83AgOfwt5rZen3WV1FTI52U=; b=J13kTaSG24lfKqC2qud6XJ1j4L
	svMb2oK6pWDNxELoEzMk4PUxZr4VrlnuQYfP5EjUkTsi8FsUVg1kAkmfHGoiKzcwPSAw/Xw/iv7nK
	xQR6k3GIlGK4bBzNJncVveLvwKJ7yFIj/+YtYZ8EJyoatPLMOSKdWEN8KgUY5U7kHSg8lnGqikE5z
	5POxsBYxVm3tS22qAVLmI3xJiu7UskiQ0ZFb0CvBxTrPZPo3oUXja/LI00oM6pEwtVvfPbRRNftja
	S/YgvaCbLM2jvKw6YJ9BQRtDd7SUdLb5R1MGVnkoITo2OjGBZXpLlmPfJm/BqFoubN/ovWR2gZlE7
	UuPGhq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxrI-00000005U0v-2hWM;
	Tue, 11 Mar 2025 11:33:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxpe-00000005TY4-2TLN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Mar 2025 11:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gX0oE5lGbaC5HsJCFKke83AgOfwt5rZen3WV1FTI52U=; b=htGXWelUYXNZaSh86SY5odeA4h
	+hzDM+1lNmmW74wWnw1hs7oziGmHIJLF+j9p7Y6OteiCHzsWt8CpEJikE6bqhPvZNzR+NU0A+beOr
	J33E4vcskzuOEmJPBPSshmJBs2HOMKE0SKelqkb/8ho2sJNKXz1Qotnsl7iws0cjX0RmRoUQzfelJ
	T79SWp7aU2WD2+KIH56Jeb5R/YdnNhrZzSYdeRfdgnxtbfjbjxSETZa21zZ8YKKaHhmS1BtnnZns9
	PlTnHqLbVy/fmKSKRl5vQ6Y0BRX7p8HPm/nThEsehD4QZtGNJwHrT6pQvxlYgR9+y6XaHEQ2Ymzc8
	rGTKSjFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1trxpb-000000028S9-28Wv;
	Tue, 11 Mar 2025 11:31:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2734B3006C0; Tue, 11 Mar 2025 12:31:29 +0100 (CET)
Date: Tue, 11 Mar 2025 12:31:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
Message-ID: <20250311113128.GD19424@noisy.programming.kicks-ass.net>
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307202247.648633-4-mark.barnett@arm.com>
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

On Fri, Mar 07, 2025 at 08:22:45PM +0000, mark.barnett@arm.com wrote:
> From: Ben Gainey <ben.gainey@arm.com>
> 
> This change modifies the core perf overflow handler, adding some small
> random jitter to each sample period whenever an event switches between the
> two alternate sample periods. A new flag is added to perf_event_attr to
> opt into this behaviour.
> 
> This change follows the discussion in [1], where it is recognized that it
> may be possible for certain patterns of execution to end up with biased
> results.
> 
> [1] https://lore.kernel.org/linux-perf-users/Zc24eLqZycmIg3d2@tassilo/
> 
> Signed-off-by: Ben Gainey <ben.gainey@arm.com>
> Signed-off-by: Mark Barnett <mark.barnett@arm.com>
> ---
>  include/uapi/linux/perf_event.h | 7 ++++++-
>  kernel/events/core.c            | 9 ++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 499a8673df8e..c0076ce8f80a 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -461,7 +461,12 @@ struct perf_event_attr {
>  				inherit_thread :  1, /* children only inherit if cloned with CLONE_THREAD */
>  				remove_on_exec :  1, /* event is removed from task on exec */
>  				sigtrap        :  1, /* send synchronous SIGTRAP on event */
> -				__reserved_1   : 26;
> +				/*
> +				 * Add a limited amount of jitter on each alternate period, where
> +				 * the jitter is between [0, (2<<jitter_alt_period) - 1]
> +				 */
> +				jitter_alt_period : 3,
> +				__reserved_1   : 23;

So; I've been thinking about this interface.

I think I prefer you keep the existing sample_period/sample_freq working
as is and simply modulate with random and high-freq components.

A very little like so..

I've made the hf_sample_period 32bit since I figured that ought to be
enough -- you're aiming at very short periods after all. But there's
enough unused bits left.

So this has sample_period or sample_freq compute hwc->sample_period_base
which is first modified with random such that the average is exactly
sample_period_base (assuming a flat distribution).

This means that sample_period_base is still the right number to use for
computing freq based things. Additionally, have the 'extra' interrupt
ignored for adaptive period crud.

Also, someone needs to consider the eBPF hook and what to do with it.
I've kept the ordering as per this series, but I suspect it's wrong and
we want this before the BPF hook. Please think about this and explicitly
mention this in the next series.

Anyway, very much a sketch of things, incomplete and not been near a
compiler.



---
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 76f4265efee9..c5dd6442e96f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -229,6 +229,10 @@ struct hw_perf_event {
 #define PERF_HES_UPTODATE	0x02 /* event->count up-to-date */
 #define PERF_HES_ARCH		0x04
 
+#define PERF_HES_HF_ON		0x10 /* using high-fred sampling */
+#define PERF_HES_HF_SAMPLE	0x20
+#define PERF_HES_HF_RAND	0x40
+
 	int				state;
 
 	/*
@@ -241,6 +245,7 @@ struct hw_perf_event {
 	 * The period to start the next sample with.
 	 */
 	u64				sample_period;
+	u64				sample_period_base;
 
 	union {
 		struct { /* Sampling */
diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 0524d541d4e3..8dbe027f93f1 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: hf_sample */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -531,6 +532,14 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
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
index b87a5ac42ce2..e5a93edf3b5f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8,6 +8,7 @@
  *  Copyright  ©  2009 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
  */
 
+#include "linux/random.h"
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/cpu.h>
@@ -55,6 +56,7 @@
 #include <linux/pgtable.h>
 #include <linux/buildid.h>
 #include <linux/task_work.h>
+#include <linux/prandom.h>
 
 #include "internal.h"
 
@@ -443,6 +445,8 @@ static cpumask_var_t perf_online_pkg_mask;
 static cpumask_var_t perf_online_sys_mask;
 static struct kmem_cache *perf_event_cache;
 
+static struct rnd_state perf_rand;
+
 /*
  * perf event paranoia level:
  *  -1 - not paranoid at all
@@ -4233,19 +4237,19 @@ static void perf_adjust_period(struct perf_event *event, u64 nsec, u64 count, bo
 
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
@@ -4490,6 +4494,8 @@ void perf_event_task_tick(void)
 	if (ctx)
 		perf_adjust_freq_unthr_context(ctx, !!throttled);
 	rcu_read_unlock();
+
+	prandom_seed_state(&perf_rand, get_random_u64());
 }
 
 static int event_enable_on_exec(struct perf_event *event,
@@ -9979,6 +9985,8 @@ static int __perf_event_overflow(struct perf_event *event,
 				 int throttle, struct perf_sample_data *data,
 				 struct pt_regs *regs)
 {
+	struct hw_perf_event *hwc = &event->hw;
+	u64 sample_period;
 	int events = atomic_read(&event->event_limit);
 	int ret = 0;
 
@@ -9989,15 +9997,50 @@ static int __perf_event_overflow(struct perf_event *event,
 	if (unlikely(!is_sampling_event(event)))
 		return 0;
 
-	ret = __perf_event_account_interrupt(event, throttle);
+	/*
+	 * High Freq samples are injected inside the larger period:
+	 *
+	 *   |------------|-|------------|-|
+	 *   P0          HF P1          HF
+	 *
+	 * By ignoring the HF samples, we measure the actual period.
+	 */
+	if (!(hwc->state & PERF_HES_HF_SAMPLE))
+		ret = __perf_event_account_interrupt(event, throttle);
 
 	if (event->attr.aux_pause)
 		perf_event_aux_pause(event->aux_event, true);
 
+	/* XXX interaction between HF samples and BPF */
 	if (event->prog && event->prog->type == BPF_PROG_TYPE_PERF_EVENT &&
 	    !bpf_overflow_handler(event, data, regs))
 		goto out;
 
+	sample_period = hwc->sample_period_base;
+	if (hwc->state & PERF_HES_HF_RAND) {
+		u64 rand = 1 << event->attr.hf_sample_rand;
+		sample_period -= rand / 2;
+		sample_period += prandom_u32_state(&perf_rand) & (rand - 1);
+	}
+	if (hwc->state & PERF_HES_HF_ON) {
+		u64 hf_sample_period = event->attr.hf_sample_period;
+
+		if (sample_period < hf_sample_period) {
+			hwc->state &= ~PERF_HES_HF_ON;
+			goto set_period;
+		}
+
+		if (!(hwc->state & PERF_HES_HF_SAMPLE)) {
+			hwc->sample_period -= hf_sample_period;
+			hwc->state |= PERF_HES_HF_SAMPLE;
+		} else {
+			hwc->sample_period = hf_sample_period;
+			hwc->state &= ~PERF_HES_HF_SAMPLE;
+		}
+	}
+set_period:
+	hwc->sample_period = sample_period;
+
 	/*
 	 * XXX event_limit might not quite work as expected on inherited
 	 * events
@@ -12458,8 +12501,11 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 
 	hwc = &event->hw;
 	hwc->sample_period = attr->sample_period;
-	if (attr->freq && attr->sample_freq)
+	hwc->sample_period_base = attr->sample_period;
+	if (attr->freq && attr->sample_freq) {
 		hwc->sample_period = 1;
+		hwc->sample_period_base = 1;
+	}
 	hwc->last_period = hwc->sample_period;
 
 	local64_set(&hwc->period_left, hwc->sample_period);
@@ -13824,6 +13870,7 @@ inherit_event(struct perf_event *parent_event,
 		struct hw_perf_event *hwc = &child_event->hw;
 
 		hwc->sample_period = sample_period;
+		hwc->sample_period_base = sample_period;
 		hwc->last_period   = sample_period;
 
 		local64_set(&hwc->period_left, sample_period);
@@ -14279,6 +14326,8 @@ void __init perf_event_init(void)
 {
 	int ret;
 
+	prandom_seed_state(&perf_rand, get_random_u64());
+
 	idr_init(&pmu_idr);
 
 	perf_event_init_all_cpus();


