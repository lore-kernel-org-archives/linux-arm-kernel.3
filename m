Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC15C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 22:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUSC3/6wZp614V0HmSolX31ACddFJPOtZM6hstYDymE=; b=KzZzKkaDGA3n7PGiHahKBIPJUa
	NWHBoXWJbeTVp2wxxeT1ohYbZLh6eTp1dUaNblJJQxIeOzbuXFqP2/8d4Ep0npwITjm+3gJdkBo/2
	/fm1P84TjggEKDwbditk3hURjzrU5XceZ7k6UtY0AGI1NsULsW9Rpp+v1EZQAkdo9OwrNcoUAhcr4
	pZBUktWu7D+Y5dLu8BDD3AF0F4jdt9GLO/25TgZgQN3ikDhA8UT7AOkLuHobkseSRQcMUbCjWsqOw
	vRTXZDN6qFc0wpIWNcd+igYwbdw9VzxqD3V6X00WFTr4Mk8VklcUwvfWVqymsx7vriZxq1XlUCsoe
	1VL6bl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WCs-00000001FeM-46kN;
	Sat, 12 Sep 2026 22:28:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5WCs-00000001FeF-0v9K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 22:28:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CEDB44B58;
	Sat, 12 Sep 2026 22:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CDB1F000FF;
	Sat, 12 Sep 2026 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789252096;
	bh=FUSC3/6wZp614V0HmSolX31ACddFJPOtZM6hstYDymE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CAY8iaMRIgUEVj2m8qO5yp0DxUv+P5XvE2wHuZpVgEs1aEJozyptLJbfPwIDKU9cG
	 nZ8lr7em4IssfJNCHthk1CBckof4zi6MPqWd2jJVXxGnpw499vSiEhg0xj7sJOYZgY
	 8C/0OqEOoxtby2igBkVtTcnZDnI6giwDd39+A3lwn/gzgznfonBDHsvuJ+lNWa/070
	 UYnUHAEQ18maKO95GoFBGluciXa8xqJjOpILbWWdTFyb/lqEmdWzQ78VurvGX1Z7Sv
	 KjOJN8mcAIANRvNl//XI9HifNzupXh1acBkdTfKFwO0hryPFkxTNHR9mulXJ+sQ3Rw
	 OD+q87PDNaJpg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9A778CE17BD; Sat, 12 Sep 2026 15:28:16 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:28:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
 <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
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

On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> >
> > In the old kernels, yes, we have current->trc_reader_nesting++.
> > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > other thins is a bit faster and does not need to hook into the scheduler.
> 
> old kernels? I'm confused.
> rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> and then calls __srcu_read_lock_fast().
> 
> Are you talking about some RCU branch that you target for next merge window?

No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
Your comments are quite correct for rcu_read_lock_trace().

Hmmm...  Josep's using t->trc_reader_nesting would break for
partially overlapping RCU Tasks and rcu_read_lock_trace() readers.

But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
Trace to check for preemption from within trampolines, and move RCU
Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
(Or am I still missing your point?)

Josef, thoughts?

							Thanx, Paul

> > So we have several ways forward:
> >
> > 1.	Revert the implementation of RCU Tasks Trace in terms of
> > 	SRCU-fast, and use the existing current->trc_reader_nesting++,
> > 	as you suggest.
> >
> > 2.	Deprecate RCU Tasks Trace entirely in favor of RCU Tasks
> > 	augmented by rcu_tasks_trampoline_enter() and friends, as
> > 	I was suggesting.
> >
> > 3.	Implement rcu_tasks_trampoline_enter() in terms of SRCU-fast,
> > 	keeping the speedup, and put a synchronize_srcu() in the
> > 	RCU Tasks grace-period mechanism.  This again deprecates
> > 	RCU Tasks Trace entirely in favor of the augmented RCU Tasks.
> >
> > 4.	It is always good to explicitly state the apparent status quo,
> > 	which involves redundant trampoline entry/exit overhead.
> >
> > 5.	As always, your additional ideas here!
> >
> > 							Thanx, Paul
> 

