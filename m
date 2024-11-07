Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C7D5AE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V02Q+hBZd7IKoOvbggj5lIvd5lTBVFB0kCkzN1VjvB0=; b=k9XxvZWYuuzRn81zc0KoP1WUFW
	WjMZfBwr0tXNyxUTLcWvAf6hjnIZjJmSGKPL5b8iI6j7OlkCewlsQnicBfQfQp7P+R0na91g9jd4I
	px22lF90JfnabWV1hP7VBDLMzfZ1ysVTRicd1cBg6UFHsoTXAWnbcQ1huucqmDbUa1JTTyos3euhp
	JGMso5e0JkY+TsslD4DTX073TCsklAPNyj6g3zjhbjjGAdrlWd35P053//msVt13ihay8k2UdH04K
	Yglzdoyik0APyVqMCSZlcNrv0y4JM+LQ2e71lGrv7WynJPD3NldvXb/ofJr5I1JpJTXy5KEZRxjcB
	9cUADSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wVh-00000005v4s-3QaH;
	Thu, 07 Nov 2024 07:00:53 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wTx-00000005uso-2Nlq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 06:59:07 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-84fc0209e87so241488241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 22:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730962744; x=1731567544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V02Q+hBZd7IKoOvbggj5lIvd5lTBVFB0kCkzN1VjvB0=;
        b=B7Bl08sMKpZmG/bZ3MxBqd1tp1uDnxMfHTL/xHMhTwBGefu8gjoyQ24IRFg4V1angQ
         6y4MFs8jci/O9c34MZAaGck4krZ/5Cy1nY6OxDyw/eHzOUyQz/ocdOAWgl8oq6Eankdp
         tC0n+mp+/U+W8z5cuQtXBrjrqHKBuQ2uk+U8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730962744; x=1731567544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V02Q+hBZd7IKoOvbggj5lIvd5lTBVFB0kCkzN1VjvB0=;
        b=xN5C+9XaJ/Nm9K9G2mfCq/lyuKuOM1GxcTN4Yke1tkPFjd8xMQ+yn//XIAnzVym8w2
         t1+j0+Bt9OVvDlrJq3StZKK78oX3YslfF94iVWiARbB3Ct9UBZtgFpqBKuRfaHFwZE27
         D4/NL8E5FhS3aKRxGZdNqizwSw5H1OxYz+u3i8NQzK3clF3aY/cNh2hLWkh33QlpeU+T
         /V6dFCf7+QNzbZrInMdf6e2WYkDn9JWA0jEnzRl9uQZ+mjjEze/Ai+VbH9gZvzqyVNjp
         8a7EWCS+CplXi4/Cduiew9e08OkP2iUklpQS7e76BfphR+zaqNRgnv4uPn9VDj2t/1GJ
         Vpug==
X-Forwarded-Encrypted: i=1; AJvYcCVyp6EieiF1dCCf4X13U8LaG/J5MCM61+x1LAiMOrAUGbDnDkX6FMTSDjMzfunskHatcmczY5QOzWrKLvAICgTJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFoj0AjgpoCOdDcGXOif/9Yl7m9QaqA+ztfq/Fv+j5as2LQvI
	+cgW26zXO3rehZeuHbA2yGSFn4CDN9G4SEccgzuX/JKjRg5IXdBZvChKjIqmxrv/n7sQhoLWpo4
	=
X-Google-Smtp-Source: AGHT+IH4lwWXsvcFT4yFcVPhP7+0LD+fRHJDttAZ8wuy0t7UkFf4NTc9gYK3zMLXsqpBXik48Yhewg==
X-Received: by 2002:a05:6102:dd0:b0:4a4:7161:5e4 with SMTP id ada2fe7eead31-4aad9aaba85mr73290137.0.1730962743490;
        Wed, 06 Nov 2024 22:59:03 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85655563488sm152584241.10.2024.11.06.22.59.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 22:59:02 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84fc0209e87so241475241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 22:59:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXyrJ0ivU2tQPF+bpErlJ/AykjTYEzAbim/n0w690v1A+3AhpgJ/Q7fWO1ms53uWAHm6zqYemWSi2aCRd2w1+U@lists.infradead.org
X-Received: by 2002:a05:6102:c0d:b0:4a4:9363:b84c with SMTP id
 ada2fe7eead31-4aada0603aemr55330137.6.1730962741133; Wed, 06 Nov 2024
 22:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20241105093222.4055774-1-fshao@chromium.org> <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com>
