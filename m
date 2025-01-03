Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FBCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 22:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XzYQ7eAc3G1+yev/FCPjjYzPoPPfNybOjrGNxO50so=; b=S8RaXejHlyxmhvJpRtAQ6XzNQH
	gIW7eipwIHhP9INy45gUp1AsR/PyGuknlDN9P5GuasDnGfWRgNdqroOPiDHurbu4NMU4RL69+8+s2
	rS5vEC8ZoJby25JdUmOah74MLLr+A84BoY8q2Y3+8IdjCMavO+ueCl83ox0hckbQP+nTMZPwF9Ei/
	+LoZTEkRQrOoTh4CHpLz1Ap3oRA84eC02at/4fFgAjmvZMUP15OuDHt9ajvac2PptSU/lz+kNP20B
	h3/B5sVORuLkpFUgjQVPKiYUnxnBq9RAVi4r23aEZ6s7rOMi6H4790SHCoN1D47j/Wlx7RJN5dRbY
	rL+41W9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpxc-0000000E6kP-494a;
	Fri, 03 Jan 2025 22:16:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTpwP-0000000E6di-0dPu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 22:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3003C5C59EB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jan 2025 22:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1E2C4CECE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jan 2025 22:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735942488;
	bh=L3n1EZAWR/mJseXkirg3pdqSdx8PVgIYRq1DmupRD0w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YPGh2lk+1Tp6MD6NU/Cl8j2uPQJ/exMvhhGoMY9fBipHQpzNBVvlRA4Vzt+T0GXel
	 HbfgC4lFvOPNElg8m8+d2aCkogu5rjklTYlgiJzgoym3Tf3K6bMwyv9/FqD9E1E0Cb
	 btaPa19HUNPFUV2Qarj3LetLdG6WQ8QxuHVVvPqjot5nBjqWVb9SZ2ChXCrvFqySMg
	 h9pHzH0Ix019poXllGsYLuZVSNYKcfpIsf5zfaaWvl8Qj5R7Sk1yP9QZ7wS3HzsgUw
	 5N92I4OeqK1D7eBTpqZ6SlN42a2if7GzO72mk33O2fQ2zsxEqhSrS/78BrYrDl/Q3D
	 ZNf58zDoTy8OQ==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e46ebe19368so15606739276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 14:14:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVabroutOrdIEPNH1w2zYbxvWpA50zdzbmmikxGq4JdzNkL0ecAbAmyMx+WuURYJQMT0zZw3DFC+9IwMJZ+bSwX@lists.infradead.org
X-Gm-Message-State: AOJu0YxsKgPHJeKZRn2BM9Yw9Vw8K8QOT6C14hjW5pvuphM7SG8orpAq
	7jygs5gjdwxkaWNTfjIkCT5FkS1cw4kuFC09Snbem+GKjhHlLBeHjOIfYZtCvNAq0rIoTShMVon
	lBohrwCztJrmWQQjSfTGkEI4aog==
X-Google-Smtp-Source: AGHT+IFZUBwfemSAidUhO08xvb9mFfVIAXa4FzWN70e07Dc2s3a2Ysj/i02Xg/MX/Fkuv4dsvgk+iryxh6xdKt94xs4=
X-Received: by 2002:a05:690c:30a:b0:6ef:9e74:c0b8 with SMTP id
 00721157ae682-6f3f8117969mr372840557b3.17.1735942487284; Fri, 03 Jan 2025
 14:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com> <20250103181623.1980433-3-vincenzo.frascino@arm.com>
In-Reply-To: <20250103181623.1980433-3-vincenzo.frascino@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Jan 2025 16:14:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
Message-ID: <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_141449_296535_F3EFDD4E 
X-CRM114-Status: GOOD (  22.14  )
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

