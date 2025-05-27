Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F51C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3LFQ0ieKQpaqxJLyJ9iyNsYYxmUvLgA8cPK/4ZnBaA=; b=zXH58Ibvh+ZHsMXb0bghzLvn4Q
	5w4L9S8Xf+f10fJk1IaRiXw4gkSM7PSVl1ZpSPq1InKmrmRzQzrq3MeEJcDY/Tn1wOSzOjJZFIK/L
	S7TL49/3wf7d1keXENQ7I3fx16L8g/f3eM6TKqdtC4JU88iTpIHn3B7ZcAtw8IHIh2/jub+Jv4NEU
	fm+qUyuqYA2lEWr/sIS45sfSc3fBeyC+rIlHxqaB+q0+hwboGaOSDLEG7hEgVT+Zs0Msf0yGnD6V0
	Om6LNtHMEIOiw+K9VVuY2TbkASaqjdmDnBU0oAkjUsdS+iJgiLG9tRolWdv4b5jSNL7hdsGsr1pYu
	AE8+5Ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJx0x-0000000B8pV-1ix6;
	Tue, 27 May 2025 16:18:55 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwyp-0000000B8h9-0FIt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 16:16:44 +0000
Message-ID: <679d6810-9e76-425c-9d4e-d4b372928cc3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748362598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3LFQ0ieKQpaqxJLyJ9iyNsYYxmUvLgA8cPK/4ZnBaA=;
	b=lJ76ReqCndDsN2ac38Fwh/jWjcCo2hpONkdcTz62+a+81d9l4G453nftIx12FEoP1sN/3h
	jcdKYutfgp+F/fQLwpRhQULLtaCY0bF39U1clrBcTwRBngWggAwVjiVkUeLjdY15PUm/0v
	ny5lqbRvcqcxSHnoT9BeHyefrJImKFw=
Date: Tue, 27 May 2025 12:16:33 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, vkoul@kernel.org, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250525102217.1181104-1-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_091643_543427_94B9C59E 
X-CRM114-Status: GOOD (  22.77  )
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

On 5/25/25 06:22, Suraj Gupta wrote:
> Add support to configure / report interrupt coalesce count and delay via
> ethtool in DMAEngine flow.
> Netperf numbers are not good when using non-dmaengine default values,
> so tuned coalesce count and delay and defined separate default
> values in dmaengine flow.
> 
> Netperf numbers and CPU utilisation change in DMAengine flow after
> introducing coalescing with default parameters:
> coalesce parameters:
>    Transfer type	  Before(w/o coalescing)  After(with coalescing)
> TCP Tx, CPU utilisation%	925, 27			941, 22
> TCP Rx, CPU utilisation%	607, 32			741, 36
> UDP Tx, CPU utilisation%	857, 31			960, 28
> UDP Rx, CPU utilisation%	762, 26			783, 18
> 
> Above numbers are observed with 4x Cortex-a53.

How does this affect latency? I would expect these RX settings to
increase latency around 5-10x. I only use these settings with DIM since
it will disable coalescing during periods of light load for better
latency.

(of course the way to fix this in general is RSS or some other method
involving multiple queues).

> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
> This patch depend on following AXI DMA dmengine driver changes sent to
> dmaengine mailing list as pre-requisit series:
> https://lore.kernel.org/all/20250525101617.1168991-1-suraj.gupta2@amd.com/ 
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet.h  |  6 +++
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 53 +++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 5ff742103beb..cdf6cbb6f2fd 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -126,6 +126,12 @@
>  #define XAXIDMA_DFT_TX_USEC		50
>  #define XAXIDMA_DFT_RX_USEC		16
>  
> +/* Default TX/RX Threshold and delay timer values for SGDMA mode with DMAEngine */
> +#define XAXIDMAENGINE_DFT_TX_THRESHOLD	16
> +#define XAXIDMAENGINE_DFT_TX_USEC	5
> +#define XAXIDMAENGINE_DFT_RX_THRESHOLD	24
> +#define XAXIDMAENGINE_DFT_RX_USEC	16
> +
>  #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
>  #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
>  #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 1b7a653c1f4e..f9c7d90d4ecb 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1505,6 +1505,7 @@ static int axienet_init_dmaengine(struct net_device *ndev)
>  {
>  	struct axienet_local *lp = netdev_priv(ndev);
>  	struct skbuf_dma_descriptor *skbuf_dma;
> +	struct dma_slave_config tx_config, rx_config;
>  	int i, ret;
>  
>  	lp->tx_chan = dma_request_chan(lp->dev, "tx_chan0");
> @@ -1520,6 +1521,22 @@ static int axienet_init_dmaengine(struct net_device *ndev)
>  		goto err_dma_release_tx;
>  	}
>  
> +	tx_config.coalesce_cnt = XAXIDMAENGINE_DFT_TX_THRESHOLD;
> +	tx_config.coalesce_usecs = XAXIDMAENGINE_DFT_TX_USEC;
> +	rx_config.coalesce_cnt = XAXIDMAENGINE_DFT_RX_THRESHOLD;
> +	rx_config.coalesce_usecs =  XAXIDMAENGINE_DFT_RX_USEC;

