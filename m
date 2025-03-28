Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36231C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqdvm7Y6OFuCO5TFEpOyK4zaILywfGPCSEV3cMDCKcg=; b=a2ZqjLa/wps0qCMRfRuS7glQL7
	uAsez54UbVgq1ppdL44zmn8nwhTuhORXLz8dMKZYa8mX/PU6a0dFTq+nZzDUB0SEx4Zmk/v530pZh
	yl4OPZbu+yBUuDiEwvv9UW57QDjFuvWiXoeudLv2dyGrlzHzOoHnJdS04CJxXgmErcUo0HvHnfDeJ
	63LYps1WsAsyvafgZx2H+wNm6dTnvN/z9Vk63CtbdgU2QiU5ld8HpuE8pDSyNSM5O3zT/sS8klyDG
	2mBYnl40eMVln8tMXtdXj2rIxAom5cNuC8KWJLND/yUvELdbQSkpZ+DFACmHqVu2e+LvWWgSJoKcn
	kHPTP/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyHXe-0000000EMNc-39S1;
	Fri, 28 Mar 2025 21:47:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyHVu-0000000EMHw-2u5Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 21:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kqdvm7Y6OFuCO5TFEpOyK4zaILywfGPCSEV3cMDCKcg=; b=O2ZbY+KzYXZozBXClpZ0NH4MtR
	iltpvlQnKQTnKV8CgGDzpMtyrsPeGt5FrZziT8gVe+1v5vzkOErhu1hiG5NpFyrWtBGbm2rTGge7E
	zwHJo5mYWo3h3OKNarJOrNumjyRmxia1xTA+LHD5aCzVVW1JoyLl9otytTxeIQ3YDz1M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tyHVh-007OT4-T3; Fri, 28 Mar 2025 22:45:05 +0100
Date: Fri, 28 Mar 2025 22:45:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home>
 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_144518_733025_7BF72B8F 
X-CRM114-Status: GOOD (  12.87  )
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

> Also I am not sure it makes sense to say we can't support multiple
> modes on a fixed connection. For example in the case of SerDes links
> and the like it isn't unusual to see support for CR/KR advertised at
> the same speed on the same link and use the exact same configuration
> so a fixed config could support both and advertise both at the same
> time if I am not mistaken.

Traditionally, fixed link has only supported one mode. The combination
of speed and duplex fully describes a base-T link. Even more
traditionally, it was implemented as an emulated C22 PHY, using the
genphy driver, so limited to just 1G. With multigige PHY we needed to
be a bit more flexible, so phylink gained its own fixed link
implementation which did not emulate a PHY, just the results of
talking to a multigige PHY.

But i don't think you are actually talking about a PHY. I think you
mean the PCS advertises CR/KR, and you want to emulate a fixed-link
PCS? That is a different beast.

	Andrew

