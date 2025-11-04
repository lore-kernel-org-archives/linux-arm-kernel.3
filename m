Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE80ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GD9/PmM/FWmyHloO+QO6/ZwKLx6kfDA+PsRFEHl+e+M=; b=CCBaBjAn+XkGgG2t+6aSmiJw1a
	21XJqwSAUp/ITwPf6pKyVYeC1ChqtDvlolktAJMXkoiU5tvfT2nxsaBmyhv1scy82RBv8X10Gh0Ry
	YeeHI1Jmqo6uO4wBSZIqJQizlyGb6NNJI0V6xnDrH9tY6SrnKNkIt22FlSfz6Cgsda+K3/Gr7cSUJ
	W/PVOXfmSilypUkHSi9bppzQLOeqzzVmb2CkYv47iOn5/MTodWQcvxMPIgdANaG10ZostF8mXFuNJ
	oQqvpAa5D4ENpvXBuKHl1Yn05uwmdPq1m6YAF87NEc+PBgAtWF8MpYHZo9exMHHHdBFlxxxIwE/5X
	5ap3+kAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCju-0000000BSmY-24Qq;
	Tue, 04 Nov 2025 08:50:06 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCjr-0000000BSlu-1f2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GD9/PmM/FWmyHloO+QO6/ZwKLx6kfDA+PsRFEHl+e+M=; b=ddmvZClv++Mm8JUAQBHkW32Do2
	fy2OCqnpW2FDUY0xj0PVlI6C5Yv/PlgwsdLiUyGgaP3yFgAKUchjpPCQDyxCuFgi7IjadKTSUMma6
	bbxyrBJjtCuvgBFreCuqE+ah7EoCI5jFG8c2XKbB4gOmAxM2s0RjGyGT06EBiOsijVljc7KekF8mR
	jzda4iFBjin+F5Z25XOcxTUyZtiHMsGiFovnGZxO8IkF2LWHyp+8Cb+6oQKixEzeHN7lX2RF0LClF
	m2aandSYT3i1cItRpaxjlR5GBM6r4hKNICAispJAixaWMXEnc+lUILTxaWgd19CDPW930GJxg8l/q
	vheYiCcQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33438)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGCji-000000001tC-3HFr;
	Tue, 04 Nov 2025 08:49:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGCjf-000000004dY-0Anp;
	Tue, 04 Nov 2025 08:49:51 +0000
Date: Tue, 4 Nov 2025 08:49:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH net-next 04/11] net: stmmac: add stmmac_get_phy_intf_sel()
Message-ID: <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
 <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005003_443151_21FAD416 
X-CRM114-Status: GOOD (  21.50  )
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

On Tue, Nov 04, 2025 at 09:34:31AM +0100, Maxime Chevallier wrote:
> > +int stmmac_get_phy_intf_sel(phy_interface_t interface)
> > +{
> > +	int phy_intf_sel = -EINVAL;
> > +
> > +	if (interface == PHY_INTERFACE_MODE_MII ||
> > +	    interface == PHY_INTERFACE_MODE_GMII)
> > +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> > +	else if (phy_interface_mode_is_rgmii(interface))
> > +		phy_intf_sel = PHY_INTF_SEL_RGMII;
> > +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> > +		phy_intf_sel = PHY_INTF_SEL_SGMII;
> > +	else if (interface == PHY_INTERFACE_MODE_RMII)
> > +		phy_intf_sel = PHY_INTF_SEL_RMII;
> > +	else if (interface == PHY_INTERFACE_MODE_REVMII)
> > +		phy_intf_sel = PHY_INTF_SEL_REVMII;
> > +
> > +	return phy_intf_sel;
> > +}
> > +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
> 
> Nothng wrong with your code, this is out of curiosity.
> 
> I'm wondering how we are going to support cases like socfpga (and
> probably some other) where the PHY_INTF_SEL_xxx doesn't directly
> translate to the phy_interface, i.e.  when you have a PCS or other
> IP that serialises the MAC interface ?

It also doesn't differentiate between MII and GMII. That's fine for
this - this is about producing the configuration for the dwmac's
phy_intf_sel_i signals. It isn't for configuring the glue hardware
for any other parameters such as RGMII delays.
 
> for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
> when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
> we need to output RGMII.

From what I remember for socfpga, you use an external PCS that needs
GMII. This function doesn't take account of external PCS, and thus
platform glue that makes use of an external PCS can't implement
.set_phy_intf_sel() yet. As noted, it also doesn't handle TBI (which,
although we have PHY_INTERFACE_MODE_TBI, Synopsys intended this mode
to be used to connect to a SerDes for 1000BASE-X.)

> Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)

Yes, there will need to be a way to override this when an external
PCS is being used. I suspect that all external 1G PCS will use GMII,
thus we can probably work it out in core code.

Note, however, that socfpga doesn't use the phy_intf_sel encoding:

#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
#define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RMII 0x2

#define PHY_INTF_SEL_GMII_MII   0
#define PHY_INTF_SEL_RGMII      1
#define PHY_INTF_SEL_RMII       4

It's close, but it isn't the phy_intf_sel_i[2:0] signal values.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

