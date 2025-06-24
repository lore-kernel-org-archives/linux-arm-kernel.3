Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FE9C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvwWzJ+xEypawpGYP8KNWgLGz+0unVKUFrWTYj+42lI=; b=NEWskP5l1yVbJu+/cooxY2nZOT
	ADwq30CRmkrimh2woyuaazha+h5lBvniXGf3aBDKEFa3ZWwKgNwMLKwNQGjdXCCZpP1KMp+Ghc/Nr
	ToKxWe3xyh3odriLRZJXCTUAByyDKdYmwt6jLAaRAsy5ZIdaqSqk4oJuO22qcNLymQNcw6xjg3yHF
	3UVMG1awAEy+VhN8y0qaP4oe+NSi2rhLGTOVVCUN3Gd4t+RD8201+DAeBhrMCyPGe6BlByxUvCoNV
	6iCUkN0euQK1L7CCHOkJxa7TphJx5X09dQUvMVJAGj1gueKGWBV8Fa1AHvJVdGYapxnDNr/Shtcfk
	lUMcry0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4PZ-00000005r23-1g68;
	Tue, 24 Jun 2025 14:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3v1-00000005kZJ-0xRB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750772554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvwWzJ+xEypawpGYP8KNWgLGz+0unVKUFrWTYj+42lI=;
	b=BHXsXaBStaPWx1AK3qrc6qkU27kg8DSBeR3wc5UWLHXoG7l+3sISOMoSSl6q8u5LCtwySh
	AZpOf9tl0BxDyCQ6BMWzSbOsEjAC/HFk/C/RKGTTs0NsGDN6celS9JftfYLPnTqhqzdvtZ
	gEfGRpOEi7CFlRXannEBuNDq2CoAQKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-WP3HUFaCMciDtEaVelfTwQ-1; Tue, 24 Jun 2025 09:42:32 -0400
X-MC-Unique: WP3HUFaCMciDtEaVelfTwQ-1
X-Mimecast-MFC-AGG-ID: WP3HUFaCMciDtEaVelfTwQ_1750772551
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450eaae2934so46153655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772551; x=1751377351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvwWzJ+xEypawpGYP8KNWgLGz+0unVKUFrWTYj+42lI=;
        b=PGV8BEm1b1WrB2HyPhlBcVhcFhpy6CRSpyLr0vPOt8ZG4nRG/kwCoUTvQm3CEn70Hj
         kxKFueZMY8SBdvVBsTzcOuy8OFZ77Fsm4DFs6a4zqgJYmbowTkeJPytNS+FrWRGzTIE9
         2oYoIfMyVlsM1mY/DuQxKxu6eKUYWbbM7Zk1srGmb7iyiTWTeyks97r2s7Lyzw2uy/uE
         Y+QxMZ1M870cFU4e2lz4pZoy4DhY2wuYJi+HG4WafGyA/+UhsPY6tbodpyCa+tIF/IvQ
         OGlq1N5bA0bzwMbaX3lXnIFkoCAVItECu79LIQYCz33Mb6dsyGcQUVyQAKwjMA3seQdy
         ixUg==
X-Forwarded-Encrypted: i=1; AJvYcCWFBYYcFUfB/z/zqE5VR8khIgyaWWyq1I5Tn+zx8itRO24k2HYT4OkYE9qFAgmVQz/wGcegI1B9H2xyBGVIcpXO@lists.infradead.org
X-Gm-Message-State: AOJu0YxG9PjXgwSgzHDGSqREXdboYLlV6OBobLZHmfssg32nh01IUeP5
	WzPTOZ3qn0V83Ze8ll42Sdta3feQ+W1ZhiRpdJe8CuL9J8tjza5Zq5LBu5Y8tsE2pn9r19FTgQG
	B+w96njXgthn7swifo0PImrKd0THvEZjIpHxD2IcOQlUC7S97h3wX6z93GNvfB+WBcjvxW5BgG6
	TZ
