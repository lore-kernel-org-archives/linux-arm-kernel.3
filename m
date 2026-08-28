Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0984C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/vQkPRWfO3dMD1qnZW0cONo4+Wv9gcM6DMq0ft41q4=; b=wyFPqPO8vdTJIcD4UWMKs5Wel9
	hQElzW0jpxSoRWsszLo/5co2otPPEwoULvcjMCFn+A+XOHcvzdA2YNjS9RYoi2DSGWxYDjEGVYYxK
	EhCJ4N6JaVyum1bhe1g1D6G0+bP9v/64UEWDmtzzYWPCL/88qhbbSDsEQ2/Y4FxxdpA54k2NRkpJf
	soEK3FJEgg6TClG+EqOymVfdzj/VXOCWbOsKX1HUEPHCYB6/mUk+77dbPWBDqjBbJR/B1E/fCcuD4
	1QwX+dbs4OIt9NWTgOoPr5rjYjXwRvafN99QIUDdhTTnwJnU//6Nb63yqlUBL9hUbLJn3waJ6wOtI
	NV12OJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx7Z-00000005vfP-102Z;
	Fri, 28 Aug 2026 13:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzx7Y-00000005vf2-0W4m;
	Fri, 28 Aug 2026 13:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z/vQkPRWfO3dMD1qnZW0cONo4+Wv9gcM6DMq0ft41q4=; b=MGYbK7pgkLwreR1NbEJ2ExVAGl
	KTSjrpILVYOMD0bXalDOVqN/fVKi44fsPfymsoGuNmuRRaofeLVyUrTIHNb0siKB3sHW1QfFH/ElJ
	XJqv6SDJOSrPIt+kYiBVrZwpvDs7W76upT8P/0xg+JI1Uyn2mz5bsErnOPePpn3Q6EeVga+qZWe8P
	aFyvCXNgTh8vEzFs4LxWN7e6eFMAk6q9tFW/1D3cAhu4R2IZPpdqSf72p3g1JzFYqCHmn4H5doMo5
	+U3XKywepWEMgvPNZ8vWLa/1x4zGYEyw/PiASNH/8vyscBy1cgu06aUJ2BsbF/FK0ZwUBrskyEqax
	Yp9ajIzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzx7U-00000008IYq-40GE;
	Fri, 28 Aug 2026 13:59:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5325230030F; Fri, 28 Aug 2026 15:59:47 +0200 (CEST)
Date: Fri, 28 Aug 2026 15:59:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: David Stevens <stevensd@google.com>,
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
Message-ID: <20260828135947.GU776954@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828133620._x2XfJR_@linutronix.de>
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

On Fri, Aug 28, 2026 at 03:36:20PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index fa7507ac8e13..adb4a5957996 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1534,6 +1534,24 @@ config VMAP_STACK
> >  	  backing virtual mappings with real shadow memory, and KASAN_VMALLOC
> >  	  must be enabled.
> >  
> > +config HAVE_ARCH_RECLAIMABLE_STACK
> > +	def_bool n
> > +
> > +config RECLAIMABLE_STACK
> > +	default !PREEMPT_RT && !PROC_KCORE
> 
> This shouldn't default like this for RT. It either is useable or it is
> not.
> 
> > +	bool "Allow stacks of some blocked threads to be reclaimed"
> > +	depends on VMAP_STACK && !STACK_GROWSUP
> > +	depends on HAVE_ARCH_RECLAIMABLE_STACK
> > +	depends on !DEBUG_STACK_USAGE
> > +	depends on !KASAN_VMALLOC # TODO: add support for this
> > +	depends on !DEBUG_KMEMLEAK # TODO: add support for this
> > +	help
> > +	  Enable this to allow the unused portion of kernel stacks of most
> > +	  blocked tasks to be reclaimed.
> > +
> > +	  The wakeup latency of tasks with reclaimed stacks may increase,
> > +	  especially while the system is under memory pressure.
> 
> It says *may* increase and on RT it _definitely_ will increase since
> there is a kworker involved not to mention the memory allocation itself.
> Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> exclude at the very least mlock()ed tasks.
> Did lockdep see this?

It should have. They're taking spinlock inside raw_spinlock and lockdep
should very much warn about that by default.

> If I understood the whole exercise correct then you have a kernel stack
> of two pages and in best case you can unmap and release the second page
> while the task is napping.

THREAD_SIZE_ORDER	2
THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)

that makes for 4 pages.

> What might be a tad simpler is to memset(,0,) the remaining part of the
> stack. Since the stack is vmap-ed it should be swapped out on its own
> without additional tricks. That memset() would help zram to compress
> better so it uses less memory. ta-da.

That would still be a 12k memset with IRQs-disabled and rq->lock held.

> What also should be simpler (and I am not saying just to move you away
> from the scheduler) is to have a shrinker which iterates over all tasks
> which are marked for reclaim and then similar to swap just unmap both
> stack pages and release the second page which is not used.
> Upon wake up the task should create a page_fault which would be used to
> allocate the second stack page and map the whole stack again.

Right, so you can FREEZE the task, unmap its stack and then thaw it or
something. But there should be a definite opt-out on all this, because
taking faults on your stack will be horrible.

Not to mention you'll suffer wakeup latencies while frozen.

This all really sounds like what should be addressed is this insane
number of tasks rather than trying to cope with the consequences of
that.

