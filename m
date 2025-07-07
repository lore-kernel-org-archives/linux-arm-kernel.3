Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7083FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+G9RXNsu4/lHuRGJgb9rsOZh1/O90NgzHuMfw5EvSM=; b=gim0gnXR7+bh7+
	H+bUYzZfjP5qMSvqSybndIiDvAD7TtY6sdpFQyQsRXPSf+EdS5hxyipLxnSJaxhG0Cz+UW3ehgHHR
	KfYpYh7rrimeu9RZQJxAt8einRnCXQFL5la+crZAZdZ9+XKBR6c/z11wRHWlN9V3+k+XT/1ukv1gE
	OhqltOW+DeQanPUXPs1gKnQO3LQ65Q2UOroUVoNAx8sdT58D51ySp0wIpcCw/7y8aHJ894+CuHq2z
	bpzA/Fs+k1hwZTOsjyOrGLuRq1BuYcueRYww0DkgOi+6hVgJjBN7X9578eocITlizSoYVOtDXnveH
	LIqZZQNrioQP7ihvE8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj6B-00000002A88-1G3F;
	Mon, 07 Jul 2025 10:29:23 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiWS-000000023KX-29Pe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:52:29 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-556373661aaso2622950e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881942; x=1752486742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+G9RXNsu4/lHuRGJgb9rsOZh1/O90NgzHuMfw5EvSM=;
        b=q4/956bDj13RkiFEtthpXhavmhdo7XmiWTx138ITHRfCMX0XEm3InNsc13hRLZkZt9
         3RGmCd9zy3/VqbRxlWnGcae5beeGQ/bjjNK+Mk+QTLh5ln8Nh9XTF7IWul+QjFW/y8Yt
         9og/IC6qBNRTr91AtQOJ1Dx15uIxtw8SSKsTWKcExfaO+aS6KpJklKw4LVEMseORUVvj
         qxqmNt3OjV2kYpmWwLUdnba7gJsHBJ29OHADqW8lacb5p5An+RrMo9Q8vVxI30jdUs2R
         Mi//RNGueNy4PnT1km6AdX8eyDP+onVvD26mj7MU9rotGnvWj9EmmnQRkKmeIME5/Rec
         38nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXhQgF4oJNPT4/b54RBBSmRA14CP5f53RBsF32rIyHuQefENqZxsFLuV8U4F7qV3ocyP/lYke44ZXBexgX3E8i@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjpa/ySDLfVabXJreoJK3OsoCOE9j10PpdeGovt7IhynAheL6F
	WDc8Oq9V/jd3+LBv+5ZHzZTMZQ0HmkjUgXmEl9BDAn/VXFSaIz2HDaqtFRqpYdkl
X-Gm-Gg: ASbGnctEmg5xtaYQUINGJqhKzcCG0Kp6z8YnOo0Rq8hx7k38rrgWgVDsMSUu3LB52yJ
	9KScTCPvhRLxZE332f0YngudCDjmuu15pI3rCV6xCBZgZIOth9ZfuJJeJxYRR1+8A2wJLiHUddJ
	+t4tIxcXuoOKa0be2l1drFsaV9pSPiS8r5W1EF8/Ui2OCiMiTgFrYYUv4CJEJeaxtj9jRAA+azp
	M5K6Dk0wp7N9q74hcgfEVLkpWrO4zbBPRt0mPhmWELGvssvTfV2WETMHEwZHC6q8+oHsRcc6lhu
	yJNnsQo1YTy6+q/nOMHmhrUO3rocUl4rfB7lmmpdwk01IS93BekA42B049OjT2tvCqaD5zjp5eJ
	XTGZvxuSgSrxv6DN4ikQ=
