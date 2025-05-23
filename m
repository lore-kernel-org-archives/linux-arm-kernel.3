Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC4AC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqYcc7RAH3L3qXW8h+9jH0kK0v745MDC6DUdwNHLo7M=; b=GYlY9GRhrBpek3HhBtB9KqRrEU
	OFVYtkePeMoLtQBTH8FRO3akOQPPdR+b9V9Mnb+6ET5AGrj9SwUaYPPTY5sIVbYmN/aV90q2cqtYq
	g8DqG4UgjrlQMEbADVL4/v35Cua4CqsxM5fVjIcgqMrmDLRG34tiNUFbmK3+KJFCZCRDhWLmSZuFm
	ur7pv56UzBgA313Ku6bW6ymF6A9nylqF3Swodb+6eAHA7JDfbpOWkimQdK/+6s+xUbj5e7ZsQDEX9
	ZYgganMUxGm51OuFOEifn/DkFkOeTlgaIf/G3ssw6ZD7EIQ6V3IgybkAr/vgfJ9qaXVveySsi4qQm
	gC3psaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVYb-00000004Ri4-1O4F;
	Fri, 23 May 2025 16:47:41 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV8M-00000004NSW-3Owf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:20:37 +0000
Message-ID: <57443336-2098-42c9-be6d-468cdbd9b312@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748017230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EqYcc7RAH3L3qXW8h+9jH0kK0v745MDC6DUdwNHLo7M=;
	b=aYBb8WPxMh1tdXa3jnwRwsd/FS5Q+vtqK13Hna190/W1z6kwQ/GTIW6Iqn97e6P/EGBDfU
	/GJ3WUyRfHkpElC6S9AB7d8ow9lfNsIyycZrc+j+xIrrA4aibhC1tgfjSUxvDdK6wxZ0iJ
	WyCi9JzSdI41Kdzbiqks1wYLnIV2wR0=
Date: Fri, 23 May 2025 12:20:26 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net] net: xilinx: axienet: Fix Tx skb circular buffer
 occupancy check in dmaengine xmit
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
References: <20250521181608.669554-1-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250521181608.669554-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_092035_805644_E964001C 
X-CRM114-Status: GOOD (  14.28  )
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

On 5/21/25 14:16, Suraj Gupta wrote:
> In Dmaengine flow, driver maintains struct skbuf_dma_descriptor rings each
> element of which corresponds to a skb. In Tx datapath, compare available
> space in skb ring with number of skbs instead of skb fragments.
> Replace x * (MAX_SKB_FRAGS) in netif_txq_completed_wake() and
> netif_txq_maybe_stop() with x * (1 skb) to fix the comparison.
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1b7a653c1f4e..6011d7eae0c7 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -880,7 +880,7 @@ static void axienet_dma_tx_cb(void *data, const struct dmaengine_result *result)
>  	dev_consume_skb_any(skbuf_dma->skb);
>  	netif_txq_completed_wake(txq, 1, len,
>  				 CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
> -				 2 * MAX_SKB_FRAGS);
> +				 2);
>  }
>  
>  /**
> @@ -914,7 +914,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>  
>  	dma_dev = lp->tx_chan->device;
>  	sg_len = skb_shinfo(skb)->nr_frags + 1;
> -	if (CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX) <= sg_len) {
> +	if (CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX) <= 1) {
>  		netif_stop_queue(ndev);
>  		if (net_ratelimit())
>  			netdev_warn(ndev, "TX ring unexpectedly full\n");
> @@ -964,7 +964,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>  	txq = skb_get_tx_queue(lp->ndev, skb);
>  	netdev_tx_sent_queue(txq, skb->len);
>  	netif_txq_maybe_stop(txq, CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
> -			     MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS);
> +			     1, 2);
>  
>  	dmaengine_submit(dma_tx_desc);
>  	dma_async_issue_pending(lp->tx_chan);

Reviwed-by: Sean Anderson <sean.anderson@linux.dev>

