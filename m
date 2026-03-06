Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1BDF513EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0xF/GSbhQFRmKPb9L0wP5ASps94jsA8ESwaWVpdEXM=; b=4h84QSK/i6sawA7LLwsOCj57G9
	OmSni4yEeJkYqnnudSivWh1uoP0j8nqKO58Mc27+6scaxV9xDg/Q16ut9n80Z/7jBU3rpfVf1OY1g
	AN57nWMQ3bqWzOepgs9efMZr+6vH58qP+dc7tC8nq5sFQKArGs2OQggOXb0a6nAsIDkfkKrNBeaJX
	Q2+G1Xp3f3hH8Ukfp19zgwU3zUI8uH42tnyl+ii3aWrM7hUkhDzmY/9Ytbc5cxZK9kuuRNuLxEweh
	CIMDcQpcdPkTN6axlSo/y/jVrP+m7fmzd2rYHFi+uY8QfGEfQlY2HvZZHxmVrEyWeP5lVGpdU8psb
	DR5fwxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLsK-00000002xZ5-1Sxd;
	Fri, 06 Mar 2026 03:29:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLsH-00000002xYO-1aAT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:29:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48372efa020so77039955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 19:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772767751; cv=none;
        d=google.com; s=arc-20240605;
        b=OFeUBexmPjBqBDdQ1m4TFP28/cqe2IlB9HYkD2jsvKrKUqw1m4dpGpaZvJZvQFf/fX
         V8UCDpWw531i8s0dvPgq7LsiX0y/OhbgPqzqzRtqSOTkqVH3Jy6DH91427Iu49MMQ6JS
         x377SD3CO4WX/8NP9itD37AZ6tKAG73eHDgZ2RAwbS+9hKYXwKu6OLPph6ulCYPNAel7
         FwRG/Xg3M9/vN6JHpXKitwq30Z29WDljHMgZSdtp8Bskik+IU6YWos4KeTlU/SLqI7Sm
         SihR+NvXrWXhSF3vMOPQYvM8FtkSQTyZ1xBb373kjd6wOqJR1ThyZ6V3GpawAmZAtFg3
         pTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0xF/GSbhQFRmKPb9L0wP5ASps94jsA8ESwaWVpdEXM=;
        fh=3rBlH8pGD3T3XTS2wY47eGKXfP1Kc9LWoi/AdOtDjS0=;
        b=HyXTD7GGFEx3HfG8IrCbk5Fmc1GKN6CPS6ImKgGXIDxWxaeo3X0bWKyhtuAPs5ofjd
         8KPdcDuzfMDuf2d6xahJiyPvOa2dujRpGBLVTbcrPLu59N2b0Q3ckXae5C0KlH/Xb/5G
         HEm7Pfhc4601A8/ILZSP94tb7WPbCSEERMd4jNIU/CnrvgLFbtMwIwjPS03hUXkX3ijG
         I1s0tRsmXqg6b60jkIZkjWRNpat5tCUJIkuq7bpti/jCV1zZiBJmCZEzZM7sI9+ojPCj
         X7OQZ893zBvs49vNnGUHsvWMOpjG7M+hX54fvFQH793PHDTv62CxVqTivbXQNNpiurX4
         sYZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772767751; x=1773372551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0xF/GSbhQFRmKPb9L0wP5ASps94jsA8ESwaWVpdEXM=;
        b=c+BwS9DgfkPS7enZn1xjAbRbl2269uQ876squzkm0S7/kuypErSdKVYcLsDGMOrAjX
         q2HVsTSOUZA00xfWcRS+zDQpIg0JU3J8B5HjAVav8IctoV9k5NPa4DVmB2Ho0u2USKWF
         RP9qA+sAF0mhVY6EY9qB1o2Wyqk7qCe7AyJDFVdsnRFHtew3rRyn8f61fAz7h2J0ZSAV
         cjZHqtmQuwYECksXIZ0aVsWPr4y9HFdCn7G3hYQoqbWgD9yHCL3vow09Fb3ZCz5uVF5K
         yKaJJoFLILoC7wPogqYzRjMkOQykSXNJpRicjtNqT+lXwNAQcEg4HpxMJvvv3wwEE6oa
         aXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767751; x=1773372551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0xF/GSbhQFRmKPb9L0wP5ASps94jsA8ESwaWVpdEXM=;
        b=a9HDZ2ZqImL98ZB0ePwsOyp3ZphQi3FqXu98Z230rEF7D/HEDmiYe4v1lgEkP1NFaC
         6UgUkK5tOED+qgeRc/trvY25azZIMRodt9sQjiwBSxDuAxPkH9txGovU+ydkhJHjTqxQ
         4vWezdpCnf0xsBIe2XY9+C9C4mlYFqWwPUBh7d2O4a0iaCTDuLRCbLNKyuT9OheiVh1E
         LGRix7V1Li5qKEwQpUlW3xuQkf2E/tDAUJBpClv3neLgSuObKrymdb6RZWgRc3xGoHfD
         xPvKMDGB0tV/RVj8oeTp1MbafHDfvqICWjtypE6KRFv1zBH2G2oqi53K3QSJEPUtQL/t
         40/g==
