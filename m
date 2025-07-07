Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D39C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sLO+XCFjd6kZQcTbPTUaHXEMjyFiunpLQXn/d3kRmo=; b=Rxg2Nhi9y/Pgbj
	2ugXf0aIt2FiJUCjFQxCp530tFOy92fZYiygclgkstFLolQVXIg/zaN8CnRi1fniV5oKP6Wj/HC1M
	mr0b3CLPJQNBFc8L8Y//DUxx0fCt5l4xWrrMfORbg3trEq05Fv2eV6V22GcBBXx07ACcCVTFlxKTU
	T/buYUGd9nPJ8akfQTU/SfG9WZgqLUkLZoUYKdc+AcdbQbjuCsbFS0OrZP8AQiQ3iyrk4AtAI369s
	jLOGo/Zrfqqqrz78NLloCwyXfVcukmZTYB7F7FOgXLGlSTIZKZq72N5eJaJNK0LpoeuCXMko8v6nq
	EmAB8p6p1MTMDP+Wq1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjZz-00000002Dso-1qc6;
	Mon, 07 Jul 2025 11:00:11 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYizg-000000028HS-3ltB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:22:42 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b3316160so3543594e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 03:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883754; x=1752488554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sLO+XCFjd6kZQcTbPTUaHXEMjyFiunpLQXn/d3kRmo=;
        b=MabvM2M5H+3yeJIavXUSLxpiOVh3oKcBd3HfdtLukYVWZEugVc9qJH2WEbPNG6SiQy
         fIK/KB68+4Nz54Yo4LJVrmsTcuHl7UQBYu9x0kb2U9cJgtz/b6YrV+X6/Lb6AzQpY906
         uBqJabEJo7qruSyYPfrLtKlKHkbzRLUIdj8IUCDQGlGsS6o4k46odvAmNOQVTmaJpYQk
         CDbXco+zWGF0WgWU5mKl5Tj34BIg8cXxPm4MLwAYft1Up3rWjNsKbHXvs3piNh2G/hg2
         AJVIbnsBBJ4Pg5lWglHZQ/JXK2dMdi/OVlKVtzaEXj3Q/AwQfH8IM3OhGIm6akmQcjPH
         AZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVM7aL/TEugWax4HkFRWrkRZaqkA46Yt/u3EbxEIj2CdMt0/x8LJFk2+73ePY56/VChfUVjmLn0VpRZb05LKdYC@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnrCVixpHW8RK4I4NkYbUoaIgkzNb5y3tOsjpbZzhz+mDQ4p5
	1PcObJ02mvxouujrkwqan++pItlWy3JsYkquneTZGai9iuMfic0G1gL+HS+cD0j8
X-Gm-Gg: ASbGnct94Fhlrbzevb9IVA/XoEIfGvdMLp44ZIfyKKhCYbir+D64I57IV2Vi9I+mtfu
	UXtw7UJFgA6SxLpfWvLNRzDlM5mqd0uR+tmd6vU0aVEH9mhnFJmXazs/c56b7SNGOLAG26qyvHU
	4zaUgirgP0TX/y6b/w3D5ep05tz6MRMuSEqvozBS+ki1gx3bSFXNsrFSAbP7mGXOvZ4goFw9Lzw
	quRFUaWgkUNETlfJimUMi8+6AA1+afQiu9eq/GO9yO7UpdHaaD81KsiI3fHgrEt8cucXxhe04IL
	LjpMtH8drXOHeuw7JzcMRh6mH5u6qEW2FdEyJnDzM8V4qlLI/tSY0MnJXnkc7stuGvrPMiCWM40
	h0D24Fq/f/Q7r3DyNB2k=
X-Google-Smtp-Source: AGHT+IECobnhaqqecCF7w4lYrUvU6DjHsJPW68sjYJfXSLoI1V65d5hqphQocjwONxq0/b6PniwjIw==
X-Received: by 2002:a05:6512:39d3:b0:553:da39:37d with SMTP id 2adb3069b0e04-557a1421ad9mr2510283e87.1.1751883753815;
        Mon, 07 Jul 2025 03:22:33 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383babd6sm1306746e87.32.2025.07.07.03.22.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:22:32 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso25121511fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 03:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCkZPcO7j3Nk2Vh97PTc3cBAzbtazL8EhbUPlmQZDd9G/ioVVNx+YJYKZK1wLFXmvvO5obYKm1PH3jEDJvHGhy@lists.infradead.org
X-Received: by 2002:a05:651c:2105:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-32f092c6873mr36486781fa.25.1751883752130; Mon, 07 Jul 2025
 03:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins> <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins>
In-Reply-To: <aGud0aVLHGoql3Vj@collins>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 18:22:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
X-Gm-Features: Ac12FXyg9XXCP12FlM42TuajsfubuWC369QAdithyWrauBmCL6zemqSIgfSLhuw
Message-ID: <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250707_032240_945247_47290CF5 
X-CRM114-Status: GOOD (  58.55  )
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

