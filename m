Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB5DC2A073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmqnBCjLKn+uK3xNTLhKo5x9wGuwouNlnPaoJpRlKko=; b=ScQotMylvUqX/26kiF1LxHaoSH
	tSruLIwtOFdusVt+OP/MbeEbeMWh+wM6tbb8S7RcIVHe44eZJFlfp5D8KvZYDXrkvcvkijuR3igt7
	vyeWmbDuUGEZt6uER0Ov3FjxO2KQVuUosrFovnsJZoF/C7M6CzIJHWzTYjrvZyFWN0eFH1gq+yJ6G
	mj4Qb2XTQkyWME8IwxJWfqtqWc3HoeeG3mU9/iB/PTzT9wIp3Hv+NrzY8Zrpf/n/exVRnqOvqF+ka
	X1mSFT+pfh7lwkOsYCQBphJ5YzZ5/yiIfuUGQhyJcixYC86qWrDHhCVBpeue/N9FJ9NGSBZMS1wtE
	W1a2ilOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIfQ-0000000A5ZS-1R0Y;
	Sun, 04 Jan 2026 07:36:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIfN-0000000A5Yj-0lZD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 07:36:46 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4ee13dc0c52so118206731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 23:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767512201; x=1768117001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmqnBCjLKn+uK3xNTLhKo5x9wGuwouNlnPaoJpRlKko=;
        b=QaErLwHJpwsXB6ZqJaf6yMY6m/PIKmtDHWrz3Pq8ryFkyvljaEfb+AmSgQ+W+r0rH1
         G+CXlnGy4Rg3FIrotOygeoC8RTqzbZD2FYKMFImEJfzrbpcUcBL6O6S+IzA7/1TLHvIr
         WoQ1KZ8AVp0XjZTEF5J9UDp9DvvfvniDd2FaKQh5e/mMiHXFpeKkRePo24xfIhsLbaHa
         nUy3K4ZVxEyH11ed5XdEGQUtHQ/EXzNZssLw7C+uOEWIBnMXThf+o9L1MleZk1owCNXQ
         qTHK2Nqm/b8KzbapP/cQtoKe917ntwePxCt8YcZS4HgHq0QDBWN1FnQ2CxPXJLlPtV3I
         l0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767512201; x=1768117001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GmqnBCjLKn+uK3xNTLhKo5x9wGuwouNlnPaoJpRlKko=;
        b=nJALopLNYUqSkonCIaez2h03HjLXoZJ0waFBuZOJy801tfsjDC2SwxWjPuBemLBoc0
         ws2kgxjCe1OT/qtPFrPseATnh6M4zg7HSAzm74uokxZJb8X1mSnMMPtwTmvz9X3VHklc
         5N7kMM4IY3o1VHZh0I51R7mhhgLPpgHBC/fUHekC4qR5zCCyA4V3hNL0g0TH8iOwn4no
         kaTfkxiTm7l6vLuP4N+WbhjpZKZtB31tkGHWTjiddc59Lj2gfg31OmaG6/My0u5w4Ot3
         HDId/Oizqj7KPBSTjdQnABg0WPuxHlbeOUe0Zh4g3GkROjh+FEZTIGED8c7bWGb12RQ5
         Cksw==
X-Forwarded-Encrypted: i=1; AJvYcCVD7m0ZsMV5WWOFYsAMNfM34AVyEunRRsmkyYyBzBJs8qXNT/6BlY0/yJCLxuJTIzehmOYl7/YII5vb/OsJWGwp@lists.infradead.org
X-Gm-Message-State: AOJu0YxplbNgVxgTOhlMepCkZwbWiCiQoAkTM3BmJj23RfAkk3ckesSx
	wNMg5Hcq8zp9hOQ0PiiayYSYMpndKyLm5GNFBKnNWV2FRvC9jL423JoH0GuRbUONjxcWJVd8ngr
	I389yoyExbMqzNSpy7osFbSpZifsN+Ac=
X-Gm-Gg: AY/fxX4HNxX858nIgB3c8bjY5UTlvGlU6LsIaI2w8KNiig0Ecb1UQcHKjoke/x+QPIR
	SBNoGVnkH9VOM5h7M+Th1lL/MfZ+bIavnBUBOjQiAXvKTg++KuuldsnxfwiOPdT74Q9UdlL7++1
	I5AT1ymPUE1LtDV3F/0ISCQFjox8H2impZd3vpNOpjRdumt5Bl3E94w0BJcgHVPl4RwYvdDXEd5
	KrVxjWE1FNbzgBukE4TGl5mmBTtQv6gyyjTtbNVRTxXZje106zLAEKIboEAHP9tZyS9Bp6avBUx
	U1506xB0arco8/JvIc5EkuP10is+
