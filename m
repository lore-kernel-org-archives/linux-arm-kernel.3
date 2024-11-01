Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C9E6F075
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCb0avfMfhqFRdPMe3Ycp6E7ngzUGoHw4RlfxTUvmP4=; b=LPv+rfYriEBnNKJM46Zg86MxDK
	2yvIeCmwUGllyxCMtauZrBsweyPCsHDvCAJZar+jHM0SB7ultMTat/x4k5PI3CiFfcV40UhiHhUHJ
	1KNDUCnZ0PQU9Uotdlf+3zEz2OlTYS1hjjWXG5z2B4luRwrTd1qEm8NHpVyJyjh0ek8YriRJ/7gJO
	LQ7cio5A3NYi4TzjIfcoRG3yvajgSxZCWeayvboZZYIRPcFgxYGOhOyRVih6KWPA5S470yE1j6vPP
	n0EXxfhIC4zaX8cnwl2oRTLBV9g6jx80rncxyKIft/NDtExSa0dstjEthYoLuPF2rCIVSmm807ekI
	o+1glM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wGW-00000007xnf-0KmX;
	Fri, 01 Nov 2024 18:20:56 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wEp-00000007xaj-04Nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 18:19:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso257316466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730485148; x=1731089948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCb0avfMfhqFRdPMe3Ycp6E7ngzUGoHw4RlfxTUvmP4=;
        b=Isus5dr0SH5aysMlbeLICQNFQwCmCSeWUGlEVT7kzy86xWpo8Zh5zVgJG6Mw61849J
         WLcMplqBikkfjhfEOvEevUw8lIvHqIqKeK/fFCzO6FTXt6YHdWR+Egz0auzndSutGn+2
         J5QL1IcMV+IHnt9cAlOSB5AvwoWd/hLkFgoP/T8FCi4ER4B/VCRFyNFU39Bv496LlT1F
         f6JGeuipG20eXwIhGhVRy4Xi1bC26Lb2FBtfu5m8eetf1xgjb07CbT//wpqrCosrpKoh
         FXMM/GJoe+3nL57O8PRpw7KVcP7I+AFEMVpgGWGvrtBi22D18eG57KKu1064Nzoiu7WV
         QuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730485148; x=1731089948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCb0avfMfhqFRdPMe3Ycp6E7ngzUGoHw4RlfxTUvmP4=;
        b=p1xfMlGg9DoKbpV7xliElWDcjRr2OUmCe8Z1cmqBm7aribmBpPk8czt99cyb71rxoN
         ZY/xmKRhNlNNHtaaMygZXsUwFfQGBPn82X9pOdkw7hE04AL1NC6G7hr7qdbC0X/AKUiQ
         hcxJn8/mjl7osfoTklrT1ukexSptrwzltei3uYYPSMp3xfKH9mzUT3Yvt9p4HE+VY9YP
         kQFi2xSNJOMoJR7ue8U2ucAjcXM9ovrC60y/nHEjqayrKynUHdl75423K3R63j4PtYpw
         pQ8TIx6jbtegSG1YLVvoxa2dbPbDYKCwEuM9IdA0KEzkU90svsZJR6JzPbck+V38/19L
         h/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXLT8Zivi+q/KeiAvF2B25eMYSGsr5Oim2pwdlpTHzNAF72Mt0Z371YDSa565OFc3Xnh6nKpK7pSJy7kEmbJ1F0@lists.infradead.org
X-Gm-Message-State: AOJu0YzQRFa96TL4E0s4p9zn8cd/N+YXPiEHf1O/HhhBr4SucDwuUt1Z
	98S8bq1GMIQ05jDrVHhS0E8S6qM9X5zxqv1MXECS+YthaAi/gG/0RYhmYWjF6xpAtdvP9D11pAV
	j0IKwtmMX3fJmCpvsLHY4RY8fAqpjGYC2sn7VHw==
X-Google-Smtp-Source: AGHT+IFcq0AMZn+pZ24DpM6HGZ4OavdIPRNi8d8rMXlbIsaq2gBK6JoQrQewB37SFhHsyDDEtF8jHre0Mg6mo5VxsRA=
X-Received: by 2002:a17:907:3da9:b0:a99:e98f:e73d with SMTP id
 a640c23a62f3a-a9e5097d255mr759902366b.37.1730485148179; Fri, 01 Nov 2024
 11:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-6-2bcacbb517a2@baylibre.com>
 <ef4fe230-b7fb-4f7e-9173-ae85d305e9ae@baylibre.com> <20241101154451.227defba@jic23-huawei>
