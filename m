Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DB5CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIZRJWfB9uIoT21u274B0cnlZ9ADp5gVESO1zB5LtY0=; b=YK0ajuAEju4YSrOWxLKIvMh2IR
	4mOl7VA5Gt0akhfHB9FyPDhPqY0xIf5DfgP/vcSoLMFhiKf2xan9UgfSCAr7h2L6Jpc1xZrCKLc7X
	zyuOL2xntcos1qEeA77GDA/Fm0MDtsVNcj/RaHmO/DoXzCjLTzoKxtukmep7ayBD9aLqaO305oh8Q
	MQf8ZhmqXrTtEvfAybSTDAj83CFiG9LseXN8IRvjNXyt/D1uwvjGSxE1mGY21YOR/lbQkDmz+CedE
	Pu/I/P11Tm9CO6ZaV69pfqYgPcn8vrOZmvjXMPUbXGYRoCsn9uhw26Y215qvPq3ff8l15Whq8cDzk
	AKB+vrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9E-0000000HZCn-039a;
	Fri, 05 Jun 2026 02:19:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9C-0000000HZBr-1SUX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 02:18:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8A22600B0;
	Fri,  5 Jun 2026 02:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D20B41F00899;
	Fri,  5 Jun 2026 02:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625937;
	bh=mIZRJWfB9uIoT21u274B0cnlZ9ADp5gVESO1zB5LtY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SnaSb2a1NiGHKTNUDDVS/xqHJAY6OKx82UAQ6E8istkspZEghE6Lr1pXt40a3G1+N
	 coX3EKFfTlYu2Q7zgoJpqob88M/Zl8yJx5JOuzSE0m/i/LQCFDxHrv0gofIciiyj0e
	 0kdOOXHnFVZ9c1863hF8sUwzlnwJ0F8khi4oI0rgmL1pXgSnYQrIYknCK80+FAyuli
	 EfLcMlBLYeDOn0gJbycNJ5YoEF7BAVNooKBjioXeE8BaXviHhZGeWx4VkB4gl6aL+E
	 JPSXYKwWGiVcUxtdAY5agkHqu8A+xBMf1E0DZdFVB8ck0NoU3h/WZvpo2CEK+N8A5x
	 Gw8uX74FTenkg==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	lgirdwood@gmail.com,
	nathan@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	krzk+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org
Subject: Re: [net-next v24 4/7] net: mtip: Add net_device_ops functions to the L2 switch driver
Date: Thu,  4 Jun 2026 19:18:55 -0700
Message-ID: <20260605021855.3594587-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601112437.2216043-5-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-5-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
net: mtip: Add net_device_ops functions to the L2 switch driver

This patch adds the ndo_start_xmit, ndo_set_rx_mode, ndo_tx_timeout,
ndo_set_mac_address, and ndo_get_port_parent_id callbacks to the MTIP
L2 switch driver, along with helpers and a tx_timeout work item.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 5b5229ee411d..7dfeda230e3f 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> @@ -617,6 +740,76 @@ static void mtip_switch_restart(struct net_device *dev, int duplex0,
>  	mtip_config_switch(fep);
>  }
>  
> +static void mtip_print_hw_state(struct net_device *dev)
> +{

[ ... ]

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

[High]
Should the guard here be a logical AND rather than OR?

	if (netif_device_present(dev) || netif_running(dev)) {

netif_device_present() returns true unless netif_device_detach() has been
called, and this driver never calls netif_device_detach().  So the OR
collapses to "always true" once the device has been registered, and the
work proceeds even after mtip_close().

mtip_close() does this on the last close:

	if (fep->usage_count == 1) {
		napi_disable(&fep->napi);
		netif_napi_del(&fep->napi);
		mtip_free_buffers(dev);
		clk_disable(fep->clk_ipg);
	}

After that, can mtip_timeout_work() running due to a previously scheduled
watchdog still call napi_disable(&fep->napi) / napi_enable(&fep->napi) on
a netif_napi_del()'d napi, and call mtip_switch_restart() which writes
hardware registers after clk_ipg has been disabled?

Would gating the work on fep->usage_count (and/or cancel_work_sync() in
mtip_close()) be more correct than the present netif_device_present() ||
netif_running() check?

[ ... ]

> @@ -1095,6 +1288,98 @@ static int mtip_close(struct net_device *dev)
>  	return 0;
>  }
>  
> +#define FEC_HASH_BITS	6		/* #bits in hash */

[ ... ]

> +static int mtip_set_mac_address(struct net_device *dev, void *p)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	void __iomem *enet_addr = fep->enet_addr;
> +	struct sockaddr *addr = p;
> +	int ret;
> +
> +	if (!is_valid_ether_addr(addr->sa_data))
> +		return -EADDRNOTAVAIL;
> +
> +	ret = mtip_update_atable_static((unsigned char *)addr->sa_data,
> +					7, 7, fep);
> +	if (ret)
> +		return ret;

[Medium]
Is the previously-programmed MAC ever removed from the switch's static
address table?  mtip_update_atable_static() either updates a matching
entry in place or fills the first empty slot in an 8-entry block:

	for (entry = block_index; entry < index_end; entry++) {
		mtip_read_atable(fep, entry, &read_lo, &read_hi);
		if (read_lo == write_lo &&
		    ((read_hi & 0x0000FFFF) ==
		     (write_hi & 0x0000FFFF))) {
			mtip_write_atable(fep, entry, write_lo, write_hi);
			...
			return 0;
		} else if (!(read_hi & (1 << 16))) {
			mtip_write_atable(fep, entry, write_lo, write_hi);
			...
			return 0;
		}
	}
	...
	return -ENOSPC;

After 8 distinct MAC changes whose CRC8 maps to the same block, will
further mtip_set_mac_address() calls return -ENOSPC, and will the stale
MACs continue to be honored as static entries with port mask 7 and
priority 7?

> +
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
> +	return 0;
> +}

