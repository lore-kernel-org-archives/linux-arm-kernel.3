Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E760C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+kQ48gaseTkTCz2P41d3rK2dJVrdPGYWAsZ62yE+qQ=; b=ueEp+xNRFIQqa6dg+28kfq6xt9
	ffhbTbzCnfwmeH6/hanRmk8CazRuF2x+0AIM8H9yn+DL5ZdLMpmGqIYXEg6W4iJ3zQcJMfDRnpXHT
	wmqC2dxQBYgBGP1Bdwk+1EfJCM5pNZ6r3YteKT0O0qlpPs1toId5mlqAh/Ik/OVTbp99gJH4OSRe9
	3HcKzda/pkiwVUFMl0t7qZzhuL4i8Wunn/OuS1CkswZHSaw9UuLOBNFrsCg3SDB0WB6XPwudEzMkJ
	wxb7POppGpTEUJ0PRD9DsIwvfXBB0WSZp5M9a+O4iF8VYxyE1zkGANGAEAvsmwisf/Mf+KunMc1KZ
	JsISpKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJwW-0000000CRk2-2JzN;
	Tue, 06 May 2025 15:10:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH7D-0000000Br1p-1rKi;
	Tue, 06 May 2025 12:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746533379; x=1778069379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C1cNc1T1EZTLsEqWLlQZ4HP/ZrBdzYD7Gj1Q5X2lVgk=;
  b=LxCXDU9nvZUIIEkIba5hhP/VBcVFFGU47vCWbPlamV5gfBrgvNcGR5Y0
   e6boY7OoLJKpbmWH6t70wQj0eDyYjXc1eYF6ECcqqxzgUfi3QdWnUiXTc
   /mbnUXHwGWOLGg7CIhGJnlq0MHZHbnOC49soALAKoeag0pp74VB4/0R9k
   wkApKMFs97EZXUrha9DaGpjfPHLYkLvwPVKqzxgtVKm0G/sKzLCr89Zpa
   yNb0ReYe4w0P6ZxevvUOPSob+27/1+kku6PtUAVXPCvky7bxMjnk7T0Rm
   P1D0MB+Qs8WopUJKg5Cxq895015f+jOqcXJhj/7KWKiJfOaOBBYcKsX4Q
   Q==;
X-CSE-ConnectionGUID: h/ukJe2xQ1G8CE6DekP05A==
X-CSE-MsgGUID: rUx9n7gpQLWsGzvkswmeAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52007852"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="52007852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:09:38 -0700
X-CSE-ConnectionGUID: 2HCngJfPS4OtN3NFDHOPUQ==
X-CSE-MsgGUID: AkdwN2B/RO2PGMjkHhJ6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136595874"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.251])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:09:33 -0700
Date: Tue, 6 May 2025 14:09:24 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 05/13] media: dt-bindings: add rockchip rk3568 mipi
 csi receiver
Message-ID: <wxwzca4i36hdhdx5ehjqvq5ljpsb7lcvzermkhqyvufsr47au4@3qcth2vawwju>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-5-d2f5fbee1551@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_050939_494207_65DCAD2F 
X-CRM114-Status: GOOD (  19.23  )
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

thank you for the patch!

On Wed, Apr 30, 2025 at 11:15:54AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 113 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> new file mode 100644
> index 000000000000..d5004cb288dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> @@ -0,0 +1,113 @@
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
> +    const: rockchip,rk3568-mipi-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI C-PHY or D-PHY.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
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

shouldn't you add data-lanes property here ?

                 data-lanes:
                   minItems: 1
                   maxItems: 4
> +
> +            required:
> +              - bus-type

and add it to required:
                 - data-lanes

you are actually checking for data-lanes when you enable the stream in:

rkcif-mipi-csi-receiver.c +226

	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;

	if (lanes < 1 || lanes > 4)
		return -EINVAL;

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port connected to a RK3568 VICAP port.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - phys
> +  - phy-names
> +  - ports
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
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

--
Kind Regards
Mehdi Djait

