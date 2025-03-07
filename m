Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4BBC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7czlP/tCgR90d170sk3Cf0NAMt2pUbKngBXIyUxXZ7o=; b=UkiKSAptUwIjkZtLv8A7WSjk5V
	xW09yu84biS5F7doSiE5hnUPRvTeT7fzzxC+QEyA5CL8/8A2VVJUfHTmYvbYzWhtg59SOvK5imiic
	iJbFMfL66rD6azNdnrxKmOP3USs7YNyc+YmwolrlpBmcTyOLJEkBlNWFQpWD5H1S6OODs5ZzQ3lTh
	oYrE0DkENtr2HmRBuzxkbEJgDTFOec1lLIoNO7JMhHltGhFPDkI9BhDDqAXbMdzoXURIVW2dmoKg4
	drmuEKb0yH55yNoK5lXk8foXSYpVt+/yubxgHgOA3Cs+qWKxD3h8ddrVaupv4jPLzxRTw/4MqDsG/
	/AC3Q14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUMF-0000000DlS9-1v3X;
	Fri, 07 Mar 2025 09:51:07 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUKb-0000000Dl8b-0pn1;
	Fri, 07 Mar 2025 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741340965; x=1772876965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMv+mWNoFkGiSJzPQ4HjhZzF/GGFwH++BILQFYuqJjc=;
  b=drQ8m7p9NoxBlYjG2He4hWWoLHFt0gjuMCQBHCt5GcLknmlUvI2TvDXW
   k3TJWHTmQcBXvz7IBmU68YSwtcpC9+pX5VYncQjnCi6F4DERk/Cgoqsfv
   sFlAI3SD9jCyA1S9mRDsRx0U5QW0MRVBkVdMO+IFOL87xzJWeTQh0jNxj
   Lo/dACKnhJezKCOznVX8Qm8dtcKhn8yq8yIgV45Vh7MC41ZVyK2NFcRIn
   ygDoMyhiRRrseBgOW8/Xnu3u8XrJ2j18PyPt+QEo+Mpc6dionHNoVxlea
   /wxy9CzA+khOdocCneB6wLI4aI9aX+VmrN+hprsLPjxwvsXDIXB+uw1gR
   Q==;
X-CSE-ConnectionGUID: pp58/9LOSnCnB9AJrwqmgA==
X-CSE-MsgGUID: Vic/L7+1RqWFcZRlbrKRLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41553793"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="41553793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:49:22 -0800
X-CSE-ConnectionGUID: PaMUlQqVQtK1CzZrnIll9g==
X-CSE-MsgGUID: d7CscytIQdiOtvxDoGLfRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120197533"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:49:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C298411F9DA;
	Fri,  7 Mar 2025 11:49:12 +0200 (EET)
Date: Fri, 7 Mar 2025 09:49:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
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
Subject: Re: [PATCH v5 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
Message-ID: <Z8rBGHK9Tjx7D1D2@kekkonen.localdomain>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-3-f02152534f3c@wolfvision.net>
 <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-pink-dalmatian-of-kindness-f87ad2@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_014925_279382_C7917B37 
X-CRM114-Status: GOOD (  21.79  )
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

Hi Krzysztof, Michael,

On Fri, Mar 07, 2025 at 08:51:54AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 06, 2025 at 05:56:04PM +0100, Michael Riesch wrote:
> > Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> > 
> > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> subject: only one media prefix, the first
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > ---
> >  .../bindings/media/rockchip,rk3568-vicap.yaml      | 169 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 170 insertions(+)
> > 
> 
> ...
> 
> > +  clocks:
> > +    items:
> > +      - description: ACLK
> > +      - description: HCLK
> > +      - description: DCLK
> > +      - description: ICLK
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: dclk
> > +      - const: iclk
> > +
> > +  rockchip,cif-clk-delaynum:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 127
> > +    description:
> > +      Delay the DVP path clock input to align the sampling phase, only valid
> > +      in dual edge sampling mode. Delay is zero by default and can be adjusted
> > +      optionally.
> 
> default: 0

And this is technically specific to the DVP port (0). Should (or could?) it
be located there?

> 
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: ARST
> > +      - description: HRST
> > +      - description: DRST
> > +      - description: PRST
> > +      - description: IRST
> > +
> > +  reset-names:
> > +    items:
> > +      - const: arst
> > +      - const: hrst
> > +      - const: drst
> > +      - const: prst
> > +      - const: irst
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle to general register file used for video input block control.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: The digital video port (DVP, a parallel video interface).
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-type:
> > +                enum: [5, 6]
> > +
> > +            required:
> > +              - bus-type
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Internal port connected to a MIPI CSI-2 host.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> 
> Hm, does it actually work? graph/port does not allow any other
> properties. You should use graph/port-base and probably still narrow
> lanes for both of port@0 and port@1.

I'd list the relevant properties for both DVP and CSI-2, either as
mandatory or with defaults (could be reasonable for DVP signal polarities
but not e.g. on number of CSI-2 lanes).

> 
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3568-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/rk3568-power.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> > +
> > +    parent {
> 
> soc {
> 
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> 
> Best regards,
> Krzysztof
> 

-- 
Kind regards,

Sakari Ailus

