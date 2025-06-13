Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CC6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lopa9dsU00PWCWa6IyKFnmzc4njXABC4sgMfKLOvRko=; b=jKKqD5fl+08gQ0W2iMRcO4FUmp
	6aHJ0CjUUM/fefxAQi7gkbBY9+E6Ymv2y/cDDhoFE+3vmoTcCOet8yKr4PjcLgxCTvwnEnAF+Daiy
	h2xZtPd2BgzHJCPLZgaiLVlvw10s/fXq/ZCLmLhl6992kaU53ALEgTIPANP6TKaTf1Nm4r8iNIKcs
	20EpGa1P/xaA8bT1c25poMfjg7lTvUbIu0yta2FqjAneMM5RH5IbOYOtEVG1MNz9knn/6/9l6Tefi
	Q9jK7I3ssUEkjWXAw6Glxrgwajm5NC/wm0PEpH1NFfxh4FgLeFoI2PAZ3z+NwUMpQ20OD5RhPI/+z
	I8v7W9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB9U-0000000Hatf-1L7K;
	Fri, 13 Jun 2025 20:37:28 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQB6A-0000000Ha99-38J6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 20:34:04 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so657959fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846841; x=1750451641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lopa9dsU00PWCWa6IyKFnmzc4njXABC4sgMfKLOvRko=;
        b=lgjI+kUoyVbjxuE/RyiFK0conk8aFL0uVdgXvDNfJanYflWiJYzYHI/DEpkDhO2p2z
         kyx/wTUyh2yWI+66oYhtLeAQQIrR5USi+FzCG23k/xtjZMLpMI7xJXDYUSYEDLpSOxdp
         mSjbbloAbrBcEvmYGgi5M7D5gkEa2gbZb6kdCbAe3xEunPM3ve0/jkD8SeAO3sxsw8wY
         fGyIhdI4oHh9cBqAKI3WrZVUiY53m9KbV2DPmMFML1YDfCKfAroroDDXyUrT3MI/MbC6
         QLn/LSmz7gXpFYJApzHCMdO+rhrK+37zHSkohT5oG4cPYl/0ndRC5w35xi3XQ4kf5bnT
         NDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846841; x=1750451641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lopa9dsU00PWCWa6IyKFnmzc4njXABC4sgMfKLOvRko=;
        b=ZkehjahDpWCXt73tLitFt/QMQr9sdlLmSSmEDJyDKJzIBWZzT3EL44FivCAjfIXQ0Z
         ZFY53bBurR90lz7mfQD5eXui1D2yC6Rh7DoFvci+ljwdUph0zVWnkcJj3laQ2lRn0oQU
         YMB6VfKQGBAGqBKK6g40n4EE+wBclQ3/gjy/oQ04xF5SH1dTAdn29jDSH/NznhhWHfO3
         txBwqNXxumcWZ6kzsL4z7Z9X4jArEMIZMsiVAlfPR0zbPobDUg9I60KdwfbrNx5p1Si6
         IC96+zaq2eLo9qpk2y/Cefn9pdyxOd9U/MpMR4wWmUmxsO0gCV+YAsNB2hZkrLnIkhnP
         Hx/g==
X-Forwarded-Encrypted: i=1; AJvYcCU070w228IioD+xOMZr1NgKBykX/DSEFRpplx+IgJBrsd1WTdt+IaKharPACvatj1MAyLVF9NsJWO0Aw2EK5jdM@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBbSrortxTf3YjsEBeaxCVf146dWbVbJDMQlpZHT3xZE9hVwe
	RFd1aXBdlSjusHguLORLMUT5qG86CKUTNmlTuJeIQxrqg2Prxjgj3M3/lCwMRAtYu3tulTQof1z
	lRLfKQrChm6EuIYTdlqSe6mlg/Lh0ZCs=
X-Gm-Gg: ASbGncs3PbEI4qDW2QCH8TwQblu0WrsKdvLdvZwzJE7vsYRnKmYKg5bHlJDouQhQtIK
	WvomMF8ytOwhVQlHWK6wAoK+R5qt8V6bhfxj4yQ9GgnZtH+L+hl+6SCfF/CFJiCTgKit5nelIn1
	qV5noRLGZT/vQmzO+OYVpPfH8KmsEZeg0v3PExDU7pyJGWa35p6RGxuTaieovmN3F4oxH121y9n
	LYe
