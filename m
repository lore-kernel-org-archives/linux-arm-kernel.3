Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D001EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diMBy43YOQ25qtnwPvyqEuoVEZ4fTwQ8qQCsxL/aRcI=; b=bGLVKc0ol1zRbv3KxnREyMpIyL
	EBCfwSW9Xbjslq90lOCrswLQapPbQ5eT8PS1h6DXHoABRmB8PgrZXLP4Q4nDB14EVCJZiyeUN2AWT
	7FnezsT9ybhyVi5rBLuhB2kM4eUj29F/pmTA9TWMxGshyM8V1nVFTnj8i+X6LI5ukdrPB98j66kOo
	pewmFiz56xnzR0a/cEg67rMUKTZHvlmL0q5YFJLDfYJ3O2/OCOSUeWN3nbPLsx13Y9VP5iGkQeylb
	Yjs0ueKUlrqU2Sm5of3XW34Ov2Q3dB1nGjjbLre5UEnI00G45TIByKSEFbnEoNuyg/gdfGaKMey1l
	Dcks6DNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWey-0000000EAGv-2GDO;
	Fri, 07 Mar 2025 12:18:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWcF-0000000E9ip-0TMw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 12:15:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78DEBA45757
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 12:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA5EC4CEE8
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741349745;
	bh=NUTcwqh7MCASvD4w+bVQSfE4QAqRs9qXkw2IdgX9WCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QAx0mt9ExXV5hggC/+MxyKsU0jZkRktXz8OxehcXJcyZh1o9vlwub2+ig0vt8jec8
	 6rX7tSL86uv0pL/9c0VGRLHTGQCZfVYmZiDh0X2BlXgelBaTEbZ3hSxrx1IcvwFnMK
	 1nSe1gYdRrv9XNyYQbVSqGQoatlGFpMe5EZc8RhKKX+60N5XNcTJjw2Fr8yBcMDJZp
	 EGOQ5whrZM/v+0HjQuttTXVzlYlmExawYdtRZdVnKK5ca86eWkFjSWp/+CLcvU+K09
	 77IW07Nz8NRLKfrsgJpeEIIMvoemRxShTvz3HFKdb1/vsq72NfxIYqbVo6hH+KIuT2
	 5tmnZYgwZ3XQg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1721512a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 04:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWybE6whnj/glnOYCPeNCeV747pjrH/jhWhLZ0vLu+zqqM3WMxPN9EP8KMR/O241e27lKPJCdpRiMJ8YKSaf3j5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn2O5SGW1YYKsSrCFvo6GK7HbR1QY4kvwmE1+OEwhQfreWIniL
	foqUlOJYKVfDUbcSoMqvliNnP1SVzYj/Y1GRWFcJ3tFxSEU1BmHEkTZtB7zfTO+RfvsLLuJSMRm
	kCjzLu3HymowVaDKKYDJzYKaZTQ==
X-Google-Smtp-Source: AGHT+IGVdHSFZn3+WiSlThdpTVs0r4OoYpx/U2Lbt6NNoKziKPQIgxGTCb1pgFt4bob2aUbhXriG1Al/+sIfqRUQvOM=
X-Received: by 2002:a17:907:2d92:b0:ac1:fab4:a83 with SMTP id
 a640c23a62f3a-ac252b5a837mr346883966b.25.1741349744102; Fri, 07 Mar 2025
 04:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20250218185452.600797-1-vaishnav.a@ti.com> <20250218185452.600797-6-vaishnav.a@ti.com>
In-Reply-To: <20250218185452.600797-6-vaishnav.a@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Mar 2025 06:15:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxHKdQujWdSkGe6_cUftdgNgJ2PyVZR41A_LJ241_D3g@mail.gmail.com>
X-Gm-Features: AQ5f1JomHAua_qKY6p65rhjGZzmCsboNe30YpEDs67TH3wT0hxy-QRQycqLiaFA
Message-ID: <CAL_JsqLxHKdQujWdSkGe6_cUftdgNgJ2PyVZR41A_LJ241_D3g@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jai.luthra@linux.dev, y-abhilashchandra@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041547_331692_275182E5 
X-CRM114-Status: GOOD (  18.81  )
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

