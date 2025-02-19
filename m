Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08016C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxKhzjwDkAA9QczSRpc0m/AFc87zkaQJb8mLEB5RW5o=; b=RjlRlyYutfLMsEqKtQHnJPBAPv
	K6Xj5tgppit+euQwJC+SMhphyYcYjw3cxg2TVl3OBdQw483oin7ZVhmWl6awazPQHR/GAcc8Yv3AA
	k7jI3D7UjD4lgcbTLMpKT+UQ7I/dDRpp294Ig/PRHFLEw3yCjOJDP0ZIGV+qlEEJD/5dURZgoHm0g
	MEj3wGO7kShgBAgOtQKTr37vaLavaQT8dJe+1BdoYwSd++5aMgD/03dLH2ln8nTPgLSs9lUYGIouv
	5yqrZvpWDgzMUh1vlfg82qUjg1j4ourimIHa7AYL/fFPNXUZtCDgV7KtjmQ0RT1d8gBezpXHqXl/B
	XM9muaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksgl-0000000FTon-43Qy;
	Wed, 19 Feb 2025 22:37:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksfE-0000000FTNo-2oxf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DEC0611F3;
	Wed, 19 Feb 2025 22:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A2DC4CED1;
	Wed, 19 Feb 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740004531;
	bh=55H0to5iJJXxoB8dBhy7Y7xBqqr3s5lvCudSq0wSeNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jf7MQjPiA7iK7U0a9ySuTi0W67tdHacWDNQ5dtOzNiBEONFe2CQcWhfG0s3VzBVvj
	 n0WdGBPt+nbZMneOJ/B4oSNTT9NamtLGW0RGyyfoxkhEw+fMtKa7i8eaq5VFmAVaka
	 p5clfwqR9yZM9+ivSfoG6SrY9WoYcU9Xje2jAALmtfsE11HuTTmzC4Zq1FqxTRcrh6
	 N9U6zYreW8k8M1yvo/f2MVlledrW4YXrIzHo2ZjMe891D1zV5lcol8HG9H7jiTiT0W
	 tMr8vdjzEe6PrRZRSCWq9YhtKncfUOdM5aO0GvMXSqxTvjO+b9xinBFjVgaN27O84h
	 Fn9JXtogOFZTA==
Date: Wed, 19 Feb 2025 16:35:30 -0600
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 15/15] dt-bindings: net: Introduce the
 phy-port description
Message-ID: <20250219223530.GA3083990-robh@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-16-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213101606.1154014-16-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_143532_819284_4D6AA866 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Feb 13, 2025 at 11:16:03AM +0100, Maxime Chevallier wrote:
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
> V4: no changes
> 
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml

Seems my comments on v2 were ignored. Those issues remain.

