Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D81CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF2ENtSHxpeUd+ayXyc4puyf9CPxrGQ63HI8vKzfFlk=; b=QZDszkf+hZ9axR
	xK81DfCfxPTJUVt+kh+lXP1JSfw80M05Rn6ruSZZVGfd/gXYq8k7lMYSpxacezMyG5xXj9kjVjFr7
	SPjOT8FM0iFcZv+Oveqwe/iOLRXdw7LHv2rK4qck0tyC9oTYmud/DAAWEmpALlJW7ZPWWj/7ZjYpu
	qBaowZuML1Fdxx59icpiCH74jwzfWwqgQvXasSRSC0QE5S6mq0wXF8on0O8chKmGRDzWyaSnEZ2Hk
	pzMKO+qIeHJmxNUSeHwRQI6BPJOwmqID8C9Uuhb09DQVpVUdXHi57K/DF+lnZhcCIRE7GAa+J1xpK
	sU5GLFV/IZ56vSWhjCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFMy-0000000FZio-21GO;
	Sun, 24 May 2026 20:24:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFMv-0000000FZiR-4A5T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 20:24:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9411E40663
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E531F000E9
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779654256;
	bh=qF2ENtSHxpeUd+ayXyc4puyf9CPxrGQ63HI8vKzfFlk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HisCkmrZAlCCAeVfzBL2isa35vgLvuT0HgrzBt2TzrnVMu4MkmHTcpR3IYBE0KaNm
	 XQ8oaTnb1+vSUkFNauo+3VBD0f4eTEFgyJc9RA3YcwPsLepvmtRjP8PZtPc9kpQVfw
	 r7pPlyS/b8PxAyROKyzYiEGJ8XI8mfwI49EPm/Wi6lT9OH0ClVIyJ6vBd1eLilBEWH
	 yAwYC5uOrIg+sDhN35LEC/HYroeaYzXk2OCcTjPLavolEgBFQ5sEdSi7bWpKfAC76U
	 3EpLjM12ugD9lnmqxQDTlrMO1KsnpDni/Iio5+17CYQrjq2fWN/ifM7OlFZkqRCdKA
	 BkHMUSMPqRtUg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393da8f389bso77142431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 13:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MaCr+4U8FXmkn8JKGVYg9ecyCIX1Hv2f/8ihnwv/AizdJBKVO5dj7GKuZzSV4J6eqdggpZYzZ3o/kg69qbL/L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8UaXvYgOrkYYQwets1EgxfcL3YbCm6SWB4d7LfVuKyHXkY4Os
	CDGzVzgoKB18DhXV9g8WSLazRR/5dJxS1Kyrffq9gho1Rgja9n6XFzKtaB25iuW2IX0Xgrwgc3d
	eel0N02F6zOfiWDkzSzg8+PEsG9jqPZI=
X-Received: by 2002:a2e:8957:0:b0:38d:e220:8dc2 with SMTP id
 38308e7fff4ca-395d8cef4abmr31227691fa.20.1779654254895; Sun, 24 May 2026
 13:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260518153339.619947-1-paulk@sys-base.io> <20260518153339.619947-9-paulk@sys-base.io>
In-Reply-To: <20260518153339.619947-9-paulk@sys-base.io>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 23:24:02 +0300
X-Gmail-Original-Message-ID: <CAGb2v65g5pRfamiGXDzf1e3tDOC3hKKpN42zsehyV5kH64mqvA@mail.gmail.com>
X-Gm-Features: AVHnY4JZ91o4upme6W15C4GgmvRnJJM3a9BrnhW1qst5pC5WhUcG5wXpq_KeV7k
Message-ID: <CAGb2v65g5pRfamiGXDzf1e3tDOC3hKKpN42zsehyV5kH64mqvA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640
 camera overlay
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_132418_077225_8052D199 
X-CRM114-Status: GOOD (  25.85  )
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

On Mon, May 18, 2026 at 6:15=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> Add an overlay supporting the OV5640 from the BananaPi Camera v3
> peripheral board. The board has two sensors (OV5640 and OV8865)

> which cannot be supported in parallel as they share the same reset
> pin and the kernel currently has no support for this case.

