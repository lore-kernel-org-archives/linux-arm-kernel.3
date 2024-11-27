Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41905D6ACC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIKehKgtybj2cFJeI0I6flBJA609w30OYT4LYfzTAs8=; b=B44oK8sskaKIfGoDGuMejXjG1h
	vCQutwhqkKQUhkIblJ5wDjirh5h9DN9GYni5iiR+KxedNkHxODd7eeq1L0TvUBhzAUyEginkpORKz
	YqavaVe7BgVkBn8+PIRG8J83HPsw/tr7FLXUyYFrljarAsuULWo/BpT1Wr4kkOwr2sMwN1yodggBe
	q93HyGE6yf4qgZCc535j8gCL3xyFG14s6BPKEUuE6h8p0r+o48S1/6sEwaNrtjyntzwPhZMHUPgs6
	W0kQI4eC5jkDNeNQS6VFKFaXsZUCRGYPZ061W9OxdWqOsp1f8GsmU1MdRrmjNm7ELe+/PHB649LRR
	kYnHwy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGH2l-0000000D7u0-0ePv;
	Wed, 27 Nov 2024 12:21:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGH1m-0000000D7mN-3OZq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 12:20:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tGH1e-0005Oe-UA; Wed, 27 Nov 2024 13:20:10 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tGH1c-000QZ6-2C;
	Wed, 27 Nov 2024 13:20:09 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tGH1d-000xlP-15;
	Wed, 27 Nov 2024 13:20:09 +0100
Date: Wed, 27 Nov 2024 13:20:09 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 02/23] net: phy: fix phy_ethtool_set_eee()
 incorrectly enabling LPI
Message-ID: <Z0cOeUa2XSFQs0zq@pengutronix.de>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
 <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_042018_846565_A671801A 
X-CRM114-Status: GOOD (  24.63  )
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

On Wed, Nov 27, 2024 at 11:12:28AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 26, 2024 at 12:52:21PM +0000, Russell King (Oracle) wrote:
> > @@ -1685,15 +1685,21 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
> >  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
> >  				      const struct eee_config *old_cfg)
> >  {
> > -	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
> > +	bool enable_tx_lpi;
> > +
> > +	if (!phydev->link)
> > +		return;
> > +
> > +	enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled && phydev->eee_active;
> > +
> > +	if (phydev->enable_tx_lpi != enable_tx_lpi ||
> >  	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
> 
> I'm wondering whether this should be:
> 
> 	if (phydev->enable_tx_lpi != enable_tx_lpi ||
> 	    (phydev->enable_tx_lpi &&
> 	     phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer)) {
> 
> The argument for this change would be to avoid cycling the link when the
> LPI timer changes but we're not using LPI.
> 
> The argument against this change would be that then we don't program the
> hardware, and if the driver reads the initial value from hardware and
> is unbound/rebound, we'll lose that update whereas before the phylib
> changes, it would have been preserved.
> 
> The problem, however, are drivers where the LPI timer is dependent on
> the speed.
> 
> Any thoughts?

So far, i was not able to find any. But, like I said before, to get
optimal performance and power saving balance, the lpi_timer should be
link speed specific... at least, some day with appropriate user
interface.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

