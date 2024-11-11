Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCB9D3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gUTNs8Dh8KbUYmm7/7ZTpr23lbHf0Ptz/iifQK4G1M=; b=d5BDMM/wp6azDk3MmyxruHG/dm
	tv5S2jkGa8ZPKupi/5+YGtCLn4hm5mPHNJuQsxdeHhQRmKxnNlY2C4mM9wlTYwtp0NYqsCNOCQiIY
	zLiYcDAtvihyoA17ZJzkI8Q1eMolnbJfPtUuaSuZK7pdmHFm2pH9iBQydBwKpqfnllkj0AJq2XNV8
	vZ4lgeNFHhQbHFSitiVlW2K/slpuTpHCbFWbRNnR8F5ytT0ikoQ3CkyE8QpjoJUefJlc1ndS1Y9yc
	QSTz4A0jtNV4ql+Xqb2oNGCb9xaKBdxkS+itcVZfKcqbcNDMqCRryRBUVDap6hBLarY9U4mwfRdre
	E3wWioFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAclQ-00000001UWs-0yzg;
	Mon, 11 Nov 2024 22:20:04 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcjd-00000001UEq-07f3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 22:18:14 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-460963d6233so32905711cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 14:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731363491; x=1731968291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gUTNs8Dh8KbUYmm7/7ZTpr23lbHf0Ptz/iifQK4G1M=;
        b=ORuxCYDbk9Vt0hJyEgj4WB63XjjsOZR2JnC2z6VE1+0+weVV83+ml1+uVHOYs5oR1L
         TaN/2ou57hs1B5aEckLHb6XibIHtFAyMsKSE8Ufi4VJbh7yxtnTvQ6VfsYYO11i/oSjR
         HhScZcE7BCiPfY5r3cUBZlJBPvqldzr1w1S/SKUF9eEu6Lr+l/ZZwqPhTS1Dr8yI7jVz
         zP0gMrc7VyRXH8Q0a8o41cULje6JVbtrcwG3tiUA1t3pNYq2MSiOW1FgVf7m89EjQ1OA
         MweribXutjHa5lKy2b5SJCYsgDIvC0E8jDYtZSDmkIZQKtLD6iFk3ecrj0J4T2abuGtP
         Hb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731363491; x=1731968291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gUTNs8Dh8KbUYmm7/7ZTpr23lbHf0Ptz/iifQK4G1M=;
        b=tJk55EUDl3adVPpNTJLjURAF4tSNmodTcgnIJgNpH3Wd1m4F+69j9bYsynv+Zi0jgI
         sQewARojOzeZUyWyN/GcFukmsDWJyv9/UpPUonNpdgZOXh4vYoKZigTqNIuJxjBhxXmU
         81cbv26AwXpG+dWycjs/LZjZDRLwlEFBnIFDDbJkX2a11vGPcNoGHBZ9ofsOkXZRASCG
         Eo+g/5CwWbWuPvRI5x+HIwnENng0rqML9Sc3shuJLYu0pF/QNAI+aadGYdKiK3oodgHv
         P24JqdZG7XyyJ/gqkh9dehs872w8r3G8sT375CzrDe1RWFEsk/p3O/f8YQZFCdu5QPB5
         Txhg==
X-Forwarded-Encrypted: i=1; AJvYcCWl6FjPrY2z7ajMiiR+f+5Ouy4V1+usP1jPHLz5Nf2vU6hMBuB/WcW2JMEidmO/iz99UJyY8rHKWgCDLQk9RNot@lists.infradead.org
X-Gm-Message-State: AOJu0YzZu+cAH6WwLdf832qL/UOrlxnZBORGEyraNMuU7/54Gs7auYQs
	GMQGAILv4wEfI5WiRpny2MKYqqiEPkN1DtdeLzHMcMCf/GuLdU5vo5IRUQ6MzgkZhGtD3rKxV4s
	vzMBHBtCrHd0O9p4ipY89zjarGbM=
X-Google-Smtp-Source: AGHT+IFBSFXwho3XyINI2DcEU/Xepv/720ecvGA0qvDaPusA/yXsvod0iClvHMK0JEz9Jm2Fdz03yfn9c4Ds8BzAZio=
X-Received: by 2002:a05:622a:1b1e:b0:461:1475:6135 with SMTP id
 d75a77b69052e-463093003c5mr217546251cf.1.1731363491551; Mon, 11 Nov 2024
 14:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
 <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com> <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
 <b2f6db15-51a8-498d-ab5b-52f0f6a2e098@baylibre.com>
In-Reply-To: <b2f6db15-51a8-498d-ab5b-52f0f6a2e098@baylibre.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 11 Nov 2024 17:18:00 -0500
Message-ID: <CANeGvZW0Ja=pwLuYqZh1KWn3Y7Oany4JvALHWcHoM-jALedSbw@mail.gmail.com>
Subject: Re: [PATCH v3] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
To: David Lechner <dlechner@baylibre.com>
Cc: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com, 
	tgamblin@baylibre.com, fabrice.gasnier@st.com, benjamin.gaignard@linaro.org, 
	lee@kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_141813_101430_54C965ED 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon, Nov 11, 2024 at 4:15=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 11/11/24 2:36 PM, Jiasheng Jiang wrote:
