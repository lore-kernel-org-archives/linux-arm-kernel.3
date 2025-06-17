Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB01C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJP0GPyMKswwkaA1sdEsRQYeektr28qBzPz6H5BQJ98=; b=fNnbfy9ISxucMCjGkzGXmlgx+I
	A3Z+18Ci5aVt47Nvm6h2dsU8TztMK584OalSHSBPcqaQ9BRt29mdLK14y7GS9FHfIQuoO9Ecd6MYV
	OSRCD4L4l7BHfi5znY9exkiNvf/rqNei3Kn+XV+epM6kIU1vE8Yy5QFxZHE15JqPTQUGrg02xRaku
	UmJU/JnjU9YjdeRsRHyS99JkJk7IC+EeZyCaDJUMYbOP46O3wf0M+t1XdZQfxtuidNNkdTikohqTu
	PKxzlAAFr8mIlLkdJTT/VPtfX/BBz/ZYEmH4TCm36vVhTWMm5GiLSRanZYPTRZPpEezDtUStfrJWM
	u4UNv9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXyT-00000007i2z-1SbV;
	Tue, 17 Jun 2025 15:11:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX5I-00000007VZl-0FMM;
	Tue, 17 Jun 2025 14:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yJP0GPyMKswwkaA1sdEsRQYeektr28qBzPz6H5BQJ98=; b=C9+uYutBKalrTGmUZijIbg8NAD
	QRCJan8vuyS1Kc3esAYZg7nZX9wEFsM7QoAZSimDwuR2aX3v5uYMLOSeJUslAXF4I9vSi5nCGThnu
	xGVI4davWmEdbId93nms4ZYLxRBCswq5kOWfJediW7CvBJiIz5kjyWuDbrPPItoVHuVpqz5ei4Ry9
	HSlMYHS5S0x34KLMqbCcwQzaJA2+AGhhdGDjv1X3LZEe969pdkGDDT/wkFeGdULFQnbyM5rWoW6em
	R6mneQPxqV6rEBe53xNfwNI57Jws7ru1dutsziGhwKuMjkmn00l1MWZ4yppIvUXrQOxc80ZlK//wK
	yoFSuUzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX5C-0000000HF1b-2N99;
	Tue, 17 Jun 2025 14:14:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5FA7630BDAD; Tue, 17 Jun 2025 16:14:37 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:14:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
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

On Tue, Jun 17, 2025 at 02:33:15PM +0200, Juri Lelli wrote:
> On 17/06/25 10:55, Peter Zijlstra wrote:
> > On Sat, Jun 14, 2025 at 10:04:55AM +0800, Kuyo Chang wrote:
> > > From: kuyo chang <kuyo.chang@mediatek.com>
> > > 
> > > [Symptom]
> > > The calculation formula for fair_server runtime is based on
> > > Frequency/CPU scale-invariance.
> > > This will cause excessive RT latency (expect absolute time).
> > > 
> > > [Analysis]
> > > Consider the following case under a Big.LITTLE architecture:
> > > 
> > > Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> > > FIE: 100
> > > CIE:50
> > > First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> > > Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> > 
> > What's this FIE/CIE stuff? Is that some ARM lingo?
> > 
> > 
> > > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > > index ad45a8fea245..8bfa846cf0dc 100644
> > > --- a/kernel/sched/deadline.c
> > > +++ b/kernel/sched/deadline.c
> > > @@ -1504,7 +1504,10 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
> > >  	if (dl_entity_is_special(dl_se))
> > >  		return;
> > >  
> > > -	scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > > +	if (dl_se == &rq->fair_server)
> > > +		scaled_delta_exec = delta_exec;
> > > +	else
> > > +		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> > 
> > Juri, the point it a bit moot atm, but is this something specific to the
> > fair_server in particular, or all servers?
> 
> I believe for other servers (i.e., rt-server work from Yuri and Luca) it
> might be useful to have it configurable somehow. I actually had a recent
> discussion about this concerning single task entities (traditional
> deadline servers) for which as well there might be cases where one might
> want not to scale considering frequency and capacity.
> 
> > Because if this is something all servers require then the above is
> > ofcourse wrong.
> 
> To me it looks like we want this (no scaling) for fair_server (and
> possibly scx_server?) as for them we are only looking into a 'fixed
> time' type of isolation. Full fledged servers (hierarchical scheduling)
> maybe have it configurable, or enabled by default as a start (as we have
> it today).

Right. Then we should write the above like:

	scaled_delta_exec = delta_exec;
	if (!dl_se->dl_server)
		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);

and let any later server users add bits on if they want more options.

