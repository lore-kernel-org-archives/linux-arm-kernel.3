Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A578C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi6WJ28vvEWFjLtni81xp9MLpaIOuEpXCoL6YJHYkA4=; b=DqsBRoB/hS2VjqbU2Sx/14oOuS
	DgWq2QxFh1Cjc12PBJx644nNE72X7z7jwFs5zCZSF37MYGlxKJQkNxn244iRIC4ZVeeNbroKVjtL8
	gLoeZ2WYvYk1U+Hei7Rb1xhxEddabIs8JgXJI9B3x/WN6mKAt1y9bQszXr79pc6cyhmdyx4urqfcw
	/sTCCD24zuzPo5LnTJeCGG9UkCxZRShVYjvux2qCnPtsQNFaiAR+nnPwNjQgJvsSr8bqHeCgTCBLV
	W9N43OpozSFls3vzR6Xr5Zg+21y0Iduh6KpooDfPW4M+Y0B+G4oniKhsu1lUHr8jolECQ92lHe8xV
	S1SQZlpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG35-00000003ZRT-1xDJ;
	Wed, 26 Feb 2025 11:57:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEyp-00000003MTa-33Qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:49:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso10141420a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 02:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740566970; x=1741171770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pi6WJ28vvEWFjLtni81xp9MLpaIOuEpXCoL6YJHYkA4=;
        b=eWChwvsvpst12sN24SS03cnULU0cEajQOATjSwpIxyyRTzM2TSmZ0USwOZIzg1ZOmq
         PlGOrN4r8+skUBPx6Q8uYYozhlvnDc+999ngy4yLu4YZcmJpR9uueBaSW54BXIvst9DZ
         NrHThax9CdMX2rNgUaG33YfoOmsBbFuOx6YPCp+sSOC8/jbLVRg4RhdAxnYZNJeeO70z
         7pr9WsFBRVb3qTyLTB7DpHksdZP9HXwWvlaixj419stkE0InNuyaUOG84MfUlSxOP8fW
         hka3BgUWLMy+7xYLc1X5TWpiLstIO7hxf6F/S4xGQNd4YVP70Vqjx0yD08ljWZ5nI52e
         V8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566970; x=1741171770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pi6WJ28vvEWFjLtni81xp9MLpaIOuEpXCoL6YJHYkA4=;
        b=HUl8NvscO8k+raX7CzdUJ+oAdsa3KRUijCW+GV0GXMemRa2mCcQaf5+IBZrJYAUzUA
         j66kMllUadpNrGJfHH+BVY6gUiYU0Lw9x9nh+E+jQhoegiOgkT6J6UZVD9ry1utzPsOC
         CuoOBINC1KXT6iHOja5wkTMVMkSG/+9kcnm3ZLBzRCDSPttvYFZX42NhHM9SvgUUEcQB
         J3KHxzNvDObfgC29p6kZSBIqf6TmYfz10hZlGK5jwM+ySmevxtMdEJIAbbq7BeWF5Sj1
         pWk57TVH1ZVItrBuL6XcFWWRWyrP6iuuA2G6U1bUG2BUssAYn2wB1O70zEdV+L3Z5HOR
         9KzA==
X-Forwarded-Encrypted: i=1; AJvYcCVDzw1wY7T8XRDP3XWmKtDj21ZN0h2OnaM8ReZLesP6LtNJbP9ZIV0pCyxyayUKq29ZGdgh0ziOFtkI6Ex0J0k7@lists.infradead.org
X-Gm-Message-State: AOJu0YxR5aDH6zXcWbh3DzOcjRMNJIceiRMq9aFiyXlUSbHcMSlii+tt
	S+a2OgCswIVDV+Bfr18sHpJUOprbU8sqZR1lx0TGhml/wGl15eTOvkM4gC0RvU4=
X-Gm-Gg: ASbGncvqR51gmu05ktYRAbG9LjYsSgTMIzIQUIPl8oMTu0AbpHNDhGF/M/4zkQoZxim
	lu9R+J8qDp6fhY/agl5+k9fnD4xefdFvVaNvtIpXLfwC6o0qFZ5ZUK940bLjLuJs8KIZDvqLq/t
	FIdjSDEoJfCu9fQsVaU65Ho4GT+0wjUA3Jusi1nOLoa10P1dmIcDHf/EcV8ieEPYhLerYFdvvBr
	PqbGWNiStmxP2fW2P/ZKjQkBrSxDGhrelCmJ6BG988mbrmGcDZLerdTj/zKEPFX3VlPmaKx24/+
	zPjFeY5O9reRvPmU3Tih99XsQ3KbZJI=
X-Google-Smtp-Source: AGHT+IHboJc5jNRiF6+HVnUsvC83uOT9sWDzDzjF2aDgj8PSLcgjjjzDUmuVpcXr+wjn2QMqiog8WA==
X-Received: by 2002:a17:907:971e:b0:abb:9d27:290e with SMTP id a640c23a62f3a-abeeef35497mr334786166b.41.1740566969952;
        Wed, 26 Feb 2025 02:49:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1cdc46bsm304605266b.20.2025.02.26.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:49:29 -0800 (PST)
