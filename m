Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C195ED111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvV1w4cAULv5qSHvIlf1UNf4JtPT19KI5eOxlCJ4tWA=; b=xn+JaA22gc/MxaQa2D25DIuVtH
	SGvSQnN8HQy48adbuQJSSaYq7CiBS8hQnuKw9RBNRGjotA6eU9smflQKFe+pcLZxacp8Raasf4IBY
	J2SPCtNIbwqJZoHdUFLG9f20pr4m33DX/Iaa8H1rNDrBaCeBzCjEZKt3Vkg+oLF8I2gJEUkjY+dkM
	wzPvQ7pcuSom5kHKUczA71pLG+wA8FaYffwX3XOJmrAtxBZjjPTE1R3rnYaOQYesYCpwkLBjnHLoH
	8Dr1nUs6Es+AXlse7PsURgdF6NHz7zTeS2FDEMbcVIlnLnp6e5OoPRMj24AXVRQlFYTWKW+PigDlj
	LG5RiT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgMc-0000000H2wV-2Tsf;
	Thu, 27 Nov 2025 18:05:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgMZ-0000000H2vd-1lNw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 18:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EvV1w4cAULv5qSHvIlf1UNf4JtPT19KI5eOxlCJ4tWA=; b=E/WGvUO0zODvpejzuuJAosSxXI
	iFqcj14LgqeI5b4CMhcAFYvNJNtPr/B8w3KNcBxAZqcXP+XFkZpLwQrhkmhgLcGYNjUdnkqzt12Dk
	5CBA+U+vk0kdLeeWzH9zoHUJsqicpqOa9iJv8NQhieYPif5d8/MauMU9LlOu8xAMTqbNC1l/qX4Fu
	fym+Npr21c7gk+4bn9CLtZ4o0h5qvf7hWxMHInKycDIBXnwA34CxjWBLrzV2SWwAjmV07If9JBQxW
	mNb21q0UHBKtVyPyXgE80fwKVYLKTjrXgJHs9/wrKzip3pvC5vXHEd/quSFNJ3d4fZh+ToXqlOcdB
	h9Deqrtg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55118)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOgMS-000000005bY-30fO;
	Thu, 27 Nov 2025 18:04:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOgMP-000000002rV-16BZ;
	Thu, 27 Nov 2025 18:04:53 +0000
Date: Thu, 27 Nov 2025 18:04:53 +0000
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v20 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127171800.171330-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_100503_461228_C077FDCA 
X-CRM114-Status: GOOD (  16.05  )
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

On Thu, Nov 27, 2025 at 06:17:46PM +0100, Maxime Chevallier wrote:
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
> of pairs of a BaseT port. From that information, we can derive the
> linkmodes usable on the port, which can be used to limit the
> capabilities of an interface.
> 
> For now, the port pairs and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
> 
> The typical example is 100M ethernet. 100BaseT can work using only 2
> pairs on a Cat 5 cables.

Correction: 100BASE-TX. 100BASE-T, which covers the family of 100BASE-T
media, includes 100BASE-T4 which is over all four pairs of the cable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

