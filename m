Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DCC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJsLeD6lgFKMBvtHYkyhM89bgWS3aRtj9tm/3qhx9hI=; b=WwUAog2hsu4zi7GHGeIW5/BiqF
	D2xOTnttKKasY3yo1dEMVel2y+RZUoh5/apDtdkQd+cbSu5IwvkK2Lt2Zf4GQeVeZso1/k1GCILDE
	f9XSbD+G2aTdEjEA6cfvrMhlXg5fZLczJsOIsIN1ythxP045uYZqEQsPPJbv/rvqAAtJR6zOgEea4
	cjG0OewZyjqHRz/XVidyrwb8WwhdPwUBBVpaxOQz2zMI/xxRST4hTF4mIOC/gVfRDBcr/7FbSajef
	dNXd5DqwTgURpXbj2E5DI89pK2fjU6hhRAEwYNWmieQFpwSK/wPat9l7WO73LzaziVIF1w6MtQT/z
	OSbudVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzttO-00000005b5u-3IYx;
	Wed, 02 Apr 2025 08:56:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztj4-00000005ZrF-3REj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 08:45:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2260c91576aso102207175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743583534; x=1744188334; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJsLeD6lgFKMBvtHYkyhM89bgWS3aRtj9tm/3qhx9hI=;
        b=wWABDaq1pZ23GUPpdcQ5EeU2I9UA5XU+vnuQz9CWUXR59bqoIf+K9r7AKeVYbRrnYZ
         oRk8LZQcQV/mfKR54SOs4cYTuFmdrB1b8M+GR97YB60ouaAv/Yg6zeBtNJ+G1O7qixu6
         8PWQ6kw5aqLrudOrKf7RHsTxeCCVBEjIc4g1HukxwaLUySVtwE1JTe6jDg7Ikb9cNUl/
         blcohppIu7a89RQJS7w6KJrFZe1Heq7vqN70fioTs5284HYLrhuMHR+4ZkEb1LT5uev7
         MIjxgzfCWtYXvQNbl7iUJjm7Hs/i988iduXRtf1oHx1/HjwSGiCuTKNCkLs8MD8AlskC
         lCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583534; x=1744188334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJsLeD6lgFKMBvtHYkyhM89bgWS3aRtj9tm/3qhx9hI=;
        b=wetLKRIVXdOmulXAyqMg5nUYnCIko9fq65B3qGiHzCTW3Ko85Vl1AKSodYsD7v4Cyy
         SG2idpo+jqC/n9dMo7XbCs7rhqkvMfK3zmgZRNVr6pz59Y+fHPUI7qd3ZVTKIaOY356D
         qDHHvBdENlLedb51iod8hfcKo4s9wcYAReleQ6kxbHeqebafnis2qiZhsJC80v/fw2Dx
         3d0Ma3ePs4gpiop2kNgSH/1Cu5O2Ky8WZoGpEkHEt8BmjncYwM/1Fsx5/TtKkI4z4pq5
         kHwVj5rxL7Js0HvXbIwAgBfVgdqdxsQ3WfyLS/xCsnIdXQ8cry6sHzXgqQ4JR0V5KgBd
         29bw==
X-Forwarded-Encrypted: i=1; AJvYcCXhR8AvdBLRZFK7AdDKZhqn2DymIIhkvVaE3bH/3ZOZ4DybljAxn/ct4CCsN+EBINixvFgg+vqC06HRnCzfKLg2@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3hApxiuN0hT4LAZjCR7O8+a2X5HcerIB9kThKZAfsTXWOWwC
	2asMclnCi99zuldwB+N9Fw2ZJlF9PbErB1+OtzEB7AdDyiDx20y2bRYS8dOxmqrPTRLiKTf2pK5
	5Ff3aZwp4qPbJitLPQ0jWmqZBpXQZdQehztBOGw==
X-Gm-Gg: ASbGncsodmOQnaowdkEiAzI/DRgAu4dIOJVoQrAlthAfUo1/yaC/xtvk3wgBQAfbs6F
	OtFD61PtgMh+O3YUb4IXctkjCGt0QednVpKI0Uwz7A25tOhJLexOSYjKGS1nVa2EmEVEDH3bGwm
	Tu7bt3svKEcHGDebxc+INS/4a5L5I=
