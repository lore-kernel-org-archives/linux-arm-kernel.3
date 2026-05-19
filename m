Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83ECCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=; b=VhFSVlMnFinczmXX/TCZygAo+c
	74C9LiH98Tuk8nFAl0nsmHx69d72mNbZtVZ57zMaLhb9+ng4WKSQUOacnSe5ufjoYV8jRtnBzYKLm
	IXHalyNyLZYtrgWhTDgR0rcasawFeXejeYG0XWDoOZGDKC/P+RtxN6rE+YPVfKNmK/ag3le0R/hB6
	b4kda86PUvDp18WzH52l5TjFYTcTNMP2vlyxlWHQSMLXFXk2tz/VLsGYo+XQc0tXxT62faoixlWAL
	N/exOdZA8F2Y8TZgYTbK3WQFZcqMcoxznfyI+BuFjDmhyyvfXyYF6apJRsjkwMHW/GZoWaJzSaNRn
	aUgj7Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIth-00000001N8Y-3Czv;
	Tue, 19 May 2026 11:46:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIte-00000001N7N-3XNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779191161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
	b=KRURCMUx/Iuim+oP8FZ8oKjJ9VwZg/mSOMwcAXyd0z5Ai/oPwCNRLPLP8I/RnL8A2Zun2p
	rc1s0cXK2j9akytPkCNEOoMokY9JL7HuZMyr8+vV0mK2CQEg1VlIXgeSNPB3O4yrrUdwRx
	RICDyV9u7ftXT4mEtI6cquGQsyEFqlc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-Ei9qAnlMP4eGamkVUpQwuQ-1; Tue, 19 May 2026 07:45:57 -0400
X-MC-Unique: Ei9qAnlMP4eGamkVUpQwuQ-1
X-Mimecast-MFC-AGG-ID: Ei9qAnlMP4eGamkVUpQwuQ_1779191156
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a870f93c99so321245e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 04:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191156; x=1779795956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbjFHJj+U7uIM+Cg25ETbUEUNoe3mdFwTNg+mtbLNPk=;
        b=JvQl83hnNHVlT2Mv2doUZ36qHSKN4NaprI00YUonVbt4g0GfaOavTpt1lxCF84PGwU
         AZWaOVJYyqoj8dpJvu81YmrLUWDhGvHZElFNa0kdvf0SCm3mZGHT6R/jKGJcHaCGxvbC
         N3J6IyoRTbOpfkENJBLWw/P2fH+mZQhOfU4761mF6dWkPlQMhPUA0vUzAvehKpM/RPyt
         DYIdiAhJM4Io57xv0RAnyHD8Z/+k+rkEriAoNu3MBLdnOAJ6wjQb4PVnO/bojoS+DasF
         LUZlwOpoR9/I5M3Wp3v7do9SoM/1UUs3OlryjhNMTFslHoVncu7ftgjQ0Ci5F4/s8lsj
         CxdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zB6OPZDRLNj6Mg1/pjjcCl82By3PSupaEdUcldJi+l/5OQuICuJjIQBhJyNnqmsn7UIoncOy6OCIrsF2cjb5R@lists.infradead.org
X-Gm-Message-State: AOJu0YyMeIfbIPdXN1gA/+RPnXaT+LC8kgr0GdJde2Vy4iaL4/Qc0Wxc
	Pzvkz4DxQD5j0BTAJci4vQwNye2ZeYI78p3vrpP0CLWMdw+ip+phfI2A1GSNjLi8+gU8BFuxWFS
	McUEwSu+dNxYUFhhLi4J46kSY0B0m4Uzuh+VohO/mnpH9MB7lybSMN3eNvXU8mKW5KkF6SPUlH2
	uO7R3lG1hGqt7mPHqGDb9+jDcqfnVpgDKy/VeGrrc2rV/cGHyjZY8=
