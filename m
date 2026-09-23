Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B6C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1foUsDpAEZYtjknaRltgsBB8N+Dblj/3OAvcebQkh1g=; b=IbQwbFBEhpYwR9isyfx74t2Vo0
	VLziTE0JB75uDLVPL9whQ27/atCqna/dFxg4c/BSxnOR4Das/EZaJ3/CiuKPi2ozgBavMqsgDByen
	4TgLwsHM7vZktgpTT88v8zayiAX74/gtFrhHXotpwnn0dprDmx73LI/rbIYxCqcVVwXEP1A2buTI8
	f572ZsPA/QHZ0izrZ7qlgn9Uz07z1M+3yMd/ogZARAUo/6erB1rW2o28YLKosCpf/yP1qVScG5ujI
	z6diTpiK1qDSCTiRAr9fYIKqg7eCwdEBwraSHSREX29N3AQGsV/qpWmF/zBu7k7X81gF/jOlaOzs9
	EeEHZgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HfJ-00000007R5T-1XBi;
	Wed, 23 Sep 2026 07:45:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HfI-00000007R5M-1l3E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:45:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA37641778;
	Wed, 23 Sep 2026 07:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BDB1F000FF;
	Wed, 23 Sep 2026 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790149515;
	bh=1foUsDpAEZYtjknaRltgsBB8N+Dblj/3OAvcebQkh1g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PFyD01pD0i7cPkEY4MT4Tx4wptgkKyfc+CFsCp6tCOVVDwCG2sGXnnkoVJm8LMONm
	 Gnj04qtcJCEN0cJVTRjB78TdeBrsSszyM/lbKH7wivZe0P1aRDSW44UEvYGOtC5W8/
	 CQvXZI9qHt96in2Kvvwm3wGA0BkmcWzqVwvPYzDXzQDA9YyfmLNqq5JHxeyKmmAkgM
	 uHEWdH3MvdFddROGMBz8x1jaq6O091sTatyFMVW3qcbsKit/4scqTvn2te/E0PVjWk
	 KZ1X6r4aRQsdWxrFo3w7n9m3AQHgdtlsSCRQ0VkBFtnciIR1VBkCjDwSzGRNDpsdql
	 v1HltHf7Yn4gA==
Date: Wed, 23 Sep 2026 16:45:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, rcu@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/13] kprobes: Expose the optprobe jump window to
 Tasks RCU
Message-Id: <20260923164510.f3bbddefea4423f8f1bfecb8@kernel.org>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-3-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
	<20260922-b4-rcu-tasks-preempt-qs-v5-3-410f57770bad@toxicpanda.com>
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

On Tue, 22 Sep 2026 02:23:22 +0000
Josef Bacik <josef@toxicpanda.com> wrote:

> kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
> about trampoline text: it waits for tasks that were interrupted on an
> instruction boundary inside the bytes it is about to overwrite with the
> optimized jump, so that none of them resumes into the middle of the new
> instruction.  Those bytes are ordinary kernel or module text with no
> Tasks Trace reader around them, so on CONFIG_TASKS_RCU_TRAMPOLINE_READERS
> kernels the irq-exit quiescent-state check has to be told about them.
> 
> Add kprobe_in_optimized_region(), a lockless and conservative form of
> get_optimized_kprobe() that reports whether any registered kprobe lies
> within MAX_OPTIMIZED_LENGTH before the given address regardless of its
> optimization state, and have rcu_tasks_trampoline_text() consult it for
> core and module text so that a task interrupted there becomes a holdout
> rather than a quiescent event. The hash walk only runs while
> kprobe_optimizer() is actually inside its synchronize_rcu_tasks(),
> tracked by a flag it sets around the call; otherwise the check is a
> single load. That check cannot see a task that was already preempted in
> the region before the flag went up (possibly before the kprobe even
> existed), and the new grace period does not otherwise wait for a
> preempted task to run again, so before synchronize_rcu_tasks() the
> optimizer calls rcu_tasks_wait_irq_preempted() to wait until no parked
> task's recorded irq-exit preemption IP is inside such a region; its
> leading synchronize_rcu() also publishes the flag to every (interrupts-
> disabled) check in flight. The kprobe hash is RCU-protected and every
> free path waits for a grace period after unhashing, so the lockless walk
> from the irq-exit path is safe.
> 
> On other configurations the flag is set and cleared but nothing reads
> it and rcu_tasks_wait_irq_preempted() is a stub; the classic
> implementation already waits for such tasks.

Hmm, this seems a bit awkward. To solve this problem with tasks RCU is
not a straight solution. I rather like to suggest fixing kprobe_optimizer.

Since the root cause of the mutex related hang_task stall is the
kprobe_optimizer() waits RCU under locking mutexes -- text_mutex,
cpu_read_lock, and kprobe_mutex. When I introduced this, waiting
RCU grace period did not take so long time. But now it can take
longer, so it is a good chance to fix it completely.

Since the RCU is a kind of the generation control of internal state,
we can introduce multi-generation optimizing/freeing list and
RCU tasks callback for that.

Let me try to make another series to fix optprobe side.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

