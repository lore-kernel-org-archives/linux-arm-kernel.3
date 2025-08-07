Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A91C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTJAmK/RuqPGqNceQRqXn7WqL1onxDBkB7rg1B+KpRc=; b=kDm1sCVOqETtXZhQVRtLy1FvLL
	RbsdnHgerCOj+zZjrYTColdi+YDW+pAuxjW7yNTTwRecKP1NJpTaXY72ZJrefAyKcak0yUIsA9lbr
	F52Kt6gUYhEeT8ySpMqAwuMtIFANf+9QuZ/E/OfTty2+d8ewIOK/kpW6w3ve0QKua9hC0fSpZrTM9
	RngBawh62iJZoIZN78bLqAk39eBSrYo7XV4QfUtVcOa6Fc6hBO6Hzlb4tQhgFEOhdePUMtatrUP3I
	SZvlgMm2f1IzzUbpYGIEs2PG4cqBpuhKUxxo4BWiPE+bXfleO94QVVbX73p4f59K5zZ+H7TuatiO5
	3Owiti8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk69x-00000001OVr-1rbu;
	Thu, 07 Aug 2025 19:20:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk67Q-00000001OGU-0RHj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 19:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VTJAmK/RuqPGqNceQRqXn7WqL1onxDBkB7rg1B+KpRc=; b=y7R35GghiBYgAKpVICZVirOPT8
	5h7mM1XI90jlP/RPcoTWrygIdPQ5PPobGdFATPVC/YraPpasd6kXlCDSjNTBnIoiqUY8Cn4+tMuNL
	7ZIjqwrvBr9hqELYrBOGgZxqq5XmvoXEXPTA5clZE5gc4/zm4pBZXQKhckgw2gyJcFFyBhciRfv0U
	DuE/L63jFzmVKau62VmE6UIC0k2aOX/TUlgheRn9goZuadMp72U5CoYGE2bPIh/Rv5z4+j/6rmGki
	JBIwT1/sfM3o3toZHau7DVYhIPrhQhnnn3XzL2Z5U8Nr+vZ0uXd5ybIaM2OMr0J7/wgiJxhjRWvjO
	0f4MKsGA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uk65A-0006V3-1m;
	Thu, 07 Aug 2025 20:15:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uk654-0008LM-0X;
	Thu, 07 Aug 2025 20:15:14 +0100
Date: Thu, 7 Aug 2025 20:15:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: stmmac: rk: put the PHY clock on remove
Message-ID: <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
 <20250807183359.GO61519@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807183359.GO61519@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_121740_143424_67681FD2 
X-CRM114-Status: GOOD (  21.40  )
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

On Thu, Aug 07, 2025 at 07:33:59PM +0100, Simon Horman wrote:
> On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> > The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> > doesn't take part in the devm release. Therefore, when a device is
> > unbound, this clock needs to be explicitly put. Fix this.
> > 
> > Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > Spotted this resource leak while making other changes to dwmac-rk.
> > Would be great if the dwmac-rk maintainers can test it.
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 79b92130a03f..4a315c87c4d0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
> >  	stmmac_dvr_remove(&pdev->dev);
> >  
> >  	rk_gmac_powerdown(bsp_priv);
> > +
> > +	if (plat->phy_node && bsp_priv->integrated_phy)
> > +		clk_put(bsp_priv->clk_phy);
> 
> Hi Russell,
> 
> Something seems a little off here.
> I don't see plat in this context in net.

Already have a fix for it, thanks anyway. Today ended up going awol
due to dentistry stuff. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

