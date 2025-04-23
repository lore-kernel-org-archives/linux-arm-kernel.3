Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EE2C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMMHzQbc3DOKOLQmdiREJuJO+OIOF3BKkz8ey4xgZi8=; b=Nz8JsUE0N6b3l84gpU7PPV1kmq
	82nAGi8812+9ph85GW1wSoty7GG7pauUPRL3x5xPc1UVu4htVzXcgBqAwyy64TjG9nGcgoxiLdaEg
	TYXxjyOUIJIp8jvAJCm6K3Jf+sb/NlxIqWzke+92epKORKZl9C0CTGkhqeLYy8qCmvlewblQacTKD
	l5o48IORU9Z+LHfnHVL1GPXoXaYjO9Wbz5Y4X4/68WgNMWRObqxmwIklDcAsR5hm7urW0O606SvtY
	YqJEFTXipo0/EKtYnCRbY+VAaA9AF1jLm1OZFj7zp1ibpLKrb9l73+jmYniamUdy9D/KQ+CkE54LJ
	j4hsFhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VLC-00000009hQ7-3Sx3;
	Wed, 23 Apr 2025 08:20:22 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UdU-00000009XaA-0GRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:35:13 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7082ce1e47cso1365547b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393711; x=1745998511; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMMHzQbc3DOKOLQmdiREJuJO+OIOF3BKkz8ey4xgZi8=;
        b=z3zKkAYKm1/wFY8GNxG8nKwekuFqRnnNTyuYkpbIIrDeVkeUUqIVwOsqwyDhmmSFQ2
         q3pAbCK6G6viTTnuGp3eqQKMjC3/e5Ss+MbPuZySX503LhcCiL7yZ4/USBEJT6SHhdOr
         YBKzZYFWKjZk2g1zF6YdIu8QTbAio8Zc5VDa9ocJBxS3Srm5EQsjC8WzUkgjuD4lUit3
         Wm40ecD8EvdWw/z2AWAFeQSty8945F4BwnwfHhKsOh/LGZWZDY86wBUyzzd1C8ErWQ1k
         OIHaDEluTjTkjU+ZZGlVHbrZY/je1vuDe5gy++7Cx034bqpXeiKXcUFNgapi+UsR5M8u
         F1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393711; x=1745998511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMMHzQbc3DOKOLQmdiREJuJO+OIOF3BKkz8ey4xgZi8=;
        b=GuJ76Fvuf6iHgNrno5XxlWLzDIBagc+SCryvomhzt8Q7yoJP9X4vTI+H/Bg3HG6k9p
         ddYWdWqgYHEwMulN0ecq46ncVnI2EZqCbcA0eyrue3EEox0eSn0K/CyyIExGXr2+4wR2
         HucoB76gBL16UBVhzU6Iwlwrx1xG82mHpQoe6HXsqyEClICLvdj+19muiZ7WET73n6R9
         C43c8KNOJIPSYwNP6/jhRr2A2Wy/ImT2yMw9s/497SR6DviS5swntCNe+fXna5Qt9BGm
         Zv1fKGpeQaWO1NQSz9M55lOqB1HV8g2+c9Br901/JvKjMC1nX0yQNbMWCp1B3mMMOUQK
         JY6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/5EFGN0sWsOj9wCxPAcdq7dHN32aNXHR1FEMBogX/EEtED+hqNoKF1joLaqB0Z9c3asoYBSnJLw4rvW7BXUHk@lists.infradead.org
X-Gm-Message-State: AOJu0YwTVgWsRJM9JP6ov1HWVDEhYMWdyn4/7cKdnkZpVuLSHmPNQVyg
	1XUwxtMlIm6FS4pAOeLlRGd3MkchvcSVhBA2u9VVFhUaNgFNP2PU7/c6a0Ljj/h/EH0YC9mCTZu
	YwPhORZE03z65E0m59cYlHwxUpwVNXP3mHCuSPg==
