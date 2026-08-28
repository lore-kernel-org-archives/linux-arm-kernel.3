Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E1C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StE6yv7xm+286I4g7RWcb83gyYNv11/og1VLCuJGGrg=; b=od6h0cwB8UdXjgEY4rQLMKpkTt
	5GzGwPfEP6y1g3zq67+wQ2uzENKaAWGYhHdRewulBrzaiSPsqDslebFHNoT/7AzV0llR3LJaKNgzi
	OIuoghwLlnGEKRFpLNbmpLwnVJENjL8IhxJ0aEAXUAjcQMTlv/gYt+5O6b7odiifWGaDXqaJwHZLy
	dvliOJA2W3mkMBYk3NzhUuIYZuVjy0Ahin+iQ/6nUc5jRuzqQQXnw5Z9DtGALCJLwyRQkZK5Uq5JD
	4jDG4BzcwDeh5xaP+KAUFRxH4m1FmHksk/b81y7Oj49ZeB2YUGqWiN+pFmnGQV/aVLIyGKPLMoaPJ
	cA96R1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvJb-00000005hZe-36Yf;
	Fri, 28 Aug 2026 12:04:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvJa-00000005hZE-1Mhf;
	Fri, 28 Aug 2026 12:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=StE6yv7xm+286I4g7RWcb83gyYNv11/og1VLCuJGGrg=; b=g+U/AXhX8u1eDgBpqdk1xR7ga/
	Kt2hts3Z9eGty/byZBIGMnrQhk/z73YD7BnlLXJwvr6ynDNUvl0iUhKu+cG2shbEd3kuLi992Vcro
	vmMiuuboTD5xG7X9MClGy68OxbgmVZxEfM4tAgWp1DY+SGyMeUPMCpfN8bw9sC57YlIi3JTqGiFh0
	hUOoveqNeQM+T12KwEUktnDJFQ4VMR3Wl6HGEQ0el6HwnDTxlhplPqU0nH0qLgaMIoFPXlLLWNOEy
	xxvq5k4GVM+EAGtMijScxqO2e+VjpG5pl9SoXYrzoimnOXM4XI/KPJcx4fglBC4lXtT0B/Y+oGdS8
	GioRT/cA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvJY-0000000EeNr-2cYx;
	Fri, 28 Aug 2026 12:04:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2AC2230030F; Fri, 28 Aug 2026 14:04:08 +0200 (CEST)
Date: Fri, 28 Aug 2026 14:04:08 +0200
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
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260828120408.GN687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827232948.2520558-7-stevensd@google.com>
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

On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> @@ -4320,8 +4319,18 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		 * A similar smp_rmb() lives in __task_needs_rq_lock().
>  		 */
>  		smp_rmb();
> -		if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
> +		if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags)) {
> +			trace_sched_waking(p);
> +			break;
> +		}
> +
> +		if (!ensure_stack_is_present(p, &need_deferred_repopulate)) {
> +			WRITE_ONCE(p->__state, TASK_STACK_RECLAIM);
> +			do_deferred_repopulate_wake = need_deferred_repopulate;
>  			break;
> +		}
> +
> +		trace_sched_waking(p);

Absolutely not; ensure_stack_is_present() must not call
repopulate_stack() while holding ->pi_lock. Not happening.


