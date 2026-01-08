Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D89D185D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K/ajdPdRqkH9IPbmwsANGlkSAgoS8eVOxuBsPn+o14=; b=00UypkfDX12VGNDw9et5IqUpH2
	JGb/hdauumIzk8Gj7YcZqsK/dDEOwUO7VYnjXeUqJRHKiq70Ar1JpBT4J7r3IzvhAeWdiczDAnVHQ
	fqMn+OXzoYQ1OOexkI6ORgr7cVv3a+K37KejTrWPRSY+fW4gbwLaxrMc2bERzMb1mNkarYtj4IYJr
	5ZcSbYciM+LSafkNO0Lp5ZObOlabs0uzet+4j/f1l45nz5uL9wLsT4pCtfThcznGx/cNovxpO486X
	KVJGHqMQSXfsr7MaAiAzj5y9UUgPdGgn6ZyRFw/bv8fTdy5DPhtp5hnlN2qk6PVDDthvT3Cb48qkp
	aT32D6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdo0Q-0000000Gojm-3Onc;
	Thu, 08 Jan 2026 11:16:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdo0O-0000000Goil-0BLG;
	Thu, 08 Jan 2026 11:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/K/ajdPdRqkH9IPbmwsANGlkSAgoS8eVOxuBsPn+o14=; b=kH0SR/WT5ODrg0ZXozLLI40kYr
	0Kc6eG3ON2n+nWoNhNZTVrmpCz3IpVJbASQa2Ps0/t4Pcf4/GeXj7t1EPH61YE7GnUy1UU1GVqpub
	Sh8WdSDAnGJ0zdN8E1E2j7WgIUQY8KqniF7kdV0DJyJT52xrQkM7ru4dkHlpz3wR3qQSyulY5gbjW
	VdIyEwpxX4tr8+RnExi3K3NT+ctrMcNydGHLnW0yyajCD1BZybKcm5ERjmp+sGbzVu8fINxPOoPKy
	K3c5Z2hRKjhyIVts6iHKYbMPJ/OpRYpbbKrFniQy9AQ1IgAZKChUsH54ccVk1LoKDlVwMXAvUkTB/
	eCmrfV0w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdo0I-0000000EqjO-0lKf;
	Thu, 08 Jan 2026 11:16:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0820B300E8E; Thu, 08 Jan 2026 12:16:33 +0100 (CET)
Date: Thu, 8 Jan 2026 12:16:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dengjun Su <dengjun.su@mediatek.com>
Cc: linux-kernel@vger.kernel.org, mike.zhang@mediatek.com,
	haiqiang.gong@mediatek.com, peijun.huang@mediatek.com,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] sched/rt: fix incorrect schedstats for rt thread
Message-ID: <20260108111632.GH272712@noisy.programming.kicks-ass.net>
References: <20260108031309.2754003-1-dengjun.su@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108031309.2754003-1-dengjun.su@mediatek.com>
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

On Thu, Jan 08, 2026 at 11:13:07AM +0800, Dengjun Su wrote:
> For RT thread, only 'set_next_task_rt' will call
> 'update_stats_wait_end_rt' to update schedstats information.
> However, during the RT migration process,
> 'update_stats_wait_start_rt' will be called twice, which
> will cause the values of wait_max and wait_sum to be incorrect.

Right, that looses time. Also note that I think dl has the same issue.

> The specific output as follows:
> $ cat /proc/6046/task/6046/sched | grep wait
> wait_start                                   :             0.000000
> wait_max                                     :        496717.080029
> wait_sum                                     :       7921540.776553
> 
> Add 'update_stats_wait_end_rt' in 'update_stats_dequeue_rt' to
> update schedstats information when dequeue_task.

This needs a few more words on why this is correct -- notably it took me
a little time to find the 'task_on_rq_migrating()' case in
__update_stats_wait_end() which makes this not actually 'end'.

But then the corresponding clause in __update_stats_wait_start() gives
me a headache:

 'wait_start > prev_wait_start'

I mean, wtf. Should that not equally be using task_on_rq_migrating() ?

Can you please take a hard look at all that and fix up things all-round?


