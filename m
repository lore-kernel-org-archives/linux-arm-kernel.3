Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FDBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoIXiOR5N4qvjIOVDMGoDjq4P3o+Q3XWknsTh3hugIQ=; b=GjXxLUjm8pS4kF/LFZcycpTmkA
	KtVDf4JdLtg3J9ljmA5pNDmVakYFRMtMNtLHmsZu8CxkgQfSXnSWsySVORBjDLaS1Wb0d3Aq5mKTJ
	YJLSwlOGjb6TKfOBDRQrOfh7wCZkkKu1faBDWZZEIMnEvgEdTA7v0iYnLo/t+Sry/dfPqWYD8DtwU
	mJA8MaL9s3s9RrVK9yFalCymqGUT+IWGkq+y+FKNnYktwj4UNXaHcEDzqzcGDPOz/X4SEgtyyijCV
	aKSUajfDbu5NxZH3NTeHcA9EJPp2APXZEFy+rzLJnzp2MIcwb4l82vCgWKjjgLR2jxUcevSGiBNk+
	MrMDd4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xDU-000000053et-3dxc;
	Mon, 21 Apr 2025 19:54:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xBc-000000053TO-38RB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 19:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CoIXiOR5N4qvjIOVDMGoDjq4P3o+Q3XWknsTh3hugIQ=; b=JKafrj3OLsnuxsHw+VFNxH82yA
	TM2jheskPpBoFDY5/xp844xNRSPBxUT1UGoyCTP5TwbV50UiGTJoK6lWRZrqdjNdoqXDGgITcN5gz
	vevJR9DnBmIsQrgPVjts1CpRpFMUhXxVZckI8feZJxMwsbYilm0Ksuqec755JzCtDTN6asu9iFr2Q
	PdBYFesIWfaFrffZQqHMsx0HpE3KWeG17VDrJf0RgoktrUf9s+UbZbKo1llLg6z7M12lX+ePK85mi
	s4UG2UfzOixSH0XOn4K0rRPUZHUXVrlngVhCvsSzLcxzoCNYk0WdDmw5QponUsuyMPUM7lUqY0n8O
	quYz+Yug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55886)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u6xBH-0003Je-1s;
	Mon, 21 Apr 2025 20:51:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u6xBC-0006js-0V;
	Mon, 21 Apr 2025 20:51:46 +0100
Date: Mon, 21 Apr 2025 20:51:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <aAah0ofEozVUZAOa@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
 <TY3PR01MB113461CDEA58CB260ADB9FB9286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346DD3E3AEB0CCEAB57AE9C86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DD3E3AEB0CCEAB57AE9C86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_125212_790365_566D62E7 
X-CRM114-Status: GOOD (  26.93  )
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

On Mon, Apr 21, 2025 at 07:23:52PM +0000, Biju Das wrote:
> Hi Russell,
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: 21 April 2025 20:06
> > Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> > 
> > Hi Russell,
> > 
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: 21 April 2025 20:00
> > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > > for Renesas GBETH
> > >
> > > On Mon, Apr 21, 2025 at 01:45:50PM +0000, Biju Das wrote:
> > > > Hi All,
> > > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.
> > >
> > > Which "mainline" are you using?
> > >
> > > Reading your emails, I suspect v6.14 rather than something post-dating
> > > v6.15-rc1, since your latest email suggests that the PHY driver's
> > > ->resume method is not being called early in stmmac's resume. However,
> > > commits 367f1854d442 and ef43e5132895 made this happen, which were
> > > merged during the merge window, and are thus in v6.15-rc1.
> > 
> > I am using Linux version 6.15.0-rc2-next-20250417 + renesas_defconfig with CONFIG_PROVE_LOCKING
> > enabled.
> 
> For me, it looks like issue related to timing, see[1] for details
> 
> [1] https://lore.kernel.org/all/TY3PR01MB1134690619EC6CADD07CD2DE186B82@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> 
> Please let me know, if you have any patch that I can try out to fix the random timing issue.

That's the email that provoked me to reply this evening (I wouldn't have
because I'm still on vacation.)

So, this is how things are supposed to be working:
- stmmac_phy_setup() sets phylink_config.mac_managed_pm and
  phylink_config.mac_requires_rxc to be true. The former disables phylib
  based power management.

- You've hooked in stmmac_pltfr_pm_ops.
- On resume, this will call stmmac_pltfr_resume().
- stmmac_pltfr_resume() will call your ->init function followed by
  stmmac_resume().
- stmmac_resume() will call phylink_prepare_resume().
- phylink_prepare_resume() will call phy_resume() to resume the PHY
  if pl->config->mac_requires_rxc && phydev && phydev->suspended is
  true. The first and second will be true. The third... depends.

For phydev->suspended to be true, phy_suspend() needs to have been
called. Neither mdio_bus_phy_suspend() nor mdio_bus_phy_resume()
should be having any effect as phydev->mac_managed_pm should be
set (as a result of phylink_config.mac_managed_pm having been set.)

phy_suspend() also gets called from phy_detach() and
_phy_state_machine_post_work() when the work is PHY_STATE_WORK_SUSPEND.
This happens when we halt the PHY, which will happen if phy_stop() is
called.

phylink_suspend() will do this only when WoL is not active - calling
it when WoL is active will prevent WoL from working as the PHY needs
to stay awake to (1) detect WoL packets if it is programmed to do
so, or (2) pass packets to the MAC in the case where the MAC is doing
WoL.

So, phy_resume() should be getting called for the !WoL case, which will
result in the PHY driver's ->resume method being called - in your case
kszphy_resume().

This will occur synchronously, and after gbeth's ->init function has
been called, and as its all in the same thread of execution, it should
be 100% reliable.

For the WoL case, we assume that the PHY retains its settings since it
needs to remain powered up, and because it hasn't been suspended or
shutdown, it should be retaining all settings when the system wakes up.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