X-Google-Smtp-Source: AGHT+IGrsW62Al3aJuCDnuBfm/t39SMGxjHkOofY0c2gUzug0zLhuu8TUVKb/NbEMxoUIwCQgto1dqmNDIFAzxybC5A=
X-Received: by 2002:a05:622a:7c98:b0:4f4:c109:d174 with SMTP id
 d75a77b69052e-4f4c109d617mr368149561cf.50.1767512201208; Sat, 03 Jan 2026
 23:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20260104023703.118-1-kernel@airkyi.com> <20260104023703.118-3-kernel@airkyi.com>
In-Reply-To: <20260104023703.118-3-kernel@airkyi.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 4 Jan 2026 11:36:28 +0400
X-Gm-Features: AQt7F2qeA748ogFRCF1THMpniWiGKkX_pL1jaRe7bEHgkGydTPWAu_29hRBp4mc
Message-ID: <CABjd4Yz6Hp780DU_Z8j6D0-gQfT_ag86N8Vv=Q4TxUait_6-Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
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
X-CRM114-CacheID: sfid-20260103_233645_358193_7F46E9EF 
X-CRM114-Status: GOOD (  20.98  )
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

On Sun, Jan 4, 2026 at 6:38=E2=80=AFAM Chaoyi Chen <kernel@airkyi.com> wrot=
e:
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

Would you like to highlight which features are tested/enabled with
this version of the DTS? That might help set the expectations right
for whoever tries it out.

> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 941 ++++++++++++++++++
>  2 files changed, 942 insertions(+)
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
> index 000000000000..4f7d9f2027ca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
> @@ -0,0 +1,941 @@
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
> +       vcc3v3_lcd_n: regulator-vcc3v3-lcd0-n {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_lcd0_n";
> +               regulator-boot-on;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_3v3_s0>;
> +       };
> +
> +       vcc3v3_pcie1: regulator-vcc3v3-pcie1 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_pcie1";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> +               startup-delay-us =3D <5000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc3v3_rtc_s5";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc5v0_device: regulator-vcc5v0-device {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_device";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc5v0_host: regulator-vcc5v0-host {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_host";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc5v0_device>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb_host_pwren>;
> +       };
> +
> +       vcc_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc12v_dcin>;
> +       };
> +
> +       vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_1v1_nldo_s3";
> +               regulator-boot-on;
> +               regulator-always-on;

The name says "S3", so isn't it supposed to be able to go off in S5?
Then perhaps only "regulator-boot-on" is needed, but not
"regulator-always-on"?

> +               regulator-min-microvolt =3D <1100000>;
> +               regulator-max-microvolt =3D <1100000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_1v8_s0: regulator-vcc-1v8-s0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_1v8_s0";
> +               regulator-boot-on;
> +               regulator-always-on;

Ditto

> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               vin-supply =3D <&vcc_1v8_s3>;
> +       };
> +
> +       vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_2v0_pldo_s3";
> +               regulator-boot-on;
> +               regulator-always-on;

Ditto

> +               regulator-min-microvolt =3D <2000000>;
> +               regulator-max-microvolt =3D <2000000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_3v3_s0: regulator-vcc-3v3-s0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_3v3_s0";
> +               regulator-boot-on;
> +               regulator-always-on;

Ditto

> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc_ufs_s0: regulator-vcc-ufs-s0 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_ufs_s0";
> +               regulator-boot-on;
> +               regulator-always-on;

Ditto

> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +};
> +
> +&cpu_l0 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_b0 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};

Shall we list all of &cpu_l{0,1,2,3} and &cpu_b{0,1,2,3} here for completen=
ess?

