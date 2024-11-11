Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5084D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw0q3qDT0vi95T+/YkCGNgpoNAWEsqCRmfo1keQBb+c=; b=VFGxa30wxmXkC4ol9vaGdeIFFr
	uytLRTENV6r7SvCv+kAh7me//hFaioFBFkHhj3N5flgzZsHezZl5BFjeMPzpLuSeavJ0xMEoP4jTD
	YXXzWvJqNSPe3kPCH8xm4klS1a6rL9cmioV7Oyal+L4tHfd1G8YAjeGSCElsSMBUApRFCMlHwCJOV
	PFV4BvhEIc8xD/2obp3hi+pZBjQbKZ7NRSz7dqmyFKusboOTd6ReZZPih7BtUzOBr9ZH3DQ6ThaVN
	lR/8JC9987FRyFH4h/KemWogw0iwV566QRPQZyhRxx3VlZCCWcK8dsFtVRf2rNCojFCSs21zaw6Ia
	N8rD2LCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZvc-000000011py-26x5;
	Mon, 11 Nov 2024 19:18:24 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZtE-000000011ay-3Ugv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:15:58 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so4617370276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731352555; x=1731957355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw0q3qDT0vi95T+/YkCGNgpoNAWEsqCRmfo1keQBb+c=;
        b=XfvSbuzdQpPVP+bkoZzZ/golmLYXgryZ2mqZnc+8ylfOivNmULPTeEygeg9mxY5s+L
         zmhCf1WauuyRknVbyPLkNEHhW554gUtY8e2/RaodBOB6O7Py4JYTMO7kSfsfRBu7Sn5f
         89qaU58OKRmuuZ01fxAr7SqDrGkP9cP8SQuoWcSvd/QQZXDjNyWBLubiYbnVEC9cwuAM
         yilVfe+zsnqESN0b6f+7KhB0VBfnqxMq6e2LToEH9Uw+S0k+nh5MdKDifRvCWR3NMNN3
         yd5XnH+eK5CHFbkLsUCCKuRVthcU8svU4jq9vffqLRRqqeN9bxG6hL0AaE2kPVbXqK0C
         d4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731352555; x=1731957355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dw0q3qDT0vi95T+/YkCGNgpoNAWEsqCRmfo1keQBb+c=;
        b=VseIbjl7a4NwFE8F/xNrci9ANEdtoCP3sYrU2i12XAxcTz2GmE/UT+muctTipGVCk8
         RQbAwgY4tfUNxdAHMkTBBSQc+3htsKQX2xxKJaZuUj5nBjEv6lWqqB7jay/AfcFbkbxr
         NcaDphw7amxUbFqxz48FTKrOSis2LNs64135aNnfxML8U70BbUVlX2RKfuEG84QSwITC
         GM5XTk4MVtKf8eJLcX+Gd3PLPwYBoenTQMT6VGVnPSi70YQFmUdDcn9gqguJsTMqokrV
         7/2aWi8NH3aBVr6p30rp0sSyX0xnFOZIX7kobo+6iakkiIlW7hZvJtP95f8gydSsEqJj
         89Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVoMYZGdFkDUFDeiX8hEwk41uDwHYL+vJYg2ckgc5XoPKYeMa6GTcDi1RUjKfef/o/+NCOTFUjYBEi9WrvyjUbu@lists.infradead.org
X-Gm-Message-State: AOJu0YyRSYB+bbcJZFSkbG0ot+NgKoPOl4aWIX9sSIIT1RUxd3wVTGeS
	uWTH+nCLCSPvi5YIQHGQDYioraihzSViKeMyKgzFclreuQ6AkIE6X+itqY7KtElmX3c2ED5NxS2
	WkZ+9msprOY86SGOmrcaGJxR2t5g=
X-Google-Smtp-Source: AGHT+IEuNdtxOHM/XUCGisUrhzSAQE8+Xh3Htc50ucyk7blV/x9p9fuCjKqwKXS9o+Xm3Iq8+nBpx1uIoLkq8gxXuD4=
X-Received: by 2002:a05:6902:1887:b0:e2b:d9d7:9078 with SMTP id
 3f1490d57ef6-e337f8446cfmr10907400276.3.1731352554935; Mon, 11 Nov 2024
 11:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20241108200900.44727-1-jiashengjiangcool@gmail.com> <20241109133846.53d7ef06@jic23-huawei>
In-Reply-To: <20241109133846.53d7ef06@jic23-huawei>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 11 Nov 2024 14:15:43 -0500
Message-ID: <CANeGvZVxte61_FgrrYEt_oTRXXzCESrvq4q90xSWz4JqpMAtYg@mail.gmail.com>
Subject: Re: [PATCH v2] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	u.kleine-koenig@baylibre.com, tgamblin@baylibre.com, fabrice.gasnier@st.com, 
	benjamin.gaignard@linaro.org, lee@kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_111556_899298_00DA9524 
X-CRM114-Status: GOOD (  30.64  )
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

