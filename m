Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152AFC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=; b=uJrbVEVrrwW6t3zRPW798aLVg3
	CTfzP3Tif41X5vZb5bNFnaZX2muISZkxAcm3Z7YOo/inUZ3Xztxw8azCC1sLemDH/9Sv2SyuSf77f
	XjZSLGro4z7Pjv1wsno9CLbNUcdlIrTM8mAwU3z6p6EjevZq1IG5XSL/vKG585UegLeMMojVHHKpv
	zfI6/h1TGWJZv9pLw1MAD3lHpxb0dWuFheRUd2KsjTWAdAtCN+Wvm7er8ESdxoVkijIBtexaifu94
	6vRquORkwnzsqXCbmDVr3BS1A6nnAxOb+Q82a4eEihXGreHx57gxH4B/2adzHL1pg3zLXrne2H4qH
	Rt9gX0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Tj-00000007Zzl-1aGj;
	Tue, 10 Jun 2025 17:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzc1-000000074vu-2XAy
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=; b=kfes+GuS4C4BeFLviVH9ljU5o0
	Tuyw1kC95WpOW5j8Y+paGqAH5mMVMID34Fe3di6TE0UTjUZZNyNb/Pfjh7Ka9GYDQsZ0DORTf4xaz
	aA/g4VaRvhuzKOwdkRrZW0u5KqEINTwwxYP7CHYyH8Qf8abriRNsQ3HmViljfDcYXgQoxJPHSdUdk
	zEZOyzaoYJNDHLciJbeosmE7eT3bPttmr7AnqBlvGdwhO0fJvFOq0lVZpsvvEA9/KRnAZNhhE8hIg
	YVYDVj4P++UaSyQXgIAEEFkyhf9bC7kdBuaUDNydjbM+EeC9BbGezNQzkaJCdlODIrXb2+eQxPPVH
	6FCQAZow==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzbz-00000001rDN-28Ef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:06:01 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso50700721fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749564356; x=1750169156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=;
        b=Nyuuz8/z4Y8l1OAAuvVNzW1Um8XvD6TUamkMKz87TuweND+cffD2qrgI1y0Auonz8j
         wIMV8cAMGGwI9ipfAjVr+RcCW3daepXTlJfXECjh6hS97ZhA0t40/if7VEUJQEy1tjOM
         qZpTy18N0rUWTVcs/SmrOAXUPz/eu4ZnSi54LP2NlamdVIhMNS8DULIT5o/XruIlejCS
         /akoYMImj3PfgS9WlkOunpZgzxZSkF/iXQw0Cp0S8wvWT+cGDgCOO/nGYBij+6IHFWiX
         +imLQNM4VK2I+amiDNHvELnpw8lXy9kWGLTSPLdXuMeEjtrX/VyQ3fDFUIK3ASW5zIGp
         jx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564356; x=1750169156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=;
        b=VtibY+c/5OFzDv0bm8nG8O+QbHbAbwZUUvDdUWLQC3pb6dxUlVMUCrvrD7RXU93XbB
         HfB4rPQJvtBCgfara4AvoxGP4LGwPBc09JkpW1RvR+hnlzatrF2Szf02jtF8pFLAE1wC
         +yYszogVK+KKezcT+//+sTm+mI1xNGJecn5oDQ+k1ZSn3OdBPzugZxMbY0g0gF+BB5gW
         Zid+G9lIlwizJ3i4e1r6jDUzMQY0n06IG+hWqt57USSmgZ9Mg1Lv2coykvzOp6axyHLX
         NbDeP/+6ideIZkcCBnxj+0LSzkaRVVYocN4mrRgexuv2UhQthIPbyAZMMxphSK0lTU3P
         HQrw==
X-Forwarded-Encrypted: i=1; AJvYcCVRUP6etQoqtRAA0AP+OwQRZmaKMQhlnsX9dNGGyEIDJ39gPDvd8pbwx2XogT77aoi08BwL9AZJtJp/4LyHVxaK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzy48+aoG8SwPTkcF+ynY87KgCWUEyK3iZuhiGqzAwE86HK4v3
	Bs99jiAReCvSvc1MlJOWRLzQ5/7veRktWRFiszF2wcKx2FtpCrPWiGCmbIiw0G4TjHhWtw05hNm
	qUFprnaql/BnRmN6SGfj4ugrAuL9SI2Z2hvUbF3QFBQ==
X-Gm-Gg: ASbGnctua8J4TDGYSJLFcrr2aED8rKS6ZTzbrMldPxEOuh4mf+wAgZ2d53H3VhvW0YE
	FWdmHrOGTnugdQfkmNHZQLdwaO5nmjbfJnR0d7CrO/uundwiMZHsp9yApz44n5Z+7X89ZBFr+A4
	PVjuN0N35GAtPfo0O+oTM7rsqbAFJ7iz1nMdyjGOh57RKO+PDPT8xwk4wDKweZ3PTSWV9oTRq0
X-Google-Smtp-Source: AGHT+IGMo5nFepHm6Jb8myrJnf1+8r8NeSUFkOpNLmlYqlQxjgnpXV7nPyOaCRaS1k1ZDZMWIDYqubJ68xfi3XL0kUk=
X-Received: by 2002:a2e:a585:0:b0:32a:85ad:2148 with SMTP id
 38308e7fff4ca-32adfc55558mr48698001fa.8.1749564356227; Tue, 10 Jun 2025
 07:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org> <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
In-Reply-To: <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:05:45 +0200
X-Gm-Features: AX0GCFvZApBk6UP-dxTG2kWDbOfc7qUQfTVpw2yDagExp_rgnAnOYdtyDfv1kN4
Message-ID: <CAMRc=MfCwz3BV15aATr_5er7wU=AmKV=Z=sHJyrjEvLwx2cMjQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter callbacks
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150559_798472_B959F318 
X-CRM114-Status: GOOD (  24.67  )
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

On Tue, Jun 10, 2025 at 3:55=E2=80=AFPM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> This does not match the address with which you sent the patch: brgl@bgdev=
.pl
>
> > ---
> >  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251=
x.c
> > index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976=
c2bf7b9a99e959c1e 100644
> > --- a/drivers/net/can/spi/mcp251x.c
> > +++ b/drivers/net/can/spi/mcp251x.c
> > @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_ch=
ip *chip,
> >       return 0;
> >  }
> >
> > -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offs=
et,
> > -                          int value)
> > +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> > +                         int value)
> >  {
> >       struct mcp251x_priv *priv =3D gpiochip_get_data(chip);
> >       u8 mask, val;
> > @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chi=
p, unsigned int offset,
> >
> >       priv->reg_bfpctrl &=3D ~mask;
> >       priv->reg_bfpctrl |=3D val;
> > +
> > +     return 0;
>
> mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_wri=
te()
> which can fail.
>
> For this change to really make sense, the return value of mcp251x_spi_wri=
te()
> should be propagated all the way around.
>

I don't know this code so I followed the example of the rest of the
codebase where the result of this function is never checked - even in
functions that do return values. I didn't know the reason for this and
so didn't want to break anything as I have no means of testing it.

Can you confirm that you really want the result to be checked here?

Bart

