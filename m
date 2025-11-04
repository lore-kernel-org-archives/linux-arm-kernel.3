Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BF0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeNvl6wz3OEn3oRUCdz5nMl2u71butQifW6PQGFdkME=; b=Layc4r6bJ4/D/J0fiAxm05yZ7A
	9aSlUHhuvzo00Xbg+p1HFuChAN5SQihxsmTK2nI6rOmCXs7QZAARj/6ufsnwupc755zo2TRHbzCYh
	xtfLdGRXgHEwW2hp7PBRL88RcqG9vVcQ7w1lNHDkPq6GcwYPpAL/Tez4S/DwAbDI/0JC2ZM0geNhi
	/w9KNbu2MsfgeLtAYXi6g0tVfi9cO89tmBW5Ao8zcQAJsnk49wKQkzxy2L1uWd95cmwYg+0kvn303
	1DAd1Rclsf40jhD/pZ5X23FsgEGh4CRGDuL2cz1WfowH08JZU/vSWaR+AfvDTL2pOZuao/mm+rGqc
	7wP2w6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHEI-0000000BtQm-0HQ9;
	Tue, 04 Nov 2025 13:37:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHEF-0000000BtQ8-1sSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E630C438FA;
	Tue,  4 Nov 2025 13:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FB0C4CEF7;
	Tue,  4 Nov 2025 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762263461;
	bh=kW/ssnpFqsyUGVSW+ike0uQYSm2DE4pa7UTDsdKBjsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MoAZWgcdVfAiKGcImcD9LaLKF/jODEq4BpZLVVjxmTyMzJYQoHekfdrzqPDexT/kz
	 SINX5UNQfnuV10UlpeRkELACz3eBqcW26FdLPGKgSzMEpqCUIPn44jBlxef8YsIx0S
	 JOf1dhtBWvuZADG4ioasi8YQmVOHse0RQPRRRDqsyihs5zhgO+OFdwSU22kCur6hcr
	 RzC7VoPGTFvifLua0W8BJ6uAFh+1RR9/zkxGdd9iZ3mtnrTr14i0Sp0YwdYDuQPxsc
	 OIWMuySlXsUpKE23viueJZ0lKTpvpp7GHRi9vq/8cbGEJ7s8E3AQGOqJhEE+bmTD5t
	 uePtyfGV+h1Xg==
Date: Tue, 4 Nov 2025 22:37:35 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] tracing/wprobe: Fix to avoid inifinite watchpoint
 exception on arm64
Message-Id: <20251104223735.4164f224790ea0aea267dff1@kernel.org>
In-Reply-To: <176179481538.959775.12326313742393696258.stgit@devnote2>
References: <176179481538.959775.12326313742393696258.stgit@devnote2>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_053743_508122_F0E2967F 
X-CRM114-Status: GOOD (  19.75  )
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

Gently ping.

There is a bugfix (or strange behavior) on arm64 hw breakpoint but
to fix it cleanly, it should change the perf itself (but I'm not
sure why arm64 changes the behavior only for the default overflow
handlers.) Anyone knows it?

Thank you,

On Thu, 30 Oct 2025 12:26:55 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> Hi,
> 
> Here are patches which fixes a wprobe bug reported by Mark Brown on
> arm64[1]. The root cause was that the infinite watchpoint exception on
> the same instruction, because arm64 watchpoint exception happens before
> the memory access has done, it needs to configure a single-step after
> calling overflow handler. It does that only for the default overflow
> handlers, and not for custom overflow handler registered via
> hw_breakpoint interface.
> 
> [1] https://lore.kernel.org/all/aPvwGhMBJqMKcC9D@finisterre.sirena.org.uk/
> 
> To fix this issue, this series introduces default_overflow_compatible
> flag in the perf_event and use it for identifying default overflow
> handlers instead of checking handler functions everytime[1/2], and
> set it in wprobe[2/2].
> 
> Thank you,
> 
> ---
> 
> Masami Hiramatsu (Google) (2):
>       perf: Introduce default_overflow_compatible flag
>       tracing: wprobe: Make wprobe_handler default overflow_handler compatible
> 
> 
>  include/linux/perf_event.h  |    9 ++-------
>  kernel/events/core.c        |    2 ++
>  kernel/trace/trace_wprobe.c |    7 +++++++
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

