Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4D7ECD9BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUdH/x1CAaRsn4Ee9EyZYjDWskMDSSZ27C82vCDOy54=; b=mFRUd+v7Zp83EcyHIk3ckYs6/K
	u/pWxs6lNm6qlC9iSKhH7zzlK/WDJK0hrsAmJnl9qqY/g7yv+ITqFIaN6Srlzsn4MMZc3+shV0JYU
	RE+sW6HWWNwGpLFih0XonRKIEyR19xwrJ7fmspG9L0Ntn8ixN4x1G+LjR7bzVBIK0dQBe7Ta1AL3i
	cioimbVtZuJnlwG1EerLaG1YEltAqZSZCXx7K2cabdEOGDv/udwCcfep+Ag9i/mIOl8yZjBxmRlwt
	qYZ6H2ey8/tNWg6flMF5SXw1fuZjfVbPATGDWFjzbh85PQCdqHsnlEnnZF7DpuUTcTrelj5fGzUuc
	pv+dXTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYX-0000000Al1c-1rR6;
	Fri, 06 Feb 2026 02:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYV-0000000Al1E-0ijo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5463444EE;
	Fri,  6 Feb 2026 02:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC99CC4CEF7;
	Fri,  6 Feb 2026 02:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770344805;
	bh=4qPaqb0aOYjpeDtbgDXCpqKQsP3lR0Pf36lTaq1kiBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=je7HVDGFE0hcT8cVZD/T8uXMz8pQQqDlMZd95T1gMzNt/ixaNmncGpygfKjD95IfV
	 N0RI9P5auBeyI3I0+aEXQaeyDzKplMlyA55rKBfgY6yE/U6wQfpn04b58roj4tmAmv
	 t3eGbhE6k4INPGXcM/ngpTDK7Ap3yBxq/FLJQ/Bwf9ZiJZuWrr8Ar6alHvpg9cF63l
	 UApZ2LNOWGItsTVuoKQsbNgL97BHd+4nXNeDIoUZUxvdY3Yu8M/9yWrd6mb2JBvZDo
	 jJzBQj0+nYxI0j70IXeKMFQ64KTsP/8QJfAwayfCWpcdxySW9Cdv49eflGd9cAmii2
	 hOQDkDKbrkwyw==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	imx@lists.linux.dev,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	davem@davemloft.net,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	festevam@gmail.com,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wahrenst@gmx.net,
	richardcochran@gmail.com,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	edumazet@google.com,
	robh@kernel.org
Subject: Re: [net-next,v23,4/7] net: mtip: Add net_device_ops functions to the L2 switch driver
Date: Thu,  5 Feb 2026 18:26:43 -0800
Message-ID: <20260206022643.3197165-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204232135.1024665-5-lukasz.majewski@mailbox.org>
References: <20260204232135.1024665-5-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_182647_339125_2442A06F 
X-CRM114-Status: GOOD (  27.43  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: Add net_device_ops functions to the L2 switch driver

This patch provides callbacks for struct net_device_ops for MTIP L2
switch.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index d209501a99b0..4c64681602d6 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> @@ -618,6 +741,73 @@ static void mtip_switch_restart(struct net_device *dev, int duplex0,
>  	mtip_config_switch(fep);
>  }
>
> +static void mtip_print_hw_state(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	bool tx_full;
> +	int i;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +	tx_full = fep->dirty_tx == fep->cur_tx &&
> +		mtip_netif_queues_stopped(fep);
> +
> +	dev_info(&dev->dev, "%s: transmit timed out.\n", dev->name);
> +	dev_info(&dev->dev,
> +		 "Ring data: cur_tx 0x%p%s, dirty_tx 0x%p cur_rx: 0x%p\n",
> +		 fep->cur_tx, tx_full ? " (full)" : "", fep->dirty_tx,
> +		 fep->cur_rx);
> +
> +	bdp = fep->tx_bd_base;
> +	dev_info(&dev->dev, " tx: %u buffers\n", TX_RING_SIZE);
> +	for (i = 0; i < TX_RING_SIZE; i++) {
> +		dev_info(&dev->dev, "  0x%p: %04x %04x %08x\n",
> +			 bdp, bdp->cbd_sc, bdp->cbd_datlen,
> +			 (int)bdp->cbd_bufaddr);
> +		bdp++;
> +	}
> +
> +	bdp = fep->rx_bd_base;
> +	dev_info(&dev->dev, " rx: %lu buffers\n", RX_RING_SIZE);
> +	for (i = 0 ; i < RX_RING_SIZE; i++) {
> +		dev_info(&dev->dev, "  0x%p: %04x %04x %08x\n",
> +			 bdp, bdp->cbd_sc, bdp->cbd_datlen,
> +			 (int)bdp->cbd_bufaddr);
> +		bdp++;
> +	}
> +	spin_unlock_bh(&fep->hw_lock);
> +}
> +
> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +
> +	DO_ONCE(mtip_print_hw_state, dev);
> +
> +	schedule_work(&priv->tx_timeout_work);
              ^^^^

This isn't a regression, but as noted in your v22 response, timeouts are
already counted by the network stack and exposed per-queue in sysfs. Does
this driver need additional counting beyond what the stack provides?

> +}
> +
> +static void mtip_timeout_work(struct work_struct *work)
> +{
> +	struct mtip_ndev_priv *priv =
> +		container_of(work, struct mtip_ndev_priv, tx_timeout_work);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct net_device *dev = priv->dev;
> +
> +	rtnl_lock();
> +	if (netif_device_present(dev) || netif_running(dev)) {
> +		napi_disable(&fep->napi);
> +		netif_tx_lock_bh(dev);
> +		mtip_switch_restart(dev, fep->full_duplex[0],
> +				    fep->full_duplex[1]);
> +		netif_tx_wake_all_queues(dev);
> +		netif_tx_unlock_bh(dev);
> +		napi_enable(&fep->napi);
> +	}
> +	rtnl_unlock();
> +}