X-Google-Smtp-Source: AGHT+IHzsOYqNWBAmSJpeza6535H9+LjTdLCISm3FP5IepVgKDbx1c4zlFhkhrUOQVgDuoMTlLRtGOvFXzQwa+xbuIg=
X-Received: by 2002:a05:6870:ed8e:b0:2d5:a360:7df9 with SMTP id
 586e51a60fabf-2eaf0836064mr754389fac.5.1749846841154; Fri, 13 Jun 2025
 13:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-2-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-2-514cdc768448@bootlin.com>
From: Jason Kridner <jkridner@gmail.com>
Date: Fri, 13 Jun 2025 15:33:50 -0500
X-Gm-Features: AX0GCFth-gZNYPrnl9VNVFIFYlCNPCH1OPJqknA_Pge_SpOnzoBQeeMxwvLcRMQ
Message-ID: <CA+T6QP=yHO-FoGkVxZJzT8OyO7i8K5G5uazqk6qHQ5QzWSicGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_133402_786244_8E070D03 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> Several device trees incorrectly included extraneous compatible strings
> in their compatible property lists. The policy is to only describe the
> specific board name and SoC name to avoid confusion.
>
> Remove these incorrect compatible strings to fix the inconsistency.
>
> Also fix board vendor prefixes for BeagleBoard variants that were
> incorrectly using "ti" instead of "beagle" or "seeed".
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Changes in v3:
> - Remove extraneous compatible strings.
> - Replace BeagleBone board name vendor.
>
> Changes in v2:
> - New patch
> ---
>  arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
>  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +---=
-
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +---=
-
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
>  15 files changed, 22 insertions(+), 29 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boo=
t/dts/ti/omap/am335x-base0033.dts
> index 46078af4b7a3..176de29de2a6 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> @@ -9,7 +9,7 @@
>
>  / {
>         model =3D "IGEP COM AM335x on AQUILA Expansion";
> -       compatible =3D "isee,am335x-base0033", "isee,am335x-igep0033", "t=
i,am33xx";
> +       compatible =3D "isee,am335x-base0033", "ti,am33xx";
>
>         hdmi {
>                 compatible =3D "ti,tilcdc,slave";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts b/arch/arm/boot/dt=
s/ti/omap/am335x-bone.dts
> index b5d85ef51a02..2790c0c5a473 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> @@ -8,8 +8,8 @@
>  #include "am335x-bone-common.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone";
> -       compatible =3D "ti,am335x-bone", "ti,am33xx";
> +       model =3D "AM335x BeagleBone";

We have software that looks at these in running systems, so I=E2=80=99d be =
ok
not to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=
=80=9D? Not
sure of the convention to mention the SoC, but AM335x is not part of
the product name.

> +       compatible =3D "beagle,am335x-bone", "ti,am33xx";
>  };
>
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/ar=
ch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> index b4b4b80df08c..d78b6427b8f2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> @@ -11,8 +11,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Black Wireless";
> -       compatible =3D "ti,am335x-bone-black-wireless", "ti,am335x-bone-b=
lack", "ti,am335x-bone", "ti,am33xx";
> +       model =3D "AM335x BeagleBone Black Wireless";
> +       compatible =3D "beagle,am335x-bone-black-wireless", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/bo=
ot/dts/ti/omap/am335x-boneblack.dts
> index 16b567e3cb47..70c26d090ecb 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> @@ -10,8 +10,8 @@
>  #include "am335x-boneblack-hdmi.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone Black";
> -       compatible =3D "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33=
xx";
> +       model =3D "AM335x BeagleBone Black";
> +       compatible =3D "beagle,am335x-bone-black", "ti,am33xx";
>  };
>
>  &cpu0_opp_table {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boo=
t/dts/ti/omap/am335x-boneblue.dts
> index f579df4c2c54..779e74218b57 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> @@ -9,8 +9,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Blue";
> -       compatible =3D "ti,am335x-bone-blue", "ti,am33xx";
> +       model =3D "AM335x BeagleBone Blue";
> +       compatible =3D "beagle,am335x-bone-blue", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/ar=
ch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> index a4f5b5262645..ee92abf43175 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> @@ -10,8 +10,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Green Wireless";
> -       compatible =3D "ti,am335x-bone-green-wireless", "ti,am335x-bone-g=
reen", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +       model =3D "Seeed AM335x BeagleBone Green Wireless";
> +       compatible =3D "seeed,am335x-bone-green-wireless", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/bo=
ot/dts/ti/omap/am335x-bonegreen.dts
> index 18cc0f49e999..3d771721dcb8 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> @@ -9,6 +9,6 @@
>  #include "am335x-bonegreen-common.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone Green";
> -       compatible =3D "ti,am335x-bone-green", "ti,am335x-bone-black", "t=
i,am335x-bone", "ti,am33xx";
> +       model =3D "Seeed AM335x BeagleBone Green";
> +       compatible =3D "seeed,am335x-bone-green", "ti,am33xx";
>  };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/b=
oot/dts/ti/omap/am335x-chiliboard.dts
> index 648e97fe1dfd..224095304ef3 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> @@ -8,8 +8,7 @@
>
>  / {
>         model =3D "AM335x Chiliboard";
> -       compatible =3D "grinn,am335x-chiliboard", "grinn,am335x-chilisom"=
,
> -                    "ti,am33xx";
> +       compatible =3D "grinn,am335x-chiliboard", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm=
/boot/dts/ti/omap/am335x-myirtech-myd.dts
> index fd91a3c01a63..55a454f51148 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> @@ -12,7 +12,7 @@
>
>  / {
>         model =3D "MYIR MYD-AM335X";
> -       compatible =3D "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
> +       compatible =3D "myir,myd-am335x", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/a=
rm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> index d28d39728847..d87ac31a16a9 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> @@ -16,7 +16,7 @@
>
>  / {
>         model =3D "Octavo Systems OSD3358-SM-RED";
> -       compatible =3D "oct,osd3358-sm-refdesign", "ti,am335x-bone-black"=
, "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "oct,osd3358-sm-refdesign", "ti,am33xx";
>  };
>
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm=
/boot/dts/ti/omap/am335x-pocketbeagle.dts
> index 78ce860e59b3..c2f26687790c 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> @@ -11,8 +11,8 @@
>  #include <dt-bindings/leds/common.h>
>
>  / {
> -       model =3D "TI AM335x PocketBeagle";
> -       compatible =3D "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am=
33xx";
> +       model =3D "AM335x PocketBeagle";
> +       compatible =3D "beagle,am335x-pocketbeagle", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.=
dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> index 7c9f65126c63..61210f975542 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> @@ -13,10 +13,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced Extended WiFi";
> -       compatible =3D "sancloud,am335x-boneenhanced",
> -                    "ti,am335x-bone-black",
> -                    "ti,am335x-bone",
> -                    "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts b/arc=
h/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> index c6c96f6182a8..10488b55689c 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> @@ -12,10 +12,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced Lite";
> -       compatible =3D "sancloud,am335x-boneenhanced",
> -                    "ti,am335x-bone-black",
> -                    "ti,am335x-bone",
> -                    "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts b/arch/arm=
/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> index 32669346cefe..f1bdbf053fb2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> @@ -13,7 +13,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced";
> -       compatible =3D "sancloud,am335x-boneenhanced", "ti,am335x-bone-bl=
ack", "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts=
/ti/omap/am335x-shc.dts
> index 597482822608..f2393ff3f4d7 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> @@ -12,7 +12,7 @@
>
>  / {
>         model =3D "Bosch SHC";
> -       compatible =3D "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "ti,am335x-shc", "ti,am33xx";
>
>         aliases {
>                 mmcblk0 =3D &mmc1;
>
> --
> 2.43.0
>


--=20
Learn about me and setup a meeting at
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing

