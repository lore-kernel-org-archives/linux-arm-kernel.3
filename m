Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE9EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3pKjimdpYHYRgRlkEN2TeR5MtbKLWDqPslqiEwTKl0=; b=WZDJVuuZdt69J/t9JxZsq0WHU2
	83qAGNW3pvDARgQwG5QMCyqA47g4nKzPQvsBgwQ71x+JYV1fnVToXtxLdnMIeInBWUPTklk9kcrMS
	X4TsFTFvJbrCyzs8QgMTUWOUCOnBLetit90+G3NREqFd4UXLkNXmzaRt6l0nC0JK3Q/iBEXDEHgZx
	yfnRm13O1lZP1lqZ46mVu/RyKBOPBYS1+irNDsxMPNs4CkuwMccWYCjWNxpmUZrIjebAmM0Xslgqs
	6RpZtnnp8D94c73xBMy1QWODsm2ag6Ui4DSXMQiXlVZZME0bPiQEbF7xu+NXbvXTw9X64GKA7gBsx
	Y1DBYxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZSp-0000000E6Eg-3SrJ;
	Mon, 24 Feb 2025 14:29:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ1O-0000000E0GF-14In
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g3pKjimdpYHYRgRlkEN2TeR5MtbKLWDqPslqiEwTKl0=; b=Tqfi03odd2+9ApJmXuG5zGIJn1
	Zow5gKtlUufYs/nsd2wd1D7M1NMeAjhJx2Shk8aM9+oZ3+8CLXQXjVLhEnt1OTlLby5v80W5bCtts
	CzamauiUl0gsK/XkFcOoy3jCqrOiTVYBZkthwApVgF4LftlsryTI5DC3rCu/FIJI85K87jdLb97Ib
	rsBJGWAQvN2BQdiqvcgLr7K/SyfqgKW3H/HfW5gxUng30HcW1s91E5pmJMwn5n3QKyUie2hEt3MVW
	gC9jEtoXGj2j0CMfYdAQUtGmADQk/MQXsYbaaVpteWjSWgRCHLktDSWv8Q5Drbgk3Nr29OMPsnJl/
	RLTFQgfg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47558)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmZ1F-0006W1-0p;
	Mon, 24 Feb 2025 14:01:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmZ1D-000535-1W;
	Mon, 24 Feb 2025 14:01:11 +0000
Date: Mon, 24 Feb 2025 14:01:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 01/13] net: phy: Extract the speed/duplex to
 linkmode conversion from phylink
Message-ID: <Z7x7p3W0ZpkFu44m@shell.armlinux.org.uk>
References: <20250222142727.894124-1-maxime.chevallier@bootlin.com>
 <20250222142727.894124-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222142727.894124-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060122_294182_8D05EB59 
X-CRM114-Status: GOOD (  12.86  )
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

On Sat, Feb 22, 2025 at 03:27:13PM +0100, Maxime Chevallier wrote:
> Phylink uses MAC capabilities to represent the Pause, AsymPause, Speed
> and Duplex capabilities of a given MAC device. These capabilities are
> used internally by phylink for link validation and get a coherent set of
> linkmodes that we can effectively use on a given interface.
> 
> The conversion from MAC capabilities to linkmodes is done in a dedicated
> function, that associates speed/duplex to linkmodes.
> 
> As preparation work for phy_port, extract this logic away from phylink
> and have it in a dedicated file that will deal with all the conversions
> between capabilities, linkmodes and interfaces.

Fundamental question: why do you want to extract MAC capabilities from
phylink?

At the moment, only phylink uses the MAC capabilities (they're a phylink
thing.) Why should they be made generic, and what use will they be
applied to as something generic?

If there's no answer for that, then I worry that they'll get abused.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

