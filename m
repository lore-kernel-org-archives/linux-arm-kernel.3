Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5BEB7ED2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 04:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XYLyMKJ0dlF29hBtXI26zZL2A2fy41jRfFsqvLL2kY=; b=34xatCHcLVPcdf1Tq2RhYcLqn6
	Yw4ksjuQhbEpp+msWvz3bRRkhM1GT64ik8OllT/Zv7DEBeim6VqL6+NyycKUIAjcT1dbysgpUuKvs
	tGqlBleAJ8ZeyXU6h4YIRscD87jxkR8/MpwjG63H+6s7/5N+Lp/LnZTxE9XNEANGcZoudTievLQB2
	FOin1u+d6ZA6WHxsOKyVh4p99+29+WoTkw5h3DJBcOll74KJNI/mF2PEj2eNsAn+zNkXQGttuiUZw
	GGIRCMHeGjmyFJ2I8tyXNxOHSn39xRJojuK6ZqT4aQKrjltGK6u1jQmgmX/tSuwc0TV7+Mvlm1sWi
	age7Z+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0GE-00000000tUk-0Oa5;
	Thu, 05 Mar 2026 04:24:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0GB-00000000tTt-0C6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 04:24:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439b94a19fdso3776198f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 20:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772684665; cv=none;
        d=google.com; s=arc-20240605;
        b=Vl03YTwAPyroUv9+0SB7p6b7nxp2kj8QhK8Rd3jyT6kvga6zZF4tjjafD4SZYxAWGd
         QQxJKZthBSBVbmmS4noTKD+fNhLzgDhF7WBBCApgPvuO6GC8vk5HlpetyfjRAkFGkfl1
         vNwwm6Ot8pU5yQSnZaflqRmnm/chqyvJMzeQBMTRk6D9VuYDqMQ2fvAcOz3ray5z6rq1
         K5WudToeSoTZFI4q/CU5wsgMnQLAmirAHCsoICa9tmarKVm8i1X1bIj1CwcJ8cDSoTpU
         c6ZM7S6FIdme/lyC0StHe6ZfznTMlB4JOs7pEu6HWkRuOLgFQ2Khx2C90QlwfdQmsbP1
         2m/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0XYLyMKJ0dlF29hBtXI26zZL2A2fy41jRfFsqvLL2kY=;
        fh=GBbbBjQ+2EyD5YVhnrrCObkJ4eWrXg7rVZ+HsEirNf8=;
        b=HrPjstK32MU42WE8D1n8TfWKxEQ0etrzrYjUTeVp4vBbIw9lLwsg8KCX0fRGw2TEO1
         qT/Q/zEEdxl7pxLMBtiLiQpQ+H8yC+gNyRH4sKcpYfgUVry3aIznwfOK18zW7BWh2J1O
         x9ibE115OVJ/BlhbnPGetoVRlZ9ORxEKKSajFaOnYuGk+v7r5PlHLBz2AIWxaPSyRoDx
         036Cgoc7MtQUQxIKE45+9VC7UJY7eKe3eP8KIaHriiPoSBW4zAAxKBrVdkg1CoTGX1a7
         +IcgGdTqjUNxWLREK+1MLZP0VVlYiPqoKFbYiC/V1cT/QiTamK3vm1vMK4Ifd1E3+MCN
         SYmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772684665; x=1773289465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XYLyMKJ0dlF29hBtXI26zZL2A2fy41jRfFsqvLL2kY=;
        b=HRVBdhBottJ9sGnVtjngcee2Tcr0Ad8a6lUJJ/ypO3Z8XvaoaDKMP4sRxeIV3/ds1K
         794b3N4p3hSzaw6isQwfXGvWRLPJzxNyx0XuSYTtHnLqLCfSIN3/+yNvZmvoUywU62Zr
         UgHbBkyIE5N8bw9b5+jLcwK20pTCrLnRSzf90VQu6u8O571qOPlhOlDaOtVbXKB4cmQ7
         J5OxZp9vqFbOalp5EWBHrmy+4q0gb9JKHlWngt9A74J6NsL/lfVOzJId9e0tfse2FxBT
         AqfO3KJXNfWhTjNMJhoX9siVk3lAuqcSGsrQyfs/WzKZaAp7fyMtpKN9u4qZ5T4M5mJy
         hRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684665; x=1773289465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XYLyMKJ0dlF29hBtXI26zZL2A2fy41jRfFsqvLL2kY=;
        b=YCoxkjAAQX0KbF93mP1IO/heuydW/otJoM5glgwh5HvuF2JLhEhuUcHV6xco1YBxE6
         eR4QIL6GPo8DswVU06II/Lf2mRS4UAc1dgOk3xm02XeaY+p6BRyRqouXwx7AJa2hMEcv
         arrOPlHkcQacaxAasZfuzBGYEFjLlnJrjrh3aBrSreFOY2gnEJtB9JgW03cAL9vwSLio
         0CS5PVLkNnkhd0bUkrRYTuqMUBL3572olejAGGMkA+NhIWnJYCnxtqpT8DG23Yc2TnNg
         WyYh6dGq6nCQYSd56TAtiBpwVo8knwL+IfmVkLSMcuqNmFi/Xcikgl38FWULV2YBct8b
         JfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGdVmBqaH9PD4bJck9tCQtoNO4UUKdYmHFfT+bZUIk65fB8UVvBX/8Dt1IRPA5E69kKiQ41b5KfsKXZA6Z5hW+@lists.infradead.org
