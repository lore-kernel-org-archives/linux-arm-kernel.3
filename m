Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80843C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXRxFbi1rHNU7GbafqaihoCDwM1y7YKAsLY1yaGEPbY=; b=FmhuKDQUrBOPgPIWisP0qqO/ah
	AUNgTSSjNELQ9uxgyaDzwgvm1tZ/lAqzV3z/88+szKybX3vQ+Ns5K3jUW5n+JYNJfGGtTMcCbrVtd
	FpK9Ob0sNOqsHJxqXWxW4/zNUH6JSGdYtSRgZQH1Em+47Kv/ia/I24C7tZ8VUorVUOkV9ToH1c7Hj
	c9J45f8tXW3IdqB1CSiKcOKkQh5ndCy5kPLGpbasySan0aeh7/vdCPgtQubhHmT5IL80t94Pao0iw
	XbtilCWefVInHIkqOeDCKuR6HWKzkPp207ropWfobqm1R3DbouUj597jgjzMN4OJkrFWtfKiK4ucl
	nNn3YUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeWJ-0000000092v-1eKi;
	Tue, 30 Jun 2026 19:53:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeWH-0000000092L-2G8k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 19:53:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A637600FC;
	Tue, 30 Jun 2026 19:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8731F000E9;
	Tue, 30 Jun 2026 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782849200;
	bh=LXRxFbi1rHNU7GbafqaihoCDwM1y7YKAsLY1yaGEPbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j8bysIMbzvXmdKPX76RwD72APahTsxjBcVRALpKR9ix/1ivBdJD16BHUPrYRtqs9z
	 nEvIIBNBaYuhBW9hu4SYrBLt4Y5umONwcWicaQzvku6VTUEa/czI1CR55zLYCfL830
	 64FDP9ixwyz4y012ZdZoTVr0crdxDSUZG2M48yPtiJduV7gtmApxw62BKyxTKncV44
	 3+TgcmYFn66Lx6+ee5/kNbdSoG+/aIfZvQEta2d9NM5s1QAFV6hdngGSF5ATcQynMk
	 k8YVT8EPm9cU8b2pL9VI9wgcZ0JQGwGByfUtzryk2BrQNwrcJ5PfssTheyXZDhF0cJ
	 bPewcAZS2tarA==
Date: Tue, 30 Jun 2026 15:53:18 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Vineeth Pillai (Google)"
 <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep
 rcu_is_watching() check to trace_##name##_enabled()
Message-ID: <20260630155318.7db20990@gandalf.local.home>
In-Reply-To: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
References: <20260522143508.298439732@kernel.org>
	<20260522143525.551205135@kernel.org>
	<CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Tue, 30 Jun 2026 19:39:02 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
> are unafffected, perhaps because they are not SMP?
> All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.
> 
> Reverting the commit fixes the issue.
> 
> Do you have a clue?

Yes, it means the code was buggy before the commit. The commit will trigger
warnings in places that have issues. Before the commit, the buggy code was
never caught.

It's like enabling KASAN and finding code that has use-after-free.
Disabling KASAN is not the fix.

Tracepoints are managed by using RCU. There's places that RCU is turned
off, meaning a tracepoint in one of those locations can be triggered when
RCU is not active which may have a use-after-free semantic when the
tracepoint is enabled.

Tracepoints hidden by trace_#tracepoint#_enabled() are not caught when RCU
is disabled and the tracepoint is not active. This commit makes these
locations trigger even when the tracepoint is not active.

One way to find out if this is an existing bug or not, could you enable the
preemptirq tracepoints and run the tests again with the commit reverted?

  echo 1 >  /sys/kernel/tracing/events/preemptirq/enable

This will enable the events that are hidden without the commit. If it
triggers when enabled, it shows the commit found a bug.

If you get the same errors, the bug isn't with the commit in question, it's
with the tracepoints being called during suspend/resume. We will need to
fix that if that's the case.

-- Steve

