Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C36D65C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIPrSHgQCALCepHl6R+DTYzMov4UgSjk+ZA9/KyL5Qc=; b=SNPfwlHnY/b8LGPEPhXSQrwpXt
	0aNIMZfkwq5e3pdqvY61VlkBJUEiDKi9WBBQGwhq4LEvdnk0awKbam6PsUtsLRvZ5zKhTFMN/HW2a
	ff5yOnkw+z+dQcvhBiyojZXYDdZaERqgQbza+I3v/igcZaXIYAo1sUyMaS5ORzDbsSkBycOyusr/6
	ZKGjHza/9j7uz4oc1/A3g0l8iEJuKQMXKb89gFq5BA65M3CP4nVWRHDcLJr3EVXMo7avT/RYKhpYd
	gVv9Mv/OFtMLu921oa++FIMjG8HihPyILM2NEtOgNR3NZ7QuN0Scd/BhYH+7WHR+Ntc8wucEJOCnY
	Rm9wWbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXqR-00000009gyG-3Azp;
	Thu, 14 Nov 2024 11:17:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWk1-00000009Soi-0KLV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gIPrSHgQCALCepHl6R+DTYzMov4UgSjk+ZA9/KyL5Qc=; b=CA0uCSYsodv0SQpUQLPg+KwV1j
	EOlFv+wYDpcRDgp2xP9fYXhBS0UkslmAeNFxvc/UPX/QDM9nTvMHb+Rb6cUcq/zTfCKsxIGlFmrwM
	TyoKtRmwlH4+WcAcpfp+TwMMEyi0UTdTrCScZJ7tnbJ1Df18lW2N/W4W/S3JgmLXtJlNWq7uXid7o
	aOQsjDZCkpZNfzjalZOEcIqNmHnBv3jRuVfiCkBdf6nz8dnJb1nv/+OzBsWBGtX8Sl0mRWh2ozlpd
	GBjeExq32+6wAshDmMRV/EWWV1+oJyy3Pn30P4STwNRs68DsewdJaRfxtzYgjEOaiziLFeokGZHMe
	8LukeCIg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58434)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBWje-0007mr-2u;
	Thu, 14 Nov 2024 10:05:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBWjY-000113-2H;
	Thu, 14 Nov 2024 10:05:52 +0000
Date: Thu, 14 Nov 2024 10:05:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 1/2] net: phy: set eee_cfg based on PHY
 configuration
Message-ID: <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
 <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020621_194594_5D8BEF05 
X-CRM114-Status: GOOD (  31.85  )
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

On Thu, Nov 14, 2024 at 09:23:48AM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
> > Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> > designed to have EEE hardware disabled during the initial state, and it
> > needs to be configured to turn it on again.
> > 
> > This patch reads the PHY configuration and sets it as the initial value for
> > eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
> > true by default.
> 
> eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
> that LPI needs to be enabled at the MAC if EEE was negotiated:
> 
>  * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
>  *      that eee was negotiated.
> 
> eee_cfg.eee_enabled means that EEE mode was enabled - which is user
> configuration:
> 
>  * @eee_enabled: EEE configured mode (enabled/disabled).
> 
> phy_probe() reads the initial PHY state and sets things up
> appropriately.
> 
> However, there is a point where the EEE configuration (advertisement,
> and therefore eee_enabled state) is written to the PHY, and that should
> be config_aneg(). Looking at the Marvell driver, it's calling
> genphy_config_aneg() which eventually calls
> genphy_c45_an_config_eee_aneg() which does this (via
> __genphy_config_aneg()).
> 
> Please investigate why the hardware state is going out of sync with the
> software state.

I think I've found the issue.

We have phydev->eee_enabled and phydev->eee_cfg.eee_enabled, which looks
like a bug to me. We write to phydev->eee_cfg.eee_enabled in
phy_support_eee(), leaving phydev->eee_enabled untouched.

However, most other places are using phydev->eee_enabled.

This is (a) confusing and (b) wrong, and having the two members leads
to this confusion, and makes the code more difficult to follow (unless
one has already clocked that there are these two different things both
called eee_enabled).

This is my untested prototype patch to fix this - it may cause breakage
elsewhere:

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index c1b3576c307f..2d64d3f293e5 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -943,7 +943,7 @@ EXPORT_SYMBOL_GPL(genphy_c45_read_eee_abilities);
  */
 int genphy_c45_an_config_eee_aneg(struct phy_device *phydev)
 {
-	if (!phydev->eee_enabled) {
+	if (!phydev->eee_cfg.eee_enabled) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(adv) = {};
 
 		return genphy_c45_write_eee_adv(phydev, adv);
@@ -1576,8 +1576,6 @@ int genphy_c45_ethtool_set_eee(struct phy_device *phydev,
 		}
 	}
 
-	phydev->eee_enabled = data->eee_enabled;
-
 	ret = genphy_c45_an_config_eee_aneg(phydev);
 	if (ret > 0) {
 		ret = phy_restart_aneg(phydev);
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index bc24c9f2786b..b26bb33cd1d4 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3589,12 +3589,12 @@ static int phy_probe(struct device *dev)
 	/* There is no "enabled" flag. If PHY is advertising, assume it is
 	 * kind of enabled.
 	 */
-	phydev->eee_enabled = !linkmode_empty(phydev->advertising_eee);
+	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
 
 	/* Some PHYs may advertise, by default, not support EEE modes. So,
 	 * we need to clean them.
 	 */
-	if (phydev->eee_enabled)
+	if (phydev->eee_cfg.eee_enabled)
 		linkmode_and(phydev->advertising_eee, phydev->supported_eee,
 			     phydev->advertising_eee);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 1e4127c495c0..33905e9672a7 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -601,7 +601,6 @@ struct macsec_ops;
  * @adv_old: Saved advertised while power saving for WoL
  * @supported_eee: supported PHY EEE linkmodes
  * @advertising_eee: Currently advertised EEE linkmodes
- * @eee_enabled: Flag indicating whether the EEE feature is enabled
  * @enable_tx_lpi: When True, MAC should transmit LPI to PHY
  * @eee_cfg: User configuration of EEE
  * @lp_advertising: Current link partner advertised linkmodes
@@ -721,7 +720,6 @@ struct phy_device {
 	/* used for eee validation and configuration*/
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_eee);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising_eee);
-	bool eee_enabled;
 
 	/* Host supported PHY interface types. Should be ignored if empty. */
 	DECLARE_PHY_INTERFACE_MASK(host_interfaces);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

