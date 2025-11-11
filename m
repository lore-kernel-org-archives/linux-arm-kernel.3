Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30939CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmQrc44iJz5u+hImAPDDt4huoJSd7wm/+r68X7iQLaw=; b=BAn04u8ATx2xO4qp6+TVQGvBvg
	yNeLLprwFMI0Qbzq1WhwH0qP7B4mdVKnjdv3ANIVIT1rf/JKEgkly4cyYbZTQCjjVO2eLoe+Kr2rT
	khefKt5ONLH3gzLbRs4MRXIZdOhJYr5jQxl42ilPLowZwfO0j9PZ7FUpFF9nLyd2RshoL4OlSx2pe
	GF1hs+XFoVqA7JLTXTVTB9vv5mVmzdZahp93gSCR5my8Gz1+XOVzy3lpH9wL79CR3IWmUA7w9im3E
	PM+izofwfrbXPlxftHIAL+HNgb9+Qiz0xfY2OZfiipT3i5zseokifr7oNpLiMXEDjkPzsLmLe3qCx
	d3VnyRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfWs-00000006TUe-3Jth;
	Tue, 11 Nov 2025 03:58:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfWq-00000006TUH-131u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 03:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bmQrc44iJz5u+hImAPDDt4huoJSd7wm/+r68X7iQLaw=; b=bb7j0aBATwc8+DvD1MF0ml6VvU
	moqxFUWPjEp62mqmxs0Dncr+iKlq9Wy9d/LUMvVxGeqbLJ1vXQxZzygMLY8YN3ES4zXZUJIXPwdTP
	LxuQ+GneAX8FDApKuoDH4kpWEiyJtMyNn9loKzGn5Dmfjm0c4mSOSag0jTYEVhSlVeUY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfWk-00DaWu-Cw; Tue, 11 Nov 2025 04:58:42 +0100
Date: Tue, 11 Nov 2025 04:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
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
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <7fac025c-3ec3-4900-9fa0-5e1a06cafeb4@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-8-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-8-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_195848_292021_CC05F82D 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, Nov 06, 2025 at 10:47:32AM +0100, Maxime Chevallier wrote:
> There are currently 4 PHY drivers that can drive downstream SFPs:
> marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> logic is boilerplate, either calling into generic phylib helpers (for
> SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> bit of validation :
>  - Getting the module's expected interface mode
>  - Making sure the PHY supports it
>  - Optionaly perform some configuration to make sure the PHY outputs
>    the right mode
> 
> This can be made more generic by leveraging the phy_port, and its
> configure_mii() callback which allows setting a port's interfaces when
> the port is a serdes.
> 
> Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> bus itself, but an SFP phandle is found in devicetree/firmware, then the
> generic PHY SFP support will be used, relying on port ops.
> 
> PHY driver need to :
>  - Register a .attach_port() callback
>  - When a serdes port is registered to the PHY, drivers must set
>    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
>  - If the port has limitations regarding speed, duplex and aneg, the
>    port can also fine-tune the final linkmodes that can be supported
>  - The port may register a set of ops, including .configure_mii(), that
>    will be called at module_insert time to adjust the interface based on
>    the module detected.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

