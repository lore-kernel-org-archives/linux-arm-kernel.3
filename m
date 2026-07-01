Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149E6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNkJszifhKgsSezlW4/esiesLs+zqM8RUBr857pL8GQ=; b=XBxxp/x7aqkz2C
	oQLg7ba4Wz2Bmihcp96QbPwgwU6bxuWwd0Kejf/a90UgJSl5XIpUL7phtIuVvU1WdEcBiN1pVluoQ
	ybPYNiJuZhUTnC8NF9ftf4Du+8ZZljj6bMoDUQMYGkf+N5URhRSTWeLFD4uaIwZfAvdq2hQtXz4C8
	xkksAWarWlwfbphuHyG2Sv5fO+3AQMTTkImbETzSinhtHUtbSQpWgpGvrh9towosp5Jn+1kza1C9k
	elInnid+nqc4h+fTeQGrFX0CCQsGkmBbZ/BvA7dUCH1f7bgk6i/Yb1p6LUWGsPOUniyEvUBP/Yi2x
	u2ikaEuP4PismA15Ht7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevEH-00000002Ceh-21My;
	Wed, 01 Jul 2026 13:43:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevEG-00000002CeT-1l4t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71A9260122;
	Wed,  1 Jul 2026 13:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243751F000E9;
	Wed,  1 Jul 2026 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913430;
	bh=VNkJszifhKgsSezlW4/esiesLs+zqM8RUBr857pL8GQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cGzX4siZIUtycMFZon6aJ5LtvjxT4GuGWBSlVT6YvDkXUNhV7BCSoRUh1lM9JGuyJ
	 NH/5heNyhlZxohPM59DtftljlXMIjldWm63pLzus+N5EELFUX56g32OubETdTRrZE0
	 DkN9xIurQjq/ZL6GGetl2EmfsYRNo3U2onslufiZqHX29g5IAMwnffjpe17IZSHVje
	 1PiutciaCW5qrJ9dESiK8MvaY98lfhM6GrynLEhYAE5X79tdkncuvoxsrJpxwjIdcy
	 c3LjT/APSyohfFhXpO0dGySUtl3RyP5u5s5wromgRzImY8YitQX3VwxB3uGb++T4i5
	 zl/vqzmZTTo8Q==
Date: Wed, 1 Jul 2026 22:43:45 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC 0/2] arm64: kprobes: Fix single-step fault and reentry
 handling
Message-Id: <20260701224345.c3a215ece3660a0cbae67645@kernel.org>
In-Reply-To: <20260701121448.3926-1-hupu@transsion.com>
References: <20260701121448.3926-1-hupu@transsion.com>
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "naveen@kernel.org" <naveen@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "will@kernel.org" <will@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 1 Jul 2026 12:14:54 +0000
Pu Hu <hupu@transsion.com> wrote:

> From: hupu <hupu@transsion.com>
> 
> This series fixes two arm64 kprobes issues observed when running
> simpleperf with preemptirq tracepoints and dwarf callchains while a
> kprobe is active on a frequently executed kernel function.
> 
> The crash happens in the kprobe debug exception path. While a kprobe is
> preparing or executing its XOL single-step instruction, perf/trace code
> can run in the same window. That code may either take a fault of its own
> or hit another kprobe.
> 
> Patch 1 makes kprobe_fault_handler() handle a fault in
> KPROBE_HIT_SS/KPROBE_REENTER only when the faulting PC points at the
> current kprobe's XOL instruction. Otherwise the fault is left to the
> normal fault handling path.
> 
> Patch 2 allows a kprobe hit in KPROBE_HIT_SS to be handled as a
> recoverable one-level reentry. Only a hit while already in
> KPROBE_REENTER remains unrecoverable.
> 
> This follows the same logic as the existing x86 fixes:
>   6381c24cd6d5 ("kprobes/x86: Fix page-fault handling logic")
>   6a5022a56ac3 ("kprobes/x86: Allow to handle reentered kprobe on single-stepping")

Good catch!! 
The series looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

But it should be reviewed by arm64 maintainers too.

BTW, if you are "Pu Hu", the Signed-off-by tag should be
"Pu Hu <...>" instead of "hupu <...>".

Thank you,

> 
> Reproducer:
> 
>   simpleperf record -p <pid> -f 10000 \
>     -e preemptirq:preempt_disable \
>     -e preemptirq:preempt_enable \
>     --duration 9 --call-graph dwarf \
>     -o /data/local/tmp/perf.data
> 
> Before this series, the crash reproduced frequently. With both patches
> applied, it was no longer reproduced in our testing.
> 
> hupu (2):
>   arm64: kprobes: Do not handle non-XOL faults as kprobe faults
>   arm64: kprobes: Allow reentering kprobes while single-stepping
> 
>  arch/arm64/kernel/probes/kprobes.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> -- 
> 2.43.0
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

