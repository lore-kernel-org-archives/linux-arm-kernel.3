Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C96C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2N+AWy70jywn4CRmdsXKEKKnKrL7LoujnGhrXs380U=; b=ooFum78YVUyeqd
	BVYiZAZVfeNTYva8dYoP2trdmExrpHJrr8LqmBkPosNOwZLleDfx3TmfLeUmKlBi4a3h7ZHnqFrHt
	nnv5XWCTPjtC9ttx+t5K/bW4QK+9Gq0/bUii8P/G73rQi9soSIikS+jyIFGKgCNaMc8l8Ny/s2dcR
	AZifNIBUHCwXBnaiApRIWCPfajnU2s2q2bwCA7H8ev+jSmZLdp+lz9dK+vk1bZrpzQVnJUgn+YNpS
	kmCWGDnJkA3xa8NKvteXqB0WrstDD8SfOT0XNFKaPzZctm6QySrqOGJ3CmsRr3Ivc6nQSWrrx1RiZ
	1mJPzB8YA9LRzJVRFAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoZm-00000000fDE-3f7W;
	Fri, 17 Jan 2025 15:48:02 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoVL-00000000eVx-35Go;
	Fri, 17 Jan 2025 15:43:29 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so2316632e87.0;
        Fri, 17 Jan 2025 07:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737128600; x=1737733400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2N+AWy70jywn4CRmdsXKEKKnKrL7LoujnGhrXs380U=;
        b=Co2rLrxv/r9EUWtbCSl39m4qLIbJ8sexYP1rClFQB8xp7f4/tSaVcV7bqQ5Zed2pmk
         7JztJKhmRK78Qg3SaEMx2A7Um+ygg9vkwLcmmZ8izZdu6WzVKgpmDQoFZjLkyLqBKQSm
         zKaoAkVCKg29XDjR8+sCggrhGFunbcA6vIEMwwqm0f8WeAfi6KbZtU0/r9Os7H2EGdap
         7Xt7YSXjah+a23AEJjsfOwRfa9KitP7fl5TIviaHG8lSZ+0/XuUOwLAxYjomCqfbch2e
         NKsoyEz+tHpiwxBpMmSWAkl/DlklE9wfLYj7ZrUPie+LpouKE2rw9uvqgYOfwxfkzX4Q
         At8A==
X-Forwarded-Encrypted: i=1; AJvYcCVAYatc6h2lkfZEg8WsgLN4E9taiZF/e8Nf2Wadw/HS+FVKa9DcKckj+Lt7f2KgIchy+RiUiLWkgN0pCCM=@lists.infradead.org, AJvYcCWRFnoAWVTeH1gaqMwlssEdJyj39Fu0tfqfHX9CDRd0jmg4DAzl2ZkSJwy80D06gytJsB/4Rpd1fWPM@lists.infradead.org, AJvYcCX5x8dBIr0eIGBLUVjz+mQDcC1DJzPAda6KgfqHsE6xmISLV2UJLqeD6TPiE4IBFFpgGo9LJ4kqVem/SDLW/LZn@lists.infradead.org
X-Gm-Message-State: AOJu0YxXSZUSRiIs+puf/MqMx4PEs+zyvARGOxKMevdN3eBIZIh7LC4+
	xD/U6yB/s6/8vD6GrmA9SSoQ7l2I73ToaWD8fmjVffNwOD+mO92VBwOjnYeE
X-Gm-Gg: ASbGnctykONBffjb5sU/jV4/Ye1TESgi5wOzLutIEFwoooLLyRVvOgi1qZ/VXe1BtGR
	VjGEVqlgNDoAKhJlRSKFtM0TGzTIBQEb8AH2p9J71MsIBwA+7dyWaI44M0igXTbdER4BwnMGzmG
	65o+x/xn0D+/3guyC/4PosY0f+t5EQo6kz67bhhPQlLek7CiCn44mBx2TBVkTFqNoCnAojgYHBF
	kc7s/OQW1wMVx3CM0mNMDmTKxq2m/zd/LO5INeeL0tLkzi19HbCUcSvHn1wWRedHYgoVdyseK49
	uc0WmUsFkL7cmQ==
