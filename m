Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86553C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu1D0VFloNBpAfxyfcbpMmti77lekTudbBn0QQ7akng=; b=A9QxbHDWAxKTkJvwRKwjFNf+qK
	yCAAN4TaOsGC/5cdzRkhg46z9MqUB+SjJSxYxx20yAtLqzLN770PhIWUGaymj4we1wJo0julGQsnP
	Y/kcSVPeAvQhFRls//krlvp5DdvtIF55ut0Nlgv6loL74zGCW2cnG3iCjD4DXmRxV+N9s02y59ALp
	Q12TGCnChFHph4811rD5nEYumCmruCfLeC2T+uswUJ2d0KWvEDLf9731vbmXebfxGAYEQPJw7nPvg
	5vuhIhBrlBt8mql808hq0NLDV27eAPWONBID82MDNb9ElCpu2k/9i1Y62wF7D5v17dwLdUIw3BWfQ
	vEPg99Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultDK-0000000Beab-0rlH;
	Tue, 12 Aug 2025 17:55:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpvG-0000000B380-2zvL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E49415C68A6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 14:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91757C4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755008656;
	bh=1vyyr8C2zOlS6zNdltWJ9HYZujL5Uy9677XNN3QAu/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HbADEbf7+k9gq0Di3wAdimeGH1mjEiRbXBg/k3RsxkSOAjwOiiUawhl0XRzOq/mPm
	 JfD74btQ9raSICJM02c1WaW4Rbp/6TVlJpyVbULPx+HK/zQNRjbC9qMh4IJBT0qTwR
	 hJtHUWKitU5CGugii01bLNArCtwA2nUPO5XtiV+fUCfQFPEsZh4zaWopUOtE3VQ9Zu
	 mQNYsoSx8boe2O1kpGLatCmoSyEXeyzhBxwjjEO/SjlgNKxuZdtQuG/Uj5I+Tyq8OS
	 awnULnFFxVQXzuxn/aL+tbl8XmT/MHhlUq70HbrVbChLRjbJgwteK2oDIyKUwHleZ9
	 NnToImbvlKu2w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af9618282a5so1050370166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 07:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZmPTqk18Eppogz2++rsViFItmSY0yyIXtuM/ZzE1ksX7+NXzAGqUUC+a5UlEDQGUL1ULimYfJUKtIGi9w83vP@lists.infradead.org
X-Gm-Message-State: AOJu0YxEmXbSPUAuE5WVq9PWPuYpfnO32Uomx1EBs2ZkZL3TcKXreCBG
	W0bc0G8v6ZMaoGa8TsiLItm+HPgcDEcn0UqI4dIa1R0kfHJ4HwF0Qfo4ydfTPq2eGmg7KmjDAxu
	eu9/4tNe6YgSNDRsLyKif8JPqgOkmjw==
X-Google-Smtp-Source: AGHT+IHmRYjvc/55DKRxWdDkLyGXMRZPhOKnGEaxwBrSckIck/xZueHSci5zBgYwsEzuPzWfG+yan6fLYjsFgXLFnwQ=
X-Received: by 2002:a17:907:96a5:b0:ae0:ad8c:a559 with SMTP id
 a640c23a62f3a-afa1dfa0b22mr376770966b.4.1755008655115; Tue, 12 Aug 2025
 07:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752837842.git.michal.simek@amd.com> <05ff505c6b6517e3aba983a21454c568c5e86389.1752837842.git.michal.simek@amd.com>
In-Reply-To: <05ff505c6b6517e3aba983a21454c568c5e86389.1752837842.git.michal.simek@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Aug 2025 09:24:03 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+=mnYipAN2q8gdcDF2pK7e8NTOazgq9V+rZSAs9O4PEg@mail.gmail.com>
X-Gm-Features: Ac12FXz4xyiXZUUwtw2LW0dSI6hHE0Bw5Qka0B72VRitNFnk--s6ts1sG_GhtxQ
Message-ID: <CAL_Jsq+=mnYipAN2q8gdcDF2pK7e8NTOazgq9V+rZSAs9O4PEg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: zynqmp: Add support for kd240 board
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_072418_835400_49FDA0C3 
X-CRM114-Status: GOOD (  20.65  )
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

