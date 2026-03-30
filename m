Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A861061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbI/xWQ/rrC6wAb85E1XodfYiivSfrUvb5aJFFUK0R4=; b=POgYORFJF+f2d+hnn3mb/3jHDL
	3KP/u6FctJPhIZdjcv7gKpLk3/3IwpvQ+ANyW++81QyzxBc2zTpELliZvdAP1wspKlPXCHwkWdN3m
	k5JP6p+aUsT8M/ghXhVaa9MvyL2HI15i44Me0cYiGlgxQkXeAocyy7AcWbHG/i6Q2AZfPLpoga1/M
	nRZI722FZ9wy29/igtKtzc7rgmVHnkhZVnDOnc4RQbm6MqhTAopkuPtHM4tIvLIKAtIT4yHTtYuxP
	d0LZ7pwAP4M5UzVqJOnp7zOvRXFRC/wqR4eZssNEafqNXSBM5vl5h2KwnHhqI4S+V+qMNMXvS43Q8
	z5TEUjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hgr-0000000BkWs-2zuZ;
	Mon, 30 Mar 2026 18:50:21 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hgm-0000000BkUQ-3jcn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 18:50:18 +0000
Message-ID: <8a57e85b-8917-48b8-9412-b10a38fa230b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774896612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbI/xWQ/rrC6wAb85E1XodfYiivSfrUvb5aJFFUK0R4=;
	b=dXamNKUKlXf3V7TOgKCvckNA8R4hlEefGV1lkULsTRrQwPcO2HWM0lPy99bob7KpucHVR2
	/8gwDkVk+iRKYIITKU+oy1ANThY8TLqSVDzZVX4hMvZS5Rr2cSLcS00JMdKNC/JI5oV52B
	Z4J7fYAAc5CJeelap4+eCNbFtAmW+oU=
Date: Mon, 30 Mar 2026 14:49:59 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net V2 2/2] net: xilinx: axienet: Fix BQL accounting for
 multi-BD TX packets
To: Suraj Gupta <suraj.gupta2@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Michal Simek <michal.simek@amd.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Ariane Keller <ariane.keller@tik.ee.ethz.ch>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260327073238.134948-1-suraj.gupta2@amd.com>
 <20260327073238.134948-3-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260327073238.134948-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_115017_223319_16AB0EBD 
X-CRM114-Status: GOOD (  21.94  )
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

On 3/27/26 03:32, Suraj Gupta wrote:
> When a TX packet spans multiple buffer descriptors (scatter-gather),
> axienet_free_tx_chain sums the per-BD actual length from descriptor
> status into a caller-provided accumulator. That sum is reset on each
> NAPI poll. If the BDs for a single packet complete across different
> polls, the earlier bytes are lost and never credited to BQL. This
> causes BQL to think bytes are permanently in-flight, eventually
> stalling the TX queue.
> 
> The SKB pointer is stored only on the last BD of a packet. When that
> BD completes, use skb->len for the byte count instead of summing
> per-BD status lengths. This matches netdev_sent_queue(), which debits
> skb->len, and naturally survives across polls because no partial
> packet contributes to the accumulator.
> 
> Fixes: c900e49d58eb ("net: xilinx: axienet: Implement BQL")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index b06e4c37ff61..263c4b67fd5a 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -770,8 +770,8 @@ static int axienet_device_reset(struct net_device *ndev)
>   * @first_bd:	Index of first descriptor to clean up
>   * @nr_bds:	Max number of descriptors to clean up
>   * @force:	Whether to clean descriptors even if not complete
> - * @sizep:	Pointer to a u32 filled with the total sum of all bytes
> - *		in all cleaned-up descriptors. Ignored if NULL.
> + * @sizep:	Pointer to a u32 accumulating the total byte count of
> + *		completed packets (using skb->len). Ignored if NULL.
>   * @budget:	NAPI budget (use 0 when not called from NAPI poll)
>   *
>   * Would either be called after a successful transmit operation, or after
> @@ -805,6 +805,8 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  				 DMA_TO_DEVICE);
>  
>  		if (cur_p->skb && (status & XAXIDMA_BD_STS_COMPLETE_MASK)) {
> +			if (sizep)
> +				*sizep += cur_p->skb->len;
>  			napi_consume_skb(cur_p->skb, budget);
>  			packets++;
>  		}
> @@ -818,9 +820,6 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
>  		wmb();
>  		cur_p->cntrl = 0;
>  		cur_p->status = 0;
> -
> -		if (sizep)
> -			*sizep += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
>  	}
>  
>  	if (!force) {

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

Although FWIW this may result in slightly-different statistics. Not sure
if we care since this will only affect packets that could not be sent
for whatever reason (collisions, loss of carrier, etc.)

