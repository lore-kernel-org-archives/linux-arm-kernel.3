Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB3F54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9HnuHlSuBejVcQaUC7IGTPI3zmgypr9vBTmv2lZWRQ=; b=ZoMevAzm3cL8rX65Of8V5IHRn3
	Ta7i3SUALD8Nbyc1W9KBsIJY5C68n1KWEULAWVVeSaoTqny78nDFV0/f4GuQNhkUGDfrLj7zc7OXD
	m3tFb9wYq+omMufYgO2LQKx9MeOW510pSjVPEKmxZ+iE5rxB88ylp9dG6GG0SFi3bHHfsS9woK7/Z
	dp09mFMQPGurtrcSE6l2kuZ72obU7LG1bJkZF2TH06SNMq7Xt/X4+7Mj7yNSCRqv9PXBXQM7TY77b
	p8cfP1CCi/qOhLMO19M2Hsyp+J+hARBHAVjZOCLoBCd3e4qyp7QqbEGKNo8p5Ix0QCucHkhAtbd8w
	bm1ok+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54KD-00000001qyo-1sMd;
	Tue, 24 Mar 2026 16:09:49 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54KB-00000001qvX-1mov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:09:48 +0000
Message-ID: <cfaf4077-144a-4876-b6b0-8d4388362217@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774368557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9HnuHlSuBejVcQaUC7IGTPI3zmgypr9vBTmv2lZWRQ=;
	b=qSiWh7yYiVFnUisxmjTZTQQ0ii6l53riqvrgCbjqQKxS3pV5P2amhE0GVBoPnWQxqBpebR
	/uozWB1BNPZ4OuxnnhyCR+mGwiyuf7/q+eHoy8TWn3nazEwyD6FKdDReqeQZhBrUihMrR4
	8rhB0NCI9wY5hq0ndYx+9Td05Jkjd5U=
Date: Tue, 24 Mar 2026 12:09:04 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 2/2] net: xilinx: axienet: Fix BQL accounting for
 multi-BD TX packets
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
References: <20260324145353.1899248-1-suraj.gupta2@amd.com>
 <20260324145353.1899248-3-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260324145353.1899248-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090947_689655_46A250E3 
X-CRM114-Status: GOOD (  26.28  )
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

On 3/24/26 10:53, Suraj Gupta wrote:
> When a TX packet spans multiple buffer descriptors (scatter-gather),
> the per-BD byte count is accumulated into a local variable that resets
> on each NAPI poll. If the BDs for a single packet complete across
> different polls, the earlier bytes are lost and never credited to BQL.
> This causes BQL to think bytes are permanently in-flight, eventually
> stalling the TX queue.
> 
> Fix this by replacing the local accumulator with a persistent counter
> (tx_compl_bytes) that survives across polls and is reset only after
> updating BQL and stats.

Do we need this? Can't we just do something like

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 415e9bc252527..1ea8a6592bce1 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -768,6 +768,7 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 *sizep, int budge
                if (cur_p->skb) {
                        struct axienet_cb *cb = (void *)cur_p->skb->cb;
 
+                       *sizep += skb->len;
                        dma_unmap_sgtable(lp->dev, &cb->sgt, DMA_TO_DEVICE, 0);
                        sg_free_table_chained(&cb->sgt, XAE_INLINE_SG_CNT);
                        napi_consume_skb(cur_p->skb, budget);
@@ -783,8 +784,6 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 *sizep, int budge
                wmb();
                cur_p->cntrl = 0;
                cur_p->status = 0;
-
-               *sizep += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
        }
 
        smp_store_release(&lp->tx_bd_ci, (ci + i) & (lp->tx_bd_num - 1));

> Fixes: c900e49d58eb ("net: xilinx: axienet: Implement BQL")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet.h  |  3 +++
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 20 +++++++++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 602389843342..a4444c939451 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -509,6 +509,8 @@ struct skbuf_dma_descriptor {
>   *		complete. Only updated at runtime by TX NAPI poll.
>   * @tx_bd_tail:	Stores the index of the next Tx buffer descriptor in the ring
>   *              to be populated.
> + * @tx_compl_bytes: Accumulates TX completion length until a full packet is
> + *              reported to the stack.
>   * @tx_packets: TX packet count for statistics
>   * @tx_bytes:	TX byte count for statistics
>   * @tx_stat_sync: Synchronization object for TX stats
> @@ -592,6 +594,7 @@ struct axienet_local {
>  	u32 tx_bd_num;
>  	u32 tx_bd_ci;
>  	u32 tx_bd_tail;
> +	u32 tx_compl_bytes;
>  	u64_stats_t tx_packets;
>  	u64_stats_t tx_bytes;
>  	struct u64_stats_sync tx_stat_sync;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index b06e4c37ff61..95bf61986cb7 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -692,6 +692,8 @@ static void axienet_dma_stop(struct axienet_local *lp)
>  	axienet_lock_mii(lp);
>  	__axienet_device_reset(lp);
>  	axienet_unlock_mii(lp);
> +
> +	lp->tx_compl_bytes = 0;
>  }
>  
>  /**
> @@ -770,8 +772,6 @@ static int axienet_device_reset(struct net_device *ndev)
>   * @first_bd:	Index of first descriptor to clean up
>   * @nr_bds:	Max number of descriptors to clean up
>   * @force:	Whether to clean descriptors even if not complete
> - * @sizep:	Pointer to a u32 filled with the total sum of all bytes
> - *		in all cleaned-up descriptors. Ignored if NULL.
>   * @budget:	NAPI budget (use 0 when not called from NAPI poll)
>   *
>   * Would either be called after a successful transmit operation, or after
> @@ -780,7 +780,7 @@ static int axienet_device_reset(struct net_device *ndev)
>   * Return: The number of packets handled.
>   */
>  static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
> -				 int nr_bds, bool force, u32 *sizep, int budget)
> +				 int nr_bds, bool force, int budget)
>  {
>  	struct axidma_bd *cur_p;
>  	unsigned int status;
> @@ -819,8 +819,8 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  		cur_p->cntrl = 0;
>  		cur_p->status = 0;
>  
> -		if (sizep)
> -			*sizep += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
> +		if (!force)
> +			lp->tx_compl_bytes += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
>  	}
>  
>  	if (!force) {
> @@ -999,18 +999,18 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>  {
>  	struct axienet_local *lp = container_of(napi, struct axienet_local, napi_tx);
>  	struct net_device *ndev = lp->ndev;
> -	u32 size = 0;
>  	int packets;
>  
>  	packets = axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num, false,
> -					&size, budget);
> +					budget);
>  
>  	if (packets) {
> -		netdev_completed_queue(ndev, packets, size);
> +		netdev_completed_queue(ndev, packets, lp->tx_compl_bytes);
>  		u64_stats_update_begin(&lp->tx_stat_sync);
>  		u64_stats_add(&lp->tx_packets, packets);
> -		u64_stats_add(&lp->tx_bytes, size);
> +		u64_stats_add(&lp->tx_bytes, lp->tx_compl_bytes);
>  		u64_stats_update_end(&lp->tx_stat_sync);
> +		lp->tx_compl_bytes = 0;
>  
>  		/* Matches barrier in axienet_start_xmit */
>  		smp_mb();
> @@ -1115,7 +1115,7 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  				netdev_err(ndev, "TX DMA mapping error\n");
>  			ndev->stats.tx_dropped++;
>  			axienet_free_tx_chain(lp, orig_tail_ptr, ii + 1,
> -					      true, NULL, 0);
> +					      true, 0);
>  			dev_kfree_skb_any(skb);
>  			return NETDEV_TX_OK;
>  		}