X-Google-Smtp-Source: AGHT+IGwnQLfEppEV8MaNMSC81/Nj/93QZYJdzZzP3EMSPD4d3Cepc2PebrliNy90YQ5wNaDOHLGWA==
X-Received: by 2002:a05:6512:61a1:b0:555:61e:ca7e with SMTP id 2adb3069b0e04-557e5528b06mr1832907e87.10.1751881941220;
        Mon, 07 Jul 2025 02:52:21 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm1288136e87.123.2025.07.07.02.52.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b3b250621so26921341fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDDFs3yiVTdSQJmhzYX7jCfF61RSF+jT+67Ou9tKzvIMB4C/UR++vbqcX7qOBHdvgDGP4M0Bm0uhzvwzZfG/KU@lists.infradead.org
X-Received: by 2002:a2e:bc1c:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32f199879cbmr17915751fa.4.1751881939832; Mon, 07 Jul 2025
 02:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
In-Reply-To: <aGuV3gcKSRIyey53@collins>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 17:52:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
X-Gm-Features: Ac12FXxL47gWjXZzuSKcW-0cl9NbdUx83T52e-2ARQaXs9NhvEcm9RfhLdsxmoU
Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250707_025228_557089_196C33C7 
X-CRM114-Status: GOOD (  48.86  )
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

On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Chen-Yu,
>
> Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Andre,
> > >
> > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > >
> > > > > Hi Paul,
> > > > >
> > > > > > The Allwinner A100/A133 only has a single emac instance, which =
is
> > > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > > trailing "0" that has no reason to be.
> > > > >
> > > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 di=
e: it's
> > > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > > registers (@0x5030000), and there is a second syscon register
> > > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > > It seem like no suitable pins are connected on the A133
> > > > > package, but that should not affect the A100 .dtsi (we use a simi=
lar
> > > > > approach for the H616 and A523).
> > > > >
> > > > > So I think we should keep the emac0 name.
> > > >
> > > > just thinking that it's even worse: this changes the DT visible pin=
ctrl
> > > > function name, so it's a DT ABI change. With the "emac0" function n=
ame,
> > > > Ethernet would work with stable kernels already (as everything is
> > > > compatible, it's just about DT changes). But with this change, pinc=
trl
> > > > drivers in older kernels would not match.
> > >
> > > Given that the port is still very early and experimental and has very=
 few users
> > > and no field deployment so I don't really think it would have annoyed=
 anybody in
> > > practice. But yes in principle you are right, while the header rename=
s keep the
> > > same value, the string names are used to match the device-tree defini=
tions and
> > > this constitues ABI that needs to remain stable.
> > >
> > > > So I would very much like to see this patch moved out. Is it just i=
n
> > > > LinusW's tree so far? I don't see it in -next yet.
> > >
> > > I don't think the patches were accepted for over a week so we can pro=
bably
> > > still act. I will send reverts, unless maintainers want to manually r=
emove
> > > these commits?
> >
> > I can drop the dts patches from the sunxi tree. Linus might be able to
> > drop the pinctrl patch.
> >
> > You definitely need to send a revert for the DT binding patch that is
> > already in net-next.
>
> Should this really affect the bindings though?
>
> From what Andre reported, both EMAC0 and EMAC1 should be the same block s=
o it
> doesn't seem particularly necessary to have a different compatible.
>
> Looking at Allwiner's BSP code for the A133[0], I don't see any differenc=
e
> between the two. While there's device_type property in Allwinner's dt, it=
's
> apparently not used by the driver[1].
>
> So I think we're still fine with a single compatible (without the control=
ler
> index in it).

The block is the same, but the integration is slightly different, as
the register for the RGMII clock delays and other stuff is at a different
offset in the system controller. The BSP handles this by directly
including the register in the "reg" property.

So yes, you do need a separate compatible string, if only to deal with
the slight difference in the integration layer.

ChenYu

> [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
>
> All the best,
>
> Paul
>
> >
> > ChenYu
> >
> >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > Cheers,
> > > > Andre.
> > > >
> > > > > [1]
> > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/b=
oot/dts/sunxi/sun50iw10p1.dtsi
> > > > >
> > > > >
> > > > > >
> > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwi=
nner A100 pin controller")
> > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > ---
> > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++---=
--------
> > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driv=
ers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >
> > > > >
> > > >
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

