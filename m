Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA9BCD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=; b=goch/zPUUD3gT4cnn3LjudZbAb
	1ETW31ShkBhhluh/MD8KbTZoD0LIWS3FBw91Q3n8V7A02OLLnFRWJF2xBkHHzsHZ13ml/bnuczqbp
	/hJHujjo4JuQx55MQpTwNm6WxRu+AXw2WGfziT2LZlxBDwOR2YUlSUw02pj1VSBlIRJSZ5tuR9WBD
	OcaHsDp6NfpRGeR/IWdomBBsifgKaV+E40hY+7mpXSY3XDv3IlBTRgjU3aeFPRV/I1dWznthGvjqK
	Jmm9xfGlEhf2Zdc76G89DBTEpywKddYXDrbiTKz1RQZ6FddasSclBK7cGwfIdCRaafCb7YXUtpJQD
	dv/jh3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfr-0000000Cr9p-2n33;
	Mon, 11 May 2026 09:11:39 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfl-0000000Cr5x-43zA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2283586e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778490691; cv=none;
        d=google.com; s=arc-20240605;
        b=RYhgF85q4fSJ3SknuVzzJMEQptKWoA1HfunChOpyeJ+51T1NPHrpwZyPIOUuoWmDiD
         9ajFy8/eGMvDbrvulmaz/DzPnCBUf1E4ODGqfx9bT1DhG3PRRIG4IvpKcC8HxliVKXhb
         jTa/z4E220BsRvL7QHi+c3iHiNwM4AVNGx0ZIGLp2pH/3UD1StDpGHJSC1FwRdcUUk5C
         Qi1rXwBCNlBi/FT5FFZjGyE4IexNqTAwVxhihID+Wu1oWs8I0iaNp37t4cPvNWrUeXue
         TaiIPBJ8Pb52Q1U8vsq3NoOI/R+n5Y/GYV9bRw/gKYaVevKUgR8oQA3bb6FUei53T4sv
         hhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        fh=XZhVP9PNb8t2E3yjn8P/CbuQBx5oCbLWoHIKD1Xzzrw=;
        b=YdpoHF2QDDvrqtNEtU6fZSV51IHRFvpq2sjgg+FR0j3pBjWyB7zriGAVxRNCMc3udZ
         mY0eIzR+G37LH+fgyrLqynkdycEbO7kKNyq9NCLTekXNRMQ++LBfZqgPyIoOaS8BW8zg
         /JEDM0s2BQsjMvdF9rV2HeI0LEk76rrCcwj+kMVn43ZR7sbc+S7m+UxhSDzdA7ZRuusx
         0Bk9Dex5PPWjk4HYAd/8d9Km6J+ZcokxRG7wU5LpNacrsJCkj9pz0VArTUq4BxE2rLfQ
         qsYJD7JUmSPgxOprrNZl6JpqMyrmh0HU+NXbJ1UcUgHPOla2n/IfM9eGnAzhd59IPTjA
         p06w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778490691; x=1779095491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        b=KjUyTC1xEgyRS7AQ0MDotAis47x/mHrfDDpXPGiGzR+0gP0B/s1AnznxilICVp9A2d
         bg3QqCZh9X1vY9vNsqwGrLScOz0D1GLF6gTV8Di1A4YG4s7jql96455c6s2bf7yGmOAy
         6PktO6/ey+SkNJrwU5biAmy+EclStiPRU3t8Qozb8h3uyIYv+8M671eqpSwvHViodPom
         qwO9PJmjh6MZ3mmjQIasEW9D3hFe6RZMu5zwOcsfzrMxwhsq4yESWsA4SY9gHKcunJgv
         fgxTAtIWetc3/NR/QbMwpxBuVSwdv80LdBm2l7Q1PAvidSnVlmPdePcrsDskAggj0UYV
         Tr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490691; x=1779095491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        b=aOJb8Wd5VCrnszFLCiuBt07fcE/4j1MpIasln7XMIGKEmu7YdtNZ2d4BdNtFgCsRjH
         fSzu1H1mshmCxX9CbjUPL64JYK3kKlwOnRZwGRPF3QC97RrGtJxt/Ba2mXmP27KVG7Zq
         mkJQtzTVXgBBvMqOOM/PDgiaYeYpcyg1l75FD0gF0QNgfl29SCkVir9CZCkOeXI/t4gL
         oA6Vmbf5e2DHXLS8td/WiwwfC55RT0ZvpUn7moV57ZiSvFsVwH19fDSRKDkeXJdkzUqz
         SFKu4nTan7LyRUgyha3t7B5LohciLCHnwrGQc4t+MnhP3nQPjmPFDuAfuVB/5WosGVkx
         esOw==
