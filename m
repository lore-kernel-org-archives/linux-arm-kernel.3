Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E8FF3ED50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN+8d9fcbNkjYUpnwa5Yz9wUjHvu+k+Og8hJp5KOeeg=; b=fu97w3KyPzxHmQ9bWQQfNxSxmi
	ACLM+tmhObEEWKVLbo/ypm3IEQkBImofmQbRaj6o8gI0nn0xHBnnO9HWYFo5DRVx40LUgtat/3clk
	QujjcKMu0yPqCUMNuVy3WgDBQsYA66iUOwpAkfsC3sh7i2LXCoAZGYmKmJ7makMuDzbNri3XK7Cca
	reMoIV2K94QtnIMEJ/Jh5FK7mDnxDByXa5l5fyGbTgcD0uMk/p0sIp2Cc20ja9trfolyN91js0T5r
	YrErlMYoV5ACW8vE8OvPjNFJ9D6wtH8HhUvhvrSfEg+gRxArSmQuwuNb0asy37oiUmqcyZcH6uwtv
	Th8Jyd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcdC-0000000DhBA-32x2;
	Sat, 11 Apr 2026 18:00:30 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBcd9-0000000DhAR-19Af
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 18:00:28 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50d6b9bca48so40743041cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 11:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775930425; cv=none;
        d=google.com; s=arc-20240605;
        b=GwXiJzrPrAxv06XbYmgXPWcXYAVhb1JPrIN4eWdnoK2EVKqWkinrfumeIDWPzWJVhF
         1yE3pj1FQ6hIZcGPW8Le4eBhLDeGKJzFqkEqKQeBcMdRID9VMjkaaTz3lIRwGa0YzAGr
         2id2hoXg8LNgJ/2pVPGeP0Y+pxiSzZ5nQTnqi41eNaNdrwXFVZEH5260gXr0NzzB8KoK
         MnCvf8xCpsxbR5KD2LmR4WFaI7fbOo9ZFXvcE1m1HbMA+JrIvJ8QjfT//WAXYnKZW6Vh
         gf1aJdOsliuazaco8YqdsaySs59RDmLmvKrdTidJqfJNXC3/XFuWzQ3kCW9JIMHmrgDC
         3ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jN+8d9fcbNkjYUpnwa5Yz9wUjHvu+k+Og8hJp5KOeeg=;
        fh=H/grmnOIZUfZSDYxCylTqh/z5uudPt2xkgsJFNuY8es=;
        b=cPW6m+jgwAQ96nBqdthAf6dBQi+DAQXgGus48kIc0+fcu4vtUaKSvdL242Oi/AsQcn
         B8OWMRrLLjbN9peWvzcUEe+O168tWFXLuggFTv86kqCVTqq8J6hfMR2wmLk7mbyOP3vG
         o/paOcOl+QmgDbBgKcWi29VEf3RoRaA9x2zNmecg0PTE7Xehlb4isXjnCPClLScGO+Hk
         jiQw+8oizri0I2T/A5AuDVEm8MRZkxa8CJDvbTa+Pd6ba9WmZbThYSsKcdUCHY5kP9Da
         MNuURuoE2M1QxBEW7pu9ij+Jp9F6jEGoWcVKCpAwAUrdKR3AIIhLcZVZyjPz85lXYxg9
         AWkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775930425; x=1776535225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN+8d9fcbNkjYUpnwa5Yz9wUjHvu+k+Og8hJp5KOeeg=;
        b=jl/H8YbyZAGdL92Fp8d1eVzf2mEeLAA+5BJNgF+ZN4efDBc/oSliFB0ujo7P9/N18p
         zKWKYtTtNfaw0ufEN25Fvi3d8o9e0gmVXqC/JC3HzbO8E15XTEERlRPbspbJ4epemkzJ
         cohcjS/rKY2yJLQzoJTRs1UYxOEBLTMB/8jfdG0j1dZ/GQS83s12avUjqLxihIfKyC4c
         FhTh5EDJqpPCyXBnL1DOeqk9oWyKkp5u1oHl3oZCmdHcWDpefr8d/vtJKj4FkKoz2QAW
         nwnXoMySa7JsCozXTS0ymr030unRimhtIAQxBIJsSqyvX9CCyNE2qp+t0zjKysVVVpEo
         heHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930425; x=1776535225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jN+8d9fcbNkjYUpnwa5Yz9wUjHvu+k+Og8hJp5KOeeg=;
        b=TcUHZ7hLx9iwYCG8/HZuYVReF1K6Ckz0dkuJHxpC6eV9gU6VSWnxAyIowHc7XFE5xQ
         Zkh92hRMMQBXWhPzyFvvELhiYxOJac9GReB5Qxu/uF1O9yx0+UYstIHI3z5BkagrzPDI
         /oktwkYnojfTB6G/M4+eAR+OGYpelI+RGQ5RTvqlG4g8wmVCypO3DqkU+Jvw1rRVy+eU
         zUrjGFqI7xiq3Wq8DZLwhDRZP4brk8Q8mnSQcXrQtYfYp0Sx7BLrrSuzQf2lLa+kNIUo
         gP+OAAW95E5mtNSmKeHfvnpHy0MRZ6FW0MIH4L/iCI5bnz3dMgPoTcBIPaDkUopBcsJV
         4MLg==
