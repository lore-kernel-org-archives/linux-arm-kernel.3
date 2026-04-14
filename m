Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C0F9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=; b=CG5Gl7lczioI4PIokh7Xsc4m2o
	bdvYQteHMR5pcuWKwfyi5p7aHeBmeEpu/20P0BsPpz5DwkSafqgvzyIbFEW9XQOQesU6QAiFlgp4H
	Q49kgZePt+8rCp1p3t2JWmbZR3c7bIXEq8bq0WUjy9ZXHfgKKyR7XHOli/pvkiHyjAyuuH4fxhiJF
	uZcB3xzymVKpUpd7R0ZE1K+tzftACi0bmGxhFLlU6Lyai1qnyHU3u3vgkZmHOvXTwMmsgUVrfVMDe
	hq+HGePp1BTfCBCCFnbptZj1ppVdPLZUXwF39Lgxhs5G1vhGgLnlFJndALBkOi8wlCdnEaABq4gL/
	8ktXE7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeQp-0000000HQRj-0eKZ;
	Tue, 14 Apr 2026 14:07:59 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeQl-0000000HQQM-0A1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:07:57 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d4be94eeacso5953363a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175673; cv=none;
        d=google.com; s=arc-20240605;
        b=B0X7FteSk/izDR4NgGn1RytLSTSFKr/w3/aBzsHEeBZ47wUoJ7DCbmYHuatx2vA91K
         xpCdohVUFecwL6E90f+RIxjdK/D/G6pIcZay+2AoTYW8hNTNzOHzMbkinWIfBtLcLLnI
         B+yGi3VZdKuTf6BAQuwHQILCyy5gl3D3eNIP5celzXJiJsQnsyvnGZ6O89CkKEeQsYOx
         ufTOx6Y43BrYeRIzAYdv3MjklJjb/r1I6yqdM8tpf/xAS0orgZKt0NsRJNAg9AUMu2Im
         Iuaoc3ykbPLtNXN7hMtY6KKZTH8GJYzUaBi2lAXq1z8sdHpu49przA2OPQlbwaPS6R5y
         X/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        fh=rWGIKsU1w3fmFPMbw9Th7Zur7ogkWNdQ5msc9HpOYO0=;
        b=hc459gwm/X5ozuhT7FDjTgWt7lYEewE5x51F1q3shii4g2zGJT1PXzUW5K/T6DRNp/
         snPP6wxkoGAYq/sK+3rG27075+XDt+ONhjLMXm22Xvwy8uzkmUtJ5sQy7R8RJ8rdJzlp
         8hiLJLIwskMV+2v5M6LQeW74ulyI5hzuPAITEFuk4kaXuR7iIqzs/js28z+jjwKIrPnU
         hlVqEvsdWVFLRn9A1rg8LKbx6oJx2Fppq5IpGnTwUzR9i4GurCaa/rmaJvBF1k40VTAW
         5133kxSlewkM/7/OSOwynPYEX44BYuLX8Q3i9k8Vbgs1KdzwtsT2VoIVxA2YXBAcFxYU
         EJgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776175673; x=1776780473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        b=Ly7HSdHUEcejpq+UbgKvdIJaHWafgqCXNwynSrI6XJSBmoJpr/aYSNAasu4LZmknf+
         7FGJfqiCY6nKcmP4QllTZj88OCqgC9TYZToSKpdoiNmNMxTBsLRCsTNwUJHLxPQvN4Hm
         KNeSusJ8hHb9CbW9yFhD3NNQSTA9N4+BXHRCd8QUq2VjFJDI022k0xwRGwwt9Olnjcet
         2j7HoIBqJhIgG7OqbMP11sQgW5742KibzhTEstl8cSp4f5ixspsgL70wdA1Xy1ARvPjP
         u6hQQdDiRBBg7l5JlK7U6kbV26coyUZZQ8vmZKYp3RS8YwZUQosxciM+pfSxE3vES9Yb
         TAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175673; x=1776780473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PkaVo8h9lBRir+HqwJgm7pOOdykb4zdly5L78FOuyuc=;
        b=g8b1BIVfJI7T7o+qu+31UDFdwo1qlNx/l8N3dLIumFjyA5SlrJ5dD6AOwBlJvWGdkb
         GJupSqLuz6IzVV8ysCxNatAU0OD4afUbXih6umxBJ1Eb5ricxEan1kYZYIPNuZb0o2ak
         MrVMdaMuiw5n5gnLzOH/tkpe3x4j3ia0qTmXdSIyScN3h0k8+chURYLhq+e7vHhXYAsw
         zkFHyfS9kSdXizgbXExokrYjL58dYbvX3agscs1HHVVxgtg1aZ915rSEA2H5pq9z7HyQ
         nTKKLC923JLB7jxm2oTUE+8JnjA6Z22hJ32hjeilKXi9WLSY1qI5L5/C5QHfl2uMH3uA
         Pgpw==
