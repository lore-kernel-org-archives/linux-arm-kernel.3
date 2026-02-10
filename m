Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1DCEA810A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maKY7w7nwib2BGdnzfNLGr6LuqDTUaTGWNtj37hTxCg=; b=2b0DuytlPfsXKs
	NR5u/EXrhW6I5CO02syAZL6itlpjq+qhjM9SWCXjLgwtFjSbULYEcLXflBddslabys0w9FweLH1L8
	jcDRP+n2BYzzslQ+yVIR3HFY+wvC1T/98QdM9sp2bq5FzZ2WM9XdeJBCtfyPFJzRFZh1aSUgSROnF
	kJlD2+WiOTVqwpBIf6IKJDeqFv8zq8vbyDh8KG5WTs57cksjSqevJxjnk/vHljmMOw9TPJOMRgczH
	f8pzzUj6hp6kN5Z9Kpn563E+etyNzL27LGcKg/tfw/49psFcLGKcFHu7rvZKziHdz3Dsdt84+pXmy
	RpDZ2ZBQ8tXSrQLdIvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnAI-0000000GxI8-29pw;
	Tue, 10 Feb 2026 12:48:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnAF-0000000GxHJ-1frd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5284944135
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 12:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306D9C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770727702;
	bh=/yLTrEwFx14Dt9Rfp5vSAMLnucczQsLEDATsUcijQh0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lxfgH7JbVpaXTZgCXtPeacOeRoRqvwbSeiQKRQ+CWb1BVOyn4X/FUNVyU8wG+46Ql
	 zHPQAvWpU/lsPHuGmBCWO8gtVgozcmXWtJF+4gtY2p8GdRa0RPxaL5f+l7qtpIlPFl
	 ZGxKcrHwNy2xhQo1ddiquABe/dBB0ANpCYID4oX5OGPQA8Ir3CerZyZP18Y85Gy6gc
	 Crs5Xi7rCUVM8pMn8nKVbP2mO3j+s7GrbVDW7Ep2ybo+Y8fnAUZJm2Rv2hwaWHXXKk
	 K3t9MapjBhjrVP1+rBiq4jW7yeIE4z/s4OtIJ0Qk2bTwrvUKx16eNxEl1QVkEG647a
	 z0kPurYsJNNrA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385e7cafef9so50656921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 04:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg9tpFxf+ROmZao0tHlbC4tVxjRshEei3uImXEkCS2nE1/oYqBhaqL4Nl0QrLZv2LBFeM7P8Fxfl+eszBoGyVC@lists.infradead.org
X-Gm-Message-State: AOJu0YwtmSqrXfLHnwG0lhkOB1vx2DVa6XeCXcFsh9QnlUJ89q9/pzMh
	CSowNMjuPfIjTyss+qIANa4R7UnPgULpqoooU0kTIFZ0KyRj8LkPbbIGYxRKvAX3AfaM/4bzk4F
	ZJ1wEASOO0PyN6pGk/2sCD34D9bqM/CA=
X-Received: by 2002:a05:651c:31cd:b0:386:fa6b:44dc with SMTP id
 38308e7fff4ca-386fa6b49ecmr1427891fa.9.1770727700437; Tue, 10 Feb 2026
 04:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
 <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com> <7ed7a5e3-0c83-44e8-b7d2-e93e0b686df8@collabora.com>
In-Reply-To: <7ed7a5e3-0c83-44e8-b7d2-e93e0b686df8@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Feb 2026 20:48:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v66eSZUVk8_CXDMn6jmEJeC9QqJcz1eO-wVT-9OxrkU6Aw@mail.gmail.com>
X-Gm-Features: AZwV_Qj5PKRKpTYJzhQaY6M0aPxMiwKhFHv4dpRoWs-3c-choy2xYtUHpIM2CXI
Message-ID: <CAGb2v66eSZUVk8_CXDMn6jmEJeC9QqJcz1eO-wVT-9OxrkU6Aw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8189: Add pinmux macro header file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Lechner <david@lechnology.com>, Cathy Xu <ot_cathy.xu@mediatek.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>, 
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe Yang <Axe.Yang@mediatek.com>, 
	Lei Xue <Lei.Xue@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_044823_489390_AAEB500A 
