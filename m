Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27422C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvbRn7YC9mzQbdZ7W3ysAZ2+Ab46wGRVWzBQLItqLR4=; b=xvfZgt3XkW8VEO0kx59niNJA1v
	ey+3Z96ay0TQ2qB0NI/MtqKAT8kZjqa7Fv+EzVyadBQDuuf3EDs/4txgineDj33YRYAEtWOxEOxz9
	cucCmvzwlq2+D3ZMHNMnyvId++OT/D9OQnIwfOeidpauUOSJCgTlJDLZhXNcUzkoFXDQXyl/llgi/
	echVhxteDh15XX82e7DL7pavjX15XeDkB1j1uv5aAkHns3TBoDUPzz9lIexiosfdY8sPQOa4Z7rhv
	vEU41gP+LP7IQtK+Ud8GMaivhoroBsQnN7QOtzx4PpizBF43rGCWx7OshivtTx3x4FIFf2sz6yzDd
	1Fhn84VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OTm-00000006SpL-32oi;
	Mon, 28 Apr 2025 13:25:02 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9O1N-00000006Hmq-2Iv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:55:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-af59c920d32so3051982a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745844941; x=1746449741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wvbRn7YC9mzQbdZ7W3ysAZ2+Ab46wGRVWzBQLItqLR4=;
        b=PsLhoUVNpK8vN5wceVyeqrWvOiarND5d22U48AqEGArqv/409zqGXJ+0V2MEYzQbI+
         yzpBPt4cGu89EJ0VVm91VaOMT+W5K+ZZkSpZd0W0NkIdBfXphIUeia6AX1PjbueJkAE2
         FtjUr/0ZE7rW7/CYLoaNBvUquwvWDT4jxDlQibzB/DM5bKJb2IqpFwGaTKU9sMRl/s6Y
         abHdxp5SF4wI+69OAxG2CqUGR0mX+TmsMNaq7IEOfCDtIHPVYMenBjeQGIP4/U3pEAPy
         LTRNWSOC/Aqy7Idy1o81Nk579UY8XiyDA1N1G3zolThezwvHxpFSLq5s8fr4lGozeT1z
         idyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844941; x=1746449741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvbRn7YC9mzQbdZ7W3ysAZ2+Ab46wGRVWzBQLItqLR4=;
        b=qrVmA5cRuiP7P1K1OoPIi7laJGXRdnVxOeOZaPkW4nu2onbtSJFOqSetkuBd1g6jTm
         h+UIon5w8dQssIu/UdEl08jVjMjffxgk3u6gwgCGBYvjfzLKC5rFBgG14CL8Stbmv/wJ
         zSqPqMgRFyGjnOhu9+vwxZc3mqMl2/PajfUHLcIeM1UDl9TIyFwYo0YCQgalnuAkMomR
         3wtHFYn1ItCEraVei2cB6QYfuF4d/0wRvJpVt9vTfwe6CVPw2tHzH1ixExr9tukjOJKO
         IViztbQpH0rkh73BrOsGjxuUR3fblR0r6pShqzE4PwzFDBrPxQWPjAvWLYojcE2x3Nxh
         4qSw==
X-Forwarded-Encrypted: i=1; AJvYcCWNRXByw0qq+8brNPAap6iJ/K9RAZ+/d9g6D8CvaineUIuR6vkKHIwLE4p9wpEB2dwArA628xhQBm6Zfn1LjKRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHzroV4J3om1b31gAY2S9rXwz/yMwEzLKaf1KlNrzfl4xFazr
	3SYQ8O48mcpQy+4vNA//FTDF4mdzOsh0L0jIjaqFsZ1EaHAP7EKkAiM2ZnoiIFRS5CI9E96GSzh
	3pTw/fTIa0tUhuNi2OnE1zMajJrwlBZ+vYfaY4wtcxA8TEnJZ
X-Gm-Gg: ASbGncuvNgQHfUC4CmPkpknNcu6aHsT7pf0gkhxoq9nZav+7vnjeI5Cr738pECCXQrP
	AB2VusR6npi0Yso+iNngZgUc+VvDxFOtjM6YhfAVomihqC0r2On5Am4gZu7LD7V5IiikrstXQdT
	c4tapmmVHExrk+S1cmMm5HE5E=
