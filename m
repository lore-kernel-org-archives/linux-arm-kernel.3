Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08367E6688A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkSO0ae1qgqzPLe+fBXvhHl1eDnIeDZzwTeg6SCFQSc=; b=XWi4OP0RBapLVCA2rJGzT518/M
	uK2z816RV4qub1wYjAsRdre90SgCzBk/zlnjw//RJcn380x+mQ/AU3iIyFF9Y3TFP3+caw1C8gJIw
	zlLNBy6NHhgD6Jy7PVP8twxG+PVkoOU//2XFMvj/HBHYm4FhxyrkeXW/+nVaON9ylhkhSezopjfpe
	ZhDpgoWWVz7zaOg/e2SoESow6p8RWWViP/5w1JOjbtH7R7FXxssc71zL1b2Hg6aC77rtAPWPIZPqI
	8uNC+FnkYlZ8Vwz7l6ifIq+sEGdyhsM2QBCmIzZQuYWRWbx6Didw7FEhgDd0XQuIRSBOCKQGsUgvk
	xBtrYnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyGT-00000004ws4-2lHC;
	Sat, 23 Nov 2024 22:06:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyFW-00000004wnA-3JLf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 22:05:08 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-46686a258c2so1452751cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 14:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732399505; x=1733004305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkSO0ae1qgqzPLe+fBXvhHl1eDnIeDZzwTeg6SCFQSc=;
        b=CPLj/M/t0VtcqJA0vt9RkMgX0AgecRxifkTF4iDXwKcGGqCL7t/BNjvFNf+tcmFqW5
         AlWVIx9BtnMNZ8Uc+pwNfvgd/cfL1TSE8b6+3705jSg0WYy1Z7LD9IcqXxXTQnZLd8rk
         XF/0c7bsnj7orzo85xHGoG1D9keK4BhpoygyLbCfK7d9iFFXLy9dzsFS+xR4Wfo+ocIC
         UZogiwKphL3LQsMTd5uL9pQ2g3n2pu4O/RrpEE49Uq3RhL3YSTRdWPdCY0vhJ5lb0Mnp
         McSiWGDQF4DGtmTLzGGCYem7jq7xhtBQ30wCDpqCoGOX6257nfqvGudiDNOzyVLVHRJQ
         esdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732399505; x=1733004305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkSO0ae1qgqzPLe+fBXvhHl1eDnIeDZzwTeg6SCFQSc=;
        b=aLM+4YnDR4AGQYwZ5lVgh/mWF9gNuNdchLbnDIcdmfi5IVEEJRnljBLOfdsu2va9MY
         /pQqvpIfl+vviWnfRVgC2VCDOdZO9VuOsq71mKLo8boSsgN11GpJ62eYPRG/ht7yDjvo
         bBxObpK1Pb7YIf3N7HhSLvuEE5nAWkh/cd3nY7n267gTTdzb+XhE0xamySNHR74D/+4y
         Ha8HDyxBFtrc/myz24W0xwvW0YuAVdzbP3Id6iQz25A2C1PQSDy0b+iXc6rl3cL2KRXQ
         jNq87I0pIoLMsQlXQ1p5ntgHUkjGK391qI9VPIoq8y0Mtmgmxwcu3bdn4LycdxgihgIv
         b4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVIfe2O+9TrAEZxu1MI/zkJ/jDW5H0xLt3x4doOfBn3yIiM/x+e7HUFJaN822Iv4PjXzHMg6/FCdwuxWCUKx0Ve@lists.infradead.org
X-Gm-Message-State: AOJu0YwTlymXGj7v5qZJ2imlZ49i1+6HO1TwJ1o7CPfFWmKtT9KbFBP8
	aab4iMsWRJw4qLOCcMBEcc6/xuf4gpdJrjwKmN5s1nN2safJGAsDdPfyzGPvXJK3Juq0MRHzpU6
	R2/gVE65d6fN01s/NrQVE8OmEdiA=
