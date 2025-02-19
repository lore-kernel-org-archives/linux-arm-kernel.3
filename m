Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA75C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ox9CV6LHUd6gMf+zEh49UTkS5cD9NmltHJfCvXce8LM=; b=kNMaYem7N11Vf578ypzbrn+yWr
	rFf+dIXvOQB2MV5Fdw711Af9YoOW5MfAWt8fA4WdCMTD/zwx9IMGSzmabzuGAe3biazcWpHdbCuVE
	qJtSFfyYv+muHbRyfqzZ3ed6wr98MQ40B4Mj9LfCSm7bDjSs5lnPkbsHRkdwZ8m8Kae29XxPg01oM
	3JxxKiGx4WoFf7Awc6IBBOchafff6+UpsH5VAwdKr5HVu59tNt6YFzL5jgl09ueqlqZcOf8xgdJu3
	5zS4NTE21J1wxDMFmA4XimpUxG1NvMDdsTGWFntguM7/n5o/m+cYdq76ANkfBUkqJOuLv8g7edI/m
	9d0ajoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrAX-0000000F2q2-1cXz;
	Wed, 19 Feb 2025 20:59:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkr91-0000000F2Ki-182w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ox9CV6LHUd6gMf+zEh49UTkS5cD9NmltHJfCvXce8LM=; b=n8ViKVvKPHMGMgCG7hd0ZjkDop
	vRrK8EqFjl6XVOMIziTBve1ppUE4XDjhAly0AlAMU5JohcyadSfLdQxpgdbV0U46N1g24urRc4bky
	rpEoBoRkJoJPOHiLqV+MOp2P+ePgMT9+fnme5HPdLS/FfPwne73dWH35eBco1FqmPUYF/2I9Y5n+X
	wTC5lp5qa5FPX1CDRlyw+mG/BMPQAkJr+BzLgTCE+fcqgLcjKtgLzr4UU1isKe49TWsmf6LgfbzFi
	LCWbW/i9ll2qUk+h4x3J4GbhUPLKPr52n+ZfZA9CG99Sd7CZ1/Aj2y9qvPCOlWSSqRxrgiyNuM/2e
	TFBYXFRw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34186)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkr8n-00071t-1d;
	Wed, 19 Feb 2025 20:57:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkr8j-0000DX-2Z;
	Wed, 19 Feb 2025 20:57:53 +0000
Date: Wed, 19 Feb 2025 20:57:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next 9/9] net: stmmac: convert to phylink managed EEE
 support
Message-ID: <Z7ZF0dA4-jwU7O2E@shell.armlinux.org.uk>
References: <6ab08068-7d70-4616-8e88-b6915cbf7b1d@nvidia.com>
 <Z63Zbaf_4Rt57sox@shell.armlinux.org.uk>
 <Z63e-aFlvKMfqNBj@shell.armlinux.org.uk>
 <05987b45-94b9-4744-a90d-9812cf3566d9@nvidia.com>
 <Z68nSJqVxcnCc1YB@shell.armlinux.org.uk>
 <86fae995-1700-420b-8d84-33ab1e1f6353@nvidia.com>
 <Z7X6Z8yLMsQ1wa2D@shell.armlinux.org.uk>
 <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
 <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
 <fd4af708-0c92-4295-9801-bf53db3a16cc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd4af708-0c92-4295-9801-bf53db3a16cc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_125811_308923_BEE7013D 
X-CRM114-Status: GOOD (  23.80  )
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

On Wed, Feb 19, 2025 at 08:05:57PM +0000, Jon Hunter wrote:
> On 19/02/2025 19:13, Russell King (Oracle) wrote:
> > On Wed, Feb 19, 2025 at 05:52:34PM +0000, Jon Hunter wrote:
> > > On 19/02/2025 15:36, Russell King (Oracle) wrote:
> > > > So clearly the phylink resolver is racing with the rest of the stmmac
> > > > resume path - which doesn't surprise me in the least. I believe I raised
> > > > the fact that calling phylink_resume() before the hardware was ready to
> > > > handle link-up is a bad idea precisely because of races like this.
> > > > 
> > > > The reason stmmac does this is because of it's quirk that it needs the
> > > > receive clock from the PHY in order for stmmac_reset() to work.
> > > 
> > > I do see the reset fail infrequently on previous kernels with this device
> > > and when it does I see these messages ...
> > > 
> > >   dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
> > >   dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine
> > >    initialization failed
> > 
> > I wonder whether it's also racing with phylib, but phylink_resume()
> > calling phylink_start() going in to call phy_start() is all synchronous.
> > That causes __phy_resume() to be called.
> > 
> > Which PHY device/driver is being used?
> 
> 
> Looks like it is this Broadcom driver ...
> 
>  Broadcom BCM89610 stmmac-0:00: phy_eee_rx_clock_stop: clk_stop_enable 1

I don't see anything special happening in the PHY driver - it doesn't
implement suspend/resume/config_aneg methods, so there's nothing going
on with clocks in that driver beyond generic stuff.

So, let's try something (I haven't tested this, and its likely you
will need to work it in to your other change.)

Essentially, this disables the receive clock stop around the reset,
something the stmmac driver has never done in the past.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1cbea627b216..8e975863a2e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7926,6 +7926,8 @@ int stmmac_resume(struct device *dev)
 	rtnl_lock();
 	mutex_lock(&priv->lock);
 
+	phy_eee_rx_clock_stop(priv->dev->phydev, false);
+
 	stmmac_reset_queues_param(priv);
 
 	stmmac_free_tx_skbufs(priv);
@@ -7937,6 +7939,9 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 
+	phy_eee_rx_clock_stop(priv->dev->phydev,
+			      priv->phylink_config.eee_rx_clk_stop_enable);
+
 	stmmac_enable_all_queues(priv);
 	stmmac_enable_all_dma_irq(priv);
 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