On Fri, Jul 18, 2025 at 6:24=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
> The kit is using k24 SOM by default and it is used for motor control and
> DSP applications.
>
> K24 SOM is also possible to used with kv260 and kr260 CC which are also
> wired in Makefile.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
> https://www.amd.com/en/products/system-on-modules/kria/k24/k24i-industria=
l.html
> https://www.amd.com/en/products/system-on-modules/kria/k24/kd240-drives-s=
tarter-kit.html
>
> ---
>  arch/arm64/boot/dts/xilinx/Makefile           |  15 +
>  .../boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 390 ++++++++++++++++++
>  .../boot/dts/xilinx/zynqmp-sm-k24-revA.dts    |  23 ++
>  .../boot/dts/xilinx/zynqmp-smk-k24-revA.dts   |  21 +
>  4 files changed, 449 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-sm-k24-revA.dts
>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dts
>
> diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/xi=
linx/Makefile
> index 5e84e3c725e2..70fac0b276df 100644
> --- a/arch/arm64/boot/dts/xilinx/Makefile
> +++ b/arch/arm64/boot/dts/xilinx/Makefile
> @@ -39,4 +39,19 @@ dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-smk-k26-revA-sck=
-kr-g-revA.dtb
>  zynqmp-smk-k26-revA-sck-kr-g-revB-dtbs :=3D zynqmp-smk-k26-revA.dtb zynq=
mp-sck-kr-g-revB.dtbo
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-smk-k26-revA-sck-kr-g-revB.dtb
>
> +zynqmp-sm-k24-revA-sck-kd-g-revA-dtbs :=3D zynqmp-sm-k24-revA.dtb zynqmp=
-sck-kd-g-revA.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-sm-k24-revA-sck-kd-g-revA.dtb
> +zynqmp-smk-k24-revA-sck-kd-g-revA-dtbs :=3D zynqmp-smk-k24-revA.dtb zynq=
mp-sck-kd-g-revA.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-smk-k24-revA-sck-kd-g-revA.dtb
> +
> +zynqmp-sm-k24-revA-sck-kv-g-revB-dtbs :=3D zynqmp-sm-k24-revA.dtb zynqmp=
-sck-kv-g-revB.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-sm-k24-revA-sck-kv-g-revB.dtb
> +zynqmp-smk-k24-revA-sck-kv-g-revB-dtbs :=3D zynqmp-smk-k24-revA.dtb zynq=
mp-sck-kv-g-revB.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
> +
> +zynqmp-sm-k24-revA-sck-kr-g-revB-dtbs :=3D zynqmp-sm-k24-revA.dtb zynqmp=
-sck-kr-g-revB.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-sm-k24-revA-sck-kr-g-revB.dtb
> +zynqmp-smk-k24-revA-sck-kr-g-revB-dtbs :=3D zynqmp-smk-k24-revA.dtb zynq=
mp-sck-kr-g-revB.dtbo
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-smk-k24-revA-sck-kr-g-revB.dtb
> +
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D versal-net-vn-x-b2197-01-revA.dtb
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/=
arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> new file mode 100644
> index 000000000000..02be5e1e8686
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dts file for KD240 revA Carrier Card
> + *
> + * Copyright (C) 2021 - 2022, Xilinx, Inc.
> + * Copyright (C) 2022 - 2023, Advanced Micro Devices, Inc.
> + *
> + * Michal Simek <michal.simek@amd.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +       compatible =3D "xlnx,zynqmp-sk-kd240-rev1",
> +                    "xlnx,zynqmp-sk-kd240-revB",
> +                    "xlnx,zynqmp-sk-kd240-revA",
> +                    "xlnx,zynqmp-sk-kd240", "xlnx,zynqmp";
> +       model =3D "ZynqMP KD240 revA/B/1";
> +
> +       aliases {
> +               ethernet0 =3D "/axi/ethernet@ff0c0000"; /* &gem1 */
> +       };
> +
> +       ina260-u3 {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&u3 0>, <&u3 1>, <&u3 2>;
> +       };
> +
> +       clk_26: clock2 { /* u17 - USB */
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <26000000>;
> +       };
> +
> +       clk_25_0: clock4 { /* u92/u91 - GEM2 */
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <25000000>;
> +       };
> +
> +       clk_25_1: clock5 { /* u92/u91 - GEM3 */
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <25000000>;
> +       };
> +};
> +
> +&can0 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_can0_default>;
> +};
> +
> +&i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-names =3D "default", "gpio";
> +       pinctrl-0 =3D <&pinctrl_i2c1_default>;
> +       pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> +       scl-gpios =3D <&gpio 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +       sda-gpios =3D <&gpio 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +
> +       u3: ina260@40 { /* u3 */
> +               compatible =3D "ti,ina260";
> +               #io-channel-cells =3D <1>;
> +               label =3D "ina260-u14";
> +               reg =3D <0x40>;
> +       };
> +
> +       slg7xl45106: gpio@11 { /* u13 - reset logic */
> +               compatible =3D "dlg,slg7xl45106";
> +               reg =3D <0x11>;
> +               label =3D "resetchip";

'label' is not a documented property for this binding. Please drop.
"dtbs_check" reports this.

Rob