I think it would be clearer to just do something like

	struct dma_slave_config tx_config = {
		.coalesce_cnt = 16,
		.coalesce_usecs = 5,
	};

since these are only used once. And this ensures that you initialize the
whole struct.

But what tree are you using? I don't see these members on net-next or
dmaengine.

> +	ret = dmaengine_slave_config(lp->tx_chan, &tx_config);
> +	if (ret) {
> +		dev_err(lp->dev, "Failed to configure Tx coalesce parameters\n");
> +		goto err_dma_release_tx;
> +	}
> +	ret = dmaengine_slave_config(lp->rx_chan, &rx_config);
> +	if (ret) {
> +		dev_err(lp->dev, "Failed to configure Rx coalesce parameters\n");
> +		goto err_dma_release_tx;
> +	}
> +
>  	lp->tx_ring_tail = 0;
>  	lp->tx_ring_head = 0;
>  	lp->rx_ring_tail = 0;
> @@ -2170,6 +2187,19 @@ axienet_ethtools_get_coalesce(struct net_device *ndev,
>  	struct axienet_local *lp = netdev_priv(ndev);
>  	u32 cr;
>  
> +	if (lp->use_dmaengine) {
> +		struct dma_slave_caps tx_caps, rx_caps;
> +
> +		dma_get_slave_caps(lp->tx_chan, &tx_caps);
> +		dma_get_slave_caps(lp->rx_chan, &rx_caps);
> +
> +		ecoalesce->tx_max_coalesced_frames = tx_caps.coalesce_cnt;
> +		ecoalesce->tx_coalesce_usecs = tx_caps.coalesce_usecs;
> +		ecoalesce->rx_max_coalesced_frames = rx_caps.coalesce_cnt;
> +		ecoalesce->rx_coalesce_usecs = rx_caps.coalesce_usecs;
> +		return 0;
> +	}
> +
>  	ecoalesce->use_adaptive_rx_coalesce = lp->rx_dim_enabled;
>  
>  	spin_lock_irq(&lp->rx_cr_lock);
> @@ -2233,6 +2263,29 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
>  		return -EINVAL;
>  	}
>  
> +	if (lp->use_dmaengine)	{
> +		struct dma_slave_config tx_cfg, rx_cfg;
> +		int ret;
> +
> +		tx_cfg.coalesce_cnt = ecoalesce->tx_max_coalesced_frames;
> +		tx_cfg.coalesce_usecs = ecoalesce->tx_coalesce_usecs;
> +		rx_cfg.coalesce_cnt = ecoalesce->rx_max_coalesced_frames;
> +		rx_cfg.coalesce_usecs = ecoalesce->rx_coalesce_usecs;
> +
> +		ret = dmaengine_slave_config(lp->tx_chan, &tx_cfg);
> +		if (ret) {
> +			NL_SET_ERR_MSG(extack, "failed to set tx coalesce parameters");
> +			return ret;
> +		}
> +
> +		ret = dmaengine_slave_config(lp->rx_chan, &rx_cfg);
> +		if (ret) {
> +			NL_SET_ERR_MSG(extack, "failed to set rx coalesce parameters");
> +			return ret;
> +		}
> +		return 0;
> +	}
> +
>  	if (new_dim && !old_dim) {
>  		cr = axienet_calc_cr(lp, axienet_dim_coalesce_count_rx(lp),
>  				     ecoalesce->rx_coalesce_usecs);

