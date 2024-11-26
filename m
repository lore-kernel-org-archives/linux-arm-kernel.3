Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E566D6555B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boX705ixGpX0WIhU4HsHMX1LO3WzB02Fz6xUUWqOtdg=; b=kx3Zs1/uJDMH/VPvbdIyM9yOhq
	7JNMsPcPaiMi5HN4QLcrguzJLQvWi3Ac0kuc7sK7UIs38jJ0yeJPPXrmBMHTM4Cw+qoK5TXKy1/Np
	6hHk766spJre4Cy62BL0WCIG7RGFX7niDLt3pQlMNLLHY/Ny9MO7fZEbEPc2c9Schy27Sb5ql0NCx
	Sv8l8D4ux7xaoafQ1duCL4FOBc/H5zqX4q00eQzPVl9MqRgBX+vB385g7lnGoihgGF+u50nnlbzMm
	7MLfjekkxNBR59IWT8y3CoQPxJWAjKOmbXbsz04OSyaCCgf00DrMFZ3tKoZ9L+/t5Fp8Mdp6LllNC
	JhoH0Ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG3ML-0000000BmJQ-1eBk;
	Tue, 26 Nov 2024 21:44:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG3LN-0000000BmFw-3BeU;
	Tue, 26 Nov 2024 21:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=boX705ixGpX0WIhU4HsHMX1LO3WzB02Fz6xUUWqOtdg=; b=FFYZHdsokE0B/sNH1TVhXQGepS
	YcmDSz+0gpqG1KHdFM+5lQSHUBjhH3JTcTxjsWMGBxw97s+9LgiKBrZ6JHQ8SP9i8jdvCC7JSh+li
	Es0g3quRaeHJHsL821rY4mu0+0mn7maNDYLja9l6cKU6I/Huw1bvCXGedqsTIp86fRhiPCDb+MrFO
	XrcZS7Pf122Mv76xy3DRRXKia8j4I5lUL3KjUYupkfQ0B2hTvGg5X2s9xIBSukMvBGEVwPeEnG/gy
	WtaRvGmHOzJS8CSgTXQ8fS+ih3MYTXXgIsHBV9H3tS+OxaWJoEZff9lTCK7JH56wkQVYXM5YWJI0y
	L3KwSlOA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42268)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tG3L5-0007k1-2T;
	Tue, 26 Nov 2024 21:43:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tG3L0-0004sg-1X;
	Tue, 26 Nov 2024 21:43:14 +0000
Date: Tue, 26 Nov 2024 21:43:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 15/16] net: phylink: add negotiation of
 in-band capabilities
Message-ID: <Z0ZA8u0QrCKVA6pe@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>
 <e8a11b23-3918-458f-8888-4ca32058968a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a11b23-3918-458f-8888-4ca32058968a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_134337_795982_7AE00F93 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, Nov 26, 2024 at 10:18:56PM +0100, Andrew Lunn wrote:
> > +		if (pcs_ib_caps && pcs_ib_caps != LINK_INBAND_DISABLE) {
> > +			/* PCS supports reporting in-band capabilities, and
> > +			 * supports more than disable mode.
> > +			 */
> > +			if (pcs_ib_caps & LINK_INBAND_DISABLE)
> > +				neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> > +			else if (pcs_ib_caps & LINK_INBAND_ENABLE)
> > +				pcs_ib_only = true;
> > +		}
> > +
> > +		if (phy_ib_caps && phy_ib_caps != LINK_INBAND_DISABLE) {
> > +			/* PHY supports in-band capabilities, and supports
> > +			 * more than disable mode.
> > +			 */
> > +			if (phy_ib_caps & LINK_INBAND_DISABLE)
> > +				pl->phy_ib_mode = LINK_INBAND_DISABLE;
> > +			else if (phy_ib_caps & LINK_INBAND_BYPASS)
> > +				pl->phy_ib_mode = LINK_INBAND_BYPASS;
> > +			else if (phy_ib_caps & LINK_INBAND_ENABLE)
> > +				phy_ib_only = true;
> 
> Looking at the different handling between PCS and PHY, i asked myself,
> does PCS BYPASS exist? If it is invalid, i don't see a check if the
> PCS is reporting it and should we be issuing a warning?

Yes, it does exist - see for example MVNETA_GMAC_AN_BYPASS_ENABLE for
mvneta - but there's complications to using it that need sorting first.

The problem is if SGMII enters bypass mode, then the duplex is
configured according to MVNETA_GMAC_CONFIG_FULL_DUPLEX. In wonderful
Marvell style, it makes no mention about the speed setting. It does
say that it's supported for "SGMII modes". One assumes that it would
do the same thing and fall back to setting described by the two speed
bits, but the documentation doesn't say that. Maybe "SGMII modes" is
referring to Base-X only and not Cisco SGMII.

The problem of what seems to be almost an industry wide abuse of the
"SGMII" term creating a trainwreck strikes again!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

