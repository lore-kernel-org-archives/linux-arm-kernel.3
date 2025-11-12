Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E905BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQZnGNvWN78XQLeZqhMeiBYmu7A63pDZVjJ+28yfldE=; b=rjV0yZCaSZ9jAEBLRUYQDPIjoB
	aAcczAxgBakzLZl3PuQjSYWRH0Sedmus1ZQT0QgL4DgjrbKY0XzKWLIps759Rp3LPcxxfqzNoiKwt
	ebz5k/WaJtw3hYXa7Ru5FXGOT4B1rSbMhQ2QoUi7+PigoJwX81gyANzR8TPlmTLsFNhlpmFQ0hQHz
	BvL5NlfQvFxgaqf0TAYrfdO7sMUYfR3mcfs6onqraGsK6Ab/ZZjvYW6CiOTbswGClAG/dBVlNXlwZ
	8nBOgxAUtaCkPXTBY0fo8qlTHE1+mF2MMyTJlvSdalZHGPwhJbgNGC40IQSMIk9f0eVHAqp3C+24l
	uXND9k2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJACd-00000008nFA-3lOf;
	Wed, 12 Nov 2025 12:43:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJACc-00000008nEp-2lLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 989D46021B;
	Wed, 12 Nov 2025 12:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B5BC4CEF5;
	Wed, 12 Nov 2025 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762951437;
	bh=ANqlcL/lxDVL3cKzBO7YnssgrqZZpZVjE42b8mFuB0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUk0566xFHhr4vWog7/q9K565lO4dgAtycAOW/TPTuxa4vfk7esk/hfDvvMnjNLrG
	 gzN41cH1oicqcMZFv7VoJrXBGlyjzcUUfELbqaosAAvcE5BIg6zQf6y3zNKVxYBpeg
	 g+xyw21Ts0EywcFMRD+iE7v0qUfHhE9nPb4k4xyOnjBvUeuT65iVgNBAP/AW+cxvoU
	 WlSDZhdziKymIrWxJjSRXJZMDaYLmstmFrOy7GBnnU2ggUFUta0ahJ16zzyn7gbUDq
	 uVmU0QKT9RgADeXY+Q/593T9sCj2aALNW0byALOBauNSqctTEqSfQonsMi2tmRefm/
	 Wb8/3ViXZLxZQ==
Date: Wed, 12 Nov 2025 06:43:55 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20251112124355.GA1269790-robh@kernel.org>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
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

On Thu, Nov 06, 2025 at 10:47:26AM +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/net/ethernet-connector.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> new file mode 100644
> index 000000000000..2b67907582c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Ethernet Connector
> +
> +maintainers:
> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> +
> +description:
> +  An Ethernet Connector represents the output of a network component such as
> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> +
> +properties:
> +
> +  pairs:
> +    description:
> +      Defines the number of BaseT pairs that are used on the connector.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Constraints? Wouldn't 4 pairs be the max?

Is it possible you need to know which pairs are wired?

> +
> +  media:

Both of these names are a bit generic though I don't have a better 
suggestion.

> +    description:
> +      The mediums, as defined in 802.3, that can be used on the port.
> +    enum:
> +      - BaseT
> +      - BaseK
> +      - BaseS
> +      - BaseC
> +      - BaseL
> +      - BaseD
> +      - BaseE
> +      - BaseF
> +      - BaseV
> +      - BaseMLD
> +
> +required:
> +  - media
> +
> +allOf:
> +  - if:
> +      properties:
> +        media:
> +          contains:
> +            const: BaseT
> +    then:
> +      required:
> +        - pairs

else:
  properties:
    pairs: false

??

> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 2ec2d9fda7e3..f434768d6bae 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -277,6 +277,17 @@ properties:
>  
>      additionalProperties: false
>  
> +  mdi:
> +    type: object
> +
> +    patternProperties:
> +      '^connector-[a-f0-9]+$':

Unit addresses are hex, index suffixes are decimal: connector-[0-9]+


> +        $ref: /schemas/net/ethernet-connector.yaml#
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
>  required:
>    - reg
>  
> @@ -313,5 +324,12 @@ examples:
>                      default-state = "keep";
>                  };
>              };
> +            /* Fast Ethernet port, with only 2 pairs wired */
> +            mdi {
> +                connector-0 {
> +                    pairs = <2>;
> +                    media = "BaseT";
> +                };
> +            };
>          };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1ab7e8746299..19ba82b98616 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9276,6 +9276,7 @@ R:	Russell King <linux@armlinux.org.uk>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-net-phydev
> +F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
> -- 
> 2.49.0
> 

