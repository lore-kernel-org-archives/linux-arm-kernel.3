Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC782CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwpXxoU8iEmC+DaN7Cr9PGN8QVIi8rUJqHbS4C13YiQ=; b=ZTiB4p1o+04o4/dYOYC3JnxIQj
	mktxqPKAv+cNVURCQKVffl1Uy1VYqoF6zlWL10tNuS3aALYNMOpKHmn27dVQJP3+rC0ql7tWw00E+
	JhlJ5+zRkpzOYPHvGYC6gIHP7GwsdNCIhYNv6nNCTJkY/NWC+rdOErbpU+ezW+3Df9M1sw0pKlmxG
	UEuCVy8p0VPct1Q4l8T1TByrzAyFyg//kpKtobPNJAK7y4HN2vgw9KKwpebFVSHT6qdC4VoxSTs3P
	6sdPM3VltlFMMguqG/g20P7MmMFiORH2CXuvXkx6t0mNLM4qygoqvJfMRhxdoqnRS+YxBZTvj+qab
	dHKXTDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP1b-000000003vQ-3jtI;
	Fri, 07 Nov 2025 16:09:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHP1Z-000000003us-1eid;
	Fri, 07 Nov 2025 16:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fwpXxoU8iEmC+DaN7Cr9PGN8QVIi8rUJqHbS4C13YiQ=; b=vn3cbOu+GFQMbus8RTESyhk+QD
	l4MSz/4gSrLSWpMwTcHMS8POSDqXlYoqW6hd0IVlrkrHN0rw/yZ1S8tjbRotxVZckRVVD5aRb8bPB
	u2YW04OZjQkWBC/IllYfMqxS3Dir+tyGqw82YW/NF7mlLI684toDkm0bSBsVAcqCbYiV7/jxwioKY
	+/pe49r2zq2ujlFEiw4kOmyaMOLhRepjPkmnOJVla7Zg8W/csk11yTw9Aw59+2MoFRvcckO8KEMVM
	IwqMBuTNFDkx39IA961qvS8bRUtzUhe9fuWfVrlXNzSefV5rCz9+Bo9Qr7u3Tve04azN7os0yDbxA
	N0fCfdkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHP1N-000000006sy-0WaB;
	Fri, 07 Nov 2025 16:09:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHP1F-000000007hv-1jzX;
	Fri, 07 Nov 2025 16:08:57 +0000
Date: Fri, 7 Nov 2025 16:08:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use
 stmmac_get_phy_intf_sel()
Message-ID: <aQ4ZmXB_eFjKXgIv@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
 <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_080917_437585_B3C27A7A 
X-CRM114-Status: GOOD (  17.01  )
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

On Fri, Nov 07, 2025 at 11:00:35AM -0500, Emil Renner Berthing wrote:
> Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> > Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> > phy_intf_sel value, validate the result and use that to set the
> > control register to select the operating mode for the DWMAC core.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
> >  1 file changed, 6 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > index 1ef72576c6f1..00078b7a6486 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> >         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> >         struct regmap *regmap;
> >         unsigned int args[2];
> > -       unsigned int mode;
> > +       int phy_intf_sel;
> >         int err;
> >
> > -       switch (plat_dat->phy_interface) {
> > -       case PHY_INTERFACE_MODE_RMII:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> > -               break;
> > -
> > -       case PHY_INTERFACE_MODE_RGMII:
> > -       case PHY_INTERFACE_MODE_RGMII_ID:
> > -       case PHY_INTERFACE_MODE_RGMII_RXID:
> > -       case PHY_INTERFACE_MODE_RGMII_TXID:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> > -               break;
> 
> After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
> left unused.

Thanks, I'll remove them in this patch.

> Maybe just squash the patches and remove the definitions?

It's two logical changes, thus two patches. Reviewers find that this
makes it easier to review.

Given the number of platform glues that I'm modifying, I don't want
to change some of them using one big all encompassing patch and
others as a set of logical changes - that would be totally insane
to manage.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

