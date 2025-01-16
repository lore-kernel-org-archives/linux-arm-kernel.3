Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBECC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDEoo08UzquHfpbAFyPJ/ZCgHJCQZd+B5Sb7kOuUYkM=; b=wwoyhoM7haQ1bl8o9oUllXc2Y3
	PJZSfUv/0+LxyrpMDNRrBH/TZLYoLzWGRwesVy2+FYqUtfKSB5I+jhM+InrONIr/qmsIn45wUfnGH
	Cz8ebhW9+JRB/8JlIZmzLhME5PurUua5js2UzrJakGqCuyt6FprBT2L0zn35ZIQWCG4/4zs1dejPg
	2ARuZZsfhZmfsu3G43HCjvNJoPjGH55j0tNDEKyvGIcxcIZZ5amfyaxoWjMaUuwUoY4ZzsY+8ma1F
	fUNU1zAZUckZTbKfSWdVrRA7p0iboJyDPdj1ApAiTsjN4AYKgIFJHqiU94xAlE8jI1bC3UpToqLVT
	q+jjq/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMIC-0000000ENsA-29pd;
	Thu, 16 Jan 2025 09:36:00 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMGt-0000000ENeD-3DyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:34:41 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3002c324e7eso6164571fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737020078; x=1737624878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDEoo08UzquHfpbAFyPJ/ZCgHJCQZd+B5Sb7kOuUYkM=;
        b=Mbik7dX4/rC200HCrLqMyioVBOLhEUHtCvq4VZdpKBpcNnQ60r3ld/Mua45aAtb/Ff
         +P0qpLu++cqWjg8hSLvkf4uL5WZzzEsr8JzEQZ3KRMX4Y1ZRRhdF/2/lDc1tmv+F2CtZ
         rHXtjeiQRfJYtDQBx9IHiGqhk2CLaBGkZBpGNIaKYcYjMQ/uegRYFJQDFCTZ0vo2YRc4
         EtkPc0W8OABoS/qLrKKPygl+Yb96DjnWd7SBqj7MWhtHdZn/YleySysHrDJVk14RbqQa
         JMrTEtD+PQCQ0+67OPIaU1P0Df4DzaXMlfGzLECF89lDGLGLGhQAcD0depoqVjClKl6g
         4otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020078; x=1737624878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDEoo08UzquHfpbAFyPJ/ZCgHJCQZd+B5Sb7kOuUYkM=;
        b=vTftHQ+JalWii3mcAeDg0532Rmj6D+6IqBjtpxsF6NpG62OuYBreyWgBoKsdVKx5X2
         oqXOGyPj5rhujmq5WwcEq912AwDk/yHxETu80qsAucJnzrVULuxBIHYi4/6mfTTLs0AR
         OZxxT2Iw822CJQptARt9CAbrJoslQAXJ+NIJNKTQDsFBH4rIfsQbFh8M3FhIIDMrBnrf
         ca0jiosCBeolYjbhCh6HgP7R9X7XCax7s0bz3OYhWO9W+Ty26oarXOLdhzCDoH2Po4uY
         kx58OLF8HIYaYG/lgZAq9MRVOSxdYl+NNK+Jwc6jVWCH/jY0Ymz6KjH+FN5ywfP8NKOZ
         VB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8TBoMya5mSfBC0+wWSlNgo/zcoLarK82l+lN0fGcc4m6bxU7w2OdW6QS8uEy/NxtUo1ktE86wYOyLvJ8HvWme@lists.infradead.org
X-Gm-Message-State: AOJu0YwDvnpq96R1AsM0oWF21v6Y+s+6fzU3aVY4JfyINvRmXJErmiwG
	M2gw0emG/lcxN6Y4lZX9MFSBMdmtE8q54sKp3iq9u2ea3aTgTwjjsxvJnYRloYQhvEBGXpaP3Qi
	K2GD17CKxyAKvupfmKSuDOc+zwpxQX5QTUIZ+1g==
X-Gm-Gg: ASbGncvJIXumIdQxkp4KkeNjoaYb9pMHaz6qdvBLF8qhlEEei2lSK+rJr9y6jSv3nZC
	RPAtY3qXI1EDtWR7+XERInjS5veRgtToqM4+j
X-Google-Smtp-Source: AGHT+IEvxOVujRx8L7nmAm14+W+J9iR9tC3itop2isDuY+VzNKk3E+BY5vasl+NH5yxy4xJbTTxIO6CFjEvK/kGunk4=
X-Received: by 2002:a05:651c:2222:b0:300:38ff:f8e2 with SMTP id
 38308e7fff4ca-305f453f9d5mr108573981fa.10.1737020077607; Thu, 16 Jan 2025
 01:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-4-szemzo.andras@gmail.com> <20250114141954.2785879a@donnerap.manchester.arm.com>
 <CACRpkda0nx3SQtdjmXdCEbVJSWM10TM=p-6JbDjbiYcOSF5PxQ@mail.gmail.com> <20250115152635.1b89e7f4@donnerap.manchester.arm.com>
In-Reply-To: <20250115152635.1b89e7f4@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:34:26 +0100
X-Gm-Features: AbW1kvbBkCN9uFhss2v8p9gI5MNXxz-I4EOdo9aGVELtvFSbQyk_EVu2ddxSQ7s
Message-ID: <CACRpkdYVTedEon0X-izvaDTGF6yRhD2s=Z6NEM=zBf4vD-T0Pg@mail.gmail.com>
Subject: Re: [PATCH 03/12] pinctrl: sunxi: add driver for Allwinner V853.
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andras Szemzo <szemzo.andras@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
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
X-CRM114-CacheID: sfid-20250116_013439_803020_7E294F30 
X-CRM114-Status: GOOD (  47.85  )
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

