Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEF2C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69cNHYjLpx/w+u60C8k4eJr98/7ujj3Iriw8qzewW2g=; b=S6Jy8VfdGKNibf1KRHs5asEN9X
	rwILKSTDFHNflTHZQZ1SYi3OmZwGp+6FiEjMSKmidkteVt7QORrVbaXyXr1d9PmhJg5FiSLNLmkNY
	EM28RQenfMIrXU/y12Y00hIF426ZMIFo2XmJG7WnBn1qKe9Jnxg7dIXQYvaL37xaql0zulpUTY+7m
	aUZXKWiKBUqmPLcNBnEpsIeYiShzUP4Q5IhwFwTUA3owsZuQVlQhiwzuLIps4kHrHdsbKd+9tYG7g
	213cYHjwKW13WgdbLqvKlB5WOy9h/nT32L3QtQ4CZwAQfz4ypPCrpELcy/VlW+5BAD3cPt0TW3S5H
	+cHTxqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH2r-0000000FtuL-48mJ;
	Fri, 27 Jun 2025 21:55:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGtd-0000000FsjA-1uCh;
	Fri, 27 Jun 2025 21:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9648061435;
	Fri, 27 Jun 2025 21:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25672C4CEE3;
	Fri, 27 Jun 2025 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060768;
	bh=Wa4ecWizOT5Iqtise/QjGf4n6skn5SZMXAZ5hYrTYRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRrBwM0QoCU5lHi0MAk1WbFBSz7918jSwXcUAsuuaA90vjTItz66KSqlfnTGIvm3s
	 63f3KpVEH8MM0fZ1M7lrpffXGgXIi3T3nje13ZvJQ/8lLHnxt+5YfxOySB2pfE96RS
	 0Y8rRTKoblzxauvdBHy6Ri/hiOEk15gRlI/hRt3KFeRJvGBNfGmfaT0zrHvOx3puD2
	 vZdeYh0ZVEMQNhtSiY8gbL66yJh6j4ooCO+CsYxent72DRn2wNZ9CpYXeOdz4yW4qG
	 Jt7tLQN3EyBIYrIaUY6MePBhDVSOfoxAiT7u/0mCb9Ln1eWkV9hkDZum7bONuz0Vd3
	 MjnwtJlybu7gw==
Date: Fri, 27 Jun 2025 16:46:07 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v15 03/12] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <20250627214607.GA193659-robh@kernel.org>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
 <20250626212321.28114-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626212321.28114-4-ansuelsmth@gmail.com>
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

On Thu, Jun 26, 2025 at 11:23:02PM +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 000000000000..fbb9219fadae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit Switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configurting the PHY page.
> +
> +$ref: dsa.yaml#/$defs/ethernet-ports
> +
> +properties:
> +  compatible:
> +    const: airoha,an8855-switch
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ethernet-switch {
> +        compatible = "airoha,an8855-switch";
> +
> +        ports {

ethernet-ports is preferred.

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {

And ethernet-port@0


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

