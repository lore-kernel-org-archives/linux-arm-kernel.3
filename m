Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A2CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=; b=f/D5eGgQpYmTxONiVbJhFXTBLx
	V9GaRbrNw7D9iFqu3Zws4+lEf8Kb5kVX53F/OBl47Da7D6jUzDdUAQbsNKSEGkgp45AHtf0x74NHt
	5pJJMTSJkHxqiyxcHWDDClkHe6coi4wRNAjx5oF+PTzueUTqA5tNjTCumBkqep0mceZDJZSb71k7w
	KFOw0meGXctKqidgAZDKd2jImkJkthK2KnQwhz6VtRxS6olVesHqnsHv1Ju5rdFW2vZ7vziOz81ap
	8GBiTntP86pOIC/8NZ0afM6VKnbCIeqokAuaNK14q1JX86Jq6mQmloIGxyqkV0+5E+YPU4SqF5i/N
	dBKFBxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5WI-00000008Mos-1iUS;
	Thu, 21 May 2026 15:41:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5WG-00000008Mnt-06Vj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779378065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
	b=Cx17tWVbS0pidDc0uIq4rtqWdebMABWFerEC6/bFZgIOs8hwcvl8KNhyc53svoAeSjNMJn
	TZCEdeHMTbBaM79ls3a8C/L+C4n5SG9ym2+1bRsVw99scWkUZmdPk0828GU4IEHnX7m/xH
	22avQbjQsjUpKkHsRcil8YaWZGQr/V8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-NV0nS19aOZeQm7V790MfVA-1; Thu, 21 May 2026 11:41:04 -0400
X-MC-Unique: NV0nS19aOZeQm7V790MfVA-1
X-Mimecast-MFC-AGG-ID: NV0nS19aOZeQm7V790MfVA_1779378063
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-393d76873e0so3438161fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378062; x=1779982862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9i9hQRHyOOJEcvkLiHsg6jJhDsG0UxEApBJfSN25LMk=;
        b=Nvxpl8cZ99LZE5OKsdgMij1i3gmfeW70se9v46w2NBzCfjaeK64NXlkBS+b9sLx8vX
         YlLtSYv9LVMLIRUrJRBvueKOXXXyM9wfNl00XfT74hClFWondBRB+wXJPLlTWxT/1WsT
         OvZ2FLFPxR3XQadQb2YtKeFAfMu5NADNI+DvUFu66Q05Cx4F6tyUxGSw94eVfKHSkcBT
         ocuSSCIqjZ0QQ5ivXMQqHa+s+psFUYKx7ch3e6jFT2JaLep/3m+bm8S+XzWrzySEwjOp
         7+z+d9N66n/KOPm0GN7IDb2BYw92Czsd95JzTPv5m/vM5ejrcvsFwP/GgnQQB300GS6l
         NChQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9YXmqtjZsQcGJYwP/eCXYsF5yOpKbEON+HJaK1NknFVLW6XxvHyztI0ao+B7fxPyFtno6gNUN+NahjCcKXJR/@lists.infradead.org
X-Gm-Message-State: AOJu0YxGsQLbKpbMCv+I+q2IxfYTF+QdRodahDn5KDRD6lLFmtJ3h7kG
	WnSKSIyVGvURDkEhFSHGzfqRBqD5dTOv4XD4PGfZmplKITfd9sv1x+VwqP40g1eAyHNgOEBt8lo
	LsyEF9tkskwO5+XrXxBe6OoGQQgsCNpJfVvUX89tGhjQCAEj2jjmYZYXOK4GvWxmxgmGOX/O1Y2
	En1EdHOmUmZAROUGIPJSdk/5Aqkixr64r6/m2SSmXSThOd3+ztlkE=
X-Gm-Gg: Acq92OEdVRPkhvqxL5+hoj8ir9qY3aK22jFoJotC2xncFX7yDbWnygJLjCiA/1u19ON
	3zo0Raspky41Tyq9pX1SXvvv2foXNzsaQUVeVvnAs2o23zuYejDSHMhDcUOC0fyK5n2G+v09fhr
	93k0Avv1eUbKCXAf8Srp1UfYAIHx5VX/q4u4zuSzjlXvcHb/zPeyXbEN99VB7ggaxot8Os3c/bx
	ehzwKxgj86bmm/C