Hi Andre,

some nice talk here, actually the following is just opinions, I will
be likely happy with whatever approach is taken eventually.

On Wed, Jan 15, 2025 at 4:26=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> > pio: pinctrl@1c20800 {
> >                         compatible =3D "allwinner,sun8i-r40-pinctrl";
> > (...)
> >                         i2c0_pins: i2c0-pins {
> >                                 pins =3D "PB0", "PB1";
> >                                 function =3D "i2c0";
> >                         };
> >
> > abstract, strings, nice. The driver handles the particulars.
>
> What bugs me about this it that this has quite some seemingly redundant
> information (Who would have thought that the i2c0 pins use function
> "i2c0"?), but misses out on the actual 4 bits(!) of information.

the pins in this example are called PB0 and PB1 though. The designation
on the package. And often pins actually named "i2c0_1" "i2c0_2" are
for that primary function, but muxable to a few other functions,
at least GPIO in most cases. So it's just some name for the pin
really.

> > That is like so because we are designing for users which are
> > let's say customization engineers. If these engineers jump from
> > project to project matching function strings to group strings will
> > be a common way to set up pins, and easy to understand and
> > grasp, and it makes the DTS very readable.
>
> That's an interesting view, and I see the point of it being easy to read,
> but this is partly because it doesn't convey too much actual information,
> does it, as it requires another lookup or two.
> And the pinctrl group nodes are actually in the .dtsi file, which are
> typically written once during the initial SoC enablement, and new board
> .dts files normally just reference the existing pingroup nodes. So anyone
> dealing with just a new board is not bothered by this.

You have a point, and when working with a system the application
engineer often finds bugs in the pin control driver, and has to go
and fix the actual driver and then all the information hiding and
simplification is moot.

This can become an expensive lesson for the current attempts
to push pin control into firmware where the configuration is
mostly "dead simple" (and just using strings) - the bugs will be
in the firmware instead, and impossible or really hard to fix.

> Also in my experience most people have no problems in understanding the
> concept of pinmuxing and that there is a selector number, also where to
> find this.

Yeah the ambition with the strings was to avoid forcing application
engineers to know all about that. If they do, they are then
developing the driver, not just using it.

> > Mediatek and STM32 made a compromise by using pinmux
> > and adding some macros to define them so it looks more
> > pleasant:
> >
> >       i2c0_pins_a: i2c0-default {
> >                 pins-i2c0 {
> >                         pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
> >                                  <MT7623_PIN_76_SCL0_FUNC_SCL0>;
>
> Well, I don't really get why they don't use the (MTK_PIN_NO(75) | 1)
> definition directly, seems to be more telling to me?

That's what STM32 does as well and it's usable.

But of course it drives a truck through the initial ambition that pins
on all systems be configured the same way, with strings. So now
there are some families of drivers all "necessarily different" which
is not so nice for people jumping between different SoCs, but
very compelling for people focusing on just one SoC.

Well, unless this way of doing things becomes so prevalent that
it's the new black.

> So the plan for sunxi would be: <SUNXI_PINMUX(PORTC, 23, MUX_1)>, ...
> And this would not be really "opaque", since it has a fixed known mapping=
:
>         (port << 16) | (pin << 8) | (mux << 0))
> I find this both technically elegant, because it combines all the
> information into just one compact cell, but also readable by outsiders,
> thanks to the macro.

And a new standard, to add to the other standards, so that
is my problem as maintainer. It makes sense on its own, and it
complicates the bigger picture.

> My main arguments against the current (string-based) approach:
> - They require the mapping table to be in every DT user, so not only the
>   Linux kernel, but also U-Boot, FreeBSD, you name it...

That's true.

This comes from the DT ambition to describe hardware and config,
but not *define* hardware, i.e. to stop device tree to turn into
Verilog or SystemC, which is what will happen if we take the
1:1 reflection of hardware to device tree too far.

I don't think anyone really knows where to cut the line.

> - The tables are getting quite large, and they pollute the single image
>   Linux kernel, with tons of very specific information for a number of ve=
ry
>   pitiful Allwinner SoCs. At the moment the tally is at 145KB of code+dat=
a
>   for the existing arm64 SoCs, with the newer SoCs ever growing (H616 alo=
ne
>   is 27KB, A523 would be quite larger even, I guess 40K). The new A523
>   specific pinctrl support adds 872 Bytes.

This is a generic problem though, look at GPU drivers.

The community (especially Android) seem set on fixing this by using
modules.

> - Most of the mappings are untested at pinctrl driver commit time, since =
we
>   don't have the device drivers ready yet - by a margin. The new approach
>   would add the pinmux values when we need them and can test them.

I like this argument the best.

However this also reads "upfront firmware to handle pin control is a
dead end" yet there are people dedicatedly working on exactly that.
(Not that its' the Allwinner developers' problem...)

> - The comments in the table give away that something is not quite right:
>                   SUNXI_FUNCTION(0x2, "i2c0")),         /* SDA */
>   This is just a comment, so has no relevance for the code, but it's not
>   meant for humans either. Yet we try to make this correct and maintain
>   it. Odd.

So i2c0 is SDA and i2c1 is SCL or something?
It seems common, but yeah it can be confusing.

Yours,
Linus Walleij