X-Google-Smtp-Source: AGHT+IGcXVJhPhcX/aFXkWTksXvN6A+3OKN5OXHf8ztE4jRFq60tzwJxrWy9RuiAU7F1nk6iD3wNPw==
X-Received: by 2002:a05:6512:1092:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-5439c241918mr1264467e87.31.1737128599944;
        Fri, 17 Jan 2025 07:43:19 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e8f2sm401144e87.90.2025.01.17.07.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:43:18 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30227c56b11so22746171fa.3;
        Fri, 17 Jan 2025 07:43:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfoKm64KgIpE/LFXFaVHQ/UZMXryJCDHqiteZocwYVpmUEo53wA+rqBFexM6NGEB5ur7Cql3RaJ4Mf@lists.infradead.org, AJvYcCVUONnMNu3KbEkS64KwaEpnLZP1MEucAEtJhqs4+Kt9EbhLbw9GZ3EWesEKWacOUjm6OWNhhCzjgK208StnILoA@lists.infradead.org, AJvYcCW55fzn1zsAGQBMCYOKNy4WqXyTAXcK7R0QfxAvwVULtrras7dAxB7tlUg5Y7jsMjeumGMDdG+yjvbROhM=@lists.infradead.org
X-Received: by 2002:a05:651c:2c7:b0:2fb:58b1:3731 with SMTP id
 38308e7fff4ca-3072ca60bd0mr8406481fa.6.1737128597473; Fri, 17 Jan 2025
 07:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-4-szemzo.andras@gmail.com> <20250114141954.2785879a@donnerap.manchester.arm.com>
 <CACRpkda0nx3SQtdjmXdCEbVJSWM10TM=p-6JbDjbiYcOSF5PxQ@mail.gmail.com>
 <20250115152635.1b89e7f4@donnerap.manchester.arm.com> <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
In-Reply-To: <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 17 Jan 2025 23:43:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v64sNfytUPbyBFjiZCU+jLkXOH1r9iH=Z_E0PjwVxkMCWg@mail.gmail.com>
X-Gm-Features: AbW1kvbzoziWjm4-jxBgu7nAEK51uWx6aYENBjR409HEBu5PP3az-MNoew5mtV4
Message-ID: <CAGb2v64sNfytUPbyBFjiZCU+jLkXOH1r9iH=Z_E0PjwVxkMCWg@mail.gmail.com>
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Andras Szemzo <szemzo.andras@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_074327_775901_0F2C7787 
X-CRM114-Status: GOOD (  59.38  )
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

