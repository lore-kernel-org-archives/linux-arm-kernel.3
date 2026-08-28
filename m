Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689BBC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY84rfjFkNDjAWFNf8AP9fCrg78WzFe8p1rGWp/UIAo=; b=ScTmdUWIuU8QXmNHvHNFHgzVHO
	DUt1XVffmCgXL6Wb5DuQQ5QbXNVpjVyGJdfJJXGH5tCSOocpAr0fnSJpsEboo6FFrkl7cAbsxRJAW
	uraeEz20LwNMTVUEd3ErRa92wwmL198gAmb4OoUZ74iu9Y7OnxzQIFgu9ps+nkHnMllP19+H2jwjK
	3nHBT5K1JmOilddn1+hUhMNRH13cuZn1Jj1LuosQ3RFBXAiEA03RlFrTrPbVzElrSYFFOWkRWSypJ
	GRExkrNHs7NeBsLy7KBBIdZpL90z5bBQdML2RLc2WfVyGAG2wmQESSoE0nwV1q9hRUd9JVmP+OsxW
	SxFSZYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw05-00000005kz5-06sO;
	Fri, 28 Aug 2026 12:48:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw03-00000005kyx-2Fdn;
	Fri, 28 Aug 2026 12:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AY84rfjFkNDjAWFNf8AP9fCrg78WzFe8p1rGWp/UIAo=; b=apd9kBBLyOu58CYgPPP5CX3ADi
	bQwvk9xWrikcjNqyLtRx2ifMpANi76pueMtJCNpfBW3hS6hNFriUiwNXeOieYmaxYoWVEhH4yeyGQ
	B4ChwuMdqS6J+KGWO6Pa3/maqlBEgbclayatiFx/Nevfd831UN+Hiq0OeBqw4epE32rqEZruKNo5h
	Q94YyBfUjvAiC772y/3ECHbKipiJm4gmgQlmEjGqyB2krabU5/5qZDMZWTDH1+KD+eIB+yuwmHYHm
	GaTodGV5H2Mm+kMp6XQEbWwM8QktRq9qECMqOyA+DpA1ltXatP778QCi/VudQMVEmDm5i25tjrCUk
	2pUDBrnA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzw00-00000008FkC-1X7M;
	Fri, 28 Aug 2026 12:48:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C791030030F; Fri, 28 Aug 2026 14:47:58 +0200 (CEST)
Date: Fri, 28 Aug 2026 14:47:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	jstultz@google.com
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
Message-ID: <20260828124758.GP687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
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

On Thu, Aug 27, 2026 at 04:29:38PM -0700, David Stevens wrote:

> On Android, system processes typically have 2000-3000 threads. App
> processes add 1000s more threads on top of this.

WTF ?!? Why does that all spawn *that* many threads? Perhaps work on
reducing that some?

> Tracking blocked state and when it is safe to reclaim a stack is done
> via a series of hooks in the scheduler. The actual reclaim of stacks is
> done asynchronously in a shrinker.
> 
> Once a task's stack has been reclaimed, it cannot be rescheduled until
> its stack is repopulated. Although there can be a repopulation fast path
> within the scheduler, reliably allocating memory to repopulate the stack
> requires a fallback path that defers the repopulation and wakeup to a
> workqueue context that can use GFP_KERNEL.

I am really confused. On the one hand you have John working on proxy
execution, with the aim on reducing latencies, and then here you are,
posting something that will introduce basically unbound latencies.