> +&combphy0_ps {
> +       status =3D "okay";
> +};
> +
> +&combphy1_psu {
> +       status =3D "okay";
> +};
> +
> +&gmac0 {
> +       clock_in_out =3D "output";
> +       phy-mode =3D "rgmii-rxid";
> +       phy-handle =3D <&rgmii_phy0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&eth0m1_miim
> +                    &eth0m1_tx_bus2
> +                    &eth0m1_rx_bus2
> +                    &eth0m1_rgmii_clk
> +                    &eth0m1_rgmii_bus>;
> +       tx_delay =3D <0x1d>;
> +       status =3D "okay";
> +};
> +
> +&gmac1 {
> +       clock_in_out =3D "output";
> +       phy-handle =3D <&rgmii_phy1>;
> +       phy-mode =3D "rgmii-rxid";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&eth1m0_miim
> +                    &eth1m0_tx_bus2
> +                    &eth1m0_rx_bus2
> +                    &eth1m0_rgmii_clk
> +                    &eth1m0_rgmii_bus>;
> +       tx_delay =3D <0x1e>;
> +       status =3D "okay";
> +};
> +
> +&gpu {
> +       mali-supply =3D <&vdd_gpu_s0>;
> +       status =3D "okay";
> +};
> +
> +&hdmi {
> +       status =3D "okay";
> +};
> +
> +&hdmi_in {
> +       hdmi_in_vp0: endpoint {
> +               remote-endpoint =3D <&vp0_out_hdmi>;
> +       };
> +};
> +
> +&hdmi_out {
> +       hdmi_out_con: endpoint {
> +               remote-endpoint =3D <&hdmi_con_in>;
> +       };
> +};

Would you like to enable &hdmi_sound and &sai6 here, or is there a
reason not to?