X-Forwarded-Encrypted: i=1; AJvYcCXjvabJDkEbgdkMVohjThKhelJBWipV9co8iV2jTCTOT//mnm2ia5D/8ioT9YugP6ti23pmOz0whDOCRYhMmwXh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5mu9ySuxDv1ZUsxggUN6+XDp/kofL6jZm++sg8fB0ZPfXqqJT
	ztkFS+hqv6XFRLRua3CzTtwVdhfp4AYH1QULm1ozg+2Ddw3BnUo5i109GtKtCUzKPcw4zStQkzd
	TuRU8zozsXGRDU8JJMQRU5P0d6bygtf4=
X-Gm-Gg: AeBDievK4EsaEwmI5QO3S0flunr8ExH38axIan7P8m+APFOm3PBDJstDKjOPtyZvMcB
	q+UWvTgj5XF+XpDHy1dzEw7ZHE+p3Neri6z+T+R19CEUiN4NlM8QX8DwrPkcg6PyQp4bOv85Mep
	OpHK5ZYBi/vTebdIVnIsziFWe2BQMWl5WNNgZhJNTkAyMeQQxvxYO/XT6imwM4rEEykdfDpw/iR
	ve34sssOsxSlVj6U4d2P1J+R91ocKYR1h0GP34EuJMS9zVrx/rBtsIcaAmWWsHVlhVweb+d6pXD
	2squN3g=
X-Received: by 2002:a05:622a:3c8:b0:50d:a8f5:1bf6 with SMTP id
 d75a77b69052e-50dd5d14404mr110906241cf.52.1775930424988; Sat, 11 Apr 2026
 11:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260411024743.195385-1-dennis@ausil.us> <20260411024743.195385-4-dennis@ausil.us>
In-Reply-To: <20260411024743.195385-4-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 11 Apr 2026 22:00:12 +0400
X-Gm-Features: AQROBzCI21NPPFQnsoq6IZK5IT99CEjM40fo_GmQPyZhf5REk5otPD8FF_l5D8E
Message-ID: <CABjd4YwZJe8fO+kJiXRTq5gZirVvKvCqWzNdYqN3-6eMAZUFxQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_110027_395127_BF1D284C 
X-CRM114-Status: GOOD (  32.87  )
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

On Sat, Apr 11, 2026 at 6:47=E2=80=AFAM <dennis@ausil.us> wrote:
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
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven by a transparent LT8711UXD bridge that has firmware onboard and
>   needs no node defined.
>
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html

Hi Dennis,

The most useful of these is the schematic, so it's best to include a
direct link to that in a dedicated Link: tag

Link: https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/vie=
w
[schematic]

> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../display/rockchip/rockchip,dw-dp.yaml      |   7 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 352 ++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c       |  12 +

These should be three separate patches, never lumped together. First
the binding change, next the driver change. They go together via the
subsystem tree (likely DRM in this case). Then the DTS addition (or
change) separately (it goes via the SoC tree).

>  4 files changed, 372 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 6345f0132d43..079a912d97f1 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> @@ -57,6 +57,13 @@ properties:
>        - const: i2s
>        - const: spdif
>
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used for hot plug detection when the controller's native HPD
> +      input is not connected. If not specified, the controller uses its
> +      internal HPD detection mechanism.

Do you actually need this change? According to the schematic, the
DP_HPDIN line from the DP-HDMI bridge is routed to the native
DP0_HPDIN_M0 pin of the DP controller, so it shouldn't require this
GPIO trick if the pinctrl is configured properly.

>    phys:
>      maxItems: 1
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
> index 000000000000..84c83aa69f63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,352 @@
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
> +       dp-con {
> +               compatible =3D "dp-connector";

You don't have a physical DP connector on the board, so this node
doesn't describe actual hardware, and is thus a no-go. What you have
instead is an HDMI type A connector routed via an onboard DP to HDMI
bridge, so you should describe exactly that in the device tree (a node
for the HDMI connector, a node for the bridge, a node for the DP
controller, and endpoints connected from the controller to the bridge,
from the bridge to the connector). Please refer to the device tree for
Radxa Rock 5 ITX, which has a similar setup (but a different bridge
IC).

I don't think your LT8711UXD has existing binding or driver entry, so
a one-line patch will likely be needed to
Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml,
and a separate one to drivers/gpu/drm/bridge/simple-bridge.c. Separate
ones :)

