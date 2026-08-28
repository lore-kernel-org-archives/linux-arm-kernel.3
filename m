Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABBCC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=; b=sVaqfkzUBKNeMjwL9MrLvMeNBE
	vNGJlUMSYqquvLxVv3+pNvZJRwDK5QQRtPsevtHE9sSuTat+319jHf/8YTUV7Kz9D4/HpGjeAiicv
	b18bF1hCMN9SuUNtGL88n9y5qMoqgdWDr2X3en3X1kZp3aqByU/1a38Th40gE9EXsc+qyo2v7hxEp
	md38sxFgzYMclGiRWFA86SlHnf0XHnuIfTWi4Ft6Ufe27VWZUiEXILR3wZp1WXgBpUIBtP7oEEDp1
	AIuvOukzDAewFO3pRDiZwgsTfbD+AEFQTw5HuWnLIVHWT1wZ4TWNGVtYcx7BEtjuUEKcVlLqKcSmS
	OeGEJpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03xg-00000006RGh-1vwf;
	Fri, 28 Aug 2026 21:18:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03xe-00000006RGH-0KMZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 21:18:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso2284e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 14:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787951884; cv=none;
        d=google.com; s=arc-20260327;
        b=A1lNimPq0iQQUBpQSzZ7gOWXJOl3yJUt8N2nrwpVsjatlcHPM1pfO2XN/oj9lBIZbA
         x7A+ACi/9dxEMLnI6Kqc+e5PMtkUar80zQ7w9ljlReOTgP1HwPvN1+6/+V3ehKFJ1meS
         THuidqRoiUeP1ZR4FEv5kNJU5+EyeHl+L5h1GnKRrc4MARxw1ZK/tiI/Vz02Tcqbk3xE
         PrOLMCo4PDMejx5z83OUNvQYImYo+z75+C+K++TmEXx0gpfqtNWp6UbLfBsBlSjVWSRK
         otWiskujTSehWBYof6wvZmpDPM3f+hlPf5TiqfX+frGIrv81Vv14+9NeVykSng9fxg3C
         8ZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        fh=6KVoe7wYlNqs1fC3ZZAg47Ak/pVCDzMsS23+Jeb+UK0=;
        b=bLU/Km5YsRfpRlK0DuQBY4j8mGuJ1IC+AmAspycgc+2Z4GvMrQn07jEs6qhb0r/UeA
         u7mZdmcANSHiC0XT4GQjKsKKt1CPbYaOLArz5+uqVW3rDlXfGj5mAjk2ZAc3UkRTHtNE
         tRSZ5Q1u2vMkKHtkvZzEUFc4+7F7Cw5jgdmujxSZAje7jj7WDGiW8tmEhJtJT2VOAWpk
         +cknukJVQiIb5ffZ9YlXMfre0qj10Izd7Dpi8JugEm6bbx2gKRIA7OUUTwu2W426sipL
         gmsZf9xhPb/N72fS9EETB9/qnG9734B/ZKWh6yxsY5t/42GQ/8lRoE5QtnCo+3lh2Hji
         bN8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787951884; x=1788556684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        b=e4NG918jFkzH8PSxumTf9fElXon/MmgTsypPYiMtjplgv1xN4jKqiczC6NN+DZvK/d
         IiYG2IzzvMYYE9g80AzKQ7/uPHwpyb17Q5Am2wNzCD4y/cDmAab2NvD4uUyqEDBjgslg
         7rd+Z9cxTwAPNP1V/MWjhf/p43tjJpYg8+EE5RVqOGmnHZaQoGirLXKAyTXClWHFFBPF
         1WAz2EgC9+OC1gFH+WskhCv1+mii/OOOcUNBAvpL8RNb8mpPAHF9aaXhzfww+AGm3kFZ
         UFl3lwhLQ+QiOIlogb93e8mF9V0z5EnH7AfejCsNhfO7esaX23fLhfZreXMyLb6tBGkp
         m50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787951884; x=1788556684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ox47LSGNLn4iYQakTpAdrm+z1IZQvt0QyHLEVX+5st8=;
        b=Uw+CxZU4wvqqoXSqeLDHZ2vYBVKxohgIKprWxLkSMR+ckYNNP7YzZ+DozqE4NjRAw7
         RDTvazOvyKioSpElc/cnIJLfS7OG7tQq3rKr3hjK55Am9YJltMvOxhfP44aRJyql/6cp
         q169xJga2NAIizF1eS71QHjVpZOGU/DuswG5K3eDFgqOi45WrGnJz7xiYVOFlhMCvVZX
         lcC4xVcsVkGiGaJFvs5iL7BSY92Frebmme65r6SAgIAAeHBFwFP2cexk6kCSZvGgsARM
         mS3BTswPQw6joyr10ztETqKBZ8xozyDJZDukpcA24hDrgo7MDjbXQF4r8yBJs7WApBWI
         FXPw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg96OlybQSbVXolb8biahopJ8upQLjWubUe1VUneJxLSvucRXudovE3ohoyOQYX9u89m/q4Nege4CfvB2XyLTz@lists.infradead.org
