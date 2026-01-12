Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1952DCF45A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6frWGL3mv0azutt360p+irVL7NLCTrHz31j8urvnMs=; b=bs7lEW6iLCyXnsaJ5q++r4hnxZ
	0/4YOOlioH+hAx/TMBDe4X0m1qew+Q6QBSjvPb6JhtWpmCIgyUjiOr4kHh97R/RUVHQ3CpVX1Hl3H
	p70OgAh56e+tCoYGo5hmlO+teRV7LCXYVJMii0nMv4C20zCXqqUKKCzsstorCwwy8Ootgd64hbdf5
	AZWiOCotLd6D/r7+Es4PBBcmjnYL8eAkb+MVCTvt2e6qMD0YHoI5oSdDQ2ja2VHObOYeBSNNTy41B
	J1zv69prtwjxJdacBnQkbmpVII5Gh3KVsEdHffE0AtudPj6FLJVOdaht6z/Ki8BWSmNXhbm20W09S
	c9LWJ6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKvt-00000005jhq-0lRT;
	Mon, 12 Jan 2026 16:38:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKvs-00000005jhh-0Yum;
	Mon, 12 Jan 2026 16:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y6frWGL3mv0azutt360p+irVL7NLCTrHz31j8urvnMs=; b=BWzg0ci9lRV6kM6SAg7C7W64ZR
	hxsgs65EQUWzH+vLcV0xGzP7mlKYEi1ZGOzd2wQCIYUh2Gj/MHYmMlXCrpPrdb4QvQ7LKCcsVKZs1
	2znQv+OE26br4sYs33mIe/b08YuM3ySyQVlV30Ou13MV5v+dT7N6HX5f1Psj26bR5j2Puu6qXM+Nu
	Sudk3bDWLysMVCVz60/H7OO0En3GnyDUBqB9s1rqQho9v4U5RPwyzG4ChLkZFoSaB2s+2PnrFMlbD
	cyGjFT5t4S5Bycf03Vddc7iqgHF2d7lEVn9AsWB2lzmOk0tJn5PaNZAVLHc4jc/rCgZ4j/Cg1esgb
	aIGUEPlw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKvn-00000001BSA-3TpF;
	Mon, 12 Jan 2026 16:38:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C66AC302D3E; Mon, 12 Jan 2026 17:38:14 +0100 (CET)
Date: Mon, 12 Jan 2026 17:38:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dengjun Su <dengjun.su@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, bsegall@google.com,
	dietmar.eggemann@arm.com, haiqiang.gong@mediatek.com,
	juri.lelli@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com, mgorman@suse.de, mike.zhang@mediatek.com,
	mingo@redhat.com, peijun.huang@mediatek.com, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/rt: fix incorrect schedstats for rt thread
Message-ID: <20260112163814.GP830755@noisy.programming.kicks-ass.net>
References: <20260108111632.GH272712@noisy.programming.kicks-ass.net>
 <20260109072451.2843331-1-dengjun.su@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109072451.2843331-1-dengjun.su@mediatek.com>
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

On Fri, Jan 09, 2026 at 03:24:47PM +0800, Dengjun Su wrote:

> For __update_stats_wait_end(), task_on_rq_migrating(p) is needed to
> distinguish between stage 2 and stage 4 because they involve different
> processing flows, but for __update_stats_wait_start(), it is not necessary
> to distinguish between stage 1 and stage 3.
> 
> As for adding the condition wait_start > prev_wait_start, I think it is
> more like a mechanism to prevent statistical deviations caused by time
> inconsistencies.

It looks like nonsense to me.. since you have a test-case, could you see
what this does for you?

Specifically:

 - it ensures that when not in a migration, prev_wait_start must be 0

 - it unconditionally subtracts; unsigned types are defined to wrap
   nicely (2s complement) and it all should work just fine.

---

diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index d1c9429a4ac5..144b23029327 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -12,8 +12,10 @@ void __update_stats_wait_start(struct rq *rq, struct task_struct *p,
 	wait_start = rq_clock(rq);
 	prev_wait_start = schedstat_val(stats->wait_start);
 
-	if (p && likely(wait_start > prev_wait_start))
+	if (p) {
+		WARN_ON_ONCE(!task_on_rq_migrating(p) && prev_wait_start);
 		wait_start -= prev_wait_start;
+	}
 
 	__schedstat_set(stats->wait_start, wait_start);
 }