X-Gm-Message-State: AOJu0YzJYFwBdeAnYl9QueNij7sEUujSDz0/fEBrJhaehaUXg2Ua5FtT
	J7nkm42jujCvyJTBHFUc2nvB0khQ6f7aZjk9mLNeTXwArz8prqs8o6V/G4MXlLGSNJTq3slXnY8
	go90HDrHI0g9U482prFAwJHf1Z3NaEbg=
X-Gm-Gg: ATEYQzyQ3UDAa3jKXbrw1WUqk3gtflmolCwG0lYXl8mVh2tUKYKWACBUTCya4Hl4JMt
	PqfM1F41OWRnQWV5ihPLGc0gXEa3g+GBD4A1KMXJ3aDkH8Tkqgm3Lkpg9ma6+GbSE6RYK1dGRrT
	Bf03/xUK4ZSuRz366h/akfge8+enq259jWH755fXvyS1g/fN5lENMPYlRaU7dGXuG8CJTgYlJ6z
	GYePz0xgbZrCGejLJMpdcGQP4Q8HQgAJJmDmNFGfeanIl4tP2j/z8j2cSyJ19vnD2A6hQvFErnp
	OPVtsyBbFrYGSQBI4nPZmybNgDbojleoD3Ph5hY=
X-Received: by 2002:a05:6000:200c:b0:439:9282:e728 with SMTP id
 ffacd0b85a97d-439c7f64ff6mr8318259f8f.2.1772684664323; Wed, 04 Mar 2026
 20:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20260304025521.210377-1-dennis@ausil.us> <20260304025521.210377-4-dennis@ausil.us>
In-Reply-To: <20260304025521.210377-4-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Wed, 4 Mar 2026 22:24:13 -0600
X-Gm-Features: AaiRm53bqxmyn-czRCDphwYeS1JqLKfQ7eIga1HoF08yLPfZl8dXBWFpfflHnow
Message-ID: <CALWfF7KYSML_W_1Wn=jESepQo7sN1qZyaXQk_rqX5ZGowQw=-Q@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_202427_226770_89CD53AB 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, Mar 3, 2026 at 8:55=E2=80=AFPM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S). The Pro
> differs from the base Orange Pi 5 in the following ways:
>
> - No SPI NOR flash; eMMC module slot instead, you can optionally solder
>   a SPI NOR fin place and turn off the eMMC
> - PCIe-attached NIC (pcie2x1l1) replaces the GMAC1 ethernet
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth via uart9 with full RTS/CTS
> - Two-colour (blue/green) GPIO LED using modern color/function binding
> - audio is wired up differently
>
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
>  2 files changed, 377 insertions(+)
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
> index 000000000000..d656328c906d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,376 @@
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
> +               /delete-property/ ethernet0;
This looks the same as the V1. Can you send the updated version.

> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> +       /delete-node/ pwm-leds;
> +
> +       /*
> +        * Pro uses i2s2 (i2s2m1 mux) for audio, not i2s1. Recreate the s=
ound
> +        * card node pointing at i2s2_2ch instead.
> +        */
> +       /delete-node/ analog-sound;
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
> +       fan: pwm-fan {
> +               compatible =3D "pwm-fan";
> +               #cooling-cells =3D <2>;
> +               cooling-levels =3D <0 50 100 150 200 255>;
> +               fan-supply =3D <&vcc5v0_sys>;
> +               pwms =3D <&pwm2 0 20000000 0>;
> +       };
> +
> +       gpio-leds {
> +               compatible =3D "gpio-leds";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&leds_rgb>;
> +
> +               blue-led {
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +
> +               green-led {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_ACTIVITY;
> +                       gpios =3D <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "mmc0";
> +               };
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
> +
> +       vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_pcie20";
> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       vcc3v3_pcie_eth: regulator-vcc3v3-pcie-eth {
> +               compatible =3D "regulator-fixed";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_pcie_eth";
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +};
> +
> +/* disable gmac1 as the pro has a PCIe attached NIC */
> +&gmac1 {
> +       status =3D "disabled";
> +};
> +
> +/* 40-pin header pins 3/5 */
> +&i2c1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c1m4_xfer>;
> +       status =3D "okay";
> +};
> +
> +/*
> + * Pro routes audio codec via i2c3 (not i2c6) and i2s2m1 (not i2s1m0).
> + * Delete the inherited es8388 node from i2c6 and redeclare it here.
> + */
> +/delete-node/ &es8388;
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
> +/* 40-pin header pins 27/28 */
> +&i2c4 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c4m3_xfer>;
> +       status =3D "okay";
> +};
> +
> +/*
> + * i2s1_8ch uses i2s1m0 which occupies GPIO4_PA0 (CLKREQ#) and GPIO4_PA1
> + * (WAKE#) needed for the NVMe M.2 slot. Disable it; audio is on i2s2_2c=
h.
> + */
> +&i2s1_8ch {
> +       status =3D "disabled";
> +};
> +
> +/* Audio codec on i2s2, m1 mux; add mclk pin to the base pinctrl */
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
> +       vpcie3v3-supply =3D <&vcc3v3_pcie_eth>;
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
> +       gpio-leds {
> +               leds_rgb: leds-rgb {
> +                       rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>,
> +                                       <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull=
_none>;
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
> +/* pwm0 pin conflicts with i2c4 pin 27 Pro */
> +&pwm0 {
> +       status =3D "disabled";
> +};
> +
> +&pwm2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm2m1_pins>;
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
> +       disable-wp;
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
> +/* USB2 OTG PHY for usb_host0_xhci; phy-supply enables VBUS to USB3 Type=
-A port */
> +&u2phy0_otg {
> +       phy-supply =3D <&vcc5v0_otg>;
> +};
> +
> +/* Pro has no FUSB302; the USB-C port is power delivery only */
> +/delete-node/ &usbc0;
> +
> +/*
> + * The Pro's USB-C port is power delivery only: no FUSB302, no data line=
s,
> + * no alt-mode switching. The parent DTSI enables usbdp_phy0 (status =3D=
 "okay")
> + * and adds FUSB302 alt-mode/orientation properties; delete those here.
> + *
> + * dp-lane-mux =3D <0 1>: PHY lanes 0/1 are DP (physically routed to the
> + * LT8711UXD DP=E2=86=92HDMI2 bridge), lanes 2/3 are USB3 SuperSpeed (ph=
ysically
> + * routed to the USB3 Type-A port P3). Without this property the driver
> + * defaults to USB-only mode and places USB3 on lanes 0/1, which do not
> + * reach the Type-A connector and makes the USB3 port non-functional.
> + */
> +&usbdp_phy0 {
> +       rockchip,dp-lane-mux =3D <0 1>;
> +       /delete-property/ mode-switch;
> +       /delete-property/ orientation-switch;
> +       /delete-property/ sbu1-dc-gpios;
> +       /delete-property/ sbu2-dc-gpios;
> +       /delete-node/ port;
> +};
> +
> +/* USB3 Type-A port*/
> +&usb_host0_xhci {
> +       dr_mode =3D "host";
> +       /delete-property/ usb-role-switch;
> +       status =3D "okay";
> +       /delete-node/ port;
> +};
> +
> +/*
> + * combphy2_psu is shared between usb_host2_xhci (USB3) and pcie2x1l1 (P=
CIe).
> + * Disable USB3 so the PHY can be used for the NVMe M.2 slot.
> + */
> +&usb_host2_xhci {
> +       status =3D "disabled";
> +};
> --
> 2.53.0
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

