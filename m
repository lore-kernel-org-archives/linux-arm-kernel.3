Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E44FCF6BF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DTASrcB9a3DtGhsTNpuRZ4W40+TvLvMMvh2+yPKPS4=; b=q7PKfFQADLcHJXwhgArHW1Ndv+
	KaUaZCD5Ix012bY/r9sDUzr6IvR0BXpTy+kLlPTKjZI7svjMa9V7BcFeUBIxeXiIpEYj6XFPKNW9h
	AH8yh5OESAonHf2Y50dSGWprM5d+6g+mbY/MOtyq50jwL16Wgp0/29jmWudGYWMNf3JTOKl5xr9RM
	vw8VZWlSaF07qLg9kT0tAN71NAwngqhEy8XWedYmpFJ/unHi+heClUewVhiQAHyNe9+ayqu5auiBF
	nRFaDxj4Ohpa1+hC1UJ7iqRu45M1GXmsUCTR4t/blBFzH1dqz+M104ZJarClpkh8vHtKdFGqCV8Ih
	id+fLC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOOx-0000000EKpR-3sv9;
	Wed, 07 Jan 2026 07:56:19 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOOv-0000000EKoa-0Uyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 07:56:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so23733201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 23:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767772575; x=1768377375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DTASrcB9a3DtGhsTNpuRZ4W40+TvLvMMvh2+yPKPS4=;
        b=iExBQrwABnPVWuCLxxeODyFdSQjnQgQh6w2t0h7KviVrScgcDOLk6AQjwtHUoe9MCT
         Pm4KxsOjF4QUVglccvXZYKE4X9GtksA4zTQQp+kdiyygY/nCrnKFwKhqlJmn38BZDUVh
         uetWta7SNv7dvD1Ys2jIV2BmkWYwp2/q3yLe/FCq5QJBPYgx09k+2K5j5afKjbHb1BmQ
         imNlKfW8rRncXTzlVaQtRf3hQwmAYZl4pmV55yy60mW5HRoTT+0oEr+5kR+GV1PPIt5s
         VBFtGaRChKhULF1mb5qMZcPoTFdYnHO/JrCeqRsMYNhFcYGql7KDlvu9S3UxSeJ5vKxt
         SRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767772575; x=1768377375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3DTASrcB9a3DtGhsTNpuRZ4W40+TvLvMMvh2+yPKPS4=;
        b=wmkOVSglgL6E5sjweFYrxZbHqPNA2wXCQViIsoXzCD45u7aMX/Cbhm2eHlfHeVNUiw
         gHgvbtoLhae1jaxnhy8xq3lUOnf/kqtRvT9NohzmJXPykY+CiFIQbmryfzVWsImXu8yP
         tyR3J6u2dn4qVOhOZsT7lakve0bJK0qaBx9Br4K9kz4v7T3Yb7zV/mjrLxCq1b8Hj1/A
         3ZMv0WhuW3ydTEErxGdM7FKALL0by78BRn/VcWXLbamo771nIGDFT3fTo7Rr6sDAlZL3
         1jRyMLs3CmR05md6LNdagLNdi2wbpd7o1Xbz9OkHF2riC5W6BP9zfNVSw1xJy4rOxKIk
         w9rA==
X-Forwarded-Encrypted: i=1; AJvYcCUK5XNCUAEpOEalh52kHKtasmgmbc+DOjemekTvgM2dhZ5nlFBRedcivywQ0xNvxIXYbssRwW/9VAIwa+SgS4v8@lists.infradead.org
X-Gm-Message-State: AOJu0YzXS9/oqTEEgEUwMHfXvvZD4SS/mPtf570eyUwLOFiu6TStXUzl
	620o/HAn+VLkd33z2EXoO62FBsDmweXwZ8GEcbgZGUFaUg5HAh6S9nSm95vDXrzR6npTuvDDS5e
	m71xQy/gYA2rlsdrRmu6MU/66TdQ5bNo=
X-Gm-Gg: AY/fxX7IXC25BZkd+8+e0zXopbGFZEOksspJYOtRVAQ/Q7GmK0YJ0nVDU1rAfdKyNkf
	7Mr5tR9qVVOqShL+gGsiZfBz/Z+phoVIbAyO0MhF9BJ74PylUfA95Mprs4Z09/TJBYpnC0Cj5WR
	8ED2e9ELswNp3ZrdNlXcSr8q11wMXKxT60c/a/HDQZCGkNBi5GMpuId8i2u6XY9o+Is1ZRx0yzy
	lh6KS7tfDCDJyqohmoq20b6SdDawOLSgphQ63oOqWC5VCH4RmCWR7vxoR/WyZIuoVn7o5K+F/s7
	Qjbqt8AwUO2lrH+1LUKbUG8OXyVX
X-Google-Smtp-Source: AGHT+IHFjV7kLM1AiPWQgyoWq7uzV4cDoyZWDBntrvU7I8gWA/YGDgMa+xWIQA+sod3Jk8qpYeR1jqdWdafYaaPwS9s=
X-Received: by 2002:a05:622a:2505:b0:4ec:f452:4ec0 with SMTP id
 d75a77b69052e-4ffb4a5857amr21112681cf.69.1767772575278; Tue, 06 Jan 2026
 23:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20260107070322.323-1-kernel@airkyi.com> <20260107070322.323-3-kernel@airkyi.com>
