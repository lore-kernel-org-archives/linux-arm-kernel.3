Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2DC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q5ed43rGmQnihxTQTBsvH8EfbT3GuiTb8x+Xb4Mdl0=; b=3x54cA3czDRcBYh7b/oaDaWXPn
	aQdI9MgL2DAshohEBqrWFtWg35SSRxRegJQ+0ZUcLMtFpYQjuDJdeljsUaxhY+mh1HYjLD8InGflX
	ZFPoSyroPzS4xdkL5/KGmJRskH2iF2OY9uZJLRfiYijeuKkjUksD7YCgRYAXtDtbASMhQM/lVgHJ1
	sg0n9p4zX4tH+zZbB8ftDSkoj6ub7UP3SPo1eVRuwzS9ve7r4eke85GQn95a1cndxLYC9uhaUd2sS
	RRuBsVynKzPShHQZNRacJT5ViXp1wLgC+1cZMDykLIqiq9q14Fg4ZHOL+d/CIFlot8zJJsv5kkcrD
	ZdpAnQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUm1j-0000000Ba3H-1Ve6;
	Thu, 26 Jun 2025 12:48:27 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlI5-0000000BURa-0xSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 12:01:18 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QC0xLL1729730;
	Thu, 26 Jun 2025 07:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750939259;
	bh=8q5ed43rGmQnihxTQTBsvH8EfbT3GuiTb8x+Xb4Mdl0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WtJAt8ZVQ4M1Ncn++K+/pxnbtakt1hndCKZokghxuKvUh/3KzLXi4MN+khm7b5OX2
	 HqnjM4pCkNm7NOiUapeNYvX3wughlqkY1VnJO/UsOMYUvxxZHwGi+TegJfN67V9IOH
	 EDvvVwFpmWcBcMLRHYs9jawXXKP4+Vcq0wp8PCc4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QC0xXm3601113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 07:00:59 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 07:00:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 07:00:59 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QC0wxM961069;
	Thu, 26 Jun 2025 07:00:58 -0500
Date: Thu, 26 Jun 2025 17:30:58 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan
 Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux@ew.tq-group.com>,
        Maxime
 Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY
 mode for fixed RGMII TX delay
Message-ID: <3928de74-2266-42db-91bc-354832a94518@ti.com>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
 <54d6cd05-65ef-4e1d-8041-3e4a2c50b443@ti.com>
 <8a99444a-a4e4-4c4f-8cec-225a10d5d418@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a99444a-a4e4-4c4f-8cec-225a10d5d418@lunn.ch>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_050117_358677_769A6AC1 
X-CRM114-Status: GOOD (  35.83  )
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

On Thu, Jun 26, 2025 at 01:58:07PM +0200, Andrew Lunn wrote:
> On Thu, Jun 26, 2025 at 03:10:50PM +0530, Siddharth Vadapalli wrote:
> > On Tue, Jun 24, 2025 at 12:53:33PM +0200, Matthias Schiffer wrote:
> > 
> > Hello Matthias,
> > 
> > > All am65-cpsw controllers have a fixed TX delay, so the PHY interface
> > > mode must be fixed up to account for this.
> > > 
> > > Modes that claim to a delay on the PCB can't actually work. Warn people
> > > to update their Device Trees if one of the unsupported modes is specified.
> > > 
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > > ---
> > >  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 27 ++++++++++++++++++++++--
> > >  1 file changed, 25 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > index f20d1ff192efe..519757e618ad0 100644
> > > --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > @@ -2602,6 +2602,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
> > >  		return -ENOENT;
> > >  
> > >  	for_each_child_of_node(node, port_np) {
> > > +		phy_interface_t phy_if;
> > >  		struct am65_cpsw_port *port;
> > >  		u32 port_id;
> > >  
> > > @@ -2667,14 +2668,36 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
> > >  
> > >  		/* get phy/link info */
> > >  		port->slave.port_np = of_node_get(port_np);
> > > -		ret = of_get_phy_mode(port_np, &port->slave.phy_if);
> > > +		ret = of_get_phy_mode(port_np, &phy_if);
> > >  		if (ret) {
> > >  			dev_err(dev, "%pOF read phy-mode err %d\n",
> > >  				port_np, ret);
> > >  			goto of_node_put;
> > >  		}
> > >  
> > > -		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, port->slave.phy_if);
> > > +		/* CPSW controllers supported by this driver have a fixed
> > > +		 * internal TX delay in RGMII mode. Fix up PHY mode to account
> > > +		 * for this and warn about Device Trees that claim to have a TX
> > > +		 * delay on the PCB.
> > > +		 */
> > > +		switch (phy_if) {
> > > +		case PHY_INTERFACE_MODE_RGMII_ID:
> > > +			phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
> > > +			break;
> > > +		case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +			phy_if = PHY_INTERFACE_MODE_RGMII;
> > > +			break;
> > > +		case PHY_INTERFACE_MODE_RGMII:
> > > +		case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +			dev_warn(dev,
> > > +				 "RGMII mode without internal TX delay unsupported; please fix your Device Tree\n");
> > 
> > Existing users designed boards and enabled Ethernet functionality using
> > "rgmii-rxid" in the device-tree and implementing the PCB traces in a
> > way that they interpret "rgmii-rxid". So their (mis)interpretation of
> > it is being challenged by the series. While it is true that we are updating
> > the bindings and driver to move towards the correct definition, I believe that
> > the above message would cause confusion. Would it be alright to update it to
> > something similar to:
> > 
> > "Interpretation of RGMII delays has been corrected; no functional impact; please fix your Device Tree"
> 
> It is dev_warn() not dev_err(), so it should be read as a warning. And
> the device will continue to probe and work. So I think the message is
> O.K. What we don't want is DT developers thinking they can just ignore
> it. So i would keep it reasonably strongly worded.

Thank you for the clarification. I have no further concerns and the
patch looks good to me.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

