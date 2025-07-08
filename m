Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17054C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X5BK60lt8yHW2mcPT6pFw1X0evw7hr2NRoNEBvx6z8=; b=xTt3lH+gVcQolUxm2Tu2VESlBS
	WBnG/H1Ac60kUSBB9tdXRg2Mifp7R6ymTRbsuMHAK6s/zcXhywCz5afLEh6YXF1Ir5AxY/FPKIavZ
	bYmQNUI2bzGTAYRBi16CjpILVIIwKm8bI+tDSq43nVwiI/ecUQcle5IuxOZlDLqhqvXP0NogTuae/
	Rwy03cjIkDCvPBsGPw0RReWPgTvIDR+d7uT2iZE+czOj4NgubONueMulshtAEg4zHf5msJWGlf6+8
	zlL+va6cfXu2D5hUezt/djuRrSdqFYz6iyIqnCQIbT3EzzjtMM2Mmv7LXx3ZVrJcX7iV1USeXF0xX
	TT5OVQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Hz-0000000524V-1w4A;
	Tue, 08 Jul 2025 10:11:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4zl-00000004xek-2mEI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751968332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2X5BK60lt8yHW2mcPT6pFw1X0evw7hr2NRoNEBvx6z8=;
	b=FCIIW5hRlKDl0aaxY2Cv4PSpWMxf2T0AB1LjFG9bVejd68fIHNeUQo7422OTdF1vwFDo7W
	iOeErN4c71i/Sq+tNapUhzMJfy6P7232G2RjP33K9vH8t8D0w+CD+rlj44feKhYhEnY/fZ
	26qvTgEljZWmMHGIjfQ6TdlQWNd3rLQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-tOluZP7wMZyW_rehKq4SAg-1; Tue, 08 Jul 2025 05:52:11 -0400
X-MC-Unique: tOluZP7wMZyW_rehKq4SAg-1
X-Mimecast-MFC-AGG-ID: tOluZP7wMZyW_rehKq4SAg_1751968330
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso23274685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 02:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968330; x=1752573130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X5BK60lt8yHW2mcPT6pFw1X0evw7hr2NRoNEBvx6z8=;
        b=pGWZU4JuTBZeRSyFs+pS8zmLRkAE9dHMar1b11BeO7NgoXPpzK8xZEEw5/3nO7ic2P
         jM01L3d1awh9AmFbAwtDrsx+YNlWSqqxSKpIQNWKRv4OAfrQCwZr94Qh1NtgcSQXAbmQ
         GxQaP91R9lPO8NnLK8+OwSvPoF/lo59H49h44K+rlYzNWTmWsGZXR3+FnCxIKyPR8N7d
         qyN5KO1+OIQimbkLxkp5pnWkyoioWBChYnX8cBnxASLzB3gRWmgK+U7YYQSZPcVPPgtJ
         3D+FOVvECj7Xwy87dthEDcQocmcwxGRFaNraPkfdqfwEuffBn3+SSoJmvcHR5DSs4tBD
         Kn1w==
X-Forwarded-Encrypted: i=1; AJvYcCUlQMNsHbN7uK9C5ysB21ReS+Cqr3hDRkYL9q/N/BcBpWT7v+jTyo0O0egTbG1i75x6enWHlItPB3zpV4M7KN4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwmGIaTU0TgiIgDA2p4LEZCiVA0epbbX7a53gn7WLbLiCfMTIVL
	sWU7Ss8oPaiJpdUJ2pQ3gwi7X3lY5UDIx7aar5/KBLPLfFtiw4T4W3vu0a1tmFvmIgvy9JhXfF/
	tgbwGVMTqAdwjTc26IKL7oM4Hd8b4gOPqnHnKEcXUxhb9BQjVBrk6TTmLOi0SFOfJClS3ckAdey
	dI