> > On Mon, Nov 11, 2024 at 2:45=E2=80=AFPM David Lechner <dlechner@baylibr=
e.com> wrote:
> >>
> >> On 11/11/24 1:19 PM, Jiasheng Jiang wrote:
> >>> Add check for the return value of clk_enable() in order to catch the
> >>> potential exception.
> >>>
> >>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> >>> ---
> >>> Changelog:
> >>>
> >>> v2 -> v3:
> >>>
> >>> 1. Simplify code with cleanup helpers.
> >>>
> >>> v1 -> v2:
> >>>
> >>> 1. Remove unsuitable dev_err_probe().
> >>> ---
> >>
> >> ...
> >>
> >>> @@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_d=
ev *indio_dev,
> >>>               return -EINVAL;
> >>>
> >>>       case IIO_CHAN_INFO_ENABLE:
> >>> -             mutex_lock(&priv->lock);
> >>> -             if (val) {
> >>> -                     if (!priv->enabled) {
> >>> -                             priv->enabled =3D true;
> >>> -                             clk_enable(priv->clk);
> >>> -                     }
> >>> -                     regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_=
CEN);
> >>> -             } else {
> >>> -                     regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR=
1_CEN);
> >>> -                     if (priv->enabled) {
> >>> -                             priv->enabled =3D false;
> >>> -                             clk_disable(priv->clk);
> >>> +
> >>> +             scoped_guard(mutex, &priv->lock) {
> >>> +                     if (val) {
> >>> +                             if (!priv->enabled) {
> >>> +                                     priv->enabled =3D true;
> >>> +                                     ret =3D clk_enable(priv->clk);
> >>> +                                     if (ret)
> >>> +                                             return ret;
> >>> +                             }
> >>> +                             regmap_set_bits(priv->regmap, TIM_CR1, =
TIM_CR1_CEN);
> >>> +                     } else {
> >>> +                             regmap_clear_bits(priv->regmap, TIM_CR1=
, TIM_CR1_CEN);
> >>> +                             if (priv->enabled) {
> >>> +                                     priv->enabled =3D false;
> >>> +                                     clk_disable(priv->clk);
> >>> +                             }
> >>>                       }
> >>>               }
> >>> -             mutex_unlock(&priv->lock);
> >>> +
> >>>               return 0;
> >>>       }
> >>
> >>
> >> Another way to do this that avoids changing the indent
> >> so much is placing braces around the case body like this.
> >> This also avoids the compile error from using guard after
> >> case directly.
> >>
> >>
> >>         case IIO_CHAN_INFO_ENABLE: {
> >>                 guard(mutex)(&priv->lock);
> >>
> >>                 if (val) {
> >>                         if (!priv->enabled) {
> >>                                 priv->enabled =3D true;
> >>                                 ret =3D clk_enable(priv->clk);
> >>                                 if (ret)
> >>                                         return ret;
> >>                         }
> >>                         regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1=
_CEN);
> >>                 } else {
> >>                         regmap_clear_bits(priv->regmap, TIM_CR1, TIM_C=
R1_CEN);
> >>                         if (priv->enabled) {
> >>                                 priv->enabled =3D false;
> >>                                 clk_disable(priv->clk);
> >>                         }
> >>                 }
> >>
> >>                 return 0;
> >>         }
> >>
> >
> > Looks great.
> > But there is no indentation between "switch" and "case".
> > As a result, the closing braces of "switch" and "case" will
> > be placed in the same column.
> >
> > Like this:
> >
> > switch(mask) {
> > case IIO_CHAN_INFO_ENABLE: {
> >
> > }
> > }
> >
> > -Jiasheng
>
>
> Usually, there is a default: case as well, so we could move the
> final return and make it look like this:
>
>         switch (mask) {
>         case IIO_CHAN_INFO_RAW:
>                 return regmap_write(priv->regmap, TIM_CNT, val);
>
>         case IIO_CHAN_INFO_SCALE:
>                 /* fixed scale */
>                 return -EINVAL;
>
>         case IIO_CHAN_INFO_ENABLE: {
>                 guard(mutex)(&priv->lock);
>                 if (val) {
>                         if (!priv->enabled) {
>                                 priv->enabled =3D true;
>                                 clk_enable(priv->clk);
>                         }
>                         regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CE=
N);
>                 } else {
>                         regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_=
CEN);
>                         if (priv->enabled) {
>                                 priv->enabled =3D false;
>                                 clk_disable(priv->clk);
>                         }
>                 }
>                 return 0;
>         }
>                 default:
>                         return -EINVAL;
>         }
>
>
> And it is unusual, but I found kvm_arm_pmu_v3_get_attr() that
> also has this double inline brace at the end of a switch statement.
>
>         }
>         }
>
> So even if it doesn't look so nice, it does seem to be the
> "correct" style.

Thanks, I will submit a v4 patch.

-Jiasheng

