Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BAECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=; b=2jnA3FWKNfDIJqQqVtGK/Bp7wI
	uO6FLK1gojBR1IV6dqxlUi1dCgjJcHv9UhtX66eE8CjbXP8BjisIMRHjd3y84w//5hq1/WSlkCYX8
	GdU0BzD4gIZSer0jFIE2SuMNpkevQe43Ev/yKfIJfdQXD/c5/VYl3mM+sMLU5LKghrD5/174FT2Sx
	LVeoPwWiCQ+71o3sFsMy7jobx7XcVCEUJTe40s4VyTt1jiUGixIQOXGyCLO14HlNHnzv98cGYYMKT
	76+zpGpexIbtzAp7xSFK4ug8GcdWRSXC90gX2wOvWip7P0QnKEpgZ2fjDAK7F6jdfx5CrWgus2/cX
	weZXXBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL09f-000000047Xm-3Uzb;
	Thu, 07 May 2026 14:56:47 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL09c-000000047We-0j05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:56:46 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-50fb1ad3734so22251401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778165802; cv=none;
        d=google.com; s=arc-20240605;
        b=TjX8KjwuZJQw42YmPRiPk6dXs0xJeNO8WNezzu4uW0hyf04Y6Rt1cV0dEx+msxuy0B
         DfL7oF5056vXgAF6MIW6M4n+h4+zX2qoCxspJnsOOCk8uQU6EYXFFCAojvvC73pSJRLf
         JnRYDEmU2/NihFeZ5oiHOQ7IFANAm1l7C6/RlhQZJyNU5p6xEoF2rNpi6nqxGG/4pybc
         3sOfaJ8jjQ98bmbQV/X2N/ixn6YwdfVLajoBsjJTvHTezkXtFLNsT0HtrO09AxmPoatG
         trMjdl+DtsK2PCP3jxxIHj+EBXrgF2KBQX5gc2PNYs+L0JIfFxaWOrNcrHrVN0dH7AeY
         yLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        fh=grU5j2M5JAlKzs5CGyjZ7ZfXka2hHPbFuywQDeAM6bc=;
        b=KkYjXFuZQl4R5RitB+BgxONnx3yfG8bMJrjy43kW2E3ialx4oCxVJT9c0fueCAp58E
         EwHKr5L7GEGVCFUpnzjZ5DRF76gZkbmOxFlhGhQz21PGWAY3U+JxDulS96xR/d+OtGZZ
         0CaxtAl1N+tvaAyzI+JfBadgTbS7yByCOITvK6tmOf3LTRyRV0n0knj0QefZ+eZRxIaD
         KWDRFitK776iB86Qeo6dnfKebhRvxvusGIa6dDJeSVq2KpRTO1aJIKLMNLUMTKX88lp4
         sFo/3CQTTYh7zI/aswZB5Q2hDOvcJgphUvrIBtxRi27w/rCyejBRVPKaF3r2kFORwqsZ
         jAFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778165802; x=1778770602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        b=aJ+VEREOcdfaIvpgK96ASHIdZeZe/Wj5k4UbPAQVx66WUOx85MLNza5TAoGoGGtdEB
         Nz8UyO+HlykrVVJfuZW1Bo11aUCMDQmFU+MEzF+RMAS2aevOdn1WPt2MFC+t9MSrG0Ob
         ScvMelpzijF7KbcHg2xHEwDRi01l1pTa1gcYlpB8GDRaDKFeCOvIqP3Pcd8IqXn4bIgp
         P3GUnwgHlyzffeOZRyDZ6Bmk8uUXimwDAKztjJmxSeHwjTPEx6K+9/ohu4snq0F9Y/6p
         wg+Bk889wyidGP43Qn9RgxPMi2PdJTX0oJzKjY+iu0sAHANHt2Va/AbH7BAtEK7ZHSCR
         qf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165802; x=1778770602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ndl3+yfbim4cO8qmcSCh8IE48ZCvWnEZfI+eDsspdGw=;
        b=MqA5WSZdC2uJ66KPGB7C6aIf8YuSSN4W7snKyq96vZ/HCkDoJqYK0t1GhTAnHwJwIl
         u5de6ublI6YPXEm5Io5zu/d2bLJs6ZYIZN4sq7KIQfpHEYG1FgFDSL2zu/yaV7l83vmF
         UiNVQq822/+6ihguwKzG5vYZ6GC0bCx0hnfQ/fM3v7TMMzBfkCDba/Y0284OxMyWCZsm
         Zd24evWEuxp5fg5CXgDGDPkXSXcPVi6s38c+2y82bfqox4dzZdNJLd04nh6Jlbm7VnqK
         8oRvICabrKtdOO8DIWpHSf7RxhWKQlLo92E5T3QTb3+dX4x4qD+B71DWJUeElRj3hMrw
         ofJA==
