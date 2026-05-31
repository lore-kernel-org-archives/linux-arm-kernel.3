Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B26CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMYihA9IlT7MGBAsYy2tN6OXn0Itk+3Xj0eqVjjKY/M=; b=i7JE+V3xAzzwwMrRAi9kBWnyMb
	RGGl0Uquv1O2XP//Ai9Fbjwe5kCpS5Y25hVdqzjeP13wthI6IXTnUxfxe9vnTjOsYUkj41Lac2209
	lER37a20Ynzxl85plOb1QiOQHRskwdPqMWpufM7Oa+od3BuM6MO967wACbyLbf0Sd8+BBbDgGv2bl
	HmHR2Cd8aVyJ0ROCk3PnxnZYiFiKiL+OpDoJgbp9RLgJ5ApUhNaiz0TcVZ9SRUD66homqQ+DI5EMa
	3sQVVrOZ+QibiP+gtc2BALLPQaOcINV4pP+mJmq8mktI6/hreUHC5EIQFpmj0kBHhwWHg3zKpkCPz
	qhUxTEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdMS-00000009UA2-1fX9;
	Sun, 31 May 2026 10:25:40 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdMP-00000009U9Y-0ycE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 10:25:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-396753f343aso5309321fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780223135; x=1780827935; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMYihA9IlT7MGBAsYy2tN6OXn0Itk+3Xj0eqVjjKY/M=;
        b=KPIoXNtFCcSWl0JquWdUz4DY88Ec4dOaQCLLEnTO93AjP17lL4pyACnBOAcyAnFUne
         8ANwkhNNmvoE4VLC/oeNJUtqOuejU8okHWAOX7QvN4mwhogqkczCvuW5tNVBg6RH4+o/
         lDu1SOy8uba/T70WGGT6bhyzc4MLF9tWTfgfGnV/iBjoysiS/x25/27F3oVKqrmnPRWO
         c2h8yxwELPUPp3qKG9XB48sdd7SSotTvF52OnqTV8F0m8ayF+KcGJwwzrwZvo/T5jdb/
         9B8W+4quTf+PfsaolWaksH8eaO9DOFHhmIVqYROerC8g0T1Y7LknBhECFmHbE1bSTFxQ
         1lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780223135; x=1780827935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMYihA9IlT7MGBAsYy2tN6OXn0Itk+3Xj0eqVjjKY/M=;
        b=fD2K2jPx4UTsbkY0ANJv3hU0bEll4qXBv2GgFfYyEn+Dk9809Gp7b/UbQEJ0hgzNeh
         2soQn4PoiNSk022gFJzDwKyIbL6BjYYbXVCvV7/Un3Jlu7n6s4cFvJFA+4sZPni3NRUa
         Bi+8FX7rfieO8WDJLbAW0eDXF5N+KU9KtEMATITcJiwCDftiQoTy6mkAHqbcRphrs1F8
         wicSbUH/NdzuRKP/WKPMs3a24fmuUpjZzlMcGGcKZ+8UXzvPPAuK/PNxd7KT/G22RyoJ
         gHJVeMV8EV6m+hR5WrehdCr0JuwHwN5HnCeoggLQyXLL6BRFHrhTeF+UT+VG1KcBWwQP
         cqsw==
X-Forwarded-Encrypted: i=1; AFNElJ9+wr7p3l44gOdK0tFEtCVxf0CL6Jmz7fiMh1abSXL6wBe43ji8GgvgfN6H6CM3e7nYZNXHJcbA4eVz8nf3EP+J@lists.infradead.org
X-Gm-Message-State: AOJu0YwgR2giZiItudhMBVxgWV9S7KzQbzbU3+eMwFdw4dPI5acnLA73
	ZXW8uTK+i3Q+ntmvGaVfUnWGuwFh2UKFZDCceEW5DSm1MDbof3fUCZhX
X-Gm-Gg: Acq92OGLIKRx4gM64pw9y3JS/pp0T2vAtfXYJM+QBUu92C2oUMNM0G8sClA/KZ9W77F
	QfbdN3aSi9tGNL16xYVFvyd4xduqIMmtopg+guOWrcRcBA0RKgJOAlD61yDzLWnqVPgtuhtjlWl
	7BWaIXUblwWLNxuiA9ZV4nUNACU3ara+Pm3fuPcxMOucaxKcRbFRd1A3Chm57uv2CEKERkTWwlD
	KFSBEDWGLEE3Wv1m2+QFNOiKhmQWlOY85XNhxWr9oFVkbr4OkUu68YIio5J+VXoiv90ARc6OYhz
	Kwd514TUx7zvFnK4XjGBqMlP4uYb/U93NNkJxSNu/GnuJk11O7yyTxQDsTlgUlYl0hEHK4ytSBp
	z0yBb21h5zK2LFRJKmloArqb0hYhwzU7ysOue5O6Bwr3QGqymQwaDTeKDDDQ8osPHrRRVnwXRWn
	R0tS1zF+fh3jXH/1Djd/JnxDZpxm+8NNePNaJUmi893gqqZq6hiRDPwEWEbUb9XCjIFOIFT4o=
