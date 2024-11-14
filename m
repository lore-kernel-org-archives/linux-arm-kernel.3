Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E51D68B36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVl4h5R6rnhw6YUf9IrDWsXYnzegGCj/KhuQEleNVkg=; b=WsPtU0Ekw+mYjRnSxymR+IF+b7
	5Qg3Ah5iI7nqySxuMjEjy8qEoE8MeXFGad12OqYoaRE9IsDd52rJ5QsuUUk2dLX0O+cBVV2IPCbsd
	fXPggXHPfiilzQQoJ6hmM+yax5EtP/28/E4tMrnakrhuBfnYSDVdqi2AwTPoBbJg84Bpung7N5lOi
	lnWTBHhmeNThZcceNxq957CyzOmDDVj+Ezi0HkTLnCx0zkD4BWm/vGHmhtDAgLFB/RvIpggn4nroS
	hpS7JUlRMKcR2XVobpUu9IRHfTpYv0HH1V8lC/U02IEZqI+gp5oVMmTzrgTz83lIi31SbBH/rF5vy
	83ODGF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcmY-0000000092o-3rt6;
	Thu, 14 Nov 2024 16:33:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcle-000000008rm-14S9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KVl4h5R6rnhw6YUf9IrDWsXYnzegGCj/KhuQEleNVkg=; b=n2xkHdT1HWMG3UPYX8L66GnioC
	9sZRphIee2ajkU+LPtbpX5CE9MIOoSsqtUh1uDWgEAwLlU+a0yJG/qf55YVfVYuz3ac1thP+B/8ww
	e8wtORX2Dyew/ckDq8nvfhXoayao12i1iinsE+R7gTy9ynsQwbCY+JmzkgWPG5BqQv7QqmD1Sx8Zb
	4nNqABqm9+73dAdbJVBmWYYNcKgnTg/BSSGuH477e5jkruwIIDfrGH/hLcbTCON2wvBYz0Pb0LKWK
	u1qA/SGgiq9rIOy8VIRRfSJ5KSQrGyps7gipayt101UsD7HxuN1Z0JkbjsP5ui2/VdmQyWrv2iBeQ
	Bd/6zqBg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbM1-0000000033t-3CHr;
	Thu, 14 Nov 2024 15:01:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1FB58300446; Thu, 14 Nov 2024 16:01:53 +0100 (CET)
Date: Thu, 14 Nov 2024 16:01:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Deepak Surti <deepak.surti@arm.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.barnett@arm.com, ben.gainey@arm.com, ak@linux.intel.com,
	will@kernel.org, james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/4] perf: Allow periodic events to alternate between
 two sample periods
Message-ID: <20241114150152.GC39245@noisy.programming.kicks-ass.net>
References: <20241107160721.1401614-1-deepak.surti@arm.com>
 <20241107160721.1401614-2-deepak.surti@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107160721.1401614-2-deepak.surti@arm.com>
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

On Thu, Nov 07, 2024 at 04:07:18PM +0000, Deepak Surti wrote:
> From: Ben Gainey <ben.gainey@arm.com>
> 
> This change modifies perf_event_attr to add a second, alternative
> sample period field, and modifies the core perf overflow handling
> such that when specified an event will alternate between two sample
> periods.
> 
> Currently, perf does not provide a  mechanism for decoupling the period
> over which counters are counted from the period between samples. This is
> problematic for building a tool to measure per-function metrics derived
> from a sampled counter group. Ideally such a tool wants a very small
> sample window in order to correctly attribute the metrics to a given
> function, but prefers a larger sample period that provides representative
> coverage without excessive probe effect, triggering throttling, or
> generating excessive amounts of data.
> 
> By alternating between a long and short sample_period and subsequently
> discarding the long samples, tools may decouple the period between
> samples that the tool cares about from the window of time over which
> interesting counts are collected.

Do you have a link to a paper or something that explains this method?


> +	/*
> +	 * Indicates that the alternative_sample_period is used
> +	 */
> +	bool				using_alternative_sample_period;

I typically prefer variables names that are shorter.


> @@ -9822,6 +9825,26 @@ static int __perf_event_overflow(struct perf_event *event,
>  	    !bpf_overflow_handler(event, data, regs))
>  		return ret;
>  
> +	/*
> +	 * Swap the sample period to the alternative period
> +	 */
> +	if (event->attr.alternative_sample_period) {
> +		bool using_alt = hwc->using_alternative_sample_period;
> +		u64 sample_period = (using_alt ? event->attr.sample_period
> +					       : event->attr.alternative_sample_period);
> +
> +		hwc->sample_period = sample_period;
> +		hwc->using_alternative_sample_period = !using_alt;
> +
> +		if (local64_read(&hwc->period_left) > 0) {
> +			event->pmu->stop(event, PERF_EF_UPDATE);
> +
> +			local64_set(&hwc->period_left, 0);
> +
> +			event->pmu->start(event, PERF_EF_RELOAD);
> +		}

This is quite terrible :-(

Getting here means we just went through the effort of programming the
period and you'll pretty much always hit that 'period_left > 0' case.

Why do we need this case at all? If you don't do this, then the next
overflow will pick the period you just wrote to hwc->sample_period
(although you might want to audit all arch implementations).

Looking at it again, that truncation to 0 is just plain wrong -- always.
Why are you doing this?