X-Forwarded-Encrypted: i=1; AFNElJ/QJnHmIlCoydjOMKswUguMwvRc4pjnEXBXMX61As4uywOdY2foNClxGPSxd0qcxcKIRGJ/VGK/uk3CQ9IRqZ4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKvPyVSPmLo10unWT5iDv0GjQ1OMmYz6leX4oH+4+SxU0j9vI
	6ew7x58jB7fYJvpzPMj4ZrMPexqb4WZxwUULRpcmRAryexXOZ88cOx15bezHpm+APo0KX5oBCal
	klyUZND02Zm07HEgqSCDWklP6gOxzJYU=
X-Gm-Gg: AeBDiesqcNk7GO+NUffcqXfMFcSVG5r5DusUVrMMcTMi2z1IlUUkn7oODqCn5G7LTMS
	lNE/+d5arkTmxl0G+Y5J1jUrUqeqvQoDZMemJdRpYta4ENMNZEfmtHFQwGQsn+fPnhOZs4XDwSg
	UL1TqIvZAx0HAN5o+RFtIJT9MNCBjx5+kRAN2clKRqbWlKlbH78ITmyDqEVKl+yQxn+X0eyGAgR
	il4Se1DsGBjlfYcLIUYgJHCsJ+ALf4mcHaF/ZxB0M8E37K02U4mS2Pgaw3JbIi3e5UhMBDFc6ha
	cjpmJuwd5tn1aeNDEHKJKkr654tdxwll3jGELgLsGakHWcQoXPs=
X-Received: by 2002:ac8:58d2:0:b0:50e:4307:37b6 with SMTP id
 d75a77b69052e-51475c4921emr37743311cf.23.1778165802009; Thu, 07 May 2026
 07:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 7 May 2026 18:56:30 +0400
X-Gm-Features: AVHnY4LFH2dNRHafMTXJ36QxVkrIwbUVtI9Whf69J7fZb4oxWrN12tLl7emQ200
Message-ID: <CABjd4YzNQCwtxz+v474vrS0fCO2AZz+bNCQ+4F5afTeAUpad7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
To: Liu Changjie <liucj1228@outlook.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075644_335181_ADE7F7D3 
X-CRM114-Status: GOOD (  26.15  )
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

On Thu, May 7, 2026 at 5:28=E2=80=AFPM Liu Changjie <liucj1228@outlook.com>=
 wrote:
>
> Add the device tree for LCKFB Taishan Pi 3M, a board based on
> the Rockchip RK3576 SoC.

Hi Liu Changjie,

Is the below link the correct source for the schematic for this board?
It would be helpful to add in the commit description. I'm assuming
that it is for the purposes of the comments below.

Link: https://oshwhub.com/li-chuang-kai-fa-ban/project_gzzvrwqn

> Signed-off-by: Liu Changjie <liucj1228@outlook.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3576-lckfb-tspi-3m.dts     | 711 ++++++++++++++++++
>  2 files changed, 712 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index cb55c6b70d0e..dedadc22d15a 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -171,6 +171,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10-pcie1.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb2-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-khadas-edge-2l.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-lckfb-tspi-3m.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-luckfox-omni3576.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-nanopi-r76s.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
> new file mode 100644
> index 000000000000..2eaa6969b33f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
> @@ -0,0 +1,711 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 LCKFB
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +       model =3D "LCKFB TaishanPi 3M";
> +       compatible =3D "lckfb,tspi-3m-rk3576", "rockchip,rk3576";
> +
> +       aliases {
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:1500000n8";
> +       };

