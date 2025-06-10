Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBFEC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBeEGoByLmNx0JymY4xT4q6q7D7j914xDLGGfvyG00M=; b=liindECpOBi2dR4h1/nV2KNFaS
	RJDMU4TaZsi7LeAdagUjTA37gpnUrwwVydmG06wNE1KEfZ6MXlu5wndCji6JXo849j4dQK4CXjGO1
	MGAiEtUnvcKqniGxI0dUiGEM3AjvnDjPRvEj2Y3sO9L1ZaVW8H4G2HznFOnGtbxSatGo1URJRE8BD
	qTxF0eKH8wU/Q7s6T80bjuN1p+9uKBlURqbdpoo5qh3VzMZlgV1yxjBUMiDDXTuJQo8dseTnHtNtc
	2hYRfqDViY6NjLjWU44qvak9hXYnvnCEwWtzqyQXNdkxCdYqL+qIeZmomLWvI38Z91KWoj+X8shfS
	Z0pu5RGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l4-00000008EWm-1WUD;
	Tue, 10 Jun 2025 22:47:54 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1UH-00000007Q1K-0AYL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:06:14 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-32a806ef504so44737411fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749571567; x=1750176367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBeEGoByLmNx0JymY4xT4q6q7D7j914xDLGGfvyG00M=;
        b=mDysMvV6ZXV4VhNYKhOwnJkjBJTUAH+PCJrTxrivx9tWsc/zsXc6bpNeJ+ppm5euK4
         8HKX1zF+SRMiuNT3GG8PmzXnxx5sO4bOOK6cDT77XNPZN3G5An+wjZ2BfsB61dPuxZES
         Ad2V0Q8VxYsFG7Xjg+QOemEm+WFlxZGrg3iTTc+VP43Qkm7W3aT4tfFUguIla6ngcSAR
         rdlPkLiO8ebeOPPNzKX37evm8yxBiMpS3Z8dyqfEIVgUey1/QfcIUYKOQO/7pkhXDqpR
         IpSLfU4pycLyNGZfiAdnmocZkPrnYN8GQqYevZceEThvz53a8M+LIPBNahfuzCkk2ClQ
         mK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571567; x=1750176367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBeEGoByLmNx0JymY4xT4q6q7D7j914xDLGGfvyG00M=;
        b=E2gDMEJghqCdA4XLuF0ZQ+LtUCmuogrU3MzHvVQ93zHZLlwmU9DDlVf3m0xA8ts7+m
         bBnDISAWlaojmWLE0bOl+wkhdHfFPTm1mMhHZOLoPZKVljkodNAlDVia5eo5SWmrYx9b
         tQD4TVi1wEBNGDud/ci61N8Jjgj/cW53vEs9a0As1USzQef/dvjGNc9DvEPrxQQxQGHJ
         YOL1E5wnadMt0L1aYaf3+dcB+G47emGNMdg5Wov/cnc+Forz4uIDOAsj27U+SV1SmBSu
         tBlOmMm1nYwB7+ROvANHtO+Znp8XSk4SZXYPf88i03Fsc5vXrO4cEBqL3GdWH71MciZz
         WgBg==
X-Forwarded-Encrypted: i=1; AJvYcCUiC4m+etTqAtjDshTU8BAkAlhwy/MiN6hIFJ5DusJnvGCnm5zARZ0pcGKN5YmGgjUEQdZu9hKg1it+aWiU/Bqp@lists.infradead.org
X-Gm-Message-State: AOJu0YxZliykegNElkVmf8vgZzEBZhkkBNBG9JHX89fLyg/vBVjywLUx
	YK+GocXw2i3x2g2INpkDdChuTEBqDiLo60OTmfBAmn8nTD4AVmlY5BpySpKdOxtBL/0mRsEEQBz
	GCxmja+7Z8i+HcOBxWzZqKP+9kPmHvTL0XeoJtOcUCw==
