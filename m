Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B902CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM7TE7exdYuQCUvvTDui+rJZ2DPmZv/3pJBXSuDfZEY=; b=AITLuSj0EDW2YrIHL8oJzqR1pU
	+o+c5wiXsNPa/aTBaPnZklFQAzh3i+WNJgmloakL5XZd7XMt9LsxeG6MkJT4UeBJh7ZjMincZABZ6
	WHZhdvIdM71RcnywgczQF8ERk3hY/CfoiYuGTw/UNllrwK+ZjkLNRvBICNPr4rCpGYwpjNkXH+yJe
	qxjEYlwfCdOXfSQLXc+FlJ2DD91zAzADnXj2B73ngelpBGjwlhoUINBwvg0XWSLxzfLk09V9SQhTz
	gO9Dc8Z6/P5jCCQ+e/9ggSMb1J+dzXQ15dRSmektjElamBDcxuhuwQ3GdoOrUPR73ODtumwuckwGk
	OCCCr9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDenE-0000000FyuA-1UGp;
	Mon, 05 Oct 2026 09:15:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDenA-0000000Fytb-0bXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:15:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80BE81A116A;
	Mon,  5 Oct 2026 09:15:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FD29604FE;
	Mon,  5 Oct 2026 09:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D83721033071E;
	Mon,  5 Oct 2026 11:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791191722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YM7TE7exdYuQCUvvTDui+rJZ2DPmZv/3pJBXSuDfZEY=;
	b=dwOWGp8wKr0jZVpSpX3ZYBI4KFhl54LXQ9h6fu3/xkcdNtS7BtWiV1Hbkysk4k0skqq6N3
	/cVZrAg46Ju8MU3LPgMVJuu/6igHYukg4F3FTd8BJ6kYFX5BOqTUP6hZZptWyWvpe4on9y
	K3mJ8dY0itsAP9AVfG7omEZZJmCW2M/n1O361nbh3QvCpn7sx7DMS9/21UY9fkiGXMpbvW
	j9+bruWHVmU+tAohvm6D5pGU4KF/5S3kh5KX8g62P6ye2dURx7tGDXDVZzIHPCGQEgy6Wk
	YVmEiFX1WvgGqb6oxSX5itxoEzwaaMqUwpu8s0BDJmtuOpfv50+lLtDRs3D5dw==
Message-ID: <6bb85939-ff35-46e1-88cc-1bed0034e787@bootlin.com>
Date: Mon, 5 Oct 2026 11:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
To: Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>,
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
 <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_021529_671949_812ED9B2 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Kurt,

On 10/5/26 09:09, Kurt Kanzenbach wrote:
> Attaching an XDP program while Tx traffic is running results in kernel
> crashes in stmmac_xmit() -> dwmac4_set_addr().
> 
> Loading an XDP program tears down and reallocates all DMA resources via
> stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
> the Tx queues before disabling NAPI:
> 
>  stmmac_xdp_release:
>    netif_tx_disable
>    stmmac_disable_all_queues
>    ...
>    free_dma_desc_resources
> 
> A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
> takes the Tx queue lock, reaps completed descriptors and wakes the queue
> again when it observes it stopped with enough descriptors available.
> Nothing stops the queue afterwards, so the Tx path resumes while
> free_dma_desc_resources() releases the descriptor rings underneath it.
> 
> On non-coherent platforms dma_free_coherent() tears down the vmalloc
> mapping of the descriptors, so the subsequent stmmac_xmit() faults on an
> unmapped address instead of corrupting memory silently.
> 
> Disable NAPI first and stop the Tx queues afterwards, which is the order
> already used by __stmmac_release().
> 
> The issue can be easily reproduced by:
> 
>  1. Run iperf
>  2. Run application which opens an AF_XDP/ZC socket
> 
> Assisted-by: Claude:claude-opus-5
> Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in stmmac_xdp_release()")
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>

This now matches the non-xdp case, great :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9741f97fa37a..796817caf7af 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7178,15 +7178,15 @@ void stmmac_xdp_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u8 chan;
>  
> -	/* Ensure tx function is not running */
> -	netif_tx_disable(dev);
> -
>  	/* Disable NAPI process */
>  	stmmac_disable_all_queues(priv);
>  
>  	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>  
> +	/* Ensure tx function is not running */
> +	netif_tx_disable(dev);
> +
>  	/* Free the IRQ lines */
>  	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
>  
> 


