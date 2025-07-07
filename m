Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpwrIqvCgmRZGYtw8vPnIP+63GX8mQwr98rVO4r7ZcQ=; b=dSpJ7tNKBcn1xs
	T4AQmSD+9FSOG49XBAShmcKVQr2YjcG30aDOK8q3YdNxyqWu0Qh48NzvOz2IzThyHLhyN9e/bnK42
	2uEhNqDY3pExVZxx+6dcTGp7ZRxj5f+VFZvnCSpYlTdcb2a2mnl69tnfZ6+U15zF6wDLiAM4hWYdv
	PKwGkMxA76Ewjaw3V1qkIm8Zb3Jgiz8JnM9u6HvScU1H7ZbZTaNTcVenbxt2ffEVWy8WORzgUHyp+
	P954auxD333vj6DLXpSbermOYzVP9+J58KRAGOQdb0GJjcWI3QXJcnUi8Uh97yNHAaHj0Dc3tGO4U
	rtGiXYXABhTGeUR7xvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcGt-00000001GVn-1Z8e;
	Mon, 07 Jul 2025 03:11:59 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcDB-00000001G9P-1850
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:08:11 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553d771435fso2160742e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 20:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751857684; x=1752462484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpwrIqvCgmRZGYtw8vPnIP+63GX8mQwr98rVO4r7ZcQ=;
        b=JID/eTB/QZjDsLWpOaZ9BlWGy/4+3EFhK3LS2t+uyJ4pV816Lg4dBcKGN3bSRed3zo
         tdVqhz/Z2wQlQxYmjTz6ahF1CFeQiJmOntVbvlAgJlG+2AF1fqQYaZoiFG88sk8Lsmnn
         EVn21+KO+dAgeI5wptnSyTQZZ2NWSu8+epE5pgG3wZmvnYxigAXzdOHAymqj8w/u/NHa
         HzgsGpwOJnv8R0BFQHdPodUiGQND7tcsoODRXbESG0hhkx/2e84QSTqaaOy+7v9hRXTC
         a+287Jj3zIG3RoqNNZPtFaw/UcVgZCUC+pEIDWysxkMvG3WoQXdJWlO85Fwta7/i3wKu
         4Gvg==
X-Forwarded-Encrypted: i=1; AJvYcCU5vG76tWtj/Zf3mLSefgtCBrFn1eLEPdpgR3nX1uELN3YfcL6NsF370wWSbf93tHY27qV4trVTv1BdqoDfZ1YK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv53lHwVYuPEGGs+tzo6PbVuE5GvK6aVgYPcVu2PxExDbU64O5
	GMYqQ6DuH8zsOmEjM5SrLXDJQoPUYojSO6Yc1iOno08uxhE8XLWXUkxXSlyJnae3Iok=
X-Gm-Gg: ASbGncvpelV9BnjBD4QGquBQ3pv6WUrcM4jdxEbawDMRl4Z69qUcE3GkB/8B91omc17
	xSPRgRlrvupZWRZlr73N0mvK3BYFACiTWVnPpmYDF+tGXQZcSEKhTAJS2fhqxL/qjo/pyvyDKGe
	pf5HsamJfpQKqB7PwA5yrCxCJjTaexI1IAmxQznlcb6mJSMgN0MuVs3eTAX2T2YRhaETxSpdX9B
	Ju8fyrZSlkKqROndPmKofBYrKqc8TxuRO9TdaosLwT0qu/+YWGQik//fyldsU5MIVWEbN9+OZFP
	vbirKZRLPu58y+rnbp1BPjZNdkdu8BT2/1EDxah8QanuRuhKKhC5Lo7ZPL/lFqBhjBUd3dJODlB
	5F9KSntMiBCDZQbQ5tdM=
X-Google-Smtp-Source: AGHT+IFJmxHnmGaOPVhlSaaXk2DHgFCWyT5JMM6h5EcGtQL6kHyTSa+pycyct7NuJGl6Q1zklnmfng==
X-Received: by 2002:ac2:4c4e:0:b0:553:23f9:bb37 with SMTP id 2adb3069b0e04-557e5599136mr1660928e87.40.1751857683859;
        Sun, 06 Jul 2025 20:08:03 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556d5c44754sm1089121e87.208.2025.07.06.20.08.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b5931037eso21135331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyTRGinXpXdJ7OZ5ngeOXt2Xd0as8DYk7QO+Zlp+c1EDTyaWbClbEq6yxxlfDGgWHfXY5A6HWgOAEihsQf498l@lists.infradead.org
X-Received: by 2002:a2e:a009:0:10b0:32c:4306:5a0f with SMTP id
 38308e7fff4ca-32f19b851d2mr10639921fa.30.1751857681789; Sun, 06 Jul 2025
 20:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 11:07:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzzu3aJMTQ8pfrhQCoLQSJDG0pZU4ID4TpVVBWoaKajpCQaMSfB2jg324k
Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_200809_347375_4EF467BD 
X-CRM114-Status: GOOD (  43.41  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Jul 6, 2025 at 11:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Andre,
> >
> > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > trailing "0" that has no reason to be.
> > > >
> > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die:=
 it's
> > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > registers (@0x5030000), and there is a second syscon register
> > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > It seem like no suitable pins are connected on the A133
> > > > package, but that should not affect the A100 .dtsi (we use a simila=
r
> > > > approach for the H616 and A523).
> > > >
> > > > So I think we should keep the emac0 name.
> > >
> > > just thinking that it's even worse: this changes the DT visible pinct=
rl
> > > function name, so it's a DT ABI change. With the "emac0" function nam=
e,
> > > Ethernet would work with stable kernels already (as everything is
> > > compatible, it's just about DT changes). But with this change, pinctr=
l
> > > drivers in older kernels would not match.
> >
> > Given that the port is still very early and experimental and has very f=
ew users
> > and no field deployment so I don't really think it would have annoyed a=
nybody in
> > practice. But yes in principle you are right, while the header renames =
keep the
> > same value, the string names are used to match the device-tree definiti=
ons and
> > this constitues ABI that needs to remain stable.
> >
> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.

FYI I dropped the dts patches for now, though I forgot to redo the -next
branch last night, so today's linux-next might not reflect it.

ChenYu

> You definitely need to send a revert for the DT binding patch that is
> already in net-next.
>
>
> ChenYu
>
>
> > Cheers,
> >
> > Paul
> >
> > > Cheers,
> > > Andre.
> > >
> > > > [1]
> > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boo=
t/dts/sunxi/sun50iw10p1.dtsi
> > > >
> > > >
> > > > >
> > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinn=
er A100 pin controller")
> > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > ---
> > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----=
------
> > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >
> > > >
> > >
> >
> > --
> > Paul Kocialkowski,
> >
> > Independent contractor - sys-base - https://www.sys-base.io/
> > Free software developer - https://www.paulk.fr/
> >
> > Expert in multimedia, graphics and embedded hardware support with Linux=
.

