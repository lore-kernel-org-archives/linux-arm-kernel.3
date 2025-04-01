Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3705BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIzL/Fmgm35jtoOze9VBfgI2lN+bMr5v6nDz6TrylEA=; b=V3z4DSM6840MPuyYHYWqBJ6i6v
	M4EfwhZ7Bthj8J6cxz/YQD9qgDBo1UqukM/86qGrdS/G5D673CN1yYHO1tvyV8PZe4Z0zieobwXt7
	0PxL1TZ6RfFinFmriYF0xS7pD8s3drQKuu1g00TOa1dmpif25h+CDte1hicZXjxoSZLTnr7uCG7C9
	VhhhI1EAUmZj8VulYxp3SLrAA2s4ZmoCJ6PJVarXqjGvXNQpXPCRXIMedpJpkmFp2BHnzkhUX9JH9
	r79gknUzN/fvLM3odDZQSWhJoLjwH5ZqXG4su52S2lwZDO2y5u4JB0SJ20dJtzDVUAjEEXLHBop9H
	ZqZZ5JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd8G-00000003fCa-2nfz;
	Tue, 01 Apr 2025 15:02:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd6H-00000003ei4-3RMv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:00:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D4714BF;
	Tue,  1 Apr 2025 08:00:28 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994C03F694;
	Tue,  1 Apr 2025 08:00:24 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:00:19 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and
 resume
Message-ID: <20250401150019.GC115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_080025_948657_AA0419F9 
X-CRM114-Status: GOOD (  23.26  )
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

Hi Mike,

On Tue, Apr 01, 2025 at 01:50:52PM +0100, Mike Leach wrote:

[...]

> >  static void etm_event_start(struct perf_event *event, int flags)
> >  {
> >         int cpu = smp_processor_id();
> > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> >         if (!csdev)
> >                 goto fail;
> >
> 
> Is it possible here that the first call to etm_event_start() also has
> the PERF_EF_RESUME flag set?

The first call has a flow below, using flag 0 but not PERF_EF_RESUME.

  etm_event_add()
    `>  etm_event_start(event, 0);

Note: for the first call, the tracer should be disabled if
'event->hw.aux_paused' is 1.  This is ensured by patch 03.

Thanks,
Leo

> If so it looks like we need to fall through and do a "normal" start to
> get all the ctxt->event_data set up.
> 
> > +       if (flags & PERF_EF_RESUME) {
> > +               if (etm_event_resume(csdev, ctxt) < 0) {
> > +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> > +                       goto fail;
> > +               }
> > +               return;
> > +       }
> > +
> >         /* Have we messed up our tracking ? */
> >         if (WARN_ON(ctxt->event_data))
> >                 goto fail;
> > @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
> >         return;
> >  }
> >
> > +static void etm_event_pause(struct coresight_device *csdev,
> > +                           struct etm_ctxt *ctxt)
> > +{
> > +       if (!ctxt->event_data)
> > +               return;
> > +
> > +       /* Stop tracer */
> > +       coresight_pause_source(csdev);
> > +}
> > +
> >  static void etm_event_stop(struct perf_event *event, int mode)
> >  {
> >         int cpu = smp_processor_id();
> > @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
> >         struct etm_event_data *event_data;
> >         struct coresight_path *path;
> >
> > +       if (mode & PERF_EF_PAUSE)
> > +               return etm_event_pause(csdev, ctxt);
> > +
> >         /*
> >          * If we still have access to the event_data via handle,
> >          * confirm that we haven't messed up the tracking.
> > @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
> >         int ret;
> >
> >         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> > -                                          PERF_PMU_CAP_ITRACE);
> > +                                          PERF_PMU_CAP_ITRACE |
> > +                                          PERF_PMU_CAP_AUX_PAUSE);
> >
> >         etm_pmu.attr_groups             = etm_pmu_attr_groups;
> >         etm_pmu.task_ctx_nr             = perf_sw_context;
> > --
> > 2.34.1
> >
> 
> If the possible issue above is prevented by perf internals
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

