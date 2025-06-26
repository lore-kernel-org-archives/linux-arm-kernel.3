Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E602FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7sAEgdd707TI8toifhEogagOBUn3n5FZn7TngN4ra8=; b=P3W/9Ir2OILryVYjxc3jpxy8T3
	0+AEu/El6YFc4grH1ZbPa7+ynve8Uzy8Zgpc61Bfgxrho4/R6I8iZGUjhWBWM86yWKDGldLXWygZf
	S5TvNOOVxP8USOX4ivpBQSbGOKYXL7Aj4itoYQLKMfRQE/56o+1Sts/FioPtRl+z7+GdecOmAd3VG
	zR6UOOswubWvAcPYQe6o3zkHf8z4EkvwMwJJTjjmP5NMiYF6B9XVdaRkxxgG45LkB9pZjPwouxCGa
	gt3+50YLXnlG9orJDhehvF/Jc8wEej97VEp4Mb2QuhhOTB+CaTn2A4yTEr993oWy8c5jcsrUDCea7
	ttpum9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlzT-0000000BZdh-2T1I;
	Thu, 26 Jun 2025 12:46:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlFM-0000000BTsa-0GUF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E7sAEgdd707TI8toifhEogagOBUn3n5FZn7TngN4ra8=; b=bLnAdtiIn4wQsxsNQ9E4g1vdj+
	dzmL9IPFWW/ZMhnrr9WlYwj7N1V3Yk8elPHBYwDwSADNFMfaYKdAY8OL9xcwQft8P5YXlebsKs71F
	IV52ILHh2KP0GqomfNcwhnB/a3I3oFOSaiXvVaiKOjsrjflriRqGVpKMnt6yVzJq4VBw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uUlF1-00H2Xz-3Z; Thu, 26 Jun 2025 13:58:07 +0200
Date: Thu, 26 Jun 2025 13:58:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <8a99444a-a4e4-4c4f-8cec-225a10d5d418@lunn.ch>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <54d6cd05-65ef-4e1d-8041-3e4a2c50b443@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d6cd05-65ef-4e1d-8041-3e4a2c50b443@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_045828_099787_1FA4CF90 
X-CRM114-Status: GOOD (  30.42  )
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

On Thu, Jun 26, 2025 at 03:10:50PM +0530, Siddharth Vadapalli wrote:
> On Tue, Jun 24, 2025 at 12:53:33PM +0200, Matthias Schiffer wrote:
> 
> Hello Matthias,
> 
> > All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> > mode must be fixed up to account for this.
> > 
> > Modes that claim to a delay on the PCB can't actually work. Warn people
> > to update their Device Trees if one of the unsupported modes is specified.
> > 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 27 ++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > index f20d1ff192efe..519757e618ad0 100644
> > --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > @@ -2602,6 +2602,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
> >  		return -ENOENT;
> >  
> >  	for_each_child_of_node(node, port_np) {
> > +		phy_interface_t phy_if;
> >  		struct am65_cpsw_port *port;
> >  		u32 port_id;
> >  
> > @@ -2667,14 +2668,36 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
> >  
> >  		/* get phy/link info */
> >  		port->slave.port_np = of_node_get(port_np);
> > -		ret = of_get_phy_mode(port_np, &port->slave.phy_if);
> > +		ret = of_get_phy_mode(port_np, &phy_if);
> >  		if (ret) {
> >  			dev_err(dev, "%pOF read phy-mode err %d\n",
> >  				port_np, ret);
> >  			goto of_node_put;
> >  		}
> >  
> > -		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, port->slave.phy_if);
> > +		/* CPSW controllers supported by this driver have a fixed
> > +		 * internal TX delay in RGMII mode. Fix up PHY mode to account
> > +		 * for this and warn about Device Trees that claim to have a TX
> > +		 * delay on the PCB.
> > +		 */
> > +		switch (phy_if) {
> > +		case PHY_INTERFACE_MODE_RGMII_ID:
> > +			phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
> > +			break;
> > +		case PHY_INTERFACE_MODE_RGMII_TXID:
> > +			phy_if = PHY_INTERFACE_MODE_RGMII;
> > +			break;
> > +		case PHY_INTERFACE_MODE_RGMII:
> > +		case PHY_INTERFACE_MODE_RGMII_RXID:
> > +			dev_warn(dev,
> > +				 "RGMII mode without internal TX delay unsupported; please fix your Device Tree\n");
> 
> Existing users designed boards and enabled Ethernet functionality using
> "rgmii-rxid" in the device-tree and implementing the PCB traces in a
> way that they interpret "rgmii-rxid". So their (mis)interpretation of
> it is being challenged by the series. While it is true that we are updating
> the bindings and driver to move towards the correct definition, I believe that
> the above message would cause confusion. Would it be alright to update it to
> something similar to:
> 
> "Interpretation of RGMII delays has been corrected; no functional impact; please fix your Device Tree"

It is dev_warn() not dev_err(), so it should be read as a warning. And
the device will continue to probe and work. So I think the message is
O.K. What we don't want is DT developers thinking they can just ignore
it. So i would keep it reasonably strongly worded.

	Andrew

