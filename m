Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D09C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgEkIOIF76ZgViNLeyoGWKf5mQ4AR1pJnHJ7Vsv45ag=; b=vFjV2qxgj34sKeNB5/jDDpQV2f
	9SYc7bdw/2yCETzAx3/s0HoDQA+tpRCEMjoDo0aEeZZOtPgfOug8ZJBX0Jibh3zOSAzWhURFdxnA+
	9AuT6fqSRohpU2+IwU3QerwVIJrmECH6HN5o8ezlj/Sljx+FI7lbzdpNDwGT8UFsEO0F3sl3IaKQn
	od404bJqT1yVAHc5dBYbNwurKLgkiW1v9IrQR+MEw1O55dJ69sTA7fuvz6WlgJVnB5OBC54qAP3Ot
	NmUvlpU7TAzi35f1d51mKGg5UctkmxSQqMEt1MqkrZ97kfWo+eZfjX5Ym45pAYafKch/+/B5np8U7
	sGUYXKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlU09-00000005olm-3O0a;
	Fri, 21 Feb 2025 14:27:38 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTjo-00000005lUu-3gMv;
	Fri, 21 Feb 2025 14:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740147045; x=1771683045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRkollq7aUdEod9DwGNTqSYaedg1P55G6GG07rIbd3s=;
  b=WiFyFSpBULzOhSatSAlD17xCjMxwshtsVZ7Pxlna4e2H3jJAqIaMCEpL
   2O8jcup/JptTn1/5WBwAwWgwrGmDtG4+wyMoyr0Wi6cRYtNWxIeo7o1Ip
   NJTIf5pKHKToQd7xfx1rqHIPVwj2iMKPsVwZT6G1NM+/RgTGk8AtEamri
   i0vPPHNTiwrF6Dbb6IdU9T9efyEPWW3JWzfxBIpTaB13iFQrSEA1XNOCT
   zmGZVdyXpaVaITuk/lbMRsiuOaL2QN616whngIRJcQdBIMMV27QlAAo94
   7LekHKECfA+SQrJ1zmq7x/hek1NhjnpZ9FSHDMcylzqxiR2MEn9K4t1Ct
   w==;
X-CSE-ConnectionGUID: eEiWjaMFR3GO2MRdIs99cQ==
X-CSE-MsgGUID: Xkow/YT9QW6hvlRb+H60BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40842072"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40842072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:10:40 -0800
X-CSE-ConnectionGUID: aCI6g3nqRDavtpRc+aawEg==
X-CSE-MsgGUID: e6xGiywaQ1+G1N9OiCqMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120361076"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:10:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 36155120289;
	Fri, 21 Feb 2025 16:10:31 +0200 (EET)
Date: Fri, 21 Feb 2025 14:10:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061044_932191_DCCF59AB 
X-CRM114-Status: GOOD (  23.09  )
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

Thanks for the update.

On Wed, Feb 19, 2025 at 11:16:34AM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 169 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> new file mode 100644
> index 000000000000..3dc15efeb32e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3568 Video Capture (VICAP)
> +
> +maintainers:
> +  - Michael Riesch <michael.riesch@wolfvision.net>
> +
> +description:
> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> +  the data from camera sensors, video decoders, or other companion ICs and
> +  transfers it into system main memory by AXI bus.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3568-vicap
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ACLK
> +      - description: HCLK
> +      - description: DCLK
> +      - description: ICLK
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: dclk
> +      - const: iclk
> +
> +  rockchip,cif-clk-delaynum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
> +    description:
> +      Delay the DVP path clock input to align the sampling phase, only valid
> +      in dual edge sampling mode.

I suppose there's further documentation on this somewhere else? A reference
would be nice.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: ARST
> +      - description: HRST
> +      - description: DRST
> +      - description: PRST
> +      - description: IRST
> +
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: hrst
> +      - const: drst
> +      - const: prst
> +      - const: irst
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to general register file used for video input block control.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          The digital video port (DVP, a parallel video interface).
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The MIPI CSI-2 port.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

Don't you need things like data-lanes here? Or is this a single lane
receiver?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vicap: video-capture@fdfe0000 {
> +            compatible = "rockchip,rk3568-vicap";
> +            reg = <0x0 0xfdfe0000 0x0 0x200>;
> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +            assigned-clocks = <&cru DCLK_VICAP>;
> +            assigned-clock-rates = <300000000>;
> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
> +            clock-names = "aclk", "hclk", "dclk", "iclk";
> +            iommus = <&vicap_mmu>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
> +                     <&cru SRST_I_VICAP>;
> +            reset-names = "arst", "hrst", "drst", "prst", "irst";
> +            rockchip,grf = <&grf>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                vicap_dvp: port@0 {
> +                    reg = <0>;
> +
> +                    vicap_dvp_input: endpoint {
> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
> +                        bus-width = <16>;
> +                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
> +                        remote-endpoint = <&it6801_output>;
> +                    };
> +                };
> +
> +                vicap_mipi: port@1 {
> +                    reg = <1>;

Where is the endpoint?

> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bbfaf35d50c6..cd8fa1afe5eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> 

-- 
Kind regards,

Sakari Ailus