X-Forwarded-Encrypted: i=1; AFNElJ+BqiQ3nHFtNL2s5jrXpO5JTx1aCgMDE2x7e3BHHjGbqW0c7YnWrfbv7O7DKHEZt5+l5Lj3hkDXe566TkKPPoWQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFc8o1C4sHL2Vk8U+3azN3mTl7j4bf0OoW3CM7YzvDzh3pJUvZ
	IR9ZltavBrsagh11qE7D8c8S4cwKFTD0W0BXjM1QozEsazgqEjrQ+zgxk+vgU45rP1ZhmLl4UN2
	nxnYQZEwXqy33WBZMkd0iXFVd6c1K5CI0hZL+FLbDpA==
X-Gm-Gg: AeBDiesrRlkBPh6Y01E1xYLB9kWSLzXFhmtTm1WBtDnwAPIa5E5crvA1QQF00avil/h
	jbB69LFBadcnjR58Y93+pelP2QF9e64Rpa49EKOibg9k8lac1HgVuHk3kXyjrDTdSXJ4EG2zZGD
	FRLrtt1d0arYbm19RxAYV7tGxwfnqiFIjTqD0VZTmS2Vt7HVfaQSO3CsfTTYI/v5uvRybQNNw66
	dQVnDh4TOYxaXcdGT1IwmJRgmoosVwbM3eT9EpjA/RLfxi7coQG2jajMajDJuczOs9vOvppf8Ve
	fVvG+VLgxok7VqOOhDKbkIZF6hclMEbkCV6qRzA+FZSJgsRLFs7GxR0l+F3ilGMzBsvWrvaCIVv
	l6hmjzQ==
X-Received: by 2002:a05:6830:67cf:b0:7d7:f15b:bdcf with SMTP id
 46e09a7af769-7dc27f7b5c2mr10526044a34.28.1776175673260; Tue, 14 Apr 2026
 07:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260411024743.195385-1-dennis@ausil.us> <20260411024743.195385-4-dennis@ausil.us>
 <CABjd4YwZJe8fO+kJiXRTq5gZirVvKvCqWzNdYqN3-6eMAZUFxQ@mail.gmail.com>
In-Reply-To: <CABjd4YwZJe8fO+kJiXRTq5gZirVvKvCqWzNdYqN3-6eMAZUFxQ@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 14 Apr 2026 09:07:41 -0500
X-Gm-Features: AQROBzCWgjy0MHcosgH1clxH68d6T5-V8Mjv2Weq2daMr5LTi705y3HE_wCPOpw
Message-ID: <CAABkxwth=fC20n_iO9GV4Yv+ybUo_srRe_aoJoC=o6setTwTDg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_070755_188321_4841FA6C 
X-CRM114-Status: GOOD (  47.92  )
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

On Sat, Apr 11, 2026 at 1:00=E2=80=AFPM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Sat, Apr 11, 2026 at 6:47=E2=80=AFAM <dennis@ausil.us> wrote:
> >
> > From: Dennis Gilmore <dennis@ausil.us>
> >
> > Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> >
> > - eMMC module, you can optionally solder a SPI NOR in place and turn
> >  off the eMMC
> > - PCIe-attached NIC (pcie2x1l1)
> > - PCIe NVMe slot (pcie2x1l2)
> > - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> > - BCM4345C5 Bluetooth
> > - es8388 audio
> > - USB 2.0 and USB 3.0
> > - Two HDMI ports, the second is connected to the SoC's DP controller
> >   driven by a transparent LT8711UXD bridge that has firmware onboard an=
d
> >   needs no node defined.
> >
> > Vendors description and links to schematics available:
> > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/detai=
ls/Orange-Pi-5-Pro.html
>
> Hi Dennis,
>
> The most useful of these is the schematic, so it's best to include a
> direct link to that in a dedicated Link: tag
>
> Link: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/v=
iew

