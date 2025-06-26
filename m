Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF07C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtsXPN/EbRnRkfVDVnd5VwLOIbO3iMF7jQ9dJCcE/5o=; b=Jf+EU3FCMymibe2cLcNY9j7nyb
	WIZzra2uvlfpY6YbUgU5JlyNzUKT7eWkR5N1x7o16EvUU3d4I7WxQaxqTAhg6t6vTolWRJpui3KTD
	9Vnb9KhUQBKg7YtXQjDAff9iMWD1b18i1WHzPFBUeLABKfQvuW5RAlnqU4zzZ/Y1FMxkHPDyw3DJy
	QkJEubxfUJv7xpkyPpgVj/3xIEPa0Cb0DBFmSLsHYkCyAqI+9Y91DXCZ62JKgOAGJBXKX1gQC9Uei
	QK8JCmXGwqIwngaQe4m+nh0sVb1Qu2kZ4jQDXcOOf1Vh2yA1YxpanzOueWeFUtgVgHdKwv3jFaKkY
	/0vSFfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm9Z-0000000Bawr-0caU;
	Thu, 26 Jun 2025 12:56:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm6b-0000000BakV-0fwt;
	Thu, 26 Jun 2025 12:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JtsXPN/EbRnRkfVDVnd5VwLOIbO3iMF7jQ9dJCcE/5o=; b=H+NmZjA1tEsnemrw7hUwwDUwOi
	tiQFQW6fUGUtMPGKy55K10q7oKvJRHrYmja6F+Bc71MYDwFDS1tofC+CcDeQrPjYplfVTrEZJcf/c
	8rPzdI/Ig+bFUT0HfULp3Ym6RRejJuVo3HGcdmuQ/hd/hwKV6EK6Cf82g7vtPblvymIiETFOru9wl
	2FjKEe/IoTIVkRLgTAeLxKqZQUcrTPlPkGtTlkdtvR21vCkLJkCXy2yf2NAYt0kFaNfUkhtiC9z3C
	kswjA/yIXwkUz3fUDB4qlHDMAkgVhWW6+zWJctw271vJyzq72V9HafqVdDsx1UqZdomeihH0Gxhem
	N0Fcla7w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm6X-0000000BfW9-0YYx;
	Thu, 26 Jun 2025 12:53:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CFF5030BDA9; Thu, 26 Jun 2025 14:53:23 +0200 (CEST)
Date: Thu, 26 Jun 2025 14:53:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
Message-ID: <20250626125323.GG1613376@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
 <20250606082834.GM30486@noisy.programming.kicks-ass.net>
 <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c32fcf451dad1cac40ad827e53ac6c027403b07e.camel@mediatek.com>
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

On Fri, Jun 13, 2025 at 03:47:47PM +0800, Kuyo Chang wrote:
> On Fri, 2025-06-06 at 10:28 +0200, Peter Zijlstra wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:
> > 
> > > Thank you for your patch.
> > > I believe this patch also effectively addresses this race
> > > condition.
> > > I will queue it in our test pool for testing.
> > 
> > Thank you; I shall await the results!
> > 
> It works well during both regular and hotplug tests(one week).
> I believe the patch is workable.

Thanks!, I'll queue the below in tip/sched/urgent

---
Subject: sched/core: Fix migrate_swap() vs. hotplug
From: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 5 Jun 2025 12:00:09 +0200

On Mon, Jun 02, 2025 at 03:22:13PM +0800, Kuyo Chang wrote:

> So, the potential race scenario is:
>
> 	CPU0							CPU1
> 	// doing migrate_swap(cpu0/cpu1)
> 	stop_two_cpus()
> 							  ...
> 							 // doing _cpu_down()
> 							      sched_cpu_deactivate()
> 								set_cpu_active(cpu, false);
> 								balance_push_set(cpu, true);
> 	cpu_stop_queue_two_works
> 	    __cpu_stop_queue_work(stopper1,...);
> 	    __cpu_stop_queue_work(stopper2,..);
> 	stop_cpus_in_progress -> true
> 		preempt_enable();
> 								...
> 							1st balance_push
> 							stop_one_cpu_nowait
> 							cpu_stop_queue_work
> 							__cpu_stop_queue_work
> 							list_add_tail  -> 1st add push_work
> 							wake_up_q(&wakeq);  -> "wakeq is empty.
> 										This implies that the stopper is at wakeq@migrate_swap."
> 	preempt_disable
> 	wake_up_q(&wakeq);
> 	        wake_up_process // wakeup migrate/0
> 		    try_to_wake_up
> 		        ttwu_queue
> 		            ttwu_queue_cond ->meet below case
> 		                if (cpu == smp_processor_id())
> 			         return false;
> 			ttwu_do_activate
> 			//migrate/0 wakeup done
> 		wake_up_process // wakeup migrate/1
> 	           try_to_wake_up
> 		    ttwu_queue
> 			ttwu_queue_cond
> 		        ttwu_queue_wakelist
> 			__ttwu_queue_wakelist
> 			__smp_call_single_queue
> 	preempt_enable();
>
> 							2nd balance_push
> 							stop_one_cpu_nowait
> 							cpu_stop_queue_work
> 							__cpu_stop_queue_work
> 							list_add_tail  -> 2nd add push_work, so the double list add is detected
> 							...
> 							...
> 							cpu1 get ipi, do sched_ttwu_pending, wakeup migrate/1
>