X-Gm-Gg: ASbGncu6ojls2bTg+RzU/JP9ZNSB1o0XoHw9XQT6VuXuhPav3slHHKfpRosovKmZ388
	BQmpMy713eosXjJ9ATrbxUwERYqKvBvCuqRX5OvoKSiaLzUzIm1r9Da+J55B3ipE6cggPoXVrmk
	U6LCedgZSQj/GIWmzmjQacZQ==
X-Google-Smtp-Source: AGHT+IHHAtEFUZLhcbruHxpEpPorFQEnsYo12C8JxLrs3aH6bpX9x1WDRFduNm79Hualt6eVxiRRgQbVsZLz+ZRze24=
X-Received: by 2002:a05:690c:25c8:b0:702:d54:45be with SMTP id
 00721157ae682-706cce101cfmr246843717b3.35.1745393710883; Wed, 23 Apr 2025
 00:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-5-ulf.hansson@linaro.org> <aAehkpXAxh3bI0WT@linaro.org>
In-Reply-To: <aAehkpXAxh3bI0WT@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 23 Apr 2025 09:34:34 +0200
X-Gm-Features: ATxdqUEyxZ9BnVBWNRMOFzP2PaM9YMbsKb03WnT7UGjwnB1ecsv-8AkyK7T40lE
Message-ID: <CAPDyKFqftAzxhoSo=A7Eu_0ueK6_BgMs+-mCZy=jQdm9aXQMog@mail.gmail.com>
Subject: Re: [PATCH 04/11] pmdomain: core: Add a bus and a driver for genpd providers
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_003512_104992_F87A3A1C 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue, 22 Apr 2025 at 16:03, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-04-17 16:25:02, Ulf Hansson wrote:
> > When we create a genpd via pm_genpd_init() we are initializing a
> > corresponding struct device for it, but we don't add the device to any
> > bus_type. It has not really been needed as the device is used as cookie to
> > help us manage OPP tables.
> >
> > However, to prepare to make better use of the device let's add a new genpd
> > provider bus_type and a corresponding genpd provider driver. Subsequent
> > changes will make use of this.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 89 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 035b65563947..da51a61a974c 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -27,6 +27,11 @@
> >  /* Provides a unique ID for each genpd device */
> >  static DEFINE_IDA(genpd_ida);
> >
> > +/* The parent for genpd_provider devices. */
> > +static struct device genpd_provider_bus = {
> > +     .init_name = "genpd_provider",
> > +};
> > +
> >  #define GENPD_RETRY_MAX_MS   250             /* Approximate */
> >
> >  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)               \
> > @@ -44,6 +49,14 @@ static DEFINE_IDA(genpd_ida);
> >  static LIST_HEAD(gpd_list);
> >  static DEFINE_MUTEX(gpd_list_lock);
> >
> > +#define to_genpd_provider_drv(d) container_of(d, struct genpd_provider_drv, drv)
> > +
> > +struct genpd_provider_drv {
>
> I'd replace "provider" substring and expand drv to driver everywhere.
>
> I think that's more in line with all other subsystems.

I understand your point, but it's not that straight-forward to find a
proper name this time.

We already have another bus_type for genpd consumer devices (virtual
devices created when attaching a device to one of its multiple PM
domains). That bus is already named "genpd".

>
> > +     struct device_driver drv;
> > +     int (*probe)(struct device *dev);
> > +     void (*remove)(struct device *dev);
> > +};
> > +
> >  struct genpd_lock_ops {
> >       void (*lock)(struct generic_pm_domain *genpd);
> >       void (*lock_nested)(struct generic_pm_domain *genpd, int depth);
> > @@ -2225,6 +2238,26 @@ static int genpd_set_default_power_state(struct generic_pm_domain *genpd)
> >       return 0;
> >  }
> >
> > +static int genpd_provider_bus_probe(struct device *dev)
>
> ... and then here drop the "provider" as well.

For the reason I pointed out above, I decided to use "provider" in the
bus/driver's functions names to have a clear difference from the
"consumer" genpd bus.

I am worried that if we don't use "provider" we will mix up things
with the existing genpd bus. Maybe there is a better option?

>
> Other than that, LGTM:
>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Thanks for reviewing!

Kind regards
Uffe

