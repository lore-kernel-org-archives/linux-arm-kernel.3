Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE2DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 02:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps+oS/5gQqK+NmJA68Mxz4+l0q54PE+5qHL7AWHAnAQ=; b=ghKlH1c6g1xmfkzbtZGI+Ol0Vs
	b/fmfl08U6LnmItqTH7yUZT3Bzz7+hPtCJjFuygvu0VFVm3/I0Tl0L7JMD3rf060LyYtIhQNzemwg
	9RnXKzObisu4mOx8Vl/I4uQJ51pYYScUdRouZl5+zU7ZVeWznhhuG9n/mbx3dMb43NqqcKv3e2Zhi
	38Nd0EJbAoPNV+eZvxFZlhJJ1Y5LzpnbF4Ox7zJtTZUouyk8PVFHRvXwu9ZAX29ce0+HjdccBrs+v
	eltoIWUwAkVW3gw8hJM5U6fOB97km3tpoNtee+MaT7QRni7MsZTv5Q8+pZ7szb3gaYEHlsPDZC5q4
	7CoJV9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHyr-0000000Eqiv-3RQ1;
	Sat, 26 Sep 2026 02:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHyr-0000000Eqii-0s49
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 02:17:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 922FC4378B;
	Sat, 26 Sep 2026 02:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8016D1F000FF;
	Sat, 26 Sep 2026 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790389056;
	bh=ps+oS/5gQqK+NmJA68Mxz4+l0q54PE+5qHL7AWHAnAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IqHIiKFm9l2a0fqUsXNGp6IeHUhq+lcCM7frCzSD1tlB1UNwXAiseUhw7HtTqyQgf
	 gn5SswmAQ3G8SZdpGofsob70Rc0+ayWNYwKNBf29504lBuWQcLznojwBP65Lbi1PLm
	 n5odsrc5dScuGMRo5ZiIe3PjTLxIkc5ywQ+NXekPYon0prRD1JttxY3TFiP/tD99OC
	 9FPNQfZMP4oUwtFmvty5YjmMApBUHDvmHCKmKWFQgdXZnjmnrwhwclzXW6JhxehaPD
	 EHQ61QJIwjog1pHvkwUYOaweaaHQzkMaClXc4v1N2X6ZV9+eiIIB9ax+gNeQFPh34o
	 8QSMrIdIFyQpA==
Date: Sat, 26 Sep 2026 11:17:29 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: josef@toxicpanda.com, paulmck@kernel.org, frederic@kernel.org,
 ast@kernel.org, rostedt@goodmis.org, boqun@kernel.org,
 mark.rutland@arm.com, peterz@infradead.org, tglx@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, puranjay@kernel.org,
 rcu@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
 yonghong.song@linux.dev, mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH] kprobes: Make optprobe optimizer multi-generational and
 asynchronous
Message-Id: <20260926111729.f580fa6a8eaac448649fc8e3@kernel.org>
In-Reply-To: <6469f266e0c06de407583746d4f533a03a002fa8d7871124196b0bb568fe38fa@mail.kernel.org>
References: <179017148080.466588.9116221556625712980.stgit@devnote2>
	<6469f266e0c06de407583746d4f533a03a002fa8d7871124196b0bb568fe38fa@mail.kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Sep 2026 16:17:38 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index 6337da5cab9e..1e25980303c4 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> 
> [ ... ]
> 
> > @@ -530,50 +553,78 @@ static DECLARE_COMPLETION(optimizer_completion);
> >
> >  #define OPTIMIZE_DELAY 5
> >
> > +static bool optprobe_has_queued_probes(void)
> > +{
> > +	struct optprobe_generation *gen = &optprobe_gens[optprobe_cur_gen];
> > +
> > +	return !list_empty(&gen->optimizing_list) ||
> > +	       !list_empty(&gen->unoptimizing_list);
> > +}
> 
> Does this logic need to check gen->freeing_list as well?

Ah, indeed. It should check the freeing_list too.

