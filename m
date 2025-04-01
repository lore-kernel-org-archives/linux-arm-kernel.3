Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEA8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoMDKExd/0DHBDdQYNCjd1xpr7uBzJ6GzizlZJKTOo8=; b=mPbs1FhV8NYMDyFrERJ2fy0P5c
	TPGbh8Auy42eyvKf339XlroWIFELqcAddPydby9SgVlF1KbpLVARjFnngznvor+QWUrX6e9/IlgkP
	jGkK8rFsNMHi1sYCK7TflJG+1UK/wkFng4RMlZEfQiCSl+qIIvMIf5kYUN1Q0LhI+84MQd3x7eKCO
	Ok9xPI8SYkftsmTW2Efs18eWemSrfuJZEyQi18P1jAF7QOe8iTTfTguPgGbLC36AdGHnV4rB3qpjC
	ZXEsBr6Ax/aFCegjKkkQTW+j8gCQWf/cnTx2mxnPxETjruZ4/nXiFTSQejrO4Mkagxux6H/mqM+rK
	5sT4bS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzckQ-00000003bjD-0Vg6;
	Tue, 01 Apr 2025 14:37:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcic-00000003bRj-2sKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 14:36:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-225df540edcso121984345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743518158; x=1744122958; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LoMDKExd/0DHBDdQYNCjd1xpr7uBzJ6GzizlZJKTOo8=;
        b=dQjUb4A/AWxhrSKL/pbuod6RHlclRc3yiigrJHnuJxeDTblA8SA+KfjMK2tYaredz8
         uW0lSlEJ0Ej0de5Y7R9VJ0m9wa050xpFapcBrwaEC6WMh2Cthz99anjSw4hwVJFquNIA
         A0xqFhfrXJZ1Zdq0wcDCsmria6C8+kVAGQxHUnsf1W4oYWFB5dUCe/IIX7O3bYcFgwLs
         0quwpIV/94dQy5N+9wcyFoJbo1Kg+wwn9UlzBKSNbhwCbDeKv8vYulSB7AL79/9nbZzH
         8uKNSY6VDWm18JNdWRjpVx/U9YX2fOTdeED/NaUL4Ep6gWraKDIPOijIz/aaU55kf+CZ
         4QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518158; x=1744122958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoMDKExd/0DHBDdQYNCjd1xpr7uBzJ6GzizlZJKTOo8=;
        b=AueiQLrJuJ+HMPmVC7v6xNpjqPc3jwLqxSBN76SuSZd1wx+ASZ6/6Ld0REVojhFAVs
         r0Oj92JnouDBHfl6BqT6wrqc/1FwNyy1y+6JMCBUupmAy+baZCw9+eHxfGE0SHcAqMzk
         oBDtsTj9B1TxDKIq41SmCYXgx4oROgrMVPS/qPpqkRJeLCo3+qlQn0jgzv5q+hUi43pU
         IBPN1xeZZVTSstiUo/n6hnejke4nGrJavR2wB7EWgwzr/TOz9neg16ZSPONgelzGHUzj
         ZyDa/7/pieDPvECpDk532X8bQk1TyJbdY+4QS/VczIrNmJx+1XtVitxTpstdetil0UZl
         Mx/g==
X-Forwarded-Encrypted: i=1; AJvYcCXVpkkgiRM241SQVbh97zH+DjYP7L1xn4+YzFR8f96xknHSjinTLkuyxXxPqdmYi8wYZgfRPuRYFSmtVFW3YN+E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5gn98aPRM+p8T8mLqbKh2/xY6qf2+9rbk2aYp80Tcbk4BW9Os
	8QmLVCquyCSoyZOWb4QHtD8A/QI8w+Flr4RM7PFpE4C5EB33w6muKp5dnFa2nIocY8N2zXH5AuR
	mlH6D58ydRYHeYCagRdkBKLmaGhwiQB2PbxfFYg==
X-Gm-Gg: ASbGncv9VTtdn6rKY0agERLXw9XiV0wGfFtQ8C3Ny4ZubdOqp2eiZXEH0gdr/kxph9n
	WH63DVpviyklHPueuWpmSETJTlk2a+qk0T5lmkejlBPor31MayXyxen32egEel+t7TX0TFrBV55
	2/kwEwroofW+PZB3FBSt2Angn78iE=