X-Received: by 2002:a2e:a548:0:b0:396:78b8:27df with SMTP id 38308e7fff4ca-39678b83166mr6460391fa.8.1780223134727;
        Sun, 31 May 2026 03:25:34 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3965b3cb6fesm14245011fa.14.2026.05.31.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:25:33 -0700 (PDT)
Date: Sun, 31 May 2026 12:25:30 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Message-ID: <ahwMmgy8hRaQ-x_7@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
 <ahX4_WaqodYt3PmD@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ahX4_WaqodYt3PmD@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_032537_326554_A8B2006C 
X-CRM114-Status: GOOD (  26.13  )
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

Hi,

On Tue, May 26, 2026 at 09:48:13PM +0200, Wolfram Sang wrote:
>=20
> > +Multiple muxes in series
> > +--------------------------
> > +
> > +When multiple muxes are used in series the same rules applies.
> > +
> > +Transfers to D3 may interleave between select-transfer-deselect to D1,=
 which
> > +results that the bus speed to D2 or D3 will be at 100KHz.
> > +
> > +Transfers to D2 may interleave between select-transfer-deselect to D1,=
 which
> > +results in that the bus speed to D1 may be at 400kHz as the transfer t=
o D2
> > +will set the bus speed to before the transfer to D1 starts.
> > +
> > +This is probably a bad topology ::
>=20
> In documentation, we probably shouldn't say "probably" ;)

Answer in next mail.

>=20
> > +
> > +                     .----------. 400kHz .----------. 100kHz .--------.
> > +    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
> > +    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
> > +    '--------'  |    |  mux M1  |--.     |  mux M2  |
> > +                |    '----------'  |     '----------'
> > +                |  .--------.      |  .--------.
> > +                '--| dev D3 |      '--| dev D2 |
> > +                   '--------'         '--------'
>=20
> 400kHz leaking to a 100kHz device is bad. I guess we cannot do much
> about it here because the bus speed is a board specific parameter...
>=20
> > +Idle state
> > +-----------
> > +
> > +Muxes have an idle state, which is the state the channels are put into=
 when no channel
> > +is active. The state is typically one of the following:
> > +
> > +- All channels are disconnected
> > +- The last selected channel is left as-is
> > +- A predefined channel is selected
> > +
> > +Muxes that support an idle state where all channels are disconnected a=
re preferred when using
> > +different bus speeds. Otherwise high bus speeds may "leak" through to =
devices that
> > +may not support that higher speed.
> > +
> > +Consider the following example: ::
> > +
> > +                          .----------. 100kHz .--------.
> > +        .--------. 400kHz |   mux-   |--------| dev D1 |
> > +        |  root  |--+-----|  locked  |        '--------'
> > +        '--------'  |     |  mux M1  |--. 400kHz .--------.
> > +                    |     '----------'  '--------| dev D2 |
> > +                    |  .--------.                '--------'
> > +                    '--| dev D3 |
> > +                       '--------'
> > +
> > +If the idle state of M1 is:
> > +
> > +- All channels disconnected: No problem, D1 and D2 are not affected by=
 communication
> > +  to D3.
> > +- Last selected channel: Problem if D1 was the last selected channel. =
High speed
> > +  communication to D3 will be "leaked" to D1.
> > +- Predefined channel: Problem if the predefined channel D1. Set predef=
ined channel
> > +  to D2 as D2 may handle 400kHz.
>=20
> ... unlike here. We have MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT defined
> already. And I'd think we should only allow bus speed switching for
> MUX_IDLE_DISCONNECT to avoid out-of-spec scenarios. Opinions?

Answer in next mail.

>=20
> > +Supported controllers
> > +-----------------------
> > +
> > +Not all I2C controllers support setting the bus speed dynamically.
> > +At the time of writing, the following controllers have support:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +i2c-davinci                    Supports dynamic bus speed
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> This paragaph is easy to get outdated. We can document that only
> controller drivers with the callback function implemented will work.
> People then can find out if that applies for their driver...
>=20
> There are some grammar correction in the Sashiko-review[1]. Most of them
> look correct to me. Can you have a look at these, too, please?

Sure, thanks for pointing that out. I will update the patch with the
grammar corrections.

>=20
> [1] https://sashiko.dev/#/patchset/20260324-i2c-mux-v9-0-5292b0608243%40g=
mail.com


Best regards,
Marcus Folkesson

