Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F1D35668
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KpcqlOX6KJvogzbqrQOB2kvQnmP3afeB8s3DgpK0xw=; b=rTUTEzg4A+0rFh6ahaO8IHckWV
	0ofdlTl5EI8Z8Ydq4PGE5Imog+2UwxShk11gil0Gb2McQS+OfXOmxk8+NG2eD/J7XaedcZ/935qUU
	56IKi4/AbVdefQLrJQxk+yzNFCAqLpf0v/9LgIjgeMzzIns3uh2aJ4jK2cjrrvVnr7ITWQ7Yk7Nam
	eUyQnB2+zcJPshY1GSYdQfzJwfukLz4HYpHiFi5Jm1Bb4n5cEHpBzI8iZe/g67GxfA4ydy46gzVor
	gWxSKdy8bWgy4upLfOr+lPbt0SAyvz6oEVMb+16oLqXO9pJBCtNsoiLCBOwEWEICYfjr6Q1gr/O+o
	lApVbjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFl-0000000FJ9O-3t4X;
	Wed, 28 Jan 2026 02:25:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFj-0000000FJ9F-23k8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 759F26001A;
	Wed, 28 Jan 2026 02:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34568C116C6;
	Wed, 28 Jan 2026 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769567154;
	bh=Mk9opi2AbVbBe/HXNJ/y7O89/iCTOme85Hdg19/TiCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9o+jUi408eCNacnUmeDFNf/xEWzoBKRpV1QdqJIXBucZXBfPXgHnmbrnld7N2S+z
	 2cA0cXhxrD4M8IZf89k+rndSotQUAPzsCXrOr2PjpXDhl7RvuL+aoqd/39cbtSGFm3
	 oxg9Olnmo+Rvxn6VffmjYcOl9P3i3xL1hwUYJv6LnznKT4tWzdZc/K8RKjy42rOXfh
	 q/97s6dI6PaiEmJmn5uC5N2DuQ5KwbnkK9DTv7SI8EK4t2Z4XuaEs03RH4sPtM9HBl
	 BujDDi5NU/qLb1KrT6Fcl04UD7eXGM+QjOXRqpNbjBPg6ARqWeH74Rp6tFli6loO8B
	 Ykd7K6HZBEAEQ==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	horms@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wahrenst@gmx.net,
	pabeni@redhat.com,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	andrew@lunn.ch
Subject: Re: [net-next,v20,2/7] net: mtip: The L2 switch driver for imx287
Date: Tue, 27 Jan 2026 18:25:49 -0800
Message-ID: <20260128022549.4151341-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126103400.1683125-3-lukasz.majewski@mailbox.org>
References: <20260126103400.1683125-3-lukasz.majewski@mailbox.org>
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: The L2 switch driver for imx287

This patch adds support for the More Than IP L2 switch embedded in the
imx287 SoC. It creates a two-port switch driver that can be used
interchangeably with the FEC driver.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> new file mode 100644
> index 000000000000..03c5163d6508
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static void mtip_netif_stop_queues(struct switch_enet_private *fep)
> +{
> +	for (int i = 0; i < SWITCH_EPORT_NUMBER; i++)
> +		netif_stop_queue(fep->ndev[0]);
                                      ^^^

Should this be fep->ndev[i] instead of fep->ndev[0]? The loop iterates
with variable i but always uses index 0, so port 1's queue is never
stopped.

> +}
> +
> +static void mtip_netif_wake_queues(struct switch_enet_private *fep)
> +{
> +	for (int i = 0; i < SWITCH_EPORT_NUMBER; i++)
> +		netif_wake_queue(fep->ndev[0]);
                                      ^^^

Same here - should this be fep->ndev[i]?

> +}

[ ... ]

> +static int mtip_mii_probe(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev = NULL;
> +	int port_idx = priv->portnum - 1;
> +
> +	if (fep->phy_np[port_idx]) {
> +		phy_dev = of_phy_connect(dev, fep->phy_np[port_idx],
> +					 &mtip_adjust_link, 0,
> +					 fep->phy_interface[port_idx]);
> +		if (!phy_dev) {
> +			netdev_err(dev, "Unable to connect to phy\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	phy_set_max_speed(phy_dev, 100);
                          ^^^^^^^

If fep->phy_np[port_idx] is NULL (no phy-handle in DT for this port),
the if block is skipped and phy_dev remains NULL. Can this cause a NULL
pointer dereference in phy_set_max_speed()?

> +	fep->phy_dev[port_idx] = phy_dev;

[ ... ]

> +static int mtip_parse_of(struct switch_enet_private *fep,
> +			 struct device_node *np)
> +{
> +	struct device_node *p;
> +	unsigned int port_num;
> +	int ret = 0;
> +
> +	p = of_get_child_by_name(np, "ethernet-ports");
> +
> +	for_each_available_child_of_node_scoped(p, port) {
> +		if (of_property_read_u32(port, "reg", &port_num))
> +			continue;
> +
> +		if (port_num > SWITCH_EPORT_NUMBER) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This only validates the upper bound. If the device tree contains
reg = <0>, would fep->mac[port_num - 1] access fep->mac[-1]? Perhaps
the check should also verify port_num is at least 1?

> +			dev_err(&fep->pdev->dev,
> +				"%s: The switch supports up to %d ports!\n",
> +				__func__, SWITCH_EPORT_NUMBER);
> +			goto of_get_err;
> +		}
> +
> +		fep->n_ports = port_num;
> +		ret = of_get_mac_address(port, &fep->mac[port_num - 1][0]);

[ ... ]

> +	ret = mtip_mii_init(fep, pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: Cannot init phy bus (%d)!\n", __func__,
> +			ret);
> +		goto dma_free_coherent_memory;
> +	}
> +
> +	ret = mtip_ndev_init(fep, pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: Failed to create virtual ndev (%d)\n",
> +			__func__, ret);
> +		goto mdiobus_free_memory;
> +	}

[ ... ]

> + mdiobus_free_memory:
> +	mdiobus_free(fep->mii_bus);

mtip_mii_init() calls of_mdiobus_register() which registers the bus.
Should mdiobus_unregister() be called here before mdiobus_free()?
Compare with mtip_mii_remove() which does call mdiobus_unregister().

> + dma_free_coherent_memory:
> +	dma_free_coherent(&fep->pdev->dev, PAGE_SIZE, fep->rx_bd_base,
> +			  fep->bd_dma);
> +	fep->rx_bd_base = NULL;
> +	fep->tx_bd_base = NULL;
> +
> +	return ret;
> +}
> +
> +static void mtip_sw_remove(struct platform_device *pdev)
> +{
> +	struct switch_enet_private *fep = platform_get_drvdata(pdev);
> +
> +	mtip_ndev_cleanup(fep);
> +
> +	mtip_mii_remove(fep);
> +
> +	timer_delete_sync(&fep->timer_mgnt);
> +	platform_set_drvdata(pdev, NULL);
> +}

mtip_sw_probe() allocates DMA memory with dma_alloc_coherent() in
mtip_switch_dma_init(), but mtip_sw_remove() does not appear to free it.
Is this a memory leak on driver removal?
-- 
pw-bot: cr