Will change to that, I did not do it because a random Google Drive
link doesn't really indicate it as a source of truth

> [schematic]
>
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > ---
> >  .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
> >  drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +
>
> These should be three separate patches, never lumped together. First
> the binding change, next the driver change. They go together via the
> subsystem tree (likely DRM in this case). Then the DTS addition (or
> change) separately (it goes via the SoC tree).

They were something I was doing as I worked on getting the second HDMI
port working, they ended up not being needed, and I should have
removed it there really should have only been the dts and Makefile. I
should have waited until the morning to review again and send.

> >  4 files changed, 372 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
> >
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml
> > index 6345f0132d43..079a912d97f1 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
.yaml
> > @@ -57,6 +57,13 @@ properties:
> >        - const: i2s
> >        - const: spdif
> >
> > +  hpd-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO used for hot plug detection when the controller's native HP=
D
> > +      input is not connected. If not specified, the controller uses it=
s
> > +      internal HPD detection mechanism.
>
> Do you actually need this change? According to the schematic, the
> DP_HPDIN line from the DP-HDMI bridge is routed to the native
> DP0_HPDIN_M0 pin of the DP controller, so it shouldn't require this
> GPIO trick if the pinctrl is configured properly.

No I do not, It was an approach I had experimented with but did not
use and did not mean to include here.


