Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B49E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6XBpg/4IY/h2oG4Vm6RRozZRxiEoSr8X5lqGM2zVMQ=; b=eIfH4DjhgUe2uBpOo8/SnZv9xd
	J/T2sl3+DZbu95wPGqGylmGjP9IG9Z3owoLa9PHJ9tFg1hABl5dXok7fkJNFweDVMnorQoRx1iKU4
	ZTbjF3D8rRUSs0Ka9Obj0ZZ7VNdLKsUeexmODfDGjpfDrWkSz7Q6Tjo43kKeKhTmXH4zYCwKD0zly
	UA34RB7pR/EpkViHwXD2H4RiqEtytik7GPx9n1kdDYaGn+wjj4up4/6VklIcIsnOBFH/Ogfun1Xaf
	PI6KZ5nDhLmo+hw25LY9wv3HtFOCs4qy5GYre0wQWB7EHjGvKtuL3td763jH1WsQUqOX4+7W1LvPD
	Xsd/ky1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBwq-00000004vuh-20MH;
	Fri, 13 Dec 2024 20:07:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBvl-00000004vim-1TfN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 20:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q6XBpg/4IY/h2oG4Vm6RRozZRxiEoSr8X5lqGM2zVMQ=; b=aNI5GnhQ6591BedH7CtBIbwC3F
	pPegR4DND7Y/V0E+4t4zeoFoiA4JLIzRvfkwicxC81fLd2Ni+pEJlR5DEadz7cng3p7F5+jqj7ut2
	0gy193TVuR83XUqRwvK60EUJQZjeEznMo5DK7ygI8PaY2FTQGbMeBIk/Jubz49CQe9Wnm1H1onRjF
	rWaijsyAlwiEioPkzZyU/rLwFrv3gujLHJGlaVMDMUlkgpfe6YqA6E4pmsgDMdYb7YtV+yd5VIpxF
	peu09WWvvSxecCx9Bc+jUMX103IOvU51cBhnpqBHpmJh/c9W2gjBpkthcxqGqa6l/3oYMHIl7KNp6
	XeeBe0yA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tMBvd-0007Iw-2d;
	Fri, 13 Dec 2024 20:06:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tMBva-0006ZC-0s;
	Fri, 13 Dec 2024 20:06:22 +0000
Date: Fri, 13 Dec 2024 20:06:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/7] net: stmmac: move tx_lpi_timer tracking to
 phylib
Message-ID: <Z1yTviYUZ8sbNOsK@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
 <E1tLkSX-006qfS-Rx@rmk-PC.armlinux.org.uk>
 <Z1wTqh-BnvPYLqU8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1wTqh-BnvPYLqU8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_120633_388321_6361DE22 
X-CRM114-Status: GOOD (  18.01  )
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

On Fri, Dec 13, 2024 at 10:59:54AM +0000, Russell King (Oracle) wrote:
> On Thu, Dec 12, 2024 at 02:46:33PM +0000, Russell King (Oracle) wrote:
> > @@ -1092,6 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
> >  			phy_init_eee(phy, !(priv->plat->flags &
> >  				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
> >  		priv->eee_enabled = stmmac_eee_init(priv);
> > +		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
> >  		priv->tx_lpi_enabled = priv->eee_enabled;
> >  		stmmac_set_eee_pls(priv, priv->hw, true);
> >  	}
> 
> While looking deeper at stmmac, there's a bug in the above hunk -
> stmmac_eee_init() makes use of priv->tx_lpi_timer, so this member
> needs to be set before calling this function. I'll post a v2 shortly.

I'm going to hold off v2, there's a lot more that can be cleaned up
here - the EEE code is rather horrid in stmmac, and there's definitely
one race, and one logical error in it (e.g. why mark software EEE mode
*enabled* when EEE mode is being disabled - which can lead to the EEE
timer being added back onto the timer list.)

There's also weirdness with dwmac4's EEE register fiddling.

The stmmac driver uses hardware timed LPI entry if the timer is small
enough to be programmed into hardware, otherwise it uses software mode.

When software mode wants to enter LPI mode, it sets both:

	GMAC4_LPI_CTRL_STATUS_LPIEN (LPI enable)
	GMAC4_LPI_CTRL_STATUS_LPITXA (LPI TX Automate)

When software mode wants to exit LPI mode, it clears both of these
two bits.

In hardware mode, when enabling LPI generation, we set the hardware LPI
entry timer (separate register) to a non-zero value, and then set:

	GMAC4_LPI_CTRL_STATUS_LPIEN (LPI enable)
	GMAC4_LPI_CTRL_STATUS_LPITXA (LPI TX Automate)
	GMAC4_LPI_CTRL_STATUS_LPIATE (LPI Timer enable)

That seems logical. However, in hardware mode, when we want to then
disable hardware LPI generation, we set the hardware LPI entry timer to
zero, the following bits:

	GMAC4_LPI_CTRL_STATUS_LPIEN (LPI enable)
	GMAC4_LPI_CTRL_STATUS_LPITXA (LPI TX Automate)

and clear:

	GMAC4_LPI_CTRL_STATUS_LPIATE (LPI Timer enable)

So, hardware mode, disabled, ends up setting the same bits as
software mode wanting to generate LPI state on the transmit side.
This makes no sense to me, and looks like another bug in this driver.

Can anyone suggest any hardware that I could source which uses the
dwmac4 code and which supports EEE please, so that I have hardware to
run some tests on.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