On Fri, Jan 3, 2025 at 12:16=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.
>
> Introduce morello.dtsi.
>
> Note: Morello fvp will be introduced with a future patch series.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  arch/arm64/boot/dts/arm/morello.dtsi | 467 +++++++++++++++++++++++++++
>  1 file changed, 467 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
>
> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/a=
rm/morello.dtsi
> new file mode 100644
> index 000000000000..0089b4f2eca7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/morello.dtsi
> @@ -0,0 +1,467 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       interrupt-parent =3D <&gic>;
> +
> +       #address-cells =3D <2>;
> +       #size-cells =3D <2>;
> +
> +       clocks {

Drop this container node.

> +               soc_refclk50mhz: clock-50000000 {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <50000000>;
> +                       clock-output-names =3D "apb_pclk";
> +               };
> +
> +               soc_uartclk: clock-50000000-uart {

There's little point to having 2 fixed clocks with no s/w controls at
the same frequency. Drop.

> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <50000000>;
> +                       clock-output-names =3D "uartclk";
> +               };
> +
> +               soc_refclk85mhz: clock-85000000 {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <85000000>;
> +                       clock-output-names =3D "iofpga:aclk";
> +               };
> +
> +               dpu_aclk: clock-350000000 {
> +                       /* 77.1 MHz derived from 24 MHz reference clock *=
/
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <350000000>;
> +                       clock-output-names =3D "aclk";
> +               };
> +
> +               dpu_pixel_clk: clock-148500000 {
> +                       compatible =3D "fixed-clock";
> +                       #clock-cells =3D <0>;
> +                       clock-frequency =3D <148500000>;
> +                       clock-output-names =3D "pxclk";
> +               };
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <0>;
> +
> +               cpu0: cpu@0 {
> +                       compatible =3D "arm,neoverse-n1";

I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
"arm,neoverse-n1-morello" if we want to capture what it is derived
from and since "arm,morello" is taken already.

> +                       reg =3D <0x0 0x0>;
> +                       device_type =3D "cpu";
> +                       enable-method =3D "psci";
> +                       /* 4 ways set associative */
> +                       i-cache-size =3D <0x10000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <512>;
> +                       d-cache-size =3D <0x10000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <512>;
> +                       next-level-cache =3D <&l2_0>;
> +                       clocks =3D <&scmi_dvfs 0>;
> +
> +                       l2_0: l2-cache-0 {
> +                               compatible =3D "cache";
> +                               cache-level =3D <2>;
> +                               /* 8 ways set associative */
> +                               cache-size =3D <0x100000>;
> +                               cache-line-size =3D <64>;
> +                               cache-sets =3D <2048>;
> +                               cache-unified;
> +                               next-level-cache =3D <&l3_0>;
> +
> +                               l3_0: l3-cache {
> +                                       compatible =3D "cache";
> +                                       cache-level =3D <3>;
> +                                       cache-size =3D <0x100000>;
> +                                       cache-unified;
> +                               };
> +                       };
> +               };
> +
> +               cpu1: cpu@100 {
> +                       compatible =3D "arm,neoverse-n1";
> +                       reg =3D <0x0 0x100>;
> +                       device_type =3D "cpu";
> +                       enable-method =3D "psci";
> +                       /* 4 ways set associative */
> +                       i-cache-size =3D <0x10000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <512>;
> +                       d-cache-size =3D <0x10000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <512>;
> +                       next-level-cache =3D <&l2_1>;
> +                       clocks =3D <&scmi_dvfs 0>;
> +
> +                       l2_1: l2-cache-1 {
> +                               compatible =3D "cache";
> +                               cache-level =3D <2>;
> +                               /* 8 ways set associative */
> +                               cache-size =3D <0x100000>;
> +                               cache-line-size =3D <64>;
> +                               cache-sets =3D <2048>;
> +                               cache-unified;
> +                               next-level-cache =3D <&l3_0>;
> +                       };
> +               };
> +
> +               cpu2: cpu@10000 {
> +                       compatible =3D "arm,neoverse-n1";
> +                       reg =3D <0x0 0x10000>;
> +                       device_type =3D "cpu";
> +                       enable-method =3D "psci";
> +                       /* 4 ways set associative */
> +                       i-cache-size =3D <0x10000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <512>;
> +                       d-cache-size =3D <0x10000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <512>;
> +                       next-level-cache =3D <&l2_2>;
> +                       clocks =3D <&scmi_dvfs 1>;
> +
> +                       l2_2: l2-cache-2 {
> +                               compatible =3D "cache";
> +                               cache-level =3D <2>;
> +                               /* 8 ways set associative */
> +                               cache-size =3D <0x100000>;
> +                               cache-line-size =3D <64>;
> +                               cache-sets =3D <2048>;
> +                               cache-unified;
> +                               next-level-cache =3D <&l3_0>;
> +                       };
> +               };
> +
> +               cpu3: cpu@10100 {
> +                       compatible =3D "arm,neoverse-n1";
> +                       reg =3D <0x0 0x10100>;
> +                       device_type =3D "cpu";
> +                       enable-method =3D "psci";
> +                       /* 4 ways set associative */
> +                       i-cache-size =3D <0x10000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <512>;
> +                       d-cache-size =3D <0x10000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <512>;
> +                       next-level-cache =3D <&l2_3>;
> +                       clocks =3D <&scmi_dvfs 1>;
> +
> +                       l2_3: l2-cache-3 {
> +                               compatible =3D "cache";
> +                               cache-level =3D <2>;
> +                               /* 8 ways set associative */
> +                               cache-size =3D <0x100000>;
> +                               cache-line-size =3D <64>;
> +                               cache-sets =3D <2048>;
> +                               cache-unified;
> +                               next-level-cache =3D <&l3_0>;
> +                       };
> +               };
> +       };
> +
> +       firmware {
> +               interrupt-parent =3D <&gic>;
> +
> +               scmi {
> +                       compatible =3D "arm,scmi";
> +                       mbox-names =3D "tx", "rx";
> +                       mboxes =3D <&mailbox 1 0>, <&mailbox 1 1>;
> +                       shmem =3D <&cpu_scp_hpri0>, <&cpu_scp_hpri1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       scmi_dvfs: protocol@13 {
> +                               reg =3D <0x13>;
> +                               #clock-cells =3D <1>;
> +                       };
> +
> +                       scmi_clk: protocol@14 {
> +                               reg =3D <0x14>;
> +                               #clock-cells =3D <1>;
> +                       };
> +               };
> +       };
> +
> +       /* The first bank of memory, memory map is actually provided by U=
EFI. */
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               /* [0x80000000-0xffffffff] */
> +               reg =3D <0x00000000 0x80000000 0x0 0x7f000000>;
> +       };
> +
> +       memory@8080000000 {
> +               device_type =3D "memory";
> +               /* [0x8080000000-0x83f7ffffff] */
> +               reg =3D <0x00000080 0x80000000 0x3 0x78000000>;
> +       };
> +
> +       pmu {
> +               compatible =3D "arm,armv8-pmuv3";

Missing the CPU specific compatible.

> +               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-0.2";
> +               method =3D "smc";
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               secure-firmware@ff000000 {
> +                       reg =3D <0x0 0xff000000 0x0 0x01000000>;
> +                       no-map;
> +               };
> +       };
> +
> +       spe-pmu {
> +               compatible =3D "arm,statistical-profiling-extension-v1";
> +               interrupts =3D <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       soc: soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               interrupt-parent =3D <&gic>;
> +               ranges;
> +
> +               dp0: display@2cc00000 {

Sort nodes by address.

> +                       compatible =3D "arm,mali-d32", "arm,mali-d71";
> +                       reg =3D <0x0 0x2cc00000 0x0 0x20000>;
> +                       interrupts =3D <0 69 4>;
> +                       clocks =3D <&dpu_aclk>;
> +                       clock-names =3D "aclk";
> +                       iommus =3D <&smmu_dp 0>, <&smmu_dp 1>, <&smmu_dp =
2>, <&smmu_dp 3>,
> +                                <&smmu_dp 8>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       pl0: pipeline@0 {
> +                               reg =3D <0>;
> +                               clocks =3D <&dpu_pixel_clk>;
> +                               clock-names =3D "pxclk";
> +                               port {
> +                                       dp_pl0_out0: endpoint {
> +                                               remote-endpoint =3D <&tda=
998x_0_input>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               i2c0: i2c@1c0f0000 {
> +                       compatible =3D "cdns,i2c-r1p14";
> +                       reg =3D <0x0 0x1c0f0000 0x0 0x1000>;
> +                       interrupts =3D <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&dpu_aclk>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       hdmi_tx: hdmi-transmitter@70 {
> +                               compatible =3D "nxp,tda998x";
> +                               reg =3D <0x70>;
> +                               video-ports =3D <0x234501>;
> +                               port {
> +                                       tda998x_0_input: endpoint {
> +                                               remote-endpoint =3D <&dp_=
pl0_out0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               gic: interrupt-controller@2c010000 {
> +                       compatible =3D "arm,gic-v3";
> +                       reg =3D <0x0 0x30000000 0x0 0x10000>,     /* GICD=
 */
> +                             <0x0 0x300c0000 0x0 0x80000>;     /* GICR *=
/
> +
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                       #interrupt-cells =3D <3>;
> +                       interrupt-controller;
> +
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       ranges;
> +
> +                       its1: msi-controller@30040000 {
> +                               compatible =3D "arm,gic-v3-its";
> +                               reg =3D <0x0 0x30040000 0x0 0x20000>;
> +
> +                               msi-controller;
> +                               #msi-cells =3D <1>;
> +                       };
> +
> +                       its2: msi-controller@30060000 {
> +                               compatible =3D "arm,gic-v3-its";
> +                               reg =3D <0x0 0x30060000 0x0 0x20000>;
> +
> +                               msi-controller;
> +                               #msi-cells =3D <1>;
> +                       };
> +
> +                       its_ccix: msi-controller@30080000 {
> +                               compatible =3D "arm,gic-v3-its";
> +                               reg =3D <0x0 0x30080000 0x0 0x20000>;
> +
> +                               msi-controller;
> +                               #msi-cells =3D <1>;
> +                       };
> +
> +                       its_pcie: msi-controller@300a0000 {
> +                               compatible =3D "arm,gic-v3-its";
> +                               reg =3D <0x0 0x300a0000 0x0 0x20000>;
> +
> +                               msi-controller;
> +                               #msi-cells =3D <1>;
> +                       };
> +               };
> +
> +               smmu_dp: iommu@2ce00000 {
> +                       compatible =3D "arm,smmu-v3";
> +                       reg =3D <0x0 0x2ce00000 0x0 0x40000>;
> +
> +                       interrupts =3D <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "eventq", "gerror", "cmdq-syn=
c";
> +                       #iommu-cells =3D <1>;
> +               };
> +
> +               smmu_ccix: iommu@4f000000 {
> +                       compatible =3D "arm,smmu-v3";
> +                       reg =3D <0x0 0x4f000000 0x0 0x40000>;
> +
> +                       interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "eventq", "gerror", "priq", "=
cmdq-sync";
> +                       msi-parent =3D <&its1 0>;
> +                       #iommu-cells =3D <1>;
> +                       dma-coherent;
> +               };
> +
> +               smmu_pcie: iommu@4f400000 {
> +                       compatible =3D "arm,smmu-v3";
> +                       reg =3D <0x0 0x4f400000 0x0 0x40000>;
> +
> +                       interrupts =3D <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "eventq", "gerror", "priq", "=
cmdq-sync";
> +                       msi-parent =3D <&its2 0>;
> +                       #iommu-cells =3D <1>;
> +                       dma-coherent;
> +               };
> +
> +               mailbox: mhu@45000000 {
> +                       compatible =3D "arm,mhu-doorbell", "arm,primecell=
";
> +                       reg =3D <0x0 0x45000000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
> +                       #mbox-cells =3D <2>;
> +                       clocks =3D <&soc_refclk50mhz>;
> +                       clock-names =3D "apb_pclk";
> +               };
> +
> +               pcie_ctlr: pcie@28c0000000 {
> +                       device_type =3D "pci";
> +                       compatible =3D "pci-host-ecam-generic";
> +                       reg =3D <0x28 0xC0000000 0 0x10000000>;
> +                       ranges =3D <0x01000000 0x00 0x00000000 0x00 0x6f0=
00000 0x00 0x00800000>,
> +                                <0x02000000 0x00 0x60000000 0x00 0x60000=
000 0x00 0x0f000000>,
> +                                <0x42000000 0x09 0x00000000 0x09 0x00000=
000 0x1f 0xc0000000>;
> +                       bus-range =3D <0 255>;

Not needed unless less than this range.

> +                       linux,pci-domain =3D <0>;
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +                       dma-coherent;
> +                       #interrupt-cells =3D <1>;
> +                       interrupt-map-mask =3D <0 0 0 7>;
> +                       interrupt-map =3D <0 0 0 1 &gic 0 0 0 169 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 2 &gic 0 0 0 170 IRQ_TYPE_=
LEVEL_HIGH>,
> +                                       <0 0 0 3 &gic 0 0 0 171 IRQ_TYPE_=
LEVEL_HIGH>,
> +                                       <0 0 0 4 &gic 0 0 0 172 IRQ_TYPE_=
LEVEL_HIGH>;
> +                       msi-map =3D <0 &its_pcie 0 0x10000>;
> +                       iommu-map =3D <0 &smmu_pcie 0 0x10000>;
> +               };
> +
> +               ccix_pcie_ctlr: pcie@4fc0000000 {
> +                       device_type =3D "pci";
> +                       compatible =3D "pci-host-ecam-generic";
> +                       reg =3D <0x4f 0xC0000000 0 0x10000000>;
> +                       ranges =3D <0x01000000 0x00 0x00000000 0x00 0x7f0=
00000 0x00 0x00800000>,
> +                                <0x02000000 0x00 0x70000000 0x00 0x70000=
000 0x00 0x0f000000>,
> +                                <0x42000000 0x30 0x00000000 0x30 0x00000=
000 0x1f 0xc0000000>;
> +                       bus-range =3D <0 255>;
> +                       linux,pci-domain =3D <1>;
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +                       dma-coherent;
> +                       #interrupt-cells =3D <1>;
> +                       interrupt-map-mask =3D <0 0 0 7>;
> +                       interrupt-map =3D <0 0 0 1 &gic 0 0 0 201 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 2 &gic 0 0 0 202 IRQ_TYPE_=
LEVEL_HIGH>,
> +                                       <0 0 0 3 &gic 0 0 0 203 IRQ_TYPE_=
LEVEL_HIGH>,
> +                                       <0 0 0 4 &gic 0 0 0 204 IRQ_TYPE_=
LEVEL_HIGH>;
> +                       msi-map =3D <0 &its_ccix 0 0x10000>;
> +                       iommu-map =3D <0 &smmu_ccix 0 0x10000>;
> +               };
> +
> +               uart0: serial@2a400000 {
> +                       compatible =3D "arm,pl011", "arm,primecell";
> +                       reg =3D <0x0 0x2a400000 0x0 0x1000>;
> +                       interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&soc_uartclk>, <&soc_refclk50mhz>;
> +                       clock-names =3D "uartclk", "apb_pclk";
> +
> +                       status =3D "disabled";
> +               };
> +
> +               sram: sram@45200000 {
> +                       compatible =3D "mmio-sram";
> +                       reg =3D <0x0 0x06000000 0x0 0x8000>;
> +                       ranges =3D <0 0x0 0x06000000 0x8000>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       cpu_scp_hpri0: scp-sram@0 {
> +                               compatible =3D "arm,scmi-shmem";
> +                               reg =3D <0x0 0x80>;
> +                       };
> +
> +                       cpu_scp_hpri1: scp-sram@80 {
> +                               compatible =3D "arm,scmi-shmem";
> +                               reg =3D <0x80 0x80>;
> +                       };
> +               };
> +
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                            <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +       };
> +};
> --
> 2.43.0
>

