Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB90EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DzXmk4dFbeO+m8INiuwLYdFt5umLSVckqHmHFprSKg=; b=W4J4825SoawK3DD9GPiWVhDK1F
	/7/5NkwQH+8QQbB6VIm4ZAuDkwXEJnGx7Kna8HDQNxB4DmqvwIoPG6InPzTjaWxyDz0p0rRL8K6HJ
	2gSYHD5dj0eAG2v6mC2tQZNaZeUZVQv8gUVdhoB2zc+5m1+yNnQrhwUy2AUDpvONnEbu58q7Hhzrp
	KRPrvyepni/SalIYTlWzxOAC5P2zQRy4oVVwFJ0x0iXW1nyflsht4sIUnQq2dwUNW/IITCGb/rzhU
	FMSWWjypn8hnVsrMYXfrXeF2+x9seFwkOSJpBjlWUOOeDYZYSt4djyI3rBYZNsdxKZKz0go5Bw9Ph
	8aOdyGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqB3g-0000000B1Ag-1SsF;
	Thu, 06 Mar 2025 13:14:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAeO-0000000Axx8-1l6m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+DzXmk4dFbeO+m8INiuwLYdFt5umLSVckqHmHFprSKg=; b=CxxAsc2me4QVCsLdkb0TVQu/h+
	R9lAsFcYFiT7hXeI1jTEY5Uu58JXIQjI3gtjpM+pgssnH97R7qM9eahOg2aZPqHkH8tWttXmwvKmt
	12Tc0Fgpt8cCB9suT7loDaMO3O3+7xHS/UIW72QUAE2quCTqsvRmgGoaLrOzD0WFxvtumRDY5+5OA
	+p+q99J6JRgZ0nngzpfFEIHB3pXGInsxjScLQd02zDVYMpSh0wK/yon0/5m8+/w7E7nLIMCt28zMA
	ghSe+sBkFss3w2hxOhxiJSePMHyU5+ma38K79kcOC8t/GszICm62dUH2h3oQtVG3PxuK07YK+Cwt2
	1adcMuyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40594)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqAeA-0005rj-0H;
	Thu, 06 Mar 2025 12:48:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqAe5-0006no-2J;
	Thu, 06 Mar 2025 12:48:13 +0000
Date: Thu, 6 Mar 2025 12:48:13 +0000
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
Subject: Re: [PATCH net-next v4 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <Z8mZjabeITVg1Khg@shell.armlinux.org.uk>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
 <20250303090321.805785-10-maxime.chevallier@bootlin.com>
 <20250304154330.6e00961b@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304154330.6e00961b@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_044832_500223_2C37E3E3 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Mar 04, 2025 at 03:43:30PM +0100, Maxime Chevallier wrote:
> On Mon,  3 Mar 2025 10:03:15 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > When phylink creates a fixed-link configuration, it finds a matching
> > linkmode to set as the advertised, lp_advertising and supported modes
> > based on the speed and duplex of the fixed link.
> > 
> > Use the newly introduced phy_caps_lookup to get these modes instead of
> > phy_lookup_settings(). This has the side effect that the matched
> > settings and configured linkmodes may now contain several linkmodes (the
> > intersection of supported linkmodes from the phylink settings and the
> > linkmodes that match speed/duplex) instead of the one from
> > phy_lookup_settings().
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> 
> Maybe before anything goes further with this patch, I'd like to get
> some feedback from it on a particular point. This changes the linkmodes
> that are reported on fixed-link interfaces. Instead of reporting one
> single mode, we report all modes supported by the fixed-link' speed and
> duplex settings.

This is a good question. We have historically only used the baseT link
modes because the software PHY implementation was based around clause
22 baseT PHYs (although that doesn't support >1G of course.)

The real question is... does it matter, to which I'd say I don't know.
One can argue that it shouldn't matter, and I think userspace would be
unlikely to break, but userspace tends to do weird stuff all the time
so there's never any guarantee.

> The fixed-link in question is for the CPU port of a DSA switch.
> 
> In my opinion, this is OK as the linkmodes expressed here don't match
> physical linkmodes on an actual wire, but as this is a user visible
> change, I'd like to make sure this is OK. Any comment here is more than
> welcome.

Maybe Andrew has an opinion, but I suspect like me, it's really a case
that "we don't know".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

