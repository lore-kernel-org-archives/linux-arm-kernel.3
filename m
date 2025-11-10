Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818BCCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui6c9sDU4Xjl521hdn4D+HAAkgKIV4EpgnYw7ivvhlA=; b=s24S1cOJYRSzEo30bUBLrTm4Ne
	zpGHL66SDhFkjOo8KQgDj7J0l1/1oYTu1T7UzPiT1WwYmw9iOxz9msnRySqQXvzHPEhRK2NGbc197
	WxpFN3UfEpiq2SPY1n9NSeFhigbqjlmlGxqDwod2sJ3KQn9lT/eh4dDoJzpRx4I44cB8n938IeNHt
	RO5/QN9NeXJa5WGzB64/37WrRcs5wcwwEa858/RsfHq+btHfVzaEFwyt2wPlN69uLHoMpIDKKU4SD
	X0r2cpYbjNstTkW02zROr/TPzQZa79x6f7/JMQirljsnyKEzzcxVZ1KNSupmYmPYMB5hAQBQEue54
	6cKyvbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJzR-00000004kKb-2lOf;
	Mon, 10 Nov 2025 04:58:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJzN-00000004kJH-32eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 04:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84C7360008;
	Mon, 10 Nov 2025 04:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E88C4CEF5;
	Mon, 10 Nov 2025 04:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762750728;
	bh=nphcQOI1kfRbhu/YEFcCiq+ww3xH/5WIF7mQO+nNk/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mpeSBHUrB/nAOomS9Mm987ApUXi1jovyAG4bwh99uEGzMB114QdOPyCRJQ9fuRbiy
	 UbseNPen+CZyVShhms1MusQb73Tc3A1nNEtM0OqILMCVf0yx1zrsFwPYjIbKdvLMZd
	 OkyB5VhJ1H55wWqlrAg7KcJELMO5u2v1DWbz26ILez61BWbKSmoqcaSGAg4YE5rPxS
	 dHN0ZRmTThIuJ0cqZdxKsqG31LUYoUn6xR6Zb/wvxwiQngoWFlaKblpcwOG6wh4vwn
	 Cf/7Qmi5D2h15g5XLyO0/gMlmPJOS7JKVtZJgfObUE+uF/8nGAtTwf4+LUjCDsYdaf
	 Jqps5kxDE7Zsw==
Date: Mon, 10 Nov 2025 13:58:44 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Kyle Huey
 <khuey@kylehuey.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Will
 Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [PATCH 0/2] tracing/wprobe: Fix to avoid inifinite watchpoint
 exception on arm64
Message-Id: <20251110135844.1c205d59be44d76169fc5e54@kernel.org>
In-Reply-To: <176179481538.959775.12326313742393696258.stgit@devnote2>
References: <176179481538.959775.12326313742393696258.stgit@devnote2>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Ingo, Will, Ping?

I also found that Kyle made a change on this area recently.

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

