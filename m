Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C173AC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txJxc7ggr3poI2FLO7VfIUDXdgIFyMuKHMC/a4AMXzQ=; b=FRssjop6XsGvV4HTqtV3giiTC5
	M0y3v7B/U/AQDdvdlhQCzWl+zW78ixd5OiDrhrYtH+diXVOfwgEEWiJgZ26HochtPpEE5dQI+g3hx
	luRgK0QtkTNXdkjQmLoIHRW267w5gUy0B4zinIQBY3PO/tDRm5fohu4AmDcrAv8I13oCBsJUJlnjt
	XFgvN1Jhzqu+yw+FDWKYsY1lRrasE5YLtKugRKDBVq8xIbp5YWJfceMNjB0eqi0kZTKlTGp/TIQ/1
	W3gdZmryCUznHNJHFFle5SQSaWJEgribTXXL6bVlTiEyM5GAxZakhBfLp0ctb06wfzoQBCOqaYdZH
	sW4YJmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyDu-000000063xG-1YOM;
	Fri, 28 Aug 2026 15:10:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyDn-000000063u1-3mHq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:10:26 +0000
Date: Fri, 28 Aug 2026 17:10:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787929820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txJxc7ggr3poI2FLO7VfIUDXdgIFyMuKHMC/a4AMXzQ=;
	b=k1yC3/1TSLVucW+G2hOymttYJNyxemcF0Wij24KbbvzrWJWTl2dTj6e6PoI5S0HrfHyPXp
	oI4RGa6W3u5aoEJG/2uXG7Yr1esVzqcii9kIAcVvca2UlTbIgjnuyFklJJzrTKZXRqX+fu
	ejgAg7ZLLzBYuFgz7MtDzaMLtFU/HLtc0BAfv8hKr3HpJsrtlz2g3lJ/Sqlfh3LdKWrn1S
	GTsJ4NmbyXAzkDLkFbgBjQNfoTov42PXv67fjZOSlBNDbwHx3Uq0FYD8NUjYTI3ReNlsL6
	lO/wJgykH2TvEmnn79Xfqs7ZjEmbXcCqXW/IiJFI0ER3lTMAlcw/3g0ZxDwYLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787929820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txJxc7ggr3poI2FLO7VfIUDXdgIFyMuKHMC/a4AMXzQ=;
	b=4BPKwfdrdUNYh8LjOXHLTIAFqeXqMCtM1JBZhaIPoExx/1SClqrf3LjHhwWJfGMIRfuC0h
	PrxrqZaP9E/FVKAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <20260828151018.HnR9xV1N@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260828135947.GU776954@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_081024_089177_94C188FE 
X-CRM114-Status: GOOD (  28.25  )
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

On 2026-08-28 15:59:47 [+0200], Peter Zijlstra wrote:
> > > +
> > > +	  The wakeup latency of tasks with reclaimed stacks may increase,
> > > +	  especially while the system is under memory pressure.
> >=20
> > It says *may* increase and on RT it _definitely_ will increase since
> > there is a kworker involved not to mention the memory allocation itself.
> > Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> > exclude at the very least mlock()ed tasks.
> > Did lockdep see this?
>=20
> It should have. They're taking spinlock inside raw_spinlock and lockdep
> should very much warn about that by default.

Yes. My point was that this was hidden from lockdep.

> > If I understood the whole exercise correct then you have a kernel stack
> > of two pages and in best case you can unmap and release the second page
> > while the task is napping.
>=20
> THREAD_SIZE_ORDER	2
> THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
>=20
> that makes for 4 pages.

Oh. I wasn't aware that we have 16kib stacks these days. But looking
at it we have it now for over 10 years=E2=80=A6 Judging from 6538b8ea886e4
("x86_64: expand kernel stack to 16K") it might be temporary and things
are better now? Arm64 has a different story according to 845ad05ec31e0
("arm64: Change kernel stack size to 16K"). Risc-V also mentions "for
now" in 0cac21b02ba5f ("riscv: use 16KB kernel stack on 64-bit").

I just booted my XFS kvm box and did things and 8KiB works so far.

> > What might be a tad simpler is to memset(,0,) the remaining part of the
> > stack. Since the stack is vmap-ed it should be swapped out on its own
> > without additional tricks. That memset() would help zram to compress
> > better so it uses less memory. ta-da.
>=20
> That would still be a 12k memset with IRQs-disabled and rq->lock held.

Right, because the stack grew a bit. Probably still cheaper compared to
the other things done here ;)

> > What also should be simpler (and I am not saying just to move you away
> > from the scheduler) is to have a shrinker which iterates over all tasks
> > which are marked for reclaim and then similar to swap just unmap both
> > stack pages and release the second page which is not used.
> > Upon wake up the task should create a page_fault which would be used to
> > allocate the second stack page and map the whole stack again.
>=20
> Right, so you can FREEZE the task, unmap its stack and then thaw it or
> something. But there should be a definite opt-out on all this, because
> taking faults on your stack will be horrible.

Definitely. Not something for the currently visible app.

> Not to mention you'll suffer wakeup latencies while frozen.

Right but you would use it under memory pressure and steal the stack
=66rom the most idle tasks rather from everyone.=20

> This all really sounds like what should be addressed is this insane
> number of tasks rather than trying to cope with the consequences of
> that.

Sebastian

