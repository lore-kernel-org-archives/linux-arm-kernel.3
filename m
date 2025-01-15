Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D074C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icHLKv5VN6jwSr7MhzVN0//BkA8Uxelerc6wDiydU88=; b=tzhkocpZQFGX2ynrHLnvX4r7dK
	1jUi4MVKa5/8C9CgLgsrH0J2m88X3XTDuj1+vGXWWYrC1xTq0l4OTRvRBIcj40iIgzmNm/lGeHslc
	auiQCCM1TJl0NChz3+UlOql7zaZojhjCTO2bReY72EZyR/+/lJuk/yvXYr8x1Tx30n+QRRdcD36wP
	ZsjB4GhN4hM5KNS75INEFkOMGB4UwgS+GLe0P/bwhSUxHuEMQ5nXjzlXsJDY0XkY4MuBnm4z9psCL
	dYvd7cl0Ru0qis9VOv0TcNodPGSSxQukZzajQbLwL/vgNGj5/seKkm/HrxTNZ8kYzMMThytFl+M3B
	jj2VcaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6OR-0000000CTFd-3tpq;
	Wed, 15 Jan 2025 16:37:24 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6LJ-0000000CShK-2sIm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:34:10 +0000
Message-ID: <171d1123-af12-4ac9-90a1-71eeca5f716d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736958847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icHLKv5VN6jwSr7MhzVN0//BkA8Uxelerc6wDiydU88=;
	b=LJeQqzuJHboM4Y2r+z5jdvuyn7WuMOgq6VU9c+TYcGUmNZrbKchqTiX6jWoFHWuZcD+RqL
	aI4aF0mkc4CgGDxDRZ5KE1pLftSWkG7NDzckMYSoSSfzIlVLX5vFeqtDaXFdOY9nqly8p8
	DROGM/1Hw+2C8GyG+oMmwgi9J9UOgCU=
Date: Thu, 16 Jan 2025 00:33:16 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 4/4] net: stmmac: Convert prefetch() to
 net_prefetch() for received frames
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Joe Damato <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736910454.git.0x1207@gmail.com>
 <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_083409_865198_60EBA7B3 
X-CRM114-Status: GOOD (  12.33  )
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

在 1/15/25 11:27, Furong Xu 写道:
> The size of DMA descriptors is 32 bytes at most.
> net_prefetch() for received frames, and keep prefetch() for descriptors.
> 
> This patch brings ~4.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.92 Gbits/sec increased to 3.06 Gbits/sec.
> 
> Suggested-by: Joe Damato <jdamato@fastly.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ad928e8e21a9..49b41148d594 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5529,7 +5529,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   			dma_sync_single_for_cpu(priv->device, buf->addr,
>   						buf1_len, dma_dir);
> -			prefetch(page_address(buf->page) + buf->page_offset);
> +			net_prefetch(page_address(buf->page) +
> +				     buf->page_offset);
>   
>   			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>   			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),


