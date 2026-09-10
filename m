Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE786C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDzXZ6piB7j2cN4Fr0TwgWJ5tKy/80ymXysWPI+rShA=; b=w0PKrX1/CRdB1e9vxwwjZuKNf0
	+7zA6JcgK40MokS5rCGJOwuFmTM5ehckO+CZjsCvgtJdERgMucV5g9qCp50T5qPKqoJom02phe2F+
	ojAPSSqpTYG6wSx/zbHLIscE3CLC6I7ZRhW9e5KL/F6F+lkoqWG7wQ1M5qdFUInin0K2SwlK2Qzde
	pKTYP74g9yL0yY4z1U7LTiS3dYLEVUHKCeOv7jKGW2tbNhdTV/qDgaIdgA55YfjE9E4tO292pN1or
	CiqgrGiv79lBb1Tb4sZ9tCTwa+gLMuXKRcHt8PHD3P9Dvr+edX7LYFUExy1sXqJaeEqX3xcWrWmDp
	VuAFX3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bD0-0000000DuWB-0i93;
	Thu, 10 Sep 2026 09:36:42 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bCx-0000000DuVN-034A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lD
	zXZ6piB7j2cN4Fr0TwgWJ5tKy/80ymXysWPI+rShA=; b=XtuDuCszsJmOJcBzL9
	YGeyAEPFHOf3H0/8OvUmuAqehEEOebxMPdOtY8E4MbKm+Q2d56GWWQ9nMf76IAD9
	pKWGmBKRgKvaJzyK4f4NmdkOf/cEIDmpr2uj6iVUCoibFjHa/urcoifcckjKSe/h
	poGYcPn9dDz78LB21sreilXnA=
Received: from 4CV529F122.company.local (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBXQmrweaJqFDQnOg--.33175S2;
	Thu, 10 Sep 2026 17:35:54 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: lorenzo.bianconi@oss.qualcomm.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com
Subject: Re:Re: [PATCH net-next v2] net: stmmac: fix error path cleanup in DMA descriptor ring allocation
Date: Thu, 10 Sep 2026 17:35:44 +0800
Message-Id: <20260910093544.411975-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ap09hwoKJjqQWIrB@lore-desk>
References: <ap09hwoKJjqQWIrB@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgBXQmrweaJqFDQnOg--.33175S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4rAFy5Gr4fWw4kZF4kCrg_yoWrJry8pr
	48CayjyFyUtr13GwnxAr4UXa45J3yrtF4Ygw43Cw12vFnFkr9YqFyjyryjkry8Cr9ruF4S
	g34DCFnxCF18JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi-eOAUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0hvfDGqiefvSpwAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023639_410621_6F791EF6 
X-CRM114-Status: GOOD (  18.41  )
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

Hi Lorenzo,

Thanks for your review comments.

At 2026-09-06 18:16:39, "Lorenzo Bianconi" <lorenzo.bianconi@oss.qualcomm.com> wrote:
>> From: Ding Hui <dinghui@lixiang.com>
>
>Hi Ding Hui,
>
>just a couple of nits inline.
>
>Regards,
>Lorenzo
>
>[...]
>
>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 59 ++++++++++++++++---
>>  1 file changed, 50 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index f2fc89176654..f0e06c011b8d 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -1728,7 +1728,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
>>  					 DMA_TO_DEVICE);
>>  	}
>>  
>
>Is it more appropriate to move the tx_q->tx_skbuff_dma check here from
>dma_free_tx_skbufs()?
>

tx_skbuff_dma is a per-queue resource, and stmmac_free_tx_buffer()
references it in multiple places across the function body. Moving the
NULL check into stmmac_free_tx_buffer() would require repeating it on
every call, introducing O(n) overhead proportional to dma_tx_size.
So I put it at the entry of dma_free_tx_skbufs().

>> -	if (tx_q->xdpf[i] &&
>> +	if (tx_q->xdpf && tx_q->xdpf[i] &&
>>  	    (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_TX ||
>>  	     tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_NDO)) {
>>  		xdp_return_frame(tx_q->xdpf[i]);
>> @@ -1738,7 +1738,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
>>  	if (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XSK_TX)
>>  		tx_q->xsk_frames_done++;
>>  
>> -	if (tx_q->tx_skbuff[i] &&
>> +	if (tx_q->tx_skbuff && tx_q->tx_skbuff[i] &&
>>  	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
>>  		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
>>  		tx_q->tx_skbuff[i] = NULL;
>> @@ -1761,6 +1761,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
>>  	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
>>  	int i;
>>  
>> +	/* buf_pool may not be allocated if alloc failed early */
>> +	if (!rx_q->buf_pool)
>> +		return;
>> +
>>  	for (i = 0; i < dma_conf->dma_rx_size; i++)
>>  		stmmac_free_rx_buffer(priv, rx_q, i);
>>  }

>> @@ -2272,15 +2284,19 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>>  	}
>>  
>>  	rx_q->buf_pool = kzalloc_objs(*rx_q->buf_pool, dma_conf->dma_rx_size);
>> -	if (!rx_q->buf_pool)
>> -		return -ENOMEM;
>> +	if (!rx_q->buf_pool) {
>> +		ret = -ENOMEM;
>> +		goto err_destroy_pool;
>> +	}
>>  
>>  	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
>>  
>>  	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
>>  				  GFP_KERNEL);
>> -	if (!addr)
>> -		return -ENOMEM;
>> +	if (!addr) {
>> +		ret = -ENOMEM;
>> +		goto err_free_buf_pool;
>> +	}
>>  
>>  	if (priv->extend_desc)
>>  		rx_q->dma_erx = addr;
>> @@ -2296,10 +2312,27 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>>  	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
>>  	if (ret) {
>>  		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
>> -		return -EINVAL;
>> +		goto err_free_dma;
>>  	}
>>  
>>  	return 0;
>> +
>> +err_free_dma:
>> +	if (priv->extend_desc)
>> +		dma_free_coherent(priv->device, size, rx_q->dma_erx,
>> +				  rx_q->dma_rx_phy);
>> +	else
>> +		dma_free_coherent(priv->device, size, rx_q->dma_rx,
>> +				  rx_q->dma_rx_phy);
>
>I guess you can use addr here and remove the if/else block
>
Excellent suggestion, will use addr directly in v3.

Thanks,
Ding Hui


