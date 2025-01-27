Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB7C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw8SBoKaIQ+jJDh55z2lTeZVshKFDZTgIjVFie1Lh6Y=; b=ZlP7ttVZZh2XlkvfQjbB0xaAsJ
	LiCVwR3Aiwf4rWbdvhYpH7Zi7lbSazMaLBSCikg4OSSGio+bgR8zscB598bevda36wMLNtPlHwcZM
	YM2zmU2Xa8nc5rrFi7yKJDyGA58GtJz5XFbKWYbZlvnWobHtPtivPhGlIfcHxAUQmuBtHxWt0jHUo
	7iI8YnildILefD78rNcmWfMQESemY2GbkJ650CuosbXMNgLU+okweRinstfEgYmc8Gp3tZfLYS2Ca
	xg+3GS03djuQdd3E49u24RN2j2J7AKnIJ9REVqZvoLg6cIDb2+3XKaizQNaQgGF8KeXvPFstZWumT
	9Q4y0sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUTk-000000035hV-0e3w;
	Mon, 27 Jan 2025 19:09:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUSO-000000035Z7-3Rvb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 19:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DC49A419F8;
	Mon, 27 Jan 2025 19:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9162FC4CED2;
	Mon, 27 Jan 2025 19:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004855;
	bh=nOgE1Xm78sYrNXodpnGbC8FTPluHnfJLmlj0zh7LwTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfiWs/CrIrIPUXoBn9u859lQhtBX3yvkqmHKjO8DqTUw2A6DT8EKBjR9sMR5sF1KX
	 mW1MfJ24szzFYquhahIAE3Ay+4oCDnKw4Y8F8W5dclgq7/JGONRhTxTDcGYl29OEyk
	 IJrolWWpz1n3/7idwKXg51IwpjiYKLGJn0Iw3n2H2LQaUi02vpaeCdsQ7bA+IKKEB7
	 g9FQntEBAhwfeHo8AhT+6eafPqQ1nPqzqYjUPyrEmmFLDzYwVgA/3cX6Q7ReVlh2tu
	 o90wgm5w3JDYpj52WASkq1T11KU3UTBReF+12Z/P7qhHYJPrUDFEX1vtv668TD3kfK
	 iTz0dWpyVDN+g==
Date: Mon, 27 Jan 2025 13:07:34 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
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
	Antoine Tenart <atenart@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 6/6] dt-bindings: net: Introduce the
 phy-port description
Message-ID: <20250127190734.GA635780-robh@kernel.org>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
 <20250122174252.82730-7-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-7-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_110736_992462_81345907 
X-CRM114-Status: GOOD (  22.36  )
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

On Wed, Jan 22, 2025 at 06:42:51PM +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.

Seems like we need a connector binding like we've ended up needing in 
other cases.

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
> RFC V2: New patch
> 
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 2c71454ae8e3..950fdacfd27d 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -261,6 +261,17 @@ properties:
>  
>      additionalProperties: false
>  
> +  mdi:
> +    type: object
> +
> +    patternProperties:
> +      '^port-[a-f0-9]+$':

'port' is already a node name for graphs. It's also the deprecated name 
for 'ethernet-port' in the switch/DSA bindings.

> +        $ref: /schemas/net/ethernet-port.yaml#

A confusing name considering we already have 'ethernet-port'.

Rob

