Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA52C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiK61WpmT0ctKIwY75HnpThFd8ZzC9ffICVu+PpUZ3c=; b=yrL6nJZdCkqKGssW3bkGuSyDk7
	YfIK2qlgRP/jH2xG6k3FnKyLdzp99gsZU9DXsUHor7swwC5uJpdxlOhNLRdScJJtVS6osXZ9VIqAd
	TKf0n6jzgQMZ7RhUcToeP7MVHxjhCxsKIUACcii06sh5gsZ0oVV5Gq1VpmE3nZ88JLhXuIsA4Hmla
	J/aVyOaoTUfzvz9NXY31NjPIRyDSCDrIXCe4QWcEwjI0InLVKi5kkcIG6K1RVfNfYwC4l6K+I8P4k
	ZSPTiwG6Cjasli5aCHxTPrR9Q5b0KyrPuR6ztJPAiuwRHExiBeMFNF1XXqOAxrH0mpyFNUZ1UIMA5
	7dEDmTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI2z-000000040i6-2kCo;
	Wed, 26 Feb 2025 14:06:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI0Y-000000040ME-099X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tiK61WpmT0ctKIwY75HnpThFd8ZzC9ffICVu+PpUZ3c=; b=v4V1VDYngPydaUXfGptlcFt9Ck
	Cj2Ecb1U3T5RkWNpXSkx9uWXFyNA7S1bXKT7QCgUHJYLQRJpeOqcVVB8gdFP7f4NU+xNTHf+c/DgK
	ItFKUrCIcOXV1ZK6/n+otAwHVyctwbDJ9farlSRaz7t3gfVsKG7/EdDmZ66z8iapFASxsRQrJT+EV
	DjgsggTsqmH8ID0bZmUczQz6mFEJlmcWP9s+HeHYyVujr9YGxEBnFKvDrYPFCzARVYTkpLq/+1Z8i
	kHIrpg1v6a5Q1r2CatE76keKbiTxdEsVAWoqK6hv7lyd64FIBhJBPw5dIbGuRO0rfbdA5AL79H7tr
	+sQ57tyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41768)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnI0R-0004Q7-0o;
	Wed, 26 Feb 2025 14:03:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnI0O-000790-2L;
	Wed, 26 Feb 2025 14:03:20 +0000
Date: Wed, 26 Feb 2025 14:03:20 +0000
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
Subject: Re: [PATCH net-next v2 11/13] net: phy: phylink: Add a mapping
 between MAC_CAPS and LINK_CAPS
Message-ID: <Z78fKCZl4-77NjeK@shell.armlinux.org.uk>
References: <20250226100929.1646454-1-maxime.chevallier@bootlin.com>
 <20250226100929.1646454-12-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226100929.1646454-12-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_060330_074934_7CCF66A2 
X-CRM114-Status: GOOD (  12.83  )
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

On Wed, Feb 26, 2025 at 11:09:26AM +0100, Maxime Chevallier wrote:
> phylink allows MAC drivers to report the capabilities in terms of speed,
> duplex and pause support. This is done through a dedicated set of enum
> values in the form of the MAC_ capabilities. They are very close to what
> the LINK_CAPA_xxx can express, with the difference that LINK_CAPA don't
> have any information about Pause/Asym Pause support.
> 
> To prepare converting phylink to using the phy_caps, add the mapping
> between MAC capabilities and phy_caps. While doing so, we move the
> phylink_caps_params array up a bit to simplify future commits.

I still want to know why we need to do this type of thing -
unfortunately I don't have time to review all your patches at the
moment. I haven't reviewed all your patches since you've started
posting them. Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