[ ... ]

> @@ -1096,6 +1286,92 @@ static int mtip_close(struct net_device *dev)
>  	return 0;
>  }
>
> +#define FEC_HASH_BITS	6		/* #bits in hash */
> +static void mtip_set_multicast_list(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	unsigned int hash_high = 0, hash_low = 0, crc;
> +	struct switch_enet_private *fep = priv->fep;
> +	void __iomem *enet_addr = fep->enet_addr;
> +	struct netdev_hw_addr *ha;
> +	unsigned char hash;
> +
> +	if (priv->portnum == 2)
> +		enet_addr += MCF_ESW_ENET_PORT_OFFSET;
> +
> +	if (dev->flags & IFF_PROMISC) {
> +		/* Promisc mode is required for switch - it is
> +		 * already enabled during driver's probe.
> +		 */
> +		dev_dbg(&dev->dev, "%s: IFF_PROMISC\n", __func__);
> +		return;
> +	}
> +
> +	if (dev->flags & IFF_ALLMULTI) {
> +		dev_dbg(&dev->dev, "%s: IFF_ALLMULTI\n", __func__);
> +
> +		/* Allow all multicast addresses */
> +		writel(0xFFFFFFFF, enet_addr + MCF_FEC_GRP_HASH_TABLE_HIGH);
> +		writel(0xFFFFFFFF, enet_addr + MCF_FEC_GRP_HASH_TABLE_LOW);
> +
> +		return;
> +	}
> +
> +	netdev_for_each_mc_addr(ha, dev) {
> +		/* Calculate crc32 value of mac address */
> +		crc = ether_crc_le(dev->addr_len, ha->addr);
> +
> +		/* Only upper 6 bits (FEC_HASH_BITS) are used
> +		 * which point to specific bit in the hash registers
> +		 */
> +		hash = (crc >> (32 - FEC_HASH_BITS)) & 0x3F;
> +
> +		if (hash > 31)
> +			hash_high |= 1 << (hash - 32);
> +		else
> +			hash_low |= 1 << hash;
> +	}
> +
> +	writel(hash_high, enet_addr + MCF_FEC_GRP_HASH_TABLE_HIGH);
> +	writel(hash_low, enet_addr + MCF_FEC_GRP_HASH_TABLE_LOW);
> +}
> +
> +static int mtip_set_mac_address(struct net_device *dev, void *p)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	void __iomem *enet_addr = fep->enet_addr;
> +	struct sockaddr *addr = p;
> +
> +	if (!is_valid_ether_addr(addr->sa_data))
> +		return -EADDRNOTAVAIL;
> +	eth_hw_addr_set(dev, addr->sa_data);
> +
> +	if (priv->portnum == 2)
> +		enet_addr += MCF_ESW_ENET_PORT_OFFSET;
> +
> +	writel(dev->dev_addr[3] | (dev->dev_addr[2] << 8) |
> +	       (dev->dev_addr[1] << 16) | (dev->dev_addr[0] << 24),
> +	       enet_addr + MCF_FEC_PALR);
> +	writel((dev->dev_addr[5] << 16) | (dev->dev_addr[4] << 24),
> +	       enet_addr + MCF_FEC_PAUR);
> +
> +	return mtip_update_atable_static((unsigned char *)dev->dev_addr,
> +					 7, 7, fep);
                                         ^^^^

If mtip_update_atable_static() returns an error (like -ENOSPC when the
address table is full), the device MAC address has already been updated
by eth_hw_addr_set() and the hardware registers have been written.

This leaves the system with a MAC address in dev->dev_addr and the
hardware registers that isn't in the switch's address table. Should the
MAC address change be rolled back on error, or should the address table
be updated first before committing the MAC change?

> +}

[ ... ]

> @@ -1210,6 +1492,8 @@ static int mtip_ndev_init(struct switch_enet_private *fep,
>  			goto cleanup_created_ndev;
>  		}
>
> +		INIT_WORK(&priv->tx_timeout_work, mtip_timeout_work);
                 ^^^^

Could there be a race if a TX timeout occurs between register_netdev()
(which happens a few lines above at line 1488) and INIT_WORK() here?

At line 1478, netdev_ops is set to &mtip_netdev_ops which includes
.ndo_tx_timeout = mtip_timeout. Then register_netdev() is called at line
1488, making the device active. If a TX timeout occurs before
INIT_WORK() initializes the work struct, mtip_timeout() would call
schedule_work() on an uninitialized work struct.

Should INIT_WORK() be moved before register_netdev()?

> +
>  		dev_dbg(&fep->ndev[i]->dev, "%s: MTIP eth L2 switch %pM\n",
>  			fep->ndev[i]->name, fep->ndev[i]->dev_addr);
>  	}

