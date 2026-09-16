Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A5FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGvzKbFPjf+oPN6Vq1aebGYY5v8J+QGBuqhmyn8aUVA=; b=1i+q8thiojZF565DsrGSgoMll/
	4hAhJlTBgjxaXtpwwy5dMCpEorgmXolmCLeLdnlTBQrs4IUXiUjnOdqiUzV3/kh36EVvNFPROMiDl
	g1+xMmNehNn2rrPTDe9OhxQvF3aXVestWy5i+rCIQjmfp9sKjaOskhOdQnmjwqndwYRC/ISkyFmK6
	yfZTm0EcWVE0dQUoQaN0LMG9t3XPgOhwSgud6XXscgXbbcLvGGbl5qkKF66dSoiytndUE/s5RBCc/
	r+3V2jEHVhPviTG7Ini+na3p+21xqwZrRrkq3M6f8AF32BwXIUGZ+dXej2RjOBy3fYm4MRb7Dh/TP
	vrUVBF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rlT-00000009ciQ-2FRo;
	Wed, 16 Sep 2026 15:41:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rlS-00000009ci8-0Vjj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:41:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 601636020C;
	Wed, 16 Sep 2026 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0560E1F00898;
	Wed, 16 Sep 2026 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789573297;
	bh=sGvzKbFPjf+oPN6Vq1aebGYY5v8J+QGBuqhmyn8aUVA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=KIYUEz2FGcRHG+Ssklm2bHmtEXBGohs83s4Od39AMcZubOJsE9RcpEkF2MgFpaJyw
	 cRxlDEaoPOVjTBiub0GC4lMMtcPW5Ai2f1xdjaWDEWMvi39Rl+gSqxtwEHJWheUE9m
	 h8vHINDZAmYdg6E6FA6HEIujkaLUYdjPBXyiGd3emqo+GbGuJoiOmurbsPEcPhZ39A
	 HzIPstpdtUBGHOY7LAsWpCzyaUAh+S2igBzAKhzvbQRIoKHL6/ON5LVD5FfW5y58Al
	 UD8E7AGKumNniUj/FyucyAAXgQ+SyVefcwHGcFDMHxy4FOBWJ/JdVyW3WqSbC4G+Bq
	 /anXSiz9gu+gQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 89BBFCE04DE; Wed, 16 Sep 2026 08:41:36 -0700 (PDT)
Date: Wed, 16 Sep 2026 08:41:36 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation
 for reader-marked trampolines
Message-ID: <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
 <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
 <aqlgxKGk_AEKls_1@localhost.localdomain>
 <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqq0cwvRDsorGwgc@localhost.localdomain>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2026 at 05:23:31PM +0200, Frederic Weisbecker wrote:
