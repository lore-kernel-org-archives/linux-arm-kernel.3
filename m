Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4FC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJETF+d2pLQF55q4eo7VJUmA6BWdkOEFLVhwFcRS2Pc=; b=F7CuDlDulYTjZjqiOlyt2xrLjF
	QJ6MnFycGa3xEsUypnJGbBUQ+J4jorWtHEPDHh1u0w1cFyQpeiT/QlDvo9GvwMNONtW/v7pL8tNNz
	99lCdrnyzDwq0kLy8Yd8aq1ATiw2hQFUz7nWPL4u/oR9IdNAR5kf/ZOrslhO1a3xE/w1VN7IgE/B5
	fFNgmPgFO8UTgzD8A+cKqASJ1Z6n0KrKFY4mPMBvmSaXVbo4UVwqT96o7DilNukrUMi7TyPXU6y9L
	w8iOMsd/fYTJdHUJLLmMRzDkKzGnPK2ZHxs97UDYpcnQVJnIIRUzRiKYcwxO57fTXt5Qx8bpWNqb8
	GayZ2O9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBLi-00000006tLK-3g0d;
	Tue, 24 Jun 2025 21:38:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Aq-00000005oPt-2gCh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750773535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJETF+d2pLQF55q4eo7VJUmA6BWdkOEFLVhwFcRS2Pc=;
	b=UVswQKlYlZAP3KHBj9AuqxoNIiQXg0bvBvzEiXkrDTcRsbj+QNJMu/3chPN7FYJ0TW57ZF
	rZay/FYDIGhwxCnXHMlqrqTdQnB+BALAGJXv2xhU4C0FvkuHhHzYhEHBDbKYqtho7SmVbB
	tX27qeusESrfzkliGogIl3LkfnuOj1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-P1urJRlAOWOzS3-Mq3G_5g-1; Tue, 24 Jun 2025 09:58:54 -0400
X-MC-Unique: P1urJRlAOWOzS3-Mq3G_5g-1
X-Mimecast-MFC-AGG-ID: P1urJRlAOWOzS3-Mq3G_5g_1750773533
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so24112565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773533; x=1751378333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJETF+d2pLQF55q4eo7VJUmA6BWdkOEFLVhwFcRS2Pc=;
        b=C4MBBojgh4q/he9cWuJkhAMpMIjJ5gDw7kc/2S4WjOHBu/VHKDHexjZCA27Vf4ZMdB
         65BIHhAFfscY5fdyw/c1goIP66+1fVG2Ms79DTAI80vtlhxF+O/O27Srd1GSv+gVWHW6
         FpMTtibgcLWJ4E/zBn0Lj6Z5S83N0INTU7dVxhcuEo4u8qDlFN0nqyIzGq4LKymwmU6+
         ZGcO1bqRFrWu2tepGUBs5PlWjPNgPf7diXLYwZl14gVzTQKvlwwRj7hJTLS1crZmVL95
         D7c/fE+qAfUPmHVAnvxYbPd/yf7HBXR4+k47hnMOc/iFUgjXYNvFiB70bAYx6L3EJdkF
         rTKA==
X-Forwarded-Encrypted: i=1; AJvYcCUbAnQjrtAMoQ/Q7ubNOvkDAGt08aq7w6SfQ1qKvV/c+IkZKSpRC1Mmbz+zuZVZSRM6rXXUF9eSLB7MduSisleb@lists.infradead.org
X-Gm-Message-State: AOJu0YzOlQtchwpecd+RlFXiScP1BAb5gNhzoh/bccdneEJeRfbS47BD
	00Skdo6wxrcRa4/MZDmdZYlrkUqVuuGy4hULQfN+kLmfSk5kKfvZKEbPMBdwipJWIHoJiavzm+F
	edMf3dEF4Na2+69l1oJtBbSsYvJ2hPW5pclCK7mDZ74+leaQXhjMa6WSSZkDFIRxd6qo3eOsj8D
	nP
X-Gm-Gg: ASbGncvDOzNBS94d184VcUwFXMTX3COLKSh4GjIXBIoV1RW9vSr92cALo1mT0+dDcay
	zGPH/IENYy256ohQJZeVxAvJ/1sR4ZLyTQIa8nrmSokl7LmV/EqMcKT7FVM7012jWap3rjrmdqO
	LCHPEJVlD6XMNqccOd26z/Gsl7ZbUE8dAHR4AWkw1jBovt6m013y94Dt8QlJM0tNBOAi2Z48+c2
	G9QtHG2QdxXkroqc3D/Q22a3j4px4Z5s4ieMPpGOfWfTTX6LQMRDn1UyzokvY58yz7MQEMZszcZ
	+gVId9oZqzc4NEyrgbEuB8FIuJPDYQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr146030295e9.21.1750773532500;
        Tue, 24 Jun 2025 06:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1le+gfiCWzZWkjf0OUkmAjewnd0L9bTFZ1EQtrZaSsErFSbjeDCSumtctgWYOrMiiFumFTQ==
