Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOjdSRCv2RUIRDJncJACIOD/OM93IjDj5DWl9rxY730=; b=UreeO2wqIdfjf1aBSDGH2m1G3B
	jdVrogYvZub8e3ieMqs71AdHuZ1tsEkNh5tuEIX7O5Z/X7tXTC6fGhuUnYKsXwB0PaMl24KlPPWTM
	wE95E+FLZwduHyxDUklSgOE9xgDqYd0fy2KQdd4dklvbH1pH6SNtuQeghYfQgfwVdPvy7ZpxstvMs
	BOUosrS5QyzbdT7diAQNzwznHS3ST7XT85VMHvObXDtoFoFrA/+kNiKjYUWQJtORReJv76u8FRNVP
	77NAjlzez3lNOfTwxJx64eM50VnTx9wJdaguT/KIuGQryYmMyAlOXEfdZ4vho3DVXkUajGDpabyEh
	WWFrezRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggUs-0000000GNLe-2RuF;
	Tue, 29 Jul 2025 09:19:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggFD-0000000GKXL-1UfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uOjdSRCv2RUIRDJncJACIOD/OM93IjDj5DWl9rxY730=; b=hwM2YgQhgVdUWKcbmXjMlRUBDH
	2Z3yZMsyFQ791GqdPatfwcw/EuEU+10RNa95A5KAqy085Pkr+PuSqfuBZVEliFW+MJOz5KzUH47zz
	av9E/HI2K3eQF/d6gpCE4abqTpMFWM7MJhOmzDyX0BBLKI4O/OGOnB4eu09IQCLkguKk7TvDAylnZ
	Nxo2kwOKW4nQXJbqAD9DDPWUKnglEZ352JJqh2FyjKFUyu90Iy4YaUBg4/11DLigFbcmdAB1KzueN
	XgnaAFs2HsJdjNooAqqTsXHBJa7PyKlnMmJfWOI8DWc2P96Vrdiu2wLqEx2saweAZxSNa0RJrNfyy
	VnZVgItw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58224)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uggF2-0001cn-2y;
	Tue, 29 Jul 2025 10:03:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uggF0-0007GS-0n;
	Tue, 29 Jul 2025 10:03:22 +0100
Date: Tue, 29 Jul 2025 10:03:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
Message-ID: <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_020335_555036_36A89B6A 
X-CRM114-Status: GOOD (  46.72  )
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

> On 7/28/25 19:54, Russell King (Oracle) wrote:
> > On Mon, Jul 28, 2025 at 07:28:01PM +0200, Andrew Lunn wrote:
> > > > +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
> > > > +{
> > > > +	return priv->plat->pmt && device_may_wakeup(priv->device);
> > > > +}
> > > > +
> > > > +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
> > > > +{
> > > > +	return !priv->plat->pmt && device_may_wakeup(priv->device);
> > > > +}
> > > 
> > > I agree this is a direct translation into a helper.
> > > 
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > 
> > > I'm guessing at some point you want to change these two
> > > helpers. e.g. at some point, you want to try getting the PHY to do the
> > > WoL, independent of !priv->plat->pmt?
> > > 
> > > > -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> > > > +	if (stmmac_wol_enabled_phy(priv))
> > > >   		phylink_speed_down(priv->phylink, false);
> > > 
> > > This might be related to the next patch. But why only do speed down
> > > when PHY is doing WoL? If the MAC is doing WoL, you could also do a
> > > speed_down.
> > 
> > No idea, but that's what the code currently does, and, as ever with
> > a cleanup series, I try to avoid functional changes in cleanup series.
> > 
> > Also, bear in mind that I can't test any of this.
> > 
> > We haven't yet been successful in getting WoL working in mainline. It
> > _seems_ that the Jetson Xaiver NX platform should be using PHY mode,
> > but the Realtek PHY driver is definitely broken for WoL. Even with
> > that hacked, and along with other fixes that I've been given, I still
> > can't get the SoC to wake up via WoL. In fact, the changes to change
> > DT to specify the PHY interrupt as being routed through the PM
> > controller results in normal PHY link up/down interrupts no longer
> > working.
> > 
> > I'd like someone else to test functional changes!
> > 
> 
> Hello Russel,

That's "Russell" please.

> First of all, thank you for taking the time to improve this code.
> What exactly do you mean by hacking? Forcing !priv->plat->pmt?

No. There's a cleaner way to clear ->pmt which isn't hacky. Thierry's
patch to .dts also isn't hacky.

With Thierry's .dts patch, PHY interrupts completely stop working, so
we don't get link change notifications anymore - and we still don't
seem to be capable of waking the system up with the PHY interrupt
being asserted.

Without Thierry's .dts patch, as I predicted, enabling WoL at the
PHY results in Bad Stuff happening - the code in the realtek driver
for WoL is quite simply broken and wrong.

Switching the pin from INTB mode to PMEB mode results in:
- No link change interrupts once WoL is enabled
- The interrupt output being stuck at active level, causing an
  interrupt storm and the interrupt is eventually disabled.
  The PHY can be configured to pulse the PMEB or hold at an active
  level until the WoL is cleared - and by default it's the latter.

So, switching the interrupt pin to PMEB mode is simply wrong and
breaks phylib. I guess the original WoL support was only tested on
a system which didn't use the PHY interrupt, only using the interrupt
pin for wake-up purposes.

