Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5773EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0EZW6LlfowWIgAwJtFx9CvahXq/dyYnxzkbI6o/02Q=; b=nslYs+xLv+Rp8qEETJk9VAzkD2
	LISq2kJlC7SHh3NVSCU7hanWXkhX/0kr+AkkvNY2Am9WT96RYDvv1kDLLdcGdKUptz2ZP0X/MjbU1
	8FRNKQyZIwl+PutoNBNR3D9GO9+b7WgxFD7bepjeMwXKdaUP3rc+zLVbnMFHNi6eOV4RygycgSBnc
	nQHZVPddUd9VtG7kP53SJgjhqJH55cHYEwJVgCONto4lvrxJA+LcSgWKy4BIsk7X5K3CM8j3CRDhj
	UQIEwMv5xhEUd2ZD9W3tzgm0dxtCRXzp4sBgt2+2JoP6rPJOm8CBeCmCFgCsUygCmxix3mYXAI8dC
	j17NlsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVyB-0000000DHqa-0TA2;
	Tue, 17 Dec 2024 11:42:31 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVx5-0000000DHig-06qu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:41:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ee6c2d6db0so4505301a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734435681; x=1735040481; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b0EZW6LlfowWIgAwJtFx9CvahXq/dyYnxzkbI6o/02Q=;
        b=GiIAYygNvSwInxhm2Zp8bDY3ZxdDY3X0AYPQGRs+CgH6xV4Pp6oPQEziRTwyPMDWqT
         oBXtKTQNlLigfcqQr9rRUA1hLmVR5PS6ZM1hu+jkTnkGHw9Ueccr0GxDe5AxYXxdlbxN
         nWVkAwjExqbTtQu8DDUhABDiSoDHePu4GQfeKh9Y+GXY51NCg4Ek50mcKOhjgTcoFljQ
         OztUhIfbjqZ1UgdkN8XFE9Z9EprySLxdrye26zsrWDfbQhwu8hOhFjj9UEHPsKYFd3dU
         gnuGkmJefr2TI/oA1mC+P/qfEmgWwpIB41yKPzAG0QZsEmy3qkJlUroFltGZWksTBrLe
         QhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734435681; x=1735040481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0EZW6LlfowWIgAwJtFx9CvahXq/dyYnxzkbI6o/02Q=;
        b=KVzQlvn3i3zgkIBVTF86zWzR+DmjVs3Gat54YDQmVuzlxBZ2bvL6oJEAOGwtkjcODl
         OOsy1kPHjJeNH+OxiTL1Lo7LHFZ5d6jQSpw+3qSooRO/t7QbE7ZTEaQkwlkRnvkhAEnZ
         dbSvuHF8X7gPbiW0RgJfpdmduEbmtq16uaWCSae/6k8PEdU8mxQzu82zRkcmEh/CvoY+
         5rTl1lovqmjBF4v8EcS4Waw0SELS73NEPn4tlp+rTk5Tdg+0Lq6KenYOB0Z13NPTGbzc
         MIquIuirS837b8eqMzWrK0cR7QoV2yHgCXDkTVSi0T3UYi3LvF4iX+c3blQHl23E6f5n
         Cg+A==
X-Forwarded-Encrypted: i=1; AJvYcCU6yCsDNS9dbfQBsiTcAwNlvS+jD9xLcjLGVlcHMqiAlDRtg9FZoyKtIkKtN+AJzZXVq700Meesr+srDZ1d81ep@lists.infradead.org
X-Gm-Message-State: AOJu0YzjiZRtxSzGwh+IjyWiJcILAaJNZ5eAcfT4KI6c2dJ8cJmdqHOf
	IpvJtpFkfMLxq3vSwKwh911LZ8PPyAznM75R69is1lw7zSMazdsiwCpbLCwLZMZDaf2KlK4szK3
	GRGqFB3L7pBdj6+0hEiur7EYbjlzGwv1JnGVBOQ==
X-Gm-Gg: ASbGncu+oazjBmhXQcL/YmP6zdwzKWlDfHaTIHH0fLezRBFPayvKku8j84wf7MKa4JV
	3ZA6z+ScEYGWt78DX6sk1hSF0E0/BGTCjCOm7cFQ=
X-Google-Smtp-Source: AGHT+IGIDfrYNaywRoWFo3CQSbMxXhWSle7L1Jb4vz79u1YZalyqFK7FlUJMk0NlWFVnhyTGxjaH1yzDfdnlavipwTg=
X-Received: by 2002:a17:90b:4b06:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2f2901a2a67mr23276889a91.30.1734435681520; Tue, 17 Dec 2024
 03:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20241213144919.110642-1-mike.leach@linaro.org>
 <20241213144919.110642-3-mike.leach@linaro.org> <9094b068-ed3a-444d-b790-e43a652ab6e9@arm.com>
