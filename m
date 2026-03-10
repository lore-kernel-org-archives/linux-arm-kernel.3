Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BC6FCC9AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44y8wtn+EpnOpSpvTMpt4sK2sGiI+rNWg9pt6T/Db48=; b=yIL0symxYi8NlzsOBxSa9ngrb6
	lK15R2066+T4Z1MlrwngtnL7555NrjCEweb551Lw651lrn6eJV9+8rmrIt0fNYXaFOqlH6s3erWrV
	WiQZ14OkjY4aqgyrZqBR3xcFOTPg4IRPQthrFAFXLbCnJ5wtstJNe0At0/d3eu3MchOJUfVziPC5u
	iJ7IJhaFOAelw9jArg/WJ4z2/IRvRLMTs1Pxq58PUoHw9JkJX04Aposxt5EYOk3JXBCEUnrzYYDhP
	kwkPvaGKSxVw0tQsxQi+E05/jD9MaK27fhu/LFbI2msZuAK8x9Edk7PJudi6MM6k3X7YoFrhFs8fN
	PIpQ4vqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn0p-00000008ZyU-2sGb;
	Tue, 10 Mar 2026 02:39:59 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn0m-00000008Zxn-48gX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:39:58 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5090c48de85so23245741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 19:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773110395; cv=none;
        d=google.com; s=arc-20240605;
        b=AalytXp1Uyg4br+9+G1DQtv9J09B/EnFT6OCCBk/wxqS7XqqYrsF2DqQWo2Aze+kRi
         afEKU5WrilbhFN2bQ/UkCm8Y4Ha/z6pAgkbkkJA7zJLy5YwafjM43w0Cj0CGd59jlK3J
         XCFoN486W9VpgQeh8IqIloGbuSzIOCJkWvI463As35u7EnvPs6APtUZCNGszcvg5HGko
         FJYBGv1p+8L98eY13mxD92vnGdxN1iwJI0b9BPLnz6JYcoFf/E+qTz20q/hM5wIpogkJ
         YPyHITx5kv5G1myS78vSv9crxs8ZG7sPrt4ExW6Jn2nT1PXg+lZJ+CCKLSgPo//W4/Ms
         IElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44y8wtn+EpnOpSpvTMpt4sK2sGiI+rNWg9pt6T/Db48=;
        fh=zRC3XWIzV8jTGnixOb5QIZEYgDYTWOStldohO5CATOY=;
        b=bIAh4rv0CN4EMddDNprmr9iex+TOFX/w7/vIKEwZSeEQPLmza353o7zttoMtgD8toi
         FByloao264IKXVi9U5b7sm10tSi9qSLP3gsSnasc43MHyQEliHa4uivjH2g6btlrA3vK
         SL9DkZpsasHTk0nK+uoI6i+xv9axtKGaU10yoHbC6pbRVOXPbUz01kQNZVIqyz5p+zH8
         THPGIgaNowY9N6qUg/1UJoDSCWEWErTlxGhw/9516Rmm2a6IFqB6g1pAPVyiIsObMCSG
         mrTeR+v/G5fxsNMgho6MOPcre5ZJJFbnB0hW3XAtJJCO7lzyNOwHkNSb1S8ofRleERIi
         ZgHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1773110395; x=1773715195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44y8wtn+EpnOpSpvTMpt4sK2sGiI+rNWg9pt6T/Db48=;
        b=TjGD4NVA89ISqwMbYKrFzPbboT6+AhwCUQbb8s1WuY/f3DVErnVBmAzpSiVtpiaSmZ
         J6kpO52HQOSweK7+S7/aoR559oxP3kubXSdExffNH87dyrzcr4vpgPgmim83Gb1kGmgo
         TiNFtYV1fkxt5NqvSvyDsJjpujAwi1zZAUo0kqj3JoVmOcDzajJC4Lksn+X2ju13utqi
         pBJDB1W/PTk+ALmNGS4X9mHlvMjZodkUuTWbGlGcJzOb2+PYsIRS1U/J26++T96P4TzE
         PrWruy/o07ywPi9iJm/N4yg0xMX6K1YZvIV+FoL6l+8908y35JU/9zMX5tVXALiP4uRB
         SVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773110395; x=1773715195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44y8wtn+EpnOpSpvTMpt4sK2sGiI+rNWg9pt6T/Db48=;
        b=aWNBilwYdOjcHZ0g8Y7+B6I3p9moBCYtSVzj6vxpUeB6XnV7rpzqLipCtkTvzvfp4+
         xF72YzhtVtIwCg5k82rECz2SFBjcFUWUivT4htqWGXdIMeAwjFQP6kA1iH2mFS6WeR4e
         BFWrkvIXid4BSJQr7dsIud88hSZNJfnq5C4NgnmHmJWPcokWXwEKyzD4pRcJGea/DOhf
         oSr2hPh3tBcf2giwH02BXuow9L8axdSw4IVe9DeCoUEeKGuXREFcUDfNNekAijUI3NVY
         yEASHAH5fiEmLt/jN6LQfdK7+Xp8IFR3BPCE4YZKmdPagoiGpb1riyU5q8LBxi/o8bwi
         KDXA==
