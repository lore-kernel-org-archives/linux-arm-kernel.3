Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7827AD47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BwpbF6mTf6OE9jXey3+OGBc2CoXj3IOy1mRP+cjzaM=; b=VKXjEtg88qvVSDvpusF3wIQ6GM
	IZClPJezPxJOrqCBI8d1INbwT9kiezVWRgK/IUTYg4yHz5L5z4m9mxzqQShkzsvxiN7swyvFGD+G4
	nIOrw8AVGhuhIxVjfgm6U24z4n4We80paEGZMc1I85vhKv/UKwg8czai312TX0+Uf4+/UsUDIKyQ/
	IvjCFbYuCQ66DXxOQi5JJy8VOjflmuNNWOrzyU5wDHUNNell3K6238b9axIVeEGdLs4sRCxELRrgx
	rzxsuQ/fzHjV/m1yIZ0AtslCQ24ofQJi1tnVZ/b3KTqMfWn4Popdx+/FRc4tvDIwY29IcdnrlDlMc
	3JkRW1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggno-0000000Duk1-1pUR;
	Fri, 16 Jan 2026 10:11:36 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggnk-0000000Duil-35GO;
	Fri, 16 Jan 2026 10:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768558293; x=1800094293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXms3wV+dr/BvdIE0bkqbm0VBHZBrUrXZywM475Coa0=;
  b=VcoMQw2SatamVcWlMLanQyJiHkOr9n2bEkBulqt1ZZjiofl/T6u+uIDn
   gXXfHj2qGe0kEb0sDFQRs10hxfMwRMq14k699c4CbrFG9C75YZ45KH19X
   xr6W+G/eumH7ZaBLzXOX+9EQRd4cRAGpRWfrmaWtzL8zAxSG1yRQO3Xsd
   q0tqqn9qnqQs8tigxd/vEEHJ4xbs3fAVpoTvESJ+qdbMpfcePOOJjC5db
   h1TjkTxD1Descgd0mIBRSyoKZYLcSqQAtaDAbpp5H1hUrkxltV7Qp/+d9
   Nr0goWWdgG3/4+lfbaD+BYoisdAFwQaWML0rJThimeH2b0AhxnkUBwHyY
   Q==;
X-CSE-ConnectionGUID: 4dLCkWwmQcy87EdhYUSlIw==
X-CSE-MsgGUID: b6YweGTAQvWqXTjsYiZhsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="70038363"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="70038363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:11:32 -0800
X-CSE-ConnectionGUID: aot0kgc3R3qKz+Vp58al2Q==
X-CSE-MsgGUID: jcnNr+btQymo4lY4jHry6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209702430"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:11:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 86BF9121D8E;
	Fri, 16 Jan 2026 12:11:26 +0200 (EET)
Date: Fri, 16 Jan 2026 12:11:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
Message-ID: <aWoOzn_d7ixgbzj4@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_021132_837320_300ECBD8 
X-CRM114-Status: GOOD (  22.73  )
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

Hi Michael,

On Thu, Jan 15, 2026 at 07:26:07PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 147 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> new file mode 100644
> index 000000000000..2c2bd87582eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml

I'd add a compatible string for the base IP block and name it accordingly.

> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip MIPI CSI-2 Receiver
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip MIPI CSI-2 Receiver is a CSI-2 bridge with one input port and
> +  one output port. It receives the data with the help of an external MIPI PHY
> +  (C-PHY or D-PHY) and passes it to the Rockchip Video Capture (VICAP) block.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt that signals changes in CSI2HOST_ERR1.
> +      - description: Interrupt that signals changes in CSI2HOST_ERR2.
> +
> +  interrupt-names:
> +    items:
> +      - const: err1
> +      - const: err2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI C-PHY or D-PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - bus-type
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port connected to a Rockchip VICAP port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - ports
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    soc {
> +        interrupt-parent = <&gic>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi2";

This would become e.g.

            compatible = "rockchip,rk3568-mipi-csi2", "snps,dw-mipi-csi2rx";

See my comments on the driver patch as well.

> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "err1", "err2";
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in: port@0 {
> +                    reg = <0>;
> +
> +                    csi_input: endpoint {
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&imx415_output>;
> +                    };
> +                };
> +
> +                csi_out: port@1 {
> +                    reg = <1>;
> +
> +                    csi_output: endpoint {
> +                        remote-endpoint = <&vicap_mipi_input>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc68ee0c68c0..965132e0933a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25364,6 +25364,12 @@ S:	Maintained
>  F:	drivers/i2c/busses/i2c-designware-amdisp.c
>  F:	include/linux/soc/amd/isp4_misc.h
>  
> +SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
> +M:	Michael Riesch <michael.riesch@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> +
>  SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>  M:	Jaehoon Chung <jh80.chung@samsung.com>
>  M:	Shawn Lin <shawn.lin@rock-chips.com>
> 

-- 
Kind regards,

Sakari Ailus