X-Google-Smtp-Source: AGHT+IFsRzSs0/8SuaOOM09eHBrpa86JZSVgpTwx3qI3UUsl6k0oDmTRHno7i+/pYyE5jVyYuFkxPQ+4oAe07LdnvXk=
X-Received: by 2002:a05:6a21:998e:b0:1fb:e271:82e2 with SMTP id
 adf61e73a8af0-2045b6e9fa9mr15917706637.11.1745844940510; Mon, 28 Apr 2025
 05:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com> <20250428122408.GD551819@e132581.arm.com>
In-Reply-To: <20250428122408.GD551819@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Apr 2025 13:55:29 +0100
X-Gm-Features: ATxdqUFPoxNwE9G7_rjmhNqUN6nj015J3cVOQG394WFzBIrfMCpN0vkmhzTPUQU
Message-ID: <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: Yabin Cui <yabinc@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_055541_600392_ECC9A250 
X-CRM114-Status: GOOD (  38.52  )
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

On Mon, 28 Apr 2025 at 13:24, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi all,
>
> On Mon, Apr 28, 2025 at 11:53:26AM +0100, Mike Leach wrote:
>
> [...]
>
> > > > > @@ -362,6 +362,10 @@ enum cs_mode {
> > > > >   * @alloc_buffer:    initialises perf's ring buffer for trace collection.
> > > > >   * @free_buffer:     release memory allocated in @get_config.
> > > > >   * @update_buffer:   update buffer pointers after a trace session.
> > > > > + * @percpu_save:     saves state when CPU enters idle state.
> > > > > + *                   Only set for percpu sink.
> > > > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > > > + *                   only set for percpu sink.
> > > > >   */
> > > > >  struct coresight_ops_sink {
> > > > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > > > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > > > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > > > >                             struct perf_output_handle *handle,
> > > > >                             void *sink_config);
> > > > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > > > +     void (*percpu_restore)(struct coresight_device *csdev);
> > > >
> > > > Again - why this percpu_* prefix ?
> > > >
> > > > >  };
> > > > >
> > > > >  /**
> >
> > I do not think this is the best approach.
> >
> > The TRBE driver has its own power management registration functions,
> > so is it not possible for the save and restore should be handled
> > there, through a PM notifier, just as the ETM/ETE is?
> >
> > Drop the unnecessary DT entry - TRBE is a per cpu architectural device
> > - if a TRBE is present, we know it will power down with the PE.
> >
> > The CoreSight architecture permits an ETE to drive trace to an
> > external sink - so the TRBE might be present but unused, therefore
> > hooking into a source driver that may not be driving trace into the
> > device does not seem wise..
>
> Sorry I jumped in a bit late (I saw the patch at last week and it is
> on my review list).
>
> I would suggest to hold on for this patch.  I am refactoring CPU PM and
> hotplug in CoreSight based on the CoreSight path.
>
> The idea is when we do CPU power management for CoreSight devices, we
> cannot simply control individual devices.  Alternatively, we need to
> control logics based on the linkages on CoreSight path as it can reflect
> dependencies crossing the components.  For example, for a CoreSight
> path, when running into CPU low power state, we need firstly disable
> tracer, then links, and at the end sinks.  When CPU resumes back, we
> need to use the reversed ordering for turning on devices.
>
> As a result, except the tracers (ETM / ETE) should be saved and
> restored contexts during CPU power states, other components on the
> path will be controlled by traversing CoreSight paths.  The benefit is
> if a component (e.g., a link or a sink module) is shared by multiple
> CoreSight paths, then the component can be disabled or enabled based on
> reference counter.
>
> I know I am a bit lagged - as I also need to support the locking on
> CoreSight paths.  Please expect in next 1~2 weeks I will send out
> patches for public review.
>
> > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > restore if currently in use.
>
> If TRBE PM is registered as a seperate PM notifier, a prominent issue is
> it cannot promise the depedency between ETE and TRBE when execute CPU
> power management.  E.g., when entering CPU idle states, ETE should be
> disabled prior to switch off TRBE, otherwise, it might cause lockup
> issue in hardware.  If ETE and TRBE register PM notifier separately,
> we cannot ensure the sequence between ETE and TRBE, this is why we need
> to do the operations based on CoreSight paths.
>

I believe that the architecture requires that if the disabled TRBE
cannot receive trace then the ETE should regard the trace as having
been output (A1.4 ETE spec). Incorrect sequencing should only result
in missing trace, not a core lockup - unless the implementation is not
compliant.

Mike

> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