X-Received: by 2002:a05:600c:1f0e:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-453659ec182mr146030015e9.21.1750773531957;
        Tue, 24 Jun 2025 06:58:51 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d21fsm1997899f8f.23.2025.06.24.06.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:58:51 -0700 (PDT)
Message-ID: <0de412ee-c9ce-463b-92ef-58a33fd132d1@redhat.com>
Date: Tue, 24 Jun 2025 15:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 06/11] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-7-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-7-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fFZww4ohkfGSlyXXiZ3_4Tx21BR1Al4KvGa1AadxDYg_1750773533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065856_755534_949DDAAB 
X-CRM114-Status: GOOD (  41.00  )
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

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> This patch provides mtip_switch_tx and mtip_switch_rx functions
> code for MTIP L2 switch.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v13:
> - New patch - created by excluding some code from large (i.e. v12 and
>   earlier) MTIP driver
> ---
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 813cd39d6d56..a4e38e0d773e 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -228,6 +228,39 @@ struct mtip_port_info *mtip_portinfofifo_read(struct switch_enet_private *fep)
>  	return info;
>  }
>  
> +static void mtip_atable_get_entry_port_number(struct switch_enet_private *fep,
> +					      unsigned char *mac_addr, u8 *port)
> +{
> +	int block_index, block_index_end, entry;
> +	u32 mac_addr_lo, mac_addr_hi;
> +	u32 read_lo, read_hi;
> +
> +	mac_addr_lo = (u32)((mac_addr[3] << 24) | (mac_addr[2] << 16) |
> +			    (mac_addr[1] << 8) | mac_addr[0]);
> +	mac_addr_hi = (u32)((mac_addr[5] << 8) | (mac_addr[4]));
> +
> +	block_index = GET_BLOCK_PTR(crc8_calc(mac_addr));
> +	block_index_end = block_index + ATABLE_ENTRY_PER_SLOT;
> +
> +	/* now search all the entries in the selected block */
> +	for (entry = block_index; entry < block_index_end; entry++) {
> +		mtip_read_atable(fep, entry, &read_lo, &read_hi);
> +		*port = MTIP_PORT_FORWARDING_INIT;
> +
> +		if (read_lo == mac_addr_lo &&
> +		    ((read_hi & 0x0000FFFF) ==
> +		     (mac_addr_hi & 0x0000FFFF))) {
> +			/* found the correct address */
> +			if ((read_hi & (1 << 16)) && (!(read_hi & (1 << 17))))
> +				*port = FIELD_GET(AT_PORT_MASK, read_hi);
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(&fep->pdev->dev, "%s: MAC: %pM PORT: 0x%x\n", __func__,
> +		mac_addr, *port);
> +}
> +
>  /* Clear complete MAC Look Up Table */
>  void mtip_clear_atable(struct switch_enet_private *fep)
>  {
> @@ -820,10 +853,229 @@ static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
>  
>  static void mtip_switch_tx(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +	struct cbd_t *bdp;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

This is called from napi (bh) context, and every other caller is/should
be BH, too. You should use

	spin_lock_bh()

Also please test your patches with CONFIG_LOCKDEP and
CONFIG_DEBUG_SPINLOCK enabled, thet will help finding this king of issues.

/P

> +	bdp = fep->dirty_tx;
> +
> +	while (((status = bdp->cbd_sc) & BD_ENET_TX_READY) == 0) {
> +		if (bdp == fep->cur_tx && fep->tx_full == 0)
> +			break;
> +
> +		dma_unmap_single(&fep->pdev->dev, bdp->cbd_bufaddr,
> +				 MTIP_SWITCH_TX_FRSIZE, DMA_TO_DEVICE);
> +		bdp->cbd_bufaddr = 0;
> +		skb = fep->tx_skbuff[fep->skb_dirty];
> +		/* Check for errors */
> +		if (status & (BD_ENET_TX_HB | BD_ENET_TX_LC |
> +				   BD_ENET_TX_RL | BD_ENET_TX_UN |
> +				   BD_ENET_TX_CSL)) {
> +			dev->stats.tx_errors++;
> +			if (status & BD_ENET_TX_HB)  /* No heartbeat */
> +				dev->stats.tx_heartbeat_errors++;
> +			if (status & BD_ENET_TX_LC)  /* Late collision */
> +				dev->stats.tx_window_errors++;
> +			if (status & BD_ENET_TX_RL)  /* Retrans limit */
> +				dev->stats.tx_aborted_errors++;
> +			if (status & BD_ENET_TX_UN)  /* Underrun */
> +				dev->stats.tx_fifo_errors++;
> +			if (status & BD_ENET_TX_CSL) /* Carrier lost */
> +				dev->stats.tx_carrier_errors++;
> +		} else {
> +			dev->stats.tx_packets++;
> +		}
> +
> +		if (status & BD_ENET_TX_READY)
> +			dev_err(&fep->pdev->dev,
> +				"Enet xmit interrupt and TX_READY.\n");
> +
> +		/* Deferred means some collisions occurred during transmit,
> +		 * but we eventually sent the packet OK.
> +		 */
> +		if (status & BD_ENET_TX_DEF)
> +			dev->stats.collisions++;
> +
> +		/* Free the sk buffer associated with this last transmit */
> +		dev_consume_skb_irq(skb);
> +		fep->tx_skbuff[fep->skb_dirty] = NULL;
> +		fep->skb_dirty = (fep->skb_dirty + 1) & TX_RING_MOD_MASK;
> +
> +		/* Update pointer to next buffer descriptor to be transmitted */
> +		if (status & BD_ENET_TX_WRAP)
> +			bdp = fep->tx_bd_base;
> +		else
> +			bdp++;
> +
> +		/* Since we have freed up a buffer, the ring is no longer
> +		 * full.
> +		 */
> +		if (fep->tx_full) {
> +			fep->tx_full = 0;
> +			if (netif_queue_stopped(dev))
> +				netif_wake_queue(dev);
> +		}
> +	}
> +	fep->dirty_tx = bdp;
> +	spin_unlock_irqrestore(&fep->hw_lock, flags);
>  }
>  
> +/* During a receive, the cur_rx points to the current incoming buffer.
> + * When we update through the ring, if the next incoming buffer has
> + * not been given to the system, we just set the empty indicator,
> + * effectively tossing the packet.
> + */
>  static int mtip_switch_rx(struct net_device *dev, int budget, int *port)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	u8 *data, rx_port = MTIP_PORT_FORWARDING_INIT;
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status, pkt_len;
> +	struct net_device *pndev;
> +	struct ethhdr *eth_hdr;
> +	int pkt_received = 0;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +	struct page *page;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +
> +	/* First, grab all of the stats for the incoming packet.
> +	 * These get messed up if we get called due to a busy condition.
> +	 */
> +	bdp = fep->cur_rx;
> +
> +	while (!((status = bdp->cbd_sc) & BD_ENET_RX_EMPTY)) {
> +		if (pkt_received >= budget)
> +			break;
> +
> +		pkt_received++;
> +		/* Since we have allocated space to hold a complete frame,
> +		 * the last indicator should be set.
> +		 */
> +		if ((status & BD_ENET_RX_LAST) == 0)
> +			dev_warn_ratelimited(&dev->dev,
> +					     "SWITCH ENET: rcv is not +last\n");

Probably you want to break the look when this condition is hit.

> +
> +		if (!fep->usage_count)
> +			goto rx_processing_done;
> +
> +		/* Check for errors. */
> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
> +			      BD_ENET_RX_CR | BD_ENET_RX_OV)) {
> +			dev->stats.rx_errors++;
> +			if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH)) {
> +				/* Frame too long or too short. */
> +				dev->stats.rx_length_errors++;
> +			}
> +			if (status & BD_ENET_RX_NO)	/* Frame alignment */
> +				dev->stats.rx_frame_errors++;
> +			if (status & BD_ENET_RX_CR)	/* CRC Error */
> +				dev->stats.rx_crc_errors++;
> +			if (status & BD_ENET_RX_OV)	/* FIFO overrun */
> +				dev->stats.rx_fifo_errors++;
> +		}
> +
> +		/* Report late collisions as a frame error.
> +		 * On this error, the BD is closed, but we don't know what we
> +		 * have in the buffer.  So, just drop this frame on the floor.
> +		 */
> +		if (status & BD_ENET_RX_CL) {
> +			dev->stats.rx_errors++;
> +			dev->stats.rx_frame_errors++;
> +			goto rx_processing_done;
> +		}
> +
> +		/* Get correct RX page */
> +		page = fep->page[bdp - fep->rx_bd_base];
> +		/* Process the incoming frame */
> +		pkt_len = bdp->cbd_datlen;
> +		data = (__u8 *)__va(bdp->cbd_bufaddr);
> +
> +		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					pkt_len, DMA_FROM_DEVICE);
> +		prefetch(page_address(page));

