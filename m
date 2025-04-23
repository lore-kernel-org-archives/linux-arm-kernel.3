Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E3C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwoLC090KAiMN1YJGTa664tyM6EnyyhutxXQA6EbVAA=; b=1KC1SWqnFyjinLMVGB94ef8Sl1
	xQYo5+m+6ndIWsVNY2FiuNfYmWTKrZIbgy6TSpatNG4nHPD1jes2Nrp/UX0jXkE4WN/aZJ5r7jQ3i
	9EuMKG63fxoC6Tnog8Z4NPCOt1c+zJ4E2oi384o6aIUJVuStxmndxX7swTicjv7TEJP6EjOCLm2PI
	vWrAsoPbd4GBcpRVnHX6pgV6ggb49WgqiaBwsTvYnUFula1niinTEJCNzBagMHZHm8nt62WJYlN9G
	Z5kAkVsb+rScUoDlW+I79+LvRKxmy7pnZvjl34DlFq82AhyGXnx9jCGbe7mm2Hlw+RJvgnhqDaxNR
	JS2AuzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eHJ-0000000BQPJ-1aHV;
	Wed, 23 Apr 2025 17:52:57 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dYu-0000000BDYB-1iS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:07:05 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so1341076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745428022; x=1746032822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwoLC090KAiMN1YJGTa664tyM6EnyyhutxXQA6EbVAA=;
        b=iaQVMALUhhDvW/6/ZASrYAxDwNPAMDYaZiYA9zm6FaGPeVz3Du4Uyrxg3yiBfucL5L
         6VSPULmkCicthHRG+aTSL4+wTJWlySKUMuvJW2j6RbnIQvxoEgQQEnf3nDmrRuAydkyP
         BEd62pKeUMhj4HXHAdTIvWmWSeVaQ2iICCU944FSUvxjGZ3bBUAJxboIKnJpmYQdB2xJ
         esk5kLkwZjVL/lsmSrEXXRsnxSxjjmY1bW7ADqBWBEktvINNyo684exHOV48BLpj1cs5
         WAEc9ZTuQU/CoVT78iaAxTX/EbFfonbL1n2IHHA2sP4jtsVdmufhskE33UyeUIsybZRO
         MHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428022; x=1746032822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwoLC090KAiMN1YJGTa664tyM6EnyyhutxXQA6EbVAA=;
        b=gZOdr6wlNsexM3XQALUBsg50UQxWJzFDoOzYDZlGxN79U9BkPcKixLllFSavzRHSE5
         nj3ZJWT4aLQ1PqYD7xzgtk+auGes/Y+lZLo5sf2Z3GklsZO9Er9uxrFfPrb31x1WSHtv
         Gw8lVqia+8H05xkIPYQgdMzcQ2ayApGteJQqjMHoRietjHPAnU6XJta/8pAVIJ9H/eT3
         lKWdKlDQYPebn667WGQj6MS61Cft+cJf3Pv7LhdNZ4mI+OeQTy5foHzjOPYMKBc0jHZ8
         PCkiNCVXJFSezCSKVgR5J3oPsVzTc4e/sb+1vSrx6cOCeL3mImVH8jP9+0a4hY8pEF1Z
         mOIg==
X-Forwarded-Encrypted: i=1; AJvYcCUcV1sdcPekpaM9eUTUvQ7Bf4EGleBM5omaPonYO1Mg4js7Eq/uCMDvOrHIOfMo/bxHEb/EO/TQKfUD7iZA6uzG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Y643b4FNnebXPm5rdRDAeftJ7g9IWAPwikg3uc0W3tm9u7la
	eOZQHdVpMHQZYSqsDSxAJNGAnvg8FrZT6XBo1ffA4tahkjR0XiYg34FWFlHnvzvMXghKzDGacA3
	7LSD1UsVbqXQJGV3AKFBuucNDZtll6+O1R0E=
X-Gm-Gg: ASbGncswcy99vjuAC/w63UtIOkCRyLBB9UgGzsN0j2kn2DC8mioVQDf3zVlRxxaK+uh
	OYdtZirHMcmv/GjOGAxv9cz6/5JfilTkExpb++x63NACVTMZ30qYmnS9q6Gr7QIgbbybJ217A5l
	se8BIkqVhbvr42d2VB5iEUGeOQh24+UHhuE2tkkaSQbDC8fJsdSJD5vPU3XtHkiA==
X-Google-Smtp-Source: AGHT+IG9kj/bKbm3xOybDI1j9UpcbimSJl5hS4BlvPDwk4FKqxsGFeVSFvWjRYvDk3VbKvPh1kjAaZOMmUl54mN2ssk=
X-Received: by 2002:a05:6214:5d8e:b0:6f2:c94f:56b5 with SMTP id
 6a1803df08f44-6f2c94f57e4mr420533326d6.10.1745428021880; Wed, 23 Apr 2025
 10:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com> <20250415184649.356683-2-yabinc@google.com>
 <20250423081648.GJ28953@e132581.arm.com>
