Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C172AC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYUMZ7E+6vJC5FpLL2HyF+nE/45hsY2ZWy2Xc7WZ050=; b=F/v0ZohFOD+LpNgFR2wMd/YgSj
	acJhalbLrDbLPuj3Fv3KDkxUXku7PzRmw1QHiKYshddZMioIXEnZ7woqhOrpOnso2oZFhUvVVIXpC
	yUMfaWnXY4pqFsMP6Eq1pH3KoscNk1Ln7Aeg1c8+VodGNfwmH1tPj85XvsAR50jrPtTONX10MrLXF
	CIcZjDujNcvsXHhOE2SeYoKMkI06ZBkXbrHasoJBc0kp7j5+rGaspcFRi17KdH6tw7M8RIjBNiO80
	MLwqyKFlsJjS80wycxQv/Ss/6aSOZ22k6trNCQ/POW8sUVAPloYE9NJSpSVO75Lm0M8XZOx/K1/yy
	YTh7s6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNRe-0000000Dg9z-3sfs;
	Tue, 05 Aug 2025 19:35:34 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNP1-0000000Dfs4-2unk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 19:32:53 +0000
Message-ID: <08bd431d-c887-4f69-9c1e-4b40a301ecf7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754422369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYUMZ7E+6vJC5FpLL2HyF+nE/45hsY2ZWy2Xc7WZ050=;
	b=rVO1Gy+/hQM6eI5atg/ciXvbT7rpZLZEeM39lIPN0WohD6C7XJ489W4czPj/rOnkMi04OR
	DVNGL/YRdy1/OxMAAdbHeP1fk73KWF7aLMPbsaYZqcmIkJz2fJ7rlmhuYE0mnch2kEv9Yg
	1J2TJBm7uGAVcGLOyj6bpl7t1riDkqc=
Date: Tue, 5 Aug 2025 15:32:41 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net] net: xilinx: axienet: Increment Rx skb ring head
 pointer after BD is successfully allocated in dmaengine flow
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
References: <20250805191958.412220-1-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250805191958.412220-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_123251_947579_58320565 
X-CRM114-Status: GOOD (  15.44  )
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

On 8/5/25 15:19, Suraj Gupta wrote:
> In DMAengine flow, AXI DMA driver invokes callback before freeing BD in
> irq handling path.
> In Rx callback (axienet_dma_rx_cb()), axienet driver tries to allocate
> new BD after processing skb.
> This will be problematic if both AXI-DMA and AXI ethernet have same
> BD count as all Rx BDs will be allocated initially and it won't be
> able to allocate new one after Rx irq. Incrementing head pointer w/o
> checking for BD allocation will result in garbage values in skb BD and
> cause the below kernel crash:
> 
> Unable to handle kernel paging request at virtual address fffffffffffffffa
> <snip>
> Internal error: Oops: 0000000096000006 [#1]  SMP
> pc : axienet_dma_rx_cb+0x78/0x150
> lr : axienet_dma_rx_cb+0x78/0x150
>  Call trace:
>   axienet_dma_rx_cb+0x78/0x150 (P)
>   xilinx_dma_do_tasklet+0xdc/0x290
>   tasklet_action_common+0x12c/0x178
>   tasklet_action+0x30/0x3c
>   handle_softirqs+0xf8/0x230
> <snip>
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 6011d7eae0c7..acd5be60afec 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1457,7 +1457,6 @@ static void axienet_rx_submit_desc(struct net_device *ndev)
>  	if (!skbuf_dma)
>  		return;
>  
> -	lp->rx_ring_head++;
>  	skb = netdev_alloc_skb(ndev, lp->max_frm_size);
>  	if (!skb)
>  		return;
> @@ -1482,6 +1481,7 @@ static void axienet_rx_submit_desc(struct net_device *ndev)
>  	skbuf_dma->desc = dma_rx_desc;
>  	dma_rx_desc->callback_param = lp;
>  	dma_rx_desc->callback_result = axienet_dma_rx_cb;
> +	lp->rx_ring_head++;
>  	dmaengine_submit(dma_rx_desc);
>  
>  	return;

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

