Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177ACC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9/czP7ioI9JHcEbksjmAMrCOj4f1C2Czk3C5v8LVJ0=; b=ILAX0DlnJi15bAznuRC89ak8Wz
	WeUKybataCwxwr0qr8EMJp3gTK1tJdqpRph+vuKLb3CpSmoFJuXJgTbgUmijZ85tqM966sB7HwytZ
	ZpP1CQ1us5DLdUKfmpIZBMnFBqDMCJYKRqJifYuY/OIcftGk+go4heVfkNOFyhruzcsL66VlRak1+
	OUG234bQbInrvx1RUs3n7hpNTIpLySYdBxbaOekXKZWTc1CQtZMsyBIOp77c/1X/RUKeyEd2w/JOw
	MbXnQNM6dFOpYrx1bIxKFVLEHNcvreXaPijJMPgNXJUAdNZ1Zk4Vhxzr1dvU2mgGahgfvF30OnjaS
	Tfhl/OWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXMC-0000000Fj0O-2uwK;
	Sun, 02 Aug 2026 14:40:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXM9-0000000FizS-1QWh;
	Sun, 02 Aug 2026 14:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O9/czP7ioI9JHcEbksjmAMrCOj4f1C2Czk3C5v8LVJ0=; b=N0oUJcTDIX+KIOvluhlbWZ6tmp
	36M5J+rTREuYz0/Q77XiMrfHby3pWmr1FZ75bT4DWzB5IkTrB8qgheB3gtsOiBAJkfktCnl/UcJr5
	5c6EKEHVbEKV2bnS0tuEmgvdXm1Ary4bWf3/x8Wrs7CuoCu6X4U189WWnRg7pEejPXJg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqXLu-00Fa2t-7Z; Sun, 02 Aug 2026 16:39:46 +0200
Date: Sun, 2 Aug 2026 16:39:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
Message-ID: <302c67b0-6729-4930-a409-a2408dde33fc@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-9-coiaprant@gmail.com>
 <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
 <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_074001_446702_156B9687 
X-CRM114-Status: GOOD (  26.06  )
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

On Sun, Aug 02, 2026 at 11:20:27AM +0800, Coia Prant wrote:
> > On Sat, Aug 01, 2026 at 10:22:31PM +0800, Coia Prant wrote:
> > > The XPCS block contains four MII ports (0..3), each of which can be
> > > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> > > The hardware maps these ports to different MMDs:
> > >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
> > >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
> > >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
> > >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
> >
> > Why is port 0 called ROCKCHIP_MMD_MII not ROCKCHIP_MMD_MII0 ?
> 
> Hi Andrew,
> 
> The naming follows the Rockchip TRM. The hardware documentation refers to
> the MMD for the first port as simply "MII" without a numeric suffix, while
> the other ports are named "MII1", "MII2", "MII3". I kept the naming
> consistent with the TRM to make it easier to cross-reference.
> 
> As I understand it, this is probably because the MII controls not only
> Port 0, but
> also the entire PCS (these registers are read-only in Ports 1-3 and reflected
> back to the MII).
> 
> If you prefer, I can rename it to ROCKCHIP_MMD_MII0 for consistency. Let me
> know and I'll update it in v3.

If the TRM gives it this name, then O.K. It just makes the code look
odd, unbalanced.

> > > +static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg)
> > > +{
> > > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > > +     int dev;
> > > +
> > > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > > +             return -ENODEV;
> > > +
> > > +     dev = xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg);
> >
> > Does this mean C22 registers are mapped into the first 32 of C45
> > MDIO_MMD_VEND2?
> 
> Yes, exactly. The C22 register space (reg 0-31) is mapped into the first
> 32 registers of the VEND2 MMD (MMD 7). This is how the hardware is designed
> and matches the standard C22 to C45 address mapping.

Does the xpcs code actually perform any C22 access? A quick look
suggests it is C45 only. xpcs_read() calls mdiodev_c45_read(). If C22
is not needed, i would not provide these functions.

> 
> >
> > > +static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> > > +{
> > > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > > +
> > > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > > +             return -ENODEV;
> > > +
> > > +     dev = xpcs_rk_mdio_read_remapping(addr, dev, reg);
> >
> > Should it be returning an error for dev == MDIO_MMD_VEND2? Or at least
> > if reg < 32?
> 
> No, we cannot simply return an error here.

Thanks for the explanation.

       Andrew