In-Reply-To: <20250423081648.GJ28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 10:06:50 -0700
X-Gm-Features: ATxdqUHA6VR574bbzyvYawg5qzV7NglTFU4wSViIiTNQ0tOAE65VyLttkuLoKeA
Message-ID: <CALJ9ZPN+JoL1SCoWhgRvCkTa6YPv-psGgOoxL9aotNmbdS+cHA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_100704_456042_600C7E10 
X-CRM114-Status: GOOD (  31.43  )
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

On Wed, Apr 23, 2025 at 1:16=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Yabin,
>
> Sorry for late reply as I was on vacation for the past two weeks.
>
> On Tue, Apr 15, 2025 at 11:46:48AM -0700, Yabin Cui wrote:
> > When tracing ETM data on multiple CPUs concurrently via the
> > perf interface, the CATU device is shared across different CPU
> > paths. This can lead to race conditions when multiple CPUs attempt
> > to enable or disable the CATU device simultaneously.
> >
> > To address these race conditions, this patch introduces the
> > following changes:
> >
> > 1. The enable and disable operations for the CATU device are not
> >    reentrant. Therefore, a spinlock is added to ensure that only
> >    one CPU can enable or disable a given CATU device at any point
> >    in time.
> >
> > 2. A reference counter is used to manage the enable/disable state
> >    of the CATU device. The device is enabled when the first CPU
> >    requires it and is only disabled when the last CPU finishes
> >    using it. This ensures the device remains active as long as at
> >    least one CPU needs it.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
>
> LGTM:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> As Jie reminded, please add James' review tag in next spin.

Sorry for forgetting to add Reviewed-by. Will add it in next spin.

>
> Thanks,
> Leo
>
> > ---
> >  drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
> >  drivers/hwtracing/coresight/coresight-catu.h |  1 +
> >  2 files changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwt=
racing/coresight/coresight-catu.c
> > index fa170c966bc3..3909b562b077 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *dr=
vdata, enum cs_mode cs_mode,
> >  static int catu_enable(struct coresight_device *csdev, enum cs_mode mo=
de,
> >                      void *data)
> >  {
> > -     int rc;
> > +     int rc =3D 0;
> >       struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> >
> > -     CS_UNLOCK(catu_drvdata->base);
> > -     rc =3D catu_enable_hw(catu_drvdata, mode, data);
> > -     CS_LOCK(catu_drvdata->base);
> > +     guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > +     if (csdev->refcnt =3D=3D 0) {
> > +             CS_UNLOCK(catu_drvdata->base);
> > +             rc =3D catu_enable_hw(catu_drvdata, mode, data);
> > +             CS_LOCK(catu_drvdata->base);
> > +     }
> > +     if (!rc)
> > +             csdev->refcnt++;
> >       return rc;
> >  }
> >
> > @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *d=
rvdata)
> >
> >  static int catu_disable(struct coresight_device *csdev, void *__unused=
)
> >  {
> > -     int rc;
> > +     int rc =3D 0;
> >       struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(csdev=
);
> >
> > -     CS_UNLOCK(catu_drvdata->base);
> > -     rc =3D catu_disable_hw(catu_drvdata);
> > -     CS_LOCK(catu_drvdata->base);
> > +     guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > +     if (--csdev->refcnt =3D=3D 0) {
> > +             CS_UNLOCK(catu_drvdata->base);
> > +             rc =3D catu_disable_hw(catu_drvdata);
> > +             CS_LOCK(catu_drvdata->base);
> > +     }
> >       return rc;
> >  }
> >
> > @@ -550,6 +558,7 @@ static int __catu_probe(struct device *dev, struct =
resource *res)
> >       dev->platform_data =3D pdata;
> >
> >       drvdata->base =3D base;
> > +     raw_spin_lock_init(&drvdata->spinlock);
> >       catu_desc.access =3D CSDEV_ACCESS_IOMEM(base);
> >       catu_desc.pdata =3D pdata;
> >       catu_desc.dev =3D dev;
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwt=
racing/coresight/coresight-catu.h
> > index 141feac1c14b..755776cd19c5 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.h
> > +++ b/drivers/hwtracing/coresight/coresight-catu.h
> > @@ -65,6 +65,7 @@ struct catu_drvdata {
> >       void __iomem *base;
> >       struct coresight_device *csdev;
> >       int irq;
> > +     raw_spinlock_t spinlock;
> >  };
> >
> >  #define CATU_REG32(name, offset)                                     \
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >

