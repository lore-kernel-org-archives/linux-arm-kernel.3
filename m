Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07FCC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2duOlGKkCInlwogKebH77CQ5chyg8OhYTpGQwehpGg=; b=tl64erD9qQqTWm2i0U2pghL8f+
	gvXkslL9EetbKlOZJ1lI8EdRzqO5DMRObm5X5716hh2OCcq5NKagJXnkz1o+WrKWhRNLC2jwCedVv
	UKSVMkrcYC6tkowUJ1J+wlcBOqD7B1m28FLHE7uujHuLQpAC1rbQ0LEIo0QAXboK4xUWr2kinQ1TA
	Kw5LxPnZQFLn+t0rABmEvYm4ECUadcNeT625j2eulezI1LwPTsM8pvA92uCxMNvDVprhFl6uUTs+V
	Br/33XZ/XwLep8lHtB7eOi90lr1Pxt9muRgPKj5/4fTCy7NwED+mhPUvXvX6B2j4DsE6lvb1c6T0J
	1Nj21bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSkA-0000000Dwic-1rRf;
	Tue, 20 May 2025 19:35:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSSu-0000000DuNY-0fd8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 19:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s2duOlGKkCInlwogKebH77CQ5chyg8OhYTpGQwehpGg=; b=LC6dB+ReZgqhI/16zhwmZMQYU9
	sDZ4wpcDho5w1ohdtuG/vb638W5SbSIkUoIuVtbnSz+H1n8lZw+HPNsCKZ8loVTuIcy08EUHoDWno
	O0PpeC6jxy3ANrcZCj47sF1EgsX6Aqf1tW5xsNF9IolDcZ8H0s2NAx4ak5W2HjyhsnyQE9cuiARsV
	ie4mwIlqErpGlEy5obfR6XYvkRIq3oWiXPlXHAacfUiMVmlDrdb/Z+hJqTSRYmkbU9wCml8mNctns
	t/x7jTbaBsREwn4bi/DOb7nFBC3Dl/EllEbA610LAnwX3crCo9ze/LP5saeuszj5RxAvpIZ0wi2sa
	Z1vMIWlw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSSq-00000003kL2-3412;
	Tue, 20 May 2025 19:17:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CD5D3300677; Tue, 20 May 2025 21:17:23 +0200 (CEST)
Date: Tue, 20 May 2025 21:17:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>,
	David Matlack <dmatlack@google.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2 06/12] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
Message-ID: <20250520191723.GI16434@noisy.programming.kicks-ass.net>
References: <20250519185514.2678456-1-seanjc@google.com>
 <20250519185514.2678456-7-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519185514.2678456-7-seanjc@google.com>
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

On Mon, May 19, 2025 at 11:55:08AM -0700, Sean Christopherson wrote:
> Add a waitqueue helper to add a priority waiter that requires exclusive
> wakeups, i.e. that requires that it be the _only_ priority waiter.  The
> API will be used by KVM to ensure that at most one of KVM's irqfds is
> bound to a single eventfd (across the entire kernel).
> 
> Open code the helper instead of using __add_wait_queue() so that the
> common path doesn't need to "handle" impossible failures.
> 
> Note, the priority_exclusive() name is obviously confusing as the plain
> priority() API also sets WQ_FLAG_EXCLUSIVE.  This will be remedied once
> KVM switches to add_wait_queue_priority_exclusive(), as the only other
> user of add_wait_queue_priority(), Xen's privcmd, doesn't actually operate
> in exclusive mode (more than likely, the detail was overlooked when privcmd
> copy-pasted (sorry, "was inspired by") KVM's implementation).
> 
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/wait.h |  2 ++
>  kernel/sched/wait.c  | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index 965a19809c7e..09855d819418 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -164,6 +164,8 @@ static inline bool wq_has_sleeper(struct wait_queue_head *wq_head)
>  extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
>  extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
>  extern void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
> +extern int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
> +					     struct wait_queue_entry *wq_entry);
>  extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
>  
>  static inline void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index 51e38f5f4701..03252badb8e8 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -47,6 +47,24 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
>  }
>  EXPORT_SYMBOL_GPL(add_wait_queue_priority);
>  
> +int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
> +				      struct wait_queue_entry *wq_entry)
> +{
> +	struct list_head *head = &wq_head->head;
> +
> +	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
> +
> +	if (!list_empty(head) &&
> +	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
> +		return -EBUSY;
> +
> +	list_add(&wq_entry->entry, head);
> +	return 0;
> +}
> +EXPORT_SYMBOL(add_wait_queue_priority_exclusive);

add_wait_queue_priority() is a GPL export, leading me to believe the
whole priority thing is _GPL only, should we maintain that?

