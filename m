Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41474D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxqO74GvRwF3xgkuVPuR8lpXGraHCG+lP66mGGarGQg=; b=Re2Ha2n48gJ/pPH5yqpMyMqpqR
	KZEIQIM3HmUBm1CdD2gS+uLRIlf5LQdnqe1KuvDOqHt+D+6IilsKXVPoknWLAXhEBCE0CHuutARCB
	LD4Do74UsKAYoyfs1qyAwbx/bxoZR4gxn5ziUAheEd7jNZLkXqGBVmfDYHaPCzX6uCw6e20mokhlz
	txq30a1aaftaUeM9FV2x4iPa8z5Edzvi8RlNzXdiuD2TzMZNwouAhU9Wdr3NlY3pdWBNqA8eVJc3r
	lyvo0ed+rgpVSuj3j+UmxAfGoBlKJ7GrE0jeADTKWoZmDAJhtbK5RjT5DGknJZ444ML/KOfDjSGWx
	ulhwckrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQ3F-0000000COHw-257d;
	Mon, 08 Dec 2025 01:28:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQ3C-0000000COHd-3jTG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 01:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B43C4600AC;
	Mon,  8 Dec 2025 01:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A2EC4CEFB;
	Mon,  8 Dec 2025 01:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765157309;
	bh=EdG95QZ0thcwVxnSLXQVKWQuULwbEqcqlz9F/E2H+qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxCO2s6scq9MCexy9brYAm+h5FqAHmgU/1NpJ1ZmA7T3ak9C9bmY7jMbOTNXvPjUM
	 k6AddidjkTquiCgFjd25lwHE4z3GnLgtNJVeE0i9BowE8dFByy7MQCGhhwqiN3X4G2
	 ZMdndUtqJrEDi59A2lnSZ5VEo4nEXM16V4l+ZZ86np5RDZLUt2EBDxNkbp9Xk1EICb
	 YXAJE1WP3iYxw5U6yq6wXBQoBadokref0b/nWAEPzcKVm2g8D6qznyhkmlit0fMybd
	 OQdjvbQflFlUM4FzXS+76JM9ca+jHqFT8zZZPLUCTfyLXAj+bxDTliLa8umsuxWeZ/
	 3HsOQmZ4VWo+A==
Date: Sun, 7 Dec 2025 19:28:26 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251208012826.GA340359-robh@kernel.org>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
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

On Tue, Dec 02, 2025 at 02:32:58PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +

And 'ranges' needed.

>    '#power-domain-cells':
>      const: 1
>  
> @@ -40,6 +46,60 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  bridge@60:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: nxp,imx93-pdfc
> +
> +      reg:
> +        maxItems: 1
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: Output port node to downstream pixel data receivers.
> +
> +            properties:
> +              endpoint:
> +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +                unevaluatedProperties: false
> +
> +                properties:
> +                  bus-width:
> +                    enum: [ 16, 18, 24 ]
> +                    description:
> +                      Specify the physical parallel bus width.
> +
> +                      This property is optional if the display bus-width
> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> +                      is connected and all 18-bit data lanes are muxed to the
> +                      parallel-output pads.
> +
> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - ports
> +
>  allOf:
>    - if:
>        properties:
> @@ -81,9 +141,12 @@ allOf:
>              - const: isi
>              - const: csi
>              - const: dsi
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'
>    - power-domains
>    - clocks
>    - clock-names
> @@ -112,4 +175,33 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      bridge@60 {
> +        compatible = "nxp,imx93-pdfc";
> +        reg = <0x60 0x4>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint = <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint = <&panel_from_pdfc>;
> +              bus-width = <18>;
> +            };
> +          };
> +        };
> +      };
>      };
> 
> -- 
> 2.47.3
> 