Date: Wed, 26 Feb 2025 13:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	matthias.schiffer@ew.tq-group.com, schnelle@linux.ibm.com,
	diogo.ivo@siemens.com, glaroque@baylibre.com, macro@orcam.me.uk,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth: Add XDP support
Message-ID: <d362a527-88cf-4cd5-a22f-7eeb938d4469@stanley.mountain>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224110102.1528552-4-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_024931_789169_B09683F0 
X-CRM114-Status: GOOD (  28.51  )
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

On Mon, Feb 24, 2025 at 04:31:02PM +0530, Meghana Malladi wrote:
> @@ -541,7 +558,153 @@ void emac_rx_timestamp(struct prueth_emac *emac,
>  	ssh->hwtstamp = ns_to_ktime(ns);
>  }
>  
> -static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
> +/**
> + * emac_xmit_xdp_frame - transmits an XDP frame
> + * @emac: emac device
> + * @xdpf: data to transmit
> + * @page: page from page pool if already DMA mapped
> + * @q_idx: queue id
> + *
> + * Return: XDP state
> + */
> +int emac_xmit_xdp_frame(struct prueth_emac *emac,
> +			struct xdp_frame *xdpf,
> +			struct page *page,
> +			unsigned int q_idx)
> +{
> +	struct cppi5_host_desc_t *first_desc;
> +	struct net_device *ndev = emac->ndev;
> +	struct prueth_tx_chn *tx_chn;
> +	dma_addr_t desc_dma, buf_dma;
> +	struct prueth_swdata *swdata;
> +	u32 *epib;
> +	int ret;
> +
> +	void *data = xdpf->data;
> +	u32 pkt_len = xdpf->len;

Get rid of these variables?

> +
> +	if (q_idx >= PRUETH_MAX_TX_QUEUES) {
> +		netdev_err(ndev, "xdp tx: invalid q_id %d\n", q_idx);
> +		return ICSSG_XDP_CONSUMED;	/* drop */
> +	}
> +
> +	tx_chn = &emac->tx_chns[q_idx];
> +
> +	first_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
> +	if (!first_desc) {
> +		netdev_dbg(ndev, "xdp tx: failed to allocate descriptor\n");
> +		goto drop_free_descs;	/* drop */
> +	}
> +
> +	if (page) { /* already DMA mapped by page_pool */
> +		buf_dma = page_pool_get_dma_addr(page);
> +		buf_dma += xdpf->headroom + sizeof(struct xdp_frame);
> +	} else { /* Map the linear buffer */
> +		buf_dma = dma_map_single(tx_chn->dma_dev, data, pkt_len, DMA_TO_DEVICE);
> +		if (dma_mapping_error(tx_chn->dma_dev, buf_dma)) {
> +			netdev_err(ndev, "xdp tx: failed to map data buffer\n");
> +			goto drop_free_descs;	/* drop */
> +		}
> +	}
> +
> +	cppi5_hdesc_init(first_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
> +			 PRUETH_NAV_PS_DATA_SIZE);
> +	cppi5_hdesc_set_pkttype(first_desc, 0);
> +	epib = first_desc->epib;
> +	epib[0] = 0;
> +	epib[1] = 0;
> +
> +	/* set dst tag to indicate internal qid at the firmware which is at
> +	 * bit8..bit15. bit0..bit7 indicates port num for directed
> +	 * packets in case of switch mode operation
> +	 */
> +	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, (emac->port_id | (q_idx << 8)));
> +	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
> +	cppi5_hdesc_attach_buf(first_desc, buf_dma, pkt_len, buf_dma, pkt_len);
> +	swdata = cppi5_hdesc_get_swdata(first_desc);
> +	if (page) {
> +		swdata->type = PRUETH_SWDATA_PAGE;
> +		swdata->data.page = page;
> +	} else {
> +		swdata->type = PRUETH_SWDATA_XDPF;
> +		swdata->data.xdpf = xdpf;
> +	}
> +
> +	cppi5_hdesc_set_pktlen(first_desc, pkt_len);
> +	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
> +
> +	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
> +	if (ret) {
> +		netdev_err(ndev, "xdp tx: push failed: %d\n", ret);
> +		goto drop_free_descs;
> +	}
> +
> +	return ICSSG_XDP_TX;
> +
> +drop_free_descs:
> +	prueth_xmit_free(tx_chn, first_desc);
> +	return ICSSG_XDP_CONSUMED;
> +}
> +EXPORT_SYMBOL_GPL(emac_xmit_xdp_frame);
> +
> +/**
> + * emac_run_xdp - run an XDP program
> + * @emac: emac device
> + * @xdp: XDP buffer containing the frame
> + * @page: page with RX data if already DMA mapped
> + *
> + * Return: XDP state
> + */
> +static int emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
> +			struct page *page)
> +{
> +	struct net_device *ndev = emac->ndev;
> +	int err, result = ICSSG_XDP_PASS;
> +	struct bpf_prog *xdp_prog;
> +	struct xdp_frame *xdpf;
> +	int q_idx;
> +	u32 act;
> +
> +	xdp_prog = READ_ONCE(emac->xdp_prog);
> +	act = bpf_prog_run_xdp(xdp_prog, xdp);
> +	switch (act) {
> +	case XDP_PASS:
> +		break;
> +	case XDP_TX:
> +		/* Send packet to TX ring for immediate transmission */
> +		xdpf = xdp_convert_buff_to_frame(xdp);
> +		if (unlikely(!xdpf))

This is the second unlikely() macro which is added in this patchset.
The rule with likely/unlikely() is that it should only be added if it
likely makes a difference in benchmarking.  Quite often the compiler
is able to predict that valid pointers are more likely than NULL
pointers so often these types of annotations don't make any difference
at all to the compiled code.  But it depends on the compiler and the -O2
options.

> +			goto drop;
> +
> +		q_idx = smp_processor_id() % emac->tx_ch_num;
> +		result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
> +		if (result == ICSSG_XDP_CONSUMED)
> +			goto drop;
> +		break;
> +	case XDP_REDIRECT:
> +		err = xdp_do_redirect(emac->ndev, xdp, xdp_prog);
> +		if (err)
> +			goto drop;
> +		result = ICSSG_XDP_REDIR;
> +		break;
> +	default:
> +		bpf_warn_invalid_xdp_action(emac->ndev, xdp_prog, act);
> +		fallthrough;
> +	case XDP_ABORTED:
> +drop:
> +		trace_xdp_exception(emac->ndev, xdp_prog, act);
> +		fallthrough; /* handle aborts by dropping packet */
> +	case XDP_DROP:
> +		ndev->stats.tx_dropped++;
> +		result = ICSSG_XDP_CONSUMED;
> +		page_pool_recycle_direct(emac->rx_chns.pg_pool, page);
> +		break;
> +	}
> +
> +	return result;
> +}
> +
> +static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, int *xdp_state)


