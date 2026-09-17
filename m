Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B8C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXB70s8tC0N4djKhk6YxK6M2sEK0IClm9i5YiNUGtD8=; b=HzM6ayOHGW1PW//FDStbW6rVMj
	Q89Hw6RbZ7LIgpj9hhLBjd4MsJmLH9OSQZLBk1ZO04khT0R65jV6ZIp/US8PInDFDaGtK1mLiZ9y6
	09f4xHM3f2PuSgW+VnrbSj0/9KMjco0c7ti6MtA3ary0qBB8nW5bACgILxMRbqe7M77mGpT8PB9y6
	WVW42GMhXALgd9po/0WISCIok11q2XeJdylIpVLwbpuSCs9Y0aGJUaa5cnQEDSGeqCiYm+GCNt81b
	v3Ba2xCOCCrV0MWBVX8IutQL+UUv8oKyddK3A7hZ9cCUtMi+9QKdbE5b5I4NLfueCA8ZlI5NU421b
	hdZXEiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Iak-0000000CPz1-491Z;
	Thu, 17 Sep 2026 20:20:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Iaj-0000000CPyu-2KbN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B52601FF;
	Thu, 17 Sep 2026 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B03F1F000FF;
	Thu, 17 Sep 2026 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676420;
	bh=RXB70s8tC0N4djKhk6YxK6M2sEK0IClm9i5YiNUGtD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgWzVoH4Tdgc3xbhEiQn7a6FJ/07+ERma5xsfx6CkqdFWA+dhVut+XxWCw+O3cdHo
	 353RpR9YS4TSztc8wrKkHDyD3hOLYGP+SFrzV6RR38x+cCsWQrL4Tkx0apZ1LOlbjD
	 Pw+ePTdyDbLqc4xmPt8BS1hyD5vEys0JA49NovRKLhSpDUz7u0bVIDfae91KAFjAWu
	 Lc2oIXJ0sLEUOn/7zsKrlGx2h278H2Ocj/FRGNmzwEbvq6nCQj5a4GNBMRZ3Brx1y7
	 Mq5DVlrP4IJn0NFAcN7hGMfB3aMSFA7idC83SWUP1zSgwwVqHLkW2tXu3aIDr+xk1O
	 XIViCSjFySfOA==
Date: Thu, 17 Sep 2026 22:20:17 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
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
Message-ID: <aqxLgT41UyA-bV5J@pavilion.home>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
 <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
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

Le Tue, Sep 15, 2026 at 01:17:30PM +0000, Josef Bacik a écrit :
> +static void rcu_tasks_tramp_hold(struct task_struct *t)
> +{
> +	unsigned long flags;
> +
> +	if (t->rcu_tasks_holdout)
> +		return;
> +	raw_spin_lock_irqsave(&rcu_tasks_tramp_lock, flags);
> +	list_add_tail(&t->rcu_tasks_holdout_list, &rcu_tasks_tramp_holdouts);
> +	WRITE_ONCE(t->rcu_tasks_holdout, true);
> +	raw_spin_unlock_irqrestore(&rcu_tasks_tramp_lock, flags);
> +}
> +
> +static void rcu_tasks_tramp_release(struct task_struct *t)
> +{
> +	unsigned long flags;
> +
> +	if (likely(!t->rcu_tasks_holdout))
> +		return;
> +	raw_spin_lock_irqsave(&rcu_tasks_tramp_lock, flags);
> +	list_del_init(&t->rcu_tasks_holdout_list);
> +	WRITE_ONCE(t->rcu_tasks_holdout, false);
> +	raw_spin_unlock_irqrestore(&rcu_tasks_tramp_lock, flags);
> +}
> +
> +/**
> + * rcu_tasks_irq_resched_enter - Tasks RCU hook for the irq-exit reschedule check
> + * @ip: instruction pointer of the interrupted (task-level) context
> + *
> + * Called with interrupts disabled when an interrupt returning to kernel
> + * mode is about to preempt_schedule_irq(), the one context switch that can
> + * catch a task inside unmarked trampoline text.  Record where the task is
> + * parked for as long as it is (rcu_tasks_wait_irq_preempted() looks at
> + * that), and if it is inside such text make it a holdout before
> + * __schedule() reports the quiescent event; if it is not, this is as good
> + * as a voluntary switch for ending an earlier hold.
> + */
> +void rcu_tasks_irq_resched_enter(unsigned long ip)
> +{
> +	struct task_struct *t = current;
> +	struct rcu_tasks_percpu *rtpcp = this_cpu_ptr(rcu_tasks.rtpcpu);
> +
> +	lockdep_assert_irqs_disabled();
> +	WRITE_ONCE(t->rcu_tasks_irq_ip, ip);
> +	t->rcu_tasks_exit_cpu = smp_processor_id();
> +	raw_spin_lock_rcu_node(rtpcp);
> +	list_add(&t->rcu_tasks_exit_list, &rtpcp->rtp_exit_list);
> +	raw_spin_unlock_rcu_node(rtpcp);

I don't think we can do that. This is too much unconditional overhead
on the hot preemption path. rcu_tasks_trampoline_text() should be
a condition here.

And do we really need to maintain both lists? I understand that they
have different purposes.

->rcu_tasks_exit_list is to track preempted tasks on trampoline
->rcu_tasks_holdout_list is to track preempted tasks on trampoline until
                         they ever voluntary schedule()

Can the latter replace the former? I see it's used on kprobes and others
but I haven't checked the details yet.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

