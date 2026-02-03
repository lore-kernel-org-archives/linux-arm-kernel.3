Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B592BE8B363
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=; b=yLe9xjsdK73KnmIHXVUVwVau7x
	VkzhdoyBA4GVsHXm0MbUhdMK7PRoqO9XCHj2THe8zKcyXnWbJgKGGByjOWP59nT1xQDv4yaAfy26h
	jUcESmh8IBl6WNtEzLtmnBLLWyGVV75CnQyAMwimEYpG3Pv2dbYqTk87vnO1A/X+KWKOMJRNh3b0t
	vYf2kYxi9G5pWX2zhqc0T/pjfhR1YZd7yZtoIgqgW98VG4nwjLxfYZElAWRky1f0JVAVrpaUXIYdI
	OryoqBzWxufuKmIdRsdAJeaDxXMKgrtTOVuM84iamiR30Orvi95l78dbwrM+jNSvmn+bEX9jhT9Ac
	KpOZ3SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN44-00000007KVO-1lNB;
	Tue, 03 Feb 2026 20:32:00 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN41-00000007KUc-1VWV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 20:31:58 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40438380b88so3593795fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 12:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770150716; cv=none;
        d=google.com; s=arc-20240605;
        b=HnaijhvLkeQaNZwM4DPzQVx/JB6nM2BNNxTKpjBDYaz/EPR7lAdbo1t7NBdkVECpSt
         Yql9LrJbA+XZNwUOHlGoj9tg9p6PiDAyxGyjEQ/91xBLJ+7hSFvpjddZixJWGC/IGvE+
         PigLbpemWJZdOmzOjrUblU2DaqeFfzbIPx3LAh412YzgoYxU8B9NrsDsxYt+bSXEa6EU
         KgaCeNmU9Wh1HGoWhlTEBQUZpsf3HYVtPQnKSfEaGzi2zob/qN10Tj+f79trOBNIMre0
         +Kl+fxugGRzlGwp1o+Q4bcHugff8tfYznTJ/lMTvezPo0kqHLhmuRKQPEUFRw7il4r04
         AX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        fh=upSFtSUaALSswL0UXQbSvsTeFavmjZJ9vnO+lzX58rA=;
        b=hrg66xTNetaIzHQ65SbdP+sCeLEdhtCh3vQGlErmxl+iQt5xqXRayxwMGfKOpztC5+
         5iDDyPeVq/YLwjPkpkgy/Sg8cH7gi1GQuMY/aWleTGGGX859/50BzZ78Wv1FGIt458G6
         Ke/XHElpBJqBC5EolrB9CQrXmP8LLQTbZcDBDRDiDi/6xr0GG4B1XV1KgiNrqteWHiw4
         M61lypab0DGEOhEWbcwFcIBViiMa2uc4rPtPTtlbUnnOS8MkhXI1lzgbbjgYaLrhBm+g
         pYnGyydGS8z7N4pB8bpNCPHPiXAfs61h9vKH1kTjAc+P9Isr3/dl5SflUfqjmVIXXWqb
         KF7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1770150716; x=1770755516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        b=HSZ8V0UmDhjoiG9StXbOI2k8gGs/pDScURF9QSkrFKU7N1h6taqaTLCv6YfC5wxx/G
         NxOjUj3vbChy7/TLUEtNGQetrKi7jXcuoZPSEjsej9SDxkWvviRGFaWfqXT0BoBe2gsP
         ODUxq6g9AlxRWTzvSPzWjpXoNtVvAlFUz62lDYTiGcQ2d9rFLPIGrpK//3RxJHhrHLy+
         zzUyhwdMl960INdaJQwZNdBfVlnngrr6ybCoVuv9usGWpKFf9cBkTBb9xXhkNFmCNB2j
         Td2ckCVea2LL88YSYjmaNAAQiHxXzfWUxp+SbfuFtKd+C8GNADId2o7vrbbNoy92JMe7
         ubcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770150716; x=1770755516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CttTs2kso+hQn7GHK2gtz+9z0ip+70pxKojcVe3oG34=;
        b=cCOfcjyIdB/EwU/gP8kFNT35D7ckI4A0VUaZghw5K5xV2WamTDlalVfqkKTMORAp0I
         K0POO9r8zWwJ8WgfYv8qfs+kQC9CZjR+DSnYLKv3zc/Uru7Ypsn2evFaXrxn3nsEGmNt
         LtpJtIbA/DrJN7z+mNiRVI9X7AXosQUix5WROwTS1hS160kEPicMTShGOg5+3m01YPtL
         Ve9rk1ECIOcACitrESXVC0Nqteh28Gg54L1sBFH7Ab4DxwH7tO6wvKbAEO4tx7hOAtIp
         2+MF4MOP88qwDXMR6i+X9rvaejdJoVd2tGxXX3q+8jehKvUko2Hf96JvJlv0H0aow5ED
         1ZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeSzS9/2H1xpLMRCMGLAs4yyO+rwT8FL1XF9MpUdU//kxjR/gYURvadbmKpC5zZ4wO1mBk6Xo1Tp9cKgRCfoVy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9E1PWHjeKZgeyBVzWHPK3QrVxKpjAvwviZ/rM9JCD8f7iiGBa
	9Sd357i+Mx7subX1+cR7iy2xHHYggrUfROKbyc/UsG4OiRiGG5sWpPY7/44Ryi1U0V7dwz56eWq
	Mpvp9yp1WM7DJCjyAFcnND6J0oxCfyah08nVQN+Nhuw==
