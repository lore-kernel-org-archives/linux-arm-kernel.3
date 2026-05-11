Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013ABCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWi+yz4E82NY4JNL7fGRgTtCTunFFqwxlmF4+tPOo+U=; b=y2KjjoYYvqylEz4l+28jwME/0v
	N0zlDg8BfJEpsVFQVv8QVf9MLVn0J3zObEehSCIzNTtCe+h6NEp7kXh3FhWCkRWL/GfMi4ib0qV8n
	euWIAWZeHvqrY48rJc4ZMXonWRSFrR+7S3dYsQ3Sl+EtFeUPG7LiBNhDC+GXdHG84aZ0g2LTB+KNo
	luqBU0fi672JLUGQFMArQQHQrJxPsQcia9zTmAcVFV6LXHgz4ng1Egpb6fa0B7gTCYoWKaMCVzhJg
	PYejcy1ykuuYsbrpqheVvKp5Prrjax4/w0/Lq+6obds1tl8n9KQWm7b4GhRnDPUBPsMl+TEdH/y6W
	dgDGFsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5T-0000000DNpo-0Yuj;
	Mon, 11 May 2026 11:46:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5Q-0000000DNoi-0ErV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IWi+yz4E82NY4JNL7fGRgTtCTunFFqwxlmF4+tPOo+U=; b=YWn56TZOCD4IVLrSvnqzm9/R/G
	X8jT6q7I8zBNBSa9dleCiU3xbQf9NzPhD0BscWf9pqAtqHitv3T0DCwNPoD6vbMmSUEQWw0xA9bGl
	MbFr4y5PtBmObNsYslmKlfTK6HYD0SB31jGlsPrcDlDEs1tqtwcMSanTeh0cdHkVOjuE6KbT8yIRX
	Hz2KBuje1tgZH+e6BXJY8at1/fNMO0EH7TH0DOxhzliyUw6f+YotCDotumA6pMf2qGfnUeeKmsTu0
	JQDYDD/p9oh621N9PLXZ8wWhZdTKYU4aBwWIjsQIw/9eDxlGZFcRSAu7bRS48rtaVD/x/K2BI4/M7
	9rU84qqw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5G-0000000BWF8-334F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:46:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wMP4s-0000sp-0i; Mon, 11 May 2026 13:45:38 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wMP4q-000FMB-0p;
	Mon, 11 May 2026 13:45:37 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wMP4q-0000000FFNo-3bOa;
	Mon, 11 May 2026 13:45:36 +0200
Date: Mon, 11 May 2026 13:45:36 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <yez4p77eclr4hfhb5ytyr64ponp4plpefxhfszqfvdinpvamuv@jod7fsgilowq>
References: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
 <20260511-csi_formatter-v6-1-01028e312e2b@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-csi_formatter-v6-1-01028e312e2b@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_124604_180218_EAB75A72 
X-CRM114-Status: GOOD (  21.10  )
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

On 26-05-11, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX9 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.

Sorry for chiming in very late, but can you please provide on which
i.MX9 devices this formatting module is present? I've checked the i.MX93
reference manual and found no info instead I found a CAMERA_MUX register
which does something similiar but is not the same. Please provide a more
specific compatible if this IP is only be present on i.MX95 devices.

Regards,
  Marco

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> new file mode 100644
> index 000000000000..774d37d2b987
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX9 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module uses packet info, pixel and non-pixel
> +  data from the CSI-2 host controller and reformat them to match Pixel
> +  Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx9-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
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
> +        description: MIPI CSI-2 RX IDI interface
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Pixel Link Interface
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    formatter@20 {
> +        compatible = "fsl,imx9-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

