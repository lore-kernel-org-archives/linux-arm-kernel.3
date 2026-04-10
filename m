Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA3FF36BA0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQCt4Wwoz3rOVzWib39MTFIdjKFKjpGJK5lv9tRom+M=; b=mdvZmA3U6WbG6nzfgK65YaEV2b
	APLCj+IYO8WRSafu7rquXKAT+goRq2F94ZtTuuwmO4Fn0odjtuxPOAgKrKH1C/ZULIggNUG1z9KYJ
	JepiaXJ8sJIff3e6r9eSwxuR1eGyj3cXFFtJSbSx031PjV2XqnShwwC9+BRCpvVFeNCoBtaZiWcSK
	cgGPCV7vSc2EAqenH7ygF+kdIdnLzoRY8su1GkWFQ4QE7Av1c/bqVwUZPzu+lC8w3E7VmUTgzon5b
	U6zgR4w/xEOG9ctsj1A9iRgndWKEmLZs7zyUHRguJ+Z3dRI5uXOH6hkImP1f8jpUyXfGbGjw60UyB
	0KUVb9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23r-0000000BV65-1253;
	Fri, 10 Apr 2026 02:57:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23l-0000000BV0h-18Xw;
	Fri, 10 Apr 2026 02:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABE1E60135;
	Fri, 10 Apr 2026 02:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C95C2BCB0;
	Fri, 10 Apr 2026 02:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789848;
	bh=b4xD/+mpr9o9kgl1UA62EmigJZ8lba96RZbJRwa3Yw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lIh0ty76j1L9vhQFe07Do7LogBIS1mmyz8o/oBtcPVH+jwoxWCOrNSMUG7cFFVmBu
	 jjmUV0gRqZZjGJvtjxIJymanqW7ml2hhf5MCDYxymnAq46SfIC5OaaldD1DU+1XwCc
	 SSvkP/60UCX9wwsbsbYXVIdPLIlk5SENmZMmQ5FPNrAuyaoQXQOykvdyBwTHUq7fbI
	 ZeFnFynL4+7XaIykZjyNK+FjRi0biLkJK0e6AIGG7e+BSrMeOz9s19gj/XL+aT1sMd
	 ZKMr0/4i1bblxK4FtnS30UsmhjJjtVGvBj7F8maBJTttiGkV2P+IyOhVyh8zIS2hYx
	 Ch3+98hjue5pA==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next v3 10/12] net: airoha: Do not stop GDM port if it is shared
Date: Thu,  9 Apr 2026 19:57:26 -0700
Message-ID: <20260410025726.1810041-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-10-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-10-ab6ea49d59ff@kernel.org>
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
email says "For your consideration."
---
net: airoha: Do not stop GDM port if it is shared

Theoretically, in the current codebase, two independent net_devices can
be connected to the same GDM port so we need to check the GDM port is not
used by any other running net_device before setting the forward
configuration to FE_PSE_PORT_DROP.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index fd27ba13029bd..5b0cd37b155e4 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1688,18 +1693,18 @@ static int airoha_dev_stop(struct net_device *netdev)
>  	struct airoha_gdm_dev *dev = netdev_priv(netdev);
>  	struct airoha_gdm_port *port = dev->port;
>  	struct airoha_qdma *qdma = dev->qdma;
> -	int i, err;
> +	int i;
>  
>  	netif_tx_disable(netdev);
> -	err = airoha_set_vip_for_gdm_port(dev, false);
> -	if (err)
> -		return err;
> -
>  	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
>  		netdev_tx_reset_subqueue(netdev, i);
>  
> -	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
> -				    FE_PSE_PORT_DROP);
> +	if (atomic_dec_and_test(&port->users)) {
> +		airoha_set_vip_for_gdm_port(dev, false);
> +		airoha_set_gdm_port_fwd_cfg(qdma->eth,
> +					    REG_GDM_FWD_CFG(port->id),
> +					    FE_PSE_PORT_DROP);
> +	}
>  
>  	if (atomic_dec_and_test(&qdma->users)) {
>  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
> 				  GLOBAL_CFG_TX_DMA_EN_MASK |
> 				  GLOBAL_CFG_RX_DMA_EN_MASK);
> 
> 		for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
> 			if (!qdma->q_tx[i].ndesc)
> 				continue;
> 
> 			airoha_qdma_cleanup_tx_queue(&qdma->q_tx[i]);
> 		}
> 	}

This problem wasn't introduced by this patch, but does the QDMA teardown
path have a DMA corruption vulnerability here?

When GLOBAL_CFG_TX_DMA_EN_MASK is cleared, it fails to poll
GLOBAL_CFG_TX_DMA_BUSY_MASK, proceeding to unmap memory while the hardware
DMA engine may still be processing in-flight descriptors.

Furthermore, airoha_qdma_cleanup_tx_queue() unmaps the DMA addresses and
frees the SKBs, but it does not appear to clear the physical hardware
descriptors or reset the hardware ring pointers (REG_TX_CPU_IDX /
REG_TX_DMA_IDX).

When the device is later reopened in airoha_dev_open(),
GLOBAL_CFG_TX_DMA_EN_MASK is set again without re-initializing the rings.
Will the hardware DMA engine resume fetching from its previous index,
processing stale descriptors whose backing memory was already unmapped
and freed?

[ ... ]

> @@ -1851,10 +1856,22 @@ static void airoha_dev_get_stats64(struct net_device *netdev,
>  static int airoha_dev_change_mtu(struct net_device *netdev, int mtu)
>  {
>  	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> +	u32 cur_len, len = ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port = dev->port;
> -	u32 len = ETH_HLEN + mtu + ETH_FCS_LEN;
>  	struct airoha_eth *eth = dev->eth;
>  
> +	cur_len = FIELD_GET(GDM_LONG_LEN_MASK,
> +			    airoha_fe_rr(eth, REG_GDM_LEN_CFG(port->id)));
> +	if (len < cur_len) {
> +		u8 port_refcnt = atomic_read(&port->users);
> +
> +		/* We can decrease the device MTU just if the GDM port is
> +		 * not shared or if the other device is not running.
> +		 */
> +		if (port_refcnt > 1 || (port_refcnt && !netif_running(netdev)))
> +			return -EBUSY;
> +	}
> +

Does this MTU decrease validation create a state trap on shared ports?

If both eth0 and eth1 (sharing a port) are up, and a user increases eth0 MTU
to 9000, the hardware MTU updates to 9000. If the user then tries to lower
eth0 MTU back to 1500, len < cur_len evaluates to true. Because eth1 is also
up (port_refcnt > 1), this returns -EBUSY.

This would prevent either interface from decreasing its MTU without fully
bringing down the sibling interface.

Should the software netdev->mtu be decoupled from the hardware validation,
allowing valid MTU changes in software while dynamically programming the
hardware MTU to the maximum of all currently up interfaces on the shared
port?

