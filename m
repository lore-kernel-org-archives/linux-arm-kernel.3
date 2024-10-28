Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F4FD1359C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=; b=bp6gBIq6z+1AhEK0aTv+T/cxpc
	ifB1H4n+4lDycErauyGQVKJtVNDQ+YDvcoa3QnLJ6APQpcqcixoFF5ghw5FhkLxOSpzeububw9O9H
	yOWTKfQBw+4K8mSY21m+XY8+EY7pPow85LIP6DodZtp0In15TcjlXGsb5E7yDGezfQ4jN7+YU7KQ3
	HQpa3k5C2MLWtDPiOJ3qhG4SUbtP+YCzZH2XMbTRrTCoAVReHIZfwX52VbZ/seGZZ6WDInFLrOXUJ
	nSJa8EQBzVgO8RruijAoTAkN/lzsGV3CqYAwZ+1qXNMUh4yuwJO+/NGDQaikf/N2JriR0l9AeRusD
	7Sgrlrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ot3-0000000Akrd-27J6;
	Mon, 28 Oct 2024 12:30:21 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NkQ-0000000AYIi-1OP4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:17:49 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-50dc984bf5dso1080635e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114241; x=1730719041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=;
        b=nrJD7Iz7UAB41EigP8AZjbMH2/uuXtFp9i4lqv6WNTAnfUPJoy/rshrBhGUaTqzCnC
         m29ayIW67UBFVr3tsgGM9ENdoI9Kehmgx3cB+4EMybA67KRJZFwJKED6awBh799AK5hR
         NONnSPBJDGqsrX6X1H3vmoev5fy4X6wJWn7tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114241; x=1730719041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g6YjlVbvnFbuJwRrpmbG7D+MwzdvrH5uhaL6ujW6ig=;
        b=nTOTxykvocDdjb2/CXnQpjLMNVlGdbEG7hU9dIxzXdrt6ofJblrXHdq6UXPmSxxtxn
         MvpKk8+s0fnQFCPa2c7Jiubu9kDWdqBxVJYtoIJj6YRfLY3gjmM63Rtk/hTqVlV7mp6E
         fK4HXWyOAyK9f5MAGWD+O4A3fUe4Ae3oBLF5ShaO/3foT68YqfVCmCrSHAH0m0oMYvKe
         GCqubDQTYk3Wo43H9B/74h1VUetLTMwFK5jh1vJbCLwXQRxHeWDNcxSy2Glo8kotUpXX
         LQrG4KPvUGZAV9CViWbzZbTS2v8sA81YAuFZw3/odZCxoa0f7Os8ccPgg0LHwD09RDvv
         jx/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLrPjnpiLBposUt9yquvHl+Tz6o+I7vYTo0SJcGYU3n+hiOxZ7S/hgaz2IYoUSwrv+ao5YTuV3uoMHmY99qGpr@lists.infradead.org
X-Gm-Message-State: AOJu0YwSJW14356zGsQvpTTmPlpbixlFujcasjHW7yAVcLKTBRpQEKHn
	WFj+f3HlnxfejN/xPGrAIfceASTyDsgNFGS7HaNksmWlx1WSZ9labWskGZOQ6lMc37IrQLC1xpU
	=
X-Google-Smtp-Source: AGHT+IEovrqjeMBBipvVtfq41toKPS4e3sCBgn7owiZrvYPLysl3QsNzZiW721FNcyAgTktPRmft1Q==
X-Received: by 2002:a05:6122:2509:b0:50d:2317:5b61 with SMTP id 71dfb90a1353d-51015030000mr4063196e0c.6.1730114240692;
        Mon, 28 Oct 2024 04:17:20 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-510047a3436sm819044e0c.50.2024.10.28.04.17.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:17:19 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a470d330a5so1498954137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkPwrZuaJ8yjzdfM6JXqydsrPiva+2z/Bj0w9kZ1Bm3X8ZuT8Z8N+z0pZQNBbIUnPsZwjLAGrf5MPOgzCwmxRu@lists.infradead.org
X-Received: by 2002:a05:6102:3049:b0:4a3:d2e5:f097 with SMTP id
 ada2fe7eead31-4a8cfd6d0d4mr4759861137.24.1730114238879; Mon, 28 Oct 2024
 04:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025110111.1321704-1-fshao@chromium.org> <20241025110111.1321704-3-fshao@chromium.org>
 <iupuwxxslb3t76mzy3ufsruwwpd47fuop7y6tfcbwkosdagkxf@fnklbp6t6au2>
In-Reply-To: <iupuwxxslb3t76mzy3ufsruwwpd47fuop7y6tfcbwkosdagkxf@fnklbp6t6au2>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:16:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1nic3HgEGeS6up_MsYh3UoM_piHC6=uuRep5bne4zOWbxQ@mail.gmail.com>
Message-ID: <CAC=S1nic3HgEGeS6up_MsYh3UoM_piHC6=uuRep5bne4zOWbxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041722_396540_C9C24004 
X-CRM114-Status: GOOD (  26.64  )
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

