Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9184E8307C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PjivaO6AkZUBjWQn1LsOs42p1r07xdaorVu9bCVbrs=; b=hFDlmcm0vCLw70sewc81xq3DQX
	/9g67XgAvlNzN7D7on1SBumhJnMQyu5Gt2p0qKfNSbl6FOPb10oDA0YaCwQUpYXP1IvUM1QHRwhO6
	tpTwd3eAGuRUA1S874lmiQEKNvYDIUipCsN68Q+oSyq4u7Jfk23/71yYi4/RucSRc/4G0x1YgpkAU
	/Sv3WcyrBicSGE81jFn2OozGlCiY2xnbTwxojJxVg99lSoSbBKdd+MMtEw+2Dq6YgderI68uURSSz
	BSNZF7B1Yfc9b88naTM32jWrzoW1ctqtQ3H0C9On7sUVPgTG6jRh040DUmfHq1mAAT0t1KOF/rv8n
	q7cRqEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndD9-00000008Xdw-21Em;
	Wed, 04 Feb 2026 13:46:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndD8-00000008Xda-3NXv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D35760133
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 13:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296D1C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770212785;
	bh=FeNff6zrjmWciUFlh0FSiM0w5E8BMY8phPcL5rje6kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BN55b8y8vF/yHrrykpQ43Zn0LHvDzf2+bGJNgcy6WXsqL4Kpv1QojF89LlTyE93bE
	 njQmmPFPEuUm2wamRAPJCprkjdqXLHEev03w5hsMDeYoOdk2ebeDC41AhsuOOSJ+Bq
	 ffj/zE1iT4/bd9826iLY+1XyCs4BXnpptBMJaeUQC0pfDLL3CSQ1+AuxBx4oay0Uxl
	 GH3CHfp0B0M1rGxCZMrwc0XlmfO0KyDX3WfKw61mVghM/QZMe+xMkZrNqPZ0Rpf8O5
	 0tjqJpkOxRcyKY1bvpBVOk852tpdUVo8d8aVCLmsvM2/dkHkg/TQ8W5GKGvMqvyh0f
	 W3YlP0Bfbn4Tg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b884cb1e717so139136166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:46:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCUVdX05Srjef1McGobDzBfKEiAGtKXOGy12oHNBkTplFwbmrYlouEWB03V7WSckkCNWEdWQOGBrzlxycn5wF9@lists.infradead.org
X-Gm-Message-State: AOJu0YxnHPI3nWkcwN3GUZsTcZR+uv3sNxglIX9h4DKomf6DCGz9Yauw
	MfbNTyvA8xflwGhqBzA30hllcn3zVepaw81eqRu1BDf2rua5Cpr08GFjkPz9kYf8f5YmVp//Ehy
	2LlNrrJBAVqFGLCB2HxFVsco/a1mkLA==
X-Received: by 2002:a17:907:7ba1:b0:b88:440b:65c4 with SMTP id
 a640c23a62f3a-b8e838d36e3mr446539666b.25.1770212783590; Wed, 04 Feb 2026
 05:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
 <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Feb 2026 07:46:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
X-Gm-Features: AZwV_QjSgm66I4Qb-FM5KDeDvEBpAt3nGOL-hi0EvlGrPlxaGX84UJJRpnPN54o
Message-ID: <CAL_JsqLcqSKgNjx2nejwjSsNPwqAmEsRHX-6YwE-8r_32C4=ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 4, 2026 at 5:05=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
>
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
>
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
>
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++=
++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Do=
cumentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6932804516948bc0f8457553e=
ee7e5ee704237f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2026 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Soc USB Controller
> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: fsl,imx-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx8mp-dwc3

You can't reuse the same compatible for a new binding.

> +          - fsl,imx94-dwc3
> +          - fsl,imx95-dwc3
> +      - const: fsl,imx-dwc3

Drop. If you want a fallback, use the 1st SoC's compatible.

> +
> +  reg:
> +    items:
> +      - description: DWC3 core registers
> +      - description: HSIO Block Control registers
> +      - description: Wrapper registers of dwc3 core
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: blkctl
> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: DWC3 controller interrupt
> +      - description: Wakeup interrupt from glue logic
> +
> +  interrupt-names:
> +    items:
> +      - const: dwc_usb3
> +      - const: wakeup
> +
> +  iommus:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System hsio root clock
> +      - description: SoC Bus Clock for AHB/AXI/Native
> +      - description: Reference clock for generating ITP when UTMI/ULPI P=
HY is suspended
> +      - description: Suspend clock used for usb wakeup logic
> +
> +  clock-names:
> +    items:
> +      - const: hsio
> +      - const: bus_early
> +      - const: ref
> +      - const: suspend
> +
> +  fsl,permanently-attached:
> +    type: boolean
> +    description:
> +      Indicates if the device attached to a downstream port is
> +      permanently attached
> +
> +  fsl,disable-port-power-control:
> +    type: boolean
> +    description:
> +      Indicates whether the host controller implementation includes port
> +      power control. Defines Bit 3 in capability register (HCCPARAMS)
> +
> +  fsl,over-current-active-low:
> +    type: boolean
> +    description:
> +      Over current signal polarity is active low
> +
> +  fsl,power-active-low:
> +    type: boolean
> +    description:
> +      Power pad (PWR) polarity is active low
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@4c100000 {
> +      compatible =3D "fsl,imx943-dwc3", "fsl,imx-dwc3";
> +      reg =3D <0x4c100000 0x10000>,
> +            <0x4c010010 0x04>,
> +            <0x4c1f0000 0x20>;
> +      reg-names =3D "core", "blkctl", "glue";
> +      clocks =3D <&scmi_clk 74>,    //IMX94_CLK_HSIO
> +               <&scmi_clk 74>,    //IMX94_CLK_HSIO
> +               <&scmi_clk 2>,     //IMX94_CLK_24M
> +               <&scmi_clk 1>;     //IMX94_CLK_32K
> +      clock-names =3D "hsio", "bus_early", "ref", "suspend";
> +      interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names =3D "dwc_usb3", "wakeup";
> +      power-domains =3D <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
> +      phys =3D <&usb3_phy>, <&usb3_phy>;
> +      phy-names =3D "usb2-phy", "usb3-phy";
> +      snps,gfladj-refclk-lpm-sel-quirk;
> +      snps,parkmode-disable-ss-quirk;
> +      status =3D "disabled";

Examples should be enabled.

> +    };
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b=
/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> index 73e7a60a0060dee6417b9469251e121704b7a148..fd23c345149e0dba1ed3919a2=
5195edf247cfc08 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> @@ -10,6 +10,19 @@ title: NXP iMX8MP Soc USB Controller
>  maintainers:
>    - Li Jun <jun.li@nxp.com>
>
> +deprecated: true
> +
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - const: fsl,imx95-dwc3
> +            - const: fsl,imx8mp-dwc3
> +        - const: fsl,imx8mp-dwc3
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
>
> --
> 2.34.1
>
>

