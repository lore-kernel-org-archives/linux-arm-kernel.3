Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2610CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7QJB+xINYIsQBlH4P8xjK72iiBxzKUb4jGbIL9WGKM=; b=i2VRk3zTjXOBHIAxIZ/wIVcdaI
	ipo0otVokU02Wtun2qNpOXNZuasUNupTNHIeCdw2nc908EPd1q8ZEmFkd+yuIxsGkZDnSKRSmYzVp
	Z70sfqeO/AQJlAl+Zbi3f6mTzqC9I8BNR4xIfxR3J1RDVUPG29isPca6qlwGCncdaVdWWj8XZQXxi
	D6fYLbCsr+ZI2TtQpU3JXNhx21L3wyIQsjo8jy6/VkvJtUJaWif7Lc/n7tQ+c4xkoGVrvNzm5Ps6y
	t/1EafuESWu9Bkbyq992XncfNmPag8BTXbGu8gk4lKTEuQoZUCkRM9LzP+rxT0A3qvBF7sdK5WUqY
	g9KNh1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rEX-00000008zAA-0YRX;
	Fri, 17 Oct 2025 20:39:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rEU-00000008z9Z-2nfd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 20:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g7QJB+xINYIsQBlH4P8xjK72iiBxzKUb4jGbIL9WGKM=; b=doQH97vYrTFMTqXGZCyGlT3B+j
	xzprKs3OzJqCJDpWHFWnlgBKEGS68a4eS1kt+GYWAbNo3no3RsoUUhTSRLtP6x48K5fW80b7g1lY8
	NnCXh9xEQG9bvgEnW35kLn2sy7zNhAbJgIOR6P29SktDtgvO+s3IdP39t32C9EwchR7Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9rE8-00BKFK-O9; Fri, 17 Oct 2025 22:39:04 +0200
Date: Fri, 17 Oct 2025 22:39:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next] net: stmmac: mdio: use phy_find_first to
 simplify stmmac_mdio_register
Message-ID: <4a2d59c0-be25-4b83-b732-138d04f62292@lunn.ch>
References: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_133926_706140_FD028842 
X-CRM114-Status: GOOD (  11.73  )
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

> -	int addr, found, max_addr;
> +	struct phy_device *phydev;
> +	int addr, max_addr;
>  
>  	if (!mdio_bus_data)
>  		return 0;
> @@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	if (priv->plat->phy_node || mdio_node)
>  		goto bus_register_done;
>  
> -	found = 0;
> -	for (addr = 0; addr < max_addr; addr++) {

With this loop gone...

> +	phydev = phy_find_first(new_bus);
> +	if (!phydev || phydev->mdio.addr >= max_addr) {
>  		dev_warn(dev, "No PHY found\n");
>  		err = -ENODEV;
>  		goto no_phy_found;
>  	}
>  
> +	/*
> +	 * If an IRQ was provided to be assigned after
> +	 * the bus probe, do it here.
> +	 */
> +	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
> +		new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;

... what is setting addr to a value?

	Andrew