> Le Wed, Sep 16, 2026 at 07:55:02AM -0700, Paul E. McKenney a écrit :
> > On Wed, Sep 16, 2026 at 04:47:29PM +0200, Frederic Weisbecker wrote:
> > > Le Wed, Sep 16, 2026 at 04:35:50PM +0200, Frederic Weisbecker a écrit :
> > > > Le Wed, Sep 16, 2026 at 07:26:35AM -0700, Paul E. McKenney a écrit :
> > > > > On Wed, Sep 16, 2026 at 02:40:20PM +0200, Frederic Weisbecker wrote:
> > > > > > Le Tue, Sep 15, 2026 at 04:56:41PM -0700, Paul E. McKenney a écrit :
> > > > > > > > Alternatively the approach could be generalized to vanilla RCU, it could be
> > > > > > > > possible to define a .text.rcu_no_qs section within which code running is
> > > > > > > > considered as an RCU reader (with a pause while on the explicit RCU tasks
> > > > > > > > section). It would be forbidden to voluntary sleep inside
> > > > > > > > and to put explicit preemption points (CONFIG_PROVE_RCU could report misuses).
> > > > > > > > 
> > > > > > > > Based on IP, RCU could consider those interrupted section as readers. This would
> > > > > > > > require PREEMPT_RCU though.
> > > > > > > > 
> > > > > > > > And then synchronize_rcu() would do the 1, 2, 4 jobs.
> > > > > > > 
> > > > > > > If I am following correctly (ha!), sleepable BPF programs rule out use
> > > > > > > of RCU in this manner.
> > > > > > > 
> > > > > > > But your point is nevertheless valid, in that SRCU could be used.
> > > > > > > And because rcu_read_lock_trace() is a thin wrapper around SRCU-fast, we
> > > > > > > *might* be able to instead use rcu_read_lock_tasks_trace(), which would
> > > > > > > skip the task-struct increment and decrement, saving a few instructions.
> > > > > > > Then, instead of waiting for each task's counter to go to zero, instead
> > > > > > > just invoke synchronize_rcu_tasks_trace().
> > > > > > > 
> > > > > > > Which is pretty close to what Josef is proposing, just with the new RCU
> > > > > > > Tasks Trace read-side primitives.  I think.  ;-)
> > > > > > > 
> > > > > > > This assumes that we do not need to flatten partially overlapping RCU
> > > > > > > Tasks Trace readers into one big reader.
> > > > > > > 
> > > > > > > Or am I missing something here?
> > > > > > 
> > > > > > Yes I think that's what Josef does in this patchset. The problem is about
> > > > > > handling the few instructions:
> > > > > > 
> > > > > > 1) between the begining of the trampoline and the call to rcu_read_lock_trace()
> > > > > > 
> > > > > > 2) between the call to rcu_read_unlock_trace() and the end of the trampoline
> > > > > > 
> > > > > > So what I'm proposing is to make those two parts implicit RCU read lock sections.
> > > > > > 
> > > > > > So the whole trampoline would be .text.rcu_no_qs:
> > > > > > 
> > > > > > .text.rcu_no_qs trampoline:
> > > > > >   __________________________________________________________________________________________
> > > > > >  |Few instructions 1 | rcu_read_lock_trace() .... rcu_read_unlock_trace | Few instructions 2|
> > > > > >  ___________________________________________________________________________________________
> > > > > > 
> > > > > > Then when a tick fires, rcu_flavor_sched_clock_irq() discards the interrupted
> > > > > > code as QS if the IP was within .text.rcu_no_qs _unless_ it is in the
> > > > > > rcu_read_lock_trace. Both are easy and quick to verify.
> > > > > > 
> > > > > > Also preempt_schedule_irq() would make sure to verify the same condition and
> > > > > > enqueue the task as a GP blocker if preempting inside "Few instructions 1"
> > > > > > or "Few instructions 2".
> > > > > 
> > > > > Ah, OK, I might be following now.  ;-)
> > > > > 
> > > > > We also need both versions of rcu_exp_handler() to check the IP as well,
> > > > > given that sooner or later someone is going to want trampoline removal
> > > > > to go faster.  Or am I still missing a turn in here somewhere?
> > 
> > I should add that the thing that I really like about Frederic's approach
> > is that avoids the task-list scan.  Or at least has the potential to
> > do so.  Such scans have proven problematic in the past.
> > 
> > > > Yes indeed, missed the exp part!
> > > 
> > > What remains to handle also is non-preemptible RCU because if the task is
> > > preempted by an IRQ while in the .text.rcu_no_qs, we may still need to keep
> > > track of that somewhere.
> > 
> > Perhaps in rcu_core() in kernels booted with use_softirq?  I am thinking
> > specifically of the checks for deferred quiescent states.  I don't (yet)
> > see a need to modify rcu_check_quiescent_state().
> > 
> > Maybe other places as well.  ;-)
> 
> Hmm this tracking would have to happen on preempt_schedule() just like we
> do for PREEMPT_RCU. Or am I missing something? And then we would need a
> list scan of those tasks.

I am thinking of the case where a trampoline is interrupted before entering
(or after leaving) its RCU Tasks Trace read-side critical section.  Then
there is a softirq handler on the back of that interrupt handler, and
RCU_SOFTIRQ is invoked, calling rcu_core().  Specifically:

	/* Report any deferred quiescent states if preemption enabled. */
	if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && (!(preempt_count() & PREEMPT_MASK))) {
		rcu_preempt_deferred_qs(current);
	} else if (rcu_preempt_need_deferred_qs(current)) {
		guard(irqsave)();
		set_need_resched_current();
	}

Preemption is enabled, but we should not report a quiescent state because
we have interrupted a trampoline.  Correct?

> Or we can build the blocked task list handling, that we already have for PREEMPT_RCU,
> when CONFIG_RCU_TASKS && !CONFIG_PREEMPT_RCU. We would just only add tasks when
> preempted in .text.rcu_no_qs since rcu_read_lock() would still disable
> preemption on normal explicit readers. So I wouldn't expect more overhead due to
> that blocked list tracking built since it would rarely track tasks.

Yes, we could avoid the list of tasks by treating the preemption within
the trampoline the same as preemption within an RCU read-side critical
section, but there might not be an rcu_read_unlock() to clean up.
Which could be a problem.

Trampolines that transfer control to tracing code could supply the needed
cleanup call.  But last I checked, there were trampolines that transferred
directly back to the original code, with no opportunity for cleaning up.

Or am I still missing a trick here?

							Thanx, Paul