X-Gm-Gg: ASbGncvmnVYuYrFmtZTDKhCgkSo+tpUb4xk13fbZpB1I9N2+4LHIpVhXVGNqiwPbn26
	DXF0KOVY44MUsTOt7VJOlFjK5fRwKuTgcewnM9fXynSgVMHqm/0lY5AyyipcrJ2oc5uaiYKpKmQ
	PSiqWu4ia6gCqWl83KDNjQF78L7vCGSeKWRkoam/Njy8UyxRhNr5KPch4oLtIWEwHZetDb78B/
X-Google-Smtp-Source: AGHT+IHd3I1OVEWgMny7h2Baqh5DBJB572YkfzrpOW/nSB1wjoInAYuzH6/ihFE+HkYDZj2j7lo3/mOOSaalg7HeZM0=
X-Received: by 2002:a2e:bc23:0:b0:32a:87ce:1235 with SMTP id
 38308e7fff4ca-32adfc3f54fmr52666951fa.36.1749571567213; Tue, 10 Jun 2025
 09:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
 <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr> <CAMRc=MfCwz3BV15aATr_5er7wU=AmKV=Z=sHJyrjEvLwx2cMjQ@mail.gmail.com>
 <b9ea7e0e-7dd1-460b-950a-083620dd52e9@wanadoo.fr>
In-Reply-To: <b9ea7e0e-7dd1-460b-950a-083620dd52e9@wanadoo.fr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 18:05:55 +0200
X-Gm-Features: AX0GCFsFWH4b7yJkolxQLHQKmDUo4N7FgPgYNia8CjJoC_PxTolZxLLShEa2WEo
Message-ID: <CAMRc=Mf4qupdJEm9mWPF3-B3hprn6AvP7Po2=aQYbaSvFf8OeA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250610_090609_088257_211D01B8 
X-CRM114-Status: GOOD (  30.14  )
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

On Tue, Jun 10, 2025 at 5:48=E2=80=AFPM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> On 10/06/2025 at 23:05, Bartosz Golaszewski wrote:
> > On Tue, Jun 10, 2025 at 3:55=E2=80=AFPM Vincent Mailhol
> > <mailhol.vincent@wanadoo.fr> wrote:
> >>
> >> On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> struct gpio_chip now has callbacks for setting line values that retur=
n
> >>> an integer, allowing to indicate failures. Convert the driver to usin=
g
> >>> them.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>
> >> This does not match the address with which you sent the patch: brgl@bg=
dev.pl
> >>
> >>> ---
> >>>  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
> >>>  1 file changed, 10 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp2=
51x.c
> >>> index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f39=
76c2bf7b9a99e959c1e 100644
> >>> --- a/drivers/net/can/spi/mcp251x.c
> >>> +++ b/drivers/net/can/spi/mcp251x.c
> >>> @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_=
chip *chip,
> >>>       return 0;
> >>>  }
> >>>
> >>> -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int of=
fset,
> >>> -                          int value)
> >>> +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int off=
set,
> >>> +                         int value)
> >>>  {
> >>>       struct mcp251x_priv *priv =3D gpiochip_get_data(chip);
> >>>       u8 mask, val;
> >>> @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *c=
hip, unsigned int offset,
> >>>
> >>>       priv->reg_bfpctrl &=3D ~mask;
> >>>       priv->reg_bfpctrl |=3D val;
> >>> +
> >>> +     return 0;
> >>
> >> mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_=
write()
> >> which can fail.
> >>
> >> For this change to really make sense, the return value of mcp251x_spi_=
write()
> >> should be propagated all the way around.
> >>
> >
> > I don't know this code so I followed the example of the rest of the
> > codebase where the result of this function is never checked - even in
> > functions that do return values. I didn't know the reason for this and
> > so didn't want to break anything as I have no means of testing it.
>
> The return value of mcp251x_spi_write() is used in mcp251x_hw_reset(). In=
 other
> locations, mcp251x_spi_write() is only used in functions which return voi=
d, so
> obviously, the return value is not checked.
>

Wait, after a second look GPIO callbacks (including those that return
a value like request()) use mcp251x_write_bits() which has no return
value. It probably should propagate what mcp251x_spi_write() returns
but that's material for a different series. The goal of this one is to
use the new setters treewide and drop the old ones from struct
gpio_chip.

Bart

