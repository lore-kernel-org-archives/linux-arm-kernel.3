Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE05C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXMjBKWbVLp7SlD/7tWrcHQG3OmUUoryMMrbzMjyeUQ=; b=lrs3ZZgemfp7Psu5YymnuNHYzw
	92B9hSSukCEqPS7Gq+rh8cXogBDLqQJFHaeK64OHEsA4FL5xSBLFpiZDNR9TkhZhu3YnyoA6vV6h3
	Ty//5uHK41rc/LCftpTrqYp3M1mt/ZnMqGQvh7Bc0/QFW/nfeLGkWVY9dvrGLMwMnQZES7inkPSJf
	W00jfUaEDJ7p7EwxAyo+ONj3gKUVprkGIfk05zYAi9jTAN8vvsTy6kugEWKCcRudZAUn99lBGNcsS
	+hdSv2y7Ur7A2oFQjq3Mklc6yk2RenHH/QzV/7I0JVitVrFqoFvFXUyzX+hzJ1OFlt55E7yA6lmAF
	9Xc1t3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHsX-00000008S86-1eY0;
	Tue, 21 Jan 2025 17:17:29 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHqU-00000008RmR-3fN3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:15:24 +0000
Message-ID: <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737479718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXMjBKWbVLp7SlD/7tWrcHQG3OmUUoryMMrbzMjyeUQ=;
	b=w4w3ffF/lMpaxYHjRekgzrjKU6SZ77OpizO03U9SmJKJmy7IpJDGw1cP8JwPRCOyPZUTSu
	wEkK2Au4Xc/VrS5EBOrzxFn0EH8NirULvAJOW+KG5hk8NlGLr7DYYVmaFQ5gFEodkcRdBL
	ZaudTxCY8FYZL6DK0w2ugwIXcSMQMLc=
Date: Wed, 22 Jan 2025 01:14:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net v2 2/3] net: stmmac: Limit FIFO size by hardware
 capability
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Vince Bridgers <vbridger@opensource.altera.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <20250121044138.2883912-3-hayashi.kunihiko@socionext.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250121044138.2883912-3-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_091523_180506_9AE38AB9 
X-CRM114-Status: GOOD (  15.72  )
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

在 1/21/25 12:41, Kunihiko Hayashi 写道:
> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> stmmac_platform layer.
> 
> However, these values are constrained by upper limits determined by the
> capabilities of each hardware feature. There is a risk that the upper
> bits will be truncated due to the calculation, so it's appropriate to
> limit them to the upper limit values and display a warning message.
> 
> Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from the devicetree")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 251a8c15637f..da3316e3e93b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7245,6 +7245,19 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>   		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
>   	}
>   

> +	if (priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {

> +		dev_warn(priv->device,
> +			 "Rx FIFO size exceeds dma capability (%d)\n",
> +			 priv->plat->rx_fifo_size);
> +		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
I executed grep and found that only dwmac4 and dwxgmac2 have initialized 
dma_cap.rx_fifo_size. Can this code still work properly on hardware 
other than these two?


Thanks,
Yanteng