In-Reply-To: <20241101154451.227defba@jic23-huawei>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 1 Nov 2024 19:18:48 +0100
Message-ID: <CAEHHSvZxgREMpA-kC7zarRZAp=bU6dcc2-3qjZU8o01BP3bSzA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] iio: light: adux1020: write_event_config: use
 local variable for interrupt value
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Ramona Gradinariu <ramona.gradinariu@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Dan Robertson <dan@dlrobertson.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, 
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_111911_346862_EDA7C33D 
X-CRM114-Status: GOOD (  29.21  )
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

Le ven. 1 nov. 2024 =C3=A0 16:45, Jonathan Cameron <jic23@kernel.org> a =C3=
=A9crit :
>
> On Thu, 31 Oct 2024 11:27:45 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On 10/31/24 10:27 AM, Julien Stephan wrote:
> > > state parameter is currently an int, but it is actually a boolean.
> > > iio_ev_state_store is actually using kstrtobool to check user input,
> > > then gives the converted boolean value to write_event_config.  The co=
de
> > > in adux1020_write_event_config re-uses state parameter to store an
> > > integer value. To prepare for updating the write_event_config signatu=
re
> > > to use a boolean for state, introduce a new local int variable.
> > >
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> > >  drivers/iio/light/adux1020.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux102=
0.c
> > > index 2e0170be077aef9aa194fab51afbb33aec02e513..db57d84da616b91add8c5=
d1aba08a73ce18c367e 100644
> > > --- a/drivers/iio/light/adux1020.c
> > > +++ b/drivers/iio/light/adux1020.c
> > > @@ -505,7 +505,7 @@ static int adux1020_write_event_config(struct iio=
_dev *indio_dev,
> > >                                    enum iio_event_direction dir, int =
state)
> > >  {
> > >     struct adux1020_data *data =3D iio_priv(indio_dev);
> > > -   int ret, mask;
> > > +   int ret, mask, val;
> > >
> > >     mutex_lock(&data->lock);
> > >
> > > @@ -526,12 +526,12 @@ static int adux1020_write_event_config(struct i=
io_dev *indio_dev,
> > >                     mask =3D ADUX1020_PROX_OFF1_INT;
> > >
> > >             if (state)
> > > -                   state =3D 0;
> > > +                   val =3D 0;
> > >             else
> > > -                   state =3D mask;
> > > +                   val =3D mask;
> > >
> > >             ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT=
_MASK,
> > > -                                    mask, state);
> > > +                                    mask, val);
> > >             if (ret < 0)
> > >                     goto fail;
> > >
> > >
> >
> > Instead of introducing `val`, I would rewrite this as:
> >
> >       if (state)
> >               ret =3D regmap_clear_bits(...);
> >       else
> >               ret =3D regmap_set_bits(...);
> >
> Good idea.  Rather than go around again and potentially stall the end of =
this series.
> I made that change whilst applying.  Shout if either of you doesn't
> like the result. Diff doesn't do a perfect job on readability (it does
> if I add a line break but then the code looks worse in the end!)
>

Hello Jonathan,

Looks fine to me. Thank you for doing the change yourself.

Cheers
Julien
> From 06a1ca816450d1b5524f6010581a83ab9935d51b Mon Sep 17 00:00:00 2001
> From: Julien Stephan <jstephan@baylibre.com>
> Date: Thu, 31 Oct 2024 16:27:01 +0100
> Subject: [PATCH] iio: light: adux1020: write_event_config: use local vari=
able
>  for interrupt value
>
> state parameter is currently an int, but it is actually a boolean.
> iio_ev_state_store is actually using kstrtobool to check user input,
> then gives the converted boolean value to write_event_config.  The code
> in adux1020_write_event_config re-uses state parameter to store an
> integer value. To prepare for updating the write_event_config signature
> to use a boolean for state, introduce a new local int variable.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> Link: https://patch.msgid.link/20241031-iio-fix-write-event-config-signat=
ure-v2-6-2bcacbb517a2@baylibre.com
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/iio/light/adux1020.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/iio/light/adux1020.c b/drivers/iio/light/adux1020.c
> index 2e0170be077a..06d5bc1d246c 100644
> --- a/drivers/iio/light/adux1020.c
> +++ b/drivers/iio/light/adux1020.c
> @@ -526,12 +526,11 @@ static int adux1020_write_event_config(struct iio_d=
ev *indio_dev,
>                         mask =3D ADUX1020_PROX_OFF1_INT;
>
>                 if (state)
> -                       state =3D 0;
> +                       ret =3D regmap_clear_bits(data->regmap,
> +                                               ADUX1020_REG_INT_MASK, ma=
sk);
>                 else
> -                       state =3D mask;
> -
> -               ret =3D regmap_update_bits(data->regmap, ADUX1020_REG_INT=
_MASK,
> -                                        mask, state);
> +                       ret =3D regmap_set_bits(data->regmap,
> +                                             ADUX1020_REG_INT_MASK, mask=
);
>                 if (ret < 0)
>                         goto fail;
>
> --
> 2.46.2
>
>
>
> >
> >
>

