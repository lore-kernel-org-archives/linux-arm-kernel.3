Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7788C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlHsLIomUZDuyupnnAtNJaCHYl4a5Rg7e9MyiEzSdUU=; b=wFNn2rX7RrYEPGB1hD4I4oJL8w
	Sp4KFFYp88IkLLTO0PtsOaC2em1ZN7earMItEbfFmvZD+yH3EyNSzGitmBgcHT72Mi73QoQ3xdkiq
	Ve1ZKqABQTS5fLMAwKkTFcYKdNVjoycQ92+VK+1JlQx+ilY0FMau9j/CauISAz9i4IExvkHNrP/FA
	+9jDyklcOy4DGlJAFbMeNyy4PbAcj5ka3VbJKc9kuTKijvRa4VP54efo8zK0ubIWFAnH6LeJ0Ibvv
	OPEuB5ueywe5xBLEiMjamLFDBIxyxpaiYeEbAtQDL5q7VB6+hf0QpaSM7am9bRVvqGFL6wqZD/Tu0
	+SpgQnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w7K-00000008gQR-23C2;
	Mon, 31 Aug 2026 07:07:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0w7J-00000008gPw-1CpM;
	Mon, 31 Aug 2026 07:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rlHsLIomUZDuyupnnAtNJaCHYl4a5Rg7e9MyiEzSdUU=; b=a67/WBXciwwfTXKyxpcVqnkgrD
	AlJwjFjl6pELrCGWf+akgeocN9/XKhybGbgvTSS9Zx5nrvlXfgo2SBaz14PrrOZPS2VukRTfhD/q6
	Jfr/OkRBqX0gkCPkMqhchghylTHtfrNvF52sQ+iAYXZbgLQaIpyZ/xgqDRNwxVXvgKMeQfd8kuRAF
	A8SN9TtFhnhAFtadO1lcrnkSC0ny7YBwnc8+GDgsWrgg06hTDeGotwS9qoQdZKgI50gJWin2KZt6a
	+qD2ksvaqTbKHuXTK4U/3I7+FKvGqy6LrTtZznalbKweNDNmLTET1K6dItlPFsOZHxPKP0vvF9ZXo
	iSIhEE9A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x0w7E-00000009b4c-0xtJ;
	Mon, 31 Aug 2026 07:07:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 26E203002D8; Mon, 31 Aug 2026 09:07:33 +0200 (CEST)
Date: Mon, 31 Aug 2026 09:07:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <20260831070733.GS687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <20260828151018.HnR9xV1N@linutronix.de>
 <20260828150836.2d5b378c@gandalf.local.home>
 <20260828151313.5c4a5e4b@gandalf.local.home>
 <20260828151747.20035d50@gandalf.local.home>
 <20260831065509.qqEtERDB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831065509.qqEtERDB@linutronix.de>
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

On Mon, Aug 31, 2026 at 08:55:09AM +0200, Sebastian Andrzej Siewior wrote:
> (stack tracer running)
>         Depth    Size   Location    (60 entries)
>         -----    ----   --------
>   0)     8176      48   __css_rstat_updated+0x9/0x150
>   1)     8128       8   __cgroup_account_cputime+0x2f/0x50
>   2)     8120      48   update_se+0x10c/0x1b0
>   3)     8072      48   update_curr+0x31/0x180
>   4)     8024      56   put_prev_entity+0x153/0x1f0
>   5)     7968     136   pick_next_task_fair+0x684/0x8e0
>   6)     7832     120   __schedule+0x1ca/0x1130
>   7)     7712       8   preempt_schedule_irq+0x38/0x60
>   8)     7704      72   irqentry_exit+0x148/0x6b0
>   9)     7632     136   asm_sysvec_apic_timer_interrupt+0x1a/0x20
>  10)     7496     240   HUF_compress1X_usingCTable_internal_bmi2+0x12d2/0x1c40

> 
> Does this stack tracer distinguish between the kernel-stack and
> IRQ-stack? I would expect asm_sysvec_apic_timer_interrupt() on the
> IRQ-stack and not adding weight to the kernel stack.

This is the return from interrupt path, irqentry_exit() is right after
we switch back from the IRQ stack and are back on the task stack. We
have to be, in order to schedule the task and all that.