X-Gm-Message-State: AFuF++mQ+42EzeHIjMhsMXwUVH/hNkWIzzwKrvsSi+ZO8ijxtEain6WD
	qEGOJRrfFyJ/E9qUgjlpQRD8cYG1qkV3HpZdBNFU6SDsjnT+Jkr5PrEys3kXVy4uvJasrlrYTpX
	8KJZ6z52QV2e36sqnG/E7K2ePiVI2gleixzCo/jR3
X-Gm-Gg: AR+sD10UwOOkJm0fM26pHkdvUaViHSv0zYx25uThCCVv458tMY9HHwJJBuE5yIKTSCg
	CubXpsH3Q40/TjU+EyU2xAMRVBADMmxogi6TKoZwgXxezzWfQX6mVGszyYp1z4wv/ngAPOVUr4h
	LYaMjawpUuakdrEhV/PXBKGkWtDn4v7JF7TwpgLLRLT5zrIhTQ1OqQ6cfpidVK/JVD1FMWytG/e
	3Z/hf5kDxYJQbVBYl/55zJBE508kg8CL3v79prPDk8oZGf4GIQ1fJfqMQb4TQZUOWeUzYFb4FzL
	sng0S8kLplkl9o9oL3hJ7I8eqRnZ2XoZlGoN65EAG1jcC3J+aqa6zalM1OGMatT1lR/2JtqkquB
	W
X-Received: by 2002:a05:6512:1594:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b5ef2283a7mr31129e87.7.1787951883225; Fri, 28 Aug 2026
 14:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
In-Reply-To: <20260828133620._x2XfJR_@linutronix.de>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 14:17:49 -0700
X-Gm-Features: AcwNN1XPwhnUNeipFck3Fo-JT824naG0Joeg5blGOWBTdqacwVpK3ww48maahZk
Message-ID: <CAOiLmNHK5Hw55omycg_EAHzi=g1iqJn1NTap1Mt98im3xTXcvA@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_141806_178649_5104F952 
X-CRM114-Status: GOOD (  33.86  )
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

On Fri, Aug 28, 2026 at 6:36=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index fa7507ac8e13..adb4a5957996 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1534,6 +1534,24 @@ config VMAP_STACK
> >         backing virtual mappings with real shadow memory, and KASAN_VMA=
LLOC
> >         must be enabled.
> >
> > +config HAVE_ARCH_RECLAIMABLE_STACK
> > +     def_bool n
> > +
> > +config RECLAIMABLE_STACK
> > +     default !PREEMPT_RT && !PROC_KCORE
>
> This shouldn't default like this for RT. It either is useable or it is
> not.
>
> > +     bool "Allow stacks of some blocked threads to be reclaimed"
> > +     depends on VMAP_STACK && !STACK_GROWSUP
> > +     depends on HAVE_ARCH_RECLAIMABLE_STACK
> > +     depends on !DEBUG_STACK_USAGE
> > +     depends on !KASAN_VMALLOC # TODO: add support for this
> > +     depends on !DEBUG_KMEMLEAK # TODO: add support for this
> > +     help
> > +       Enable this to allow the unused portion of kernel stacks of mos=
t
> > +       blocked tasks to be reclaimed.
> > +
> > +       The wakeup latency of tasks with reclaimed stacks may increase,
> > +       especially while the system is under memory pressure.
>
> It says *may* increase and on RT it _definitely_ will increase since
> there is a kworker involved not to mention the memory allocation itself.

You're correct that this phrasing is wrong. A more accurate way to say
it might be: "Under memory pressure, tasks that are not scheduled for
extended periods may have their stacks reclaimed. Such tasks will
experience increased wakeup latency."

> Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> exclude at the very least mlock()ed tasks.

Disabling kernel stack reclaim for mlockall() tasks definitely makes sense.

> Did lockdep see this?

What are you referring to by "this"? I did stress testing with lockdep
enabled and didn't see any errors, although I will admit the bulk of
that stress testing was !PREEMPT_RT.

> If I understood the whole exercise correct then you have a kernel stack
> of two pages and in best case you can unmap and release the second page
> while the task is napping.
>
> What might be a tad simpler is to memset(,0,) the remaining part of the
> stack. Since the stack is vmap-ed it should be swapped out on its own
> without additional tricks. That memset() would help zram to compress
> better so it uses less memory. ta-da.
>
> What also should be simpler (and I am not saying just to move you away
> from the scheduler) is to have a shrinker which iterates over all tasks
> which are marked for reclaim and then similar to swap just unmap both
> stack pages and release the second page which is not used.
> Upon wake up the task should create a page_fault which would be used to
> allocate the second stack page and map the whole stack again.
>
> This sounds simpler.

There is no swap for kernel memory, only user memory. I did contribute
to some previous work that aimed to only only prepopulate one page of
each kernel stack and then to dynamically fault in further pages as
needed [1], but handling that architecturally and guaranteeing that
memory is available when needed is difficult. Full-on swap to zram
within the kernel would complicate pre-allocating pages for kernel
stack faults further, since you could start getting inter-thread
kernel stack faults due to blocked tasks putting pointers to their
stacks into waitqueues and similar structures.

[1] https://lore.kernel.org/linux-mm/20260424191456.2679717-1-stevensd@goog=
le.com/#r