X-Forwarded-Encrypted: i=1; AJvYcCU8Oi53gDm3Eo6ysqmQFD4IoFcFmnqQQc1RsLLz/mouL1QpgwYj19Oh3+I1tN4gA6/WojCb7w6RFZwJSrRlF3jf@lists.infradead.org
X-Gm-Message-State: AOJu0YzUETyswd4R+RYhjJsOhYrT27y0jsbs2QMPhuuBHwVxG8e5otWa
	ntRtYEDggAXEzdecCRD3uWayLFTMCCbMZW5Zp/XvCVVOKwG02tC/ZJEiEPaoPya+LG4OS5hnxVs
	JGSXswhWxw9nRa0Kxna2UCXjMaqprSZc=
X-Gm-Gg: ATEYQzy3UY1u27qi2od0J1fMmJrz9Rm36X8hKRzk53oHROc6G1GTcjyi8xZjGmb1d1m
	/TyqHHJESR+SH7KhlMJ6iq+df3s4P6t3h1mcmbv5V1vl5grk395lohZS4415iaCv1nhwgfZlgvO
	NCITIIi8WkaVKHZSkkkMqadsSIfmwcdOIgpc5eaavqYk9phMIbIk3c9bIOvjwHCerTRdoUNmq+4
	L0B2UtukCWqfL+uyFiZIz+3INJnBJoMA/uzvp6fCG/CjW2zgFtcA6g/xrZHmsK/nzYcXhMwcUOC
	mDBjfVoAm06/Rp0nSKiKeaZ6IuUYijPMpjADmvk=
X-Received: by 2002:a05:600c:1d04:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-48526984073mr7541175e9.31.1772767751154; Thu, 05 Mar 2026
 19:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20260306024634.239614-1-dennis@ausil.us> <20260306024634.239614-4-dennis@ausil.us>
In-Reply-To: <20260306024634.239614-4-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 5 Mar 2026 21:28:59 -0600
X-Gm-Features: AaiRm525kVQVM9cPKM6_6jLWM_sqSxazxpkmzGG4uS_x8mholOTo0NpOlNvPRJ8
Message-ID: <CALWfF7JNy6_eD2f0okzMPaLqJVHV9rZUokh9nFNT5CDsYO0Qxg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
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
X-CRM114-CacheID: sfid-20260305_192913_760461_16EDEB18 
X-CRM114-Status: GOOD (  19.52  )
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

