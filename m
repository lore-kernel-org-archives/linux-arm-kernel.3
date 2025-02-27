Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D31C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxpK2V1My86nC8uQeu28Nyp2ehCvmWVB39oYXCU5kLQ=; b=pMAgguj6upD1zF1a+PdLPmDNTE
	KmiTOGyAiwXV3Va9THgJM/i8dKAcVOqoQn3zlYCdfbmo+1eCZ/Jt9IpZrdXgFpiZqMPdpI2QOcXiV
	dQNuP7n1fkhSSzNRXgD2ehyymK2yU612MlwWCHYdMOLFcjOwmSjQ7ZzLeYuPTZe3K5QC0UVrXWqfQ
	zXZyF5v1hgRwzb77g3FGoP+ImaqbRw25In62LV2VNXsDdD29XQydATaUEtyX36t6ZsIvO/fp34gz5
	BtcXpcmzpDuXtMV5FTH54EjGoydcB2O4htF1PoP7hdPGAOVGoQHHBylULqXxqW2tdETdodn09DmNt
	/y8fOiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndle-00000007UZx-2oOu;
	Thu, 27 Feb 2025 13:17:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncyx-00000007Mmo-0Hl9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69C1F5C55B2;
	Thu, 27 Feb 2025 12:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2917AC4CEDD;
	Thu, 27 Feb 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740659233;
	bh=uMZBezwxFUMj3RoW99boTcLGrIl4YTJQjxUXtEwbbp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=itc5ZFp69cMRKU04DpCA9d0bZ88EJhRVt6NNGlZ+Qw9D7t5vPq6Ukj/45zjJTFDyU
	 IzDuTI32kdp4a/vl1Kaoyyj3UEDNXxnsg5N5y5It6XN/58Jdbes6PgQ7SlILJiw6Ht
	 3sz3UdW8iED/pVzyCmCA7bs8wZf9FLgFBSNYuJkudPDWWjqxkiTyuX/nqOhSor5cyC
	 0ih6Tlh5RRtuVkr4n7SvKmxDguNp32gAhzQmHiIk82IucvQ6NSM3lMmm2/jG3jZWrp
	 tN8ofifaTdlTyp+ee4f9zT7obQQmgx1d6oQPhbhqxymGjY8O0BjzkotTMXIHMhTi4R
	 QAd/y60enq0sw==
Message-ID: <3d3d180a-12b7-4bee-8172-700f0dae2439@kernel.org>
Date: Thu, 27 Feb 2025 14:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssg-prueth: introduce and use
 prueth_swdata struct for SWDATA
To: Meghana Malladi <m-malladi@ti.com>, danishanwar@ti.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 u.kleine-koenig@baylibre.com, matthias.schiffer@ew.tq-group.com,
 dan.carpenter@linaro.org, schnelle@linux.ibm.com, diogo.ivo@siemens.com,
 glaroque@baylibre.com, macro@orcam.me.uk, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-3-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250224110102.1528552-3-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_042715_202789_35C48C6F 
X-CRM114-Status: GOOD (  29.62  )
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



