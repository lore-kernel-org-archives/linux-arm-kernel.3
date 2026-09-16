Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D54CC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV82UNlXLIGXwYDB+EGE0wWjQDs7Krio9WNaWSO5xfQ=; b=hK56QcCPpPdlukuOez/M6g9x1q
	lEnxumweVJAKzrogPsQFooy9kOSM6A2i03VxEgI6540ck9/NrmIO5FjISbwZfeNeHOzgMjE8rrSuh
	DTydTRVp0AFXV46dDMx95zpnDJuboj3N3Thl8Ss6q2gwwhic/GQ5kNJD/xzm8GXWpYJlNAOiC4c33
	2jt/8r1UpfiyfFSr8oVufZ9cBzqSiGJP3JjJ3n3JJs/mZ5NtAvvVl/7d5SA8dm8ncWZx1saW18Rn+
	MfCvnQsRXlBIncPMrbc95ogR7ohqATD/GqF3mgzDOpWM2V2BWnRNpD3o3LTaKuz/dNkehZDZsiSoy
	w9N6HvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r2O-00000009Tkm-3BPJ;
	Wed, 16 Sep 2026 14:55:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6r2N-00000009TkU-3kNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAA3341820;
	Wed, 16 Sep 2026 14:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D151F000FF;
	Wed, 16 Sep 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570502;
	bh=QV82UNlXLIGXwYDB+EGE0wWjQDs7Krio9WNaWSO5xfQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=WzoyCkX6qile7VqKWaszhfBXITo1Vva2+0mj6NaQsOyenrrABW3jFSk/WQfJacLrS
	 swxPQeQStUtlNnTb+NFoYnsOzLHKbKCy1SDiJA95sbZqsJQVCBqHLPLNYZvvlIv8wQ
	 erkCQQ0YASVigmBa6cSO5aiMovZ7W2Gekrh9Y1mcwIOBUe0eLhD7Fa4KhblMJQBRXy
	 a7qqgENAA49mGyM3i2AajSuIwgC2KGSJh0IxZtlr6wQmpfStpfaz9d875V82OB/h92
	 B0Oy45XssMrBhorahUjjMDJS+76TYEIiUGYH0KMWUCQWE0ASKp0vHT5E8Cr30QCw1+
	 pTumMZ0fkABgw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 22DAECE04DE; Wed, 16 Sep 2026 07:55:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 07:55:02 -0700
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
Message-ID: <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
 <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
 <aqlgxKGk_AEKls_1@localhost.localdomain>
 <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqqsAUVV8a1yrQzX@localhost.localdomain>
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

On Wed, Sep 16, 2026 at 04:47:29PM +0200, Frederic Weisbecker wrote:
> Le Wed, Sep 16, 2026 at 04:35:50PM +0200, Frederic Weisbecker a écrit :
> > Le Wed, Sep 16, 2026 at 07:26:35AM -0700, Paul E. McKenney a écrit :
> > > On Wed, Sep 16, 2026 at 02:40:20PM +0200, Frederic Weisbecker wrote:
> > > > Le Tue, Sep 15, 2026 at 04:56:41PM -0700, Paul E. McKenney a écrit :
> > > > > > Alternatively the approach could be generalized to vanilla RCU, it could be
> > > > > > possible to define a .text.rcu_no_qs section within which code running is
> > > > > > considered as an RCU reader (with a pause while on the explicit RCU tasks
> > > > > > section). It would be forbidden to voluntary sleep inside
> > > > > > and to put explicit preemption points (CONFIG_PROVE_RCU could report misuses).
> > > > > > 
> > > > > > Based on IP, RCU could consider those interrupted section as readers. This would
> > > > > > require PREEMPT_RCU though.
> > > > > > 
> > > > > > And then synchronize_rcu() would do the 1, 2, 4 jobs.
> > > > > 
> > > > > If I am following correctly (ha!), sleepable BPF programs rule out use
> > > > > of RCU in this manner.
> > > > > 
> > > > > But your point is nevertheless valid, in that SRCU could be used.
> > > > > And because rcu_read_lock_trace() is a thin wrapper around SRCU-fast, we
> > > > > *might* be able to instead use rcu_read_lock_tasks_trace(), which would
> > > > > skip the task-struct increment and decrement, saving a few instructions.
> > > > > Then, instead of waiting for each task's counter to go to zero, instead
> > > > > just invoke synchronize_rcu_tasks_trace().
> > > > > 
> > > > > Which is pretty close to what Josef is proposing, just with the new RCU
> > > > > Tasks Trace read-side primitives.  I think.  ;-)
> > > > > 
> > > > > This assumes that we do not need to flatten partially overlapping RCU
> > > > > Tasks Trace readers into one big reader.
> > > > > 
> > > > > Or am I missing something here?
> > > > 
> > > > Yes I think that's what Josef does in this patchset. The problem is about
> > > > handling the few instructions:
> > > > 
> > > > 1) between the begining of the trampoline and the call to rcu_read_lock_trace()
> > > > 
> > > > 2) between the call to rcu_read_unlock_trace() and the end of the trampoline
> > > > 
> > > > So what I'm proposing is to make those two parts implicit RCU read lock sections.
> > > > 
> > > > So the whole trampoline would be .text.rcu_no_qs:
> > > > 
> > > > .text.rcu_no_qs trampoline:
> > > >   __________________________________________________________________________________________
> > > >  |Few instructions 1 | rcu_read_lock_trace() .... rcu_read_unlock_trace | Few instructions 2|
> > > >  ___________________________________________________________________________________________
> > > > 
> > > > Then when a tick fires, rcu_flavor_sched_clock_irq() discards the interrupted
> > > > code as QS if the IP was within .text.rcu_no_qs _unless_ it is in the
> > > > rcu_read_lock_trace. Both are easy and quick to verify.
> > > > 
> > > > Also preempt_schedule_irq() would make sure to verify the same condition and
> > > > enqueue the task as a GP blocker if preempting inside "Few instructions 1"
> > > > or "Few instructions 2".
> > > 
> > > Ah, OK, I might be following now.  ;-)
> > > 
> > > We also need both versions of rcu_exp_handler() to check the IP as well,
> > > given that sooner or later someone is going to want trampoline removal
> > > to go faster.  Or am I still missing a turn in here somewhere?

I should add that the thing that I really like about Frederic's approach
is that avoids the task-list scan.  Or at least has the potential to
do so.  Such scans have proven problematic in the past.

> > Yes indeed, missed the exp part!
> 
> What remains to handle also is non-preemptible RCU because if the task is
> preempted by an IRQ while in the .text.rcu_no_qs, we may still need to keep
> track of that somewhere.

Perhaps in rcu_core() in kernels booted with use_softirq?  I am thinking
specifically of the checks for deferred quiescent states.  I don't (yet)
see a need to modify rcu_check_quiescent_state().

Maybe other places as well.  ;-)

							Thanx, Paul

