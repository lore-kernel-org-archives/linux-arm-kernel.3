Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A9BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=759cfH/BZtZKVajOkbj6QRV6Y47F8oX4GGvDpPu2vlg=; b=W89ifI8YJ7NKYOBaTkdXvkNmtl
	0hTtSFTB5abMt8KVAODjZ7PUDK8S1ROhuSua2vXxz8lUL2xtnG6Cg+C2TilRy5b6AEEnd45RjF23/
	FrUL2iidJhEqsBxaaYHbcjiSSqA8iysgwH2HaK2O4y+rX20x6meFwIMcS/WwN84ijanfPZIyOq2Hb
	vT6TkWLBm+GUuepHmnueNObqxX/JZTB5Oyqk55c7aCTXY+4AKD2P0/Lcx/rEYl4bJvYKv7b4Dgs1Y
	M4+/77PVht10quNAhKfI/BwtpFrSU/UN0RM6BhCHYPXTIKH5h7CB7J+zzzLujKXDHQ1EZEvp6Fy4/
	Jj3raDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWyz-00000005qDl-2QeU;
	Tue, 04 Mar 2025 18:27:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVfz-00000005XY9-3M0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:03:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25F87A459A0
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 16:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4F0C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107806;
	bh=TKQ7m1KW0EDUZSOKBSYQtrQAfX8pph1vCn+eyQcex7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPziMNPPTpV7AZGdUSJ2pYZHvFof/rb0iJAdl6k+BJQLENzl9F/vV7Df+y7sKupaA
	 a1zn3SDLQlTwb6tDEv2Ba4iq/jBLIkd3vheLWpE4K02jvvC4wt0MlF6PYyMe9ROVn1
	 x9z4RcJuQRLw7GvPpsiqtCq61JrxalqOx6TtjqXV9zoORnT7JiF/HHCGNaZVcGOlBh
	 /xy671WTBi974k8LS2Fdha1r42iqIcI58w5KS/S4bdLcP0mXU+P3P5G2SdI4JWBoKj
	 e9DDkNQX8asdnyKuZTcAmKPblEs0ipfwxhH2B09QZ/pFaTuaoapSRIgAl7+ZXwGjcx
	 ZpgP+490ep10g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf5f4e82caso564625466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1fWM/4bOctunDTTKy4rR2CCrkYDcuHfgbSf5T4mPBDTnUF2erIqCLqLiEQlh+51P0/GxM/M6bXBl6/L0tgD4i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Hi0gGLEk7HxwMvGymhK/YxXxd05l66/JMLLOtleDDmA3KzmQ
	aMYfF3uLhoFN02TPuqnVRCqUEnyFgHPo8nj70En3zU0IXOWfsD/YsRV5YVQIpx5eBhhFzJlMAyK
	XpjLDCU1hIvEGm+jGOW3Luno2sg==
X-Google-Smtp-Source: AGHT+IGsfY6fqe2YQl8Oj3jQOJXYsrLKdp1WEPofGDKrpvMKW/z4zof5UMwhD4wjXSR+/W1s+f5P1D2nlfXqLF0F4Ms=
X-Received: by 2002:a17:907:d1a:b0:abf:d4a9:a0a5 with SMTP id
 a640c23a62f3a-abfd4a9b8fbmr946630666b.45.1741107804893; Tue, 04 Mar 2025
 09:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20250226124245.9856-1-s-vadapalli@ti.com> <20250226124245.9856-2-s-vadapalli@ti.com>
In-Reply-To: <20250226124245.9856-2-s-vadapalli@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Mar 2025 11:03:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDMecB3dD2oU2MJo-_8G66K-mVTfNKWUBuL-=_tWpjtw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo_MMcNezVZGplk__qmIGqhWMGwQvZlfARIVI6FBgde0NxdeBDApYXXBNM
Message-ID: <CAL_JsqKDMecB3dD2oU2MJo-_8G66K-mVTfNKWUBuL-=_tWpjtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe
 NTB functionality
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090327_971735_1409007E 
X-CRM114-Status: GOOD (  18.90  )
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

On Wed, Feb 26, 2025 at 6:43=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@ti=
.com> wrote:
>
> PCIe NTB (Non-Transparent-Bridge) allows connecting the memory of
> multiple PCIe Hosts (Root-Complex). The number of such hosts is
> determined by the number of PCIe instances configured for NTB operation
> on the device which intends to enable NTB functionality. Add a device-tre=
e
> overlay to configure PCIE0 and PCIE1 instances of PCIe on J721E EVM for N=
TB
> operation. This shall allow connecting the memory of two PCIe Hosts via
> PCIE0 and PCIE1 on J721E EVM.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> v1:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2025020209363=
6.2699064-2-s-vadapalli@ti.com/
> Changes since v1:
> - s/epf_bus/epf-bus since node names shouldn't contain underscores.
>
> Regards,
> Siddharth.
>
>  arch/arm64/boot/dts/ti/Makefile               |  4 +
>  .../boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso    | 91 +++++++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 8a4bdf87e2d4..1097ab30f5a9 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-beagleboneai64.dt=
b
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-common-proc-board-infotainment.dtbo
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-evm-gesi-exp-board.dtbo
> +dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-evm-pcie-ntb.dtbo
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-evm-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-evm-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-j721e-sk.dtb
> @@ -201,6 +202,8 @@ k3-j7200-evm-pcie1-ep-dtbs :=3D k3-j7200-common-proc-=
board.dtb \
>         k3-j7200-evm-pcie1-ep.dtbo
>  k3-j721e-common-proc-board-infotainment-dtbs :=3D k3-j721e-common-proc-b=
oard.dtb \
>         k3-j721e-common-proc-board-infotainment.dtbo
> +k3-j721e-evm-pcie-ntb-dtbs :=3D k3-j721e-common-proc-board.dtb \
> +       k3-j721e-evm-pcie-ntb.dtbo
>  k3-j721e-evm-pcie0-ep-dtbs :=3D k3-j721e-common-proc-board.dtb \
>         k3-j721e-evm-pcie0-ep.dtbo
>  k3-j721e-evm-pcie1-ep-dtbs :=3D k3-j721e-common-proc-board.dtb \
> @@ -239,6 +242,7 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
>         k3-am69-sk-pcie0-ep.dtb \
>         k3-j7200-evm-pcie1-ep.dtb \
>         k3-j721e-common-proc-board-infotainment.dtb \
> +       k3-j721e-evm-pcie-ntb.dtb \
>         k3-j721e-evm-pcie0-ep.dtb \
>         k3-j721e-evm-pcie1-ep.dtb \
>         k3-j721e-sk-csi2-dual-imx219.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso b/arch/arm=
64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
> new file mode 100644
> index 000000000000..9b6b3e153e91
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtso
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/**
> + * DT Overlay for enabling NTB functionality using PCIE0 and PCIE1 insta=
nces of
> + * PCIe on the J7 common processor board.
> + *
> + * J7 Common Processor Board Product Link: https://www.ti.com/tool/J721E=
XCPXEVM
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.co=
m/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +       epf-bus {
> +               compatible =3D "pci-epf-bus";

There is no such binding upstream nor one pending. This needs to be dropped=
.

Rob