> +&hdptxphy {
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +
> +       rk806: pmic@23 {
> +               compatible =3D "rockchip,rk806";
> +               reg =3D <0x23>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pmic_pins>, <&rk806_dvs1_null>,
> +                           <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +               system-power-controller;
> +
> +               vcc1-supply =3D <&vcc_sys>;
> +               vcc2-supply =3D <&vcc_sys>;
> +               vcc3-supply =3D <&vcc_sys>;
> +               vcc4-supply =3D <&vcc_sys>;
> +               vcc5-supply =3D <&vcc_sys>;
> +               vcc6-supply =3D <&vcc_sys>;
> +               vcc7-supply =3D <&vcc_sys>;
> +               vcc8-supply =3D <&vcc_sys>;
> +               vcc9-supply =3D <&vcc_sys>;
> +               vcc10-supply =3D <&vcc_sys>;
> +               vcc11-supply =3D <&vcc_2v0_pldo_s3>;
> +               vcc12-supply =3D <&vcc_sys>;
> +               vcc13-supply =3D <&vcc_1v1_nldo_s3>;
> +               vcc14-supply =3D <&vcc_1v1_nldo_s3>;
> +               vcca-supply =3D <&vcc_sys>;
> +
> +               rk806_dvs1_null: dvs1-null-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs2_null: dvs2-null-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs3_null: dvs3-null-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun0";
> +               };
> +
> +               rk806_dvs1_slp: dvs1-slp-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun1";
> +               };
> +
> +               rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun2";
> +               };
> +
> +               rk806_dvs1_rst: dvs1-rst-pins {
> +                       pins =3D "gpio_pwrctrl1";
> +                       function =3D "pin_fun3";
> +               };
> +
> +               rk806_dvs2_slp: dvs2-slp-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun1";
> +               };
> +
> +               rk806_dvs2_pwrdn: dvs2-pwrdn-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun2";
> +               };
> +
> +               rk806_dvs2_rst: dvs2-rst-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun3";
> +               };
> +
> +               rk806_dvs2_dvs: dvs2-dvs-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun4";
> +               };
> +
> +               rk806_dvs2_gpio: dvs2-gpio-pins {
> +                       pins =3D "gpio_pwrctrl2";
> +                       function =3D "pin_fun5";
> +               };
> +
> +               rk806_dvs3_slp: dvs3-slp-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun1";
> +               };
> +
> +               rk806_dvs3_pwrdn: dvs3-pwrdn-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun2";
> +               };
> +
> +               rk806_dvs3_rst: dvs3-rst-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun3";
> +               };
> +
> +               rk806_dvs3_dvs: dvs3-dvs-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun4";
> +               };
> +
> +               rk806_dvs3_gpio: dvs3-gpio-pins {
> +                       pins =3D "gpio_pwrctrl3";
> +                       function =3D "pin_fun5";
> +               };
> +
> +               regulators {
> +                       vdd_cpu_big_s0: dcdc-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-name =3D "vdd_cpu_big_s0";
> +                               regulator-enable-ramp-delay =3D <400>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_npu_s0: dcdc-reg2 {
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-name =3D "vdd_npu_s0";
> +                               regulator-enable-ramp-delay =3D <400>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_cpu_lit_s0: dcdc-reg3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-name =3D "vdd_cpu_lit_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vcc_3v3_s3: dcdc-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcc_3v3_s3";
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +
> +                       vdd_gpu_s0: dcdc-reg5 {
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <900000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-name =3D "vdd_gpu_s0";
> +                               regulator-enable-ramp-delay =3D <400>;
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
850000>;
> +                               };
> +                       };
> +
> +                       vddq_ddr_s0: dcdc-reg6 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-name =3D "vddq_ddr_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_logic_s0: dcdc-reg7 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <800000>;
> +                               regulator-name =3D "vdd_logic_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcc_1v8_s3: dcdc-reg8 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcc_1v8_s3";
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       vdd2_ddr_s3: dcdc-reg9 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-name =3D "vdd2_ddr_s3";
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_ddr_s0: dcdc-reg10 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +                               regulator-name =3D "vdd_ddr_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca_1v8_s0: pldo-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca_1v8_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca1v8_pldo2_s0: pldo-reg2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca1v8_pldo2_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_1v2_s0: pldo-reg3 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <1200000>;
> +                               regulator-name =3D "vdda_1v2_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca_3v3_s0: pldo-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vcca_3v3_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vccio_sd_s0: pldo-reg5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-name =3D "vccio_sd_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca1v8_pldo6_s3: pldo-reg6 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca1v8_pldo6_s3";
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       vdd_0v75_s3: nldo-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-name =3D "vdd_0v75_s3";
> +
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
750000>;
> +                               };
> +                       };
> +
> +                       vdda_ddr_pll_s0: nldo-reg2 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +                               regulator-name =3D "vdda_ddr_pll_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda0v75_hdmi_s0: nldo-reg3 {
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <837500>;
> +                               regulator-max-microvolt =3D <837500>;
> +                               regulator-name =3D "vdda0v75_hdmi_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_0v85_s0: nldo-reg4 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <850000>;
> +                               regulator-max-microvolt =3D <850000>;
> +                               regulator-name =3D "vdda_0v85_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda_0v75_s0: nldo-reg5 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-name =3D "vdda_0v75_s0";
> +
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +
> +       hym8563: rtc@51 {
> +               compatible =3D "haoyu,hym8563";
> +               reg =3D <0x51>;
> +               clock-output-names =3D "hym8563";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rtc_int>;
> +               wakeup-source;
> +               #clock-cells =3D <0>;
> +       };
> +};
> +
> +&mdio0 {
> +       rgmii_phy0: ethernet-phy@1 {
> +               compatible =3D "ethernet-phy-id4f51.e91b";
> +               reg =3D <0x1>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rgmii_phy0_rst>;
> +               reset-assert-us =3D <20000>;
> +               reset-deassert-us =3D <100000>;
> +               reset-gpios =3D <&gpio3 RK_PD3 GPIO_ACTIVE_LOW>;

Do you need to assign a clock here, or does EVB2 use a different PHY
clock arrangement vs. EVB1? See the patch [1] by Sebastian for EVB1

[1] https://lore.kernel.org/linux-rockchip/20250910-rk3576-evb-network-v1-1=
-68ed4df272a2@collabora.com/

> +       };
> +};
> +
> +&mdio1 {
> +       rgmii_phy1: ethernet-phy@1 {
> +               compatible =3D "ethernet-phy-id4f51.e91b";
> +               reg =3D <0x1>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rgmii_phy1_rst>;
> +               reset-assert-us =3D <20000>;
> +               reset-deassert-us =3D <100000>;
> +               reset-gpios =3D <&gpio3 RK_PD6 GPIO_ACTIVE_LOW>;

Ditto

> +       };
> +};
> +
> +&pinctrl {
> +       bluetooth {
> +               bt_reg_on: bt-reg-on {
> +                       rockchip,pins =3D <1 RK_PC7 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +
> +               bt_wake_host: bt-wake-host {
> +                       rockchip,pins =3D <0 RK_PB1 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +
> +               host_wake_bt: host-wake-bt {
> +                       rockchip,pins =3D <1 RK_PD4 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       hym8563 {
> +               rtc_int: rtc-int {
> +                       rockchip,pins =3D <0 RK_PA5 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       network {
> +               rgmii_phy0_rst: rgmii-phy0-rst {
> +                       rockchip,pins =3D <3 RK_PD3 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               rgmii_phy1_rst: rgmii-phy1-rst {
> +                       rockchip,pins =3D <3 RK_PD6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       pcie1 {
> +               pcie1_rst: pcie1-rst {
> +                       rockchip,pins =3D <4 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       sata {
> +               satapm_pwren: satapm-pwren {
> +                       rockchip,pins =3D <4 RK_PC7 RK_FUNC_GPIO &pcfg_ou=
tput_high>;

Should this one become a regulator, instead of just statically
configuring it for high output? This looks fragile: I can imagine a
user toggling GPIOs at random in search for some pin they need, and
suddenly powering down their SATA port, potentially with data loss.
With a pin configured as a fixed voltage regulator the kernel would
say that it's in use in such a scenario.

> +               };
> +       };
> +
> +       usb {
> +               usb_host_pwren: usb-host-pwren {
> +                       rockchip,pins =3D <0 RK_PC3 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usb_otg0_pwren: usb-otg0-pwren {
> +                       rockchip,pins =3D <0 RK_PD1 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usbc0_int: usbc0-int {
> +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pu=
ll_up>;

You don't seem to be requesting this pin config from anywhere, do you?
Does EVB2 use a HUSB311 chip lacking mainline Linux support, like EVB1
does?

> +               };
> +       };
> +
> +       wifi {
> +               wifi_host_wake: wifi-host-wake {
> +                       rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +
> +               wifi_pwren: wifi-pwren {
> +                       rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +};
> +
> +&sata0 {
> +       pinctrl-0 =3D <&satapm_pwren>;
> +       pinctrl-names =3D "default";
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
> +       no-sd;
> +       no-mmc;
> +       non-removable;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       brcmf: wifi@1 {
> +               compatible =3D "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names =3D "host-wake";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake>;
> +       };
> +};
> +
> +&sdhci {
> +       bus-width =3D <8>;
> +       full-pwr-cycle-in-suspend;
> +       max-frequency =3D <200000000>;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
> +       no-sdio;
> +       no-sd;
> +       non-removable;
> +       status =3D "okay";
> +};
> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-mmc-highspeed;

This seems to contradict the "no-mmc" just below, remove perhaps?

> +       cap-sd-highspeed;
> +       disable-wp;
> +       max-frequency =3D <200000000>;
> +       no-sdio;

Can't this SD slot support an external SDIO card?

> +       no-mmc;
> +       sd-uhs-sdr104;
> +       vqmmc-supply =3D <&vccio_sd_s0>;
> +       status =3D "okay";
> +};
> +
> +&saradc {
> +       vref-supply =3D <&vcca_1v8_s0>;
> +       status =3D "okay";
> +};
> +
> +&u2phy0 {
> +       status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +       phy-supply =3D <&vbus5v0_typec>;
> +       status =3D "okay";
> +};
> +
> +&u2phy1 {
> +       status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +       phy-supply =3D <&vcc5v0_host>;
> +       status =3D "okay";
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> +
> +&uart4 {
> +       pinctrl-0 =3D <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
> +       pinctrl-names =3D "default";
> +       uart-has-rtscts;
> +       status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm43438-bt";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "lpo";
> +               device-wakeup-gpios =3D <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
> +               pinctrl-0 =3D <&bt_reg_on &bt_wake_host &host_wake_bt>;
> +               pinctrl-names =3D "default";
> +               shutdown-gpios =3D <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
> +               vbat-supply =3D <&vcc_3v3_s3>;
> +               vddio-supply =3D <&vcc_1v8_s3>;
> +       };
> +};
> +
> +&ufshc {

Given that you have the required regulators defined already, it sounds
like a good idea to reference them here. Something like this perhaps?

+ vcc-supply =3D <&vcc_ufs_s0>;
+ vccq-supply =3D <&vcc1v2_ufs_vccq_s0>;
+ vccq2-supply =3D <&vcc1v8_ufs_vccq2_s0>;

> +       status =3D "okay";
> +};
> +
> +&usbdp_phy {
> +       rockchip,dp-lane-mux =3D <2 3>;

Do you need static lane muxing here, or is it connected to a Type-C DP
AltMode port? You don't seem to be defining a regular DP connector
anywhere (although I realise that there isn't mainline DP support on
RK3576 yet, anyway), but you do mention a Type-C IRQ line in pin
configs.

> +       status =3D "okay";
> +};
> +
> +&usb_drd0_dwc3 {
> +       dr_mode =3D "host";

No OTG capability here? Is it connected somewhere else than USB2.0
OTG0, where you link up an OTG regulator?

> +       status =3D "okay";
> +};
> +
> +&usb_drd1_dwc3 {
> +       dr_mode =3D "host";
> +       status =3D "okay";
> +};
> +
> +&vop {
> +       status =3D "okay";
> +};
> +
> +&vop_mmu {
> +       status =3D "okay";
> +};
> +
> +&vp0 {
> +       vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +               reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> +               remote-endpoint =3D <&hdmi_in_vp0>;
> +       };
> +};
> --
> 2.51.1

Best regards,
Alexey

