Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC20C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ouAL1qSg6Vc0Q8DHs10VvlTVBunnF0aljWoH02O8KM=; b=ugbeDXIHRU/ZC4TO11CGDvHxgn
	QeRcWZVQ15T2NjosFxLV2OXPW5/rEieMMvqksOCqTA4LI21KgndXSQGuzMphpvKSs8jDUUDKCrden
	aURafNeIxtLdwPmaAFOuzdMBUCyfMboqsXgsqBrH6fpjANymkLsoWtpF865/tsN3gVvrACoAgJ/QQ
	PNKi7f63HwDeiMhd/4iof+FEUIPnJJb7S11Sq9wMnAk6sP4It5L6xRuFwaHATmaIsUSLbunBpBrC1
	ww8ub+8mNpxOs/xIw70Sl4is+gdI+fhFCQ6sJbGZb+gU+HshSD5lGIbC/IMYM/NkeSGR4UdbwR7YN
	U3Udd2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdGO-00000003gSO-2OU3;
	Tue, 01 Apr 2025 15:10:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdEa-00000003gKf-1SsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:09:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055FE2B;
	Tue,  1 Apr 2025 08:09:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E06A3F694;
	Tue,  1 Apr 2025 08:08:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:08:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
Message-ID: <20250401150857.GD115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-6-leo.yan@arm.com>
 <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
 <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_080900_434032_DFA557B8 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Apr 01, 2025 at 03:35:44PM +0100, Mike Leach wrote:

[...]

> > > -static void etm_event_pause(struct coresight_device *csdev,
> > > +static void etm_event_pause(struct perf_event *event,
> > > +                         struct coresight_device *csdev,
> > >                           struct etm_ctxt *ctxt)
> > >   {
> > > +     int cpu = smp_processor_id();
> > > +     struct coresight_device *sink;
> > > +     struct perf_output_handle *handle = &ctxt->handle;
> > > +     struct coresight_path *path;
> > > +     unsigned long size;
> > > +
> > >       if (!ctxt->event_data)
> > >               return;
> > >
> > >       /* Stop tracer */
> > >       coresight_pause_source(csdev);
> > > +
> > > +     path = etm_event_cpu_path(ctxt->event_data, cpu);
> > > +     sink = coresight_get_sink(path);
> > > +     if (WARN_ON_ONCE(!sink))
> > > +             return;
> > > +
> > > +     /*
> > > +      * The per CPU sink has own interrupt handling, it might have
> > > +      * race condition with updating buffer on AUX trace pause if
> > > +      * it is invoked from NMI.  To avoid the race condition,
> > > +      * disallows updating buffer for the per CPU sink case.
> > > +      */
> > > +     if (coresight_is_percpu_sink(sink))
> > > +             return;
> > > +
> > > +     if (WARN_ON_ONCE(handle->event != event))
> > > +             return;
> > > +
> > > +     if (!sink_ops(sink)->update_buffer)
> > > +             return;
> > > +
> > > +     size = sink_ops(sink)->update_buffer(sink, handle,
> > > +                                          ctxt->event_data->snk_config);
> >
> > I believe we keep the sink disabled/stopped in update_buffer. We need to
> > turn it back ON after the "buffer update". May be we could use a flag
> > to update_buffer() to indicate this is "pause" triggered update.

Thanks for pointing out, Suzuki.

I will fix it in next spin.

> The sink is stopped to read data, but also important is the
> enable/disable refcount. The only time that "update_buffer" will read
> is if the sink has a refcount == 1. These are ultimately controlled by
> enable/disable path - which will not occur during pause/resume
> operations.

Hi Mike,

My understanding is: if a sink is shared by multiple CPUs, e.g. a Perf
session with CPU mode or system wide mode, then we cannot arbitrarily
disable sink and update buffer, otherwise, it might cause hardware
lockup issue.

For per-thread mode, the refcount == 1, we can take chance to update
buffer, right?

Thanks,
Leo

