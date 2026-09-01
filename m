Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768FAC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZeZ5z1io+JXvJ9SjEpRD3rg5z31zLq/vQ8rd29RbRw=; b=axTd383effhk7uQonRo1mJw9+1
	EYyB06ITJ0Indg3nUr2Jf4CLIMftLFtGTV4eFXxkbJeg9yjqpbDKM6X3jBlPPUKEk2g9BQIb8C12X
	o2l4szKvKXy8TvPgYm8vUMr+8C9j+HxV6fPH2VBy2DyWPrJ0PSxZ3l3Dt7TP9Zv9sjORCH+PfExgF
	NFTCjNUxGuVmhMME/SOBqauHwcFn/R6+AJ+1wYGIGHs6hyd3tUgvbitXiDYxYgXsnvyF+R1cID1AM
	Mecpcz+YaKlMdmqhM1drK3kdOV4B4womD/vMJ0OCqw3w4LQpxXZU3oSfzsbmNyuZL5P7ekWiREM3n
	8neO2Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NEs-0000000BvKa-3Bcv;
	Tue, 01 Sep 2026 12:05:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NBb-0000000BnWi-0Hw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:01:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64F0F41759;
	Tue,  1 Sep 2026 12:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F821F000E9;
	Tue,  1 Sep 2026 12:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788264107;
	bh=UZeZ5z1io+JXvJ9SjEpRD3rg5z31zLq/vQ8rd29RbRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNCIx8HyxE0C0GimP6YmdWgLiB61HFusPK9NlVs4pEdW6tXaSiLthMT19zo3zVt5o
	 Ny4xjCLyqoAD/a81rXEoo6DYlQ0vBjc647cjWj1LKugWyiJso8WoYF2GrZAX3yqEkP
	 /zSdQr1lcwLka1XKTtrDWcdOIhjoq8u0XAJmMZ7wkd7jVjlkZO2re7+Qpo/7Wl0ezt
	 1VZjC0Avsup3v6VcvQijMM1myhSYP5gfZUWQPW42wS/wa+W4oQqskwzmQMKhHfjnvg
	 oJSAoOpUW+uC53zJbe9IthmM/+B73Y252UlAbIuPjXr2h3ASy2P1hQtqnK1oo59jZ6
	 78ZdXpfDAWJwQ==
Date: Tue, 1 Sep 2026 13:01:37 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	David Stevens <stevensd@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
Message-ID: <apa-ocvQBOi8gy_E@willie-the-truck>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <20260828151018.HnR9xV1N@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828151018.HnR9xV1N@linutronix.de>
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

On Fri, Aug 28, 2026 at 05:10:18PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-28 15:59:47 [+0200], Peter Zijlstra wrote:
> > > > +
> > > > +	  The wakeup latency of tasks with reclaimed stacks may increase,
> > > > +	  especially while the system is under memory pressure.
> > > 
> > > It says *may* increase and on RT it _definitely_ will increase since
> > > there is a kworker involved not to mention the memory allocation itself.
> > > Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> > > exclude at the very least mlock()ed tasks.
> > > Did lockdep see this?
> > 
> > It should have. They're taking spinlock inside raw_spinlock and lockdep
> > should very much warn about that by default.
> 
> Yes. My point was that this was hidden from lockdep.
> 
> > > If I understood the whole exercise correct then you have a kernel stack
> > > of two pages and in best case you can unmap and release the second page
> > > while the task is napping.
> > 
> > THREAD_SIZE_ORDER	2
> > THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
> > 
> > that makes for 4 pages.
> 
> Oh. I wasn't aware that we have 16kib stacks these days. But looking
> at it we have it now for over 10 years… Judging from 6538b8ea886e4
> ("x86_64: expand kernel stack to 16K") it might be temporary and things
> are better now? Arm64 has a different story according to 845ad05ec31e0
> ("arm64: Change kernel stack size to 16K"). Risc-V also mentions "for
> now" in 0cac21b02ba5f ("riscv: use 16KB kernel stack on 64-bit").

FWIW, I'm hoping to make the arm64 stack size configurable on the kernel
cmdline with a view to changing the default back to 8k (assuming a 4k
page size). With 8k, we currently see some overflows in direct reclaim
(mirrored by a later stacktrace in this thread), but Suren has been
looking at ways to improve that (e.g. by moving it into a separate
kthread) which look promising.

Will

