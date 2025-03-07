Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7E4PcWNtVztNl9koit0EYLU2YsvVBN7/lhEg0a+ImA=; b=JeQh5G1Rrgk4FR4MIS2VAzpRz+
	+emiR9cnwH+U/ubyTMSmqs6MeAQTBnJ/c/SHg6n00iKOqu7UtL20mI8lZUzE0guLpIyYgNjLOx51o
	9MXvsYc/vxXYyiMLvfUw24hbaTz6a8q7BJPuCGKE43RqN5IZ1fW86bu/OZ7NDMcVGz8N8BcQVvDDN
	Kd4FNI4wiTZ3MLQ/Ei4wTkwrwfceIgMwv2AmIzo1oUHBBr/3wCnNYImBCQ/ueaMov7EwN8pMdnK/p
	lIUN+6Pk0GvE1tM923LNlLG1kRaTgetx1OCVrGnbFYuhRUhzPGIbf35y6InKPHuvgA4Xmo4phIemP
	MzUQNTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbEO-0000000F0y8-2LUA;
	Fri, 07 Mar 2025 17:11:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbBG-0000000F0Vs-1LkQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q7E4PcWNtVztNl9koit0EYLU2YsvVBN7/lhEg0a+ImA=; b=Me7TskvPCscwzFG0LaYdzuIL36
	dcSuTeYJg/isxgg5fGvzNVO85C61gE5lVDRIVmkS0jjZIlliANkBNqXb3Zs9Ow5R/OLXTG3aVyILT
	5z19j+soJyoLLUviNr838iJ+WfDstArcYlJ7R1VtkfRY1/LFb3qwouMvevV1RNgclqk3HB4VzqVMo
	aH84fQtFY7JicZBuPI3nbYZrGvmQDgCZCMB7HwMChJB5HmtG3UQTKOhGSkw+7SuRSG7wot+Z2fSlX
	xSq5W6VgjeDO/y0qx5Ipm0EtanZzpLM9Y9NP9V0vQHLwVlmyZ5KAq8QwYePEJUMM2Wcnj1YCuVXQU
	qGRANl/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53554)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqbB5-0007lH-2P;
	Fri, 07 Mar 2025 17:08:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqbAz-0007zi-1o;
	Fri, 07 Mar 2025 17:07:57 +0000
Date: Fri, 7 Mar 2025 17:07:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/3] net: stmmac: approach 2 to solve EEE
 LPI reset issues
Message-ID: <Z8sn7b_ra_QnWUjw@shell.armlinux.org.uk>
References: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
 <29bc7abd-b5cc-4359-8aa6-dbf66e8b70e4@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eyhX0LjiM8fsaWBt"
Content-Disposition: inline
In-Reply-To: <29bc7abd-b5cc-4359-8aa6-dbf66e8b70e4@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_090814_371031_77BE3D51 
X-CRM114-Status: GOOD (  27.51  )
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


--eyhX0LjiM8fsaWBt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 07, 2025 at 04:11:19PM +0000, Jon Hunter wrote:
> Hi Russell,
> 
> On 06/03/2025 15:23, Russell King (Oracle) wrote:
> > Hi,
> > 
> > This is a second approach to solving the STMMAC reset issues caused by
> > the lack of receive clock from the PHY where the media is in low power
> > mode with a PHY that supports receive clock-stop.
> > 
> > The first approach centred around only addressing the issue in the
> > resume path, but it seems to also happen when the platform glue module
> > is removed and re-inserted (Jon - can you check whether that's also
> > the case for you please?)
> > 
> > As this is more targetted, I've dropped the patches from this series
> > which move the call to phylink_resume(), so the link may still come
> > up too early on resume - but that's something I also intend to fix.
> > 
> > This is experimental - so I value test reports for this change.
> 
> 
> The subject indicates 3 patches, but I only see 2 patches? Can you confirm
> if there are 2 or 3?

Yes, 2 patches is correct.

> So far I have only tested to resume case with the 2 patches to make that
> that is working but on Tegra186, which has been the most problematic, it is
> not working reliably on top of next-20250305.

To confirm, you're seeing stmmac_reset() sporadically timing out on
resume even with these patches appled? That's rather disappointing.

Do either of the two attached diffs make any difference?

Thanks for testing!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--eyhX0LjiM8fsaWBt
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="stmmac-block-rx-clk-stop.diff"

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8d3cae5b43c5..63d30e09c095 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3108,9 +3108,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		priv->plat->dma_cfg->atds = 1;
 
 	/* Note that the PHY clock must be running for reset to complete. */
-	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_reset(priv, priv->ioaddr);
-	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
@@ -3480,7 +3478,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		phylink_pcs_pre_init(priv->phylink, priv->hw->phylink_pcs);
 
 	/* DMA initialization and SW reset */
+	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_init_dma_engine(priv);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: DMA engine initialization failed\n",
 			   __func__);

--eyhX0LjiM8fsaWBt
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="stmmac-block-rx-clk-stop-2.diff"

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8d3cae5b43c5..bebc9f98c875 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3108,9 +3108,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		priv->plat->dma_cfg->atds = 1;
 
 	/* Note that the PHY clock must be running for reset to complete. */
-	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_reset(priv, priv->ioaddr);
-	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
 		return ret;
@@ -4045,7 +4043,9 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	ret = stmmac_hw_setup(dev, true);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto init_error;
@@ -7949,7 +7949,9 @@ int stmmac_resume(struct device *dev)
 	stmmac_free_tx_skbufs(priv);
 	stmmac_clear_descriptors(priv, &priv->dma_conf);
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_hw_setup(ndev, false);
+	phylink_rx_clk_stop_unblock(priv->phylink);
 	stmmac_init_coalesce(priv);
 	stmmac_set_rx_mode(ndev);
 

--eyhX0LjiM8fsaWBt--