[ ... ]
> 
> > @@ -622,67 +675,119 @@ static void do_free_cleaned_kprobes(void)
> >
> >  static void kick_kprobe_optimizer(void);
> >
> > +static void optprobe_generation_rcu_cb(struct rcu_head *rcu)
> > +{
> > +	struct optprobe_generation *gen;
> > +
> > +	gen = container_of(rcu, struct optprobe_generation, rcu);
> > +	WRITE_ONCE(gen->ready, true);
> > +	wake_up(&kprobe_optimizer_wait);
> > +}
> > +
> > +static void optprobe_finalize_generation(struct optprobe_generation *gen)
> > +{
> > +	lockdep_assert_held(&kprobe_mutex);
> > +
> > +	scoped_guard(cpus_read_lock) {
> > +		guard(mutex)(&text_mutex);
> > +
> > +		/* Optimization never be done when disarmed */
> > +		if (!kprobes_all_disarmed && kprobes_allow_optimization &&
> > +		    !list_empty(&gen->optimizing_list))
> > +			arch_optimize_kprobes(&gen->optimizing_list);
> > +	}
> > +
> > +	/* Free cleaned kprobes after quiescence period */
> > +	do_free_cleaned_kprobes(&gen->freeing_list);
> > +
> > +	gen->in_flight = false;
> > +	WRITE_ONCE(gen->ready, false);
> > +}
> > +
> > +static void optprobe_dispatch_generation(void)
> > +{
> > +	struct optprobe_generation *gen;
> > +
> > +	lockdep_assert_held(&kprobe_mutex);
> > +
> > +	if (!optprobe_can_fire() || !optprobe_has_queued_probes())
> > +		return;
> > +
> > +	gen = &optprobe_gens[optprobe_cur_gen];
> > +
> > +	scoped_guard(cpus_read_lock) {
> > +		guard(mutex)(&text_mutex);
> > +
> > +		/*
> > +		 * Unoptimize kprobes and collect cleaned (unused and disarmed)
> > +		 * kprobes before waiting for quiescence period.
> > +		 */
> > +		do_unoptimize_kprobes(&gen->unoptimizing_list, &gen->freeing_list);
> > +	}
> > +
> > +	/* Advance cur_gen to the next generation slot */
> > +	optprobe_cur_gen = (optprobe_cur_gen + 1) % OPTPROBE_GEN_MAX;
> > +
> > +	gen->in_flight = true;
> > +	WRITE_ONCE(gen->ready, false);
> > +
> > +	call_rcu_tasks(&gen->rcu, optprobe_generation_rcu_cb);
> > +}
> 
> Now that kprobe_mutex is dropped during the Tasks RCU grace period, can
> an aggregator probe that was unoptimized but is still in use be freed
> while a task is still preempted inside its detour buffer?

Good catch! Yes, we need to keep tracking the unoptimized but not
freed kprobes until finalize it.

[ ... ]
> 
> > @@ -707,12 +812,11 @@ static void wait_for_kprobe_optimizer_locked(void)
> >  {
> >  	lockdep_assert_held(&kprobe_mutex);
> >
> > -	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
> > +	while (optprobe_optimizer_busy()) {
> >  		init_completion(&optimizer_completion);
> > -		/*
> > -		 * Set state to OPTIMIZER_ST_FLUSHING and wake up the thread if it's
> > -		 * idle. If it's already kicked, it will see the state change.
> > -		 */
> > +		optprobe_flush_requested = true;
> > +
> > +		/* Wake up optimizer thread */
> >  		if (atomic_xchg_acquire(&optimizer_state,
> >  			OPTIMIZER_ST_FLUSHING) != OPTIMIZER_ST_FLUSHING)
> >  			wake_up(&kprobe_optimizer_wait);
> 
> Andrea Parri raised a concern on 2026-09-24 about a race condition in
> this code (https://lore.kernel.org/all/arTuBodyGqQ0mErI@andreayoga.localdomain/).

Yes, so I pick his patch at first and rebase this on it.

Thanks,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

