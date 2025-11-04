Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C7CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3GD3WtzrKWlpy2aI0UjWLqcC9jrT8mGnNqjXDUv8Jk=; b=y4qWvtd77wnj4Fs7ba36B+snMi
	rshZgWjBz21ybg3iC2//ZlPxMEA2j1CTP1cGY6tJQ9UvzsoI+l7r1Mffgqy6AtTqLjovHDcLwxzq8
	L6cxWnpNRQaDbuaLpft2qcfw0yrQpG2ZcvqpRiC4p68btW0cc7Fs8zopx0nKdV0SFL83gCdHvpxXm
	XEoAhUreWm4mQl356woRLAhn0wBs6uSzaoyATD8zoLp4WH7BmlXC2KN4ra/vENLOJfuX/CIWWFUdg
	yhvDyo9qaz5B9eUWQ1pKR5SuwV2PHlZntitFgP2yF2d3JRO4YtkmLx8Du2X/rvOxA2gJz8ZA6yPZp
	jsKaxVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDlT-0000000BZ4L-0YgM;
	Tue, 04 Nov 2025 09:55:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDlP-0000000BZ3b-2xmh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c3GD3WtzrKWlpy2aI0UjWLqcC9jrT8mGnNqjXDUv8Jk=; b=BajtH6ndoioXThM99+Kw+0rTJv
	Gw8GLOZ3yhKQCBrgW0hjZXOIXiooqeJevBEQD3QklMWbMPQ+xvqd6ClHBHXtAz3MmMDtOc6PmSj6q
	s+grZ7qD4pPt7HC2T2a/cTCdr1POGxbXPsFAE89smW0PlGn5r24MVaIQJzgQYM8HRLVoVtwlROz2X
	6CTL+BGPxLatk/5cNnIeHK/LanaXPXuGPP77ywbuDSW64RJMPTyYQP4UlfZKm+DZQ8jqox1P0f3pr
	lemU83FfAUzaJxmbXwxtM9yj5AfWcGfXvScvq9m1Q4aHmMBbD7cl+PvmSIKFcWbEo2jjIL0siFkFA
	7aUkoIBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39054)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGDlB-000000001ys-3e1I;
	Tue, 04 Nov 2025 09:55:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGDl7-000000004g1-3uIv;
	Tue, 04 Nov 2025 09:55:25 +0000
Date: Tue, 4 Nov 2025 09:55:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
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
Message-ID: <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
 <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_015544_033351_8AF073DE 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, Nov 04, 2025 at 10:37:10AM +0100, Jan Petrous wrote:
> On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> >  /* SoC PHY interface control register */
> > -#define PHY_INTF_SEL_MII	0x00
> > -#define PHY_INTF_SEL_SGMII	0x01
> > -#define PHY_INTF_SEL_RGMII	0x02
> > -#define PHY_INTF_SEL_RMII	0x08
> > +#define S32_PHY_INTF_SEL_MII	0x00
> > +#define S32_PHY_INTF_SEL_SGMII	0x01
> > +#define S32_PHY_INTF_SEL_RGMII	0x02
> > +#define S32_PHY_INTF_SEL_RMII	0x08
> 
> Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks. One question: is it possible that bits 3:1 are the dwmac
phy_intf_sel_i inputs, and bit 0 selects an external PCS which
is connected to the dwmac using GMII (and thus would be set bits
3:1 to zero) ?

It's not really relevant as the driver only appears to support
RGMII.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

