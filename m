Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D46C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gq/m+uuap/74CMqzIl6lm2BPBa+nZJNp0jVRl5qDPFY=; b=GhPuFlNQ8PUoVP
	TeB0lGQbhOj9TL79X4KBj80HmvgsBwe6JaRQEvG2ZL64Xz+wyepXypyPzbM8MwdZWxFKHyincOdEo
	1EJH+DXbSZIPzZzLdAMg9QcSNodXay0l8NCxsFwtR1u8Du+PGtYRgM+ZjyU1qFGgXcrhS11mMsv9H
	MJmyg6LH4BMsI5o8p7WXF1zNTDi8FLRoOTK1kveJZtepJEq1xc+AIagYAM0IyDFhyhVgY1wZM3gSD
	9qvuQoQtFZW7sHKdBljxutENvI8v56XdGCgf7HqQ/PhjojMAFAFfIfT1XUr39QcSDKU02LH9Uepmv
	9aatJVWuFjMEXdGLvynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnsM-00000002sgV-42L4;
	Mon, 07 Jul 2025 15:35:26 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnkl-00000002rO1-2VUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:27:37 +0000
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5551a770828so3222816e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902050; x=1752506850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gq/m+uuap/74CMqzIl6lm2BPBa+nZJNp0jVRl5qDPFY=;
        b=WMNoxKD7c5WKbZNIL3Iy3/J+53y3ev5QjMOMWMv5UoF72y06AzVzqxJVdsamjufycM
         Pmsa4VZX5WUZqTemINHD3Ay27PbM90+WlHzLwapEWtTduzpMjTb+rVbclhwyximnCKqL
         +NnUS179OifBv4ydOjD8KE9oX0yVoaBptZK/IIftLJW6EKAiETfRUiKCzlrsxhPZrwQw
         HO1hyT4RVZ3WYWV9fHlt0Vn7YWjV+TsVvucaMQzFhrZtPc5mSG7l6pi22Iq5Bmn6sfkU
         rI9PgYd4OfB+6Jk5k/N96YTNejiXO8fPvtAwCQD4L+4w7+ZJsEL/keS7PSUBK0o7YeKr
         BUYg==
X-Forwarded-Encrypted: i=1; AJvYcCWHkJ7eKjnkrp36qYo4tcr67m8himT8N7vSzuC1k1QpHL2q9ArvBcK6tpbAqRP9QVjQ+dqUDuv1l+CAOP+CesiS@lists.infradead.org
X-Gm-Message-State: AOJu0YwxI0DPOhfuwWOpgRDBuFt9USbbDj9dqhVcy5YbctUpla6Zk3Lr
	p4r6Us4NZrcaI1p5NixpOt+p3/z0MENiHdbQ2t50HN3mbGJDoz1tM2QaITJK1Pi2
X-Gm-Gg: ASbGncsQoA54UszugcMOoqFz+DgUQ/Qq36ky+Vdr9BxpEsbKEqy1oggWF487o49JUPJ
	BK+Q+hZFRBEVpqBgCGhiw95zjiuLNFQGfpNfVmV1Ngu+APmcM8wnuZxaZ1vTSW2fSLvzNmDJqHJ
	TtiXQTaH3OMg4bxtUnTRxkJmQ24tvXHQ2KaP76HG9d1dnzM3XuPXygMxfe45IAmljeJT7ay2ChW
	ziHUZnBSpzBp9BWoJJAL+3uGPwGJaCD2VZ9faMaNeenWpURov3FQpVAGgLk3HFkNZn662BfExq+
	yE/AmHg4owBPUJ3MRAuZsoGAJYZTPstCdPEQCkChywyAKnq6XyJAvNXqHtTjw3302q9PYe8McZc
	AHZ/7S6dcTRlAf2ROojU=
X-Google-Smtp-Source: AGHT+IHdYEPdDv/58AAFortqw6afEsJTctgCFfZFmYBfwqgCnY1WxzWYdLYGgFfzvWpyRN5j63sSHQ==
X-Received: by 2002:a05:6512:2381:b0:553:5429:bb87 with SMTP id 2adb3069b0e04-557e5561ecdmr2422104e87.36.1751902049674;
        Mon, 07 Jul 2025 08:27:29 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d9097sm1386340e87.73.2025.07.07.08.27.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 08:27:28 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so27586791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:27:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZOZR1v9au8KNsrVWt6d5QdveAElncQbx1HuCQQ/b6bFOMkBo5tCFhPq+ruiaoNB2m11skOwnm3KmLfyk3BB9/@lists.infradead.org
X-Received: by 2002:a2e:bc1c:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32f199879cbmr21879731fa.4.1751902047688; Mon, 07 Jul 2025
 08:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins> <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins> <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
 <aGukLuQ359MOyTqT@collins> <20250707133806.5bdaa536@donnerap.manchester.arm.com>