X-Gm-Gg: Acq92OHiLbRlxlK0SMS/hoXeOkLz9VBmV7TqbR1Jv6XFOibRL9+2Rnm/ef5wIoJNXwZ
	wsOihC1PAQvMzdhV42gheKZj5merpeVVVmTjgviXyf4y8nisbI27fTbZugehEVsHOG2HPfJElor
	mqII/oPXz/tvS476AA4Q/aFYKWYtppdRt24XjoZIRKEFqAaiOc4SbqH4lAH2TJIxXtptAmkhwuf
	Yktpw==
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id 38308e7fff4ca-39561d12c2cmr26805831fa.1.1779191156014;
        Tue, 19 May 2026 04:45:56 -0700 (PDT)
X-Received: by 2002:a05:651c:548:b0:393:9110:fbac with SMTP id
 38308e7fff4ca-39561d12c2cmr26805691fa.1.1779191155534; Tue, 19 May 2026
 04:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com> <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 19 May 2026 13:45:44 +0200
X-Gm-Features: AVHnY4IsU7fSSnNgUDdmrpcWXb8rpRp3nIWviV63aNNWwk4kg6ZdkU34h4HNbeA
Message-ID: <CALE0LRtt8w6cAoCqKt-9YCuvjbVE95NdQPq3gXqRg-jhxKO4HA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1yPqcCBksw_F3IZFI3G_nooixcMh6380dmXStci-1Ls_1779191156
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_044603_372752_FF116641 
X-CRM114-Status: GOOD (  21.94  )
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

Hi,

Thank you for the patch.

On Mon, May 18, 2026 at 8:15=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add the usbphynop node and the usbotg pinctrl
> support for the S32G2 and S32G3 SoCs.
>
> This enables the USB controller to reference the
> generic PHY and use the required pinmux for USB OTG ops.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 53 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 53 ++++++++++++++++++-
>  2 files changed, 104 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..d096744cdb0f 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};

I'm wondering if it it would be more appropriate in the SoC-level dtsi
(s32g2.dtsi/s32g3.dtsi), similar to other Freescale boards,it doesn't
represent any board-specific hardware but a virtual NOP transceiver
used by the SoC.

> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -245,6 +252,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

The label can remain usbotg_pins but node names should use hyphens

usbotg_pins: usbotg-pins {
    usbotg-grp0 {

You can run this to catch this kind of issues:

make W=3D1 CHECK_DTBS=3Dy ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
freescale/s32g399a-rdb3.dtb


> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -304,3 +344,14 @@ &spi5 {
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
> +       fsl,usbphy =3D <&usbphynop>;

According to the binding this option is deprecated. Could you use
"phys" instead?

> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index 979868f6d2c5..b756bcf6469d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -1,12 +1,19 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   *          Larisa Grigore <larisa.grigore@nxp.com>
>   */
>
> +/ {
> +       usbphynop: usbphynop {
> +               compatible =3D "usb-nop-xceiv";
> +               #phy-cells =3D <0>;
> +       };
> +};
> +
>  &pinctrl {
>         can0_pins: can0-pins {
>                 can0-grp0 {
> @@ -199,6 +206,39 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       usbotg_pins: usbotg_pins {
> +               usbotg_grp0 {

ditto

> +                       pinmux =3D <0x3802>, <0x3812>,
> +                               <0x3822>, <0x3832>,
> +                               <0x3842>, <0x3852>,
> +                               <0x3862>, <0x3872>,
> +                               <0x37f2>, <0x3882>,
> +                               <0x3892>;
> +               };
> +
> +               usbotg_grp1 {
> +                       pinmux =3D <0x3e1>, <0x3f1>,
> +                               <0x401>, <0x411>,
> +                               <0xbc1>, <0xbd1>,
> +                               <0xbe1>, <0x701>;
> +                       output-enable;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp2 {
> +                       pinmux =3D <0xb80>, <0xb90>, <0xbb0>;
> +                       input-enable;
> +                       slew-rate =3D <208>;
> +               };
> +
> +               usbotg_grp3 {
> +                       pinmux =3D <0xba1>;
> +                       output-enable;
> +                       slew-rate =3D <208>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -257,3 +297,14 @@ &i2c4 {
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
> +       fsl,usbphy =3D <&usbphynop>;

ditto

> +       status =3D "okay";
> +};
> --
> 2.34.1
>


