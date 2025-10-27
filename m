Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F04CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UzmCaPVoiS1w/FUaOytewjvTtIauYLev6TJBsSgl38=; b=uRS9RJBsWGaNsiJt0pS1j1Lcm5
	Z5nGTYwBCzZ2wkcPux/L6DfA+lruFMcrWiWRdlnMW7TjUd+PQy8L/LjPLhZmiCxxmPa0MzN6tL5jC
	W5YyfJR5mYfx2InxtjbEhnkJPnrHX/yuxsybFEEtuctPFmHoxSzQtUXeLjIYeXb90aNNhxkSoo8Hh
	2QZpuJAyxSCozI0fbkM0xsaP8u24IB6AECuxo0LRQ0R0sJb7/sU/KsJgVjAve1yIZ5x6uoVoMm7G5
	8mdtaVr5J9IO+h16LQGiAHr8QCdShA7nRb4JOYj0Bfv4U11YquKDQZeRhYRCDkJv/48ri8WiIl/js
	9LC0Uk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUBf-0000000Ekht-1CzX;
	Mon, 27 Oct 2025 20:51:31 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUBc-0000000EkhV-2O8F;
	Mon, 27 Oct 2025 20:51:30 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cwQf25Mg0zyRb;
	Mon, 27 Oct 2025 22:51:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1761598283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0UzmCaPVoiS1w/FUaOytewjvTtIauYLev6TJBsSgl38=;
	b=LKPxbNsoEvumyCTzXvaXlwgGq7tpa8L6cRk3TshEApKiWUUsZkFYI/+VQenMjQqJOdm7Bk
	PtVOG5iOsJT+7gFJk9fGny3dcD89o6QQf2ZDypYDlOs2JyGN1Zn6p4yLr8WHbRBjKfseu0
	AITo0O6gJ1Yv1ew1ARkHQ/SDbJhc2Og=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1761598283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0UzmCaPVoiS1w/FUaOytewjvTtIauYLev6TJBsSgl38=;
	b=yrFxCASLbHlVMhaVYYeTZrnnylCerNggsiAtDRErJ8QL/KVVJot4XfqITy0TMSlwsFhfeU
	HoyMvf5HSVu6SwAbEpA176RblHLEe/y9HDCoygdUUNiftb24i+RYb843ONWvBOgZX80iuB
	a4Pl4QDq78Hk6LjgaKmF3GiyuPpzRyk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1761598283; a=rsa-sha256; cv=none;
	b=LjaE/ud729xDvyU4alpwesfOqW8/XoXctkMEPWaona1Io78nhyPB7/ACsEOOXsMT+Nqdz1
	SmR/ML3OGn/P18BkwFNPCHE+MXzs66/09La6yPfZMOI1G/2WSUKpdLRDgi1zKMdSlBraMr
	v7r0bJcB3NFx5Y+Bv0dSOyidef24giI=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AF27B634C51;
	Mon, 27 Oct 2025 22:51:21 +0200 (EET)
Date: Mon, 27 Oct 2025 22:51:21 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <aP_bSQUIle_9-L-7@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-1-c9286fbb34b9@nxp.com>
 <aP8t3YClrZxOnHea@valkosipuli.retiisi.eu>
 <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+enPOHPkvZAkzS@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_135128_792747_DC66E7CD 
X-CRM114-Status: GOOD (  26.54  )
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

Hi Frank,

On Mon, Oct 27, 2025 at 12:32:28PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 10:31:25AM +0200, Sakari Ailus wrote:
> > Hei Eugen,
> >
> > On Thu, Aug 21, 2025 at 04:15:36PM -0400, Frank Li wrote:
> > > From: Eugen Hristev <eugen.hristev@linaro.org>
> > >
> > > Add bindings for Synopsys DesignWare MIPI CSI-2 host, which used at i.MX93
> > > and i.MX95 platform.
> > >
> > > Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
> > > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v3
> > > - drop remote-endpoint: true
> > > - drop clock-lanes
> > >
> > > Change in v2
> > > - remove Eugen Hristev <eugen.hristev@microchip.com> from mantainer.
> > > - update ugen Hristev's s-o-b tag to align original author's email address
> > > - remove single snps,dw-mipi-csi2-v150 compatible string
> > > - move additionalProperties after required
> > > ---
> > >  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     | 151 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  2 files changed, 152 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d950daa4ee9cfd504ef84b83271b2a1b710ffd6b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> > > @@ -0,0 +1,151 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/snps,dw-mipi-csi2-v150.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare CSI-2 Host controller (csi2host)
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description:
> > > +  CSI2HOST is used to receive image coming from an MIPI CSI-2 compatible
> > > +  camera. It will convert the incoming CSI-2 stream into a dedicated
> > > +  interface called the Synopsys IDI (Image Data Interface).
> > > +  This interface is a 32-bit SoC internal only, and can be assimilated
> > > +  with a CSI-2 interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - fsl,imx93-mipi-csi2
> > > +      - const: snps,dw-mipi-csi2-v150
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: MIPI CSI-2 core register
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: core
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: per
> > > +      - const: pixel
> > > +
> > > +  phys:
> > > +    maxItems: 1
> > > +    description: MIPI D-PHY
> > > +
> > > +  phy-names:
> > > +    items:
> > > +      - const: rx
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node, single endpoint describing the input port.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +            description: Endpoint connected to input device
> > > +
> > > +            properties:
> > > +              bus-type:
> > > +                const: 4
> >
> > If 4 is the only value supported, you can drop the property altogether.
> 
> Sorry, What's your means here? There are more options in video-interfaces.yaml.
> here just add restriction for bus-type. otherwise other value can be
> provide in dts file.

It could, but wouldn't any other value be incorrect?

In other words, this property is redundant and should be dropped.

> 
> >
> > > +
> > > +              data-lanes:
> > > +                minItems: 1
> > > +                maxItems: 4
> > > +                items:
> > > +                  maximum: 4
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Output port node, single endpoint describing the output port.
> > > +
> > > +        properties:
> > > +          endpoint:
> > > +            unevaluatedProperties: false
> > > +            $ref: video-interfaces.yaml#
> > > +            description: Endpoint connected to output device
> > > +
> > > +            properties:
> > > +              bus-type:
> > > +                const: 4
> >
> > Are both input and output of this block CSI-2 with D-PHY?
> 
> Yes, input from camera sensor, output to others image processors to do data
> transfer or format convert.

The description appears to be saying this is "Synopsys IDI", not CSI-2 with
D-PHY. We don't have a bus-type for IDI. Couldn't you simply drop it?

-- 
Regards,

Sakari Ailus