On Sat, Nov 9, 2024 at 8:38=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Fri,  8 Nov 2024 20:09:00 +0000
> Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:
>
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception.
> >
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> Hi,
>
> In principle this is fine, but I'd rather we made use of guard()
> / scoped_guard() rather than adding the explicit unlocks.
>
> If you do that as a precursor patch in appropriate places
> in the driver then this will be a little cleaner.
>
> Note I'll not be taking this until next cycle now anyway.
>
> Jonathan
>
> > ---
> > Changelog:
> >
> > v1 -> v2:
> >
> > 1. Remove unsuitable dev_err_probe().
> > ---
> >  drivers/iio/trigger/stm32-timer-trigger.c | 32 ++++++++++++++++++-----
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/tr=
igger/stm32-timer-trigger.c
> > index 0684329956d9..e1e077122f73 100644
> > --- a/drivers/iio/trigger/stm32-timer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> > @@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_tri=
gger *priv,
> >                            unsigned int frequency)
> >  {
> >       unsigned long long prd, div;
> > -     int prescaler =3D 0;
> > +     int prescaler =3D 0, ret;
> >       u32 ccer;
> >
> >       /* Period and prescaler values depends of clock rate */
> > @@ -153,7 +153,11 @@ static int stm32_timer_start(struct stm32_timer_tr=
igger *priv,
> >       mutex_lock(&priv->lock);
> >       if (!priv->enabled) {
> >               priv->enabled =3D true;
> > -             clk_enable(priv->clk);
> > +             ret =3D clk_enable(priv->clk);
> > +             if (ret) {
> > +                     mutex_unlock(&priv->lock);
>
> as below guard() for when the mutex is locked is cleaner.
>
> > +                     return ret;
> > +             }
> >       }
> >
> >       regmap_write(priv->regmap, TIM_PSC, prescaler);
> > @@ -307,7 +311,7 @@ static ssize_t stm32_tt_store_master_mode(struct de=
vice *dev,
> >       struct stm32_timer_trigger *priv =3D dev_get_drvdata(dev);
> >       struct iio_trigger *trig =3D to_iio_trigger(dev);
> >       u32 mask, shift, master_mode_max;
> > -     int i;
> > +     int i, ret;
> >
> >       if (stm32_timer_is_trgo2_name(trig->name)) {
> >               mask =3D TIM_CR2_MMS2;
> > @@ -326,7 +330,11 @@ static ssize_t stm32_tt_store_master_mode(struct d=
evice *dev,
> >                       if (!priv->enabled) {
> >                               /* Clock should be enabled first */
> >                               priv->enabled =3D true;
> > -                             clk_enable(priv->clk);
> > +                             ret =3D clk_enable(priv->clk);
> > +                             if (ret) {
> > +                                     mutex_unlock(&priv->lock);
> As below. Prefer use of guard() so we don't have to handle the unlock man=
ually.
> > +                                     return ret;
> > +                             }
> >                       }
> >                       regmap_update_bits(priv->regmap, TIM_CR2, mask,
> >                                          i << shift);
> > @@ -482,6 +490,7 @@ static int stm32_counter_write_raw(struct iio_dev *=
indio_dev,
> >                                  int val, int val2, long mask)
> >  {
> >       struct stm32_timer_trigger *priv =3D iio_priv(indio_dev);
> > +     int ret;
> >
> >       switch (mask) {
> >       case IIO_CHAN_INFO_RAW:
> > @@ -496,7 +505,11 @@ static int stm32_counter_write_raw(struct iio_dev =
*indio_dev,
> >               if (val) {
> >                       if (!priv->enabled) {
> >                               priv->enabled =3D true;
> > -                             clk_enable(priv->clk);
> > +                             ret =3D clk_enable(priv->clk);
> > +                             if (ret) {
> > +                                     mutex_unlock(&priv->lock);
> Add include of cleanup.h and swithch the place where the mutex is locked =
to
> guard(mutex)(&priv->lock);
> then remember to drop the explicit unlocks.

I found that cleanup.h is already included.

Moreover, since labels cannot be followed by declarations,
I encountered a compilation error when using guard().
Therefore, I switched to using scoped_guard().
>
> > +                                     return ret;
> > +                             }
> >                       }
> >                       regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CE=
N);
> >               } else {
> > @@ -601,7 +614,7 @@ static int stm32_set_enable_mode(struct iio_dev *in=
dio_dev,
> >                                unsigned int mode)
> >  {
> >       struct stm32_timer_trigger *priv =3D iio_priv(indio_dev);
> > -     int sms =3D stm32_enable_mode2sms(mode);
> > +     int sms =3D stm32_enable_mode2sms(mode), ret;
> >
> >       if (sms < 0)
> >               return sms;
> > @@ -611,7 +624,12 @@ static int stm32_set_enable_mode(struct iio_dev *i=
ndio_dev,
> >        */
> >       mutex_lock(&priv->lock);
>
> Perhaps scoped_guard() is  appropriate here.
>
> >       if (sms =3D=3D 6 && !priv->enabled) {
> > -             clk_enable(priv->clk);
> > +             ret =3D clk_enable(priv->clk);
> > +             if (ret) {
> > +                     mutex_unlock(&priv->lock);
> > +                     return ret;
> > +             }
> > +
> >               priv->enabled =3D true;
> >       }
> >       mutex_unlock(&priv->lock);
>

Thanks, I will submit a v2 to simplify code with cleanup helpers.

-Jiasheng