On Mon, Oct 28, 2024 at 5:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:59:36PM +0800, Fei Shao wrote:
> > Introduce MT8188-based Chromebook Ciri, also known commercially as
> > Lenovo Chromebook Duet (11", 9).
> >
> > Ciri is a detachable device based on the Geralt design, where Geralt is
> > the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> > different combinations of second-source components, including:
> > - audio codecs (RT5682S and ES8326)
> > - speaker amps (TAS2563 and MAX98390)
> > - MIPI-DSI panels (BOE NV110WUM-L60 and IVO t109nw41)
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/Makefile         |    8 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   63 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   54 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   20 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   76 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   67 +
> >  .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   52 +
> >  .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  413 +++++
> >  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1497 +++++++++++++++++
> >  11 files changed, 2304 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
0.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
1.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
2.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
3.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
4.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
5.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
6.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku=
7.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dts=
i
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
> > index 8fd7b2bb7a15..c6c34d99316b 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -69,6 +69,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-volt=
orb-sku589824.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-voltorb-sku589825.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku0.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku1.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku2.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku3.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku4.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku5.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku6.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8188-geralt-ciri-sku7.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r1.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-hayato-r5-sku2.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8192-asurada-spherion-r0.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts b=
/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> > new file mode 100644
> > index 000000000000..7a2edbaa74f1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8188-geralt-ciri.dtsi"
> > +
> > +/ {
> > +     model =3D "Google Ciri sku0 board";
> > +     compatible =3D "google,ciri-sku0", "google,ciri", "mediatek,mt818=
8";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts b=
/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> > new file mode 100644
> > index 000000000000..53fdd5acaa3f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright 2023 Google LLC
> > + */
> > +/dts-v1/;
> > +#include "mt8188-geralt-ciri.dtsi"
> > +
> > +/ {
> > +     model =3D "Google Ciri sku1 board";
> > +     compatible =3D "google,ciri-sku1", "google,ciri", "mediatek,mt818=
8";
> > +};
> > +
> > +&dsi_panel {
> > +     compatible =3D "ivo,t109nw41", "himax,hx83102";
> > +};
> > +
> > +&touchscreen {
> > +     himax,pid =3D <0x1003>;
>
> Why do you add more of undocumented properties?

I think I'll drop the Himax related thing until Himax finishes
upstreaming their drivers, so there's a standardized binding to
follow.

>
> > +     firmware-name =3D "himax_i2chid_1003.bin";
> > +};
> > +
> > +&i2c0 {
> > +     /delete-node/ audio-codec@1a;
> > +
> > +     es8326: audio-codec@19 {
> > +             compatible =3D "everest,es8326";
> > +             reg =3D <0x19>;
> > +             interrupts-extended =3D <&pio 108 IRQ_TYPE_LEVEL_LOW>;
> > +             #sound-dai-cells =3D <0>;
> > +             everest,jack-pol =3D [0e];
> > +             everest,interrupt-clk =3D [00];
> > +     };
> > +};
> > +
> > +&sound {
> > +     compatible =3D "mediatek,mt8188-es8326";
> > +     model =3D "mt8188_m98390_8326";
> > +
> > +     audio-routing =3D
> > +             "ETDM1_OUT", "ETDM_SPK_PIN",
> > +             "ETDM2_OUT", "ETDM_HP_PIN",
> > +             "ETDM1_IN", "ETDM_SPK_PIN",
> > +             "ETDM2_IN", "ETDM_HP_PIN",
> > +             "ADDA Capture", "MTKAIF_PIN",
> > +             "Headphone Jack", "HPOL",
> > +             "Headphone Jack", "HPOR",
> > +             "MIC1", "Headset Mic",
> > +             "Left Spk", "Front Left BE_OUT",
> > +             "Right Spk", "Front Right BE_OUT";
> > +     status =3D "okay";
> > +
> > +     hs-capture-dai-link {
>
> Nope, that's not how DAI links are called.

Acknowledged, but I'm still figuring out what you want to suggest here
- does the `^dai-link@[0-9]+$` pattern sound okay?

>
> > +             codec {
> > +                     sound-dai =3D <&es8326>;
> > +             };
> > +     };
>
> ...
>
> > +&i2c2 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&i2c_tunnel {
> > +     /delete-node/ sbs-battery@b;
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
> > +     maxim,dsm_param_name =3D "dsm_param.bin";
>
> NAK. Not a DT property. You cannot send us ACPI stuff.
>
> Go through internal review first, which should tell you that ACPI is not
> accepted into DT. There are just few exceptions and codecs do not
> qualify.

I'll drop all these invalid lines. It was likely a misunderstanding
when the lines were added. Thanks for clarifying.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