X-Google-Smtp-Source: AGHT+IElYmfVb2yc9aONM2WA1fcc0/ZsfWcagvHUfiuxnFsCoq1ML/YcfpJWjED2Sr70PTdeBFSXfVPfj6mWtcfTrTQ=
X-Received: by 2002:a05:6a00:391f:b0:736:9f2e:1357 with SMTP id
 d2e1a72fcca58-739c43b578cmr278533b3a.12.1743518157532; Tue, 01 Apr 2025
 07:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-6-leo.yan@arm.com>
 <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
In-Reply-To: <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 15:35:44 +0100
X-Gm-Features: AQ5f1Jq5eJSb33lj_lNuU5GhQT-ygaUHLr5aCzHY0xeQqpsFwQFKMr8XTLIXVPw
Message-ID: <CAJ9a7ViUOZEyvqe-KGc-UdhmkqXpPdSeBWjk-=u1tAjFKu5Y+A@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_073558_734157_61B52C27 
X-CRM114-Status: GOOD (  31.22  )
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

On Tue, 1 Apr 2025 at 13:52, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 11/03/2025 17:04, Leo Yan wrote:
> > Due to sinks like ETR and ETB don't support interrupt handling, the
> > hardware trace data might be lost for continuous running tasks.
> >
> > This commit takes advantage of the AUX pause for updating trace buffer
> > to mitigate the trace data losing issue.
> >
> > The per CPU sink has its own interrupt handling.  Thus, there will be a
> > race condition between the updating buffer in NMI and sink's interrupt
> > handler.  To avoid the race condition, this commit disallows updating
> > buffer on AUX pause for the per CPU sink.  Currently, this is only
> > applied for TRBE.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   .../hwtracing/coresight/coresight-etm-perf.c  | 43 ++++++++++++++++++-
> >   1 file changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > index 2dcf1809cb7f..f1551c08ecb2 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -574,14 +574,53 @@ static void etm_event_start(struct perf_event *event, int flags)
> >       return;
> >   }
> >
> > -static void etm_event_pause(struct coresight_device *csdev,
> > +static void etm_event_pause(struct perf_event *event,
> > +                         struct coresight_device *csdev,
> >                           struct etm_ctxt *ctxt)
> >   {
> > +     int cpu = smp_processor_id();
> > +     struct coresight_device *sink;
> > +     struct perf_output_handle *handle = &ctxt->handle;
> > +     struct coresight_path *path;
> > +     unsigned long size;
> > +
> >       if (!ctxt->event_data)
> >               return;
> >
> >       /* Stop tracer */
> >       coresight_pause_source(csdev);
> > +
> > +     path = etm_event_cpu_path(ctxt->event_data, cpu);
> > +     sink = coresight_get_sink(path);
> > +     if (WARN_ON_ONCE(!sink))
> > +             return;
> > +
> > +     /*
> > +      * The per CPU sink has own interrupt handling, it might have
> > +      * race condition with updating buffer on AUX trace pause if
> > +      * it is invoked from NMI.  To avoid the race condition,
> > +      * disallows updating buffer for the per CPU sink case.
> > +      */
> > +     if (coresight_is_percpu_sink(sink))
> > +             return;
> > +
> > +     if (WARN_ON_ONCE(handle->event != event))
> > +             return;
> > +
> > +     if (!sink_ops(sink)->update_buffer)
> > +             return;
> > +
> > +     size = sink_ops(sink)->update_buffer(sink, handle,
> > +                                          ctxt->event_data->snk_config);
>
> I believe we keep the sink disabled/stopped in update_buffer. We need to
> turn it back ON after the "buffer update". May be we could use a flag
> to update_buffer() to indicate this is "pause" triggered update.
>
> Cheers
> Suzuki
>

The sink is stopped to read data, but also important is the
enable/disable refcount. The only time that "update_buffer" will read
is if the sink has a refcount == 1. These are ultimately controlled by
enable/disable path - which will not occur during pause/resume
operations.


Regards

Mike

>
> > +     if (READ_ONCE(handle->event)) {
> > +             if (!size)
> > +                     return;
> > +
> > +             perf_aux_output_end(handle, size);
> > +             perf_aux_output_begin(handle, event);
> > +     } else {
> > +             WARN_ON_ONCE(size);
> > +     }
> >   }
> >
> >   static void etm_event_stop(struct perf_event *event, int mode)
> > @@ -595,7 +634,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
> >       struct coresight_path *path;
> >
> >       if (mode & PERF_EF_PAUSE)
> > -             return etm_event_pause(csdev, ctxt);
> > +             return etm_event_pause(event, csdev, ctxt);
> >
> >       /*
> >        * If we still have access to the event_data via handle,
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