In-Reply-To: <20260107070322.323-3-kernel@airkyi.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 Jan 2026 11:56:04 +0400
X-Gm-Features: AQt7F2pb6U4UIptyLijHrQWFaH6FXNXWfSGKkmab3Sdn6tukcH2624J-11Az_XM
Message-ID: <CABjd4Yw1Dqsa9EsMRFT8LOvyU8QN1C8VP+j0tY6h1uJhhXRSSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>, 
	John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_235617_172241_B2FB489C 
X-CRM114-Status: GOOD (  23.29  )
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

Hi Chaoyi,

On Wed, Jan 7, 2026 at 11:04=E2=80=AFAM Chaoyi Chen <kernel@airkyi.com> wro=
te:
>
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>
> General features for rk3576 evb2 board:
>     - Rockchip RK3576
>     - LPDDR4/4X
>     - eMMC5.1
>     - RK806-2x2pcs + DiscretePower
>     - 1x HDMI2.1 TX / HDMI2.0 RX
>     - 1x full size DP1.4 TX (Only 2 Lanes)
>     - 2x 10/100/1000M Ethernet
>     - 5x SATA3.0 7Pin Slot
>     - 2x USB3.2 Gen1 Host
>     - 3x USB2.0 Host
>     - WIFI/BT
>     - ...
>
> Tested with eMMC/SDMMC/HDMI/USB/Ethernet/WIFI/BT module.
>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>
> Changes in v2:
> - Enable hdmi_sound and sai6.
> - Add more cpu-supply.
> - Use regulator to control sata power.
> - Remove "cap-mmc-highspeed" prop in sdmmc.
> - Add regulator supply for ufshc.
> - Add the missing vcc3v3_hubreset regulator.
> - Add otg capability for usb_drd0_dwc3.
>
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 997 ++++++++++++++++++
>  2 files changed, 998 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index c7617e06e1c1..cff95657d406 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-wolfvision-pf=
5-io-expander.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5-v1.2-wifibt.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb2-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-luckfox-omni3576.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-roc-pc.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm6=
4/boot/dts/rockchip/rk3576-evb2-v10.dts
> new file mode 100644
> index 000000000000..52788c514ec0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
> @@ -0,0 +1,997 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +       model =3D "Rockchip RK3576 EVB2 V10 Board";
> +       compatible =3D "rockchip,rk3576-evb2-v10", "rockchip,rk3576";
> +
> +       aliases {
> +               ethernet0 =3D &gmac0;
> +               ethernet1 =3D &gmac1;
> +       };
> +
> +       chosen: chosen {
> +               stdout-path =3D "serial0:1500000n8";
> +       };
> +
> +       adc_keys: adc-keys {
> +               compatible =3D "adc-keys";
> +               io-channels =3D <&saradc 1>;
> +               io-channel-names =3D "buttons";
> +               keyup-threshold-microvolt =3D <1800000>;
> +               poll-interval =3D <100>;
> +
> +               button-back {
> +                       label =3D "back";
> +                       linux,code =3D <KEY_BACK>;
> +                       press-threshold-microvolt =3D <1235000>;
> +               };
> +
> +               button-menu {
> +                       label =3D "menu";
> +                       linux,code =3D <KEY_MENU>;
> +                       press-threshold-microvolt =3D <890000>;
> +               };
> +
> +               button-vol-down {
> +                       label =3D "volume down";
> +                       linux,code =3D <KEY_VOLUMEDOWN>;
> +                       press-threshold-microvolt =3D <417000>;
> +               };
> +
> +               button-vol-up {
> +                       label =3D "volume up";
> +                       linux,code =3D <KEY_VOLUMEUP>;
> +                       press-threshold-microvolt =3D <17000>;
> +               };
> +       };
> +
> +       hdmi-con {
> +               compatible =3D "hdmi-connector";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_con_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_out_con>;
> +                       };
> +               };
> +       };
> +
> +       leds: leds {
> +               compatible =3D "gpio-leds";
> +
> +               work_led: led-0 {
> +                       gpios =3D <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_pwren>;
> +
> +               /*
> +                * On the module itself this is one of these (depending
> +                * on the actual card populated):
> +                * - SDIO_RESET_L_WL_REG_ON
> +                * - PDN (power down when low)
> +                */
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> +       };
> +
> +       vbus5v0_typec: regulator-vbus5v0-typec {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vbus5v0_typec";

This might better be renamed, given that last time you mentioned this
board doesn't have a Type-C connector. Perhaps regulator-vbus5v0-otg?

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc5v0_device>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb_otg0_pwren>;
> +       };
> +
> +       vcc12v_dcin: regulator-vcc12v-dcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc12v_dcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +       };
> +
> +       vcc1v2_ufs_vccq_s0: regulator-vcc1v2-ufs-vccq-s0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc1v2_ufs_vccq_s0";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <1200000>;
> +               regulator-max-microvolt =3D <1200000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc1v8_ufs_vccq2_s0: regulator-vcc1v8-ufs-vccq2-s0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc1v8_ufs_vccq2_s0";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               vin-supply =3D <&vcc_1v8_s3>;
> +       };
> +
> +       vcc3v3_hubreset: vcc3v3-hubreset {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_hubreset";
> +               regulator-boot-on;
> +               regulator-always-on;

If this regulator supplies a soldered-on discrete hub and is required
to power it up, won't it be better to describe the hub in the device
tree (see binding at [1]), make the regulator its supply, and perhaps
drop the "regulator-boot-on/regulator-always-on" annotation here,
letting the regulator core deal with its enabling instead?

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/usb/usb-device.yaml

[snip]

Other than these, LGTM - thanks for addressing my comments from v1!
Feel free to include my:

Reviewed-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