On Tue, Feb 18, 2025 at 12:55=E2=80=AFPM Vaishnav Achath <vaishnav.a@ti.com=
> wrote:
>
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
>  .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 319 ++++++++++++++++++
>  2 files changed, 323 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov=
5640.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 9ae0917e5763..0370392abda8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -120,6 +120,7 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-j721s2-evm-pcie1-ep.dtb=
o
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-beagley-ai.dtb
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>
>  # Boards with J784s4 SoC
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-am69-sk.dtb
> @@ -212,6 +213,8 @@ k3-j721s2-evm-pcie1-ep-dtbs :=3D k3-j721s2-common-pro=
c-board.dtb \
>         k3-j721s2-evm-pcie1-ep.dtbo
>  k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs :=3D k3-j722s-evm.dtb \
>         k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs :=3D k3-j722s-evm.dtb \
> +       k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs :=3D k3-j784s4-evm.dtb \
>         k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs :=3D k3-j784s4-evm.dtb \
> @@ -247,6 +250,7 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
>         k3-j721e-sk-csi2-dual-imx219.dtb \
>         k3-j721s2-evm-pcie1-ep.dtb \
>         k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
> +       k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
>         k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>         k3-j784s4-evm-quad-port-eth-exp1.dtb \
>         k3-j784s4-evm-usxgmii-exp1-exp2.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dt=
so b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> new file mode 100644
> index 000000000000..f33f50465a07
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
> + *
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.co=
m/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +       clk_ov5640_fixed: ov5640-xclk {

clock-24000000 for the node name.

> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <24000000>;
> +       };
> +};
> +
> +
> +&main_pmx0 {
> +       cam0_reset_pins_default: cam0-reset-pins-default {

Doesn't match the schema. Please test your changes:

pinctrl@f4000: 'cam0-reset-pins-default', 'cam1-reset-pins-default',
'cam2-reset-pins-default', 'cam3-reset-pins-default' do not match any
of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'

> +               pinctrl-single,pins =3D <
> +                       J722S_IOPAD(0x03c, PIN_OUTPUT, 7)
> +               >;
> +       };
> +
> +       cam1_reset_pins_default: cam1-reset-pins-default {
> +               pinctrl-single,pins =3D <
> +                       J722S_IOPAD(0x044, PIN_OUTPUT, 7)
> +               >;
> +       };
> +
> +       cam2_reset_pins_default: cam2-reset-pins-default {
> +               pinctrl-single,pins =3D <
> +                       J722S_IOPAD(0x04c, PIN_OUTPUT, 7)
> +               >;
> +       };
> +
> +       cam3_reset_pins_default: cam3-reset-pins-default {
> +               pinctrl-single,pins =3D <
> +                       J722S_IOPAD(0x054, PIN_OUTPUT, 7)
> +               >;
> +       };
> +};
> +
> +&exp1 {
> +       p06-hog{
> +               /* P06 - CSI01_MUX_SEL_2 */
> +               gpio-hog;
> +               gpios =3D <6 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI01_MUX_SEL_2";
> +       };
> +
> +       p07-hog{
> +               /* P01 - CSI23_MUX_SEL_2 */
> +               gpio-hog;
> +               gpios =3D <7 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI23_MUX_SEL_2";
> +       };
> +};
> +
> +&main_gpio0 {
> +       p15-hog {
> +               /* P15 - CSI2_CAMERA_GPIO1 */
> +               gpio-hog;
> +               gpios =3D <15 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI2_CAMERA_GPIO1";
> +       };
> +
> +       p17-hog {
> +               /* P17 - CSI2_CAMERA_GPIO2 */
> +               gpio-hog;
> +               gpios =3D <17 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI2_CAMERA_GPIO2";
> +       };
> +
> +       p19-hog {
> +               /* P19 - CSI2_CAMERA_GPIO3 */
> +               gpio-hog;
> +               gpios =3D <19 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI2_CAMERA_GPIO3";
> +       };
> +
> +       p21-hog {
> +               /* P21 - CSI2_CAMERA_GPIO4 */
> +               gpio-hog;
> +               gpios =3D <21 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name =3D "CSI2_CAMERA_GPIO4";
> +       };
> +};
> +
> +&pca9543_0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       i2c-alias-pool =3D /bits/ 16 <0x3c 0x3d>;
> +
> +       i2c@0 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0>;
> +
> +               ov5640_0: camera@3c {
> +                       compatible =3D "ovti,ov5640";
> +                       reg =3D <0x3c>;
> +                       clocks =3D <&clk_ov5640_fixed>;
> +                       clock-names =3D "xclk";
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&cam0_reset_pins_default>;
> +
> +                       port {
> +                               csi2_cam0: endpoint {
> +                                       remote-endpoint =3D <&csi2rx0_in_=
sensor>;
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       i2c@1 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <1>;
> +
> +               ov5640_1: camera@3c {
> +                       compatible =3D "ovti,ov5640";
> +                       reg =3D <0x3c>;
> +                       clocks =3D <&clk_ov5640_fixed>;
> +                       clock-names =3D "xclk";
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&cam1_reset_pins_default>;
> +
> +                       port {
> +                               csi2_cam1: endpoint {
> +                                       remote-endpoint =3D <&csi2rx1_in_=
sensor>;
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&pca9543_1 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       i2c-alias-pool =3D /bits/ 16 <0x3c 0x3d>;
> +
> +       i2c@0 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0>;
> +
> +               ov5640_2: camera@3c {
> +                       compatible =3D "ovti,ov5640";
> +                       reg =3D <0x3c>;
> +                       clocks =3D <&clk_ov5640_fixed>;
> +                       clock-names =3D "xclk";
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&cam2_reset_pins_default>;
> +
> +                       port {
> +                               csi2_cam2: endpoint {
> +                                       remote-endpoint =3D <&csi2rx2_in_=
sensor>;
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       i2c@1 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <1>;
> +
> +               ov5640_3: camera@3c {
> +                       compatible =3D "ovti,ov5640";
> +                       reg =3D <0x3c>;
> +                       clocks =3D <&clk_ov5640_fixed>;
> +                       clock-names =3D "xclk";
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&cam3_reset_pins_default>;
> +
> +                       port {
> +                               csi2_cam3: endpoint {
> +                                       remote-endpoint =3D <&csi2rx3_in_=
sensor>;
> +                                       clock-lanes =3D <0>;
> +                                       data-lanes =3D <1 2>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&cdns_csi2rx0 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               csi0_port0: port@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +
> +                       csi2rx0_in_sensor: endpoint {
> +                               remote-endpoint =3D <&csi2_cam0>;
> +                               bus-type =3D <4>; /* CSI2 DPHY */
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&cdns_csi2rx1 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               csi1_port0: port@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +
> +                       csi2rx1_in_sensor: endpoint {
> +                               remote-endpoint =3D <&csi2_cam1>;
> +                               bus-type =3D <4>; /* CSI2 DPHY */
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&cdns_csi2rx2 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               csi2_port0: port@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +
> +                       csi2rx2_in_sensor: endpoint {
> +                               remote-endpoint =3D <&csi2_cam2>;
> +                               bus-type =3D <4>; /* CSI2 DPHY */
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&cdns_csi2rx3 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               csi3_port0: port@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +
> +                       csi2rx3_in_sensor: endpoint {
> +                               remote-endpoint =3D <&csi2_cam3>;
> +                               bus-type =3D <4>; /* CSI2 DPHY */
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&ti_csi2rx0 {
> +       status =3D "okay";
> +};
> +
> +&dphy0 {
> +       status =3D "okay";
> +};
> +
> +&ti_csi2rx1 {
> +       status =3D "okay";
> +};
> +
> +&dphy1 {
> +       status =3D "okay";
> +};
> +
> +
> +&ti_csi2rx2 {
> +       status =3D "okay";
> +};
> +
> +&dphy2 {
> +       status =3D "okay";
> +};
> +
> +
> +&ti_csi2rx3 {
> +       status =3D "okay";
> +};
> +
> +&dphy3 {
> +       status =3D "okay";
> +};
> --
> 2.34.1
>