X-Gm-Gg: AZuq6aJDH/asp/uaiGfSUBuocOkmYPCh42VV/4NLU2o5Mgg7rSXt5UnH0CCTbk82QwF
	v5VX8RMHLTfyq7IfezqFhkekXe4snZLz0QLj4t7/u+dTbzz9mUqBH054l37p2sldJm9sXjT2xNt
	2osaDXfmZaVT3kjB5coCnKozORLN4kH9PtDY1WC3SFw9YgxH7mxgkQeaPll/oCYKRc4+9Pko1mr
	sgeKZHn9Xh3dwTAwZXb1ioOt9xFNtPGIqGA04jhPmdNJPHrhWyrCinEfw3rTDhBE/9P3rD+j2L/
	jboH9A==
X-Received: by 2002:a05:6820:20d:b0:66a:b73:5e2c with SMTP id
 006d021491bc7-66a23cfb687mr430971eaf.77.1770150715478; Tue, 03 Feb 2026
 12:31:55 -0800 (PST)
MIME-Version: 1.0
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com> <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
 <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com> <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
In-Reply-To: <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 3 Feb 2026 12:31:42 -0800
X-Gm-Features: AZwV_QgOGPpO3NSGOVWFQ-Ur1yAZpWg6tChZll09Aj71H1u2DIHSXiWonvdnktU
Message-ID: <CAJ+vNU2toxmJGQX=PNxc3U2w5fHNhRmw2vTe8LM_ksarPixXzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_123157_502917_1BFDC028 
X-CRM114-Status: GOOD (  21.73  )
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

On Tue, Feb 3, 2026 at 11:36=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
> <snip>
> > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/bo=
ot/dts/freescale/Makefile
> > > > index 700bab4d3e60..83fc7faf81d8 100644
> > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw790=
1.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7902.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7903.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7904.dtb
> > > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7906.dtb
> > >
> > > Please run https://github.com/lznuaa/dt-format for new dts to keep ni=
ce
> > > node order,
> > >
> > > If output result is not good enough, let know
> >
> > I notice you asking people to do this but is that tool robust? Every
> > dts I through at it crashes:
> >
> > $ git clone https://github.com/lznuaa/dt-format.git
> > $ cd dt-format
> > $ make
> > $ ./dt-format ~/linux-6.18/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > Segmentation fault (core dumped)
>
> which version imx8mm-evk.dts? It works at my side.
>

