Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B36FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+Pbk+AMqlQcQg0IkPAdVHTlxrIIFf5Dha1LbvjUbTc=; b=KzyY1BDCV/tLeNyikrfXqcIoIk
	4Nb6e9bDn1ygPxgyWgMiaIG0ut4JUKVSSlWsn9e4INh7GE67TkG3OduR7wl7H/igd5efyM2+Ci2Sg
	LPHZCOFgtIG/NQJANCOwCin9+nX3lrM1NvwNHGER71nl8LueX3bnvG9HeyBbu4BV6Vpqp02AGAkDM
	+kMnFXb52awpVi1DDlsguEe9TSwylcOrr2owDAlbO7erGMtZrVZOQe5TjhmLoIOuCUlMWEdBsZ2GZ
	tPshR44qmv3unMCLESDPjNQo6yco8Hq6nSRP4oAqpscVyJZHFequvbn52LwgbGjEkoogh7zTrQFZZ
	vdPAXLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSWs-0000000HQ6R-45Rt;
	Fri, 06 Jun 2025 08:34:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSRM-0000000HPLs-2R43;
	Fri, 06 Jun 2025 08:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3+Pbk+AMqlQcQg0IkPAdVHTlxrIIFf5Dha1LbvjUbTc=; b=XlbGiJC9RQz1KM7Ij82rDYp0z9
	LD+AZyjrmmvR+Iw7srmbzOykDg4dmR59qkjiXx1PPtvzGmt8SZiBmcBvPsJG5wTeK2tYYN89l3sG8
	KNvzYW771h9vCw8GyQrxNBE5uhwloCna//c1+lQcOV3aLi2vozired3CEL2KK0ShK6rscjf2x5OlG
	JyqAgHATRtsrux9WnKO6RHkQOVsOYSo4UqxQZt9Pvp8mgHyS7IoJQK1csbmZx0PSNJsNr4DQV/DXZ
	RQFxVxiXwxeaf7C0gTPk3oAn7B+YCGtudDz7/OIjZAW3vKl2jpGHLMZzlyVF7DsA4UBT71yJ9dzMf
	LogbYWMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSRH-00000001FeD-3qdc;
	Fri, 06 Jun 2025 08:28:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF72130078B; Fri,  6 Jun 2025 10:28:34 +0200 (CEST)
Date: Fri, 6 Jun 2025 10:28:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
Message-ID: <20250606082834.GM30486@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
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

On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:

> Thank you for your patch.
> I believe this patch also effectively addresses this race condition.
> I will queue it in our test pool for testing.

Thank you; I shall await the results!


> > @@ -101,12 +98,12 @@ static bool cpu_stop_queue_work(unsigned int
> > cpu, struct cpu_stop_work *work)
> >         raw_spin_lock_irqsave(&stopper->lock, flags);
> >         enabled = stopper->enabled;
> >         if (enabled)
> > -               __cpu_stop_queue_work(stopper, work, &wakeq);
> > +               __cpu_stop_queue_work(stopper, work);
> >         else if (work->done)
> >                 cpu_stop_signal_done(work->done);
> >         raw_spin_unlock_irqrestore(&stopper->lock, flags);
> > 
> > -       wake_up_q(&wakeq);
> > +       wake_up_process(stopper->thread);
> 
> BTW, should we add enabled check here?
> 	if (enabled) 
> 		wake_up_process(stopper->thread);

Ah yes. Spuriously waking the stopper thread is harmless, but wasteful.

> >         preempt_enable();
> > 
> >         return enabled;

