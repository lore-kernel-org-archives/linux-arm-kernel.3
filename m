Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA763CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFMjqtjNCrpO4MkZ/IpljuKTJtXspfUDvgeA/xG48uM=; b=eQFWXwTlbGugOoenkRyeC82Rty
	DlAUHa2XCfsTsJtODjgYxTrikQvi4EDd93JoZgXMCxjMd+PyLmUfejT1naopGEETs+vyIOxwDd8Yd
	qxJO0hfOu7N9jHPiWcWSZiJo1R3337n4rhI+E4gwloq6F+WZCu47NANONRvgKsE+31wavCVvPQRQu
	fkQuk3fRtC1Kzm6uVEpknn1JhmFAgWkK//K+xL5Vo88FyTKnO1ht7vgXSdx79ZHitbzoeOdfnoP3x
	yxrccIwCjUN6w7h3WLEFwhiSxtTjLo/2YIsGodzmRcSh27TyE9oLNpviI8EJnAUUpq6uivmEEDCl+
	QxB/mn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGi6-0000000BpzM-2ZCJ;
	Tue, 04 Nov 2025 13:04:30 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGi3-0000000Bpym-3wpd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:04:29 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B59C81A0A39;
	Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A77171A09FE;
	Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 08A68202E8;
	Tue,  4 Nov 2025 14:04:25 +0100 (CET)
Date: Tue, 4 Nov 2025 14:04:25 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH net-next 02/11] net: stmmac: s32: move PHY_INTF_SEL_x
 definitions out of the way
Message-ID: <aQn52d7B6HfVSS22@lsv051416.swis.nl-cdc01.nxp.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
 <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
 <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_050428_126688_1406640F 
X-CRM114-Status: GOOD (  15.18  )
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

On Tue, Nov 04, 2025 at 09:55:25AM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 04, 2025 at 10:37:10AM +0100, Jan Petrous wrote:
> > On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> > >  /* SoC PHY interface control register */
> > > -#define PHY_INTF_SEL_MII	0x00
> > > -#define PHY_INTF_SEL_SGMII	0x01
> > > -#define PHY_INTF_SEL_RGMII	0x02
> > > -#define PHY_INTF_SEL_RMII	0x08
> > > +#define S32_PHY_INTF_SEL_MII	0x00
> > > +#define S32_PHY_INTF_SEL_SGMII	0x01
> > > +#define S32_PHY_INTF_SEL_RGMII	0x02
> > > +#define S32_PHY_INTF_SEL_RMII	0x08
> > 
> > Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> Thanks. One question: is it possible that bits 3:1 are the dwmac
> phy_intf_sel_i inputs, and bit 0 selects an external PCS which
> is connected to the dwmac using GMII (and thus would be set bits
> 3:1 to zero) ?

I guess so, as the S32G3 Reference Manual says regarding
GMAC_0_CTRL_STS register bits the following:

[3-1] PHY_INTF_SEL: PHY Interface Select
      Selects the PHY interface. These values are valid only
      for PHY_MODE=0.

      000b - MII
      001b - RGMII
      100b - RMII

[0-0] PHY_MODE: Select the PHY mode.
      Selects the PHY mode.

      0b - Other PHY modes (for ex. RGMII, RMII, ...)
      1b - SGMII mode

> 
> It's not really relevant as the driver only appears to support
> RGMII.

Yes. The RGMII was the simplest way to upstream review, so
I decided to stick on it.

The SGMII support is ongoing.

/Jan


