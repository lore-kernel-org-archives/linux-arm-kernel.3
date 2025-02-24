Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FF9C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgqeLtPlVze9vzvKljACOlW/46cUJo7kj4Cg21Dec2A=; b=ljkPFrhxMmy+esuKHUnwypRqCo
	pkxQKDrF/5C0HRpjYV/fjh1ERVkiYtkIF0zf9OvxwMzA70SiPOCb7UPadWnbnQMVPJBh5F0bbmrK+
	kJEYpcrgS/7oFunr9ZWdFoKhD6OKEJCIjDQktCfSVx7sPWRZwSe8/nGIylPMX7Tp63Hf0ln4ehqbq
	1H+cmcA9qo2YoOBbv+0+K9ApPxukLqY0kO6yRbrTjcgMRBGr1ihdwi5TgXAn19vXVmiFJTFoemR/C
	p/XH+CIG8tqnPpLuTqXy7EiZR8yo++N78SR13x4sj3+V0cKRKRCtwFU2bnaifwoACjKXK9UgKQX04
	I1y6vvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYI7-0000000DoWC-1BMV;
	Mon, 24 Feb 2025 13:14:35 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXni-0000000DizS-0VBl;
	Mon, 24 Feb 2025 12:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740400990; x=1771936990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bE1sNTKCIcMIFatENWw4OlhtEJZGUhcXJTzBuK9DHE=;
  b=QnWOWdu+Xpfb3/ZoRDBHdh7N35FFGfpk10EY3ccS8g3AWcggcmQcV9wf
   B7L8eZ9NEzgoifTEuqYeUNCTq05uiXYlO4mRgLorAdlPAEK9sK93wdLGb
   3ou3W8YWAoQwjoCHPAouOAWrWCyyVxDdUnOsPz0M2XCJst7YUGgiySLpe
   oimiX2mQ/NFis3+if0fdoGG5fFsnGcZMkoBpIc5ceuF1YLi/FKOIbrXtn
   f4ESn+YCYbtxGb+wxLFGuhPLSWZnGs5W+/vQhT9i4tzk+d/jc3ROG1uWD
   5uZkippd5EJ7MUyZ1aIRy+9N8Mni9L4n/tU1zP7Dnmfhwj8JgPk9TUgvR
   g==;
X-CSE-ConnectionGUID: v16Man1aRQOtNZHKOuo+xA==
X-CSE-MsgGUID: YowJ6Bw4TUa2bPM8Ui8LNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="43982320"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="43982320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:43:08 -0800
X-CSE-ConnectionGUID: vjFgtAYERzqgYiHCoWu2XA==
X-CSE-MsgGUID: aGhihvvHTNOeYhbEn9nRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116677593"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:43:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8314111F944;
	Mon, 24 Feb 2025 14:42:59 +0200 (EET)
Date: Mon, 24 Feb 2025 12:42:59 +0000
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
Message-ID: <Z7xpU8yKNKBReage@kekkonen.localdomain>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
 <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
 <0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_044310_203257_5C6482DC 
X-CRM114-Status: GOOD (  37.38  )
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

On Mon, Feb 24, 2025 at 11:21:41AM +0100, Michael Riesch wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On 2/21/25 15:10, Sakari Ailus wrote:
> > Hi Michael,
> > 
> > Thanks for the update.
> > 
> > On Wed, Feb 19, 2025 at 11:16:34AM +0100, Michael Riesch wrote:
> >> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >> ---
> >>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
> >>  MAINTAINERS                                        |   1 +
> >>  2 files changed, 169 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> >> new file mode 100644
> >> index 000000000000..3dc15efeb32e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> >> @@ -0,0 +1,168 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip RK3568 Video Capture (VICAP)
> >> +
> >> +maintainers:
> >> +  - Michael Riesch <michael.riesch@wolfvision.net>
> >> +
> >> +description:
> >> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
> >> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
> >> +  the data from camera sensors, video decoders, or other companion ICs and
> >> +  transfers it into system main memory by AXI bus.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: rockchip,rk3568-vicap
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: ACLK
> >> +      - description: HCLK
> >> +      - description: DCLK
> >> +      - description: ICLK
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: aclk
> >> +      - const: hclk
> >> +      - const: dclk
> >> +      - const: iclk
> >> +
> >> +  rockchip,cif-clk-delaynum:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 127
> >> +    description:
> >> +      Delay the DVP path clock input to align the sampling phase, only valid
> >> +      in dual edge sampling mode.
> > 
> > I suppose there's further documentation on this somewhere else? A reference
> > would be nice.
> 
> I like your optimism :-) No, I am afraid this single sentence is all the
> the RK3568 TRM has to say about it. I can add a reference to the TRM
> page, but everyone who actually follows this reference will be
> disappointed...

:-(

Is this something that needs to be set? Is there a default, for instance?

If there's documentation available, it'd be nice to refer to that from
somewhere, I'm not sure if the driver or DT bindings would be better.
Probably the driver.

> 
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    items:
> >> +      - description: ARST
> >> +      - description: HRST
> >> +      - description: DRST
> >> +      - description: PRST
> >> +      - description: IRST
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: arst
> >> +      - const: hrst
> >> +      - const: drst
> >> +      - const: prst
> >> +      - const: irst
> >> +
> >> +  rockchip,grf:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to general register file used for video input block control.
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description:
> >> +          The digital video port (DVP, a parallel video interface).
> >> +
> >> +        properties:
> >> +          endpoint:
> >> +            $ref: video-interfaces.yaml#
> >> +            unevaluatedProperties: false
> >> +
> >> +            properties:
> >> +              bus-type:
> >> +                enum: [5, 6]
> >> +
> >> +            required:
> >> +              - bus-type
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/$defs/port-base
> >> +        unevaluatedProperties: false
> >> +        description: The MIPI CSI-2 port.
> >> +
> >> +        properties:
> >> +          endpoint:
> >> +            $ref: video-interfaces.yaml#
> >> +            unevaluatedProperties: false
> > 
> > Don't you need things like data-lanes here? Or is this a single lane
> > receiver?
> 
> This may be a bit confusing, and I probably should extend the
> description a bit. This port/endpoint faces the MIPI CSI Host, which has
> its own driver provided in patch 6. The connection in between is a link
> with some internal format. Hence, no properties required.
> 
> This is the same issue as the one discussed in the other thread, since
> the other end of this connection is discussed there. I'll fix the issue
> on both ends using Rob's suggestion.

If this is some custom interface, you should not say it's MIPI CSI-2
(even though MIPI CSI-2 data could be transported on top).

> >> +                vicap_mipi: port@1 {
> >> +                    reg = <1>;
> > 
> > Where is the endpoint?
> 
> I'll add the endpoint in the example.

Thank you.

-- 
Kind regards,

Sakari Ailus