On Mon, Jul 7, 2025 at 6:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi,
>
> Le Mon 07 Jul 25, 17:52, Chen-Yu Tsai a =C3=A9crit :
> > On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > > > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys=
-base.io> wrote:
> > > > >
> > > > > Hi Andre,
> > > > >
> > > > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > > > >
> > > > > > > Hi Paul,
> > > > > > >
> > > > > > > > The Allwinner A100/A133 only has a single emac instance, wh=
ich is
> > > > > > > > referred to as "emac" everywhere. Fix the pin names to drop=
 the
> > > > > > > > trailing "0" that has no reason to be.
> > > > > > >
> > > > > > > Sorry, but this is wrong. There *is* a second EMAC on the A13=
3 die: it's
> > > > > > > indeed not mentioned in the manual, but you can probe its MMI=
O
> > > > > > > registers (@0x5030000), and there is a second syscon register
> > > > > > > (@0x03000034). It's mentioned in several BSP code places ([1]=
).
> > > > > > > It seem like no suitable pins are connected on the A133
> > > > > > > package, but that should not affect the A100 .dtsi (we use a =
similar
> > > > > > > approach for the H616 and A523).
> > > > > > >
> > > > > > > So I think we should keep the emac0 name.
> > > > > >
> > > > > > just thinking that it's even worse: this changes the DT visible=
 pinctrl
> > > > > > function name, so it's a DT ABI change. With the "emac0" functi=
on name,
> > > > > > Ethernet would work with stable kernels already (as everything =
is
> > > > > > compatible, it's just about DT changes). But with this change, =
pinctrl
> > > > > > drivers in older kernels would not match.
> > > > >
> > > > > Given that the port is still very early and experimental and has =
very few users
> > > > > and no field deployment so I don't really think it would have ann=
oyed anybody in
> > > > > practice. But yes in principle you are right, while the header re=
names keep the
> > > > > same value, the string names are used to match the device-tree de=
finitions and
> > > > > this constitues ABI that needs to remain stable.
> > > > >
> > > > > > So I would very much like to see this patch moved out. Is it ju=
st in
> > > > > > LinusW's tree so far? I don't see it in -next yet.
> > > > >
> > > > > I don't think the patches were accepted for over a week so we can=
 probably
> > > > > still act. I will send reverts, unless maintainers want to manual=
ly remove
> > > > > these commits?
> > > >
> > > > I can drop the dts patches from the sunxi tree. Linus might be able=
 to
> > > > drop the pinctrl patch.
> > > >
> > > > You definitely need to send a revert for the DT binding patch that =
is
> > > > already in net-next.
> > >
> > > Should this really affect the bindings though?
> > >
> > > From what Andre reported, both EMAC0 and EMAC1 should be the same blo=
ck so it
> > > doesn't seem particularly necessary to have a different compatible.
> > >
> > > Looking at Allwiner's BSP code for the A133[0], I don't see any diffe=
rence
> > > between the two. While there's device_type property in Allwinner's dt=
, it's
> > > apparently not used by the driver[1].
> > >
> > > So I think we're still fine with a single compatible (without the con=
troller
> > > index in it).
> >
> > The block is the same, but the integration is slightly different, as
> > the register for the RGMII clock delays and other stuff is at a differe=
nt
> > offset in the system controller. The BSP handles this by directly
> > including the register in the "reg" property.
>
> Ah I see, I forgot about the syscon register. However it doesn't seem lik=
e a
> very good approach to have a different compatible to express the idea tha=
t an
> external resource is different. Just like we do for clocks, resets and ot=
her
> things, we should probably find a way to express the offset via some dedi=
cated
> property instead of spinning a different compatible each time it changes.
>
> > So yes, you do need a separate compatible string, if only to deal with
> > the slight difference in the integration layer.
>
> So maybe an additional allwinner,syscon-offset property or a new

If you can get that accepted, I think that works?

> allwinner,syscon that takes the syscon phandle first and the offset secon=
d?

I would prefer to avoid any changes to the syscon reference that would
require more custom code. I only just recently found that we could use
the standard syscon code with the provider registering the syscon. We
could drop the of_parse_phandle() + find device + dev_get_regmap() bits.
This is partially covered in my GMAC200 series.

ChenYu

> It seems that various other platforms are doing similar things (e.g.
> ti,syscon-pcie-mode).
>
> Thanks
>
> Paul
>
> >
> > ChenYu
> >
> > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel=
/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel=
/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > >
> > > All the best,
> > >
> > > Paul
> > >
> > > >
> > > > ChenYu
> > > >
> > > >
> > > > > Cheers,
> > > > >
> > > > > Paul
> > > > >
> > > > > > Cheers,
> > > > > > Andre.
> > > > > >
> > > > > > > [1]
> > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm=
64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the A=
llwinner A100 pin controller")
> > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > ---
> > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++++++++=
+-----------
> > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/=
drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO *=
/
> > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI *=
/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Paul Kocialkowski,
> > > > >
> > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > Free software developer - https://www.paulk.fr/
> > > > >
> > > > > Expert in multimedia, graphics and embedded hardware support with=
 Linux.
> > >
> > > --
> > > Paul Kocialkowski,
> > >
> > > Independent contractor - sys-base - https://www.sys-base.io/
> > > Free software developer - https://www.paulk.fr/
> > >
> > > Expert in multimedia, graphics and embedded hardware support with Lin=
ux.
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

