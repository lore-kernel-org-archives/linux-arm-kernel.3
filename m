Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9xkd6KV/yatAwNNckPZRDG5c5f7LM7Kmzqj5CpIduI=; b=u5HFHHJ1pIn8TzUjnzs9/Ya0f9
	4Wlah/I38MZ4QdopHQAMvkawO9KNPYeFRbOBf0AajqeTt12+d5S7ZNB+rnXraXdDfvbQD1Ah9Y5Gv
	kwgGICEW+3E9VbjhbuP9qhQtqMt/Ej8MUwsCwgCJm07ZcB6V7ELf1jZLYwMRLQ1KEDQrNUc0tx9vv
	kwRQe60m4yBqFHyZBwW0J5c1aOg3lJ2EFFmXF4xFr3qIjCDiBomBjYRTOvtgDarUGMivGY44X4WmJ
	Y18SR4PbbGXy4l8l7IHW77++R9ttmAszEcSpjSx53D97sN1Ye1kVbjMo0f05bEHr7YDt/PtHwcU9p
	WTVm38IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdW0-00000002qPI-2SLs;
	Mon, 10 Mar 2025 13:49:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcYi-00000002gCg-2pVr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 12:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c9xkd6KV/yatAwNNckPZRDG5c5f7LM7Kmzqj5CpIduI=; b=nWasINNfzooGM/hrmXrNrPZF6C
	OYAs9EBgKsE253ifuOMhGE2KdBzGLKQi4s8YPzW7TcYndXMonGHvONZ8/01T8QUPkmnSfMefsqEMy
	EM44TQ4pFOxyMp/JuQi6sAnbu+fpUD0XuxaLXSmTukzVMbyRlH8TTUwzVNxFBRQQnl+IXJBGo5JeN
	q8waFEtmQ8tdSO4N9wcSrgPPitM2bGIwyL6dGhVMFwZIs2jfDwlaWTkfO3uOloWXC+rn7SEN7JuD2
	mAjsRyd+gssxXhmCT4qWfFNEcsmZYQmLYKEOeTMeQE1wAO+ZbOoL0ysPAaKCzNjb4ds1sMpYfr+Mk
	vLgmGhkQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1trcXh-00000004eMw-0KMx;
	Mon, 10 Mar 2025 12:48:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 898B1300599; Mon, 10 Mar 2025 13:47:35 +0100 (CET)
Date: Mon, 10 Mar 2025 13:47:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] perf: Allow adding fixed random jitter to the
 alternate sampling period
Message-ID: <20250310124735.GR5880@noisy.programming.kicks-ass.net>
References: <20250307202247.648633-1-mark.barnett@arm.com>
 <20250307202247.648633-4-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307202247.648633-4-mark.barnett@arm.com>
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

On Fri, Mar 07, 2025 at 08:22:45PM +0000, mark.barnett@arm.com wrote:
> @@ -9922,7 +9923,10 @@ static int __perf_event_overflow(struct perf_event *event,
>  	if (event->attr.alt_sample_period) {
>  		bool using_alt = hwc->using_alt_sample_period;
>  		u64 sample_period = (using_alt ? event->attr.sample_period
> -					       : event->attr.alt_sample_period);
> +					       : event->attr.alt_sample_period)
> +				  + (event->attr.jitter_alt_period
> +					? get_random_u32_below(2 << event->attr.jitter_alt_period)
> +					: 0);

So, ... this here is NMI context, right? Have you looked at the guts of
get_random_u32_below() ?

I would strongly suggest you go do so.

>  
>  		hwc->sample_period = sample_period;
>  		hwc->using_alt_sample_period = !using_alt;

