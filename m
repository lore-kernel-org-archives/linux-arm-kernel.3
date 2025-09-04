Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8C7CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5Z5DhjZnY6eczblhFGxkD0fC3LyTY4DH8uW4Fphb5E=; b=fmQHXCdJk7Nsww+BA6JXagv7Ih
	QxHqg2wFX+X+N/Qiakg6WpQb/WrIs/xkskM/UQRtsFNeJJ5wrj/JQ1HKfOUEzwirQd1qRCVZqVglB
	dCpD23VYSWFKQQt12PLfruRwtWjiHVHGaq06kmzwIbEmz0yzZ5sFhrluUs5UQ7kWKsxavS6Nz/9vJ
	FR/VRWKEnG3rE0Q+zKYUj333Wf82SHYhoz6262Xm+BhdGrFB4xeDOR7pI/L0DqG9PF4AdlLX/qbmb
	2rPIeMEO+Dhs8JCUMwaBWMKYmtoxIDVoNJEq2VqWgXPfcQBDRDp4u0ML4YN0f7NPH8QOOnoEmsln3
	KZ3t0Grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8LJ-0000000BIit-0ULC;
	Thu, 04 Sep 2025 11:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7In-0000000Avdf-1235;
	Thu, 04 Sep 2025 10:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB0EC40465;
	Thu,  4 Sep 2025 10:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2465BC4CEF8;
	Thu,  4 Sep 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756982087;
	bh=E5fsuSav1cTXloSIvOFthsHyAkRUga0iYM80pkvxqXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEOa0jH0jMSyfwjgJz4Mxd6GGKXLT9k5fPU+kzlyT4/pGd4tZamEByKAkG9rmOpfR
	 SAgS9Cl8LV5HYoO27JRNrqSwpxqd46N+CB4KqCFfx4YjRy2nCM9hJqgRSU2BYtlvyP
	 P87Dl2kjJt380IBgN4Wo28I2z4XMCB/xEr4Rcbp0P5bPEVnYWvAip1DHmX2Zv3gLst
	 /gigMdvV6Sbb65sJPbS4YzrBLWHlJAHLoLoYA0bigx9shO25wEVMIKFPFsbl2xbwwq
	 SobDyMhHt/SK+Y8qbl5NIfan43uN0HMO/8BTJsGHmGiU+piJUW3dIMBhRPdmBmyRV4
	 APmt7uu2wfoFA==
Date: Thu, 4 Sep 2025 11:34:43 +0100
From: Simon Horman <horms@kernel.org>
To: Yao Zi <ziyao@disroot.org>
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
Message-ID: <20250904103443.GH372207@horms.kernel.org>
References: <20250904031222.40953-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904031222.40953-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_033449_329205_28795E68 
X-CRM114-Status: GOOD (  33.63  )
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

On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> We must set the clk_phy pointer to NULL to indicating it isn't available
> if the optional phy clock couldn't be obtained. Otherwise the error code
> returned by of_clk_get() could be wrongly taken as an address, causing
> invalid pointer dereference when later clk_phy is passed to
> clk_prepare_enable().
> 
> Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> On next-20250903, the fixed commit causes NULL pointer dereference on
> Radxa E20C during probe of dwmac-rk, a typical dmesg looks like
> 
> [    0.273324] rk_gmac-dwmac ffbe0000.ethernet: IRQ eth_lpi not found
> [    0.273888] rk_gmac-dwmac ffbe0000.ethernet: IRQ sfty not found
> [    0.274520] rk_gmac-dwmac ffbe0000.ethernet: PTP uses main clock
> [    0.275226] rk_gmac-dwmac ffbe0000.ethernet: clock input or output? (output).
> [    0.275867] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: tx_delay.
> [    0.276491] rk_gmac-dwmac ffbe0000.ethernet: set tx_delay to 0x30
> [    0.277026] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: rx_delay.
> [    0.278086] rk_gmac-dwmac ffbe0000.ethernet: set rx_delay to 0x10
> [    0.278658] rk_gmac-dwmac ffbe0000.ethernet: integrated PHY? (no).
> [    0.279249] Unable to handle kernel paging request at virtual address fffffffffffffffe
> [    0.279948] Mem abort info:
> [    0.280195]   ESR = 0x000000096000006
> [    0.280523]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.280989]   SET = 0, FnV = 0
> [    0.281287]   EA = 0, S1PTW = 0
> [    0.281574]   FSC = 0x06: level 2 translation fault
> 
> where the invalid address is just -ENOENT (-2).
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index cf619a428664..26ec8ae662a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1414,11 +1414,17 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>  	if (plat->phy_node) {
>  		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>  		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> -		/* If it is not integrated_phy, clk_phy is optional */
> +		/*
> +		 * If it is not integrated_phy, clk_phy is optional. But we must
> +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
> +		 * the error code could be wrongly taken as an invalid pointer.
> +		 */
>  		if (bsp_priv->integrated_phy) {
>  			if (ret)
>  				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>  			clk_set_rate(bsp_priv->clk_phy, 50000000);
> +		} else if (ret) {
> +			bsp_priv->clk_phy = NULL;
>  		}
>  	}

Thanks, and sorry for my early confusion about applying this patch.

I agree that the bug you point out is addressed by this patch.
Although I wonder if it is cleaner not to set bsp_priv->clk_phy
unless there is no error, rather than setting it then resetting
it if there is an error.

More importantly, I wonder if there is another bug: does clk_set_rate need
to be called in the case where there is no error and bsp_priv->integrated_phy
is false?

So I am wondering if it makes sense to go with something like this.
(Compile tested only!)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 266c53379236..a25816af2c37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1411,12 +1411,16 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	}
 
 	if (plat->phy_node) {
-		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
-		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		/* If it is not integrated_phy, clk_phy is optional */
-		if (bsp_priv->integrated_phy) {
-			if (ret)
+		struct clk *clk_phy;
+
+		clk_phy = of_clk_get(plat->phy_node, 0);
+		ret = PTR_ERR_OR_ZERO(clk_phy);
+		if (ret) {
+			/* If it is not integrated_phy, clk_phy is optional */
+			if (bsp_priv->integrated_phy)
 				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
+		} else {
+			bsp_priv->clk_phy = clk_phy;
 			clk_set_rate(bsp_priv->clk_phy, 50000000);
 		}
 	}

Please note: if you send an updated patch (against net) please
make sure you wait 24h before the original post.

See: https://docs.kernel.org/process/maintainer-netdev.html

