Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD53CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iinegymc/QgcSd+WM7rCc0T3f8qD5ZxV96/Dgux0+OY=; b=t5TkYjCczJJVJHsqfZZSILh55I
	bD93IWcEzU3hyp2om8xvV0lXItzGi7a+5WYm6795MohfDhnQgwi8w9aZNIY3Ag5QahR2KFs/aEU4R
	oKcztjNno+cQPvYSyWq/lbwu4+aidxPw/p0yEoyWNGYex0rUuC8avG0lQqniXmFywOR3hp+tv2aoE
	1WaJlFU75Zy+oGCCn3/6MwRLQaAOacjHRhgc7q7ItR950+ke2rzLdurUS2+JdZjIxFQHxAPzlBTdM
	rp4Q42QCznu1n7aBMwLeRrsiqq+KMxORlG3Z5+ioc1p3uNv5gHCzUi6owyFGe4nhFRR+yFCS5ALbB
	nI1/mcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Drq-00000002iHs-0Kqv;
	Tue, 07 Oct 2025 20:01:02 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Drn-00000002iH3-3vn8;
	Tue, 07 Oct 2025 20:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759867260; x=1791403260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NK24BaQ9xWl+tVnNXQiE60htjjVsEiyaZFyhIAwv8Lk=;
  b=lLmGfuz4A52UYH/0apuAExXWg4lMTMRpNZBl/HiqXojKxbBrOctyi7Gs
   K7VXxtd4U/37r3s+UYlYn7nAUT6Np3SnsRoGoa6axd2spUUi//E3HBzYr
   +5yBJw1D8vZv1WnJFA1QAvPBrwB4anuNw9Ruc8Agc6/dzM9CfdIScAxMi
   ji974XgR78f4bdzbQ7neya0qUUryMXGOJvznA69MPlcZmnPGwBNxn/RAc
   oePMPe3npaUsPhsmMtY7MTl4RPGczz2YgRFEdKbL5keG15YRuXRnyJKxn
   TOFzjR3Bg2oIcYiTEg9+OHjvD4hMHwnxjFm1+C2dGFPFLCfNtqPkRGxd6
   Q==;
X-CSE-ConnectionGUID: uH/0+cK5TaWgKECyX2h9Mw==
X-CSE-MsgGUID: kgOZzisNStq5Y8vzHstw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73482584"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="73482584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:00:59 -0700
X-CSE-ConnectionGUID: 9ETq42g/Trm9vsdAgEjDMg==
X-CSE-MsgGUID: j6SYt8suQBCKkEB45Z0qlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="179917379"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 13:00:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DA85011F8B0;
	Tue, 07 Oct 2025 23:00:49 +0300 (EEST)
Date: Tue, 7 Oct 2025 23:00:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v11 05/17] media: dt-bindings: add rockchip rk3568 mipi
 csi-2 receiver
Message-ID: <aOVxcQV-8c9m6Stg@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v11-5-af0eada54e5d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_130100_017910_9192F01B 
X-CRM114-Status: GOOD (  20.53  )
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

On Wed, Sep 17, 2025 at 05:38:45PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 150 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> new file mode 100644
> index 000000000000..8cbab93b4b85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 MIPI CSI-2 Receiver
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@collabora.com>
> +
> +description:
> +  The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one input port
> +  and one output port. It receives the data with the help of an external
> +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
> +  (VICAP) block.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mipi-csi
> +          - const: rockchip,rk3568-mipi-csi
> +      - const: rockchip,rk3568-mipi-csi
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
> +      - const: irq1
> +      - const: irq2
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
> +                enum: [1, 4]
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
> +        description: Output port connected to a RK3568 VICAP port.

As the VICAP port appears to be a DVP/Bt.565 receiver, also this output can
presumably be connected elsewhere, too.

Either way, aren't signal polarity or sampling related properties relevant
here, too, and perhaps more so for the VICAP bindings?

See e.g.
Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml .

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
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "irq1", "irq2";
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
> index 4c39b9fd80bb..2ac4b7a5b255 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21797,6 +21797,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
>  
> +ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
> +M:	Michael Riesch <michael.riesch@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>
> 

-- 
Kind regards,

Sakari Ailus