In-Reply-To: <20250707133806.5bdaa536@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 23:27:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65--6xh-nyFEqo1xOp3hDgHAXpE8zhJ3yyD5A11J5eG3g@mail.gmail.com>
X-Gm-Features: Ac12FXwiFCZSyLXcmIIR6tnFY5t_cCAiUdzAbmkyD4wbVfCGAj0_snduGWwU3UE
Message-ID: <CAGb2v65--6xh-nyFEqo1xOp3hDgHAXpE8zhJ3yyD5A11J5eG3g@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_082735_670255_8BF42C60 
X-CRM114-Status: GOOD (  43.87  )
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

On Mon, Jul 7, 2025 at 8:38=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Mon, 7 Jul 2025 12:40:46 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> > Chen-Yu,
> >
> > > > > The block is the same, but the integration is slightly different,=
 as
> > > > > the register for the RGMII clock delays and other stuff is at a d=
ifferent
> > > > > offset in the system controller. The BSP handles this by directly
> > > > > including the register in the "reg" property.
> > > >
> > > > Ah I see, I forgot about the syscon register. However it doesn't se=
em like a
> > > > very good approach to have a different compatible to express the id=
ea that an
> > > > external resource is different. Just like we do for clocks, resets =
and other
> > > > things, we should probably find a way to express the offset via som=
e dedicated
> > > > property instead of spinning a different compatible each time it ch=
anges.
> > > >
> > > > > So yes, you do need a separate compatible string, if only to deal=
 with
> > > > > the slight difference in the integration layer.
> > > >
> > > > So maybe an additional allwinner,syscon-offset property or a new
> > >
> > > If you can get that accepted, I think that works?
> > >
> > > > allwinner,syscon that takes the syscon phandle first and the offset=
 second?
> > >
> > > I would prefer to avoid any changes to the syscon reference that woul=
d
> > > require more custom code. I only just recently found that we could us=
e
> > > the standard syscon code with the provider registering the syscon. We
> > > could drop the of_parse_phandle() + find device + dev_get_regmap() bi=
ts.
> > > This is partially covered in my GMAC200 series.
> >
> > There is already syscon_regmap_lookup_by_phandle_args which supports ge=
neric
> > extra arguments to a syscon node. It just requires a custom syscon prop=
erty.
> >
> > I personally find this cleaner than adding a property just for the offs=
et.
>
> Well, I proposed that already for the H616, where the second EMAC has the
> same problem with the syscon at 0x34 instead of 0x30:
>
> https://lore.kernel.org/linux-sunxi/20210615110636.23403-10-andre.przywar=
a@arm.com/

Nice.

> I don't remember the details, but it got eventually dropped, partly
> because the 2nd EMAC isn't supported yet due to missing AC200/AC300
> support.
> My plan was to let <&syscon> be the same as <&syscon 0>, which would
> preserve compatibility. Though I am not sure the fallback compatible is
> then correct, because it typically means that older driver can cope with
> those devices, which isn't really the case here.
>
> But we could postpone this issue as well for the A133, to the day when
> there will be a device using this 2nd MAC.

I guess I could maybe use it for the GMAC200 as well? Then if the GMAC200
is used in future chips we don't have to add another compatible string to
the driver.

ChenYu

> Cheers,
> Andre
>
>
> >
> > Paul
> >
> > > ChenYu
> > >
> > > > It seems that various other platforms are doing similar things (e.g=
.
> > > > ti,syscon-pcie-mode).
> > > >
> > > > Thanks
> > > >
> > > > Paul
> > > >
> > > > >
> > > > > ChenYu
> > > > >
> > > > > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > > > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > > > > >
> > > > > > All the best,
> > > > > >
> > > > > > Paul
> > > > > >
> > > > > > >
> > > > > > > ChenYu
> > > > > > >
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > >
> > > > > > > > Paul
> > > > > > > >
> > > > > > > > > Cheers,
> > > > > > > > > Andre.
> > > > > > > > >
> > > > > > > > > > [1]
> > > > > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/ar=
ch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for=
 the Allwinner A100 pin controller")
> > > > > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++=
+++++++-----------
> > > > > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a10=
0.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SDA */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SDA */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
CLKIN */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
CLKIN */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
TX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CS */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MOSI */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
CTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MISO */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDC */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDC */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
MOSI */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDIO */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDIO */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* =
SCK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
MCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
EPHY */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
EPHY */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* =
DOUT0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* =
DIN1 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* =
DOUT1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* =
DIN0 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* =
OUT */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* =
DOUT2 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* =
DIN2 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Paul Kocialkowski,
> > > > > > > >
> > > > > > > > Independent contractor - sys-base - https://www.sys-base.io=
/
> > > > > > > > Free software developer - https://www.paulk.fr/
> > > > > > > >
> > > > > > > > Expert in multimedia, graphics and embedded hardware suppor=
t with Linux.
> > > > > >
> > > > > > --
> > > > > > Paul Kocialkowski,
> > > > > >
> > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > Free software developer - https://www.paulk.fr/
> > > > > >
> > > > > > Expert in multimedia, graphics and embedded hardware support wi=
th Linux.
> > > >
> > > > --
> > > > Paul Kocialkowski,
> > > >
> > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > Free software developer - https://www.paulk.fr/
> > > >
> > > > Expert in multimedia, graphics and embedded hardware support with L=
inux.
> >
>
>