On Thu, Jan 16, 2025 at 5:34=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Andre,
>
> some nice talk here, actually the following is just opinions, I will
> be likely happy with whatever approach is taken eventually.
>
> On Wed, Jan 15, 2025 at 4:26=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
>
> > > pio: pinctrl@1c20800 {
> > >                         compatible =3D "allwinner,sun8i-r40-pinctrl";
> > > (...)
> > >                         i2c0_pins: i2c0-pins {
> > >                                 pins =3D "PB0", "PB1";
> > >                                 function =3D "i2c0";
> > >                         };
> > >
> > > abstract, strings, nice. The driver handles the particulars.
> >
> > What bugs me about this it that this has quite some seemingly redundant
> > information (Who would have thought that the i2c0 pins use function
> > "i2c0"?), but misses out on the actual 4 bits(!) of information.
>
> the pins in this example are called PB0 and PB1 though. The designation
> on the package. And often pins actually named "i2c0_1" "i2c0_2" are
> for that primary function, but muxable to a few other functions,
> at least GPIO in most cases. So it's just some name for the pin
> really.

No. Allwinner actually names their pins like this, kind of like Rockchip
which provides standardized names such as "GPIO0_B2", but unlike MediaTek
which just names the pins after their designated primary function such as
"EINT22" or "TDM_BCLK". The ball names are a separate thing.

Even though the pin names seem a bit random, there's actually a grouping
logic underneath:

- PC pins are always for the bootable internal storage (NAND, SPI-NOR, eMMC=
)
- PF pins are always the external SD card / debug UART / JTAG

> > > That is like so because we are designing for users which are
> > > let's say customization engineers. If these engineers jump from
> > > project to project matching function strings to group strings will
> > > be a common way to set up pins, and easy to understand and
> > > grasp, and it makes the DTS very readable.
> >
> > That's an interesting view, and I see the point of it being easy to rea=
d,
> > but this is partly because it doesn't convey too much actual informatio=
n,
> > does it, as it requires another lookup or two.
> > And the pinctrl group nodes are actually in the .dtsi file, which are
> > typically written once during the initial SoC enablement, and new board
> > .dts files normally just reference the existing pingroup nodes. So anyo=
ne
> > dealing with just a new board is not bothered by this.
>
> You have a point, and when working with a system the application
> engineer often finds bugs in the pin control driver, and has to go
> and fix the actual driver and then all the information hiding and
> simplification is moot.
>
> This can become an expensive lesson for the current attempts
> to push pin control into firmware where the configuration is
> mostly "dead simple" (and just using strings) - the bugs will be
> in the firmware instead, and impossible or really hard to fix.
>
> > Also in my experience most people have no problems in understanding the
> > concept of pinmuxing and that there is a selector number, also where to
> > find this.
>
> Yeah the ambition with the strings was to avoid forcing application
> engineers to know all about that. If they do, they are then
> developing the driver, not just using it.
>
> > > Mediatek and STM32 made a compromise by using pinmux
> > > and adding some macros to define them so it looks more
> > > pleasant:
> > >
> > >       i2c0_pins_a: i2c0-default {
> > >                 pins-i2c0 {
> > >                         pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
> > >                                  <MT7623_PIN_76_SCL0_FUNC_SCL0>;
> >
> > Well, I don't really get why they don't use the (MTK_PIN_NO(75) | 1)
> > definition directly, seems to be more telling to me?
>
> That's what STM32 does as well and it's usable.
>
> But of course it drives a truck through the initial ambition that pins
> on all systems be configured the same way, with strings. So now
> there are some families of drivers all "necessarily different" which
> is not so nice for people jumping between different SoCs, but
> very compelling for people focusing on just one SoC.
>
> Well, unless this way of doing things becomes so prevalent that
> it's the new black.
>
> > So the plan for sunxi would be: <SUNXI_PINMUX(PORTC, 23, MUX_1)>, ...
> > And this would not be really "opaque", since it has a fixed known mappi=
ng:
> >         (port << 16) | (pin << 8) | (mux << 0))
> > I find this both technically elegant, because it combines all the
> > information into just one compact cell, but also readable by outsiders,
> > thanks to the macro.
>
> And a new standard, to add to the other standards, so that
> is my problem as maintainer. It makes sense on its own, and it
> complicates the bigger picture.
>
> > My main arguments against the current (string-based) approach:
> > - They require the mapping table to be in every DT user, so not only th=
e
> >   Linux kernel, but also U-Boot, FreeBSD, you name it...
>
> That's true.
>
> This comes from the DT ambition to describe hardware and config,
> but not *define* hardware, i.e. to stop device tree to turn into
> Verilog or SystemC, which is what will happen if we take the
> 1:1 reflection of hardware to device tree too far.
>
> I don't think anyone really knows where to cut the line.
>
> > - The tables are getting quite large, and they pollute the single image
> >   Linux kernel, with tons of very specific information for a number of =
very
> >   pitiful Allwinner SoCs. At the moment the tally is at 145KB of code+d=
ata
> >   for the existing arm64 SoCs, with the newer SoCs ever growing (H616 a=
lone
> >   is 27KB, A523 would be quite larger even, I guess 40K). The new A523
> >   specific pinctrl support adds 872 Bytes.
>
> This is a generic problem though, look at GPU drivers.
>
> The community (especially Android) seem set on fixing this by using
> modules.
>
> > - Most of the mappings are untested at pinctrl driver commit time, sinc=
e we
> >   don't have the device drivers ready yet - by a margin. The new approa=
ch
> >   would add the pinmux values when we need them and can test them.
>
> I like this argument the best.
>
> However this also reads "upfront firmware to handle pin control is a
> dead end" yet there are people dedicatedly working on exactly that.
> (Not that its' the Allwinner developers' problem...)
>
> > - The comments in the table give away that something is not quite right=
:
> >                   SUNXI_FUNCTION(0x2, "i2c0")),         /* SDA */
> >   This is just a comment, so has no relevance for the code, but it's no=
t
> >   meant for humans either. Yet we try to make this correct and maintain
> >   it. Odd.
>
> So i2c0 is SDA and i2c1 is SCL or something?
> It seems common, but yeah it can be confusing.

No. i2c0 is the actual peripheral that gets muxed in. The SDA / SCL
comments are simply denoting which signal from the peripheral this
pin & mux value carry.

