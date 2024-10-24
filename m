Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E229D0BB4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVgoIaDu3a4uA7dKxjkeP2UOxgCvLj7AFtqJcyyqZug=; b=n88RupeJebec8Gz/XdsUE2Am3i
	tSVHN3b87TXzr38XnICIYEfy24exDpJeG7EZOl2l3SpmupirF7RLUpD3devVBoSrLIs90y+/CpoYB
	ahO10drcJITx5AFEGjssBI/o2zTki49SnZsSV6VKEAyXpWEZMMahG4ossx6Nfo/EgnWuTk9+QUyzG
	4bBGU8wSPWSnZGt/OL/W3+UdFMpEGUY9IBtFUFUMGBwtCciL1chBmKpnmu0ImSOSNjivf9EVfOj0b
	KlVkT5SJmTnJGDuM6H3tiIXPEoEiMJmrzg+pu6V+wI/6ryD7QQ1AQ26qBGbbxU/JKo+I8DoSlQ4eW
	sTZujx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3m8p-0000000GMD7-0fIB;
	Thu, 24 Oct 2024 00:55:57 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3m7F-0000000GLwC-2Uv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 00:54:19 +0000
Message-ID: <24147551-b639-4f9f-be5e-def2570a863d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729731254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVgoIaDu3a4uA7dKxjkeP2UOxgCvLj7AFtqJcyyqZug=;
	b=o4K/xXRxT7AUFPwBCSjwf44lTQOHULpN9EbY4czS5zwWDveZVONFNXcb/9na/RgypdxIph
	M9TrJanBk1TnRVtHOnyIFZn475xpRdqBWaSEMV1XTB4oZ4DnH77RdDhs8KCfUTVXORbfeA
	3oEgq4Z96J+6r5TMClGOLTyFSz5LWp8=
Date: Thu, 24 Oct 2024 01:54:09 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 10/15] net: lan969x: add PTP handler function
To: Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, horatiu.vultur@microchip.com,
 jensemil.schulzostergaard@microchip.com,
 Parthiban.Veerasooran@microchip.com, Raju.Lakkaraju@microchip.com,
 UNGLinuxDriver@microchip.com, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jacob.e.keller@intel.com,
 ast@fiberby.net, maxime.chevallier@bootlin.com, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
 <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_175417_977512_1B9501AC 
X-CRM114-Status: GOOD (  24.32  )
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

On 23/10/2024 23:01, Daniel Machon wrote:
> Add PTP IRQ handler for lan969x. This is required, as the PTP registers
> are placed in two different targets on Sparx5 and lan969x. The
> implementation is otherwise the same as on Sparx5.
> 
> Also, expose sparx5_get_hwtimestamp() for use by lan969x.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>   drivers/net/ethernet/microchip/lan969x/lan969x.c   | 90 ++++++++++++++++++++++
>   .../net/ethernet/microchip/sparx5/sparx5_main.h    |  5 ++
>   drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  9 +--
>   3 files changed, 99 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> index 2c2b86f9144e..a3b40e09b947 100644
> --- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
> +++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
> @@ -201,6 +201,95 @@ static int lan969x_port_mux_set(struct sparx5 *sparx5, struct sparx5_port *port,
>   	return 0;
>   }
>   
> +static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
> +{
> +	int budget = SPARX5_MAX_PTP_ID;
> +	struct sparx5 *sparx5 = args;
> +
> +	while (budget--) {
> +		struct sk_buff *skb, *skb_tmp, *skb_match = NULL;
> +		struct skb_shared_hwtstamps shhwtstamps;
> +		struct sparx5_port *port;
> +		struct timespec64 ts;
> +		unsigned long flags;
> +		u32 val, id, txport;
> +		u32 delay;
> +
> +		val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
> +
> +		/* Check if a timestamp can be retrieved */
> +		if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
> +			break;
> +
> +		WARN_ON(val & PTP_TWOSTEP_CTRL_PTP_OVFL);
> +
> +		if (!(val & PTP_TWOSTEP_CTRL_STAMP_TX))
> +			continue;
> +
> +		/* Retrieve the ts Tx port */
> +		txport = PTP_TWOSTEP_CTRL_STAMP_PORT_GET(val);
> +
> +		/* Retrieve its associated skb */
> +		port = sparx5->ports[txport];
> +
> +		/* Retrieve the delay */
> +		delay = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
> +		delay = PTP_TWOSTEP_STAMP_NSEC_NS_GET(delay);
> +
> +		/* Get next timestamp from fifo, which needs to be the
> +		 * rx timestamp which represents the id of the frame
> +		 */
> +		spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
> +			 PTP_TWOSTEP_CTRL_PTP_NXT,
> +			 sparx5, PTP_TWOSTEP_CTRL);
> +
> +		val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
> +
> +		/* Check if a timestamp can be retrieved */
> +		if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
> +			break;
> +
> +		/* Read RX timestamping to get the ID */
> +		id = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
> +		id <<= 8;
> +		id |= spx5_rd(sparx5, PTP_TWOSTEP_STAMP_SUBNS);
> +
> +		spin_lock_irqsave(&port->tx_skbs.lock, flags);
> +		skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
> +			if (SPARX5_SKB_CB(skb)->ts_id != id)
> +				continue;
> +
> +			__skb_unlink(skb, &port->tx_skbs);
> +			skb_match = skb;
> +			break;
> +		}
> +		spin_unlock_irqrestore(&port->tx_skbs.lock, flags);
> +
> +		/* Next ts */
> +		spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
> +			 PTP_TWOSTEP_CTRL_PTP_NXT,
> +			 sparx5, PTP_TWOSTEP_CTRL);
> +
> +		if (WARN_ON(!skb_match))
> +			continue;
> +
> +		spin_lock(&sparx5->ptp_ts_id_lock);
> +		sparx5->ptp_skbs--;
> +		spin_unlock(&sparx5->ptp_ts_id_lock);
> +
> +		/* Get the h/w timestamp */
> +		sparx5_get_hwtimestamp(sparx5, &ts, delay);
> +
> +		/* Set the timestamp in the skb */
> +		shhwtstamps.hwtstamp = ktime_set(ts.tv_sec, ts.tv_nsec);
> +		skb_tstamp_tx(skb_match, &shhwtstamps);
> +
> +		dev_kfree_skb_any(skb_match);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +

This handler looks like an absolute copy of sparx5_ptp_irq_handler()
with the difference in registers only. Did you consider keep one
function but substitute ptp register sets?

>   static const struct sparx5_regs lan969x_regs = {
>   	.tsize = lan969x_tsize,
>   	.gaddr = lan969x_gaddr,
> @@ -242,6 +331,7 @@ static const struct sparx5_ops lan969x_ops = {
>   	.get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
>   	.get_sdlb_group          = &lan969x_get_sdlb_group,
>   	.set_port_mux            = &lan969x_port_mux_set,
> +	.ptp_irq_handler         = &lan969x_ptp_irq_handler,
>   };
>   