X-CRM114-Status: GOOD (  34.87  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 10, 2026 at 7:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/02/26 22:48, David Lechner ha scritto:
> > On 9/18/25 9:03 PM, Cathy Xu wrote:
> >> Add the pinctrl header file on MediaTek mt8189.
> >>
> >> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> >> ---
> >> This patch is base on the patch series:
> >> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D981=
475
> >> [1] dt-bindings: pinctrl: mediatek: Add support for mt8189
> >> [2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
> >> [3] pinctrl: mediatek: Add pinctrl driver on mt8189
> >> Since patch [1] and [3] of the series have already been merged, this
> >> patch(patch [2]) is being resent individually after modifications.
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 +++++++++++++++=
++
> >>   1 file changed, 1125 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/arm6=
4/boot/dts/mediatek/mt8189-pinfunc.h
> >> new file mode 100644
> >> index 000000000000..df69f50c267a
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> >
> > General question:
> >
> > Why do we have similar files in two different places different places?
> >
> > $ ls arch/arm64/boot/dts/mediatek/*-pin*
> > arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> > arch/arm64/boot/dts/mediatek/mt8516-pinfunc.h
> >
> > $ ls include/dt-bindings/pinctrl/mt*
> > include/dt-bindings/pinctrl/mt65xx.h
> > include/dt-bindings/pinctrl/mt6779-pinfunc.h
> > include/dt-bindings/pinctrl/mt6795-pinfunc.h
> > include/dt-bindings/pinctrl/mt6797-pinfunc.h
> > include/dt-bindings/pinctrl/mt7623-pinfunc.h
> > include/dt-bindings/pinctrl/mt8135-pinfunc.h
> > include/dt-bindings/pinctrl/mt8183-pinfunc.h
> > include/dt-bindings/pinctrl/mt8186-pinfunc.h
> > include/dt-bindings/pinctrl/mt8192-pinfunc.h
> > include/dt-bindings/pinctrl/mt8195-pinfunc.h
> > include/dt-bindings/pinctrl/mt8365-pinfunc.h
> >
> >
> > Plus one different naming pattern.
> >
> > $ ls include/dt-bindings/pinctrl/mediatek,*
> > include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> >
> >
> >
> > Which one is preferred?
> >
> >
> The MediaTek pinctrl must gain compatibility with standard pinctrl bindin=
gs. Until
> then, bindings maintainers decided that these headers must go to the dts/=
mediatek
> folder.
>
> It is my desire to (but lack of time on my side hits hard) do the right t=
hing and
> make the MediaTek pinctrl drivers to actually "understand" standard bindi=
ngs.

The headers encode the pin numbers and mux values in a way that the
"pinmux" property requires, all the while giving them meaningful names.

I suppose you could consider them part of the binding, as the pin controlle=
r
binding assembles all the individual PIO blocks in the SoC to produce one
unified view of all the pins. How they are ordered is important.

Plus the datasheets are horrible to read, as the pins aren't always numbere=
d,
but are referred to using symbolic names like I2S2_MCLK.

> I'd be - of course - happy if anyone else beats me on time (which wouldn'=
t be hard
> really) and pushes a series to fix this situation.
>
> Just to be clear - right now, the MTK pinctrl DT looks like:
>
>         panel_default_pins: panel-default-pins {
>                 pins-rst {
>                         pinmux =3D <PINMUX_GPIO108__FUNC_GPIO108>;
>                         output-high;
>                 };
>
>                 pins-en {
>                         pinmux =3D <PINMUX_GPIO48__FUNC_GPIO48>;
>                         output-low;
>                 };
>         };
>
>         spi1_pins: spi1-pins {
>                 pins {
>                         pinmux =3D <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
>                                  <PINMUX_GPIO137__FUNC_SPIM1_CLK>,
>                                  <PINMUX_GPIO138__FUNC_SPIM1_MO>,
>                                  <PINMUX_GPIO139__FUNC_SPIM1_MI>;
>                         bias-disable;
>                 };
>         };

To be fair, the above is one valid kind of generic pinmux description.

From Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml :

While not required to be used, there are 3 generic forms of pin muxing node=
s
which pin controller devices can use.

For hardware where pin multiplexing configurations have to be specified for
each single pin the number of required sub-nodes containing "pin" and
"function" properties can quickly escalate and become hard to write and
maintain.

For cases like this, the pin controller driver may use the pinmux helper
property, where the pin identifier is provided with mux configuration setti=
ngs
in a pinmux group. A pinmux group consists of the pin identifier and mux
settings represented as a single integer or an array of integers.

The pinmux property accepts an array of pinmux groups, each of them describ=
ing
a single pin multiplexing configuration.

 - end quote -

So Mediatek is following one of the generic pinmux bindings. It's not the
only one using this scheme either. STM32 and some of the Renesas platforms
also follow it.

> ....but the driver should gain compatibility with nodes which would look =
like:
>
>         panel_default_pins: panel-default-pins {
>                 pins-rst {
>                         pins =3D "gpio108";
>                         function =3D "gpio";
>                         output-high;
>                 };
>
>                 pins-en {
>                         pins =3D "gpio48";
>                         function =3D "gpio";
>                         output-low;
>                 };
>         };
>
>         spi1_pins: spi1-pins {
>                 pins-bus {
>                         pins =3D "gpio136", "gpio137", "gpio138", "gpio13=
9",
>                         function =3D "spi_m1";

Why is it "spi_m1", not "spi1"?


Honestly you likely don't want this, or rather you don't want a huge table
of pins and pinmux values and strings in the kernel. It takes a lot of time
to write, even more time to review, and takes up a lot of space for each
pinctrl driver. And those are generally built-in.

The Allwinner platform has gone in the reverse direction: instead of having
a huge table, we put the mux value in the DT using a custom property.
See the following for discussions:

https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1=
-andre.przywara@arm.com/
https://patchwork.ozlabs.org/project/linux-gpio/patch/20171113012523.2328-2=
-andre.przywara@arm.com/

And this is what finally landed:

https://lore.kernel.org/linux-gpio/20250306235827.4895-7-andre.przywara@arm=
.com/

Has it caused a bit of trouble? Perhaps. I was working on various periphera=
ls
on a new board and put in the wrong mux value and didn't notice for a coupl=
e
days.



ChenYu

>                         bias-disable;
>                 };
>         };
>
> .... or
>
>         spi1_pins: spi1-pins {
>                 pins-bus {
>                         function =3D "spi_m1";
>                         groups =3D "spi_m1_pins";
>                         bias-disable;
>                 };
>         };
>
> That's the entire situation.
>
> Cheers,
> Angelo
>

