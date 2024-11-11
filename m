Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88702D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4HZ0ndgBSEIXVqSFh0OWbpXw2/Yq3xXYi8N9kbsxR4=; b=VPxxIY0lylzqTSIijAhTpTgLCB
	nPhXmhXZyoCp8CqoxywYtirrstKlEv1fau357tTgoS5jGKGgrId864Xg3XxGdGc9T3veJj/NJn7q4
	rfRJdDap6qPlZ0xPTafn9cRJcy7Uc29jz8t0MwiNwJG7kMPaRVwiGVYZgaBz5EarsPaiaD3AgMciR
	Vfk9MHKzCP6c50xsLfFhUhIXtOwe37DGMXZ2LkXFXS8uEsfhq4CJca+LtlZqVgO/g1FKc+wvuD+oS
	BshTxb1WuF+CcX++IHaVJhePzysYCRCruEXIhhseVPRY1SO//tCwR3Ug7RS02xsbzyBRDiUK+oEbl
	NSd4RO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbJj-00000001Eq3-1m3d;
	Mon, 11 Nov 2024 20:47:23 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAb9B-00000001DHc-0qTC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:36:30 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-460c1ba306bso39802641cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731357387; x=1731962187; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4HZ0ndgBSEIXVqSFh0OWbpXw2/Yq3xXYi8N9kbsxR4=;
        b=TKTgDPQGwHovY/HAc1Nxy1BupMnn82r5qQ8OPuxVWkAZcoo9FS2ru1SjuOVkDUVs9q
         4DzmypzqBVFXxB/MnaAEpd1wt/9Whe9w+5hMHiqdco/KURw3IlaAvzOkaB4A+yEXCBar
         xIwET4dQmfneB1YG0+hma/7B7JpaVXa24j4S0hed0Ex5je4A8LDfqK8hsNCeGquiZ7FS
         1dEHwJ0GLJR6pGC8cInhWaCTvMMDFAl7X+cz33vjHn2tVXbL/DF4SP3R4To9EGigrwXZ
         6fyvK7jxsirAe6TIkLuyteEkphA2t2m4pchOMiPxPJMyneotHaUEYs/rMaS9X1FyJLU4
         8mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731357387; x=1731962187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4HZ0ndgBSEIXVqSFh0OWbpXw2/Yq3xXYi8N9kbsxR4=;
        b=N5omhd950QRSw/tSgqXeykU0FVSvTorv8ojcs1nJzTy5Iy/9tcm1j0OfVgcQ2o3ABE
         caBr61RmaKBwjKBsnARTz2wa5+GvqJGeIcd8s1k3tIlXNhiYT+srhbw0hSMo7DL0GOSQ
         XANrUL1EgYLfQKsFWM2U3Ie511y9Okdif0jSYCW54k6Hiq4s3pmTo546yqT4vj91sf14
         yOinyuZdeAkM+sJMIZyWOJXQMRrD9UOIkbjx541OG/1/OU0P1owsD2SQlCCKmBD1Hzre
         KyNtRpr8Gx2BPfH19PjrEgU8jm21oyvMCnhlmj3bT2YRpwDjdco1YQdpvEygNigOjH0B
         aanQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8e9qOZSdvXJ6rUh/YwS85LVLVY+09gGxLMS1trINNTG/7vOaU8GkRQevgCOZ/sPfLb4cvCH7BndrHVxgVD5cT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo/INLQoo4TOkh3ymyDGMVf7JhhF0qw/fGvtPW56Ua+f4gajBD
	bd00xmg4y2fTP7y7Tc5nEQAKV+50qldOOJluE4ZAoQeR49V20p563aP1Ht2m6G3Fzb4V4S/9mBV
	Gk+NdA2Leg/aUYMjTMHUo4b5AeTI=
X-Google-Smtp-Source: AGHT+IGGFUQEIwnDUiJPFPcrC/oKvlw+uylOh5ATXUlyzXultio50WXUAADdwKWpkEa1W8MriQQZjOqXmZVZqAV7yKc=
X-Received: by 2002:ac8:7dc8:0:b0:461:29d9:e86 with SMTP id
 d75a77b69052e-4630921899amr212981011cf.0.1731357387457; Mon, 11 Nov 2024
 12:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com> <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
In-Reply-To: <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 11 Nov 2024 15:36:16 -0500
Message-ID: <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241111_123629_263925_B9210E9B 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, Nov 11, 2024 at 2:45=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 11/11/24 1:19 PM, Jiasheng Jiang wrote:
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception.
> >
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> > Changelog:
> >
> > v2 -> v3:
> >
> > 1. Simplify code with cleanup helpers.
> >
> > v1 -> v2:
> >
> > 1. Remove unsuitable dev_err_probe().
> > ---
>
> ...
>
> > @@ -492,21 +495,25 @@ static int stm32_counter_write_raw(struct iio_dev=
 *indio_dev,
> >               return -EINVAL;
> >
> >       case IIO_CHAN_INFO_ENABLE:
> > -             mutex_lock(&priv->lock);
> > -             if (val) {
> > -                     if (!priv->enabled) {
> > -                             priv->enabled =3D true;
> > -                             clk_enable(priv->clk);
> > -                     }
> > -                     regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CE=
N);
> > -             } else {
> > -                     regmap_clear_bits(priv->regmap, TIM_CR1, TIM_CR1_=
CEN);
> > -                     if (priv->enabled) {
> > -                             priv->enabled =3D false;
> > -                             clk_disable(priv->clk);
> > +
> > +             scoped_guard(mutex, &priv->lock) {
> > +                     if (val) {
> > +                             if (!priv->enabled) {
> > +                                     priv->enabled =3D true;
> > +                                     ret =3D clk_enable(priv->clk);
> > +                                     if (ret)
> > +                                             return ret;
> > +                             }
> > +                             regmap_set_bits(priv->regmap, TIM_CR1, TI=
M_CR1_CEN);
> > +                     } else {
> > +                             regmap_clear_bits(priv->regmap, TIM_CR1, =
TIM_CR1_CEN);
> > +                             if (priv->enabled) {
> > +                                     priv->enabled =3D false;
> > +                                     clk_disable(priv->clk);
> > +                             }
> >                       }
> >               }
> > -             mutex_unlock(&priv->lock);
> > +
> >               return 0;
> >       }
>
>
> Another way to do this that avoids changing the indent
> so much is placing braces around the case body like this.
> This also avoids the compile error from using guard after
> case directly.
>
>
>         case IIO_CHAN_INFO_ENABLE: {
>                 guard(mutex)(&priv->lock);
>
>                 if (val) {
>                         if (!priv->enabled) {
>                                 priv->enabled =3D true;
>                                 ret =3D clk_enable(priv->clk);
>                                 if (ret)
>                                         return ret;
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
>
>                 return 0;
>         }
>

Looks great.
But there is no indentation between "switch" and "case".
As a result, the closing braces of "switch" and "case" will
be placed in the same column.

Like this:

switch(mask) {
case IIO_CHAN_INFO_ENABLE: {

}
}

-Jiasheng

