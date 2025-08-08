Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40813C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bYjFDFb/EHHBKS00RA5+QwVu21sv5tx+/jfv6LNzdc=; b=hDnyPh5SEArdn2s4i8F7bgqaE4
	fXFmsEupQ5rF5mW7u6QKD/cDEfm5/CYh1xW1w1srSCAvA59wLMYiu6cnJ1JwL8c+y2UCGgwzEzlqw
	w8RvIayukr50iW5pakS496z78B1YP6tH7k0asfKSMBJv57c9MvqeY2/S6V9qD7C7xnGV6EjB/UmQ5
	TTr+QMLg+YaCp2W0ZSrOS571X/rhXZe97Jf5uMPEekEybNhvDiozHc6CuR838Sr51YhNow9eCvxYp
	YUUedfzGRkyQlRcJHyj/nxWfHmJwzxI+/H/9Xh0/NFUn+cYbFTfL0VVNqejDwmCwOpLotgi2DvG3s
	iuCJPFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMxJ-00000002tv1-2nbx;
	Fri, 08 Aug 2025 13:16:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMrD-00000002syW-0Tte
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 13:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 656F5A556D0;
	Fri,  8 Aug 2025 13:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BAAC4CEED;
	Fri,  8 Aug 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754658602;
	bh=Ry/5UI73pZtdPKEskqZzyPIwhQo+s64pnx0FlVxe0dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFOwBdRshhFKDGtm6ZJNi50fc33bSOPHC1hQMCtSk20p3W1WQd2f4JcdQCjINzeXX
	 Dh3LLcw/aZAB8B849z6ypCLJC4025T1Ko/yKIXpt7bXG6W2MJOaHAaCF+qy7X3Gcua
	 2YoqTry90teKprfUWIlirzavBwIxyfTD2LIU5sE6UP+lTuOciJzRkcrg4OKNV+YqFu
	 2uMdlNe3iQ0VjaZJcTxh+vIyCFc9FtIQoJQeIPYsQ1oUpSHav9HCfMMMQBLI76a+M7
	 sut8kVIa4+QLyekrP1S06cNVMJKu58YlBl8ZNSRi5s30vx9DMof01qfsaJFJPniV+U
	 MFGC2fdQ/1xmw==
Date: Fri, 8 Aug 2025 14:09:57 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <20250808130957.GB1705@horms.kernel.org>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
 <20250807183359.GO61519@horms.kernel.org>
 <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_061003_250713_505B3DEE 
X-CRM114-Status: GOOD (  23.68  )
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

On Thu, Aug 07, 2025 at 08:15:13PM +0100, Russell King (Oracle) wrote:
> On Thu, Aug 07, 2025 at 07:33:59PM +0100, Simon Horman wrote:
> > On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> > > The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> > > doesn't take part in the devm release. Therefore, when a device is
> > > unbound, this clock needs to be explicitly put. Fix this.
> > > 
> > > Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > > Spotted this resource leak while making other changes to dwmac-rk.
> > > Would be great if the dwmac-rk maintainers can test it.
> > > 
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index 79b92130a03f..4a315c87c4d0 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
> > >  	stmmac_dvr_remove(&pdev->dev);
> > >  
> > >  	rk_gmac_powerdown(bsp_priv);
> > > +
> > > +	if (plat->phy_node && bsp_priv->integrated_phy)
> > > +		clk_put(bsp_priv->clk_phy);
> > 
> > Hi Russell,
> > 
> > Something seems a little off here.
> > I don't see plat in this context in net.
> 
> Already have a fix for it, thanks anyway. Today ended up going awol
> due to dentistry stuff. :(

Thanks, I see the fix now.
Hope your AFK mission went well.

