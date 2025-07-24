Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D465C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HATfpXHfXAWXHNopV9iQV5NIBTpxqqzSArhU53RsAno=; b=CTG5JsflaTSYA/QaqTUmhFJ7gN
	jdenBfTHYA3GYu2wh4NfSctsRDF11BCl9BdsKOCFaTRXntZnz3SDkmKwCF1VBQE+JvsqeJjgv1+Jy
	N4cUTzcW2FaQQtxXU17+30kPWDcMePczItkA8i1D2gmlLWKICBv0R3Edg2P2rXAxbAog+jIq+VJ48
	gJymYWR3iRHhPVvTFqOeCwJUdLfXTuMCUrLOwng/da9au04HNc495ri6S7u6KCtCmnX3GZnvmTuA3
	FexauLaw+0iwABJZ2yEiLPPl/mG/n/EovG87Wm2cfWD1yvf7HLUhJ3dfMyq+ngJxANLmfLinFfeBZ
	YBAD6fPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesj5-000000078jV-0v3f;
	Thu, 24 Jul 2025 09:58:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uergr-00000006wWu-2Cm6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD4D7A55E64;
	Thu, 24 Jul 2025 08:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FCDC4CEED;
	Thu, 24 Jul 2025 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753347156;
	bh=lEUiukjpItIZOMLZybq8zVOV0E1VI31HPjpcqCCRXw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zfjmgph9vyQJ1Z52UaLvbtnXWS2GVe1JpGrut3ak0bCBBZw1wZjVZ//VT4dmUdI/2
	 QoR2MDn1JkBNI121S3rhq4WChb5c/yoECIBnvhmPNxchnBFyOduvyiuUfaOr7BeCWb
	 VXclpmlMokvspHjFgJBGkIMDxcpDqccxZY8BHMRBOidJpTAEGAJd/TjOQJoqTQDH9V
	 8rjK97IQM5/zJ+lFH87y9FNJHqKKs93eG9to7basm5n/ECtEawU4o2JAxDERNzUDSa
	 nW5V6aiTXZ/s2/89kJp6Trv+Cf+xHdyulQGLn/d6Je+d8oscg1CiDmqoM+oKXuGgLb
	 J65mC6IVet3wA==
Date: Thu, 24 Jul 2025 10:52:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724072248.1517569-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_015237_719093_88629532 
X-CRM114-Status: GOOD (  17.66  )
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

On Thu, Jul 24, 2025 at 03:22:43PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..6211ab8bbb0e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,6 +49,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port

Which data path this represents? Feels like you are duplicating ASoC
dai-links/cells...


> +
>      required:
>        - port@0
>        - port@1
> @@ -98,5 +102,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..4f99682a308d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> +  Audio Subsystem to the HDMI TX Controller.

What is Audio Subsystem? Like Linux Audio or some name matching actual
hardware?


> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.

And how do you plug it into sound card? Where are any DAI links?

Best regards,
Krzysztof


