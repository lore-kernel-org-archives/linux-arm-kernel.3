Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60276C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=; b=2ZNHmGZfD4MpsCMxRz/th53WRI
	0PW4ZWZHoPKxvxytH9dZMPx24I1PEB+i++ScxyUJ7J2Uh4wgpcDDdZuH5bbQwviqtSgEVjUbNRpi1
	2o0AjxZEE1ChOrCF0rUfwMzfX4t+ZtptpypxHvjFrg05sHNetpMaFSKgoXxbrsc2Y/oOppexRPey+
	rpRnDTQ0kFfH+jg2kHmV2c6O494RTnbEPOs52eyvi5tcNAoYsb/TmfnRs5ldhlI7MhD+Pziz4s09I
	ozwF/PAwF2oghVjl0vt8/bNLwJPsox3H7piSGKV+RRQ2pfwaFDRMlNz5ikS0BMaz7SWNNv734anyz
	y6517ljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxhr-00000006AnG-10MF;
	Wed, 02 Apr 2025 13:00:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxdn-00000006A6P-0ViN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:56:24 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7399838db7fso90783b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598582; x=1744203382; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=asS713v4iMZ2Kjmcq+f5p8B4XHk31b1UVZ9xM6Bd0igMPC6CxG5yELm4QfOy3VSu3l
         w2I2xZWqT0EL9cm9Sh1YO1+bT34f2KWWCcM9J8g3gZeYmpBa+hXwflLwP8nzPGhoECaf
         B1s82EDLSu6857YDW7f2ZG4nLZSoBrbXnpz2Y3HDfFGGva+eST2E08SQWqyzM7bQJavA
         uT40qUrq6paBEzkDe3GuTtJpVquVimQNt9V1xebfV1NIW62IMxeai8UC3Mx0HH/Nja98
         mxH3y8xXFgE6YzemJx8ZgjVe/TKFwGMgeE8v9OwkFX1BGJV6plW7YldiVyvvVqY1gExY
         +uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598582; x=1744203382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=gwmIE1ME7RGIxO77JcG/2tqGtjWWXxBcnxhn/sMg3MKEIAYfYOSDBcM1Ipvj4nrXv5
         uV1kQfMH6CaCZKtV2h0tV+AVTRDXCLKn4BGtMuHbw0+LfRdpW5JiDOiwS0aVeLKVodnW
         4m1rKdRSjtfouFJPpAWoVWjjeTUenly3j4kgdCVwY032/2yOVvm7xcKYiBP3RrAEef7v
         jI9lTMn10VcE1leifq+zi7x50OdA1DUd8t2MybzqZr5hb545mwaLwCwJdlCkbRmgHkYs
         zy8oqKqV5Wm3aS0PpjsQ0V5OV7zbSCz6OFHvLLHZ8hkVjjvvrKiS3XHdQr351LIeRQoD
         Khpw==
X-Forwarded-Encrypted: i=1; AJvYcCXrM/q5iJ4f51B3eacT8nIfS7U6zhC5dUIaWEiuosUmX/iRF8o6j7fOScGtYOO1OqEPyCja9yzzzjwmMKOVZ/AQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwgivROacMShOXu5sxWRQ2p3QraaNvL5jw+e3DI3MIvNm6j9SqJ
	8en726gW9RLbQK2TC+/cLGaPiFc7RTmDllFbiOI45CUim1HTTVhY2chB3xX4rzSD/De8VILl5d2
	9mhGM5jWLw+fbSyET5E71B6mtgg6UM8hyxp5Tlw==
X-Gm-Gg: ASbGncszaI7Qe37r0Ovyu1UVBKi50lN3y2NktXgpIagznDx8orI1xlQR57vA2fuYhu7
	aXzPSmAzqaMDvdjIs8hFQdArCsXLXRgg/946utEMU7k5Dz43B64Jt1BqPB7IzfU0Kigb/QIyKVo
	6HPzkJyUPu74h3GYj9TNRR+4XkO98=
X-Google-Smtp-Source: AGHT+IGMlc1egG12E4QIlDCeUIjS3K9est1MsL2qfp4chiKw3Ryx9LvLDjekChsuHSuaM4TLSX5zggbZyYhlR3rxBS8=
X-Received: by 2002:aa7:888d:0:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-739cb071691mr2504206b3a.3.1743598581694; Wed, 02 Apr 2025
 05:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
 <20250401150019.GC115840@e132581.arm.com> <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
 <20250402123151.GH115840@e132581.arm.com>
In-Reply-To: <20250402123151.GH115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 13:56:10 +0100
X-Gm-Features: AQ5f1JrKB1QjXuLoaBevwrVx7VtVcaXa0uY21BBclnMTNdvjzqyebSyzIueWZrE
Message-ID: <CAJ9a7VhOg6emwDMa+rZM4TqZcMPY=fYSxzb4EQVxOhY0T-tg_Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_055623_186492_16F64FE7 
X-CRM114-Status: GOOD (  26.54  )
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

Hi Leo

On Wed, 2 Apr 2025 at 13:31, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Apr 02, 2025 at 09:45:20AM +0100, Mike Leach wrote:
>
> [...]
>
> > > > >  static void etm_event_start(struct perf_event *event, int flags)
> > > > >  {
> > > > >         int cpu = smp_processor_id();
> > > > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > > > >         if (!csdev)
> > > > >                 goto fail;
> > > > >
> > > >
> > > > Is it possible here that the first call to etm_event_start() also has
> > > > the PERF_EF_RESUME flag set?
> > >
> > > The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
> > >
> > >   etm_event_add()
> > >     `>  etm_event_start(event, 0);
> > >
> >
> > When I looked at the vague comments in the perf source - it seemed to
> > imply that ->start() calls could overlap - so the associated event
> > that resumes trace could occur at the same time as the initialising
> > start from paused for the trace operations.
>
> Good point.  A subtle but important thing is the 'cs_etm' event must be
> an event group leader, otherwise, the tool reports error:
>
>   # perf record -m,64M -e cycles/aux-action=pause,period=10000000/ \
>       -e cycles/aux-action=resume,period=10/ \
>       -e cs_etm/aux-action=start-paused/u -- /mnt/sort
>   Events with aux-action must have AUX area event group leader
>
> If the 'cs_etm' event is the event group leader, it will be always
> enabled ahead other PMU events.  So etm_event_start(event, 0) is
> invoked prior to PMU events enabling.  As a result, this can avoid the
> race condition you mentioned.
>
> I confirmed with ftrace log:
>
>   sort-901     [005] d..3.  1033.827186: etm_event_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827187: etm_event_start <-etm_event_add
>   sort-901     [005] d..3.  1033.827283: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827287: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827288: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827292: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827293: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827294: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827298: armpmu_filter <-visit_groups_merge.constprop.0.isra.0
>   sort-901     [005] d..3.  1033.827298: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d..3.  1033.827301: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d.h1.  1033.827304: armpmu_dispatch_irq <-__handle_irq_event_percpu
>   sort-901     [005] d.h1.  1033.827306: armpmu_event_update <-armv8pmu_handle_irq
>   sort-901     [005] d.h1.  1033.827308: armpmu_event_set_period <-armv8pmu_handle_irq
>   sort-901     [005] d.h..  1033.827322: perf_event_aux_pause: event=ffff000207503e40 pause=0
>
> > If we are guaranteed this cannot happen then we are good to go!
>
> Now I think we are safe, right?  ;)
>
> Thanks,
> Leo

I'd agree with that!

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

