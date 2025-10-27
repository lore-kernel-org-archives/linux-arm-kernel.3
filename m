Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E567CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vcpvhF5urzAN7K3wpgk7xwaAxcma2kFDIrKQc/Gknc=; b=iP/niRSEy8I4jHIMnosr9zEdHo
	HZ9vZO5ZbmYeN+F8j3WUCQyhTYHxWNgrtVBZJxip8NZ6BDIaWRv35pftmvit/5iLvSc1qtsE+RPOr
	586pCdIU/kyd8sWU0o8SdVbSUTItQGjeM5qGMb1/9iCfUlmpQrPuT642E++t1txe3/MLuVYS5O1Zi
	Ao1ICkMsaXNvGFWQht9UsqqxvLCobIQQ00ALc1xB0ovbszXEP688U8qYyD+Z3VSm26oMwwDa5xXbT
	TOsBfAXTNM3ACTrJAIue9Cx0nW4JwZ05bVvXu3q7R4ydQIOy7w/EPl6bfO3Fs9uuZeSG7nLWGLVrn
	ttM2w7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIde-0000000DLru-0nkA;
	Mon, 27 Oct 2025 08:31:38 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIda-0000000DLqt-3zsQ;
	Mon, 27 Oct 2025 08:31:36 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cw6DG3ZVczyS8;
	Mon, 27 Oct 2025 10:31:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761553888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vcpvhF5urzAN7K3wpgk7xwaAxcma2kFDIrKQc/Gknc=;
	b=SVci1QMIf6DQF3QJGG6IvxwWPCCbeqZpjSffOVgw1knI3OfEpMa+G6gdxdn2Yzy9prXKlg
	4raZJXlHxv1qKxzaZRr/UGPh/FRPZnDXRB1Vta9BvD/O5DZLotO3ffjLskNvHNu+getjJh
	xomqgH/huEHMNVf9Xy3nng+mq+sUZeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761553888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vcpvhF5urzAN7K3wpgk7xwaAxcma2kFDIrKQc/Gknc=;
	b=OgulRCt6/GZcUbYBPfcrCRPu+lmQT1TxrG7z/LT4wj+NJisiYYy1d/gbKmn+2qOwBGr6wW
	OIb9jJlAeQSyjfmf3aQEJBs1Y+jimmhzgLgUDp6P4pYpRRQvA14BlF3pZYLcz5qFoH0gjQ
	9AwvIj8IXmsmpEnxa6Z0rjCPN78fJkk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761553888; a=rsa-sha256; cv=none;
	b=Z6M5vn5d0QQk5z/e5iYJ7DRxmHK4SMNRhbBubBTvj2QrecRm7CrcadKe+bud7GW1yetIvu
	VFDSbnEv4nI353DHC8Unb92tNPpPiCc/rJ4n2nUdS8IYLhbFQGtWNQWVdA10QP4wlhL4Nm
	g/G84m8AW/FJogYPDXDBuy7847tmU9o=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A06EA634C5E;
	Mon, 27 Oct 2025 10:31:25 +0200 (EET)
Date: Mon, 27 Oct 2025 10:31:25 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v3 01/31] dt-bindings: media: add DW MIPI CSI-2 Host
 support
Message-ID: <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_013135_178188_D2520D45 
X-CRM114-Status: GOOD (  20.45  )
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

Hei Eugen,

On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> From: Eugen Hristev <eugen.hristev@linaro.org>
> 
> Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> and i.MX95 platform.
> 
> Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3
> - drop remote-endpoint: true
> - drop clock-lanes
> 
> Change in v2
> - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> - update ugen Hristev's s-o-b tag to align original author's email address
> - remove single snps,dw-mipi-csi2-v150 compatible string
> - move additionalProperties after required
> ---
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 152 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> +  camera. It will convert the incoming CSI-2 stream into a dedicated
> +  interface called the Synopsys IDI (Image Data Interface).
> +  This interface is a 32-bit SoC internal only, and can be assimilated
> +  with a CSI-2 interface.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx93-mipi-csi2
> +      - const: snps,dw-mipi-csi2-v150
> +
> +  reg:
> +    items:
> +      - description: MIPI CSI-2 core register
> +
> +  reg-names:
> +    items:
> +      - const: core
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: per
> +      - const: pixel
> +
> +  phys:
> +    maxItems: 1
> +    description: MIPI D-PHY
> +
> +  phy-names:
> +    items:
> +      - const: rx
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
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
> +          Input port node, single endpoint describing the input port.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description: Endpoint connected to input device
> +
> +            properties:
> +              bus-type:
> +                const: 4

If 4 is the only value supported, you can drop the property altogether.

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  maximum: 4
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port node, single endpoint describing the output port.
> +
> +        properties:
> +          endpoint:
> +            unevaluatedProperties: false
> +            $ref: video-interfaces.yaml#
> +            description: Endpoint connected to output device
> +
> +            properties:
> +              bus-type:
> +                const: 4

Are both input and output of this block CSI-2 with D-PHY?

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    csi@3000 {
> +        compatible = "fsl,imx93-mipi-csi2", "snps,dw-mipi-csi2-v150";
> +        reg = <0x03000 0x1000>;
> +        reg-names = "core";
> +        phys = <&mipi_dphy_rx 0>;
> +        phy-names = "rx";
> +        resets = <&dw_rst 1>;
> +        interrupts = <2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    bus-type = <4>; /* MIPI CSI2 D-PHY */
> +                    remote-endpoint = <&camera_1>;
> +                    data-lanes = <1 2>;
> +                    clock-lanes = <0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&idi_receiver>;
> +                    bus-type = <4>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d9d2be7be8037dfa96f1c9edd24a0cf997b9393..ecb7bc7cc8ad797f43173075ca8973804bf335f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15334,6 +15334,7 @@ F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
>  F:	drivers/media/platform/nxp/imx-mipi-csis.c
>  F:	drivers/media/platform/nxp/imx-parallel-csi.c
>  F:	drivers/media/platform/nxp/imx7-media-csi.c
> 

-- 
Regards,

Sakari Ailus

