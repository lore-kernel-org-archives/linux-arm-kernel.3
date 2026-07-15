Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21CCC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ULBlpWcCMHL+k8mUwAGMRXmL/LM436Hb11RBQxXZXI=; b=4wMT2YhYGLx8+Yo7MF7lKdpRFk
	eqm5fdgHEghivxqpioOHNGywzw0c2zSULUyF40GZcpXVBZLNRuuP4xVQLTYQR94EBTQAuYRwYv/fI
	eGgrvbT3SbXsEPvi/I2niMb4gKSEGxDfs0bA78yVqv5tCDNJVYNZCx3oMsvwH1DFYkDAHL1JKHUgQ
	ak7NGc9dCVxfBq7jHJTn5K9ibsK/+Au4knnn3+YVZTQ3ezObrj2SQJ/OWjKNrXIKDkY6qbtbcj1bZ
	ySEFY7uHun97sNwCqvSldT6+wNT2noY6V7WTpxEx5ST+bLfl45FYd9sl3L3KVCPHpn7Ri15RvDU0v
	1aEieRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsnM-0000000Dr37-2jhP;
	Wed, 15 Jul 2026 06:08:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsnL-0000000Dr2z-0QJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2530E600FF;
	Wed, 15 Jul 2026 06:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52BC1F000E9;
	Wed, 15 Jul 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095713;
	bh=1ULBlpWcCMHL+k8mUwAGMRXmL/LM436Hb11RBQxXZXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=msrmTNsY7g4JoySUPK1RxwcFJKZNddLzswjgd1NLJg8MrXGz/iMisVd21N+dWpBWt
	 Gby6reU0jSVj1jFxQX9VGOyQS+YV04CgK+CUbPmSkLm0JCq8GGRFnh6jeWaSo4HzWt
	 OkKBNsumCIOF806T+AhormuIIC2LFCMzIq1CkXvekB85W5fVVljuzTxChVTHoRElbN
	 oSFdtpLEDDXd2nVyBAHMHhUImInQ66Hh/Nm6nbacyCP+UD8aLrvUQiH1hFx8dnyhm8
	 0J6Y4eCbqKSnTrquLB5g1SwmhUpYRyMEqp5fkoViZLLoXFS+vBK77mWZO9hG1BYXXC
	 TI8YW4af2ZwmA==
Date: Wed, 15 Jul 2026 08:08:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: sn65dsi83: Add output
 data-lanes
Message-ID: <20260715-successful-quetzal-of-amplitude-bf3cb8@quoll>
References: <20260713082622.52985-1-wojciech.dubowik@mt.com>
 <20260713082622.52985-2-wojciech.dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713082622.52985-2-wojciech.dubowik@mt.com>
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

On Mon, Jul 13, 2026 at 10:26:19AM +0200, Wojciech Dubowik wrote:
> From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> 
> Add an optional output lvds data lanes property with
> two allowed values. The array <1 2 3 4> for standard
> layout and <4 3 2 1> for reversed lvds output lanes.
> The latter informs the driver that reverse lvds config
> option has to be set in config register for the respective
> output channel.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8eb..2693c0273f9a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -86,10 +86,62 @@ properties:
>          description: Video port for LVDS Channel-A output (panel or bridge).
>          $ref: '#/$defs/lvds-port'
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                description: |

Drop |

> +                  Array of physical LVDS data lane indexes
> +                oneOf:
> +                  - items:
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +                      - const: 4
> +                    description: |

As well

> +                      This is the default layout
> +                  - items:
> +                      - const: 4
> +                      - const: 3
> +                      - const: 2
> +                      - const: 1
> +                    description: |

Ditto

> +                      This is the reversed layout

Honestly, this previous description are redundant. I can read 4-3-2-1
and I do understand it is a reversed from 1-2-3-4.

Do not explain the obvious code, but rather design behind. Just drop the
descriptions except the first one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