On 24/02/2025 13:01, Meghana Malladi wrote:
> From: Roger Quadros <rogerq@kernel.org>
> 
> We have different cases for SWDATA (skb, page, cmd, etc)
> so it is better to have a dedicated data structure for that.
> We can embed the type field inside the struct and use it
> to interpret the data in completion handlers.
> 
> Increase SWDATA size to 48 so we have some room to add
> more data if required.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> Changes since v2 (v3-v2):
> - Fix leaking tx descriptor in emac_tx_complete_packets()
> - Free rx descriptor if swdata type is not page in emac_rx_packet()
> - Revert back the size of PRUETH_NAV_SW_DATA_SIZE
> - Use build time check for prueth_swdata size
> - re-write prueth_swdata to have enum type as first member in the struct
> and prueth_data union embedded in the struct
> 
> All the above changes have been suggested by Roger Quadros <rogerq@kernel.org>
> 
>  drivers/net/ethernet/ti/icssg/icssg_common.c  | 52 +++++++++++++------
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  3 ++
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h  | 16 ++++++
>  .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  4 +-
>  4 files changed, 57 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
> index acbb79ad8b0c..01eeabe83eff 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_common.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
> @@ -136,12 +136,12 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  	struct net_device *ndev = emac->ndev;
>  	struct cppi5_host_desc_t *desc_tx;
>  	struct netdev_queue *netif_txq;
> +	struct prueth_swdata *swdata;
>  	struct prueth_tx_chn *tx_chn;
>  	unsigned int total_bytes = 0;
>  	struct sk_buff *skb;
>  	dma_addr_t desc_dma;
>  	int res, num_tx = 0;
> -	void **swdata;
>  
>  	tx_chn = &emac->tx_chns[chn];
>  
> @@ -163,12 +163,19 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
>  		swdata = cppi5_hdesc_get_swdata(desc_tx);
>  
>  		/* was this command's TX complete? */
> -		if (emac->is_sr1 && *(swdata) == emac->cmd_data) {
> +		if (emac->is_sr1 && (void *)(swdata) == emac->cmd_data) {
>  			prueth_xmit_free(tx_chn, desc_tx);
>  			continue;
>  		}
>  
> -		skb = *(swdata);
> +		if (swdata->type != PRUETH_SWDATA_SKB) {
> +			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
> +			prueth_xmit_free(tx_chn, desc_tx);
> +			budget++;

I don't recollect why we need to increase budget here.

> +			continue;
> +		}
> +
> +		skb = swdata->data.skb;
>  		prueth_xmit_free(tx_chn, desc_tx);

if we set swdata->type to PRUETH_SWDATA_CMD in emac_send_command_sr1() then we could
reduce all above code including both ifs to

		swdata = cppi5_hdesc_get_swdata(desc_tx);
		prueth_xmit_free(tx_chn, desc_tx);
		if (swdata->type != PRUETH_SWDATA_SKB)
			continue;

		skb = swdata->data.skb;

>  
>  		ndev = skb->dev;
> @@ -472,9 +479,9 @@ int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
>  {
>  	struct net_device *ndev = emac->ndev;
>  	struct cppi5_host_desc_t *desc_rx;
> +	struct prueth_swdata *swdata;
>  	dma_addr_t desc_dma;
>  	dma_addr_t buf_dma;
> -	void **swdata;
>  
>  	buf_dma = page_pool_get_dma_addr(page) + PRUETH_HEADROOM;
>  	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
> @@ -490,7 +497,8 @@ int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
>  	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
>  
>  	swdata = cppi5_hdesc_get_swdata(desc_rx);
> -	*swdata = page;
> +	swdata->type = PRUETH_SWDATA_PAGE;
> +	swdata->data.page = page;
>  
>  	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, PRUETH_RX_FLOW_DATA,
>  					desc_rx, desc_dma);
> @@ -539,11 +547,11 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  	u32 buf_dma_len, pkt_len, port_id = 0;
>  	struct net_device *ndev = emac->ndev;
>  	struct cppi5_host_desc_t *desc_rx;
> +	struct prueth_swdata *swdata;
>  	dma_addr_t desc_dma, buf_dma;
>  	struct page *page, *new_page;
>  	struct page_pool *pool;
>  	struct sk_buff *skb;
> -	void **swdata;
>  	u32 *psdata;
>  	void *pa;
>  	int ret;
> @@ -561,7 +569,13 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  
>  	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
>  	swdata = cppi5_hdesc_get_swdata(desc_rx);
> -	page = *swdata;
> +	if (swdata->type != PRUETH_SWDATA_PAGE) {
> +		netdev_err(ndev, "rx_pkt: invalid swdata->type %d\n", swdata->type);
> +		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
> +		return 0;
> +	}
> +
> +	page = swdata->data.page;
>  	page_pool_dma_sync_for_cpu(pool, page, 0, PAGE_SIZE);
>  	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
>  	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
> @@ -626,15 +640,18 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
>  {
>  	struct prueth_rx_chn *rx_chn = data;
>  	struct cppi5_host_desc_t *desc_rx;
> +	struct prueth_swdata *swdata;
>  	struct page_pool *pool;
>  	struct page *page;
> -	void **swdata;
>  
>  	pool = rx_chn->pg_pool;
>  	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
>  	swdata = cppi5_hdesc_get_swdata(desc_rx);
> -	page = *swdata;
> -	page_pool_recycle_direct(pool, page);
> +	if (swdata->type == PRUETH_SWDATA_PAGE) {
> +		page = swdata->data.page;
> +		page_pool_recycle_direct(pool, page);
> +	}
> +
>  	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
>  }
>  
> @@ -671,13 +688,13 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
>  	struct prueth_emac *emac = netdev_priv(ndev);
>  	struct prueth *prueth = emac->prueth;
>  	struct netdev_queue *netif_txq;
> +	struct prueth_swdata *swdata;
>  	struct prueth_tx_chn *tx_chn;
>  	dma_addr_t desc_dma, buf_dma;
>  	u32 pkt_len, dst_tag_id;
>  	int i, ret = 0, q_idx;
>  	bool in_tx_ts = 0;
>  	int tx_ts_cookie;
> -	void **swdata;
>  	u32 *epib;
>  
>  	pkt_len = skb_headlen(skb);
> @@ -739,7 +756,8 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
>  	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
>  	cppi5_hdesc_attach_buf(first_desc, buf_dma, pkt_len, buf_dma, pkt_len);
>  	swdata = cppi5_hdesc_get_swdata(first_desc);
> -	*swdata = skb;
> +	swdata->type = PRUETH_SWDATA_SKB;
> +	swdata->data.skb = skb;
>  
>  	/* Handle the case where skb is fragmented in pages */
>  	cur_desc = first_desc;
> @@ -842,15 +860,17 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
>  {
>  	struct prueth_tx_chn *tx_chn = data;
>  	struct cppi5_host_desc_t *desc_tx;
> +	struct prueth_swdata *swdata;
>  	struct sk_buff *skb;
> -	void **swdata;
>  
>  	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
>  	swdata = cppi5_hdesc_get_swdata(desc_tx);
> -	skb = *(swdata);
> -	prueth_xmit_free(tx_chn, desc_tx);
> +	if (swdata->type == PRUETH_SWDATA_SKB) {
> +		skb = swdata->data.skb;
> +		dev_kfree_skb_any(skb);
> +	}
>  
> -	dev_kfree_skb_any(skb);
> +	prueth_xmit_free(tx_chn, desc_tx);
>  }
>  
>  irqreturn_t prueth_rx_irq(int irq, void *dev_id)
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 00ed97860547..3ff8c322f9d9 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -1522,6 +1522,9 @@ static int prueth_probe(struct platform_device *pdev)
>  
>  	np = dev->of_node;
>  
> +	BUILD_BUG_ON_MSG((sizeof(struct prueth_swdata) > PRUETH_NAV_SW_DATA_SIZE),
> +			 "insufficient SW_DATA size");
> +
>  	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
>  	if (!prueth)
>  		return -ENOMEM;
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> index c7b906de18af..3bbabd007129 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -136,6 +136,22 @@ struct prueth_rx_chn {
>  	struct page_pool *pg_pool;
>  };
>  
> +enum prueth_swdata_type {
> +	PRUETH_SWDATA_INVALID = 0,
> +	PRUETH_SWDATA_SKB,
> +	PRUETH_SWDATA_PAGE,
> +	PRUETH_SWDATA_CMD,

PRUETH_SWDATA_CMD is not beig used so let's use it in emac_send_command_sr1()

> +};
> +
> +struct prueth_swdata {
> +	enum prueth_swdata_type type;
> +	union prueth_data {
> +		struct sk_buff *skb;
> +		struct page *page;
> +		u32 cmd;
> +	} data;
> +};
> +
>  /* There are 4 Tx DMA channels, but the highest priority is CH3 (thread 3)
>   * and lower three are lower priority channels or threads.
>   */
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> index aeeb8a50376b..7bbe0808b3ec 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
> @@ -275,10 +275,10 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
>  	struct net_device *ndev = emac->ndev;
>  	struct cppi5_host_desc_t *desc_rx;
>  	struct page *page, *new_page;
> +	struct prueth_swdata *swdata;
>  	dma_addr_t desc_dma, buf_dma;
>  	u32 buf_dma_len, pkt_len;
>  	struct sk_buff *skb;
> -	void **swdata;
>  	void *pa;
>  	int ret;
>  
> @@ -301,7 +301,7 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
>  	}
>  
>  	swdata = cppi5_hdesc_get_swdata(desc_rx);
> -	page = *swdata;
> +	page = swdata->data.page;
>  	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
>  	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
>  

-- 
cheers,
-roger