I was working on the realtek driver to fix this, but it's pointless
spending time on this until the rest of the system can wake up -
and thus the changes can be tested. This is where I got to (and
includes work from both Thierry and myself, so please don't pick
this up as-is, because I can guarantee that you'll get the sign-offs
wrong! It's a work-in-progress, and should be a series for submission.)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index a410fc335fa3..f7c9c14b095e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -39,8 +39,8 @@ mdio {
 				phy: ethernet-phy@0 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <0x0>;
-					interrupt-parent = <&gpio>;
-					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
+					interrupt-parent = <&pmc>;
+					interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 					#phy-cells = <0>;
 				};
 			};
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 09ae16e026eb..bcaa37e08345 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -261,7 +261,8 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->bsp_priv = eqos;
 	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE |
-			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_USE_PHY_WOL;
 
 	return 0;
 
diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index dd0d675149ad..fdd926d3ab83 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -31,6 +31,7 @@
 #define RTL821x_INER				0x12
 #define RTL8211B_INER_INIT			0x6400
 #define RTL8211E_INER_LINK_STATUS		BIT(10)
+#define RTL8211F_INER_WOL			BIT(7)
 #define RTL8211F_INER_LINK_STATUS		BIT(4)
 
 #define RTL821x_INSR				0x13
@@ -426,12 +427,15 @@ static irqreturn_t rtl8211f_handle_interrupt(struct phy_device *phydev)
 		return IRQ_NONE;
 	}
 
-	if (!(irq_status & RTL8211F_INER_LINK_STATUS))
-		return IRQ_NONE;
+	if (irq_status & RTL8211F_INER_LINK_STATUS) {
+		phy_trigger_machine(phydev);
+		return IRQ_HANDLED;
+	}
 
-	phy_trigger_machine(phydev);
+	if (irq_status & RTL8211F_INER_WOL)
+		return IRQ_HANDLED;
 
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 
 static void rtl8211f_get_wol(struct phy_device *dev, struct ethtool_wolinfo *wol)
@@ -451,6 +455,7 @@ static void rtl8211f_get_wol(struct phy_device *dev, struct ethtool_wolinfo *wol
 static int rtl8211f_set_wol(struct phy_device *dev, struct ethtool_wolinfo *wol)
 {
 	const u8 *mac_addr = dev->attached_dev->dev_addr;
+	struct rtl821x_priv *priv = phydev->priv;
 	int oldpage;
 
 	oldpage = phy_save_page(dev);
@@ -470,23 +475,44 @@ static int rtl8211f_set_wol(struct phy_device *dev, struct ethtool_wolinfo *wol)
 		__phy_write(dev, RTL8211F_WOL_SETTINGS_STATUS, RTL8211F_WOL_STATUS_RESET);
 
 		/* Enable the WOL interrupt */
-		rtl821x_write_page(dev, RTL8211F_INTBCR_PAGE);
-		__phy_set_bits(dev, RTL8211F_INTBCR, RTL8211F_INTBCR_INTB_PMEB);
+		//rtl821x_write_page(dev, RTL8211F_INTBCR_PAGE);
+		//__phy_set_bits(dev, RTL8211F_INTBCR, RTL8211F_INTBCR_INTB_PMEB);
+		rtl821x_write_page(dev, 0xa42);
+		__phy_set_bits(dev, RTL821x_INER, RTL8211F_INER_WOL);
 	} else {
 		/* Disable the WOL interrupt */
-		rtl821x_write_page(dev, RTL8211F_INTBCR_PAGE);
-		__phy_clear_bits(dev, RTL8211F_INTBCR, RTL8211F_INTBCR_INTB_PMEB);
+		//rtl821x_write_page(dev, RTL8211F_INTBCR_PAGE);
+		//__phy_clear_bits(dev, RTL8211F_INTBCR, RTL8211F_INTBCR_INTB_PMEB);
+		rtl821x_write_page(dev, 0xa42);
+		__phy_clear_bits(dev, RTL821x_INER, RTL8211F_INER_WOL);
 
 		/* Disable magic packet matching and reset WOL status */
 		rtl821x_write_page(dev, RTL8211F_WOL_SETTINGS_PAGE);
 		__phy_write(dev, RTL8211F_WOL_SETTINGS_EVENTS, 0);
 		__phy_write(dev, RTL8211F_WOL_SETTINGS_STATUS, RTL8211F_WOL_STATUS_RESET);
 	}
+	priv->saved_wolopts = wolopts;
 
 err:
 	return phy_restore_page(dev, oldpage, 0);
 }
 
+static int rtl8211f_suspend(struct phy_device *phydev)
+{
+	struct rtl821x_priv *priv = phydev->priv;
+	int ret = rtl821x_suspend(phydev);
+
+	return ret;
+}
+
+static int rtl8211f_resume(struct phy_device *phydev)
+{
+	struct rtl821x_priv *priv = phydev->priv;
+	int ret = rtl821x_resume(phydev);
+
+	return ret;
+}
+
 static int rtl8211_config_aneg(struct phy_device *phydev)
 {
 	int ret;
@@ -1619,8 +1645,8 @@ static struct phy_driver realtek_drvs[] = {
 		.handle_interrupt = rtl8211f_handle_interrupt,
 		.set_wol	= rtl8211f_set_wol,
 		.get_wol	= rtl8211f_get_wol,
-		.suspend	= rtl821x_suspend,
-		.resume		= rtl821x_resume,
+		.suspend	= rtl8211f_suspend,
+		.resume		= rtl8211f_resume,
 		.read_page	= rtl821x_read_page,
 		.write_page	= rtl821x_write_page,
 		.flags		= PHY_ALWAYS_CALL_SUSPEND,

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

