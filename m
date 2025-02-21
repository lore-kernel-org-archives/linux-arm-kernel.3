Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979B4C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtEBEd4OF5jJesM1UWuC8B55cy1wUC1Xy89ppNlShPo=; b=f4XdTOLPii/x59vRmwNDd/wErF
	jy3K+juTXomfKjpOrZGmaPxEA4weP4TnExbcgqKLzftTpNrSXBkYM/253DLdIaebOuxSjsydT+WMw
	eGrfRFXdSa2Z4+P9jsYB1OMyV9+pLpks/siRZZw5LirgHQtDwO3+GH7aTsohcCmY223T+QPjpYlR6
	KM0e/3LZrilvJow7AaN5zZM3GowqizVpNzB4tofTvlljz6gDEb3ONjmKKJ/LsFU33wmcIeEuGua/x
	et0tzOpQ52FOYyqkiF5dAy/th67r8x5ICZGgaeOZNeFLqzx1vo2pEdB0LbexHz+e5kWHgRz0VDxcx
	4qx04YeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbPu-00000007063-3XcF;
	Fri, 21 Feb 2025 22:22:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbOS-0000000701T-4BWD;
	Fri, 21 Feb 2025 22:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BE20613B8;
	Fri, 21 Feb 2025 22:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735FAC4CED6;
	Fri, 21 Feb 2025 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176441;
	bh=7aHNW9A/Uq8Lugq2wM6k+l78zNQMYLApgkpRccP75pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQHqptEYXy861nH4Dp3RHO8Sdfum1rPxoXVSQxqSsLeHc/wzblZu01Jp8LwAxnwa+
	 nursnUX6W+mwkV1VbDQW34IoGY3OUrqwDy11zDOHvubeZPD9CVvKmUwkboH/gr3Dku
	 w9V4pnrNV83ZKiFYvUvm5KIbXoybGj6dxHwT4AA2F/aDdKYQiyX2LSc/IFCpXum91M
	 +X2+x8IBhBAgiWxLFTsSBtmPm1P4+SWZETkDS1uO5Tu2guE6nQCgfP9EaiFDzYMkYl
	 ZukxOU4JMRtlwHaaH4Zv/ZcoTWerV8eKB9Ruln0azVoYwoIRqxSOmnKyTvN5cDDFcP
	 CfSNstlUdpt6A==
Date: Fri, 21 Feb 2025 16:20:39 -0600
From: Rob Herring <robh@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Message-ID: <20250221222039.GA164750-robh@kernel.org>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-4-e906600ae3b0@wolfvision.net>
 <Z7iJ-UaLabqK4ZhY@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iJ-UaLabqK4ZhY@kekkonen.localdomain>
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

On Fri, Feb 21, 2025 at 02:13:13PM +0000, Sakari Ailus wrote:
> Hi Michael,
> 
> On Wed, Feb 19, 2025 at 11:16:35AM +0100, Michael Riesch wrote:
> > Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.
> > 
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > ---
> >  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 123 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 124 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> > new file mode 100644
> > index 000000000000..288941686e96
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3568 MIPI CSI-2 Host
> > +
> > +maintainers:
> > +  - Michael Riesch <michael.riesch@wolfvision.net>
> > +
> > +description:
> > +  The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
> > +  and one output port. It receives the data with the help of an external
> > +  MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture
> > +  (VICAP) block.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3568-mipi-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: MIPI C-PHY or D-PHY.
> > +
> > +  phy-names:
> > +    items:
> > +      - const: csiphy

*-names is kind of pointless when there is only 1. Drop it.

> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-type:
> > +                enum: [1, 4]
> > +
> > +            required:
> > +              - bus-type
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node. Connect to RK3568 VICAP MIPI CSI-2 port.
> 
> What's the purpose of a port node without an endpoint?

If there are not custom endpoint properties, then you don't need to 
describe the endpoint node. But that case should be this instead:

$ref: /schemas/graph.yaml#/properties/port

(no unevaluatedProperties)

Rob