> >    phys:
> >      maxItems: 1
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index 4d384f153c13..c99dca2ae9e7 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c=
.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/=
arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > new file mode 100644
> > index 000000000000..84c83aa69f63
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > @@ -0,0 +1,352 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588s-orangepi-5.dtsi"
> > +
> > +/ {
> > +       model =3D "Xunlong Orange Pi 5 Pro";
> > +       compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> > +
> > +       aliases {
> > +               mmc0 =3D &sdhci;
> > +               mmc1 =3D &sdmmc;
> > +               mmc2 =3D &sdio;
> > +       };
> > +
> > +       dp-con {
> > +               compatible =3D "dp-connector";
>
> You don't have a physical DP connector on the board, so this node
> doesn't describe actual hardware, and is thus a no-go. What you have
> instead is an HDMI type A connector routed via an onboard DP to HDMI
> bridge, so you should describe exactly that in the device tree (a node
> for the HDMI connector, a node for the bridge, a node for the DP
> controller, and endpoints connected from the controller to the bridge,
> from the bridge to the connector). Please refer to the device tree for
> Radxa Rock 5 ITX, which has a similar setup (but a different bridge
> IC).
>
> I don't think your LT8711UXD has existing binding or driver entry, so
> a one-line patch will likely be needed to
> Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml,
> and a separate one to drivers/gpu/drm/bridge/simple-bridge.c. Separate
> ones :)

Will add in v7

> > +               port {
> > +                       dp_con_in: endpoint {
> > +                               remote-endpoint =3D <&dp0_out_con>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       analog-sound {
> > +               compatible =3D "simple-audio-card";
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&hp_detect>;
> > +               simple-audio-card,bitclock-master =3D <&masterdai>;
> > +               simple-audio-card,format =3D "i2s";
> > +               simple-audio-card,frame-master =3D <&masterdai>;
> > +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_=
ACTIVE_HIGH>;
> > +               simple-audio-card,mclk-fs =3D <256>;
> > +               simple-audio-card,name =3D "rockchip,es8388";
> > +               simple-audio-card,routing =3D
> > +                       "Headphones", "LOUT1",
> > +                       "Headphones", "ROUT1",
> > +                       "LINPUT1", "Microphone Jack",
> > +                       "RINPUT1", "Microphone Jack",
> > +                       "LINPUT2", "Onboard Microphone",
> > +                       "RINPUT2", "Onboard Microphone";
> > +               simple-audio-card,widgets =3D
> > +                       "Microphone", "Microphone Jack",
> > +                       "Microphone", "Onboard Microphone",
> > +                       "Headphone", "Headphones";
> > +
> > +               simple-audio-card,cpu {
> > +                       sound-dai =3D <&i2s2_2ch>;
> > +               };
> > +
> > +               masterdai: simple-audio-card,codec {
> > +                       sound-dai =3D <&es8388>;
> > +                       system-clock-frequency =3D <12288000>;
> > +               };
> > +       };
> > +
> > +       pwm-leds {
> > +               compatible =3D "pwm-leds";
> > +
> > +               led-0 {
> > +                       color =3D <LED_COLOR_ID_BLUE>;
> > +                       function =3D LED_FUNCTION_STATUS;
> > +                       linux,default-trigger =3D "heartbeat";
> > +                       max-brightness =3D <255>;
> > +                       pwms =3D <&pwm15 0 1000000 0>;
> > +               };
> > +
> > +               led-1 {
> > +                       color =3D <LED_COLOR_ID_GREEN>;
> > +                       function =3D LED_FUNCTION_ACTIVITY;
> > +                       linux,default-trigger =3D "heartbeat";
> > +                       max-brightness =3D <255>;
> > +                       pwms =3D <&pwm3 0 1000000 0>;
> > +               };
> > +       };
> > +
> > +       fan: pwm-fan {
> > +               compatible =3D "pwm-fan";
> > +               #cooling-cells =3D <2>;
> > +               cooling-levels =3D <0 50 100 150 200 255>;
> > +               fan-supply =3D <&vcc5v0_sys>;
> > +               pwms =3D <&pwm2 0 20000000 0>;
> > +       };
> > +
> > +       vcc3v3_dp: regulator-vcc3v3-dp {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
>
> Please don't forget to add explicit pinctrl nodes for each GPIO pin
> you use (here and in other places like this). These GPIOs happen to
> work on Linux without configuring their pin control first, but that is
> pure luck and coincidence due to how the respective Linux subsystems
> are wired together, and if you ever need to use this device tree in
> e.g. U-boot (which also derives its DTS from the Linux kernel tree) it
> will break there.

Will do

> > +               regulator-always-on;
> > +               regulator-boot-on;
>
> Does it have to be always-on, boot-on? This looks like a hack to work
> around the fact that you didn't define the bridge node, which uses
> this as its supply. Please model the dependencies explicitly - most
> likely that will let you drop these attributes.

without these the the dp to HDMI bridge does not power up, and HPD
does not work,

> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
>
> It's two separate regulators on your schematic, one DCDC at 1.25V and
> the other a load switch at 3.3V, driving six separate voltage inputs
> of the DP bridge. They are both controlled by the same GPIO pin
> though, so _maybe_ it's okay to have just one "virtual" node like this
> to model them together. Would be great for the DT maintainers to weigh
> in on this.
>
> > +               regulator-name =3D "vcc3v3_dp";
> > +               vin-supply =3D <&vcc_3v3_s3>;
> > +       };
> > +
> > +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> > +               regulator-boot-on;
>
> See above
>
> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-name =3D "vcc3v3_phy1";
> > +               startup-delay-us =3D <50000>;
> > +               vin-supply =3D <&vcc_3v3_s3>;
> > +       };
> > +
> > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-name =3D "vcc5v0_otg";
> > +               vin-supply =3D <&vcc5v0_sys>;
> > +       };
> > +
> > +       sdio_pwrseq: sdio-pwrseq {
> > +               compatible =3D "mmc-pwrseq-simple";
> > +               clocks =3D <&hym8563>;
> > +               clock-names =3D "ext_clock";
> > +               post-power-on-delay-ms =3D <200>;
> > +               reset-gpios =3D <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
>
> This GPIO also needs a pinctrl
>
> > +       };
> > +
> > +       typea_con: usb-a-connector {
> > +               compatible =3D "usb-a-connector";
> > +               data-role =3D "host";
> > +               label =3D "USB3 Type-A";
> > +               power-role =3D "source";
> > +               vbus-supply =3D <&vcc5v0_otg>;
> > +       };
> > +};
> > +
> > +&dp0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&dp0m0_pins>;
>
> This switches your HPD pin to the native DP controller handling
> (DP0_HPDIN_M0), so the GPIO bits you've patched into the controller
> driver aren't even used, and it doesn't look like you tested that code
> path.