[Medium]
Should fep->mac[priv->portnum - 1] be updated here as well?  The driver
caches the MAC in fep->mac[] and mtip_get_port_parent_id() reads
fep->mac[0] as the parent identifier.  After a userspace MAC change
fep->mac[] stays at its boot/DT value, so ndo_get_port_parent_id keeps
returning the old value while dev->dev_addr and the hardware registers
have moved on.

[Medium]
Does this sequence need to disable the controller before reprogramming
PALR/PAUR?  mtip_configure_enet_mii() programs ECR to MAGIC_ENA only
(no ETHER_EN), then writes PALR/PAUR, then enables ETHER_EN at the end:

	writel(MCF_FEC_ECR_MAGIC_ENA, enet_addr + MCF_FEC_ECR);
	...
	writel(... , enet_addr + MCF_FEC_PALR);
	writel(... , enet_addr + MCF_FEC_PAUR);
	...
	writel(readl(enet_addr + MCF_FEC_ECR) | MCF_FEC_ECR_ETHER_EN,
	       enet_addr + MCF_FEC_ECR);

mtip_set_mac_address() writes PALR and PAUR while ETHER_EN can be set
and traffic is being matched, and it does not take fep->hw_lock either,
so it can race with mtip_configure_enet_mii() / mtip_switch_restart()
that touch the same register block.  Is that intended?

> +
> +static int mtip_get_port_parent_id(struct net_device *ndev,
> +				   struct netdev_phys_item_id *ppid)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(ndev);
> +	struct switch_enet_private *fep = priv->fep;
> +
> +	ppid->id_len = sizeof(fep->mac[0]);
> +	memcpy(&ppid->id, &fep->mac[0], ppid->id_len);
> +
> +	return 0;
> +}

[Medium]
Is fep->mac[0] a suitable choice for the switch parent id?  fep->mac[]
is populated only from DT via of_get_mac_address() in mtip_parse_of();
when DT does not supply a mac-address for port 1, fep->mac[0] stays
zeroed (it is kzalloc'd in probe), since mtip_setup_mac()'s bootloader
and random-MAC fallbacks update dev->dev_addr only and never write back
into fep->mac[].

If two MTIP switches both lack a DT MAC for port 1, both will report
ppid = 00:00:00:00:00:00, which switchdev/bridge code will treat as the
same switch (offload_fwd_mark, bridge offload decisions).

Would a switch-wide identifier (a register-derived id, the platform
of_node phandle, etc.) be more appropriate than a port MAC?

[ ... ]

> @@ -1158,10 +1448,14 @@ static int mtip_switch_dma_init(struct switch_enet_private *fep)
>  
>  static void mtip_ndev_cleanup(struct switch_enet_private *fep)
>  {
> +	struct mtip_ndev_priv *priv;
>  	int i;
>  
>  	for (i = 0; i < SWITCH_EPORT_NUMBER; i++) {
>  		if (fep->ndev[i]) {
> +			priv = netdev_priv(fep->ndev[i]);
> +			cancel_work_sync(&priv->tx_timeout_work);
> +
>  			unregister_netdev(fep->ndev[i]);
>  			free_netdev(fep->ndev[i]);
>  			fep->ndev[i] = NULL;

[High]
Is the order here safe against the netdev TX watchdog?  The watchdog
timer is only stopped inside unregister_netdev() (via dev_deactivate),
so between cancel_work_sync() returning and unregister_netdev() actually
disarming the watchdog the timer can still fire mtip_timeout(), which
calls schedule_work(&priv->tx_timeout_work) and re-queues the work that
was just drained.

After unregister_netdev() and free_netdev() complete, priv (which embeds
tx_timeout_work) is freed, and when the worker thread later picks up
the queued work it will dereference a freed priv/fep.

Would the sequence

	unregister_netdev(fep->ndev[i]);
	cancel_work_sync(&priv->tx_timeout_work);
	free_netdev(fep->ndev[i]);

be safer, since unregister_netdev() quiesces all sources of new work
before cancel_work_sync() drains what remains?  The same concern applies
to the rollback path in mtip_ndev_init() for ports whose watchdog is
already active.

