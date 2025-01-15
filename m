Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC2FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rt/FiGiWaoV/ETmmA43v61vSgTdbSa8IULrC3r6ZIE=; b=oc9pJISbtKZ1zXfpya4qtYYg/T
	2+L5cAdSvOBgHrnRk66v8dsGVjvrFpaUIlgLwJhJltB4IOJ5oDRYtmhvcIziEao19zebZa5QFjcOc
	YJ5U90Sc0N1I3grQQk3diXMuneiCBxcaM/KsIRru29yCwaitJJKUWDPEJzMjLI5LyFSXBpYugysrV
	AwPOuGMPCi55/N+qSXhAGwFdSo2KXwOr07CbGcJsFFcGiwoyeezDa2J/XhsXEp2jhleUoG8t444qF
	j/aDNx/FIVin2gQvSOR3XZJqf7Th6WUJ73ALDUgWm7nTycYN3WKlvvWjk32Gaa3ugOsoMbeelSEjh
	bVyEcwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6Da-0000000CRG4-23nj;
	Wed, 15 Jan 2025 16:26:10 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6CH-0000000CQyq-42yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:24:51 +0000
Message-ID: <a6d4dd7c-3dd5-45b1-bd9c-5ec16d1564ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736958287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Rt/FiGiWaoV/ETmmA43v61vSgTdbSa8IULrC3r6ZIE=;
	b=fruPS3fE2nNX2DzJZIt7T8OGxUW9/D+0Er9moyG2kT4U60O93Ra1Ddjp2dGLDxkc/VquLq
	lx1jN/KvUv08kZVrxQq/WVSO66rYTMLAoWGlddqpdrKdh3UYxh8p+HYwoTW5y/uh622o4f
	4ZyQkIChBDwKi8tKTk4jjkZf7cClbhY=
Date: Thu, 16 Jan 2025 00:24:06 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 3/4] net: stmmac: Optimize cache prefetch in
 RX path
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Joe Damato <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736910454.git.0x1207@gmail.com>
 <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_082450_328261_FE79EA96 
X-CRM114-Status: GOOD (  13.13  )
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
> Current code prefetches cache lines for the received frame first, and
> then dma_sync_single_for_cpu() against this frame, this is wrong.
> Cache prefetch should be triggered after dma_sync_single_for_cpu().
> 
> This patch brings ~2.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 811e2d372abf..ad928e8e21a9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5508,10 +5508,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   		/* Buffer is good. Go on. */
>   
> -		prefetch(page_address(buf->page) + buf->page_offset);
> -		if (buf->sec_page)
> -			prefetch(page_address(buf->sec_page));
> -
>   		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
>   		len += buf1_len;
>   		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> @@ -5533,6 +5529,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   
>   			dma_sync_single_for_cpu(priv->device, buf->addr,
>   						buf1_len, dma_dir);
> +			prefetch(page_address(buf->page) + buf->page_offset);
>   
>   			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>   			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),


