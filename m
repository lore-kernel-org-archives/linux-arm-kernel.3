Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062E0CE8D50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YraJbxiFvmefAHX2dX6NJwSfDW3rKX68VlvI+NnjmqQ=; b=KxHcQPat8eGaYsokRtjvbInOH+
	t75Y5euUHzN0WVHIm8IIdsmQKZ0qXFDy66JBKGx+wH0ZhvXaSVqgygaGuSV+i7Hhd8/K44pkpTj46
	T9YXLafvJ7RVXfW22Nw0Al0s1X4dyA6k3FxRlWuRKcVlx8Q3GhqHyzPlvoDqefMXn8Tp415z/8ub7
	LKa4Jsm1RUpSkcqA3+oD9bl83lE/gD+U7P3smD6RxpSx0g4Jno0deoE+4HM4DyOf77+JYxxBHT1Pg
	15/q+77vNjK1AxeHaz0fxp4rmj4h8RCaxvjlc6ndWt2DzeS9JlPxxpf68dJ3jpXRjPBFZNBQt8nyx
	o7qSMxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwUF-0000000Cir7-2JV3;
	Fri, 14 Nov 2025 16:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwU6-0000000CipZ-3GL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9AF36017F;
	Fri, 14 Nov 2025 16:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343EBC4CEFB;
	Fri, 14 Nov 2025 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763137033;
	bh=Px3lKZdUS5rdr+F3zZSev4T8mg958AG9l4kRlO2wCqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EBPYejEzrwCn4Zb5hqGfAGsRuk9RtKOvK6DJboD4IPKftcJOdg4oRRU5uT8NPBLE+
	 OCllQlduZ42OJyJUua2necJE+0YSdMcHbdeLObYCCvkrn/QwTZwzPnKXqb38rWi4fx
	 mw+gUSWQ6/Z3DVBAUUf3g6ei/hgWhfp7oWapApA7/2onlPDePp296sVo1FRqC2qZLi
	 VseGB5u3t8eCfXy0RDuL7FaQz+qNhJB6BR4RzMRRyHWBM8G63G1zF6mSYIYV2yixgW
	 x5bf4nJawh3kaT0tOsY4WlKO02LdPnsxSPRrLeRVJEoXJ4IYeL7vJVSz00VvRSHbOa
	 FVxXdc/8ggRbw==
Date: Fri, 14 Nov 2025 16:17:06 +0000
From: Will Deacon <will@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] tracing/wprobe: Fix to avoid inifinite watchpoint
 exception on arm64
Message-ID: <aRdWAshGkWjgXW3L@willie-the-truck>
References: <176179481538.959775.12326313742393696258.stgit@devnote2>
 <20251104223735.4164f224790ea0aea267dff1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104223735.4164f224790ea0aea267dff1@kernel.org>
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

On Tue, Nov 04, 2025 at 10:37:35PM +0900, Masami Hiramatsu wrote:
> Gently ping.
> 
> There is a bugfix (or strange behavior) on arm64 hw breakpoint but
> to fix it cleanly, it should change the perf itself (but I'm not
> sure why arm64 changes the behavior only for the default overflow
> handlers.) Anyone knows it?

It's because GDB expects to handle the stepping itself when using the
ptrace interface (with a custom overflow handler to deliver SIGTRAP).

Will

