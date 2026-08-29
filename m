Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C5C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SX1FLvOIFSHuqgjqZXoyvcWzn59rRJ4yAy3cPilBPfs=; b=RYSZKWuVV/FY2Ef3RPAMiZS9ok
	mVu/Kl6mq7k03RN7pqeMB8x30lfy1opzu01JjbmUlU3KkBsee4RPgszft33awxGLkXbq7RuCoOZlU
	r/wT2nFPJXASJd+b9jfbAY8AdWlX5gq71yIYCt0YvBo+3LMjl0XoWlrnky1egDwWy77HDyOWQzt3o
	am7x983eHgJn+L8SS+Mpv3DlsbKXbIg8gg6YlifFZcIlaVt8upxBKsGcWubbnSIflTw9IR/UJ1n3T
	QgkYn8sCj2fytuQe7DawPXlm3pu4BTeIZmqYHfuqC53EZSsCWIMUs18qP6tbsxS02fMphlFnXWRXa
	pYkoME9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0KN9-0000000725w-3R9C;
	Sat, 29 Aug 2026 14:49:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0KN9-0000000725b-0KKN;
	Sat, 29 Aug 2026 14:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SX1FLvOIFSHuqgjqZXoyvcWzn59rRJ4yAy3cPilBPfs=; b=OvozmjiX5mFbDoB4jSgTxkNxJ5
	Zfhj7AJNCi2u1p2S6ieZ3nMrvkj151vzofRuiFEtBNVz43gfPB5P7/Oa1vbTIskKCIYUXSrO07ppN
	OiKsyqHdyBhlVSw78tpf1rYf+g1rT66QEZeH0x/zWKX8tst6RBW1U+4WyQFQlRjQUUXCwlnsbDBbb
	idHkygyLw05rNiH0LzWDD+blm0X/hIK6DUYdKm2oQJZAulbAmC5fFqheRJehMiJxsOO7Cqd8ORGIs
	3YicaqqUsyNU956MFxLwfQJ5/3Eq5JxZwq3wNIO2WvwMUIvUjQMWbQkYm4ij7TR9l6nMPYkOb0OOF
	7lzqn0VA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0KN1-0000000Gbyg-0k1Y;
	Sat, 29 Aug 2026 14:49:23 +0000
Date: Sat, 29 Aug 2026 15:49:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <apLxcg3Lgy0-nXA4@casper.infradead.org>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <CAOiLmNHrbXeTY7zoNodmaZUoMWf+NgvGvZ_LjfWD-1sKAoiLeQ@mail.gmail.com>
 <20260829084901.GA776954@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829084901.GA776954@noisy.programming.kicks-ass.net>
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

On Sat, Aug 29, 2026 at 10:49:01AM +0200, Peter Zijlstra wrote:
> > On PREEMPT_RT, it is necessary to skip the call to
> > alloc_pages_nolock_noprof() from under pi_lock, since with that
> > configuration spin_trylock can end up needing to take pi_lock. But at
> > least on !PREEMPT_RT, there is no risk of deadlock.
> 
> Yeah, which puts the lie to that horrific hack Alexei did. We should
> probably teach lockdep about spin_trylock() not being safe and see the
> house of cards crumble.

Why is spin_trylock() unsafe on PREEMPT_RT?  It's not intuitive since
one can mutex_trylock() in interrupt context or under spinlock.