X-Google-Smtp-Source: AGHT+IHI6Yu/hcdMXCreLSpHVh+HBTcQtrbpLe5Yl5Ua0D4HJd6y3JEpPE+J4Y6K6IQOUqDHmajJ8A4Nn/gDke9iJXk=
X-Received: by 2002:a05:6a00:3288:b0:736:57cb:f2b6 with SMTP id
 d2e1a72fcca58-739803aa740mr26454210b3a.12.1743583533738; Wed, 02 Apr 2025
 01:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com> <20250401150019.GC115840@e132581.arm.com>
In-Reply-To: <20250401150019.GC115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 09:45:20 +0100
X-Gm-Features: AQ5f1JpVKguSRw3Soam_GH8e7qCPQbsLVx7D2P5cFerAhYuRpuHvAGuo7V2FHvg
Message-ID: <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_014534_872112_36768C9C 
X-CRM114-Status: GOOD (  30.71  )
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

On Tue, 1 Apr 2025 at 16:00, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Tue, Apr 01, 2025 at 01:50:52PM +0100, Mike Leach wrote:
>
> [...]
>
> > >  static void etm_event_start(struct perf_event *event, int flags)
> > >  {
> > >         int cpu = smp_processor_id();
> > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > >         if (!csdev)
> > >                 goto fail;
> > >
> >
> > Is it possible here that the first call to etm_event_start() also has
> > the PERF_EF_RESUME flag set?
>
> The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
>
>   etm_event_add()
>     `>  etm_event_start(event, 0);
>

When I looked at the vague comments in the perf source - it seemed to
imply that ->start() calls could overlap - so the associated event
that resumes trace could occur at the same time as the initialising
start from paused for the trace operations.

If we are guaranteed this cannot happen then we are good to go!

> Note: for the first call, the tracer should be disabled if
> 'event->hw.aux_paused' is 1.  This is ensured by patch 03.
>

Yes - I saw that.

Mike

> Thanks,
> Leo
>
> > If so it looks like we need to fall through and do a "normal" start to
> > get all the ctxt->event_data set up.
> >
> > > +       if (flags & PERF_EF_RESUME) {
> > > +               if (etm_event_resume(csdev, ctxt) < 0) {
> > > +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> > > +                       goto fail;
> > > +               }
> > > +               return;
> > > +       }
> > > +
> > >         /* Have we messed up our tracking ? */
> > >         if (WARN_ON(ctxt->event_data))
> > >                 goto fail;
> > > @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
> > >         return;
> > >  }
> > >
> > > +static void etm_event_pause(struct coresight_device *csdev,
> > > +                           struct etm_ctxt *ctxt)
> > > +{
> > > +       if (!ctxt->event_data)
> > > +               return;
> > > +
> > > +       /* Stop tracer */
> > > +       coresight_pause_source(csdev);
> > > +}
> > > +
> > >  static void etm_event_stop(struct perf_event *event, int mode)
> > >  {
> > >         int cpu = smp_processor_id();
> > > @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
> > >         struct etm_event_data *event_data;
> > >         struct coresight_path *path;
> > >
> > > +       if (mode & PERF_EF_PAUSE)
> > > +               return etm_event_pause(csdev, ctxt);
> > > +
> > >         /*
> > >          * If we still have access to the event_data via handle,
> > >          * confirm that we haven't messed up the tracking.
> > > @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
> > >         int ret;
> > >
> > >         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> > > -                                          PERF_PMU_CAP_ITRACE);
> > > +                                          PERF_PMU_CAP_ITRACE |
> > > +                                          PERF_PMU_CAP_AUX_PAUSE);
> > >
> > >         etm_pmu.attr_groups             = etm_pmu_attr_groups;
> > >         etm_pmu.task_ctx_nr             = perf_sw_context;
> > > --
> > > 2.34.1
> > >
> >
> > If the possible issue above is prevented by perf internals
> >
> > Reviewed-by: Mike Leach <mike.leach@linaro.org>
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