X-Received: by 2002:a05:651c:1446:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-395ca54c9bfmr4697181fa.7.1779378062380;
        Thu, 21 May 2026 08:41:02 -0700 (PDT)
X-Received: by 2002:a05:651c:1446:b0:393:9d8c:73d2 with SMTP id
 38308e7fff4ca-395ca54c9bfmr4696981fa.7.1779378061760; Thu, 21 May 2026
 08:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com> <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 21 May 2026 17:40:48 +0200
X-Gm-Features: AVHnY4KYrQdua7SpnLaqwynqHAGj2zpwe2dqjB0Og4OT8dAOLINb_3mUW5_zlqw
Message-ID: <CALE0LRtZ625eHwsmk-sJhLd-QUPvu+yxKAaWCnHqbJvpTwXcMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for
 S32G platforms
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YggBEeiJq7mDAaR2cMdkJZ7UcH9hAg2BdeynLbnKgbU_1779378063
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_084108_133968_FA803129 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Khristine,

Thank you to apply my reviews.

On Wed, May 20, 2026 at 5:10=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add the usbphynop node and the usbotg pinctrl
> support for the S32G2 and S32G3 SoCs.
>
> This enables the USB controller to reference the
> generic PHY and use the required pinmux for USB OTG ops.
>

I tried testing the patches, but unfortunately, they didn't work for
me on top of the current mainline. Any idea what could be wrong?

[   40.019850] usb_phy_generic usbphynop: dummy supplies not allowed
for exclusive requests (id=3Dvbus)
[   40.268467] imx_usb 44064000.usb: No over current polarity defined
[   40.293272] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus numb=
er 1
[   40.308834] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[   40.309475] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[   40.309485] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[   40.309492] usb usb1: Product: EHCI Host Controller
[   40.309498] usb usb1: Manufacturer: Linux 7.1.0-rc4+ ehci_hcd
[   40.309503] usb usb1: SerialNumber: ci_hdrc.0
[   40.311051] hub 1-0:1.0: USB hub found
[   40.748830] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   46.038582] usb 1-1: new full-speed USB device number 3 using ci_hdrc
[   61.347813] usb 1-1: device descriptor read/64, error -110
[   76.707030] usb 1-1: device descriptor read/64, error -110
[   76.817100] usb usb1-port1: attempt power cycle
[   77.256992] usb 1-1: new full-speed USB device number 4 using ci_hdrc
[   87.826466] usb 1-1: device not accepting address 4, error -110
[   87.956454] usb 1-1: new full-speed USB device number 5 using ci_hdrc
[   98.545933] usb 1-1: device not accepting address 5, error -110
[   98.546070] usb usb1-port1: unable to enumerate USB device

It looks like a problem with the ULPI communication because I cannot
read the ULPI registers.

Thanks,
   Enric


> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
>  4 files changed, 102 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..a35bb284270e 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -108,6 +108,11 @@ psci {
>                 };
>         };
>
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +
>         soc@0 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..b980e5f2b059 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -165,6 +165,11 @@ scmi_shmem: shm@d0000000 {
>                 };
>         };
>
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +
>         soc@0 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..26009c1e90dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg-pins {
> +               usbotg-grp0 {
> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg-grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -304,3 +337,14 @@ &spi5 {
>         pinctrl-names =3D "default";
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       phys =3D <&usbphynop>;
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index 979868f6d2c5..a8abb10b0e7a 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -199,6 +199,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg-pins {
> +               usbotg-grp0 {
> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg-grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg-grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -257,3 +290,14 @@ &i2c4 {
>         pinctrl-1 =3D <&i2c4_gpio_pins>;
>         status =3D "okay";
>  };
> +
> +&usbmisc {
> +       status =3D "okay";
> +};
> +
> +&usbotg {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&usbotg_pins>;
> +       phys =3D <&usbphynop>;
> +       status =3D "okay";
> +};
> --
> 2.34.1
>