X-Forwarded-Encrypted: i=1; AFNElJ+Bx96eiNdcYoE3XGnUUOVhLdQkK83JXqhNsdexwhhcPIAoB8HsWBAYdiOXE+q+fR8FoiyQfQBY/+Um7+3cj5Y/@lists.infradead.org
X-Gm-Message-State: AOJu0YwVYRYwAbi8BDnv4LLfhSFCqHXvVvOv5tkw5Q/QRILr+YxT3V8P
	UgYden0ngOTIVvAgRjOzuqG66gosvyAYxueme5Pj+35xXFNtf2VUiiNjflRBMoSZKlKHSaHRexF
	5gRPqbbZzzPRUN90pZygtLcv+ZdVtpgN7ed29OUlwgQ==
X-Gm-Gg: Acq92OEOljwrqJUk6/Hm1rntFA+OfesBFuHHEgaf0P4NJBO9AFx+9dYtH5eThwiQSLG
	1UbTvknN6c+r3261QBTLsxPLakCh0pXT6ACms0cdpYACBZm2vl52tR704QxdCEbHF+PAL6hzYXI
	w/+geofjR9f01+Vvh3nyMPDOjaMNdaUzlIv2rpbN0WkPx65XZMBUKvUMV99snqV5bpFwkqA9ZFc
	8LGS7yyTboXio6p4oATjN4QAtvqTukj190c+HbCyxGj8jM6LSwlgT8/Hlz+6NHqshwXrn+oZNps
	eivlyj4H
X-Received: by 2002:a05:6512:2386:b0:5a4:194c:d897 with SMTP id
 2adb3069b0e04-5a887ae2025mr7537077e87.12.1778490691163; Mon, 11 May 2026
 02:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org> <DIDI6UCUFTWA.3GANQE923DAP9@kernel.org>
In-Reply-To: <DIDI6UCUFTWA.3GANQE923DAP9@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 11:10:54 +0200
X-Gm-Features: AVHnY4LZfAVNtlYlp8J8g6MEIDVkGfD08Ggh7z8GEXqctAp9-Wl133JAWYXxmAE
Message-ID: <CAPDyKFrju3R1t9-a=N6j6qmWoULFq07bfkWhg5g6ZdOvYD3MOA@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021134_034491_7F91D5EF 
X-CRM114-Status: GOOD (  25.17  )
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

On Fri, 8 May 2026 at 20:23, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri May 8, 2026 at 2:38 PM CEST, Ulf Hansson wrote:
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index 30b416588617..c8be24af92c3 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct device *dev)
> >               dev->driver->sync_state(dev);
> >  }
> >
> > +static inline bool dev_has_queue_sync_state(struct device *dev)
> > +{
> > +     struct device_driver *drv;
> > +
> > +     if (!dev)
> > +             return false;
> > +     drv = READ_ONCE(dev->driver);
> > +     if (drv && drv->queue_sync_state)
> > +             return true;
> > +     return false;
> > +}
> > +
> > +static inline void dev_queue_sync_state(struct device *dev)
> > +{
>
> Let's add device_lock_assert(dev), as this function requires it to be held.
>
> > +     if (dev->driver && dev->driver->queue_sync_state)
> > +             dev->driver->queue_sync_state(dev);
> > +}
>
> <snip>
>
> > @@ -1175,6 +1188,25 @@ static void device_links_flush_sync_list(struct list_head *list,
> >
> >               put_device(dev);
> >       }
> > +
> > +     if (!q_list)
> > +             return;
> > +
> > +     list_for_each_entry_safe(dev, tmp, q_list, links.queue_sync) {
> > +             list_del_init(&dev->links.queue_sync);
>
> Hm...this is called without the device_links_write_lock() held, so this looks
> like this could this race with the list_del_init() from
> device_links_driver_cleanup() and create an infinite loop.
>
> (The other list iterator above might have the same issue.)

Yes, you are right!

I was trying to follow the existing implementation for the regular
sync_state, but it certainly looks like we need a separate lock to
protect the lists.

Let me fold in a patch that fixes this for the regular ->sync_state()
code first.

>
> > +
> > +             if (dev != dont_lock_dev)
>
> This is pre-existing, but I think it would be good to add a device_lock_assert()
> call for this as well.

Makes perfect sense.

Again, I will fold in a patch that start by adding this for the
regular ->sync_state().

>
> > +                     device_lock(dev);
> > +
> > +             device_links_write_lock();
> > +             dev_queue_sync_state(dev);
> > +             device_links_write_unlock();
> > +
> > +             if (dev != dont_lock_dev)
> > +                     device_unlock(dev);
> > +
> > +             put_device(dev);
> > +     }
> >  }

Thanks for reviewing!

Kind regards
Uffe

