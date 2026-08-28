Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9wXHToe1gmitoaVCqOPNDibrRSsPosBSME08usIeV8=; b=gzcFAt9Ct30QWBGTKtJdpMALgW
	rX770ml6ZL0w5D1rSe6LAUekFHcqhlhe6v7vwUzIpME/q1J4qJcPq55/TBYYNrAs2+9v1mGZFVt1i
	AlLTpLVz1RobbwLOAVX4AjE1XdmhADD1mSKbPAGFC7ktrQUkkUOjufIetjcmLS+rRgI8P1G7sRsHv
	7z0K0ioUFOfjG4oEaOYhvcjHNC2ZTsapvnLTdbppxGHCWar4ifS9vZX0Tn+axX4kZ0arpfyV12UuE
	XBqRTJPVi3bW2xLu+ur1f9aW2VZv26MJcQ1/C3jyv3UJMSl1Bn6SGHrh3VO1czzhJs9jlAjRrZnlH
	xWM38btQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvGp-00000005hM1-1hiA;
	Fri, 28 Aug 2026 12:01:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvGn-00000005hLd-2C6k;
	Fri, 28 Aug 2026 12:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R9wXHToe1gmitoaVCqOPNDibrRSsPosBSME08usIeV8=; b=L5TmUoS/h6NcQt7ksRhkKNOjmU
	1mNZG8RevUyyo9OJGFPhIYDs4SNBWCw1yeMvtwBYu45/aGh++P23bSfG4TALzpHf1wZYEOgtjJKu3
	FnuSMmszW1YDYwAM7yMMkYMwQwbu0tIaaTQyt30PKrGtqn+k/2O64P/xn9KhfygUBVqPXI3gK1cuI
	UGvVEVIM+uHmQxG6FgRN57xNt7z4qG6VT2+cGzugYZXmthX9aGYBnTbjGD4JDoaWSsd1tvJ9klC/u
	U5orgAvm9MO/sumxlfI7Mjrku7EtjdWOZc4Jn1Poa1RuzKk7ltmTfO4q8F9/76umByaXI7rn9DEbu
	WjOeNx6w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvGk-0000000Ee7g-2dXG;
	Fri, 28 Aug 2026 12:01:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B423930116A; Fri, 28 Aug 2026 14:01:13 +0200 (CEST)
Date: Fri, 28 Aug 2026 14:01:13 +0200
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
Message-ID: <20260828120113.GM687043@noisy.programming.kicks-ass.net>
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
> @@ -4295,8 +4296,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		if (!ttwu_state_match(p, state, &success))
>  			break;
>  
> -		trace_sched_waking(p);
> -
>  		/*
>  		 * Ensure we load p->on_rq _after_ p->state, otherwise it would
>  		 * be possible to, falsely, observe p->on_rq == 0 and get stuck
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
>  
>  		/*
>  		 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be

Don't move that tracepoint. That's simply lying about how long it takes
to wake up the task.

