Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA2BCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu340ecVSr14mxZ5FrPTofa0hqVLEtjtgkWxVjpuhA0=; b=EjR4UsJ0Blq97ae7A7ka0pWx2e
	yoViCJUhPa42wlWiS1+chgfPcVhvxr3sZn5Dr7SnhDJ6RMr78u0lz1M0cW2RsMmeLd0lGxE6qFh8D
	iCOYp035UB44JyrhuiK3kl5yG52b4TkRxf+i+vZospQRsBDy1vcXm2h71YdOMtock1UmUk32ijCmd
	lLhBfVNw2H3/G2TqByD9RjNNLWX1Dv5y5sGFCjqVRB1AqzduXWwzoGWESLlFAcGldLgBCKyA8NLAT
	ZRZBrsPPt0qV69689+SlKDT4LzRU0bzRhFguqK/bXQvO2Mfmb2p9VecA5W/mZbfMxGRfo/GkVtalS
	OOFYNVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9Ng-0000000BfGT-3Be9;
	Thu, 04 Sep 2025 12:48:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7ut-0000000B8qq-4981;
	Thu, 04 Sep 2025 11:14:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 480E922FC2;
	Thu,  4 Sep 2025 13:14:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JH20WvHbfP0i; Thu,  4 Sep 2025 13:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756984448; bh=a9TgE+M7267BdTJIuw3gh/B6w3LpVMeRFli2D8fltPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFIfUCLuO/STk0WVtv2IgHQalzKuAMQ5N5EkPwTtlvH7OsMa5p0ToDE8BszzyEA1b
	 aLAu2FiJOxp7zHXhrQZDsHLZ/tE8yAm9G3Jh+7+bNh07rr4Q/4lQvgCpPdyx7ekqQf
	 6ry2lOjoW7Gdahi9UxNA4vaEOaXz0iaZMgyN+pJowizj8bDKgNX+2xaUj3uAqbYrYf
	 X2U+Dsm4NyNxWumzOaPSsV6E86eVL9YsZ/97k9zusBhy/DRNHpPEPxZlpIU7+r0+zY
	 8RuD8D+oP7WDF/C73vUnRPZvaa2cYeEVTctnLJi/pahfn7rLLq4EDqRS3dz31HRW0Y
	 SDFRMIyUbxiLA==
Date: Thu, 4 Sep 2025 11:13:53 +0000
From: Yao Zi <ziyao@disroot.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't
 contain invalid address
Message-ID: <aLl0cbYv-fY-tPpI@pie>
References: <20250904031222.40953-3-ziyao@disroot.org>
 <20250904103443.GH372207@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904103443.GH372207@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_041412_589006_2FAFF97C 
X-CRM114-Status: GOOD (  44.21  )
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

On Thu, Sep 04, 2025 at 11:34:43AM +0100, Simon Horman wrote:
> On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> > We must set the clk_phy pointer to NULL to indicating it isn't available
> > if the optional phy clock couldn't be obtained. Otherwise the error code
> > returned by of_clk_get() could be wrongly taken as an address, causing
> > invalid pointer dereference when later clk_phy is passed to
> > clk_prepare_enable().
> > 
> > Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > On next-20250903, the fixed commit causes NULL pointer dereference on
> > Radxa E20C during probe of dwmac-rk, a typical dmesg looks like
> > 
> > [    0.273324] rk_gmac-dwmac ffbe0000.ethernet: IRQ eth_lpi not found
> > [    0.273888] rk_gmac-dwmac ffbe0000.ethernet: IRQ sfty not found
> > [    0.274520] rk_gmac-dwmac ffbe0000.ethernet: PTP uses main clock
> > [    0.275226] rk_gmac-dwmac ffbe0000.ethernet: clock input or output? (output).
> > [    0.275867] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: tx_delay.
> > [    0.276491] rk_gmac-dwmac ffbe0000.ethernet: set tx_delay to 0x30
> > [    0.277026] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: rx_delay.
> > [    0.278086] rk_gmac-dwmac ffbe0000.ethernet: set rx_delay to 0x10
> > [    0.278658] rk_gmac-dwmac ffbe0000.ethernet: integrated PHY? (no).
> > [    0.279249] Unable to handle kernel paging request at virtual address fffffffffffffffe
> > [    0.279948] Mem abort info:
> > [    0.280195]   ESR = 0x000000096000006
> > [    0.280523]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    0.280989]   SET = 0, FnV = 0
> > [    0.281287]   EA = 0, S1PTW = 0
> > [    0.281574]   FSC = 0x06: level 2 translation fault
> > 
> > where the invalid address is just -ENOENT (-2).
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index cf619a428664..26ec8ae662a6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -1414,11 +1414,17 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
> >  	if (plat->phy_node) {
> >  		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> >  		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> > -		/* If it is not integrated_phy, clk_phy is optional */
> > +		/*
> > +		 * If it is not integrated_phy, clk_phy is optional. But we must
> > +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
> > +		 * the error code could be wrongly taken as an invalid pointer.
> > +		 */
> >  		if (bsp_priv->integrated_phy) {
> >  			if (ret)
> >  				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> >  			clk_set_rate(bsp_priv->clk_phy, 50000000);
> > +		} else if (ret) {
> > +			bsp_priv->clk_phy = NULL;
> >  		}
> >  	}
> 
> Thanks, and sorry for my early confusion about applying this patch.
> 
> I agree that the bug you point out is addressed by this patch.
> Although I wonder if it is cleaner not to set bsp_priv->clk_phy
> unless there is no error, rather than setting it then resetting
> it if there is an error.

Yes, it sounds more natural to have a temporary variable storing result
of of_clk_get() and only assign it to clk_phy when the result is valid.

> More importantly, I wonder if there is another bug: does clk_set_rate need
> to be called in the case where there is no error and bsp_priv->integrated_phy
> is false?

In my understanding this may be intended, bsp_priv->integrated_phy is
only false when an external phy is used, and an external phy might
require arbitrary clock rates, thus it doesn't seem a good idea to me to
hardcode the clock rate in the driver.

I guess rate of clk_phy could also be set up with assigned-clock-rates
in devicetree. If so it may be reasonable to enable the clock only.

> So I am wondering if it makes sense to go with something like this.
> (Compile tested only!)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 266c53379236..a25816af2c37 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1411,12 +1411,16 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  	}
>  
>  	if (plat->phy_node) {
> -		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> -		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> -		/* If it is not integrated_phy, clk_phy is optional */
> -		if (bsp_priv->integrated_phy) {
> -			if (ret)
> +		struct clk *clk_phy;
> +
> +		clk_phy = of_clk_get(plat->phy_node, 0);
> +		ret = PTR_ERR_OR_ZERO(clk_phy);
> +		if (ret) {
> +			/* If it is not integrated_phy, clk_phy is optional */
> +			if (bsp_priv->integrated_phy)
>  				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> +		} else {
> +			bsp_priv->clk_phy = clk_phy;
>  			clk_set_rate(bsp_priv->clk_phy, 50000000);
>  		}
>  	}
> 
> Please note: if you send an updated patch (against net) please
> make sure you wait 24h before the original post.
> 
> See: https://docs.kernel.org/process/maintainer-netdev.html

Thanks for the tip. While digging through the problematic commit for the
clk_phy's rate problem, I found others have discovered the problem[1]
and proposed some fixes (though there hasn't been a formal patch).

I should have read the original thread before sending this patch! Will
wait for some time and see whether the netdev maintainer prefers waiting
for original author's fix or taking mine.

Best regards,
Yao Zi

[1]: https://lore.kernel.org/netdev/a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com/

