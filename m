Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44975C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljcV+LaAH8VPsy+kqwg0iD5v7jPvKVfATpiZFavXBDk=; b=Mn7elMJhfpnf79ctIrufCz2Oc8
	vFEyLnT1zGXJtU2ngM/DK2V4B40+QhBWPaNpkq0J8An9HvGi++wLvwKTAmrlu3wlZWVFZ/tgjNT+/
	5s2YQgBP6Xmisg5r59xUgPMv3It69UTqlVzBb9ni2PfHev0aCSq7+QecyDviotChCebEaWHEQWcA8
	kkECw8uR+2cMiH5/ltL8yCWwSxeJMACNyfi++jXeGQQlXx5TAho0Mz7ZEnbRR1o/jOUSYdLI5VVR/
	lVQsLCd34WCg/baK55L+oZnzmtUiSZ3/foeXDxTvyyX0CZNmed2SlKM0xP5LOvobzgV+bwmArNYeJ
	w5xk6SgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2R9-0000000DRPV-0b2Q;
	Fri, 11 Jul 2025 01:20:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Gb-0000000DDk1-3HJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C51216143B;
	Thu, 10 Jul 2025 23:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535A8C4CEE3;
	Thu, 10 Jul 2025 23:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752188484;
	bh=7ZHvFCmV3/wqSVJYpykZn9eCOEAwB+1FKd0S0WN3FJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Id35bl8RsiWp5XMT7ujO65piGM28PG24E9ifGZSh5VQwSCi9hhfjkhRUKHd4iTuhp
	 BK93YsSjoGS07SIW3HAatdra9mZZ6to86sX8UlbPVZQEZWuNPHekOyk0gopFCu3UXm
	 UEj8axrjiiJqrwUkMHOjWKJwsgpxOfBYHZpJk2MS1M0JM82gPm4en2ske4uwIMsnPO
	 R5I5xPg6EgqfcpNx1iRUeRHVOfWG6k66jsdEvHC2yma/xKIprWj34/RUYOPRl0c/Y3
	 KqL0UyWXSNRW0Npd2e8MmQvlEhzhcM39SJ1VuHnQTQfC0hyHHTrSzdEDHpcG1LUnnd
	 M2gbS6Jzncyrg==
Date: Thu, 10 Jul 2025 18:01:18 -0500
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
Subject: Re: [PATCH net-next v8 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250710230118.GA31751-robh@kernel.org>
References: <20250710134533.596123-1-maxime.chevallier@bootlin.com>
 <20250710134533.596123-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710134533.596123-2-maxime.chevallier@bootlin.com>
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

On Thu, Jul 10, 2025 at 03:45:18PM +0200, Maxime Chevallier wrote:
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
>  .../bindings/net/ethernet-connector.yaml      | 47 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> new file mode 100644
> index 000000000000..8765efc6e233
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> @@ -0,0 +1,47 @@
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
> +  An Ethernet Connectr represents the output of a network component such as

typo.

> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> +
> +properties:
> +
> +  lanes:
> +    description:
> +      Defines the number of lanes on the port, that is the number of physical
> +      channels used to convey the data with the link partner.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  media:
> +    description:
> +      The mediums, as defined in 802.3, that can be used on the port.
> +    items:
> +      enum:
> +        - BaseT
> +        - BaseK
> +        - BaseS
> +        - BaseC
> +        - BaseL
> +        - BaseD
> +        - BaseE
> +        - BaseF
> +        - BaseV
> +        - BaseMLD
> +    maxItems: 1

Drop 'items' and 'maxItems' and then it is implicitly only 1.

> +
> +required:
> +  - lanes
> +  - media
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 71e2cd32580f..6bf670beb66f 100644
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
> +
> +            mdi {
> +              connector-0 {
> +                lanes = <2>;
> +                media = "BaseT";
> +              };

Your indentation is not consistent.

I think we should consider a compatible here. Soon as you want to 
distinguish one connector from another you will need one. Though we 
could always retrofit that later.

> +            };
>          };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 881a1f08e665..b584f8dfdb24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8959,6 +8959,7 @@ R:	Russell King <linux@armlinux.org.uk>
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