X-Gm-Gg: ASbGncv87j5ql+aQaqeBRpa7Zt2ZpVWIXuDZCR9UZmTgg/FDTp1VnhGoiEDKCg5u65B
	BCm4qwFuSsEv4UtU+1m9WrLc7x2WA99bwpCEiqfD1sKpyVO7dclVogyDkpIRGn5hwaNWZtyYKff
	pcjIIqa55kubV3TPhjznzq2ixzkzV7OF1Dz6zeW7dW+7bfFqrLmkyi5ZQcL7SQvU6tn0v7R9APD
	lEdUapQCi63fuAEI1Ldgl9WMNyyBz63O6MjU/DyiQ92l28MWs0K1CHocCuE21rY/TjI6WGZoS7p
	Qg028AYJxUCs726mlLP6d8t+KfokRS9W1MhWiFgRgvd2KqX2fjnnEomI/tyo6EiYTJ4Dbg==
X-Received: by 2002:a05:600c:190c:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-454c6531885mr70789235e9.9.1751968329684;
        Tue, 08 Jul 2025 02:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMDOBH0qBMZ6iN2OTX9dqvc0LhZZ2FR75EoU2J03ehS7fOg9IG4eoFaiP/Vpy/EZIcQItAhw==
X-Received: by 2002:a05:600c:190c:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-454c6531885mr70788875e9.9.1751968329162;
        Tue, 08 Jul 2025 02:52:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd45957fsm16437885e9.17.2025.07.08.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:52:08 -0700 (PDT)
Message-ID: <d51a84c7-d534-44cc-88bc-73db8721e50e@redhat.com>
Date: Tue, 8 Jul 2025 11:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 07/12] net: mtip: Add mtip_switch_{rx|tx} functions
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
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-8-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-8-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gLrICdbbGli1qBFfUSO_enPhccqdHyWt0l96qCMPv_4_1751968330
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_025213_781559_A584D041 
X-CRM114-Status: GOOD (  33.00  )
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

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 63afdf2beea6..b5a82748b39b 100644
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
> @@ -825,11 +858,217 @@ static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
>  
>  static void mtip_switch_tx(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct sk_buff *skb;
> +	struct cbd_t *bdp;
> +
> +	spin_lock(&fep->hw_lock);
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
> +	spin_unlock(&fep->hw_lock);
>  }
>  
> +/* During a receive, the cur_rx points to the current incoming buffer.
> + * When we update through the ring, if the next incoming buffer has
> + * not been given to the system, we just set the empty indicator,
> + * effectively tossing the packet.
> + */
>  static int mtip_switch_rx(struct net_device *dev, int budget, int *port)
>  {
> -	return -ENOMEM;
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
> +
> +		if (!fep->usage_count)
> +			goto rx_processing_done;
> +
> +		status ^= BD_ENET_RX_LAST;
> +		/* Check for errors. */
> +		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
> +			      BD_ENET_RX_CR | BD_ENET_RX_OV | BD_ENET_RX_LAST |
> +			      BD_ENET_RX_CL)) {
> +			dev->stats.rx_errors++;
> +			if (status & BD_ENET_RX_OV) {
> +				/* FIFO overrun */
> +				dev->stats.rx_fifo_errors++;
> +				goto rx_processing_done;
> +			}
> +			if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH
> +				      | BD_ENET_RX_LAST)) {
> +				/* Frame too long or too short. */
> +				dev->stats.rx_length_errors++;
> +				if (status & BD_ENET_RX_LAST)
> +					netdev_err(dev, "rcv is not +last\n");
> +			}
> +			if (status & BD_ENET_RX_CR)	/* CRC Error */
> +				dev->stats.rx_crc_errors++;
> +
> +			/* Report late collisions as a frame error. */
> +			if (status & (BD_ENET_RX_NO | BD_ENET_RX_CL))
> +				dev->stats.rx_frame_errors++;
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
> +		net_prefetch(page_address(page));

Both `__va(bdp->cbd_bufaddr)` and `page_address(page)` should point to
the same same memory. Please use constantly one _or_ the other  - likely
page_address(page) is the best option.

> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);
> +
> +		if (data) {

The above check is not needed. If data is null swap_buffer will still
unconditionally dereference it.

Also it looks like it can't be NULL.

/P


