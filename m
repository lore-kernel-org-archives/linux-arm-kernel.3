Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CAFCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWr4W8qcelLOSOObSDeK6oL03Nao8/tZn3JtOigt+lk=; b=s96CPCOp6l4+Dx/GVs94OyE3uo
	vFoX8+GNjWM6gDUxcIzraYqbqXDjkQpnHKiMjrAeJwTxYnut2VFiNgPQRpNEN1JSvjXCV9OM2LB2n
	mY20UKK3uhLRi2P1t2rK3yFgno7R6BiCes40R93W1FmK9phPeXG36QycylySkNB+kQ5OVoEvlP880
	MI0nRPxbUK7wZRK6j0KT2fdKE0fKsgxcuO8uDmNVA0ABKIOoUgzH2lWtFeHu5Y3RysJhHH5cHzaBJ
	KFgG2cJUJoF9JG5pmS3nEV6jo6vyoFDMTmnSnnTm6YZSrAf/2OiO6cqbggq/k9Wk+fLB4NP9Bl6Us
	WfFZrIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxIB-0000000FMRB-3XKg;
	Wed, 14 Oct 2026 11:37:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxI8-0000000FMQJ-2djn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:37:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0B574E4121C;
	Wed, 14 Oct 2026 11:36:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CEF760368;
	Wed, 14 Oct 2026 11:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C15210328B69;
	Wed, 14 Oct 2026 13:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791977813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RWr4W8qcelLOSOObSDeK6oL03Nao8/tZn3JtOigt+lk=;
	b=KN3wh9U25CaGmHoqLk8+9jWhf9PKPQE9q+5fQmZN+j+BygbA0yHlbpjADBoWObUtdlgFlu
	sZ+ehrjmIVmL7o1Hu82ecjFGJFa9ZjseEtw+FE0lB9CNB16860mAjGTqQ+TWByoJfxT2g2
	FZSLCYtoATRwETUg845nqSu/+JgsDvvRhcnEpXv4CQrE5jeZYGYot+z/meNrbGz16Qdj3z
	faCrCVK/hsndMY0TkEXkv3QgD0fiSr9mXycJiOaRv7c3bNo/+21tZh9N+cJr725kH2u/bv
	7DDMI01UkD4f6Ff/+qLerGkjT3JLVqCLMI3YjSvuuxPcuMZ74qDziorSrZBB7A==
Message-ID: <70b0cca1-1a59-4a86-9416-976912421bf5@bootlin.com>
Date: Wed, 14 Oct 2026 13:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/3] net: stmmac: handle partially allocated DMA
 queues
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1791958735.git.kmehltretter@gmail.com>
 <3537f9a4f3e875291812486982b907b3b02bec15.1791958735.git.kmehltretter@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <3537f9a4f3e875291812486982b907b3b02bec15.1791958735.git.kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043704_844580_C5FE20C4 
X-CRM114-Status: GOOD (  16.67  )
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

Hi,

On 10/14/26 08:26, Karl Mehltretter wrote:
> DMA allocation failure unwinds every configured queue, including the
> failed queue and queues not yet allocated. The cleanup helpers then
> dereference buffer arrays that may not exist.
> 
> Only traverse allocated buffer arrays. Clear freed pointers because the
> queue structures persist and XDP reconfiguration can reuse them.
> 
> Found by inspection. On a BeagleV Ahead (TH1520), fault injection at
> the RX buffer metadata and TX DMA metadata allocations reached these
> invalid cleanup paths before a test guard stopped them. With this
> change, cleanup completed without the guard.
> 
> Fixes: 54139cf3bb33 ("net: stmmac: adding multiple buffers for rx")
> Fixes: ce736788e8a9 ("net: stmmac: adding multiple buffers for TX")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Please look at https://lore.kernel.org/netdev/20261012142458.2845385-1-dinghui1111@163.com/ .

LLMs keep finding the same bugs again and again, make sure you ask
it if there isn't already an in-flight patch for it before sending it :)

Maxime


> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b837e8e27..495ff7aef 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2144,10 +2144,12 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	void *addr;
>  
>  	/* Release the DMA RX socket buffers */
> -	if (rx_q->xsk_pool)
> -		dma_free_rx_xskbufs(priv, dma_conf, queue);
> -	else
> -		dma_free_rx_skbufs(priv, dma_conf, queue);
> +	if (rx_q->buf_pool) {
> +		if (rx_q->xsk_pool)
> +			dma_free_rx_xskbufs(priv, dma_conf, queue);
> +		else
> +			dma_free_rx_skbufs(priv, dma_conf, queue);
> +	}
>  
>  	rx_q->buf_alloc_num = 0;
>  	rx_q->xsk_pool = NULL;
> @@ -2161,13 +2163,17 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
>  
>  	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
> +	rx_q->dma_erx = NULL;
> +	rx_q->dma_rx = NULL;
>  
>  	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
>  		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
>  
>  	kfree(rx_q->buf_pool);
> +	rx_q->buf_pool = NULL;
>  	if (rx_q->page_pool)
>  		page_pool_destroy(rx_q->page_pool);
> +	rx_q->page_pool = NULL;
>  }
>  
>  static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
> @@ -2196,7 +2202,8 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
>  	void *addr;
>  
>  	/* Release the DMA TX socket buffers */
> -	dma_free_tx_skbufs(priv, dma_conf, queue);
> +	if (tx_q->tx_skbuff_dma && tx_q->tx_skbuff)
> +		dma_free_tx_skbufs(priv, dma_conf, queue);
>  
>  	if (priv->extend_desc) {
>  		addr = tx_q->dma_etx;
> @@ -2209,9 +2216,14 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
>  	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
>  
>  	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
> +	tx_q->dma_etx = NULL;
> +	tx_q->dma_entx = NULL;
> +	tx_q->dma_tx = NULL;
>  
>  	kfree(tx_q->tx_skbuff_dma);
> +	tx_q->tx_skbuff_dma = NULL;
>  	kfree(tx_q->tx_skbuff);
> +	tx_q->tx_skbuff = NULL;
>  }
>  
>  static void free_dma_tx_desc_resources(struct stmmac_priv *priv,


