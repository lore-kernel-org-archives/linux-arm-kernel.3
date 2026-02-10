Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F2EF0702
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPRT8u6Qx9/0OUaU384qgipouqSCTTH4FJjkOw8Xupo=; b=wHOZ1olVAXIc0J
	hD19nnq+94A+vVA+nhAqRlvVIHMkDzsspBwwkeP5irK0n3/wx8x96owsUZUpKQ7qXq/7GVdtbyeeP
	Rv/PGL/XINNhfS+JJhdPWmrsHxndCluAFhnKiqMogwF/ejjFoe/DLUwUCYbGrpTmYkDDDzqi+5hhz
	BuPMc94VDRemJ2DODoPoKD6AcvJ7ot5dwEUm76DKFhywJy24LNYm27MnRhw4KKvWEEX2lg86NKpbS
	JBLkvH0AiJIyQs9BbWqIsMkjYsfZ0iz8yoODitQ/bHFMqSXg6BEYjw5ZdksRiynkdWcffhpIzlomX
	SU3+pnMINP/5bNw0fQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqUw-0000000HDhf-37LT;
	Tue, 10 Feb 2026 16:21:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqUv-0000000HDhM-1Dxr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30E286013D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 16:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5847C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770740515;
	bh=gZH9GdcNmqZ7kQ2pwwyh9HOr30opwdhOWtRjnixR8bU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=YbpX61nyV3qv7RbsxNjImRZOz1WXaJ/C6gNrUlBGXXfMPBIBexC++dGZkPBNY7HFd
	 WxalDha0/HIYA5XiwvEcCZAx+bpgFNbd1iL3tHDIFypJro9ls9oz74xX2bJNoa+enn
	 d9A/Lk6xh+938nCUDW33MGhwRrTQ4WVx1iSo6mk0Lmq1OyqbPiknK4nsZjBxc2DVuT
	 ZoORmlc6Fb7NpW8eO9md8vOFELVyevsWXXbSW4Tp9rEKRf5Y9eV/YmNyUp8adpvcmr
	 XF8oRKOSgt4mo8Kbz2EGPpI1+3ZNKhrnZU6dzzg/AKTdAcieZ4+Bt0ZP1cy2XqHIZ7
	 w6YsmdE/5Yb7w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385b5174f54so8391021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 08:21:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrSwdo+cHBqwrILX/WnzWzqGgAneETdlNpDwLEOdqlLY5cA3NAJFeum/+qDauL77VbHHK4uXt7ETM1I0SQfSJz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9vVyvpAHLa/ORF3xr+8kSkb4LYi+0JR+iz7jEk9z19zPNv8YP
	IgCEDu7CYDFZ4jtB3pPgiya8ybeAu8uEt9M4Vy1hpIRThfebBy/3wc5Mvg9I280lT0N0SVDvZyR
	4n7vlwYsR2PHXuDk3Ir8CT/3MZ00+snA=
X-Received: by 2002:a05:651c:4185:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-386b5144cbbmr40246561fa.37.1770740514014; Tue, 10 Feb 2026
 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20250919020525.7904-1-ot_cathy.xu@mediatek.com>
 <1b092f9c-d0b1-47df-a83e-a99d7491a32b@lechnology.com> <7ed7a5e3-0c83-44e8-b7d2-e93e0b686df8@collabora.com>
 <CAGb2v66eSZUVk8_CXDMn6jmEJeC9QqJcz1eO-wVT-9OxrkU6Aw@mail.gmail.com> <b6180be5-5ae6-4671-8a2f-68ffa35dadbe@collabora.com>
In-Reply-To: <b6180be5-5ae6-4671-8a2f-68ffa35dadbe@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Feb 2026 00:21:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64CarfN5_pedrLDDic4AE1NbTKiB=tS12p9RyTW3h8rGg@mail.gmail.com>
X-Gm-Features: AZwV_Qgul8eTtuPeV91yj-KnYiLHlGBOsKOM9UeS8FRaaMBDotaHe0266bjy4Wg
Message-ID: <CAGb2v64CarfN5_pedrLDDic4AE1NbTKiB=tS12p9RyTW3h8rGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8189: Add pinmux macro header file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, 
	Cathy Xu <ot_cathy.xu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>, Lei Xue <Lei.Xue@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 10, 2026 at 10:26=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 10/02/26 13:48, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 10, 2026 at 7:03=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 09/02/26 22:48, David Lechner ha scritto:
