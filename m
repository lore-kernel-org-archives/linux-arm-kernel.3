Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPcnOhRdd53xj4ndL5o1wFLEp2VkNlI8kdN53UFjnhg=; b=viWlGQoDCMOHO/B2Hi2Jf4i7zt
	5ZZO6MTo+iIhXV6HUDcYu8pJZ+HuAkLgOY5NaQDhx9sOtAQBd882Ww/vxBh/SdhDOh8FnlzQf8Wew
	ytzjZb5mVoG/uKo+2xnK3u6ibiwtwKtlT7OeeqkWk62bPi+mUjS9iz8DN/FNa/4lRD2YTxdW+2lKP
	g0cUEDIHQPxMoSfhYDkJyQujsDMDc+x0vbZIIXdoblOMQnwxPJFWZAA4VBNvmfq885imqc+r+4VwO
	gcTRfegJd3d6ljrVM7Ss6UlK2Yto7IWtIM6ygPHLQw3rXuwaFClmP6zpF/fxmE53+AOxViDbR/b5F
	xQAALk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGzA-00000000ldK-3sgG;
	Mon, 31 Mar 2025 15:23:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGX9-00000000eGc-02JO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HPcnOhRdd53xj4ndL5o1wFLEp2VkNlI8kdN53UFjnhg=; b=F3f6OHDFFH6FQttsDKRCCNG1cK
	wWwHSeYsKPv+hnYTawudXWiiN08AoomTV4Drfe0f3vmHHSk3rhl6pVaKsoXTrmMljQrf8toegjLfc
	zyEoSWns/BnymMsKH7B3jbt6rQHHJRtWs7YnSGtp8i7G7LWHP5+9tLRcgTkd9Y6jdE/4vkPqjgQPj
	z1bBoFttbNwAmuVg9GmldXo0+1v7kGdQZkiBuPsncuWtvGr3eksArn/2eTSTpmHzxftMuU6/2xzke
	IEM1shTTauu6d6W1PjNMrDhZCAu5tN5fFsDTgxAfU67CGseWezC4wJWWucKiilVuJGjNo3mQhu12Q
	IM+r03aA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49000)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzGWw-0004EQ-0s;
	Mon, 31 Mar 2025 15:54:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzGWq-0001lE-3B;
	Mon, 31 Mar 2025 15:54:21 +0100
Date: Mon, 31 Mar 2025 15:54:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Duyck <alexander.duyck@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
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
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home>
 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
 <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
 <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
 <02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_075439_048868_7755C511 
X-CRM114-Status: GOOD (  30.79  )
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

On Mon, Mar 31, 2025 at 04:17:02PM +0200, Andrew Lunn wrote:
> On Fri, Mar 28, 2025 at 04:26:04PM -0700, Alexander Duyck wrote:
> > A serdes PHY is part of it, but not a traditional twisted pair PHY as
> > we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces. I
> > agree it is a different beast, but are we saying that the fixed-link
> > is supposed to be a twisted pair PHY only?
> 
> With phylink, the PCS enumerates its capabilities, the PHY enumerates
> its capabilities, and the MAC enumerates it capabilities. phylink then
> finds the subset which all support.
> 
> As i said, historically, fixed_link was used in place of a PHY, since
> it emulated a PHY. phylinks implementation of fixed_link is however
> different. Can it be used in place of both a PCS and a PHY? I don't
> know.

In fixed-link mode, phylink will use a PCS if the MAC driver says there
is one, but it will not look for a PHY.

> You are pushing the envelope here, and maybe we need to take a step
> back and consider what is a fixed link, how does it fit into the MAC,
> PCS, PHY model of enumeration? Maybe fixed link should only represent
> the PHY and we need a second sort of fixed_link object to represent
> the PCS? I don't know?

As I previously wrote today in response to an earlier email, the
link modes that phylink used were the first-match from the old
settings[] array in phylib which is now gone. This would only ever
return _one_ link mode, which invariably was a baseT link mode for
the slower speeds.

Maxime's first approach at adapting this to his new system was to
set every single link mode that corresponded with the speed. I
objected to that, because it quickly gets rediculous when we end
up with lots of link modes being indicated for e.g. 10, 100M, 1G
but the emulated PHY for these speeds only indicates baseT. That's
just back-compatibility but... in principle changing the link modes
that are reported to userspace for a fixed link is something we
should not be doing - we don't know if userspace tooling has come
to rely on that.

Yes, it's a bit weird to be reporting 1000baseT for a 1000BASE-X
interface mode, but that's what we've always done in the past and
phylink was coded to maintain that (following the principle that
we shouldn't do gratuitous changes to the information exposed to
userspace.)

Maxime's replacement approach is to just expose baseT, which
means that for the speeds which do not have a baseT mode, we go
from supporting it but with a weird link mode (mostly baseCR*)
based on first-match in the settings[] table, to not supporting the
speed.

> > In addition one advantage is that it makes it possible to support
> > speeds that don't yet have a type in the phy_interface_t, so as I was
> > enabling things it allowed some backwards compatibility with older
> > kernels.
> 
> I don't like the sound of that. I would simply not support the older
> kernels, rather than do some hacks.

I think Alexander is referring to having a PHY interface modes that
supports the speed - for example, if we didn't have a PHY interface
mode that supported 100G speeds, then 100G speed would not be
supported.

Phylink has already restricted this and has done for quite some time.
We only allow speeds that the selected interface mode can support,
with the exception of PHY_INTERFACE_MODE_INTERNAL which supports
everything.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