So this balance_push() is part of schedule(), and schedule() is supposed
to switch to stopper task, but because of this race condition, stopper
task is stuck in WAKING state and not actually visible to be picked.

Therefore CPU1 can do another schedule() and end up doing another
balance_push() even though the last one hasn't been done yet.

This is a confluence of fail, where both wake_q and ttwu_wakelist can
cause crucial wakeups to be delayed, resulting in the malfunction of
balance_push.

Since there is only a single stopper thread to be woken, the wake_q
doesn't really add anything here, and can be removed in favour of
direct wakeups of the stopper thread.

Then add a clause to ttwu_queue_cond() to ensure the stopper threads
are never queued / delayed.

Of all 3 moving parts, the last addition was the balance_push()
machinery, so pick that as the point the bug was introduced.

Fixes: 2558aacff858 ("sched/hotplug: Ensure only per-cpu kthreads run during hotplug")
Reported-by: Kuyo Chang <kuyo.chang@mediatek.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Kuyo Chang <kuyo.chang@mediatek.com>
Link: https://lkml.kernel.org/r/20250605100009.GO39944@noisy.programming.kicks-ass.net
---
 kernel/sched/core.c   |    5 +++++
 kernel/stop_machine.c |   20 ++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3943,6 +3943,11 @@ static inline bool ttwu_queue_cond(struc
 	if (!scx_allow_ttwu_queue(p))
 		return false;
 
+#ifdef CONFIG_SMP
+	if (p->sched_class == &stop_sched_class)
+		return false;
+#endif
+
 	/*
 	 * Do not complicate things with the async wake_list while the CPU is
 	 * in hotplug state.
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -82,18 +82,15 @@ static void cpu_stop_signal_done(struct
 }
 
 static void __cpu_stop_queue_work(struct cpu_stopper *stopper,
-					struct cpu_stop_work *work,
-					struct wake_q_head *wakeq)
+				  struct cpu_stop_work *work)
 {
 	list_add_tail(&work->list, &stopper->works);
-	wake_q_add(wakeq, stopper->thread);
 }
 
 /* queue @work to @stopper.  if offline, @work is completed immediately */
 static bool cpu_stop_queue_work(unsigned int cpu, struct cpu_stop_work *work)
 {
 	struct cpu_stopper *stopper = &per_cpu(cpu_stopper, cpu);
-	DEFINE_WAKE_Q(wakeq);
 	unsigned long flags;
 	bool enabled;
 
@@ -101,12 +98,13 @@ static bool cpu_stop_queue_work(unsigned
 	raw_spin_lock_irqsave(&stopper->lock, flags);
 	enabled = stopper->enabled;
 	if (enabled)
-		__cpu_stop_queue_work(stopper, work, &wakeq);
+		__cpu_stop_queue_work(stopper, work);
 	else if (work->done)
 		cpu_stop_signal_done(work->done);
 	raw_spin_unlock_irqrestore(&stopper->lock, flags);
 
-	wake_up_q(&wakeq);
+	if (enabled)
+		wake_up_process(stopper->thread);
 	preempt_enable();
 
 	return enabled;
@@ -264,7 +262,6 @@ static int cpu_stop_queue_two_works(int
 {
 	struct cpu_stopper *stopper1 = per_cpu_ptr(&cpu_stopper, cpu1);
 	struct cpu_stopper *stopper2 = per_cpu_ptr(&cpu_stopper, cpu2);
-	DEFINE_WAKE_Q(wakeq);
 	int err;
 
 retry:
@@ -300,8 +297,8 @@ static int cpu_stop_queue_two_works(int
 	}
 
 	err = 0;
-	__cpu_stop_queue_work(stopper1, work1, &wakeq);
-	__cpu_stop_queue_work(stopper2, work2, &wakeq);
+	__cpu_stop_queue_work(stopper1, work1);
+	__cpu_stop_queue_work(stopper2, work2);
 
 unlock:
 	raw_spin_unlock(&stopper2->lock);
@@ -316,7 +313,10 @@ static int cpu_stop_queue_two_works(int
 		goto retry;
 	}
 
-	wake_up_q(&wakeq);
+	if (!err) {
+		wake_up_process(stopper1->thread);
+		wake_up_process(stopper2->thread);
+	}
 	preempt_enable();
 
 	return err;