On Thu, Mar 5, 2026 at 8:46=E2=80=AFPM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
>
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 311 ++++++++++++++++++
>  2 files changed, 312 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 4d384f153c13..c99dca2ae9e7 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.d=
tb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> new file mode 100644
> index 000000000000..d848891e09be
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +       model =3D "Xunlong Orange Pi 5 Pro";
> +       compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> +
> +       aliases {
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> +               simple-audio-card,mclk-fs =3D <256>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,routing =3D
> +                       "Headphones", "LOUT1",
> +                       "Headphones", "ROUT1",
> +                       "LINPUT1", "Microphone Jack",
> +                       "RINPUT1", "Microphone Jack",
> +                       "LINPUT2", "Onboard Microphone",
> +                       "RINPUT2", "Onboard Microphone";
> +               simple-audio-card,widgets =3D
> +                       "Microphone", "Microphone Jack",
> +                       "Microphone", "Onboard Microphone",
> +                       "Headphone", "Headphones";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s2_2ch>;
> +               };
> +
> +               masterdai: simple-audio-card,codec {
> +                       sound-dai =3D <&es8388>;
> +                       system-clock-frequency =3D <12288000>;
> +               };
> +       };
> +
> +       pwm-leds {
> +               compatible =3D "pwm-leds";
> +
> +               led-0 {
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm15 0 1000000 0>;
> +               };
> +
> +               led-1 {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_ACTIVITY;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm3 0 1000000 0>;
> +               };
> +       };
> +
> +       fan: pwm-fan {
> +               compatible =3D "pwm-fan";
> +               #cooling-cells =3D <2>;
> +               cooling-levels =3D <0 50 100 150 200 255>;
> +               fan-supply =3D <&vcc5v0_sys>;
> +               pwms =3D <&pwm2 0 20000000 0>;
> +       };
> +
> +       vcc3v3_pcie_m2: regulator-vcc3v3-pcie-m2 {
> +               compatible =3D "regulator-fixed";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_pcie_m2";
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_pcie20";
Is this vcc3v3_phy1 in the schematic?

> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc5v0_sys>;
according to the schematic, this is fed by vcc_3v3_s3
> +       };
> +
> +       vcc5v0_otg: regulator-vcc5v0-otg {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-name =3D "vcc5v0_otg";
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "ext_clock";
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
> +&i2c1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c1m4_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2c3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c3m0_xfer>;
> +       status =3D "okay";
> +
> +       es8388: audio-codec@11 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x11>;
> +               #sound-dai-cells =3D <0>;
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
> +               assigned-clock-rates =3D <12288000>;
> +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +       };
> +};
> +
> +&i2c4 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c4m3_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2s2_2ch {
> +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk
> +                    &i2s2m1_sdi &i2s2m1_sdo>;
> +       status =3D "okay";
> +};
> +
> +&package_thermal {
> +       polling-delay =3D <1000>;
> +
> +       cooling-maps {
> +               map0 {
> +                       trip =3D <&package_fan0>;
> +                       cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> +               };
> +
> +               map1 {
> +                       trip =3D <&package_fan1>;
> +                       cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> +               };
> +       };
> +
> +       trips {
> +               package_fan0: package-fan0 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <55000>;
> +                       type =3D "active";
> +               };
> +
> +               package_fan1: package-fan1 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <65000>;
> +                       type =3D "active";
> +               };
> +       };
> +};
> +
> +/* NVMe */
> +&pcie2x1l1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
> +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +       supports-clkreq;
> +       vpcie3v3-supply =3D <&vcc3v3_pcie_m2>;
Is this real? In the schematic, the supply looks like vcc_3v3_s3.

> +       status =3D "okay";
> +};
> +
> +/* NIC */
> +&pcie2x1l2 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> +       vpcie3v3-supply =3D <&vcc3v3_pcie20>;
> +       status =3D "okay";
> +};
> +
> +&pinctrl {
> +       bluetooth {
> +               bt_wake_gpio: bt-wake-pin {
> +                       rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               bt_wake_host_irq: bt-wake-host-irq {
> +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_otg_en: vcc5v0-otg-en {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       wlan {
> +               wifi_host_wake_irq: wifi-host-wake-irq {
> +                       rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +};
> +
> +&pwm15 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm15m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm2m1_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm3m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       status =3D "okay";
> +};
> +
> +&sdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       max-frequency =3D <150000000>;
> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       ap6256: wifi@1 {
> +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-names =3D "host-wake";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> +       };
> +};
> +
> +&u2phy0_otg {
> +       phy-supply =3D <&vcc5v0_otg>;
> +};
> +
> +&uart9 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
> +       uart-has-rtscts;
> +       status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm4345c5";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "lpo";
> +               device-wakeup-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
> +               interrupt-names =3D "host-wakeup";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
> +               max-speed =3D <1500000>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&bt_wake_host_irq &bt_wake_gpio>;
> +               shutdown-gpios =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> +               vbat-supply =3D <&vcc_3v3_s3>;
> +               vddio-supply =3D <&vcc_1v8_s3>;
> +       };
> +};
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "host";
> +};
> +
> +&usbdp_phy0 {
> +       rockchip,dp-lane-mux =3D <0 1>;
> +};
> --
> 2.53.0
>

