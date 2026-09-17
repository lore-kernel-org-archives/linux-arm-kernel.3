Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF4C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnYr6zMfa+cOfnhiHI6/0JGoc6S5Gsj1WeIOONeYOVs=; b=n4LFWLsLfmjI6eJvnnDkJWLdtX
	TPfV2YGjQpMxzZJ14N/VCEGnYERIeEdmameQDUemNtU6UFVLBL0moQIrKQRMUcW3zixqYCO0Lpdso
	lDwpfbhSwl6+FkFcnpxQN/8Yed3yqunuU6Ev5ceG7XjsvAWsVb8KDdnFVmEKyuz7jGbUYQtc7xnmS
	a0tKdKt+jaGCSFVs0u1M8mxMwmPeiWYsZIQd03oHIRRuiJlr7WATGkBTy90cof+M14/jgk8QOrit8
	jTDiUPPc7T4672Jdl89xrjMn/qzjgZDJsxkJE3gkmfD6OL0q0LfuSyQRAl4SA2O36OT3z3acgIo4w
	y7hLjczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EDd-0000000BioB-00Ez;
	Thu, 17 Sep 2026 15:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EDb-0000000Binw-40Tf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3666E60204;
	Thu, 17 Sep 2026 15:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81BB1F000FF;
	Thu, 17 Sep 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659610;
	bh=OnYr6zMfa+cOfnhiHI6/0JGoc6S5Gsj1WeIOONeYOVs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=hcvQWlllk84UctC7FJV5+Iain7lAuduBRO6z+yL3t53gBs3K5x933ujpp6K9IYYo7
	 eCUvlyIqRf/1fHAeUjXgmhAl8T5UIu8zVkdDz7M+8odIRYwbhn2mMScpw6NJ6vKuvo
	 S+HQwwO+z7y/+TIgLsPfDLmkVZcLsd7gORLkKcupTeH6WyCLgszAqZrcH25OiH6w5p
	 hh8beW5jD1BC0KZ5dRJA/WDQ21iYAyRHR0fDNE1CI3UfmJmcxqHhe85nw44QJyfg7E
	 p9qBPzqxanQ07NR44YW6yh/VAu/KEDUuMkUys+s8jvEqk3idTYzwPbBE0vGR+TPz/Q
	 fZmzmQykfpn4g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 98EA8CE1716; Thu, 17 Sep 2026 08:40:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 08:40:10 -0700
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
Message-ID: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
References: <aqlgxKGk_AEKls_1@localhost.localdomain>
 <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqvZwfUVsiEI7q7y@localhost.localdomain>
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

On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> Le Wed, Sep 16, 2026 at 08:41:36AM -0700, Paul E. McKenney a écrit :
> > On Wed, Sep 16, 2026 at 05:23:31PM +0200, Frederic Weisbecker wrote:
> > > Le Wed, Sep 16, 2026 at 07:55:02AM -0700, Paul E. McKenney a écrit :
> > > > Perhaps in rcu_core() in kernels booted with use_softirq?  I am thinking
> > > > specifically of the checks for deferred quiescent states.  I don't (yet)
> > > > see a need to modify rcu_check_quiescent_state().
> > > > 
> > > > Maybe other places as well.  ;-)
> > > 
> > > Hmm this tracking would have to happen on preempt_schedule() just like we
> > > do for PREEMPT_RCU. Or am I missing something? And then we would need a
> > > list scan of those tasks.
> > 
> > I am thinking of the case where a trampoline is interrupted before entering
> > (or after leaving) its RCU Tasks Trace read-side critical section.  Then
> > there is a softirq handler on the back of that interrupt handler, and
> > RCU_SOFTIRQ is invoked, calling rcu_core().  Specifically:
> > 
> > 	/* Report any deferred quiescent states if preemption enabled. */
> > 	if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && (!(preempt_count() & PREEMPT_MASK))) {
> > 		rcu_preempt_deferred_qs(current);
> > 	} else if (rcu_preempt_need_deferred_qs(current)) {
> > 		guard(irqsave)();
> > 		set_need_resched_current();
> > 	}
> > 
> > Preemption is enabled, but we should not report a quiescent state because
> > we have interrupted a trampoline.  Correct?
> 
> Right!
>  
> > > Or we can build the blocked task list handling, that we already have for PREEMPT_RCU,
> > > when CONFIG_RCU_TASKS && !CONFIG_PREEMPT_RCU. We would just only add tasks when
> > > preempted in .text.rcu_no_qs since rcu_read_lock() would still disable
> > > preemption on normal explicit readers. So I wouldn't expect more overhead due to
> > > that blocked list tracking built since it would rarely track tasks.
> > 
> > Yes, we could avoid the list of tasks by treating the preemption within
> > the trampoline the same as preemption within an RCU read-side critical
> > section, but there might not be an rcu_read_unlock() to clean up.
> > Which could be a problem.
> 
> Ah yes, good point.
> 
> > 
> > Trampolines that transfer control to tracing code could supply the needed
> > cleanup call.  But last I checked, there were trampolines that transferred
> > directly back to the original code, with no opportunity for cleaning up.
> > 
> > Or am I still missing a trick here?
> 
> You're right. So we'll indeed need to reuse the deferred qs points here.

Except this is getting a bit involved.

Don't get me wrong, if Josef is happy to take this on, far be it from me
to stand in his way.  But if not, we should be willing to treat this
optimization as a follow-on effort, whether by Josef or someone else.

							Thanx, Paul