X-Gm-Gg: ASbGnct24S4iYSyS/gtblz4Jn0J2VStjlszD3Pv6RjL7Q91gh0fRalCouRbMv74gvto
	7jiQKipbfF4qDBUjT7gdRV2QyzIx4JX6S
X-Google-Smtp-Source: AGHT+IEDHw6BpJXxtWPVqade1NgtWHuCJEZszqIDMX8X2Z8ZsSkxcHVPRBOEeAJKY7783cobYOMI6sXBGxrZqXJvc10=
X-Received: by 2002:a05:622a:1a1b:b0:461:1c54:5bd5 with SMTP id
 d75a77b69052e-4653d52276emr93948991cf.9.1732399505536; Sat, 23 Nov 2024
 14:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com> <20241123150808.1426c6f8@jic23-huawei>
In-Reply-To: <20241123150808.1426c6f8@jic23-huawei>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Sat, 23 Nov 2024 17:04:55 -0500
Message-ID: <CANeGvZUZw3hxVGAUDhWjbWwVgfDnB33KfzitYwQ73YjLQYeqng@mail.gmail.com>
Subject: Re: [PATCH v4] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
To: Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, lars@metafoo.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, u.kleine-koenig@baylibre.com, 
	tgamblin@baylibre.com, fabrice.gasnier@st.com, benjamin.gaignard@linaro.org, 
	lee@kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_140506_830044_EC405491 
X-CRM114-Status: GOOD (  22.82  )
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

Hi Jonathan,

On Sat, Nov 23, 2024 at 10:08=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Mon, 11 Nov 2024 22:23:10 +0000
> Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:
>
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception.
> >
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> Hi Jiasheng,
>
>
> Should definitely mention the changes to use guard() to simplify
> the resulting code.

Thanks, I have revised the "v2 -> v3" in the Changelog to clarify the chang=
es.

> One minor comment on the code inline. Otherwise looks good to me.
>
> Thanks,
>
> Jonathan
>
> > ---
> > Changelog:
> >
> > v3 -> v4:
> >
> > 1. Place braces around the case body.
> >
> > v2 -> v3:
> >
> > 1. Simplify code with cleanup helpers.
> >
> > v1 -> v2:
> >
> > 1. Remove unsuitable dev_err_probe().
>
> > @@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *=
indio_dev,
> >                                  int val, int val2, long mask)
> >  {
> >       struct stm32_timer_trigger *priv =3D iio_priv(indio_dev);
> > +     int ret;
> >
> >       switch (mask) {
> >       case IIO_CHAN_INFO_RAW:
> > @@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev=
 *indio_dev,
> >               /* fixed scale */
> >               return -EINVAL;
> >
> > -     case IIO_CHAN_INFO_ENABLE:
> > -             mutex_lock(&priv->lock);
> > +     case IIO_CHAN_INFO_ENABLE: {
> > +             guard(mutex)(&priv->lock);
> >               if (val) {
> >                       if (!priv->enabled) {
> >                               priv->enabled =3D true;
> > -                             clk_enable(priv->clk);
> > +                             ret =3D clk_enable(priv->clk);
> > +                             if (ret)
> > +                                     return ret;
> >                       }
> >                       regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CE=
N);
> >               } else {
> > @@ -506,9 +511,10 @@ static int stm32_counter_write_raw(struct iio_dev =
*indio_dev,
> >                               clk_disable(priv->clk);
> >                       }
> >               }
> > -             mutex_unlock(&priv->lock);
> > +
> >               return 0;
> >       }
> Add a default for reasons David mentioned and it also makes it visually c=
lear
> that we expect to get in here for other cases but they are all errors.
>         default:
>                 return -EINVAL;
> > +     }
> >
> And drop this return as unreachable.
>
> >       return -EINVAL;
> >  }

Thanks, I have submitted v5 to include a default and remove the return.

-Jiasheng