xdp_state should be a u32 because it's a bitfield.  Bitfields are never
signed.

>  {
>  	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
>  	u32 buf_dma_len, pkt_len, port_id = 0;
> @@ -552,10 +715,12 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  	struct page *page, *new_page;
>  	struct page_pool *pool;
>  	struct sk_buff *skb;
> +	struct xdp_buff xdp;
>  	u32 *psdata;
>  	void *pa;
>  	int ret;
>  
> +	*xdp_state = 0;
>  	pool = rx_chn->pg_pool;
>  	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
>  	if (ret) {
> @@ -596,9 +761,21 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
>  		goto requeue;
>  	}
>  
> -	/* prepare skb and send to n/w stack */
>  	pa = page_address(page);
> -	skb = napi_build_skb(pa, PAGE_SIZE);
> +	if (emac->xdp_prog) {
> +		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
> +		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
> +
> +		*xdp_state = emac_run_xdp(emac, &xdp, page);
> +		if (*xdp_state == ICSSG_XDP_PASS)
> +			skb = xdp_build_skb_from_buff(&xdp);
> +		else
> +			goto requeue;
> +	} else {
> +		/* prepare skb and send to n/w stack */
> +		skb = napi_build_skb(pa, PAGE_SIZE);
> +	}
> +
>  	if (!skb) {
>  		ndev->stats.rx_dropped++;
>  		page_pool_recycle_direct(pool, page);
> @@ -861,13 +1038,23 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
>  	struct prueth_tx_chn *tx_chn = data;
>  	struct cppi5_host_desc_t *desc_tx;
>  	struct prueth_swdata *swdata;
> +	struct xdp_frame *xdpf;
>  	struct sk_buff *skb;
>  
>  	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
>  	swdata = cppi5_hdesc_get_swdata(desc_tx);
> -	if (swdata->type == PRUETH_SWDATA_SKB) {
> +
> +	switch (swdata->type) {
> +	case PRUETH_SWDATA_SKB:
>  		skb = swdata->data.skb;
>  		dev_kfree_skb_any(skb);
> +		break;
> +	case PRUETH_SWDATA_XDPF:
> +		xdpf = swdata->data.xdpf;
> +		xdp_return_frame(xdpf);
> +		break;
> +	default:
> +		break;
>  	}
>  
>  	prueth_xmit_free(tx_chn, desc_tx);
> @@ -904,15 +1091,18 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
>  		PRUETH_RX_FLOW_DATA_SR1 : PRUETH_RX_FLOW_DATA;
>  	int flow = emac->is_sr1 ?
>  		PRUETH_MAX_RX_FLOWS_SR1 : PRUETH_MAX_RX_FLOWS;
> +	int xdp_state_or = 0;
>  	int num_rx = 0;
>  	int cur_budget;
> +	int xdp_state;

Both xdp_state_or and xdp_state should be u32 because they are bitfields.

regards,
dan carpenter

>  	int ret;
>  
>  	while (flow--) {
>  		cur_budget = budget - num_rx;
>  
>  		while (cur_budget--) {
> -			ret = emac_rx_packet(emac, flow);
> +			ret = emac_rx_packet(emac, flow, &xdp_state);
> +			xdp_state_or |= xdp_state;
>  			if (ret)
>  				break;
>  			num_rx++;


