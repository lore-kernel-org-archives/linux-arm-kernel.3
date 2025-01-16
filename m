Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9147EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVbG7W6+7JxHys/x2BFctt4lICVhXoK01DPy3Q0JzFo=; b=FV3V7K4UX4ks80EsvcrTmGOxIJ
	Cl2UefiYPlh4DW0BvjZ8glIeL1oO1mIgrasRTf2pB1tIwKFUdYyaKXbVQIhviKt2y/MiUpzi7abHo
	27YiUF9aUw/3dsRJ2gG4Yg/YTgHhecnDShT3Q/L78i+VZXkTPya5hLXElCfC05LOHgI/CAqedCdPt
	dXgCV89k3+FVmxOXMmm7J/K9c82SwhL0qEFnAVZVLrNgYebUsr0Vcaax5cNaJNVQGYVROECL8qZto
	9Yv7XTPCPKiAbkiovmKWScY/YGZbP7IJiC/cPFpIvU+QEOCJlJ48A03pbZD/djMnen96d2xxI6fUb
	wrFhAybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFHo-0000000DbRe-480Z;
	Thu, 16 Jan 2025 02:07:08 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFGY-0000000DbLE-0r6o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:05:51 +0000
Message-ID: <1985a09f-f851-48a6-af6c-07e21611b514@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736993145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVbG7W6+7JxHys/x2BFctt4lICVhXoK01DPy3Q0JzFo=;
	b=qGv0IY4QgXb/DWaMfG35Kdr+HZFobNX/I/1i5oqx198Wbz3zSDY5uEXo0sUhoLT9RilHH8
	XqWtLE/8gjiG5MLgHztvVngAnwzdOEzWd3NXb8a0eG/GYfuJm4TT8I2rkDca09TK9bUMWe
	1dJKtkimFLnDZwhBrtUjOO9tfs51iEI=
Date: Thu, 16 Jan 2025 10:05:37 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Joe Damato <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_180550_673980_E36E6D27 
X-CRM114-Status: GOOD (  18.19  )
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

在 2025/1/15 11:27, Furong Xu 写道:
> Avoid memcpy in non-XDP RX path by marking all allocated SKBs to
> be recycled in the upper network stack.
> 
> This patch brings ~11.5% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, from 2.18 Gbits/sec increased to 2.43 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
>   2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index e8dbce20129c..f05cae103d83 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -126,6 +126,7 @@ struct stmmac_rx_queue {
>   	unsigned int cur_rx;
>   	unsigned int dirty_rx;
>   	unsigned int buf_alloc_num;
> +	unsigned int napi_skb_frag_size;
>   	dma_addr_t dma_rx_phy;
>   	u32 rx_tail_addr;
>   	unsigned int state_saved;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index acd6994c1764..1d98a5e8c98c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1341,7 +1341,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>   	if (stmmac_xdp_is_enabled(priv))
>   		return XDP_PACKET_HEADROOM;
>   
> -	return 0;
> +	return NET_SKB_PAD;
>   }
>   
>   static int stmmac_set_bfsize(int mtu, int bufsize)
> @@ -2040,17 +2040,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>   	struct stmmac_channel *ch = &priv->channel[queue];
>   	bool xdp_prog = stmmac_xdp_is_enabled(priv);
>   	struct page_pool_params pp_params = { 0 };
> -	unsigned int num_pages;
> +	unsigned int dma_buf_sz_pad, num_pages;
>   	unsigned int napi_id;
>   	int ret;
>   
> +	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
> +			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> +	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
> +
>   	rx_q->queue_index = queue;
>   	rx_q->priv_data = priv;
> +	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
>   
>   	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
>   	pp_params.pool_size = dma_conf->dma_rx_size;
> -	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
> -	pp_params.order = ilog2(num_pages);
> +	pp_params.order = order_base_2(num_pages);
>   	pp_params.nid = dev_to_node(priv->device);
>   	pp_params.dev = priv->device;
>   	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> @@ -5582,22 +5586,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   		}
>   
>   		if (!skb) {
> +			unsigned int head_pad_len;
> +
>   			/* XDP program may expand or reduce tail */
>   			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
>   
> -			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
> +			skb = napi_build_skb(page_address(buf->page),
> +					     rx_q->napi_skb_frag_size);
>   			if (!skb) {
> +				page_pool_recycle_direct(rx_q->page_pool,
> +							 buf->page);
>   				rx_dropped++;
>   				count++;
>   				goto drain_data;
>   			}
>   
>   			/* XDP program may adjust header */
> -			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
> +			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
> +			skb_reserve(skb, head_pad_len);
>   			skb_put(skb, buf1_len);
> -
> -			/* Data payload copied into SKB, page ready for recycle */
> -			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> +			skb_mark_for_recycle(skb);
>   			buf->page = NULL;
>   		} else if (buf1_len) {
>   			dma_sync_single_for_cpu(priv->device, buf->addr,


