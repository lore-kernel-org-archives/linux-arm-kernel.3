Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEFAC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVOgcIDXslwG7YzEc0WE2zy47deznp5eDRaasdxW1Eo=; b=qEVUUEywFx7F+p8y0qHf9NUF2U
	CC2iXQjRldLBOWIasnBKAYncsRCjtNZuT72RQaAR5dWxIm5/dLb4ZlQWTg0Gmtrb/L2H23z68OS4I
	xT3b9OYbraeWvqf1V+Eb/S5ka3hhELQ1V7EL0Zq7w8T6kFxz2B8q4MEaCdPZ/AS5JUiZ2kgTzWAIK
	rktW019DYhW1dmT/Kc2VCaq1LAEblhe+CxkykrbTWpSCe82SqtaTU+pllsUEBUlHxOmqaKrW7ZNg1
	0guIODBekDy6ezznwpYRXk+BTWUcIfDygfD+tNSPiTSOqFg/FIPEqa/94oiYQOdZDldrnRLsLWnEB
	MaprmzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1x-00000009fPe-3sZk;
	Sat, 08 Aug 2026 19:48:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1q-00000009fM0-0xJ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DB3D43DC9;
	Sat,  8 Aug 2026 19:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D7E1F00A3A;
	Sat,  8 Aug 2026 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786218501;
	bh=PVOgcIDXslwG7YzEc0WE2zy47deznp5eDRaasdxW1Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ICOXrmFF+UrpjC/X8xXdapdZytmK4Q6EzLNZR4M9eBbAzHc0+UJHBneCBKNvXWbWb
	 xzP4/SC4pWxjtoS70JFiae2NBguB213CnFZGqr8gD0x3C2CKKExzMyO/x16r3KAoig
	 Ujme6fspwwSrMHdnnbGrDWRY1B1PLa7d6vsHuEvkxLaIISyhpNoJjJVcSPhQ+eciKQ
	 7XlZBVdBki+OGPJ3kWEeaFuHlAmB+nvYP6q4WqGDfCxSuxY1YcG03WpkY4WKbuXvQE
	 umEB/FaJP5wh4Rcrgba+2/kdpwomUYqayi2nekBPA9OI5QoMx/aV8YcdiaXol3l1d9
	 0xa1KdTw9H4Iw==
From: Jakub Kicinski <kuba@kernel.org>
To: nagadheeraj.rottela@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	srinivas.neeli@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	michal.simek@amd.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	git-dev@amd.com
Subject: Re: [PATCH 04/20] net: xilinx: tsn: parse endpoint DMA channel configuration
Date: Sat,  8 Aug 2026 12:48:20 -0700
Message-ID: <20260808194820.132670-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807104431.157230-5-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-5-nagadheeraj.rottela@amd.com>
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
net: xilinx: tsn: parse endpoint DMA channel configuration

This patch counts the TX and RX MCDMA channels listed in "dma-names",
allocates the conduit netdev with that many hardware queues, and parses the
"tx-queues-config" child node to build a logical TX queue to physical DMA
channel map.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 9b556edf5423..062cb94c2153 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -22,16 +24,32 @@
>  
>  #define DRIVER_NAME			"xilinx_tsn_ep"
>  
> +#define TSN_DMA_CH_INVALID		0xFFU
> +#define TSN_MAX_TX_QUEUE		8
> +#define TSN_MAX_RX_QUEUE		16
> +

[ ... ]