Right, I had not meant to include. It was something I had worked on in
refactoring it and went a different route.

>
> > +       status =3D "okay";
> > +};
> > +
> > +&dp0_in {
> > +       dp0_in_vp1: endpoint {
> > +               remote-endpoint =3D <&vp1_out_dp0>;
> > +       };
> > +};
> > +
> > +&dp0_out {
> > +       dp0_out_con: endpoint {
> > +               remote-endpoint =3D <&dp_con_in>;
>
> This will need to be rewritten once you add the proper bridge chain
> leading up to the HDMI type A connector.

Yep

> > +       };
> > +};
> > +
> > +&i2c1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c1m4_xfer>;
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c3m0_xfer>;
> > +       status =3D "okay";
> > +
> > +       es8388: audio-codec@11 {
> > +               compatible =3D "everest,es8388", "everest,es8328";
> > +               reg =3D <0x11>;
> > +               #sound-dai-cells =3D <0>;
> > +               AVDD-supply =3D <&vcc_3v3_s0>;
>
> Are you sure? Schematic says VCCA_3V3_S0, which is a different
> regulator (PLDO4 output of the PMIC)
>
> > +               DVDD-supply =3D <&vcc_1v8_s0>;
>
> Schematic says VCCA_1V8_S0, which is a different regulator (PLDO1
> output of the PMIC)
>
> > +               HPVDD-supply =3D <&vcc_3v3_s0>;
>
> Schematic says VCCA_3V3_S0
>
> > +               PVDD-supply =3D <&vcc_3v3_s0>;
>
> Schematic says VCCA_1V8_S0

I will rename these. It was what was used in the original orange pi 5
boards and was carried over, but looking at their schematics, they are
labeled the same so changing makes sense. after digging in the Pi 5
Pro names two of the regulators differently to the 5 and 5b. and the
naming of the current ones does not match the schematic

>
> > +               assigned-clock-rates =3D <12288000>;
> > +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> > +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&i2s2m1_mclk>;
> > +       };
> > +};
> > +
> > +&i2c4 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c4m3_xfer>;
> > +       status =3D "okay";
> > +};
> > +
> > +&i2s2_2ch {
> > +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_sclk
> > +                    &i2s2m1_sdi &i2s2m1_sdo>;
> > +       status =3D "okay";
> > +};
> > +
> > +&package_thermal {
> > +       polling-delay =3D <1000>;
> > +
> > +       cooling-maps {
> > +               map0 {
> > +                       trip =3D <&package_fan0>;
> > +                       cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> > +               };
> > +
> > +               map1 {
> > +                       trip =3D <&package_fan1>;
> > +                       cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> > +               };
> > +       };
> > +
> > +       trips {
> > +               package_fan0: package-fan0 {
> > +                       hysteresis =3D <2000>;
> > +                       temperature =3D <55000>;
> > +                       type =3D "active";
> > +               };
> > +
> > +               package_fan1: package-fan1 {
> > +                       hysteresis =3D <2000>;
> > +                       temperature =3D <65000>;
> > +                       type =3D "active";
> > +               };
> > +       };
> > +};
> > +
> > +/* NVMe */
> > +&pcie2x1l1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
> > +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>
> The GPIO also needs a pinctrl
Will fix

