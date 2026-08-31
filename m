Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAFDC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2115nKGBEwObmSrqlfs2WcBhmzv4iDh4H0qiO5lvUM=; b=UtP/TY2wjOa0saYwihZuIjKPIM
	y65IDYboatKUFhIpDZKYWRSatSZ9tHjCYYJ4fPyAF0u0escS1DaG4rKhbhUn0WCbqNHOdrF1E6/aO
	2tBlm1OJQqigTZFZgX3RrdB1usSFp3rjtobtzg+E+0kYR3hHdqHRe0yZ+fdC6TlzCep3P6xeVItqd
	82U1xWfThCfc1gzcybzJvtrxqK3ld25wQaYtH0rJdO11KaFr4coAOanXsIoZioxrmzT5sbPAG007O
	WZgn4rEBXd4qXpX6H8hF+u5y8yqDV7xjPN1OotQTuLztntfyqBR+u++p0VQNyFNSOD6LiF1rBciYJ
	HY8U5H1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wEE-00000008hP1-1f8j;
	Mon, 31 Aug 2026 07:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wED-00000008hOh-2deo;
	Mon, 31 Aug 2026 07:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c2115nKGBEwObmSrqlfs2WcBhmzv4iDh4H0qiO5lvUM=; b=pGIgXFEKAN/kTi6sG6t/00uMvv
	+WycgRgKlg/+rvkAKsveOmQTewMEVutHhuo5hVygDJWrzcNnYzE7wD+mQYmhxZKmHutXGdW+zNJ0H
	OyUKRZQJE2oXdf8gdmVvf7G1wf0r5LcVy71HIPmPUrpkyzANAaTHG15lLBvSqf7FaJ+gA2Uq5rV/g
	uj+0F9R8YG0UxT1bpDWxxd/xYyYYqc1wmAynqepmWo4TB9B5IPbw0uCJKDqp/H3ooTXtSvGJdRSlP
	0TMmHkfzu51BKdWUabDiW6kkL6aNKnDGgLILH9HbPwmWZLqpYHo+pm82f0/WFES3FAUGqRxoYI3Qf
	7tFNNdGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x0wEA-00000009bM1-2gNA;
	Mon, 31 Aug 2026 07:14:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7EBA3002D8; Mon, 31 Aug 2026 09:14:44 +0200 (CEST)
Date: Mon, 31 Aug 2026 09:14:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: David Stevens <stevensd@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260831071444.GT687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <CAOiLmNHrbXeTY7zoNodmaZUoMWf+NgvGvZ_LjfWD-1sKAoiLeQ@mail.gmail.com>
 <20260829084901.GA776954@noisy.programming.kicks-ass.net>
 <apLxcg3Lgy0-nXA4@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apLxcg3Lgy0-nXA4@casper.infradead.org>
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

On Sat, Aug 29, 2026 at 03:49:22PM +0100, Matthew Wilcox wrote:
> On Sat, Aug 29, 2026 at 10:49:01AM +0200, Peter Zijlstra wrote:
> > > On PREEMPT_RT, it is necessary to skip the call to
> > > alloc_pages_nolock_noprof() from under pi_lock, since with that
> > > configuration spin_trylock can end up needing to take pi_lock. But at
> > > least on !PREEMPT_RT, there is no risk of deadlock.
> > 
> > Yeah, which puts the lie to that horrific hack Alexei did. We should
> > probably teach lockdep about spin_trylock() not being safe and see the
> > house of cards crumble.
> 
> Why is spin_trylock() unsafe on PREEMPT_RT?  It's not intuitive since
> one can mutex_trylock() in interrupt context or under spinlock.

We should not be able to do mutex_trylock() from interrupt context.

Because then we end up with an owner that is not a task, or if we
account the interrupted task as the owner, idle that owns a sleeping
lock, which also leads to problems, such as trying to boost idle and
other such nonsense.



