Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060DDC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpvhLzEBq0lR5CKgdXvuENuVjDS0jpYi1nsysUNhf3A=; b=XgUN7h0OhSUuC863iLvhZPmcmE
	NSQt16ypZELAyqEOqV5I4h8xTTa0W92I8BEZ+P2SlRRAcu0otgFvJ9FZRQzrKL3jZlElAD15vfKXz
	wvLeq1LU8APZizNOeZcG2pJf8J+RlGqKynutxoZvKuqNZMH7nigqM+uyHTwfMxPS+2wk57Fv7BELX
	FGHg2Qh1CdH3YGShDvk8lg4ZTNmtKYfDutHr2v6NmNTwjJa20U+bKa0ieC0IRbonpfnRipP8Wc0z8
	Db11SvW7NjE4qcH+bskPFL2w0ALvHB1CNPazMRiogfeD3xkaslTATiDfIcW2vYAYhMVAfdlmvD2r2
	4XcLKJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u529I-00000009Z4k-1ucC;
	Wed, 16 Apr 2025 12:45:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5261-00000009YZE-3Ry4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30B385C5D04;
	Wed, 16 Apr 2025 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1CEC4CEE2;
	Wed, 16 Apr 2025 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744807347;
	bh=YaLyJ2LyojkdkHa6UjzZZ5YY5cd2AoOll8QQL7QvgqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQf7FTiLueTna3mVqCVJ04IS1e4UW2CrQdmeBOPzquGZ5diNSIX8FAxdcU8mYoxrR
	 mBoNq4BK0HYCEzl+yInEai3zaXntIGCoLgrszNd6pqh+vKdITUUL6Kvw0sa4WHOAMC
	 VFlJM0Yq0Wuqyr7MHvO6gapNWev6kQC4tx1Cpa98wtzEz391rx9H23RTW7gqwxJabT
	 RbUlMSu3SEO5xx+fmo17D7Q6FMhetFapfP/Ry204hkndMr0hRjtAtEDtvmF/jycTR6
	 De4CQ5fO5g3pQMAl2v54Lg4auQmztCiPsX9JYou38B5zn+p3BmEbmaF1IvkBFhXRWM
	 UR4MoCeRknWRg==
Date: Wed, 16 Apr 2025 07:42:26 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
Message-ID: <20250416124226.GA2498696-robh@kernel.org>
References: <20250414210720.3359301-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414210720.3359301-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_054229_949055_DD946A28 
X-CRM114-Status: GOOD (  24.90  )
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

On Mon, Apr 14, 2025 at 05:07:18PM -0400, Frank Li wrote:
> Convert binding doc imx.txt to yaml format. Create two yaml files:
> fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> 
> Additional changes:
> - add example for fsl,imx6-mipi-csi2
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
>  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/media/imx.txt         |  53 --------
>  3 files changed, 164 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> new file mode 100644
> index 0000000000000..77be3c1f37c5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsystem.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX Media Video Device
> +
> +description:
> +  This is the media controller node for video capture support. It is a
> +  virtual device that lists the camera serial interface nodes that the
> +  media device will control
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx-capture-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Should contain a list of phandles pointing to camera
> +      sensor interface ports of IPU devices.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    capture-subsystem {
> +        compatible = "fsl,imx-capture-subsystem";
> +        ports = <&ipu1_csi0>, <&ipu1_csi1>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
> new file mode 100644
> index 0000000000000..1e69a1ff868cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6-mipi-csi2.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI CSI-2 Receiver core in the i.MX SoC
> +
> +description:
> +  This is the device node for the MIPI CSI-2 Receiver core in the i.MX
> +  SoC. This is a Synopsys Designware MIPI CSI-2 host controller core
> +  combined with a D-PHY core mixed into the same register block. In
> +  addition this device consists of an i.MX-specific "CSI2IPU gasket"
> +  glue logic, also controlled from the same register block. The CSI2IPU
> +  gasket demultiplexes the four virtual channel streams from the host
> +  controller's 32-bit output image bus onto four 16-bit parallel busses
> +  to the i.MX IPU CSIs.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx6-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: hsi_tx (the D-PHY clock)
> +      - description: video_27m (D-PHY PLL reference clock)
> +      - description: eim_podf;
> +
> +  clock-names:
> +    items:
> +      - const: dphy
> +      - const: ref
> +      - const: pix
> +
> +  interrupts:
> +    maxItems: 2

Need to define each entry though the original binding is not too helpful 
there.

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  port@0:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            minItems: 1
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - data-lanes
> +
> +patternProperties:
> +  '^port@[1-4]':

'^port@[1-4]$'

> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description:
> +      ports 1 through 4 are output ports connecting with parallel bus sink
> +      endpoint nodes and correspond to the four MIPI CSI-2 virtual channel
> +      outputs.
> +
> +    properties:
> +      endpoint@0:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +      endpoint@1:
> +        $ref: video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    mipi@21dc000 {
> +        compatible = "fsl,imx6-mipi-csi2";
> +        reg = <0x021dc000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        clocks = <&clks IMX6QDL_CLK_HSI_TX>,
> +                 <&clks IMX6QDL_CLK_VIDEO_27M>,
> +                 <&clks IMX6QDL_CLK_EIM_PODF>;
> +        clock-names = "dphy", "ref", "pix";
> +
> +        port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +                remote-endpoint = <&ov5640_to_mipi_csi2>;
> +                clock-lanes = <0>;
> +                data-lanes = <1 2>;
> +            };
> +        };

I would think at least 1 output port is required?


> +    };
> +