This part is no longer true. The kernel recently gained shared GPIO
support. I've tried it on Chromebooks to describe a USB 2/3 hub.
(This is actually one chip and one pin, but has two device nodes
to model the USB 2.0 and USB 3.1 portions.)


> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   3 +
>  .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 115 ++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-ca=
mera-ov5640.dtso
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index f71392a55df8..6975df9d7b46 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a33-vstar.dtb \
>         sun8i-a83t-allwinner-h8homlet-v2.dtb \
>         sun8i-a83t-bananapi-m3.dtb \
> +       sun8i-a83t-bananapi-m3-camera-ov5640.dtb \
>         sun8i-a83t-cubietruck-plus.dtb \
>         sun8i-a83t-tbs-a711.dtb \
>         sun8i-h2-plus-bananapi-m2-zero.dtb \
> @@ -270,6 +271,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-v3s-licheepi-zero-dock.dtb \
>         sun8i-v3s-netcube-kumquat.dtb \
>         sun8i-v40-bananapi-m2-berry.dtb
> +sun8i-a83t-bananapi-m3-camera-ov5640-dtbs +=3D \
> +       sun8i-a83t-bananapi-m3.dtb sun8i-a83t-bananapi-m3-camera-ov5640.d=
tbo
>  sun8i-h2-plus-orangepi-zero-interface-board-dtbs +=3D \
>         sun8i-h2-plus-orangepi-zero.dtb sun8i-orangepi-zero-interface-boa=
rd.dtbo
>  sun8i-h3-orangepi-zero-plus2-interface-board-dtbs +=3D \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov=
5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov564=
0.dtso
> new file mode 100644
> index 000000000000..0d4de0027fea
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dt=
so
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Copyright 2022 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +       /*
> +        * These regulators actually have DLDO4 tied to their EN pin, whi=
ch is
> +        * described as input supply here for lack of a better representa=
tion.
> +        * Their actual supply is PS, which is always-on.
> +        */
> +
> +       ov5640_avdd: ov5640-avdd {

You should fix the device node names, as Sashiko mentioned for patch 9.

> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-avdd";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +
> +       ov5640_dovdd: ov5640-dovdd {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-dovdd";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +
> +       ov5640_dvdd: ov5640-dvdd {

This one as well.

> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ov5640-dvdd";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +               vin-supply =3D <&reg_dldo4>;
> +       };
> +};
> +
> +&csi {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&csi_8bit_parallel_pins>;
> +       status =3D "okay";
> +
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       csi_in_ov5640: endpoint {
> +                               remote-endpoint =3D <&ov5640_out_csi>;
> +                               bus-width =3D <8>;
> +                               data-shift =3D <2>;
> +                               hsync-active =3D <1>;
> +                               vsync-active =3D <1>;
> +                               pclk-sample =3D <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c2_pe_pins>;
> +       status =3D "okay";
> +
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       ov5640: camera@3c {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&csi_mclk_pin>;
> +
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;

Per the "new" DT coding style guide, the compatible property is always
the first oen, and reg, if present, is always the second.

Same comments also apply to patch 9.


Thanks
ChenYu


> +
> +               clocks =3D <&ccu CLK_CSI_MCLK>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&ccu CLK_CSI_MCLK>;
> +               assigned-clock-parents =3D <&osc24M>;
> +               assigned-clock-rates =3D <24000000>;
> +
> +               AVDD-supply =3D <&ov5640_avdd>;
> +               DOVDD-supply =3D <&ov5640_dovdd>;
> +               DVDD-supply =3D <&ov5640_dvdd>;
> +
> +               powerdown-gpios =3D <&pio 3 15 GPIO_ACTIVE_HIGH>; /* PD15=
 */
> +               reset-gpios =3D <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +               rotation =3D <180>;
> +
> +               port {
> +                       ov5640_out_csi: endpoint {
> +                               remote-endpoint =3D <&csi_in_ov5640>;
> +                               bus-width =3D <8>;
> +                               data-shift =3D <2>;
> +                               hsync-active =3D <1>;
> +                               vsync-active =3D <1>;
> +                               pclk-sample =3D <1>;
> +                       };
> +               };
> +       };
> +};
> +
> +&reg_dldo4 {
> +       regulator-min-microvolt =3D <2800000>;
> +       regulator-max-microvolt =3D <2800000>;
> +};
> --
> 2.54.0
>