> @@ -72,15 +90,116 @@ static const struct ethtool_ops ep_ethtool_ops = {
>  	.get_drvinfo	= ep_get_drvinfo,
>  };
>  
> +/*
> + * Parse the "tx-queues-config" child of the EP node. The logical queue
> + * index is taken from the "queue<N>" node name, so the mapping does not
> + * depend on the order the child nodes appear in the device tree.
> + */
> +static int ep_parse_tx_queue_config(struct xlnx_tsn_ep *ep,
> +				    struct device_node *txcfg_np)
> +{
> +	DECLARE_BITMAP(chan_seen, TSN_MAX_TX_QUEUE) = {};
> +	DECLARE_BITMAP(queue_seen, TSN_MAX_TX_QUEUE) = {};
> +	unsigned int count = 0;
> +	int ret;
> +
> +	for_each_child_of_node_scoped(txcfg_np, qnode) {
> +		u32 chan, queue;
> +
> +		if (!str_has_prefix(qnode->name, "queue") ||
> +		    kstrtou32(qnode->name + strlen("queue"), 10, &queue) ||
> +		    queue >= ep->num_tx_queues)
> +			return dev_err_probe(ep->dev, -EINVAL,
> +					     "tx-config: invalid queue node %pOFn (have %u queues)\n",
> +					     qnode, ep->num_tx_queues);
> +
> +		if (test_and_set_bit(queue, queue_seen))
> +			return dev_err_probe(ep->dev, -EINVAL,
> +					     "tx-config: queue %u described twice\n",
> +					     queue);
> +
> +		ret = of_property_read_u32(qnode, "xlnx,dma-channel-num", &chan);
> +		if (ret)
> +			return dev_err_probe(ep->dev, ret,
> +					     "tx-config: queue %u missing xlnx,dma-channel-num\n",
> +					     queue);
> +
> +		if (chan >= ep->num_tx_queues)
> +			return dev_err_probe(ep->dev, -EINVAL,
> +					     "tx-config: queue %u channel %u has no matching tx_chan (have %u)\n",
> +					     queue, chan, ep->num_tx_queues);

[Severity: Medium]
Is xlnx,dma-channel-num being validated against the wrong thing here?

The binding in
Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
describes it as the physical TX channel number, with range 0..15:

              xlnx,dma-channel-num:
                $ref: /schemas/types.yaml#/definitions/uint32
                description:
                  DMA TX channel number connected to this priority queue.
                minimum: 0
                maximum: 15

and the tx-queues-config description in the same file spells out an
example:

          transmit packets for each priority queue. For example, queue0
          with xlnx,dma-channel-num set to 5 means priority queue 0 uses
          tx_chan5 for data transfer.

But ep->num_tx_queues is only a count: ep_count_dma_queues() does
str_has_prefix(name, "tx_chan") and increments a counter, so the numeric
suffix of each tx_chan<N> name is never recorded.

So for an endpoint with two TX channels using the binding's own documented
mapping (queue0 with xlnx,dma-channel-num = <5>), does this test reject a
schema-valid device tree with -EINVAL?

Likewise, since the dma-names pattern ^(tx|rx)_chan(1[0-5]|[0-9])$ does not
require channel 0 to exist, would dma-names = "tx_chan4", "tx_chan5", ...
have every legitimate channel number rejected here?

The error string says the channel "has no matching tx_chan", but no name
match is attempted - would it be clearer to record the channel indices
actually listed in dma-names and validate against that set, or else state
in the binding that the value is a 0-based index bounded by the number of
tx_chan entries and that TX channels must be named densely from tx_chan0?

Related: the follow-on patch "net: xilinx: tsn: bring up the endpoint MCDMA
channels" requests channels by a synthesized name:

	snprintf(name, sizeof(name), "tx_chan%d", i);
	ep->tx_chans[i] = ep_alloc_dma_chan(ep, name, true, TX_BD_NUM_DEFAULT);

for i in 0..num_tx_queues-1, so a sparse or non-zero-based naming that the
schema accepts would also make dma_request_chan() fail there.

> +
> +		if (test_and_set_bit(chan, chan_seen))
> +			return dev_err_probe(ep->dev, -EINVAL,
> +					     "tx-config: channel %u already assigned to another queue\n",
> +					     chan);
> +
> +		ep->tx_dma_chan_map[queue] = chan;
> +		count++;
> +	}
> +
> +	if (count != ep->num_tx_queues)
> +		return dev_err_probe(ep->dev, -EINVAL,
> +				     "tx-config: described %u queues but expected %u\n",
> +				     count, ep->num_tx_queues);

[Severity: Low]
Does the binding require exactly one queue node per tx_chan entry?

The tx-queues-config node in xlnx,tsn-endpoint-ethernet-mac.yaml only
constrains the shape of its ^queue[0-7]$ children; it has no required list
and no minimum child count, so a node with fewer queue children than
tx_chan entries (even none) validates.

A device tree with 8 tx_chan entries and 4 queue nodes would then fail
probe with "tx-config: described 4 queues but expected 8".

Separately, xlnx,num-priorities (minimum 2, maximum 8) is in the parent's
required list and is documented as the property that "determines the number
of priority queues available for QoS scheduling", but no driver under
drivers/net/ethernet/xilinx/ reads it - the priority queue count is instead
taken from the dma-names TX count via alloc_netdev_mqs() below.

Should the binding require one queue node per tx_chan entry (with the
driver cross-checking xlnx,num-priorities), or should the driver drop the
exact-equality requirement?

> +
> +	return 0;
> +}
> +
> +static int ep_count_dma_queues(struct device *dev, u32 *out_tx, u32 *out_rx)
> +{
> +	u32 tx = 0, rx = 0;
> +	int n, i;
> +
> +	n = of_property_count_strings(dev->of_node, "dma-names");
> +	if (n < 0)
> +		return dev_err_probe(dev, n, "failed to read dma-names\n");
> +
> +	for (i = 0; i < n; i++) {
> +		const char *name;
> +
> +		if (of_property_read_string_index(dev->of_node, "dma-names",
> +						  i, &name))
> +			continue;
> +		if (str_has_prefix(name, "tx_chan"))
> +			tx++;
> +		else if (str_has_prefix(name, "rx_chan"))
> +			rx++;
> +	}
> +
> +	if (!tx || tx > TSN_MAX_TX_QUEUE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid TX queue count (%u, max %u)\n",
> +				     tx, TSN_MAX_TX_QUEUE);

[Severity: Low]
Is the TX maximum here inconsistent with the binding?

The dma-names schema allows tx_chan0..tx_chan15:

        items:
          pattern: "^(tx|rx)_chan(1[0-5]|[0-9])$"

with maxItems: 32, so 9 to 16 TX channel names validate, while this test
refuses anything above TSN_MAX_TX_QUEUE (8).

The RX side matches (binding maximum 16, TSN_MAX_RX_QUEUE 16), which makes
the TX side the outlier. Since the TX queue nodes are limited to
^queue[0-7]$ and xlnx,num-priorities maxes at 8, more than 8 TX channels
can never be used - should the TX name pattern be narrowed to
tx_chan[0-7], or should the driver accept 16?

> +
> +	if (!rx || rx > TSN_MAX_RX_QUEUE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid RX queue count (%u, max %u)\n",
> +				     rx, TSN_MAX_RX_QUEUE);
> +
> +	*out_tx = tx;
> +	*out_rx = rx;
> +
> +	return 0;
> +}
> +
>  static int xlnx_tsn_ep_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *txcfg_np;
>  	struct net_device *ndev;
>  	struct xlnx_tsn_ep *ep;
>  	u8 mac_addr[ETH_ALEN];
> +	u32 num_tx, num_rx;
>  	int ret;
> +	int i;
>  
> -	ndev = alloc_netdev(sizeof(*ep), "ep", NET_NAME_UNKNOWN, ether_setup);
> +	ret = ep_count_dma_queues(dev, &num_tx, &num_rx);
> +	if (ret)
> +		return ret;
> +
> +	ndev = alloc_netdev_mqs(sizeof(*ep), "ep", NET_NAME_UNKNOWN,
> +				ether_setup, num_tx, num_rx);
>  	if (!ndev)
>  		return -ENOMEM;
>  

[ ... ]

For all three points above, the binding file and both of these functions
are unchanged at the end of the series, so none of them appear to be
resolved by a later patch.

