Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9534C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2R0OExeXoLUYFz9ysgWw29sTN/8ZU4lxybQbrXgrZA=; b=Mlyf0ughTm3TguPHnFEAEVsPct
	dMH8YSU1L51BcFyeKuKmZWn8U+jr2aCclb0orcTmG3xJIeKMVTyx1B4AoEx561NcI0SigOUiQiTW4
	Ocxckx7jjhZ807+CNZ205JL5NX0uW9Fv3U8H2rNfb++J+KemyYwMnlRj8pE2hkr5sWfmznOnqK1gq
	un2W0+Poh3oJSTW5Q8gysKEh294uqyUe4bYw1fDOZ8Uoxpjw3sRf7oOyKnDTFEmk17ez4x924YZ6q
	gLR4NPj1r7GsDZ4IekbDFZ2efsjgTsONYN/973qm7gIhZ702era6lA5UHitz6s2zqfhbVc95aaVBq
	t3DjVsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwkv-00000005ptl-0h11;
	Fri, 28 Aug 2026 13:36:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwks-00000005pt9-00CQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:36:27 +0000
Date: Fri, 28 Aug 2026 15:36:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787924182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2R0OExeXoLUYFz9ysgWw29sTN/8ZU4lxybQbrXgrZA=;
	b=zHr5gm9uJuQjJaXQweR/D4yoAZIHaeIlhRtOxuM7xYfNDxomg3PvGnrXsvi2LhBnduI+1g
	Puj4mPxNDqKrow+lXe6p/m3FfqH9dks62FzRj9uE3ArSrxKZAlAbg5DieZzD7TQx8wiUsz
	VtKSbVgIxqyr1NYWJjwiN/amwniaCzF8b89m/0RJVhEYiqEs/qLTtZWlAm2UFTPLlSfvMh
	Oahq3izuqq6VGWa8c7D+ctlV6AAmyH1bitLxM9g22/pYE02kVc6BHdBx2uKwXHd4GjJH7w
	saOSvYbOSReT1k23eIS23OM/bq1Ww4og3bFMIgkMrDxpfZFTEuaA0K2KW2tr+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787924182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2R0OExeXoLUYFz9ysgWw29sTN/8ZU4lxybQbrXgrZA=;
	b=2slVRRU98UPacC+TgkLGX3+5I6jfQVk3efEXBJ5yWyG54KCToYRd3d3ZEA1xWi1HMwwKEu
	Qn6vvf+pLEb51rDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20260828133620._x2XfJR_@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827232948.2520558-7-stevensd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_063626_435034_31BCA382 
X-CRM114-Status: GOOD (  19.78  )
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

On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fa7507ac8e13..adb4a5957996 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1534,6 +1534,24 @@ config VMAP_STACK
>  	  backing virtual mappings with real shadow memory, and KASAN_VMALLOC
>  	  must be enabled.
>  
> +config HAVE_ARCH_RECLAIMABLE_STACK
> +	def_bool n
> +
> +config RECLAIMABLE_STACK
> +	default !PREEMPT_RT && !PROC_KCORE

This shouldn't default like this for RT. It either is useable or it is
not.

> +	bool "Allow stacks of some blocked threads to be reclaimed"
> +	depends on VMAP_STACK && !STACK_GROWSUP
> +	depends on HAVE_ARCH_RECLAIMABLE_STACK
> +	depends on !DEBUG_STACK_USAGE
> +	depends on !KASAN_VMALLOC # TODO: add support for this
> +	depends on !DEBUG_KMEMLEAK # TODO: add support for this
> +	help
> +	  Enable this to allow the unused portion of kernel stacks of most
> +	  blocked tasks to be reclaimed.
> +
> +	  The wakeup latency of tasks with reclaimed stacks may increase,
> +	  especially while the system is under memory pressure.

It says *may* increase and on RT it _definitely_ will increase since
there is a kworker involved not to mention the memory allocation itself.
Anyway. This either needs to stay away from PREEMPT_RT or find a way to
exclude at the very least mlock()ed tasks.
Did lockdep see this?

If I understood the whole exercise correct then you have a kernel stack
of two pages and in best case you can unmap and release the second page
while the task is napping.

What might be a tad simpler is to memset(,0,) the remaining part of the
stack. Since the stack is vmap-ed it should be swapped out on its own
without additional tricks. That memset() would help zram to compress
better so it uses less memory. ta-da.

What also should be simpler (and I am not saying just to move you away
from the scheduler) is to have a shrinker which iterates over all tasks
which are marked for reclaim and then similar to swap just unmap both
stack pages and release the second page which is not used.
Upon wake up the task should create a page_fault which would be used to
allocate the second stack page and map the whole stack again.

This sounds simpler.

Sebastian