> > +       supports-clkreq;
> > +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> > +       status =3D "okay";
> > +};
> > +
> > +/* NIC */
> > +&pcie2x1l2 {
> > +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>
> The GPIO also needs a pinctrl
Will fix

> > +       vpcie3v3-supply =3D <&vcc3v3_phy1>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pinctrl {
> > +       bluetooth {
> > +               bt_wake_gpio: bt-wake-pin {
> > +                       rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > +               };
> > +
> > +               bt_wake_host_irq: bt-wake-host-irq {
> > +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_=
pull_down>;
> > +               };
> > +       };
> > +
> > +       usb {
> > +               vcc5v0_otg_en: vcc5v0-otg-en {
> > +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > +               };
> > +       };
> > +
> > +       wlan {
> > +               wifi_host_wake_irq: wifi-host-wake-irq {
> > +                       rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_=
pull_down>;
> > +               };
> > +       };
> > +};
> > +
> > +&pwm15 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm15m2_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pwm2 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm2m1_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&pwm3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pwm3m2_pins>;
> > +       status =3D "okay";
> > +};
> > +
> > +&sdhci {
> > +       status =3D "okay";
> > +};
> > +
> > +&sdio {
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +       bus-width =3D <4>;
> > +       cap-sd-highspeed;
> > +       cap-sdio-irq;
> > +       keep-power-in-suspend;
> > +       max-frequency =3D <150000000>;
> > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > +       no-mmc;
> > +       no-sd;
> > +       non-removable;
> > +       sd-uhs-sdr104;
> > +       status =3D "okay";
> > +
> > +       ap6256: wifi@1 {
> > +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac=
";
> > +               reg =3D <1>;
> > +               interrupt-names =3D "host-wake";
> > +               interrupt-parent =3D <&gpio0>;
> > +               interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> > +       };
> > +};
> > +
> > +&uart9 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
> > +       uart-has-rtscts;
> > +       status =3D "okay";
> > +
> > +       bluetooth {
> > +               compatible =3D "brcm,bcm4345c5";
> > +               clocks =3D <&hym8563>;
> > +               clock-names =3D "lpo";
> > +               device-wakeup-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH=
>;
> > +               interrupt-names =3D "host-wakeup";
> > +               interrupt-parent =3D <&gpio0>;
> > +               interrupts =3D <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
> > +               max-speed =3D <1500000>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&bt_wake_host_irq &bt_wake_gpio>;
> > +               shutdown-gpios =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> > +               vbat-supply =3D <&vcc_3v3_s3>;
> > +               vddio-supply =3D <&vcc_1v8_s3>;
> > +       };
> > +};
> > +
> > +&usb_host0_xhci {
> > +       dr_mode =3D "host";
> > +};
> > +
> > +&usbdp_phy0 {
> > +       rockchip,dp-lane-mux =3D <0 1>;
>
> I'm wondering if the DP controller's "out" endpoint should go to the
> PHY instead of directly to the connector/bridge. That would describe
> the hardware better.

This was initially added to make sure that the type A port worked
because it uses lanes 2/3, and I needed to make sure 0/1, which route
to the dp were allocated. The DP PHY is already tied to the controller
via the phys property on &dp0 (inherited from rk3588s.dtsi), and the
lane mux is set via rockchip,dp-lane-mux on &usbdp_phy0. This matches
the convention used by rk3588-evb2-v10, rk3588s-coolpi-4b, and
rk3588s-indiedroid-nova =E2=80=94 routing the dp0_out endpoint through the =
PHY
would diverge from the existing binding and all in-tree users.

> > +};
> > +
> > +&vp1 {
> > +       vp1_out_dp0: endpoint@a {
> > +               reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> > +               remote-endpoint =3D <&dp0_in_vp1>;
> > +       };
> > +};
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/=
bridge/synopsys/dw-dp.c
> > index fd23ca2834b0..b58f57b69b22 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > @@ -8,6 +8,7 @@
> >   */
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/irq.h>
> >  #include <linux/media-bus-format.h>
> > @@ -330,6 +331,8 @@ struct dw_dp {
> >         u8 pixel_mode;
> >
> >         DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
> > +
> > +       struct gpio_desc *hpd_gpiod;
> >  };
> >
> >  enum {
> > @@ -481,6 +484,9 @@ static bool dw_dp_hpd_detect(struct dw_dp *dp)
> >  {
> >         u32 value;
> >
> > +       if (dp->hpd_gpiod)
> > +               return gpiod_get_value_cansleep(dp->hpd_gpiod);
> > +
> >         regmap_read(dp->regmap, DW_DP_HPD_STATUS, &value);
> >
> >         return FIELD_GET(HPD_STATE, value) =3D=3D DW_DP_HPD_STATE_PLUG;
> > @@ -2002,6 +2008,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, str=
uct drm_encoder *encoder,
> >                 return ERR_CAST(dp->regmap);
> >         }
> >
> > +       dp->hpd_gpiod =3D devm_gpiod_get_optional(dev, "hpd", GPIOD_IN)=
;
>
> Not tested, not needed, why bother?..

this is not needed

> Best regards,
> Alexey

Thanks for the feedback


Dennis

