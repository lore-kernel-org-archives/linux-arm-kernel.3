Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB94C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWsnbWpreJ6QQ54ZCcdko66WA2cZH6mL0rv/WMd4xzM=; b=LYd/YIKy1WVQ4Qvilg8YTAG6TO
	REb0+PDZBo1pJDSw5xOiTlKKXBJTEUWiyBNXSTUU3/ueDcOqt4+MEqAtXgFfxlEiOx5rSFa2+jkMm
	ix9C3EkSimx+6+FsJVbovlE5HIOKhPDaYCWr/dK6IQN/jWpBIFtBKLi80yB5Vh5JID6S3+vbTFXjT
	FwOKhvO+2q79IvGAtx7uAKxQkrXRVue6l8go4/qKTaZ4ryqOi/MjLZjrYqKQunjkMyrGZx9oMJGZs
	xaYTQQ8anwThf48T+KMdbNQtitkbCaJW/2xLi4toNld1FQiElaoR61Wp8Ygr+iwkZyZ++H1CkF/f4
	niXFvwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3GS-00000001nH2-21WC;
	Wed, 26 Aug 2026 02:21:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3GP-00000001nGX-3zU3;
	Wed, 26 Aug 2026 02:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hWsnbWpreJ6QQ54ZCcdko66WA2cZH6mL0rv/WMd4xzM=; b=WRwlmjuZwzClxNAerr3bu0Fou9
	Y0KlUS7/WtkYxouTGfteL+fm8tUgDZu8sW7zv95AiS2ou7QuOpl/5jljBxp3uk0CBFzwTOfDMQk+n
	ju29mePgaMlRyND98vyj8ge1NjbGosHwlH0YRy5cjOhb++EMtqmhDahUrWtUjvUvV+R0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wz3G8-001SUU-Fm; Wed, 26 Aug 2026 04:21:00 +0200
Date: Wed, 26 Aug 2026 04:21:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: ansuelsmth@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org,
	dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: support EcoNet EN751221
 gbit SoC PHY
Message-ID: <4d594c62-2ceb-43c1-a3d2-731b80493787@lunn.ch>
References: <20260825193456.1823985-1-cjd@cjdns.fr>
 <20260825193456.1823985-4-cjd@cjdns.fr>
 <d7d86078-8a29-4e7f-a62e-91f6b266bea1@lunn.ch>
 <a75b6b15-f86b-4cb2-934c-87583b5bb02c@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75b6b15-f86b-4cb2-934c-87583b5bb02c@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_192117_992103_AEC2C8C5 
X-CRM114-Status: GOOD (  21.85  )
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

> > Does this need a change to the binding document?
> 
> 
> Not as far as I know. econet,en751221-chip-scu is defined in mfd/syscon.yaml
> because it's a catch-all for configuration that the engineers didn't know
> what to do with.

Do you need a property in the PHY node to make this work?

> > > +static int en751221_gphy_config_init(struct phy_device *phydev)
> > > +{
> > > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > Why is the EEE register being cleared?
> 
> 
> From reading the reference implementation, I get the impression that this
> hardware is something of a basket case. There was a certain amount of "write
> three times and then read back" type magic that I just omitted because it
> really looks like they were actively debugging and as soon as it started
> working they shipped the code exactly as it was.
> 
> 
> In the case of disabling EEE, I thought it more prudent to follow them
> because I don't have every SoC that this PHY ever appeared on and I would
> rather not diverge too greatly and risk it being unreliable on some devices.

Is EEE broken? If it is, this is not the correct way to disable
it. You should call phy_disable_eee(phydev); This will also prevent
user space enabling it again.

> > > +	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
> > > +	__mtk_tr_write(phydev, 0x1, 0xf, 0x00, 0x00002b);
> > > +	__mtk_tr_write(phydev, 0x1, 0xf, 0x03, 0x082422);
> > > +	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
> > > +
> > > +	ret = phy_write(phydev, MII_CTRL1000,
> > > +			ADVERTISE_1000FULL | CTL1000_PREFER_MASTER |
> > > +			CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);
> > What does this default to?
> It starts with only ADVERTISE_1000FULL. I don't know why the engineers
> wanted to set it to master, but its definitely intentional.

Generally, switches take the master role, and client take the slave
role. So this does make sense for a PHY used in a switch.

	Andrew

