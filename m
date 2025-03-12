Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0645DC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+guXa85l4m8374ZSaIhSq5yBVp6GHqv8PZJqOh4Sv24=; b=b3/WGYdM8kNomQhElyMSiCV11M
	eO/nP+TPr+wPjE0MDXujOCWKEfhYVR285P9UI21Z3lN92wXJ67wQIqiH4mHtqokPYhwjtRjsStxZY
	S6d2wIAp1hrLy/hN4mXSaUQAHnbXiHnlWGRPhkHjXSe8Du7yXa00bj2xKDH7iXRHqWx+do0kreaJr
	bEweCPLYgeQyTq7f4Hl4gN4BI5vWFSqFwC3V20pFkrPR7cmJrZB6DAtov67JgEC4qXm4qyP8E6yqi
	iK7A1eK4tJmW5elcW9NK2WouPPwAO4rYbrMIj6eNhmvk+chpww/nz4z77UW7zKoJd61V5ClbBQpH2
	3BQxCpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIrW-000000083Ur-10r5;
	Wed, 12 Mar 2025 09:58:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIZ6-000000080Fw-2JmD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 09:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+guXa85l4m8374ZSaIhSq5yBVp6GHqv8PZJqOh4Sv24=; b=BvNigwEpbh0bCumOLG+Vr9+/dk
	qERJ6KukgwmSyjlHyfkaf82Cu43ZP2iuXg6fWsMR8W0ezR7O5Zbs5zFk3CYTMvgppOfEEmAHfb69c
	C0n7Pqh9tWHAAnpl3bZwGnZu201gAg2KlarWBKJJYeo9loxXOh8gIxVBIcpqXjtEmP6MsPDrL5SqL
	GLiXzMDEiP+UXH2DfHyqTUjFpjWtxJ5mDQ6XHra1VmBfqx0v+y6h5SOteD+NSr9Vr61fOtas9GwGH
	elVbDYnyE0JQwM22kIc9rb47dPOZtS6TgI8qoGaFVRPbeQrPPzHeaQKi5T1We2oOVeUZvqmufS1UX
	IMrUSSuQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIZ3-00000002LRo-0MO4;
	Wed, 12 Mar 2025 09:39:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A096300599; Wed, 12 Mar 2025 10:39:48 +0100 (CET)
Date: Wed, 12 Mar 2025 10:39:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Barnett <mark.barnett@arm.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
Message-ID: <20250312093947.GJ19424@noisy.programming.kicks-ass.net>
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
 <20250311113128.GD19424@noisy.programming.kicks-ass.net>
 <431a5acb-4906-4095-8dec-b2d824adaac6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <431a5acb-4906-4095-8dec-b2d824adaac6@arm.com>
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

On Tue, Mar 11, 2025 at 05:22:16PM +0000, Mark Barnett wrote:

> > @@ -9979,6 +9985,8 @@ static int __perf_event_overflow(struct perf_event *event,
> >   				 int throttle, struct perf_sample_data *data,
> >   				 struct pt_regs *regs)
> >   {
> > +	struct hw_perf_event *hwc = &event->hw;
> > +	u64 sample_period;
> >   	int events = atomic_read(&event->event_limit);
> >   	int ret = 0;
> > @@ -9989,15 +9997,50 @@ static int __perf_event_overflow(struct perf_event *event,
> >   	if (unlikely(!is_sampling_event(event)))
> >   		return 0;
> > -	ret = __perf_event_account_interrupt(event, throttle);
> > +	/*
> > +	 * High Freq samples are injected inside the larger period:
> > +	 *
> > +	 *   |------------|-|------------|-|
> > +	 *   P0          HF P1          HF
> > +	 *
> > +	 * By ignoring the HF samples, we measure the actual period.
> > +	 */
> > +	if (!(hwc->state & PERF_HES_HF_SAMPLE))
> > +		ret = __perf_event_account_interrupt(event, throttle);
> 
> The high-frequency samples should still contribute to interrupt
> accounting/throttling, right? We'd just need to put guards around the
> adaptive period stuff so that HF samples don't contribute to the frequency
> training.

Yeah, I suppose it should. This means breaking up that function but that
isn't hard.