X-Forwarded-Encrypted: i=1; AJvYcCUCjQ8mfo0QPZ/yNqFbsf8x4V3z1dw5tuGlMAttjl8QcMW8sMlCV9Nw/gNH5GUv7aiBhrUEOLll38emjDj9kkKn@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9TO4BDBZpyzGDiY1vvYoDzf/BH+wMOYoLNzYlQbXNoHlypJ3
	UwCBVfQco3uwE21qy+9rizVoB+X1Hos18rs/Y8An0yfgxbwraoMePPUP/BFYJ0o/hw5aH45aPaU
	QNMcjYU9R/lklKaN307KuA1kjwOinaoBpIXBiW2zc7A==
X-Gm-Gg: ATEYQzwZCa/KVHM9BvpHBwSN0Cj/BscQHfcTKzosIYF/58OZGWfAqg5icdR/Ar450pm
	DsPelX6a9K7457kvMCbVte52qq/Pr/+hDs2n45xMNWTYl9pOKeYhqOOODHFUSBxC9kPuDJMIchi
	wrrWRZt/R5fSDp8HCop4MH87qXvY5DokKR89PH/uBXGwLE3SUDePH2q3QV6g3QcF/ejJpQGgktC
	mROP0Ak2Vq1/b5ncfF+1aJyR4315YMBiD302v5adNLbOAC2Hec2j9KafK50IsLQgppYpK8jRbsy
	WZFWz5hiXJUDmTJGuucKhPoz6Hw314orTV0ArVY9g2o49NLb9nUzdvJ4nu3sNyJUnJcUOvE=
X-Received: by 2002:a05:622a:46c7:b0:509:dcf:74e8 with SMTP id
 d75a77b69052e-5090dcf7858mr86575301cf.49.1773110394877; Mon, 09 Mar 2026
 19:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260306024634.239614-1-dennis@ausil.us> <20260306024634.239614-4-dennis@ausil.us>
 <CALWfF7JNy6_eD2f0okzMPaLqJVHV9rZUokh9nFNT5CDsYO0Qxg@mail.gmail.com>
In-Reply-To: <CALWfF7JNy6_eD2f0okzMPaLqJVHV9rZUokh9nFNT5CDsYO0Qxg@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Mon, 9 Mar 2026 21:39:43 -0500
X-Gm-Features: AaiRm52umy9c6SzujmKxzTwTJbhy9WwM315J2-lyDSlORlUQDDjebc6a-Yx4rpQ
Message-ID: <CAABkxwuxpBRRNcAqTSjV1_zfzd_CQDdX0cBWuhqbCkqrqGhBiw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_193957_087454_10518CD1 
X-CRM114-Status: GOOD (  23.54  )
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

On Thu, Mar 5, 2026 at 9:29=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> wr=
ote:
>
> On Thu, Mar 5, 2026 at 8:46=E2=80=AFPM <dennis@ausil.us> wrote:
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
> >
> > Vendors description and links to schematics available:
> > http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/detai=
ls/Orange-Pi-5-Pro.html
> >
> > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 311 ++++++++++++++++++
> >  2 files changed, 312 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro=
.dts
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
> > index 000000000000..d848891e09be
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> > @@ -0,0 +1,311 @@
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
> > +       vcc3v3_pcie_m2: regulator-vcc3v3-pcie-m2 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-always-on;
> > +               regulator-boot-on;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-name =3D "vcc3v3_pcie_m2";
> > +               vin-supply =3D <&vcc5v0_sys>;
> > +       };
> > +
> > +       vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> > +               regulator-boot-on;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-name =3D "vcc3v3_pcie20";
> Is this vcc3v3_phy1 in the schematic?
>
> > +               startup-delay-us =3D <50000>;
> > +               vin-supply =3D <&vcc5v0_sys>;
> according to the schematic, this is fed by vcc_3v3_s3

Thanks for the review, Jimmy.

You're right on the vin-supply point =E2=80=94 this should be vcc_3v3_s3, n=
ot
vcc5v0_sys. I'll fix it

Regarding "Is this vcc3v3_phy1?", that is the source. vcc3v3_pcie20
came from copying from rk3588s-orangepi-5.dts I will rename it to
match the label in the schematic

> > +       };
> > +
> > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > +               compatible =3D "regulator-fixed";
> > +               enable-active-high;
> > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > +               regulator-always-on;
> > +               regulator-boot-on;
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
> > +               DVDD-supply =3D <&vcc_1v8_s0>;
> > +               HPVDD-supply =3D <&vcc_3v3_s0>;
> > +               PVDD-supply =3D <&vcc_3v3_s0>;
> > +               assigned-clock-rates =3D <12288000>;
> > +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> > +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
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
> > +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk
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
> > +       supports-clkreq;
> > +       vpcie3v3-supply =3D <&vcc3v3_pcie_m2>;
> Is this real? In the schematic, the supply looks like vcc_3v3_s3.

It is not real, since there's no discrete regulator (VCC_3V3_S3 feeds
the M.2 slot directly), I'll drop that node and have pcie2x1l1
reference vcc_3v3_s3 directly.

Dennis

> > +       status =3D "okay";
> > +};
> > +
> > +/* NIC */
> > +&pcie2x1l2 {
> > +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> > +       vpcie3v3-supply =3D <&vcc3v3_pcie20>;
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
> > +&u2phy0_otg {
> > +       phy-supply =3D <&vcc5v0_otg>;
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
> > +};
> > --
> > 2.53.0
> >