In-Reply-To: <9094b068-ed3a-444d-b790-e43a652ab6e9@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 17 Dec 2024 11:41:11 +0000
Message-ID: <CAJ9a7VjCK+FGB+EMbcgaRfkv13TYYgBNHTG+AGp=52dZ7EfQAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] coresight: tmc: Update error logging in tmc common functions
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, james.clark@linaro.org, 
	alexander.shishkin@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_034123_084440_B99AA27E 
X-CRM114-Status: GOOD (  24.70  )
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

Hi Suzuki,

On Mon, 16 Dec 2024 at 09:33, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 13/12/2024 14:49, Mike Leach wrote:
> > Enhance the error logging in the tmc_wait_for_tmcready() and
> > tmc_flush_and_stop() to print key tmc  register values on error
> > conditions to improve hardware debug information.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../hwtracing/coresight/coresight-tmc-core.c  | 37 +++++++++++++++----
> >   drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
> >   2 files changed, 30 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > index e9876252a789..1a9299adae93 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> > @@ -34,25 +34,36 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
> >   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
> >   DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
> >
> > +#define TMC_WAIT_READY_FMT_STR "timeout while waiting for TMC to be Ready [STS=0x%04x]\n"
> > +
> >   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
> >   {
> >       struct coresight_device *csdev = drvdata->csdev;
> >       struct csdev_access *csa = &csdev->access;
> > +     u32 tmc_sts = 0;
> >
> >       /* Ensure formatter, unformatter and hardware fifo are empty */
> > -     if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
> > -             dev_err(&csdev->dev,
> > -                     "timeout while waiting for TMC to be Ready\n");
> > +     if (coresight_timeout_retval(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1,
> > +                                  &tmc_sts)) {
> > +             dev_err(&csdev->dev, TMC_WAIT_READY_FMT_STR, tmc_sts);
> >               return -EBUSY;
> >       }
> >       return 0;
> >   }
> >
> > -void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
> > +int tmc_flush_and_stop(struct tmc_drvdata *drvdata)
> >   {
> >       struct coresight_device *csdev = drvdata->csdev;
> >       struct csdev_access *csa = &csdev->access;
> > -     u32 ffcr;
> > +     u32 ffcr, ffsr, tmc_sts;
> > +     int rc = 0;
> > +
> > +     /* note any MemErr present when stopping TMC */
> > +     tmc_sts = readl_relaxed(drvdata->base + TMC_STS);
> > +     if (tmc_sts & TMC_STS_MEMERR)
> > +             dev_err(&csdev->dev,
> > +                     "MemErr detected before Manual Flush; STS[0x%02x]\n",
> > +                     tmc_sts);
> >
> >       ffcr = readl_relaxed(drvdata->base + TMC_FFCR);
> >       ffcr |= TMC_FFCR_STOP_ON_FLUSH;
> > @@ -60,12 +71,22 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
> >       ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
> >       writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
> >       /* Ensure flush completes */
> > -     if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
> > +     if (coresight_timeout_retval(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0,
> > +                                  &ffcr)) {
> > +             ffsr = readl_relaxed(drvdata->base + TMC_FFSR);
> >               dev_err(&csdev->dev,
> > -             "timeout while waiting for completion of Manual Flush\n");
> > +                     "timeout while waiting for completion of Manual Flush\n");
> > +             dev_err(&csdev->dev,
> > +                     "regs: FFCR[0x%02x] FFSR[0x%02x] STS[0x%02x]\n",
> > +                     ffcr, ffsr, tmc_sts);
> > +             rc = -EBUSY;
> >       }
> >
> > -     tmc_wait_for_tmcready(drvdata);
> > +     if (tmc_wait_for_tmcready(drvdata)) {
> > +             dev_err(&csdev->dev, "TMC ready error after Manual flush\n");
> > +             rc = -EBUSY;
> > +     }
> > +     return rc;
> >   }
>
> All of this looks good to me. Do we need to move the MemErr check post
> the flush ? There is a potential chance of hitting a MemERR on flushing
> and we could miss reproting those ones ?
>

We need the one before - if there is already a Memerr then this will
affect the flush operation - on Memerr the formatter will have stopped
etc. But no harm in putting another check afterwards.

Mike

> Suzuki
>
> >   void tmc_enable_hw(struct tmc_drvdata *drvdata)
> > diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> > index 2671926be62a..34513f07c3aa 100644
> > --- a/drivers/hwtracing/coresight/coresight-tmc.h
> > +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> > @@ -259,7 +259,7 @@ struct tmc_sg_table {
> >
> >   /* Generic functions */
> >   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata);
> > -void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
> > +int tmc_flush_and_stop(struct tmc_drvdata *drvdata);
> >   void tmc_enable_hw(struct tmc_drvdata *drvdata);
> >   void tmc_disable_hw(struct tmc_drvdata *drvdata);
> >   u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

