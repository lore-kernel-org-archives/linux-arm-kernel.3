Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AF9C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkbPrcWx7naDFzx6es9+fglMGRB1RD3y/GInwlzOxG0=; b=is1qsc5LzhCgcm7BmfevUqmTdZ
	VW/Man6NaUyfIg6Tl4htJ/4Z8hRnPLcXgUjYBEfke/7+Zm57ZGcXa9NOXrrqGG5T0j+WGFMVuOcYN
	6v1VAxbPBVVyG/qJcRky+vmnzsSmifFeGD0a1xyFJ8LBRdBiqQvcUAuF8Rs70qfN15wbZzLH5S0vY
	Jsp4pfU9GPWRbO19/4mmFVgE8V5h4FwOA+3EjkS//1yYPajy5DYzU5H62FS59KL7pGwF2EpgZB8PK
	yXX0OsON+UOykb3By3/1bEb2j1cFqOy7oX++woerPYu/X8x3SWSnqzeYBGN5T3YpoQi+ZALNTHUdY
	OmQJ61QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B14-0000000BGKC-49gv;
	Thu, 17 Sep 2026 12:15:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B14-0000000BGJw-0N99
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:15:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70873602CA;
	Thu, 17 Sep 2026 12:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894761F00893;
	Thu, 17 Sep 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789647301;
	bh=gkbPrcWx7naDFzx6es9+fglMGRB1RD3y/GInwlzOxG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9x6i3WuvpeAcNcSCVNaCtMy5SaRo1F+MZuI+PgVBSML9X+5R+oQzomOBe+PerxoF
	 MGnUJJPBiBDo05wMQ6X2KJcxdTZENp23PzB7WcnSwSqj62YzmxsyGgJ7HZBIPXjfEF
	 E8dIJpEOvURwajkhYJ8tZHYQ6DR7NoU4HbmBYBXiWsOXfSshDWbFnC/MWHjo/l6SjU
	 kyARmxn8MXXrjxfSzwNY5oyHwnrB7W7LX+V0sI6oGEFdrpZUh+ZlK2RgUPaDlHkss4
	 ui9Wsp50EnRuS0GxbBmgweTiv/MsHviRvjcYoGFHOH38WcDLv/iZ2YR+oN+hK1zE4l
	 XEyjqlwBekiag==
Date: Thu, 17 Sep 2026 14:14:57 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Message-ID: <aqvZwfUVsiEI7q7y@localhost.localdomain>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
 <aqlgxKGk_AEKls_1@localhost.localdomain>
 <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
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

Le Wed, Sep 16, 2026 at 08:41:36AM -0700, Paul E. McKenney a écrit :
> On Wed, Sep 16, 2026 at 05:23:31PM +0200, Frederic Weisbecker wrote:
> > Le Wed, Sep 16, 2026 at 07:55:02AM -0700, Paul E. McKenney a écrit :
> > > Perhaps in rcu_core() in kernels booted with use_softirq?  I am thinking
> > > specifically of the checks for deferred quiescent states.  I don't (yet)
> > > see a need to modify rcu_check_quiescent_state().
> > > 
> > > Maybe other places as well.  ;-)
> > 
> > Hmm this tracking would have to happen on preempt_schedule() just like we
> > do for PREEMPT_RCU. Or am I missing something? And then we would need a
> > list scan of those tasks.
> 
> I am thinking of the case where a trampoline is interrupted before entering
> (or after leaving) its RCU Tasks Trace read-side critical section.  Then
> there is a softirq handler on the back of that interrupt handler, and
> RCU_SOFTIRQ is invoked, calling rcu_core().  Specifically:
> 
> 	/* Report any deferred quiescent states if preemption enabled. */
> 	if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && (!(preempt_count() & PREEMPT_MASK))) {
> 		rcu_preempt_deferred_qs(current);
> 	} else if (rcu_preempt_need_deferred_qs(current)) {
> 		guard(irqsave)();
> 		set_need_resched_current();
> 	}
> 
> Preemption is enabled, but we should not report a quiescent state because
> we have interrupted a trampoline.  Correct?

Right!
 
> > Or we can build the blocked task list handling, that we already have for PREEMPT_RCU,
> > when CONFIG_RCU_TASKS && !CONFIG_PREEMPT_RCU. We would just only add tasks when
> > preempted in .text.rcu_no_qs since rcu_read_lock() would still disable
> > preemption on normal explicit readers. So I wouldn't expect more overhead due to
> > that blocked list tracking built since it would rarely track tasks.
> 
> Yes, we could avoid the list of tasks by treating the preemption within
> the trampoline the same as preemption within an RCU read-side critical
> section, but there might not be an rcu_read_unlock() to clean up.
> Which could be a problem.

Ah yes, good point.

> 
> Trampolines that transfer control to tracing code could supply the needed
> cleanup call.  But last I checked, there were trampolines that transferred
> directly back to the original code, with no opportunity for cleaning up.
> 
> Or am I still missing a trick here?

You're right. So we'll indeed need to reuse the deferred qs points here.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