Use net_prefetch() instead

> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);
> +
> +		if (data) {
> +			eth_hdr = (struct ethhdr *)data;
> +			mtip_atable_get_entry_port_number(fep,
> +							  eth_hdr->h_source,
> +							  &rx_port);
> +			if (rx_port == MTIP_PORT_FORWARDING_INIT)
> +				mtip_atable_dynamicms_learn_migration(fep,
> +								      fep->curr_time,
> +								      eth_hdr->h_source,
> +								      &rx_port);
> +		}
> +
> +		if ((rx_port == 1 || rx_port == 2) && fep->ndev[rx_port - 1])
> +			pndev = fep->ndev[rx_port - 1];
> +		else
> +			pndev = dev;
> +
> +		*port = rx_port;

Do i read correctly that several network device use the same napi
instance? That will break napi assumptions and will incorrectly allow
napi merging packets coming from different devices.

> +
> +		/* This does 16 byte alignment, exactly what we need.
> +		 * The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
> +		if (unlikely(!skb)) {
> +			dev_dbg(&fep->pdev->dev,
> +				"%s: Memory squeeze, dropping packet.\n",
> +				pndev->name);
> +			page_pool_recycle_direct(fep->page_pool, page);
> +			pndev->stats.rx_dropped++;
> +			goto err_mem;
> +		} else {

No need for the else statement above.

/P