> >>> On 9/18/25 9:03 PM, Cathy Xu wrote:
> >>>> Add the pinctrl header file on MediaTek mt8189.
> >>>>
> >>>> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> >>>> ---
> >>>> This patch is base on the patch series:
> >>>> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D9=
81475
> >>>> [1] dt-bindings: pinctrl: mediatek: Add support for mt8189
> >>>> [2] arm64: dts: mediatek: mt8189: Add pinmux macro header file
> >>>> [3] pinctrl: mediatek: Add pinctrl driver on mt8189
> >>>> Since patch [1] and [3] of the series have already been merged, this
> >>>> patch(patch [2]) is being resent individually after modifications.
> >>>> ---
> >>>>    arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 ++++++++++++=
+++++
> >>>>    1 file changed, 1125 insertions(+)
> >>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h b/arch/ar=
m64/boot/dts/mediatek/mt8189-pinfunc.h
> >>>> new file mode 100644
> >>>> index 000000000000..df69f50c267a
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
> >>>
> >>> General question:
> >>>
> >>> Why do we have similar files in two different places different places=
?
> >>>
> >>> $ ls arch/arm64/boot/dts/mediatek/*-pin*
> >>> arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt8173-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> >>> arch/arm64/boot/dts/mediatek/mt8516-pinfunc.h
> >>>
> >>> $ ls include/dt-bindings/pinctrl/mt*
> >>> include/dt-bindings/pinctrl/mt65xx.h
> >>> include/dt-bindings/pinctrl/mt6779-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt6795-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt6797-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt7623-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8135-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8183-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8186-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8192-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8195-pinfunc.h
> >>> include/dt-bindings/pinctrl/mt8365-pinfunc.h
> >>>
> >>>
> >>> Plus one different naming pattern.
> >>>
> >>> $ ls include/dt-bindings/pinctrl/mediatek,*
> >>> include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> >>>
> >>>
> >>>
> >>> Which one is preferred?
> >>>
> >>>
> >> The MediaTek pinctrl must gain compatibility with standard pinctrl bin=
dings. Until
> >> then, bindings maintainers decided that these headers must go to the d=
ts/mediatek
> >> folder.
> >>
> >> It is my desire to (but lack of time on my side hits hard) do the righ=
t thing and
> >> make the MediaTek pinctrl drivers to actually "understand" standard bi=
ndings.
> >
> > The headers encode the pin numbers and mux values in a way that the
> > "pinmux" property requires, all the while giving them meaningful names.
> >
> > I suppose you could consider them part of the binding, as the pin contr=
oller
> > binding assembles all the individual PIO blocks in the SoC to produce o=
ne
> > unified view of all the pins. How they are ordered is important.
> >
> > Plus the datasheets are horrible to read, as the pins aren't always num=
bered,
> > but are referred to using symbolic names like I2S2_MCLK.
> >
> >> I'd be - of course - happy if anyone else beats me on time (which woul=
dn't be hard
> >> really) and pushes a series to fix this situation.
> >>
> >> Just to be clear - right now, the MTK pinctrl DT looks like:
> >>
> >>          panel_default_pins: panel-default-pins {
> >>                  pins-rst {
> >>                          pinmux =3D <PINMUX_GPIO108__FUNC_GPIO108>;
> >>                          output-high;
> >>                  };
> >>
> >>                  pins-en {
> >>                          pinmux =3D <PINMUX_GPIO48__FUNC_GPIO48>;
> >>                          output-low;
> >>                  };
> >>          };
> >>
> >>          spi1_pins: spi1-pins {
> >>                  pins {
> >>                          pinmux =3D <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
> >>                                   <PINMUX_GPIO137__FUNC_SPIM1_CLK>,
> >>                                   <PINMUX_GPIO138__FUNC_SPIM1_MO>,
> >>                                   <PINMUX_GPIO139__FUNC_SPIM1_MI>;
> >>                          bias-disable;
> >>                  };
> >>          };
> >
> > To be fair, the above is one valid kind of generic pinmux description.
> >
> >  From Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml :
> >
> > While not required to be used, there are 3 generic forms of pin muxing =
nodes
> > which pin controller devices can use.
> >
> > For hardware where pin multiplexing configurations have to be specified=
 for
> > each single pin the number of required sub-nodes containing "pin" and
> > "function" properties can quickly escalate and become hard to write and
> > maintain.
> >
> > For cases like this, the pin controller driver may use the pinmux helpe=
r
> > property, where the pin identifier is provided with mux configuration s=
ettings
> > in a pinmux group. A pinmux group consists of the pin identifier and mu=
x
> > settings represented as a single integer or an array of integers.
> >
> > The pinmux property accepts an array of pinmux groups, each of them des=
cribing
> > a single pin multiplexing configuration.
> >
> >   - end quote -
> >
> > So Mediatek is following one of the generic pinmux bindings. It's not t=
he
> > only one using this scheme either. STM32 and some of the Renesas platfo=
rms
> > also follow it.
> >
>
> Not saying that MediaTek is the only one that uses such bindings style, a=
t all.
>
> I admit I was too tough about that, but as of the current state, the *bin=
ding*
> is not generic, and it's strictly tied to the GPIO Controller IP version =
of one
> specific SoC.
>
> While this style is generic, the actual pinmux *definitions* in the heade=
r are
> not generic - that's what I wanted to say, and I admit I went a bit too v=
ague
> with words that are easy to misunderstand.
>
> >> ....but the driver should gain compatibility with nodes which would lo=
ok like:
> >>
> >>          panel_default_pins: panel-default-pins {
> >>                  pins-rst {
> >>                          pins =3D "gpio108";
> >>                          function =3D "gpio";
> >>                          output-high;
> >>                  };
> >>
> >>                  pins-en {
> >>                          pins =3D "gpio48";
> >>                          function =3D "gpio";
> >>                          output-low;
> >>                  };
> >>          };
> >>
> >>          spi1_pins: spi1-pins {
> >>                  pins-bus {
> >>                          pins =3D "gpio136", "gpio137", "gpio138", "gp=
io139",
> >>                          function =3D "spi_m1";
> >
> > Why is it "spi_m1", not "spi1"?
> >
>
> PINMUX_GPIO138__FUNC_SPIM1_MO -> s/PINMUX_GPIO138__FUNC_//g/ and s/_MO//g
>
> M1 stands for "Master 1" - that's because technically there could be a di=
fferent
> pinfunc for SPI "Slave 1" function.
>
> That's SoC-specific anyway, not all of them have SPIS1, not all of them n=
eed
> a different function, and... you get the point, I'm sure :-)
>
> >
> > Honestly you likely don't want this, or rather you don't want a huge ta=
ble
> > of pins and pinmux values and strings in the kernel. It takes a lot of =
time
> > to write, even more time to review, and takes up a lot of space for eac=
h
> > pinctrl driver. And those are generally built-in.
> >
> > The Allwinner platform has gone in the reverse direction: instead of ha=
ving
> > a huge table, we put the mux value in the DT using a custom property.
> > See the following for discussions:
> >
> > https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.23=
28-1-andre.przywara@arm.com/
> > https://patchwork.ozlabs.org/project/linux-gpio/patch/20171113012523.23=
28-2-andre.przywara@arm.com/
> >
> > And this is what finally landed:
> >
> > https://lore.kernel.org/linux-gpio/20250306235827.4895-7-andre.przywara=
@arm.com/
> >
> > Has it caused a bit of trouble? Perhaps. I was working on various perip=
herals
> > on a new board and put in the wrong mux value and didn't notice for a c=
ouple
> > days.
> >
>
> Then we must find a way to decouple hardware-specific information from th=
e actual
> header I think?

By "hardware-specific information" I assume you mean how the different I/O
blocks are arranged and ordered to form a contiguous pin range?

We could take a look at the Rockchip design: IIRC it has a number of GPIO
controllers which handle the pin specific configs, but the pinmuxing is
done from a separate GRF (general register field) region. The GPIO
controllers' registers have the same layout, and the binding and driver
assume the same number of pins per block. Actual missing pins are just
skipped over.

I don't remember off the top of my head how the MediaTek hardware cuts
its set of controls across the hardware, but it might be similar. But
as I mentioned earlier, MediaTek doesn't number pins, and it certainly
doesn't split them into banks.

Hope that gives you some ideas to work with.

> Alternatively - that's what I have understood - and if I've understood th=
at wrong,
> this needs clarification from the bindings maintainers, and why they want=
ed the
> MediaTek pinctrl bindings to get moved to arch/arm64/boot/dts/mediatek/ i=
nstead of
> include/dt-bindings/pinctrl/
>
> Bindings maintainers, any word on this?
>
> Did I misunderstand anything in past reviews ... from krzk if I remember =
correctly?

I think the reason was that they looked like macros for every pin/function
combination, and nothing more.

For any other SoC that had a more *rigid* PIO block where the numbering
is predictable, then yes, it would seem like helpful macros to make the
raw numbers more human readable.


ChenYu

> Cheers,
> Angelo
>
> >
> >
> > ChenYu
> >
> >>                          bias-disable;
> >>                  };
> >>          };
> >>
> >> .... or
> >>
> >>          spi1_pins: spi1-pins {
> >>                  pins-bus {
> >>                          function =3D "spi_m1";
> >>                          groups =3D "spi_m1_pins";
> >>                          bias-disable;
> >>                  };
> >>          };
> >>
> >> That's the entire situation.
> >>
> >> Cheers,
> >> Angelo
> >>
>
>