Every version I've tried crashes. It crashes for me on v6.18 of
arch/arm64/boot/dts/freescale/imx8mm-evk.dts. See
https://github.com/lznuaa/dt-format/issues/4 - reverting the latest
patch resolves the issue.

Is using dt-format really a requirement? If this is a requirement it
should probably be picked up and integrated into the dtc somehow or at
least properly maintained? There are issues reported that appear very
valid to me that have not been addressed in 7 months time among them
being the fact it crashes on most dts and some of the ordering rules
that have not been the norm:
https://github.com/lznuaa/dt-format/issues

I welcome a tool that helps streamline the dts process but this tool
appears to need some work.

Best Regards,

Tim

> Frank
>
> >
> > Best Regards,
> >
> > Tim
> >
> > >
> > > Frank
> > >
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dahlia.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dev.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-ivy.dtb
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts=
 b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > new file mode 100644
> > > > index 000000000000..ec146a2b7549
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > @@ -0,0 +1,869 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright 2026 Gateworks Corporation
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +#include <dt-bindings/net/ti-dp83867.h>
> > > > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > > > +
> > > > +#include "imx8mm.dtsi"
> > > > +
> > > > +/ {
> > > > +     model =3D "Gateworks Venice GW7906 i.MX8MM board";
> > > > +     compatible =3D "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> > > > +
> > > > +     aliases {
> > > > +             ethernet0 =3D &fec1;
> > > > +             rtc0 =3D &gsc_rtc;
> > > > +             rtc1 =3D &snvs_rtc;
> > > > +             usb0 =3D &usbotg1;
> > > > +     };
> > > > +
> > > > +     chosen {
> > > > +             stdout-path =3D &uart2;
> > > > +     };
> > > > +
> > > > +     memory@40000000 {
> > > > +             device_type =3D "memory";
> > > > +             reg =3D <0x0 0x40000000 0 0x80000000>;
> > > > +     };
> > > > +
> > > > +     gpio-keys {
> > > > +             compatible =3D "gpio-keys";
> > > > +
> > > > +             key-user-pb {
> > > > +                     label =3D "user_pb";
> > > > +                     gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
> > > > +                     linux,code =3D <BTN_0>;
> > > > +             };
> > > > +
> > > > +             key-user-pb1x {
> > > > +                     label =3D "user_pb1x";
> > > > +                     linux,code =3D <BTN_1>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <0>;
> > > > +             };
> > > > +
> > > > +             key-erased {
> > > > +                     label =3D "key_erased";
> > > > +                     linux,code =3D <BTN_2>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <1>;
> > > > +             };
> > > > +
> > > > +             key-eeprom-wp {
> > > > +                     label =3D "eeprom_wp";
> > > > +                     linux,code =3D <BTN_3>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <2>;
> > > > +             };
> > > > +
> > > > +             switch-hold {
> > > > +                     label =3D "switch_hold";
> > > > +                     linux,code =3D <BTN_5>;
> > > > +                     interrupt-parent =3D <&gsc>;
> > > > +                     interrupts =3D <7>;
> > > > +             };
> > > > +     };
> > > > +
> > > > +     led-controller {
> > > > +             compatible =3D "gpio-leds";
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_gpio_leds>;
> > > > +
> > > > +             led-0 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led01_red";
> > > > +                     gpios =3D <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-1 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led01_grn";
> > > > +                     gpios =3D <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-2 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led02_red";
> > > > +                     gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-3 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led02_grn";
> > > > +                     gpios =3D <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-4 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led03_red";
> > > > +                     gpios =3D <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-5 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led03_grn";
> > > > +                     gpios =3D <&gpio5 3 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-6 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led04_red";
> > > > +                     gpios =3D <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-7 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led04_grn";
> > > > +                     gpios =3D <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-8 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led05_red";
> > > > +                     gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-9 {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led05_grn";
> > > > +                     gpios =3D <&gpio4 31 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-a {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_RED>;
> > > > +                     label =3D "led06_red";
> > > > +                     gpios =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +
> > > > +             led-b {
> > > > +                     function =3D LED_FUNCTION_STATUS;
> > > > +                     color =3D <LED_COLOR_ID_GREEN>;
> > > > +                     label =3D "led06_grn";
> > > > +                     gpios =3D <&gpio1 8 GPIO_ACTIVE_HIGH>;
> > > > +                     default-state =3D "off";
> > > > +             };
> > > > +     };
> > > > +
> > > > +     pcie0_refclk: pcie0-refclk {
> > > > +             compatible =3D "fixed-clock";
> > > > +             #clock-cells =3D <0>;
> > > > +             clock-frequency =3D <100000000>;
> > > > +     };
> > > > +
> > > > +     reg_3p3v: regulator-3p3v {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "3P3V";
> > > > +             regulator-min-microvolt =3D <3300000>;
> > > > +             regulator-max-microvolt =3D <3300000>;
> > > > +             regulator-always-on;
> > > > +     };
> > > > +};
> > > > +
> > > > +&A53_0 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_1 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_2 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&A53_3 {
> > > > +     cpu-supply =3D <&buck2>;
> > > > +};
> > > > +
> > > > +&ddrc {
> > > > +     operating-points-v2 =3D <&ddrc_opp_table>;
> > > > +
> > > > +     ddrc_opp_table: opp-table {
> > > > +             compatible =3D "operating-points-v2";
> > > > +
> > > > +             opp-25000000 {
> > > > +                     opp-hz =3D /bits/ 64 <25000000>;
> > > > +             };
> > > > +
> > > > +             opp-100000000 {
> > > > +                     opp-hz =3D /bits/ 64 <100000000>;
> > > > +             };
> > > > +
> > > > +             opp-750000000 {
> > > > +                     opp-hz =3D /bits/ 64 <750000000>;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&fec1 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_fec1>;
> > > > +     phy-mode =3D "rgmii-id";
> > > > +     phy-handle =3D <&ethphy0>;
> > > > +     local-mac-address =3D [00 00 00 00 00 00];
> > > > +     status =3D "okay";
> > > > +
> > > > +     mdio {
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             ethphy0: ethernet-phy@0 {
> > > > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +                     reg =3D <0>;
> > > > +                     ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>=
;
> > > > +                     ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2=
_00_NS>;
> > > > +                     ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2=
_00_NS>;
> > > > +                     tx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4=
_B_NIB>;
> > > > +                     rx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4=
_B_NIB>;
> > > > +
> > > > +                     leds {
> > > > +                             #address-cells =3D <1>;
> > > > +                             #size-cells =3D <0>;
> > > > +
> > > > +                             led@1 {
> > > > +                                     reg =3D <1>;
> > > > +                                     color =3D <LED_COLOR_ID_AMBER=
>;
> > > > +                                     function =3D LED_FUNCTION_LAN=
;
> > > > +                                     default-state =3D "keep";
> > > > +                             };
> > > > +
> > > > +                             led@2 {
> > > > +                                     reg =3D <2>;
> > > > +                                     color =3D <LED_COLOR_ID_GREEN=
>;
> > > > +                                     function =3D LED_FUNCTION_LAN=
;
> > > > +                                     default-state =3D "keep";
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&gpio1 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > > > +             "", "", "rs422_en#", "rs485_en#", "rs232_en#", "", ""=
, "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&gpio2 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "dig1_ctl", "",
> > > > +             "dig1_out#", "dig1_in", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&gpio5 {
> > > > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "pci_wdis#", "", "", "",
> > > > +             "", "", "", "", "", "", "", "",
> > > > +             "", "", "", "", "", "", "", "";
> > > > +};
> > > > +
> > > > +&i2c1 {
> > > > +     clock-frequency =3D <100000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c1>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> > > > +     scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     gsc: gsc@20 {
> > > > +             compatible =3D "gw,gsc";
> > > > +             reg =3D <0x20>;
> > > > +             pinctrl-0 =3D <&pinctrl_gsc>;
> > > > +             interrupt-parent =3D <&gpio4>;
> > > > +             interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells =3D <1>;
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             adc {
> > > > +                     compatible =3D "gw,gsc-adc";
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     channel@6 {
> > > > +                             gw,mode =3D <0>;
> > > > +                             reg =3D <0x06>;
> > > > +                             label =3D "temp";
> > > > +                     };
> > > > +
> > > > +                     channel@8 {
> > > > +                             gw,mode =3D <3>;
> > > > +                             reg =3D <0x08>;
> > > > +                             label =3D "vdd_bat";
> > > > +                     };
> > > > +
> > > > +                     channel@82 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x82>;
> > > > +                             label =3D "vin";
> > > > +                             gw,voltage-divider-ohms =3D <22100 10=
00>;
> > > > +                             gw,voltage-offset-microvolt =3D <7000=
00>;
> > > > +                     };
> > > > +
> > > > +                     channel@84 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x84>;
> > > > +                             label =3D "vdd_5p0";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +
> > > > +                     channel@86 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x86>;
> > > > +                             label =3D "vdd_3p3";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +
> > > > +                     channel@88 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x88>;
> > > > +                             label =3D "vdd_0p9";
> > > > +                     };
> > > > +
> > > > +                     channel@8c {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x8c>;
> > > > +                             label =3D "vdd_soc";
> > > > +                     };
> > > > +
> > > > +                     channel@8e {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x8e>;
> > > > +                             label =3D "vdd_arm";
> > > > +                     };
> > > > +
> > > > +                     channel@90 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x90>;
> > > > +                             label =3D "vdd_1p8";
> > > > +                     };
> > > > +
> > > > +                     channel@92 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0x92>;
> > > > +                             label =3D "vdd_dram";
> > > > +                     };
> > > > +
> > > > +                     channel@a2 {
> > > > +                             gw,mode =3D <2>;
> > > > +                             reg =3D <0xa2>;
> > > > +                             label =3D "vdd_gsc";
> > > > +                             gw,voltage-divider-ohms =3D <10000 10=
000>;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     gpio: gpio@23 {
> > > > +             compatible =3D "nxp,pca9555";
> > > > +             reg =3D <0x23>;
> > > > +             gpio-controller;
> > > > +             #gpio-cells =3D <2>;
> > > > +             interrupt-parent =3D <&gsc>;
> > > > +             interrupts =3D <4>;
> > > > +     };
> > > > +
> > > > +     eeprom@50 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x50>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@51 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x51>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@52 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x52>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     eeprom@53 {
> > > > +             compatible =3D "atmel,24c02";
> > > > +             reg =3D <0x53>;
> > > > +             pagesize =3D <16>;
> > > > +     };
> > > > +
> > > > +     gsc_rtc: rtc@68 {
> > > > +             compatible =3D "dallas,ds1672";
> > > > +             reg =3D <0x68>;
> > > > +     };
> > > > +};
> > > > +
> > > > +&i2c2 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c2>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> > > > +     scl-gpios =3D <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     pmic@4b {
> > > > +             compatible =3D "rohm,bd71847";
> > > > +             reg =3D <0x4b>;
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_pmic>;
> > > > +             interrupt-parent =3D <&gpio3>;
> > > > +             interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> > > > +             rohm,reset-snvs-powered;
> > > > +             #clock-cells =3D <0>;
> > > > +             clocks =3D <&osc_32k>;
> > > > +             clock-output-names =3D "clk-32k-out";
> > > > +
> > > > +             regulators {
> > > > +                     /* vdd_soc: 0.805-0.900V (typ=3D0.8V) */
> > > > +                     BUCK1 {
> > > > +                             regulator-name =3D "buck1";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                             regulator-ramp-delay =3D <1250>;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_arm: 0.805-1.0V (typ=3D0.9V) */
> > > > +                     buck2: BUCK2 {
> > > > +                             regulator-name =3D "buck2";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                             regulator-ramp-delay =3D <1250>;
> > > > +                             rohm,dvs-run-voltage =3D <1000000>;
> > > > +                             rohm,dvs-idle-voltage =3D <900000>;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_0p9: 0.805-1.0V (typ=3D0.9V) */
> > > > +                     BUCK3 {
> > > > +                             regulator-name =3D "buck3";
> > > > +                             regulator-min-microvolt =3D <700000>;
> > > > +                             regulator-max-microvolt =3D <1350000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_3p3 */
> > > > +                     BUCK4 {
> > > > +                             regulator-name =3D "buck4";
> > > > +                             regulator-min-microvolt =3D <3000000>=
;
> > > > +                             regulator-max-microvolt =3D <3300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_1p8 */
> > > > +                     BUCK5 {
> > > > +                             regulator-name =3D "buck5";
> > > > +                             regulator-min-microvolt =3D <1605000>=
;
> > > > +                             regulator-max-microvolt =3D <1995000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_dram */
> > > > +                     BUCK6 {
> > > > +                             regulator-name =3D "buck6";
> > > > +                             regulator-min-microvolt =3D <800000>;
> > > > +                             regulator-max-microvolt =3D <1400000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* nvcc_snvs_1p8 */
> > > > +                     LDO1 {
> > > > +                             regulator-name =3D "ldo1";
> > > > +                             regulator-min-microvolt =3D <1600000>=
;
> > > > +                             regulator-max-microvolt =3D <1900000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdd_snvs_0p8 */
> > > > +                     LDO2 {
> > > > +                             regulator-name =3D "ldo2";
> > > > +                             regulator-min-microvolt =3D <800000>;
> > > > +                             regulator-max-microvolt =3D <900000>;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     /* vdda_1p8 */
> > > > +                     LDO3 {
> > > > +                             regulator-name =3D "ldo3";
> > > > +                             regulator-min-microvolt =3D <1800000>=
;
> > > > +                             regulator-max-microvolt =3D <3300000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     LDO4 {
> > > > +                             regulator-name =3D "ldo4";
> > > > +                             regulator-min-microvolt =3D <900000>;
> > > > +                             regulator-max-microvolt =3D <1800000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +
> > > > +                     LDO6 {
> > > > +                             regulator-name =3D "ldo6";
> > > > +                             regulator-min-microvolt =3D <900000>;
> > > > +                             regulator-max-microvolt =3D <1800000>=
;
> > > > +                             regulator-boot-on;
> > > > +                             regulator-always-on;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&i2c3 {
> > > > +     clock-frequency =3D <400000>;
> > > > +     pinctrl-names =3D "default", "gpio";
> > > > +     pinctrl-0 =3D <&pinctrl_i2c3>;
> > > > +     pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> > > > +     scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)=
>;
> > > > +     status =3D "okay";
> > > > +
> > > > +     accelerometer@19 {
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&pinctrl_accel>;
> > > > +             compatible =3D "st,lis2de12";
> > > > +             reg =3D <0x19>;
> > > > +             st,drdy-int-pin =3D <1>;
> > > > +             interrupt-parent =3D <&gpio1>;
> > > > +             interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> > > > +     };
> > > > +};
> > > > +
> > > > +&pcie_phy {
> > > > +     fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> > > > +     fsl,clkreq-unsupported;
> > > > +     clocks =3D <&pcie0_refclk>;
> > > > +     clock-names =3D "ref";
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&pcie0 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_pcie0>;
> > > > +     reset-gpio =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> > > > +     clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> > > > +              <&clk IMX8MM_CLK_PCIE1_AUX>;
> > > > +     assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> > > > +                       <&clk IMX8MM_CLK_PCIE1_CTRL>;
> > > > +     assigned-clock-rates =3D <10000000>, <250000000>;
> > > > +     assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL2_50M>,
> > > > +                              <&clk IMX8MM_SYS_PLL2_250M>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&disp_blk_ctrl {
> > > > +     status =3D "disabled";
> > > > +};
> > > > +
> > > > +&pgc_mipi {
> > > > +     status =3D "disabled";
> > > > +};
> > > > +
> > > > +/* console */
> > > > +&uart2 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_uart2>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&usbotg1 {
> > > > +     dr_mode =3D "host";
> > > > +     disable-over-current;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +/* microSD */
> > > > +&usdhc2 {
> > > > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > > > +     pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > > +     pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio=
>;
> > > > +     pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio=
>;
> > > > +     cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> > > > +     bus-width =3D <4>;
> > > > +     vmmc-supply =3D <&reg_3p3v>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +/* eMMC */
> > > > +&usdhc3 {
> > > > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > > > +     pinctrl-0 =3D <&pinctrl_usdhc3>;
> > > > +     pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > > > +     pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > > > +     assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > > > +     assigned-clock-rates =3D <400000000>;
> > > > +     bus-width =3D <8>;
> > > > +     non-removable;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&wdog1 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_wdog>;
> > > > +     fsl,ext-reset-output;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&iomuxc {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_hog>;
> > > > +
> > > > +     pinctrl_hog: hoggrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10      0x400=
00041 /* RS422# */
> > > > +                     MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11      0x400=
00041 /* RS485# */
> > > > +                     MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12      0x400=
00041 /* RS232# */
> > > > +                     MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9        0x400=
00041 /* DIG1_IN */
> > > > +                     MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8        0x400=
00041 /* DIG1_OUT */
> > > > +                     MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6        0x400=
00041 /* DIG1_CTL */
> > > > +                     MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12     0x400=
00041 /* PCI_WDIS# */
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_accel: accelgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15      0x159
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_fec1: fec1grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_ENET_MDC_ENET1_MDC              =
   0x3
> > > > +                     MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO            =
   0x3
> > > > +                     MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0        =
   0x1f
> > > > +                     MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC        =
   0x0
> > > > +                     MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC        =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL  =
   0x91
> > > > +                     MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL  =
   0x1f
> > > > +                     MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24            =
   0x19 /* IRQ# */
> > > > +                     MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25             =
   0x19 /* RST# */
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_gsc: gscgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26       0x159
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c1: i2c1grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c1_gpio: i2c1gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c2: i2c2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c2_gpio: i2c2gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c3: i2c3grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_i2c3_gpio: i2c3gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x400=
001c3
> > > > +                     MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x400=
001c3
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_gpio_leds: gpioledgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5    0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30        0x19
> > > > +                     MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2        0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14      0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9       0x19
> > > > +                     MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3         0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29        0x19
> > > > +                     MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13      0x19
> > > > +                     MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31       0x19
> > > > +                     MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4         0x19
> > > > +                     MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8       0x19
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_pcie0: pciegrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11     0x41
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_pmic: pmicgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8      0x41
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_uart2: uart2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX     0x140
> > > > +                     MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX     0x140
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2: usdhc2grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x190
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d0
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d0
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x194
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d4
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d4
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x196
> > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d6
> > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d6
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12        0x1c4
> > > > +                     MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3: usdhc3grp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x190
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d0
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x190
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x194
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d4
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x194
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x196
> > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d6
> > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x196
> > > > +             >;
> > > > +     };
> > > > +
> > > > +     pinctrl_wdog: wdoggrp {
> > > > +             fsl,pins =3D <
> > > > +                     MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B    0xc6
> > > > +             >;
> > > > +     };
> > > > +};
> > > > --
> > > > 2.25.1
> > > >

