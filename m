Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjco1YDCuCbUrUVk9eoDRqqrWkwQL1ZF+I2sBO+WXM0=; b=rTNCChoV9tOWUXCta7DgyMy5xP
	xXtdO7VjyDMtp6R6zgsc1xC0xdkW10RzIX0l4N/8NBxLJjipvSWWnpuGwlz0A4iHC/70izpdAJNNU
	+Xdsx71wohnWhemHTe67Z706QPxKmRZJCAby7XmP6T3qUpSDapFRB5KPNzDKfwSknli1kl1v9GiUg
	m7MsFKgYu0U6PxG5G6t+muf2zrVOcPFHKq+yccrQwiAI7kgdbhfrZMWH+S3nDXyiJJAtJ/IodItik
	fG8H01041rZZlSjZLAmZUIkX8VM866PhPikRcTLfXDH/IX1h7P53EHhW0AnktW4AZLZFqplitSjFm
	D8DU1rFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01si-00000006lIg-32pk;
	Wed, 02 Apr 2025 17:28:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01qG-00000006kke-3RgZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 17:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xjco1YDCuCbUrUVk9eoDRqqrWkwQL1ZF+I2sBO+WXM0=; b=RMl6pwh75Bzrg4n8XUqQumdAhq
	r7bf/esLZkLWq5tdGo7DCRJjs6s+20yHYnFhS8xLJFGqxl8IN/xYZPnl44qzWgc2FKbixRjYxUb5a
	S8EUYlG1ovYbe545rofh7kSeu3eZzgH6MFGZOOiTvvYgX4xkuMJSAvk1K4S30TmQSM7o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u01q7-007pcw-SY; Wed, 02 Apr 2025 19:25:23 +0200
Date: Wed, 2 Apr 2025 19:25:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <33394d5b-9a67-4acc-bdd1-bf43dc3bd8ab@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
 <20250331103116.2223899-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103116.2223899-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_102532_858345_68A83FA8 
X-CRM114-Status: GOOD (  21.02  )
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

> +struct switch_enet_private *mtip_netdev_get_priv(const struct net_device *ndev)
> +{
> +	if (ndev->netdev_ops == &mtip_netdev_ops)
> +		return netdev_priv(ndev);
> +
> +	return NULL;
> +}

> +static bool mtip_port_dev_check(const struct net_device *ndev)
> +{
> +	if (!mtip_netdev_get_priv(ndev))
> +		return false;
> +
> +	return true;
> +}
> +

Rearranging the code a bit to make my point....

mtip_port_dev_check() tells us if this ndev is one of the ports of
this switch.

> +/* netdev notifier */
> +static int mtip_netdevice_event(struct notifier_block *unused,
> +				unsigned long event, void *ptr)
> +{
> +	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
> +	struct netdev_notifier_changeupper_info *info;
> +	int ret = NOTIFY_DONE;
> +
> +	if (!mtip_port_dev_check(ndev))
> +		return NOTIFY_DONE;

We have received a notification about some interface. This filters out
all but the switches interfaces.

> +
> +	switch (event) {
> +	case NETDEV_CHANGEUPPER:
> +		info = ptr;

CHANGERUPPER is that a netdev has been added or removed from a bridge,
or some other sort of master device, e.g. a bond.

> +
> +		if (netif_is_bridge_master(info->upper_dev)) {
> +			if (info->linking)
> +				ret = mtip_ndev_port_link(ndev,
> +							  info->upper_dev);

Call mtip_ndev_port_link() has been added to some bridge.

> +static int mtip_ndev_port_link(struct net_device *ndev,
> +			       struct net_device *br_ndev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(ndev);
> +	struct switch_enet_private *fep = priv->fep;
> +
> +	dev_dbg(&ndev->dev, "%s: ndev: %s br: %s fep: 0x%x\n",
> +		__func__, ndev->name,  br_ndev->name, (unsigned int)fep);
> +
> +	/* Check if MTIP switch is already enabled */
> +	if (!fep->br_offload) {
> +		if (!priv->master_dev)
> +			priv->master_dev = br_ndev;
> +
> +		fep->br_offload = 1;
> +		mtip_switch_dis_port_separation(fep);
> +		mtip_clear_atable(fep);
> +	}

So lets consider

ip link add br0 type bridge
ip link add br1 type bridge
ip link set dev lan1 master br0

We create two bridges, and add the first port to one of the bridges.

fep->br_offload should be False
priv->master_dev should be NULL.

So fep->br_offload is set to 1, priv->master_dev is set to br0 and the
separation between the ports is removed.

It seems like the hardware will now be bridging packets between the
two interfaces, despite lan2 not being a member of any bridge....

Now

ip link set dev lan2 master br1

I make the second port a member of some other bridge. fep->br_offload
is True, so nothing happens.

This is why i said this code needs expanding.

If you look at other switch drivers, you will see each port keeps
track of what bridge it has been joined to. There is then logic which
iterates over the ports, finds which ports are members of the same
bridge, and enables packets to flow between those ports.

With only two ports, you can make some simplifications, but you should
only disable the separation once both ports are the member of the same
bridge.

	Andrew