> +               port {
> +                       dp_con_in: endpoint {
> +                               remote-endpoint =3D <&dp0_out_con>;
> +                       };
> +               };
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
> +       vcc3v3_dp: regulator-vcc3v3-dp {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;

Please don't forget to add explicit pinctrl nodes for each GPIO pin
you use (here and in other places like this). These GPIOs happen to
work on Linux without configuring their pin control first, but that is
pure luck and coincidence due to how the respective Linux subsystems
are wired together, and if you ever need to use this device tree in
e.g. U-boot (which also derives its DTS from the Linux kernel tree) it
will break there.

> +               regulator-always-on;
> +               regulator-boot-on;

Does it have to be always-on, boot-on? This looks like a hack to work
around the fact that you didn't define the bridge node, which uses
this as its supply. Please model the dependencies explicitly - most
likely that will let you drop these attributes.

> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;

It's two separate regulators on your schematic, one DCDC at 1.25V and
the other a load switch at 3.3V, driving six separate voltage inputs
of the DP bridge. They are both controlled by the same GPIO pin
though, so _maybe_ it's okay to have just one "virtual" node like this
to model them together. Would be great for the DT maintainers to weigh
in on this.

> +               regulator-name =3D "vcc3v3_dp";
> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               regulator-boot-on;

See above

> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_phy1";
> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc5v0_otg: regulator-vcc5v0-otg {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_otg_en>;
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

This GPIO also needs a pinctrl

> +       };
> +
> +       typea_con: usb-a-connector {
> +               compatible =3D "usb-a-connector";
> +               data-role =3D "host";
> +               label =3D "USB3 Type-A";
> +               power-role =3D "source";
> +               vbus-supply =3D <&vcc5v0_otg>;
> +       };
> +};
> +
> +&dp0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&dp0m0_pins>;

This switches your HPD pin to the native DP controller handling
(DP0_HPDIN_M0), so the GPIO bits you've patched into the controller
driver aren't even used, and it doesn't look like you tested that code
path.

> +       status =3D "okay";
> +};
> +
> +&dp0_in {
> +       dp0_in_vp1: endpoint {
> +               remote-endpoint =3D <&vp1_out_dp0>;
> +       };
> +};
> +
> +&dp0_out {
> +       dp0_out_con: endpoint {
> +               remote-endpoint =3D <&dp_con_in>;

This will need to be rewritten once you add the proper bridge chain
leading up to the HDMI type A connector.

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

Are you sure? Schematic says VCCA_3V3_S0, which is a different
regulator (PLDO4 output of the PMIC)

> +               DVDD-supply =3D <&vcc_1v8_s0>;

Schematic says VCCA_1V8_S0, which is a different regulator (PLDO1
output of the PMIC)

> +               HPVDD-supply =3D <&vcc_3v3_s0>;

Schematic says VCCA_3V3_S0

> +               PVDD-supply =3D <&vcc_3v3_s0>;

Schematic says VCCA_1V8_S0

> +               assigned-clock-rates =3D <12288000>;
> +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&i2s2m1_mclk>;
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
> +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_sclk
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

The GPIO also needs a pinctrl

> +       supports-clkreq;
> +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> +       status =3D "okay";
> +};
> +
> +/* NIC */
> +&pcie2x1l2 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;

The GPIO also needs a pinctrl

> +       vpcie3v3-supply =3D <&vcc3v3_phy1>;
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

I'm wondering if the DP controller's "out" endpoint should go to the
PHY instead of directly to the connector/bridge. That would describe
the hardware better.

> +};
> +
> +&vp1 {
> +       vp1_out_dp0: endpoint@a {
> +               reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> +               remote-endpoint =3D <&dp0_in_vp1>;
> +       };
> +};
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index fd23ca2834b0..b58f57b69b22 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/iopoll.h>
>  #include <linux/irq.h>
>  #include <linux/media-bus-format.h>
> @@ -330,6 +331,8 @@ struct dw_dp {
>         u8 pixel_mode;
>
>         DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
> +
> +       struct gpio_desc *hpd_gpiod;
>  };
>
>  enum {
> @@ -481,6 +484,9 @@ static bool dw_dp_hpd_detect(struct dw_dp *dp)
>  {
>         u32 value;
>
> +       if (dp->hpd_gpiod)
> +               return gpiod_get_value_cansleep(dp->hpd_gpiod);
> +
>         regmap_read(dp->regmap, DW_DP_HPD_STATUS, &value);
>
>         return FIELD_GET(HPD_STATE, value) =3D=3D DW_DP_HPD_STATE_PLUG;
> @@ -2002,6 +2008,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, struc=
t drm_encoder *encoder,
>                 return ERR_CAST(dp->regmap);
>         }
>
> +       dp->hpd_gpiod =3D devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);

Not tested, not needed, why bother?..

Best regards,
Alexey

