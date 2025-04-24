Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B310C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbeLnI23O/2RXZovesa/I0oinrI/iA9H2L6qN8Jup2k=; b=FpMS3ORmjHA8CZpYb6DNeJDI5t
	p5TPX6ITjduVslNX5mEkDfkNpjm353/3OUsKxa74QgGaMtLgmGIZmSxyzYVthH/P1cVZduVsGyr1e
	Y8Nc8jnxS0wm+GKPepXJTiXw6tnGJ7lVziauQp+4IGFQcFbGxqe77hcBfIaJXIZ2V1kRq3rXHtffA
	mUW+rRD5Gt+hvbNJUvl+0O9i2umVcoHC1HgYY/9t+l0xvPWsF74quNJFl1SN6MhCOuU2fRFlBS8Ps
	bTt4I0NPo/qDOqtAlx2cDAZOizQ7s854JrNXjbGby4HISCycayuVWJpzKXUgq4LUO8Cf8xwujAQQw
	KLI8o5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80OE-0000000Ettr-01oj;
	Thu, 24 Apr 2025 17:29:34 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80MN-0000000Etao-04H3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:27:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736b98acaadso1369547b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745515658; x=1746120458; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VbeLnI23O/2RXZovesa/I0oinrI/iA9H2L6qN8Jup2k=;
        b=sjhZFjClPypcWtRNEM19g9HSR+4Hx1nsylnJbujVPBZy3UkDKsiBs3B4f/mY08Gzfj
         QhmI3I830N7pLv4LHabVfPmeKCU+vkvOSwTRBnkZtqY/acV7F5zypnqla+RkAGCNO+YG
         lb0KSdSnlx+btDnHtqjqu5+xlgnwoU2e/8F0QHTkk5THbNO0cq0MlXuzCBiSPf6DR9T1
         Uu+/tejgGmQWy4OaR8YDqOr+85e2xul8ARm78g496zJhG7ckBgBs7dqdVuQ3HHot0gcb
         xnRZNZ5By0r3R3DlUduB02NkPX4G/JfTSRqTt2XY+wtmVYMZWp/1N+gsmOoXqZLzDCnL
         q9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745515658; x=1746120458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbeLnI23O/2RXZovesa/I0oinrI/iA9H2L6qN8Jup2k=;
        b=e1bR4DjBW/5T9Qjf7ajmzm8RZ+zrFu6qGSEhCKD25zrWvwm3UHvjLqrbSfNGl6Sptk
         VlWgCzRuKMRXqo6n6ORNQrwVexJmdOJ13CPGxjO7lFQw905Z9nF8jP582BZDCeYgxfH1
         3SugnwdFFl4EzrCMla5mrnNr8swP2sgjz6rRrHzQttzvBbUf08m+qEt7wtGMyPZzzrIN
         KczOSQx+d6HqR+bwwL/jeugwJCkxF6N+q2/kxRkwOkbjV17UkxdrgxHGlfpMX4SJmkmh
         75L8KxGJ5OaJvmx5i3n1Eyz27dThTXgRq31oRpSuPGOjYpkgE/111xEPpGlQw77qFCTz
         CJSA==
X-Forwarded-Encrypted: i=1; AJvYcCWDMKn+8896g4fjjExNR3VEIDLrrgd5RBYhUiD/bdrPi4E9vQCKrlrzb7bWNLbHT3Q6bg6+1PaezdmkLOZomFAK@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdnMA0bMW/T+IanJ/uyVJ/T9O4pdC6vW/2DsRKqgYoSsBI1cw
	GgWsicAKQ7Mo7D4WhDpxW1BFv2672pI0BmRtupOadVIrMSovFx3SeXvUvrAvpH0i+6AKq5sz6E2
	S5i7E7Ut12OLGjGrHOtoQpDyvdhs1mNQudwrO4g==
X-Gm-Gg: ASbGncsXd5MdPtwFBcdX1yrSRPU4FxrbJBMXW5/QplWemn2ePyaH8+BaGs5+AjQNwvH
	aPA3evXzmrKl650KzLZNEH++j+sPQjf7PxNgM97igAqNcZ1rFpkHV3Aw6uYTqY9TLu0bE/0RpZ1
	v/+eDhcWAvwE1Z9DqfNq30wJjXwcFAhELTA39vBI9htHcgOmBhSLSYITZZqHR6Iiq3RQ==
X-Google-Smtp-Source: AGHT+IEC4h+n6V+A3Wkh5EyBqD0wTFX3L2FNrC/0h1SWeKXUdUnLiYu48vedhleXRiwH7v+CaXpMm7cUsFfYX6TKBn0=
X-Received: by 2002:a05:6a00:80d:b0:736:34ff:be7 with SMTP id
 d2e1a72fcca58-73e24acafe4mr4147250b3a.15.1745515658003; Thu, 24 Apr 2025
 10:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250401180708.385396-1-leo.yan@arm.com> <20250401180708.385396-6-leo.yan@arm.com>
 <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com> <20250402155841.GO115840@e132581.arm.com>
In-Reply-To: <20250402155841.GO115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 24 Apr 2025 18:27:27 +0100
X-Gm-Features: ATxdqUGBFz5B9fpLBwG1Cv3FoCD1MAVXU7_kEqsKCNI9bWn99Dnw_J5zgIlpHr4
Message-ID: <CAJ9a7VjDe9U9RufKfuBAW9gAUdiWHyErxqsV=3gL=oaj7uS12Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_102739_060160_1D62FA50 
X-CRM114-Status: GOOD (  28.14  )
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

On Wed, 2 Apr 2025 at 16:58, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Apr 02, 2025 at 04:05:10PM +0100, Mike Leach wrote:
>
> [...]
>
> > > @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> > >         unsigned long offset, to_read = 0, flags;
> > >         struct cs_buffers *buf = sink_config;
> > >         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > > +       struct perf_event *event = handle->event;
> > >
> > >         if (!buf)
> > >                 return 0;
> > > @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> > >          * is expected by the perf ring buffer.
> > >          */
> > >         CS_LOCK(drvdata->base);
> > > +
> > > +       /*
> > > +        * If the event is active, it is triggered during an AUX pause.
> > > +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> > > +        */
> > > +       if (!event->hw.state)
> > > +               __tmc_etb_enable_hw(drvdata);
> > > +
> >
> > Think that the  refcnt should be checked here too.
>
> No, ETF driver uses spinlock to guard the entire region for checking
> refcnt and updating buffer, here it is still in the same critical
> region.  This is why the checking refcnt is not needed.
>
> > Does the  ETB case need to be handled? - somewhat confusingly the
> > coresight-tmc-etf.c file handles both ETF and ETB.
>
> ETF is for the link mode, and ETB is for sink.  Updating buffer is only
> for sink mode, this is why here I use __tmc_etb_enable_hw().  Does it
> make sense?
>
> I also have a question for the paired operations (this is applied for
> both ETF and ETR drivers).
>
> Now the flow is:
>
>   tmc_update_etf_buffer()  {
>
>     tmc_flush_and_stop();
>
>     update buffer;
>
>     __tmc_etb_enable_hw();
>   }
>
> The operations are not paired between tmc_flush_and_stop() and
> __tmc_etb_enable_hw().
>
> The tmc_flush_and_stop() function only controls the TMC_FFCR register.
> I'm not sure whether I need to extract the TMC_FFCR operations from
> __tmc_etb_enable_hw() to use them for recovery in the update buffer.
> Or do you think re-enabling the hardware in this patch is the safer
> approach?
>
> Thanks,
> Leo

Looks OK to me.

Reviewed-by: Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

