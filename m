Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F4FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee82qJy4b551MXZ3QzgwT/kSa0ZPEzuZFtBYc+NPeEk=; b=sI2F+bP0tyJxmE8GeKgq3vYsJH
	Jgl9lmT71igiV6OocLAHe6ZmdTiu3PS5Esr8z5pbi6McpcelrptFnSCa3nkXuoS32GozAQ3UrzSPU
	XufGSqRBCSPoTMZkqc8CxPavQSFr4e5c8efAOMg4K66oh98xBxSKkm++07zC86SjRjaDfRtFhd1kY
	oyIYnWAHFUk3bEY6IWZmvmB44W0Ql6vzDi3rSer25+Bqe3zd1NXN/787HLlSN4IC4blLohLhE0f77
	IhtvRLIT3W7JxeK9T1E/otnleQzZz9+rzXX8s186vrMoqX5ytPm6kaFTENvcDwCtsrs1ZmuII9dyp
	YLsvzqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauTY-0000000CDQk-0uFx;
	Thu, 23 Jan 2025 10:30:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauN5-0000000CBsA-1Ym2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CABD6A406A2;
	Thu, 23 Jan 2025 10:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD8AC4CED3;
	Thu, 23 Jan 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737627813;
	bh=RbxG41sC6Zb/IZnTPFnaZuAqpCDE7huLIDeKbm4yWEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcScvTBIDGMKTtBpFfokk5p4jxl7li+MuuiyxRxLKq+jtUG3cYdEGxwWTZ9cJ7JNM
	 T5UWiY+on/yIXt9u6i9OinZHTHneiu/Qy2nrAQZq3kXg1CC0yvWEGBqvsuPrJ+o4pC
	 x3VIbnVYVdTuRZsZEYp8UjY48mKuPj9Pdw42Y7xHe7viDQ+V+Xm23EXbo2yKhUX/j4
	 zW0kLuyY+P/wQckpqIowQpwGDMZsVz9ay2UPYjXEbl+0i9GwXthrQmnkC8snk2v1rc
	 s/9pSZx7W1kmDcPna8u9K86iUUQpk+XPCWoc3ACIAZbzjKXnM460Mn0lx4QXbtFRd0
	 wtGQBpqXJY8zg==
Date: Thu, 23 Jan 2025 10:23:27 +0000
From: Simon Horman <horms@kernel.org>
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
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 4/6] net: phy: Introduce PHY ports
 representation
Message-ID: <20250123102327.GI395043@kernel.org>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
 <20250122174252.82730-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122174252.82730-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_022335_537444_AB6ED93C 
X-CRM114-Status: GOOD (  23.79  )
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

On Wed, Jan 22, 2025 at 06:42:49PM +0100, Maxime Chevallier wrote:
> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
> 
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
> 
> This minimal port representation allows describing the media and number
> of lanes of a port. From that information, we can derive the linkmodes
> usable on the port, which can be used to limit the capabilities of an
> interface.
> 
> For now, the port lanes and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
> 
> The typical example is 100M ethernet. 100BaseT can work using only 2
> lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
> 
> mdi {
> 	port-0 {
> 		media = "BaseT";
> 		lanes = <2>;
> 	};
> };
> 
> >From that information, we can derive the max speed reachable on the
> port.
> 
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
> 
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

...

> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c

...

> +/**
> + * phy_port_destroy: Free a struct phy_port
> + */
> +void phy_port_destroy(struct phy_port *port)

nit: The Kernel doc for this function should include documentation of
     the port parameter.

     Flagged, along with several other Kernel doc issues,
     by ./scripts/kernel-doc -none

...

