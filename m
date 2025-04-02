Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B5C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naxnhgiEmtMHzZrZpCu70t6iSq9lmIgiS4+IzBnK+fA=; b=QTTJ3kljPw6RUQ4al+B0O/nwwQ
	2/A3wCjmUbOGI5r8Jh2gF1JTGkHl+mpj2sB/SIYkEr3sTUUj9rErxp4efkr7m/2o5G5BYS0N98ESX
	e1sw5GuFkB7MDdigHgVvb29oq7cZ9pfMBUsYOaYJ27W/nlxP2PSQ8K9ph7vVghDMgyzh4UNLUOdGW
	R1qLBXeU4RMDH/dTm+ngTEI63r5hRTmIFZJOza4vnlR7c6fwUVriCSdFqXP/uqyFOsuj40E/W2RoA
	gIBxntawyVaGJVI8ETgf5eNuqW+iUHMNqEFWfXdbragNuI2dpn1pyBaW64/+fXPtsD3eMVwK9LOr7
	mFi07NSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxHv-000000065dJ-3ybu;
	Wed, 02 Apr 2025 12:33:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxG8-000000065GX-3nFU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:31:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B56D106F;
	Wed,  2 Apr 2025 05:31:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD12A3F63F;
	Wed,  2 Apr 2025 05:31:55 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:31:51 +0100
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
Message-ID: <20250402123151.GH115840@e132581.arm.com>
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
 <20250401150019.GC115840@e132581.arm.com>
 <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_053157_025877_D1B756B2 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, Apr 02, 2025 at 09:45:20AM +0100, Mike Leach wrote:

[...]

> > > >  static void etm_event_start(struct perf_event *event, int flags)
> > > >  {
> > > >         int cpu = smp_processor_id();
> > > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > > >         if (!csdev)
> > > >                 goto fail;
> > > >
> > >
> > > Is it possible here that the first call to etm_event_start() also has
> > > the PERF_EF_RESUME flag set?
> >
> > The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
> >
> >   etm_event_add()
> >     `>  etm_event_start(event, 0);
> >
> 
> When I looked at the vague comments in the perf source - it seemed to
> imply that ->start() calls could overlap - so the associated event
> that resumes trace could occur at the same time as the initialising
> start from paused for the trace operations.

Good point.  A subtle but important thing is the 'cs_etm' event must be
an event group leader, otherwise, the tool reports error:

  # perf record -m,64M -e cycles/aux-action=pause,period=10000000/ \
      -e cycles/aux-action=resume,period=10/ \
      -e cs_etm/aux-action=start-paused/u -- /mnt/sort
  Events with aux-action must have AUX area event group leader

If the 'cs_etm' event is the event group leader, it will be always
enabled ahead other PMU events.  So etm_event_start(event, 0) is
invoked prior to PMU events enabling.  As a result, this can avoid the
race condition you mentioned.

I confirmed with ftrace log:

  sort-901     [005] d..3.  1033.827186: etm_event_add <-event_sched_in
  sort-901     [005] d..3.  1033.827187: etm_event_start <-etm_event_add
  sort-901     [005] d..3.  1033.827283: armpmu_add <-event_sched_in
  sort-901     [005] d..3.  1033.827287: armpmu_start <-armpmu_add
  sort-901     [005] d..3.  1033.827288: armpmu_event_set_period <-armpmu_start
  sort-901     [005] d..3.  1033.827292: armpmu_add <-event_sched_in
  sort-901     [005] d..3.  1033.827293: armpmu_start <-armpmu_add
  sort-901     [005] d..3.  1033.827294: armpmu_event_set_period <-armpmu_start
  sort-901     [005] d..3.  1033.827298: armpmu_filter <-visit_groups_merge.constprop.0.isra.0
  sort-901     [005] d..3.  1033.827298: armpmu_enable <-perf_pmu_enable
  sort-901     [005] d..3.  1033.827301: armpmu_enable <-perf_pmu_enable
  sort-901     [005] d.h1.  1033.827304: armpmu_dispatch_irq <-__handle_irq_event_percpu
  sort-901     [005] d.h1.  1033.827306: armpmu_event_update <-armv8pmu_handle_irq
  sort-901     [005] d.h1.  1033.827308: armpmu_event_set_period <-armv8pmu_handle_irq
  sort-901     [005] d.h..  1033.827322: perf_event_aux_pause: event=ffff000207503e40 pause=0

> If we are guaranteed this cannot happen then we are good to go!

Now I think we are safe, right?  ;)

Thanks,
Leo

