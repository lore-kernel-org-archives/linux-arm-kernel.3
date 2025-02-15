Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BF8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4LqKRCXJnPDKHuRcvP8uYDa5EhADrSmcCiECY0GjxM=; b=hG+3dmPhn85Et3QHJzF8jbayP7
	eLxREhlim8m6jn+n2KATRUFHT2aKqq2gos7Xg05N71d42mESXVtsN/RBZ8seKjPT/EZnBDDFHwYOk
	YTEmTnUzoSBFiDQSeRJLGqvjYw/r672xTXWZPCBSTWopejXk3DM3JPERrVBTdK4LbjsTqxsIpLUql
	1CUEoE9PKimzjh2HDW1Xdx66qtKiP/vadfa4Jg3cu3YTCbWofVnzA3krej/9wkrSLO6JdIQjPtiig
	alcpSIAqXB2CAbNCXjT+JowLNKv6k0Xt4WeRQQ6Eo20nd3Vj3BfidRe+FAQZ73vO5xHY4LhQdoBPO
	MsFyZH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNNZ-00000000bU1-2URg;
	Sat, 15 Feb 2025 18:59:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNM6-00000000bOD-31bj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 18:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q4LqKRCXJnPDKHuRcvP8uYDa5EhADrSmcCiECY0GjxM=; b=zuaE5qWfzmZLlfybUdO4Ful9fX
	Xvpz0iKNb62xJZJcS9AjOF7w1g90YGN2BSDUF3gQ6MKPPwaPNIy4o0tnJtLPN9Y7dxT8N4Xg43aYX
	KKI++HSMbNUP3hmELC/qFIkBpIAMmYfBkjRaWWK+ntwwQwgRUeB0mOc6hKHo+buP2QjHzC+iR9JI6
	Otw+CJYdDPe+67oPxzbd9/lqY7BsiBUcP46MIyZbuvro3TtJuvq/KI3ubrWaA2r/KXO2aCo7OWwKq
	6fHn/UNAPS2QYADk3YVBADdeQOHb+7BZ8UF1DF9dp3lYUSlNMXuQBf+sYAL7+yipIdYNoLw4jr1CO
	lER37mjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50940)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tjNLk-00010g-2o;
	Sat, 15 Feb 2025 18:57:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tjNLZ-0004Pp-2G;
	Sat, 15 Feb 2025 18:57:01 +0000
Date: Sat, 15 Feb 2025 18:57:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213101606.1154014-6-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_105735_052037_88A75C3E 
X-CRM114-Status: GOOD (  14.75  )
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

On Thu, Feb 13, 2025 at 11:15:53AM +0100, Maxime Chevallier wrote:
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to anther entity on the link. The PHY driver needs to specify the
> various PHY_INTERFACE_MODE_XXX that this port supports.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

With this change, using phy_port requires phylink to also be built in
an appropriate manner. Currently, phylink depends on phylib. phy_port
becomes part of phylib. This patch makes phylib depend on phylink,
thereby creating a circular dependency when modular.

I think a different approach is needed here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