X-Gm-Gg: ASbGncs+t7Bmp8WbpgFLDhbOQcqQrEpTmfRqe/yCTcVhX5AgowDF+q0xFci1YTcnuXS
	k2soaWRBdKuiBvm6T3T85H1y/8xpIcaKcLf6kILvTD+tCWzNhXha/3HILweaZoUqLrlQCHxtXtf
	Odcnd4dPan4pmVSVtmBvZqRM7WH+ki5gOCcWoKAoZjIKOzfLh28GNrX0qJozAg6OuXc0FkNi5ag
	R9vq+z07QZDgfyFT5+XPqIROoY93m8xsCl7R+V0yk8SRDYbn+xHp/vTlCPnAOv/2pxrA+bj+I+R
	lEGTQty+3AJF+uBRVBOhlukoR8NERw==
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr170383465e9.14.1750772551219;
        Tue, 24 Jun 2025 06:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2Sny+uxCfoL7TQtqauFQPpY8QI669KPmHR2EgF9N41ErRRuNQBKLCDGmFU7bbd2Ddpv4HTQ==
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr170382835e9.14.1750772550636;
        Tue, 24 Jun 2025 06:42:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45374582452sm67189385e9.31.2025.06.24.06.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:42:30 -0700 (PDT)
Message-ID: <c82c19a6-fd0f-4efe-9d93-838b52102ff4@redhat.com>
Date: Tue, 24 Jun 2025 15:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 05/11] net: mtip: Add net_device_ops functions to
 the L2 switch driver
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
 <20250622093756.2895000-6-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-6-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OLlDb5gy8m5uAzbX5SJ4jlIJwYk9_PKn8qkhdvhZWdY_1750772551
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064235_343708_FF8ACC98 
X-CRM114-Status: GOOD (  33.36  )
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
> This patch provides callbacks for struct net_device_ops for MTIP
> L2 switch.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v13:
> - New patch - created by excluding some code from large (i.e. v12 and
>   earlier) MTIP driver
> ---
>  .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 273 ++++++++++++++++++
>  1 file changed, 273 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 5142f647d939..813cd39d6d56 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -43,6 +43,15 @@
>  
>  #include "mtipl2sw.h"
>  
> +static void swap_buffer(void *bufaddr, int len)
> +{
> +	int i;
> +	unsigned int *buf = bufaddr;
> +
> +	for (i = 0; i < len; i += 4, buf++)
> +		swab32s(buf);
> +}
> +
>  /* Set the last buffer to wrap */
>  static void mtip_set_last_buf_to_wrap(struct cbd_t *bdp)
>  {
> @@ -444,6 +453,128 @@ static void mtip_config_switch(struct switch_enet_private *fep)
>  	       fep->hwp + ESW_IMR);
>  }
>  
> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock_bh(&fep->hw_lock);
> +
> +	if (!fep->link[0] && !fep->link[1]) {
> +		/* Link is down or autonegotiation is in progress. */
> +		netif_stop_queue(dev);
> +		spin_unlock_bh(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Fill in a Tx ring entry */
> +	bdp = fep->cur_tx;
> +
> +	status = bdp->cbd_sc;
> +
> +	if (status & BD_ENET_TX_READY) {
> +		/* All transmit buffers are full. Bail out.
> +		 * This should not happen, since dev->tbusy should be set.
> +		 */
> +		netif_stop_queue(dev);
> +		dev_err(&fep->pdev->dev, "%s: tx queue full!.\n", dev->name);
> +		spin_unlock_bh(&fep->hw_lock);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	/* Clear all of the status flags */
> +	status &= ~BD_ENET_TX_STATS;
> +
> +	/* Set buffer length and buffer pointer */
> +	bufaddr = skb->data;
> +	bdp->cbd_datlen = skb->len;
> +
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.spin
> +	 */
> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {
> +		unsigned int index;
> +
> +		index = bdp - fep->tx_bd_base;
> +		memcpy(fep->tx_bounce[index],
> +		       (void *)skb->data, skb->len);
> +		bufaddr = fep->tx_bounce[index];
> +	}
> +
> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +		swap_buffer(bufaddr, skb->len);
> +
> +	/* Save skb pointer. */
> +	fep->tx_skbuff[fep->skb_cur] = skb;
> +
> +	fep->skb_cur = (fep->skb_cur + 1) & TX_RING_MOD_MASK;
> +
> +	/* Push the data cache so the CPM does not get stale memory
> +	 * data.
> +	 */
> +	bdp->cbd_bufaddr = dma_map_single(&fep->pdev->dev, bufaddr,
> +					  MTIP_SWITCH_TX_FRSIZE,
> +					  DMA_TO_DEVICE);
> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
> +		dev_err(&fep->pdev->dev,
> +			"Failed to map descriptor tx buffer\n");
> +		dev->stats.tx_errors++;
> +		dev->stats.tx_dropped++;
> +		dev_kfree_skb_any(skb);
> +		goto err;
> +	}
> +
> +	/* Send it on its way.  Tell FEC it's ready, interrupt when done,
> +	 * it's the last BD of the frame, and to put the CRC on the end.
> +	 */
> +
> +	status |= (BD_ENET_TX_READY | BD_ENET_TX_INTR
> +			| BD_ENET_TX_LAST | BD_ENET_TX_TC);
> +
> +	/* Synchronize all descriptor writes */
> +	wmb();
> +	bdp->cbd_sc = status;
> +
> +	netif_trans_update(dev);
> +	skb_tx_timestamp(skb);
> +
> +	/* Trigger transmission start */
> +	writel(MCF_ESW_TDAR_X_DES_ACTIVE, fep->hwp + ESW_TDAR);
> +
> +	dev->stats.tx_bytes += skb->len;
> +	/* If this was the last BD in the ring,
> +	 * start at the beginning again.
> +	 */
> +	if (status & BD_ENET_TX_WRAP)
> +		bdp = fep->tx_bd_base;
> +	else
> +		bdp++;
> +
> +	if (bdp == fep->dirty_tx) {
> +		fep->tx_full = 1;
> +		netif_stop_queue(dev);

You may want to stop the queue earlier, i.e. when 75% or the like of the
tx ring is full. Also you can use netif_txq_maybe_stop() - with txq ==
netdev_get_tx_queue(dev, 0)

[...]
> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	int i;
> +
> +	dev->stats.tx_errors++;
> +
> +	if (IS_ENABLED(CONFIG_SWITCH_DEBUG)) {
> +		dev_info(&dev->dev, "%s: transmit timed out.\n", dev->name);
> +		dev_info(&dev->dev,
> +			 "Ring data: cur_tx %lx%s, dirty_tx %lx cur_rx: %lx\n",
> +			 (unsigned long)fep->cur_tx,
> +			 fep->tx_full ? " (full)" : "",
> +			 (unsigned long)fep->dirty_tx,
> +			 (unsigned long)fep->cur_rx);
> +
> +		bdp = fep->tx_bd_base;
> +		dev_info(&dev->dev, " tx: %u buffers\n", TX_RING_SIZE);
> +		for (i = 0; i < TX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp, bdp->cbd_sc,
> +				 bdp->cbd_datlen, (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}
> +
> +		bdp = fep->rx_bd_base;
> +		dev_info(&dev->dev, " rx: %lu buffers\n",
> +			 (unsigned long)RX_RING_SIZE);
> +		for (i = 0 ; i < RX_RING_SIZE; i++) {
> +			dev_info(&dev->dev, "  %08lx: %04x %04x %08x\n",
> +				 (kernel_ulong_t)bdp,
> +				 bdp->cbd_sc, bdp->cbd_datlen,
> +				 (int)bdp->cbd_bufaddr);
> +			bdp++;
> +		}

Here you are traversing both rings without any lock, which looks race prone.

/P


