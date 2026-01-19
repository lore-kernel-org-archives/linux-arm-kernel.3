Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E56D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PDkuxy9ZC9owhpEuxjquopJ4AgKESX6dEz3nWhcM4I=; b=bIWMvAnscO/4ok1kHfJwIvsn4G
	XkMaVK01/i8FtIzxHmtediCktVQWqTgdTG0pN03dMQo6WMJ+WL0VYUVqM2mVeat65mZhqVpoHhdv6
	hCIvVb5Hwb+r42fEYJOaqQtzNiF+rnms7ayiskEML900GZuwtzcxQFtje1P1FYhUc42AyGiRV4P37
	mOgsMhfF4bMDtwhGSQSOfMIdEILetqMb+cawYGI3BFIWoOfPHsjZxTdXEbg4BDUI7mmKlqxr0/ZWk
	svP8Vq0WgKdrBLGRvzrPeKOPsBgmeZlMlPsIz4Y8kSD4UgpozBHpxPxuTCCVkwCiFj9c2aTRsyjNc
	Gd8dj9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqdU-00000002IXf-1Qfy;
	Mon, 19 Jan 2026 14:53:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqdR-00000002IXG-3jC5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:53:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2B0497;
	Mon, 19 Jan 2026 06:53:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 396D13F694;
	Mon, 19 Jan 2026 06:53:40 -0800 (PST)
Date: Mon, 19 Jan 2026 14:53:37 +0000
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
Message-ID: <20260119145337.GB2732125@e132581.arm.com>
References: <20260119-james-perf-coresight-cpu-map-segfault-v2-0-56b956a629ee@linaro.org>
 <20260119-james-perf-coresight-cpu-map-segfault-v2-1-56b956a629ee@linaro.org>
 <20260119111509.GD1286628@e132581.arm.com>
 <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b06ea25-2516-406c-8b78-c359d3fb2aa6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_065342_066755_F6D21202 
X-CRM114-Status: GOOD (  26.80  )
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

On Mon, Jan 19, 2026 at 11:55:53AM +0000, James Clark wrote:

[...]

> > >    0 0 0x200 [0x90]: PERF_RECORD_ID_INDEX nr: 4
> > >    ... id: 771  idx: 0  cpu: 2  tid: -1
> > >    ... id: 772  idx: 1  cpu: 3  tid: -1
> > >    ... id: 773  idx: 0  cpu: 2  tid: -1
> > >    ... id: 774  idx: 1  cpu: 3  tid: -1
> > 
> > Seems to me that this patch works around the issue by using the CPU ID
> > instead, but event->auxtrace.idx is broken.
>
> I don't think it's a workaround, I think it should have been written this
> way in the first place.

Agree.  Sorry for confusion in my rely.

[...]

> > > @@ -3086,7 +3086,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
> > >   	if (aux_offset >= auxtrace_event->offset &&
> > >   	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
> > > -		struct cs_etm_queue *etmq = etm->queues.queue_array[auxtrace_event->idx].priv;
> > > +		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, auxtrace_event->cpu);

During decoding, cs_etm allocates its own AUX queues and needs to
convert the AUX records into a cs_etm-specific format.

For example:

  event_id=405 idx=0 cpu=0 tid=6673
  event_id=406 idx=1 cpu=1 tid=6673
  event_id=407 idx=2 cpu=3 tid=6673
  event_id=408 idx=3 cpu=4 tid=6673
  event_id=409 idx=4 cpu=5 tid=6673
  `            `      `> CPU ID
   `> Event ID  `> Generic buffer IDs

In this case, I deliberately hotplugged off CPU2.  As a result, the
buffer IDs are consecutive from 0 to 4, while the CPU ID for CPU2 is
missing.  When adding AUX records to the cs_etm queues, we need to
convert from the generic buffer index to the corresponding CPU ID.

So the above change makes sense to me.

> > >   		/*
> > >   		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
> > > @@ -3095,6 +3095,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
> > >   		auxtrace_fragment.auxtrace = *auxtrace_event;
> > >   		auxtrace_fragment.auxtrace.size = aux_size;
> > >   		auxtrace_fragment.auxtrace.offset = aux_offset;
> > > +		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;

I am still confused about this.  Because above auxtrace will be queued
on cs_etm queues, should we convert from the generic buffer index to the
cs_etm specific one?  E.g.,

  auxtrace_fragment.auxtrace.idx = auxtrace_event->cpu;

BTW, if my understanding above is valid, it is good to go through the
cs_etm.c file for the "idx <-> CPU ID" conversion.

Thanks,
Leo

> > >   		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
> > >   		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > _______________________________________________
> > > CoreSight mailing list -- coresight@lists.linaro.org
> > > To unsubscribe send an email to coresight-leave@lists.linaro.org
> 

