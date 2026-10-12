Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98969CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeExXDFsSsDXoVieXWwNbhti6P2jB2qH9KovDmOCgIU=; b=RqEXtozAroR2lKeV0IxhicE347
	/M95Bm5GWZYIRjpv1GWbVBdKf5WJwoJIcfYbWrO3Jb/8zZ2JxkxG3LiXb7bduNx1ARg95FXF85hlL
	S2BVUT4Hhno/40ZPqHd5m3H15bmh/3sWm7Nq5rHwqf54UBlnOiznuKOEqWKzZ6umJGKcTGTomdWTK
	LZsB94KEcBb34IBSARU0PD2muu6Kg0pTrRBWpmghy2dttvWvOifG+s0V0PAaOit0SWB03qSb4koRo
	wewKxMhT90gIXAHkpdZeOvYvHwXxDXwti9XEtqK6BqFQYyzgUxobuPcto42uId/pLOFwSiUHL8Ynu
	pYBh+V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAG-0000000AClD-0swF;
	Mon, 12 Oct 2026 10:21:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAB-0000000ACgy-3LUo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:21:49 +0000
Date: Mon, 12 Oct 2026 12:21:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791800504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeExXDFsSsDXoVieXWwNbhti6P2jB2qH9KovDmOCgIU=;
	b=EPf2wkUnii4Bo6dKs624vNS73b09GrSNLdGYyDpW8TTFlt+I3vg50rqcK66Z+B0Xqvsg7/
	rtm8ja4Pn/az0KHpP7T9zLU+Y1Lk+fdeTdyU0Blb0xk1SL0X6sl6bMsZm6SPg32//uiczM
	2CQg/3IwPk/xTwLdgikv+XBgQJSx8turDYA0O/EpAq6jixkW+MM9SuoJ7TbYbISzWRmpdW
	LmNm17RXcwDrrwi7lzDd3yOLPA2Qj+Th7k9yRza/vNswvrADCYTCZS3bnsmgIvu7wKx1hF
	3zEGZt50Fza13LP08QkyAi+NsyYqJQAq5BOHY4j2c7P+vcDJwP6J7ZmdP+A9lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791800504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HeExXDFsSsDXoVieXWwNbhti6P2jB2qH9KovDmOCgIU=;
	b=ROIpfpfCZfohTWgaJ0XyH+2DOhlGL3FnkcnWoK1JRg6wmtUiJxJd4vKQozbPb15q0KBOpJ
	p8kkqcZa0DX1EeBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Clark Williams <clrkwllms@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH v4] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP
 notification to task_work()
Message-ID: <20261012102143.lpVrHb9R@linutronix.de>
References: <20261012090431.TF3iVDsk@linutronix.de>
 <CAAhV-H4=nnhbJS4srmt7dNdgpkEZ8_RQ5Z+0baYMiXF1UrJ3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAhV-H4=nnhbJS4srmt7dNdgpkEZ8_RQ5Z+0baYMiXF1UrJ3KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032148_036471_4D1127AC 
X-CRM114-Status: GOOD (  12.55  )
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

On 2026-10-12 18:15:51 [+0800], Huacai Chen wrote:
> Hi, Sebastian,
Hi Huacai,

> > diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
> > index db199d653dd1a..91e8d80220c54 100644
> > --- a/include/linux/hw_breakpoint.h
> > +++ b/include/linux/hw_breakpoint.h
> > @@ -85,6 +85,9 @@ extern int register_perf_hw_breakpoint(struct perf_event *bp);
> >  extern void unregister_hw_breakpoint(struct perf_event *bp);
> >  extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
> >  extern bool hw_breakpoint_is_used(void);
> > +extern void perf_arch_hwbp_send_sig(struct perf_event *bp);
> > +extern void perf_hwbp_notify(struct perf_event *bp, struct perf_sample_data *data,
> > +                            struct pt_regs *regs);
> Maybe this declaration can be put in one line because there is no 80
> characters limit now.

We don't save much, do we? It looks more readable. Maybe if the perf
maintainer requests it. Looks like waste to repost it just for that.

Any comments on the looong bits?

> Huacai

Sebastian

