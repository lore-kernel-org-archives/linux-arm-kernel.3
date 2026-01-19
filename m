Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6641D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VACHxDhDhcawYGwDwLZ4HNJtV3ErCXST1n0HcZosOFI=; b=IK8u4PWB0xEmr9yfYnsxAArMD/
	xwbzN0CQ5pmjpwnWekmAD7KpIeIbOj1NTtptuygoOU4Uj+RRjW7o3rxuAuvHPcWhH+ZVqo41hTEmx
	0pY3fsdJzSwbcmUQDeLNpJToxwSduz/pVQyhFuS9MF6WhncowuSUNw0ysgykti0vhhY6pLQQmPui+
	F8CiPoIu5kkE4nz3JnVxRLpFLN5XOMCOfncCND8R5onYo1CjdpHYOdnp6sv0BOwxEQuxReUFDjhxV
	dhRoE+R29W4+ERd8EnOLsaGj+L05vuhGLDYmpj8rorzVJauL85UlhtJplZRjA/rwBMysniuiR1OB7
	DUqi/RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrPf-00000002NQf-25Bi;
	Mon, 19 Jan 2026 15:43:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrPX-00000002NPS-0YOg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:43:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5919D497;
	Mon, 19 Jan 2026 07:43:14 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8527B3F694;
	Mon, 19 Jan 2026 07:43:20 -0800 (PST)
Date: Mon, 19 Jan 2026 15:43:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf cs-etm: Fix decoding for sparse CPU maps
Message-ID: <20260119153846.GD2732125@e132581.arm.com>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
 <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
 <20260119145337.GB2732125@e132581.arm.com>
 <dd9a3cde-ea9f-4c53-b537-f15767bf4d99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd9a3cde-ea9f-4c53-b537-f15767bf4d99@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074326_655514_91E31A5D 
X-CRM114-Status: GOOD (  29.18  )
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

On Mon, Jan 19, 2026 at 03:16:01PM +0000, James Clark wrote:

[...]

> > > > >    		/*
> > > > >    		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
> > > > > @@ -3095,6 +3095,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
> > > > >    		auxtrace_fragment.auxtrace = *auxtrace_event;
> > > > >    		auxtrace_fragment.auxtrace.size = aux_size;
> > > > >    		auxtrace_fragment.auxtrace.offset = aux_offset;
> > > > > +		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
> > 
> > I am still confused about this.  Because above auxtrace will be queued
> > on cs_etm queues, should we convert from the generic buffer index to the
> > cs_etm specific one?  E.g.,
> > 
> >    auxtrace_fragment.auxtrace.idx = auxtrace_event->cpu;
> > 
> 
> This is basically what the change is already doing. etmq->queue_nr == CPU
> because cs_etm__setup_queue() is called for every CPU up to max_cpu, not
> only for ones that were recorded so it has a 1:1 mapping. Using
> etmq->queue_nr also works in per-thread mode where queue 0 is used, which
> your suggestion doesn't handle. Otherwise they would be equivalent.

Indeed, per-thread mode needs to be handled separately.

On the Juno board (6 CPUs), I see "etmq->queue_nr=6".  It seems a bit
odd that this value is used as the index.  Even in per-thread mode, the
index is still set to 6.  For correctness, should we instead set the
index to the CPU ID, and use 0 for per-thread mode?

> To be honest the whole decoder has become hacks on top of hacks. I think we
> might want to do a full from scratch re-write when we come to do the proper
> timestamp to MMAP event correlation or the change to not keep resetting the
> decoder for TRBE wrap mode.
> 
> > BTW, if my understanding above is valid, it is good to go through the
> > cs_etm.c file for the "idx <-> CPU ID" conversion.
> 
> Do you mean there are other mistakes?

Yes.

> I did check the rest and did some testing and didn't see any issues.

Thanks a lot for the checking.

Leo