What about adc-keys for SARADC channel 1 serving the RECOVERY key?

> +       hdmi-con {
> +               compatible =3D "hdmi-connector";
> +               hdmi-pwr-supply =3D <&vcc5v0_hdmi>;

I'm pretty sure that this is not the power supply, but rather the
driving pin for the FRL mode level shifter. Please refer to the recent
patch series [1] by Cristian.

[1] https://lore.kernel.org/linux-rockchip/177800595582.3294944.15259294512=
505640833.b4-ty@sntech.de/T/#m8c2aca86588ae1e32506c4b6302bb6232c5cd14e

> +               type =3D "a";
> +
> +               port {
> +                       hdmi_con_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_out_con>;
> +                       };
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-0 {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_HEARTBEAT;
> +                       gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +       };
> +
> +       vcc5v_dcin: regulator-vcc5v-dcin {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v_dcin";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +
> +       vcc_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               vin-supply =3D <&vcc5v_dcin>;
> +       };
> +
> +       vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_1v1_nldo_s3";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <1100000>;
> +               regulator-max-microvolt =3D <1100000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_2v0_pldo_s3";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <2000000>;
> +               regulator-max-microvolt =3D <2000000>;
> +               vin-supply =3D <&vcc_sys>;
> +       };
> +
> +       vcc_3v3_sdcard: regulator-vcc-3v3-sdcard {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc_3v3_sdcard";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_3v3_s3>;

From the schematic, the SD card is powered directly from VCC_3V3_S0.
No need to define a separate regulator, and please make sure you refer
to the right supply (*S0 is a different line from *S3 with a separate
load switch - although they are still enabled together as the EN pin
of the load switch is hard wired to its VIN)

> +       };
> +
> +       vcc5v0_typec_vbus: regulator-vcc5v0-typec-vbus {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_typec_vbus";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&typec_vbus_en>;
> +       };
> +
> +       vcc5v0_hdmi: regulator-vcc5v0-hdmi {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_hdmi";
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;

This line goes to the FRL level shifter, so it shouldn't be modeled as
a regulator

> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hdmi_con_en>;
> +       };
> +
> +       vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usb20_host";
> +               regulator-always-on;
> +               regulator-boot-on;

Do they have to be always-on, boot-on? You can define a Type-A
connector node and list this regulator as its VBUS supply.

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb20_host_pwr_en>;
> +       };
> +
> +       vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_usb30_host";
> +               regulator-always-on;
> +               regulator-boot-on;

Ditto here.

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               enable-active-high;
> +               gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
> +               vin-supply =3D <&vcc_sys>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb30_host_pwr_en>;
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_poweren_gpio>;
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;

What about the 32 kHz clock? See also below under I2C2 - you'll need
an RTC node which is in fact easy to add.

> +       };
> +};
> +
> +&combphy1_psu {
> +       status =3D "okay";
> +};
> +
> +&cpu_b0 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +       cpu-supply =3D <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_l0 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> +};

