Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE778C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bbLn43OEfzJk6RijiG0hY9eLwY+qM7uVXluXMN+YSs=; b=3K7umT74E8GIiDGf4OMeQJKQt1
	yGMj+ZiXnYxiiGBcQOdyx/REkOaTn+cWxfpbS+RxfKLrkHZYLYGLMO2W+WVbpYFteOBvQuyCs0o8H
	R1LKicClZmPuVF9f6sftFAmgRB/MsqbBSpM95YqXEpECBtRsOge3om1MOSuPJTi6VaTggv5dCmu7G
	LX0DLL9LnEySuTu7laeL3fAvK/LtaP+4FY5w12f2I3qzICR0dqECUm1iBHnRCuAGofM1DvP28ncmz
	Dq8DzVsG+kMdTuZvIP5hGdV2GzObFaWDmx5fNlfA/hB/UIUj8j0iR7KOLk8QnDfgWXvAEYX0ni47W
	oNR4UxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wZB-00000008jwg-43PO;
	Mon, 31 Aug 2026 07:36:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wZ5-00000008jvR-2YXU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:36:29 +0000
Date: Mon, 31 Aug 2026 09:36:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788161781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0bbLn43OEfzJk6RijiG0hY9eLwY+qM7uVXluXMN+YSs=;
	b=nq4JVzso6agIIEJPtT+hA2jj6xB08NNe45cLx3b3da5REQJup3Vb5gX/bgy+epwACYFOwh
	4dmrOIEwuY26RvfhCQapR4BZRlTBYX8V9rIvVQdNqVZtO9KcX8cY2gPUAvu7eG1IUk4zWI
	iGQf6n/EHr3gsDVe8aj2pFL/0A65eG2jbRDrih1dS473/GiZE0uyEJDNlC2egaMTnbXRGM
	I0XJQ4EsLkyrO58e8EV7+vj7II5p+fmDJfFCHdFbMJyuZD3zYw5jR1Vz6jk6oExsjbzlZX
	KRTFOrv9cQRhCIMu5h9rUFqvjPoLMdr2d2IYVQJDRkrwgFk+D6SvmF+ajLcFWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788161781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0bbLn43OEfzJk6RijiG0hY9eLwY+qM7uVXluXMN+YSs=;
	b=pk91fDTwvh9wOOk+diFwBjcIFfkAtuIAvaITJVIRjHrxu/tDM8ZpStQUYGvAopCfp7Lifw
	XzuXrIPEv7O0J2AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	David Stevens <stevensd@google.com>,
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
Message-ID: <20260831073619.Ssq-wt7s@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <CAOiLmNHrbXeTY7zoNodmaZUoMWf+NgvGvZ_LjfWD-1sKAoiLeQ@mail.gmail.com>
 <20260829084901.GA776954@noisy.programming.kicks-ass.net>
 <apLxcg3Lgy0-nXA4@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apLxcg3Lgy0-nXA4@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_003628_127632_FAFAE30E 
X-CRM114-Status: GOOD (  13.94  )
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

On 2026-08-29 15:49:22 [+0100], Matthew Wilcox wrote:
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

no, you shouldn't do mutex_trylock() in IRQ. There was something, I
don't remember but that is the reason people use semaphores because it
is okay to do down_trylock() in IRQ. It might be unlock path. 

Sebastian

