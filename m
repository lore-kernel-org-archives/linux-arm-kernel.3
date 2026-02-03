Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A7BE8305B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNR5RxTwzTtZsop8+J+WBmJB6mqTYo7/2/cKx2YLwz8=; b=J6FcMHZY+l/7vT4MOMJibMCRYL
	Wht1sz5lITnbMeSnf9xENM11fW5XC+aZed71zsD54pOD16dg66JsYfac764R2vPUh9nrf3Lx3TDX0
	+gMfzYjb+8DL4qqgJmxsSBP7oCp/yZQoIM8/f9Bqd8+6hXWH3GoN0eToomckCs2ZcEoaJOreGoarY
	V3jcneyIPCedvoyOtC8yuE9HevCTxv7cRojM4UToo4hDOFE/KcsEgyUTSR6iyUCb5+HXScRpa4fuE
	6l6IBkZq3/4n9ryLBqWwqPtYal0tZtXzkaKx4igrX0h9qShWQC9IOlnE/D+L8gma/8Nh/SN2l9jWc
	jvBC51eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnAhZ-00000006Edn-2zr9;
	Tue, 03 Feb 2026 07:19:57 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnAhU-00000006EdL-37cM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 07:19:56 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=QNR5RxTwzTtZsop8+J+WBmJB6mqTYo7/2/cKx2YLwz8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770103174;
 b=BbrVJ0uXn/tN0is/CRh13jUy35K66wixtHSV4e88h6dxX+yFxMLsukAyyy9O+IucEm9NzdXR
 nZtssDDyDEBzzUWr0GdQPTU08lUJqyrcdTjkOGVKC/XCzEAg2NOdlzqSHrNTeSae3+2ONMpR0s/
 ViYyKkarUg/L7cig8o2iwNrU3qAzYR9YmZvcUXUex8bBZUOQ9nwSui0KN+Qcd5AgpAp/GKOEcQZ
 ErrlN7W2rsLAfu5Sl27FK5FM0axrcfdmMVd0+MrmOvxxIQj/6DeuWSMDTRAqv6X2JoXQ8K5h/g5
 mENx2z8Lzmdxl+uPM9DVvUI0Yqiz/iFWgU28DTZSCSx9Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770103174;
 b=ol4ETlcid1NFt0lokZx9cabNHqVAT8NF5XSPg4PpVch5bC3AvOn3A2651q02UpQx4oNLGbgK
 Rmu3B6XXgw0686f3ywfj7wedZdwHgaXXDyoGgzotwuCKlyUV+t/vXQPWL1IgCqHPY3bfa8+hzS6
 iN9jIX4C69lVUaWMMMzG17ODy9uYjLU4uRKLlWXPk+gx4s+cQRR4Ob5SFA+RR4eSSW9K6jHa8CJ
 aYcXHR5eCtAzn973FrQCoabeiEiU8pfPg9EvNpQc1CQl9mVUg8vioVaJe11JLGAcKW1Q+1EomW2
 9/WtGTDcvVpgyrWqFYpIRP/rcmHUHfFTjBZl2/xnjWHEg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 03 Feb 2026 08:19:34 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 36261A41052;
	Tue,  3 Feb 2026 08:19:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Date: Tue, 03 Feb 2026 08:19:13 +0100
Message-ID: <2820312.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f4vxH13xBz3ybHd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b6b042cd698d2248267929566eccc0fd
X-cloud-security: scantime:2.015
DKIM-Signature: a=rsa-sha256;
 bh=QNR5RxTwzTtZsop8+J+WBmJB6mqTYo7/2/cKx2YLwz8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770103173; v=1;
 b=pwya1JUzHs5FYxy1RheV2mYcyXVq8oFEvjmQbdmkS7J+5W3xcWPccbw9c3mwbcMW6wEx+boD
 hXbS54nx485WFfZsgRVlv9+h9TCcmwdehjyAijqdaWR5nJGXiMZ2qgI3CcK/cj+g5OSLbGhXPXs
 PsZddK7qoUkx6oh3gBKM213MNnozA2+/i0Edp/2TVxXlc7lzzWzEvN71uE+SjKYKozC2ngbFUzr
 E+9/zTImRluwk7zDM4Y3/xb9a2hSnxSK4vitl6yuO+Jm8Ek+dBMrc+Kn3eqH0/ks+z81zJGUFkh
 fe6C7Y41EzM4kMChPwrz5FzLPZJuCEEv5GLTw1Gly+jTQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_231953_050434_ACE9C4C1 
X-CRM114-Status: GOOD (  24.53  )
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

Am Montag, 2. Februar 2026, 11:27:45 CET schrieb Xu Yang:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
>=20
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
>=20
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
>=20
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++=
++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Do=
cumentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bc6b9743396e8f6b698706caa=
e71241b0512ce8b
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
> +          - fsl,imx95-dwc3
> +          - fsl,imx943-dwc3
> +          - fsl,imx8mp-dwc3

Can you please sort this? I would have expected the exact reverse ordering.

> +      - const: fsl,imx-dwc3
> +
> +  reg:
> +    items:
> +      - description: DWC3 core registers.
> +      - description: HSIO Block Control registers.
> +      - description: Wrapper registers of dwc3 core.
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: blkctl
> +      - const: glue
> +
> +  interrupts:
> +    items:
> +      - description: DWC3 controller interrupt.
> +      - description: Wakeup interrupt from glue logic.
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
> +      - description: Suspend clock used for usb wakeup logic.
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
> +      permanently attached.
> +
> +  fsl,disable-port-power-control:
> +    type: boolean
> +    description:
> +      Indicates whether the host controller implementation includes port
> +      power control. Defines Bit 3 in capability register (HCCPARAMS).
> +
> +  fsl,over-current-active-low:
> +    type: boolean
> +    description:
> +      Over current signal polarity is active low.
> +
> +  fsl,power-active-low:
> +    type: boolean
> +    description:
> +      Power pad (PWR) polarity is active low.
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
> =20
> +deprecated: true
> +
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - const: fsl,imx95-dwc3
> +            - const: fsl,imx8mp-dwc3

Same here.

Best regards,
Alexander

> +        - const: fsl,imx8mp-dwc3
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