Don't you want to add &gmac0? And wire it up to the MAE0621A-Q3C RGMII
PHY (you'll probably have to rely on the generic PHY driver). You'll
probably also need to configure the GMAC for RGMII clock input from
the PHY, which is unlike other RK3576 boards but there are other
Rockchip-based examples upstream.

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

What about &hdmi_sound? And &sai6 for it to work.

> +&hdptxphy {
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +
> +       pmic@23 {
> +               compatible =3D "rockchip,rk806";
> +               reg =3D <0x23>;
> +               #gpio-cells =3D <2>;
> +               gpio-controller;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pmic_pins
> +                            &rk806_dvs1_null
> +                            &rk806_dvs2_null
> +                            &rk806_dvs3_null>;
> +               system-power-controller;
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
> +               regulators {
> +                       vdd_cpu_big_s0: dcdc-reg1 {
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-name =3D "vdd_cpu_big_s0";
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_npu_s0: dcdc-reg2 {
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <950000>;
> +                               regulator-name =3D "vdd_npu_s0";
> +                               regulator-ramp-delay =3D <12500>;
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
> +                               regulator-name =3D "vdd_cpu_lit_s0";
> +                               regulator-ramp-delay =3D <12500>;
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
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +
> +                       vdd_gpu_s0: dcdc-reg5 {
> +                               regulator-boot-on;
> +                               regulator-enable-ramp-delay =3D <400>;
> +                               regulator-min-microvolt =3D <550000>;
> +                               regulator-max-microvolt =3D <900000>;
> +                               regulator-name =3D "vdd_gpu_s0";
> +                               regulator-ramp-delay =3D <12500>;
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
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vcca1v8_pldo6_s3: pldo-reg6 {

This regulator is not listed on the schematic and doesn't seem to be
used. Delete?

> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-name =3D "vcca1v8_pldo6_s3";
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
> +                               regulator-min-microvolt =3D <750000>;
> +                               regulator-max-microvolt =3D <750000>;
> +                               regulator-name =3D "vdd_0v75_s3";
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
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdda0v75_hdmi_s0: nldo-reg3 {

This one is called just VDDA_HDMI_S0 (without 0v75) on the schematic -
consider renaming?

> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <837500>;
> +                               regulator-max-microvolt =3D <837500>;
> +                               regulator-name =3D "vdda0v75_hdmi_s0";
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
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c2m0_xfer>;
> +       status =3D "okay";
> +
> +       usbc0: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&fusb302_int>;
> +               vbus-supply =3D <&vcc5v0_typec_vbus>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +
> +                               usbc0_role_sw: endpoint {
> +                                       remote-endpoint =3D <&usb_drd0_ro=
le_switch>;
> +                               };
> +                       };
> +               };
> +
> +               connector {
> +                       compatible =3D "usb-c-connector";
> +                       data-role =3D "dual";
> +                       label =3D "USB-C";
> +                       power-role =3D "dual";

It's definitely not dual-role. Your VBUS is the output of a load
switch, not routed to any consumers on board. Is the load switch even
reverse current blocking? Consider changing to "source".

> +                       sink-pdos =3D <PDO_FIXED(5000, 1000, PDO_FIXED_US=
B_COMM)>;

Don't think this is helpful for your board.

> +                       source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_=
USB_COMM)>;
> +                       try-power-role =3D "sink";

This doesn't make much sense for your board either. Just keep it
source-only, which would match your hardware.

> +               };
> +       };

Don't you want to define the HYM8563 RTC which sits on the same I2C
bus? You need its 32kHz clock output for the WiFi/BT module to work
correctly.

> +};

What about &i2c3 for the ES8388 audio codec? And &sai1 for it to work.

What about &pcie0 for the miniPCIe slot? And &combphy0_ps for it to
work, along with a fixed regulator to model the 3v3 DCDC buck
converter controlled by the minipcie_pwr_en pin a.k.a. &gpio1 RK_PD6.

> +&pinctrl {
> +       hdmi {
> +               hdmi_con_en: hdmi-con-en {
> +                       rockchip,pins =3D <4 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       wireless-wlan {
> +               wifi_host_wake_irq: wifi-host-wake-irq {
> +                       rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +
> +               wifi_poweren_gpio: wifi-poweren-gpio {
> +                       rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +       };
> +
> +       usb {
> +               fusb302_int: fusb302-int {
> +                       rockchip,pins =3D <0 RK_PB4 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> +               };
> +
> +               typec_vbus_en: typec-vbus-en {
> +                       rockchip,pins =3D <0 RK_PB6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usb20_host_pwr_en: usb20-host-pwr-en {
> +                       rockchip,pins =3D <2 RK_PB5 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               usb30_host_pwr_en: usb30-host-pwr-en {
> +                       rockchip,pins =3D <0 RK_PC3 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +};
> +
> +&saradc {
> +       vref-supply =3D <&vcca_1v8_s0>;

The schematic says VCCA_1V8_PLDO2_S0, which is a different regulator.

> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       bus-width =3D <8>;
> +       full-pwr-cycle-in-suspend;
> +       mmc-hs400-1_8v;
> +       mmc-hs400-enhanced-strobe;
> +       no-sd;
> +       no-sdio;
> +       non-removable;
> +       status =3D "okay";

It might be good to list the supplies explicitly (vcc_3v3_s3 for vcc,
vcc_1v8_s3 for vccq)

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

Is the default frequency unstable? This might warrant a comment.

> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;

Don't repeat the defaults which are already set in rk3576.dtsi

> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       wifi@1 {
> +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names =3D "host-wake";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> +       };
> +};
> +
> +&sdmmc {
> +       bus-width =3D <4>;
> +       cap-mmc-highspeed;
> +       cap-sd-highspeed;
> +       cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
> +       disable-wp;
> +       no-mmc;
> +       no-sdio;
> +       sd-uhs-sdr104;
> +       vmmc-supply =3D <&vcc_3v3_sdcard>;
> +       vqmmc-supply =3D <&vccio_sd_s0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det
> +                    &sdmmc0_bus4>;

Might be good to add a comment above this line saying that the
&sdmmc_pwren is not wired up on this board, and instead the SD card
power is hard wired, thus it's dropped from the pinctrl group.

> +       status =3D "okay";
> +};
> +
> +&tsadc {
> +       status =3D "okay";
> +};
> +
> +&u2phy0 {
> +       status =3D "okay";
> +};
> +
> +&u2phy0_otg {
> +       rockchip,typec-vbus-det;

Do you need this? You have FUSB302 to negotiate data roles and request
them explicitly, so no need to rely on VBUS sensing. Furthermore, your
VBUS is not even routed to this PHY, so this doesn't make sense with
the hardware you have.

> +       status =3D "okay";
> +};
> +
> +&u2phy1 {
> +       status =3D "okay";
> +};
> +
> +&u2phy1_otg {
> +       dr_mode =3D "host";
> +       phy-supply =3D <&vcc5v0_usb20_host>;

It's not a PHY supply, but a VBUS supply for the port. Please reflect
that accordingly.

> +       status =3D "okay";
> +};
> +
> +&uart0 {
> +       pinctrl-0 =3D <&uart0m0_xfer>;

Isn't that the default pinctrl for this UART?

> +       status =3D "okay";
> +};

How about &uart6 with m1 pin config including RTS/CTS and a Bluetooth
node under it?

> +&usbdp_phy {
> +       status =3D "okay";
> +};
> +
> +&usb_drd0_dwc3 {
> +       dr_mode =3D "otg";

Don't repeat the defaults which are already set in rk3576.dtsi

> +       snps,dis_u2_susphy_quirk;
> +       snps,dis_u3_susphy_quirk;
> +       snps,parkmode-disable-hs-quirk;
> +       snps,parkmode-disable-ss-quirk;

Do you need all those quirks? Does it work without them?

> +       usb-role-switch;
> +       status =3D "okay";
> +
> +       port {
> +               usb_drd0_role_switch: endpoint {
> +                       remote-endpoint =3D <&usbc0_role_sw>;

This port schema won't let you enable DisplayPort AltMode over the
same Type-C connector - please see Sebastian's revised schema at [2]

[2] https://lore.kernel.org/linux-rockchip/20260428-rockchip-usbdp-cleanup-=
v4-1-7775671ece22@collabora.com/

> +               };
> +       };
> +};
> +
> +&usb_drd1_dwc3 {
> +       dr_mode =3D "host";
> +       snps,dis_u2_susphy_quirk;

Do you need all those quirks? Does it work without them?

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
> 2.47.3

Best regards,
Alexey

