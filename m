Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A508CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13csuvQtsJof1dOcx8aG6Jr6ZCLtdjpsnRWnJo51I84=; b=GwarQ006W7SoHuut16tHr2kr85
	BTJH1bHDeyFAxUVRu8JoR/54dD51JCwEaDfvz2bHPhAvT/fnA9rUPGi/ReSxzCgUEvi2o3Hne3EeH
	rXMLkP3uTp7T4I+SklwA8fKN3rhBjQ6s6AHdQt/V8/LSsmbnPJN4Vi/OR9BZniKOkFVxr/d+2fjQq
	aT356UAbgjyBMQcrBFR9isu39gKhPsegr5iesH7DDoVEzlpm0jJWpWdQk6BYxb4PcgVqmeWx95QHs
	iF2ZK7mD+OzxIfvTV7UUZkgjC4cGLI5JsD8gFN5RizEfHEiXMXY8H56wzwvGWWSRl0n5sRyvrMkVn
	EhXFCxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdqM-00000002h6H-07CG;
	Sat, 08 Nov 2025 07:58:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHdqJ-00000002h4N-2jo9;
	Sat, 08 Nov 2025 07:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=13csuvQtsJof1dOcx8aG6Jr6ZCLtdjpsnRWnJo51I84=; b=Rv2wxtohwqYJPfuCefjstYazhS
	J7sVL69bsh133ujRSUUL9rrB0a/kzxTXGGikUf2yKLeg7SmIMIT8UuJNoKhzCvfyGAAWz5Pe+EeEm
	h2Q3xUXo+zHXfnRbj7Qyw+yNd1OHpPxkgHGUi0HVF6jlGu4p8MUsSzzkzdi1BfcZ8nJ49iFCq6/se
	ZFmURo5WkmDkDgxbjYGaHpgr5UnQva3gNUyY8WgIrCVrLxhKy+ZdWv2qrhTCFKDvav2VUb6zLH+VB
	pr2JJLW3b4SiifkY32GzQxiS7P334PO84sQOHxisN0vvi52hhb/G8h9REWWVIxAKPkvD8a139wNRt
	Mb4K10Ng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41096)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHdq8-000000007Vz-3J1j;
	Sat, 08 Nov 2025 07:58:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHdpz-000000008Nb-48sV;
	Sat, 08 Nov 2025 07:58:20 +0000
Date: Sat, 8 Nov 2025 07:58:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
Message-ID: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_235839_716543_685FDB19 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 07/11/2025 15:29, Russell King (Oracle) wrote:
> > -	switch (plat_dat->phy_interface) {
> > -	case PHY_INTERFACE_MODE_RGMII:
> > -	case PHY_INTERFACE_MODE_RGMII_ID:
> > -	case PHY_INTERFACE_MODE_RGMII_RXID:
> > -	case PHY_INTERFACE_MODE_RGMII_TXID:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_MII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_RMII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
> > -		break;
> > -	default:
> > +	int phy_intf_sel;
> > +
> > +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
> > +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
> >  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
> >  		return -EOPNOTSUPP;
> >  	}
> 
> Probably not too big of a deal, but don't we now incorrectly accept the
> "gmii" mode ?

We will accept GMII mode, but (a) does that matter, and (b) shouldn't
the DT binding be checking the phy-mode (we have some bindings that do.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