In-Reply-To: <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 7 Nov 2024 14:58:25 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
Message-ID: <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_225905_674087_1812ABB1 
X-CRM114-Status: GOOD (  43.58  )
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

On Wed, Nov 6, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/11/24 10:30, Fei Shao ha scritto:
> > Introduce MT8188-based Chromebook Ciri, also known commercially as
> > Lenovo Chromebook Duet (11", 9).
> >
> > Ciri is a detachable device based on the Geralt design, where Geralt is
> > the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> > different combinations of second-source components, including:
> > - audio codecs (RT5682S and ES8326)
> > - speaker amps (TAS2563 and MAX98390)
> > - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> > Changes in v2:
> > - remove invalid or undocumented properties
> >      e.g. mediatek,dai-link, maxim,dsm_param_name etc.
> > - remove touchscreen as the driver is not yet accepted in upstream
> > - update sound DAI link node name to match the binding
> > - add missing pinctrls in audio codec nodes
> >
> >   arch/arm64/boot/dts/mediatek/Makefile         |    8 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   60 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   56 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   15 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   73 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   69 +
> >   .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   47 +
> >   .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  397 +++++
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1492 ++++++++++++++++=
+
> >   11 files changed, 2271 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u0.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u1.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u2.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u3.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u4.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u5.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u6.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sk=
u7.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dt=
si
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >
[...]

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
> > new file mode 100644
> > index 000000000000..62c8a37a4c3d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
> > @@ -0,0 +1,397 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8188-geralt.dtsi"
> > +
> > +/delete-node/ &pp3300_edp_disp;
> > +
> > +&aud_etdm_hp_on {
> > +     pins-mclk {
> > +             pinmux =3D <PINMUX_GPIO114__FUNC_O_I2SO2_MCK>;
> > +     };
> > +};
> > +
> > +&aud_etdm_hp_off {
> > +     pins-mclk {
> > +             pinmux =3D <PINMUX_GPIO114__FUNC_B_GPIO114>;
> > +             bias-pull-down;
> > +             input-enable;
> > +     };
> > +};
> > +
> > +&aud_etdm_spk_on {
> > +     pins-bus {
> > +             drive-strength =3D <8>;
> > +     };
> > +};
> > +
> > +/* Ciri's TDP design target is 90 degrees */
>
> ...and there's only Ciri in this submission, so move that to -geralt.dtsi

In response to the "there's only Ciri, so move to / don't declare
unused stuff in -geralt.dtsi" and similar comments - I'll adjust each
of the mentioned lines.

My intention was to clearly describe the differences between Ciri and
the proto hardware, but I understand and also agree with your point
that these deltas should be introduced only when a real product
utilizes them.
I will follow this approach in the next revision.

>
> > +&cpu_little0_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&cpu_little1_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&cpu_little2_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&cpu_little3_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&cpu_big0_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&cpu_big1_alert0 {
> > +     temperature =3D <90000>;
> > +     hysteresis =3D <2000>;
> > +     type =3D "passive";
> > +};
> > +
> > +&dp_intf0 {
> > +     /delete-node/ port;
>
> Just don't add dp_intf0 if there's none, instead of removing the port her=
e.
>
> > +};
> > +
> > +&dsi_panel {
> > +     compatible =3D "boe,nv110wum-l60", "himax,hx83102";
>
> Move this to each SKU dts file.

Will do.

>
> > +};
> > +
> > +&edp_tx {
> > +     /delete-node/ ports;
> > +     /delete-node/ aux-bus;
> > +};
> > +
> > +&i2c0 {
> > +     /delete-node/ audio-codec@1a;
> > +     /delete-node/ amplifier@3a;
> > +     /delete-node/ amplifier@3b;
>
> No board ever uses those three nodes, because it's all Ciri and nothing e=
lse.
> Just never declare these in -geralt.dtsi and never delete them here.
>
> > +
> > +     rt5682s: audio-codec@1a {
> > +             compatible =3D "realtek,rt5682s";
> > +             reg =3D <0x1a>;
> > +             interrupts-extended =3D <&pio 108 IRQ_TYPE_EDGE_BOTH>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&audio_codec_pins>;
> > +             #sound-dai-cells =3D <1>;
> > +
> > +             AVDD-supply =3D <&mt6359_vio18_ldo_reg>;
> > +             DBVDD-supply =3D <&mt6359_vio18_ldo_reg>;
> > +             LDO1-IN-supply =3D <&mt6359_vio18_ldo_reg>;
> > +             MICVDD-supply =3D <&pp3300_s3>;
> > +             realtek,jd-src =3D <1>;
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     status =3D "disabled";
>
> ...and if there's no i2c2, just don't add it to -geralt.dtsi in the first=
 place...
> but I believe that you just wanted to avoid probing the device that you d=
eclared
> in -geralt.dtsi on this bus, so you can either remove the nodes for all o=
f the
> unused i2c busses in your board designs, or you can keep them but remove =
all of
> the devices that aren't actually there.
>
> It's your choice in the end, but disabling this here doesn't make much se=
nse imo.

I think I'll follow the latter to describe the pinctrl and clock
frequency of the i2c buses, so future board DT (if any) can just focus
on declaring the devices on the bus.

>
> > +};
> > +
> > +&i2c_tunnel {
> > +     /delete-node/ sbs-battery@b;
>
> Since nothing ever uses sbs-battery@b, just remove sbs-battery@b entirely
> from -geralt.dtsi instead of deleting it here.
>
> Non-Ciri boards, if any, will define the @b one if necessary in their own
> dts/dtsi file(s).
>
> > +
> > +     battery: sbs-battery@f {
> > +             compatible =3D "sbs,sbs-battery";
> > +             reg =3D <0xf>;
> > +             sbs,i2c-retry-count =3D <2>;
> > +             sbs,poll-retry-count =3D <1>;
> > +     };
> > +};
> > +
> > +&max98390_38 {
> > +     sound-name-prefix =3D "Front Right";
>
> Move to -geralt.dtsi
>
> > +};
> > +
> > +&max98390_39 {
> > +     sound-name-prefix =3D "Front Left";
>
> ditto
>
> > +};
> > +
> > +&mipi_tx_config0 {
> > +     drive-strength-microamp =3D <5200>;
> > +};
> > +
> > +&mmc1 {
> > +     status =3D "disabled";
>
> Why are you configuring mmc1 in -geralt.dtsi if no board uses it at all?

This is for the SD cards, though Ciri didn't adopt that in the end...
I'll remove it.

>
> > +};
> > +
> > +&mt6359_vm18_ldo_reg {
> > +     regulator-min-microvolt =3D <1800000>;
> > +     regulator-max-microvolt =3D <1900000>;
> > +     regulator-microvolt-offset =3D <100000>;
> > +};
> > +
> > +&sound {
> > +     compatible =3D "mediatek,mt8188-rt5682s";
> > +     model =3D "mt8188_m98390_5682";
> > +
> > +     audio-routing =3D
> > +             "ETDM1_OUT", "ETDM_SPK_PIN",
> > +             "ETDM2_OUT", "ETDM_HP_PIN",
> > +             "ETDM1_IN", "ETDM_SPK_PIN",
> > +             "ETDM2_IN", "ETDM_HP_PIN",
> > +             "ADDA Capture", "MTKAIF_PIN",
> > +             "Headphone Jack", "HPOL",
> > +             "Headphone Jack", "HPOR",
> > +             "IN1P", "Headset Mic",
> > +             "Left Spk", "Front Left BE_OUT",
> > +             "Right Spk", "Front Right BE_OUT";
>
> Please move compatible, model and audio-routing to SKU0 (and also copy th=
at to
> SKU3): as you're continuously overriding it in all other SKUs, having it =
here
> can only confuse people...

I agree. I'll update it.

>
> > +     status =3D "okay";
> > +
> > +     dai-link-0 {
> > +             dai-format =3D "i2s";
>
> ...and move dai-format to -geralt.dtsi.
>
> > +     };
> > +
> > +     dai-link-1 {
> > +             dai-format =3D "i2s";
> > +             codec {
> > +                     sound-dai =3D <&max98390_38>,
> > +                                 <&max98390_39>;
> > +             };
> > +     };
> > +
> > +     dai-link-2 {
> > +             codec {
> > +                     sound-dai =3D <&rt5682s 0>;
> > +             };
> > +     };
> > +
> > +     dai-link-3 {
> > +             codec {
> > +                     sound-dai =3D <&rt5682s 0>;
> > +             };
> > +     };
> > +};
> > +
> > +&spi1 {
> > +     pinctrl-names =3D "default", "sleep";
> > +     pinctrl-0 =3D <&spi1_pins_default>;
> > +     pinctrl-1 =3D <&spi1_pins_sleep>;
>
> Also move this to -geralt.dtsi, it's even the same pins...!
> P.S.: Of course, move the spi1_pins_sleep to -geralt.dtsi as well.
>
> > +     num-cs =3D <1>;
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
>
> ...address and size cells, but no children nodes?

Oh because the Himax touchscreen was removed in v2... I'll drop them.

>
> > +};
> > +
> > +&pio {
>
> ..snip..
>
> > +
> > +     touchscreen_rst: touchscreen-rst-pins {
> > +             pins-tchscr-rst {
> > +                     pinmux =3D <PINMUX_GPIO5__FUNC_B_GPIO5>;
> > +                     output-high;
> > +             };
> > +     };
>
> touchscreen_rst is unused - either use it or remove it.

Will do.

>
> > +
> > +     spi1_pins_default: spi1-default-pins {
> > +             pins-bus {
> > +                     pinmux =3D <PINMUX_GPIO75__FUNC_O_SPIM1_CSB>,
> > +                              <PINMUX_GPIO76__FUNC_O_SPIM1_CLK>,
> > +                              <PINMUX_GPIO77__FUNC_B0_SPIM1_MOSI>,
> > +                              <PINMUX_GPIO78__FUNC_B0_SPIM1_MISO>;
> > +                     bias-disable;
> > +                     drive-strength =3D <10>;
> > +             };
> > +     };
> > +
> > +     spi1_pins_sleep: spi1-sleep-pins {
> > +             pins-bus {
> > +                     pinmux =3D <PINMUX_GPIO75__FUNC_B_GPIO75>,
> > +                              <PINMUX_GPIO76__FUNC_B_GPIO76>,
> > +                              <PINMUX_GPIO77__FUNC_B_GPIO77>,
> > +                              <PINMUX_GPIO78__FUNC_B_GPIO78>;
> > +                     bias-pull-down;
> > +                     input-enable;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > new file mode 100644
> > index 000000000000..0d33ae82f0eb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -0,0 +1,1492 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "mt8188.dtsi"
> > +#include "mt6359.dtsi"
> > +
> > +/ {
> > +     aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &i2c5;
> > +             i2c6 =3D &i2c6;
> > +             mmc0 =3D &mmc0;
> > +             mmc1 =3D &mmc1;
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     backlight_lcd0: backlight-lcd0 {
> > +             compatible =3D "pwm-backlight";
> > +             brightness-levels =3D <0 1023>;
> > +             default-brightness-level =3D <576>;
> > +             enable-gpios =3D <&pio 1 GPIO_ACTIVE_HIGH>;
> > +             num-interpolated-steps =3D <1023>;
> > +             power-supply =3D <&ppvar_sys>;
> > +             pwms =3D <&disp_pwm0 0 500000>;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     dmic-codec {
> > +             compatible =3D "dmic-codec";
> > +             num-channels =3D <2>;
> > +             wakeup-delay-ms =3D <100>;
> > +     };
> > +
> > +     memory@40000000 {
> > +             device_type =3D "memory";
>
>                 /* The size will be filled in by the bootloader */
>                 reg =3D <0 0x40000000 0 0>;

Acknowledged.

>
>
> > +             reg =3D <0 0x40000000 0 0x80000000>;
> > +     };
> > +
>
> ..snip..
>
> > +
> > +&disp_dsi0 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     dsi_panel: panel@0 {
> > +             compatible =3D "boe,tv110c9m-ll3";
>
> Remove the compatible string, then add a comment (93 cols, it's ok in one=
 line):
>
> /* Compatible string for different panels can be found in each device dts=
 */

Acknowledged.

>
> > +             reg =3D <0>;
> > +             enable-gpios =3D <&pio 25 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&mipi_dsi_pins>;
> > +
> > +             backlight =3D <&backlight_lcd0>;
> > +             avdd-supply =3D <&ppvar_mipi_disp_avdd>;
> > +             avee-supply =3D <&ppvar_mipi_disp_avee>;
> > +             pp1800-supply =3D <&mt6359_vm18_ldo_reg>;
> > +             rotation =3D <270>;
> > +
> > +             status =3D "okay";
> > +
> > +             port {
> > +                     dsi_panel_in: endpoint {
> > +                             remote-endpoint =3D <&dsi_out>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     port {
> > +             dsi_out: endpoint {
> > +                     remote-endpoint =3D <&dsi_panel_in>;
> > +             };
> > +     };
> > +};
> > +
> > +&disp_pwm0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&disp_pwm0_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&disp_pwm1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&disp_pwm1_pins>;
> > +};
> > +
> > +&dp_intf0 {
> > +     port {
> > +             dp_intf0_out: endpoint {
> > +                     remote-endpoint =3D <&edp_in>;
> > +             };
> > +     };
> > +};
> > +
> > +&dp_intf1 {
> > +     status =3D "okay";
> > +
> > +     port {
> > +             dp_intf1_out: endpoint {
> > +                     remote-endpoint =3D <&dptx_in>;
> > +             };
> > +     };
> > +};
> > +
> > +&dp_tx {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&dp_tx_hpd>;
> > +     #sound-dai-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     ports {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             port@0 {
> > +                     reg =3D <0>;
> > +                     dptx_in: endpoint {
> > +                             remote-endpoint =3D <&dp_intf1_out>;
> > +                     };
> > +             };
> > +
> > +             port@1 {
> > +                     reg =3D <1>;
> > +                     dptx_out: endpoint {
> > +                             data-lanes =3D <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&edp_tx {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&edp_tx_hpd>;
> > +
> > +     ports {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             port@0 {
> > +                     reg =3D <0>;
> > +                     edp_in: endpoint {
> > +                             remote-endpoint =3D <&dp_intf0_out>;
> > +                     };
> > +             };
> > +
> > +             port@1 {
> > +                     reg =3D <1>;
> > +                     edp_out: endpoint {
> > +                             data-lanes =3D <0 1 2 3>;
> > +                             remote-endpoint =3D <&edp_panel_in>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     /*
> > +      * Geralt also supports eDP OLED panels, which control panel
> > +      * brightness via the AUX channel and don't require PWM pin
> > +      * control.
> > +      * This is an auxiliary panel path for hardware layout
> > +      * validation and demonstration, so it's disabled by default.
> > +      * Boards adopting MIPI-DSI panels may not have this path.
> > +      **/
>
> There's no board using this: please remove edp_tx entirely, as this is
> only adding lines to this device tree for no useful reason.
>
> If a board with that appears, you can reintroduce this here, or if it is
> a single board, you can add that in the board dts.

Acknowledged.

>
> > +     aux-bus {
> > +             edp_panel: panel {
> > +                     compatible =3D "lg,lp120up1";
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&edp_bl_en>;
> > +                     power-supply =3D <&pp3300_edp_disp>;
> > +                     status =3D "disabled";
> > +
> > +                     port {
> > +                             edp_panel_in: endpoint {
> > +                                     remote-endpoint =3D <&edp_out>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
>
> ..snip..
> > +     edp_bl_en: edp-bl-en-pins {
> > +             pins-ap-disp-bklten {
> > +                     pinmux =3D <PINMUX_GPIO1__FUNC_B_GPIO1>;
> > +                     output-low;
> > +             };
> > +     };
> > +
> > +     edp_disp_en: edp-disp-en-pins {
> > +             pins-en-pp3300-edp-disp {
> > +                     pinmux =3D <PINMUX_GPIO27__FUNC_B_GPIO27>;
> > +                     output-low;
> > +             };
> > +     };
> > +
> > +     edp_tx_hpd: edp-tx-hpd-pins {
> > +             pins-dp-tx-hpd {
> > +                     pinmux =3D <PINMUX_GPIO17__FUNC_I0_EDP_TX_HPD>;
> > +             };
> > +     };
>
> After removing the always disabled edp nodes, you can also remove these p=
ins
> as they are then unused.

Will do.

>
> > +
> > +     gsc_int: gsc-int-pins {
> > +             pins-gsc-ap-int-odl {
> > +                     pinmux =3D <PINMUX_GPIO0__FUNC_B_GPIO0>;
> > +                     input-enable;
> > +             };
> > +     };
> > +
>
> ..snip..
>
> > +&pmic {
> > +     interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> > +};
> > +
> > +&scp {
>
> Is this SCP-dual or SCP?
> I see SCP, but I also see a SCP-Dual memory region... what's going on her=
e?
>
> Of course, the SCP-Dual won't work if you don't override the compatible s=
tring...

To clarify, the second SCP core is used for MIPI camera in downstream,
and I deliberately only describe the first SCP core here since the MTK
camera ISP driver isn't in upstream at the moment.
I had a fixup patch for removing the scp-dual reserved memory region,
but likely it was missing during the rebase... let me check again if
it can be removed, just in case there's firmware protecting the region
and the kernel shouldn't access it.

>
> > +     firmware-name =3D "mediatek/mt8188/scp.img";
> > +     memory-region =3D <&scp_mem>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&scp_pins>;
> > +     status =3D "okay";
> > +
> > +     cros-ec-rpmsg {
> > +             compatible =3D "google,cros-ec-rpmsg";
> > +             mediatek,rpmsg-name =3D "cros-ec-rpmsg";
> > +     };
> > +};
> > +
> > +&sound {
> > +     compatible =3D "mediatek,mt8188-nau8825";
> > +     model =3D "mt8188_m98390_8825";
> > +     pinctrl-names =3D "aud_etdm_hp_on",
> > +                     "aud_etdm_hp_off",
> > +                     "aud_etdm_spk_on",
> > +                     "aud_etdm_spk_off",
> > +                     "aud_mtkaif_on",
> > +                     "aud_mtkaif_off";
>
>         pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
>                         "aud_etdm_spk_on", "aud_etdm_spk_off",
>                         "aud_mtkaif_on", "aud_mtkaif_off";

Acked.

>
> > +     pinctrl-0 =3D <&aud_etdm_hp_on>;
> > +     pinctrl-1 =3D <&aud_etdm_hp_off>;
> > +     pinctrl-2 =3D <&aud_etdm_spk_on>;
> > +     pinctrl-3 =3D <&aud_etdm_spk_off>;
> > +     pinctrl-4 =3D <&aud_mtkaif_on>;
> > +     pinctrl-5 =3D <&aud_mtkaif_off>;
>
> Add a comment:
>
>         /* The audio-routing is defined in each board dts */
>
> > +     audio-routing =3D "ETDM1_OUT", "ETDM_SPK_PIN",
> > +                     "ETDM2_OUT", "ETDM_HP_PIN",
> > +                     "ETDM1_IN", "ETDM_SPK_PIN",
> > +                     "ETDM2_IN", "ETDM_HP_PIN",
> > +                     "ADDA Capture", "MTKAIF_PIN",
> > +                     "Headphone Jack", "HPOL",
> > +                     "Headphone Jack", "HPOR",
> > +                     "MIC", "Headset Mic",
> > +                     "Left Spk", "Front Left BE_OUT",
> > +                     "Right Spk", "Front Right BE_OUT",
> > +                     "Rear Left Spk", "Rear Left BE_OUT",
> > +                     "Rear Right Spk", "Rear Right BE_OUT";
> > +
>
> ...and remove the audio-routing from this dtsi; it's anyway being
> overridden by the -ciri.dtsi devicetree...

Acknowledged, and thanks for all the feedback here.

Regards,
Fei

>
> > +     mediatek,adsp =3D <&adsp>;
> > +
> > +     status =3D "okay";
> > +
> > +     dai-link-0 {
> > +             link-name =3D "ETDM1_IN_BE";
> > +             dai-format =3D "dsp_b";
> > +             mediatek,clk-provider =3D "cpu";
> > +     };
> > +
> > +     dai-link-1 {
> > +             link-name =3D "ETDM1_OUT_BE";
> > +             dai-format =3D "dsp_b";
> > +             mediatek,clk-provider =3D "cpu";
> > +
> > +             codec {
> > +                     sound-dai =3D <&max98390_38>,
> > +                                 <&max98390_39>,
> > +                                 <&max98390_3a>,
> > +                                 <&max98390_3b>;
> > +             };
> > +     };
> > +
> > +     dai-link-2 {
> > +             link-name =3D "ETDM2_IN_BE";
> > +             mediatek,clk-provider =3D "cpu";
> > +
> > +             codec {
> > +                     sound-dai =3D <&nau8825>;
> > +             };
> > +     };
> > +
> > +     dai-link-3 {
> > +             link-name =3D "ETDM2_OUT_BE";
> > +             mediatek,clk-provider =3D "cpu";
> > +
> > +             codec {
> > +                     sound-dai =3D <&nau8825>;
> > +             };
> > +     };
> > +
> > +     dai-link-4 {
> > +             link-name =3D "DPTX_BE";
> > +
> > +             codec {
> > +                     sound-dai =3D <&dp_tx>;
> > +             };
> > +     };
> > +};
> > +
>
> Cheers,
> Angelo
>

