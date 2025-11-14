Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352ECE7AAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKozIGdo/Md82gL4F2BuJr8hu9VIueEARUXTUUm53KA=; b=m/9uSJFYLaBV+z4lkq+UBXRWJh
	AtL3Gtsgi/trfkaaXPcuduiQYzFW0nvTQfvqt0Jomy0CROjBoStO/zFRhVmUlF+pIYgLNXSdc8GFO
	NCRAnyCUYv5sFbQIpaKA0Cm1Nh2A5Hro2ali7t1kTbZ3YaI2XmVNsbAQuvVFUHoa677wIiHtfkBCH
	FoYc+Bjwo5cbPGCb6qM7jRr4OxsTxJbvx4TvoCrgok8HXfshIILfRmXkM1bFBghY1rLGHstAyJ8Di
	on5gRp4wgflWnAwSmbkYnS8sJe1SlyRhYGqvI1JnOCnezhy/mw2tCapZePek+rPSCS+mYxCzatrhO
	RAc1mitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrAZ-0000000C2az-0QOu;
	Fri, 14 Nov 2025 10:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrAX-0000000C2ag-3liQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ADF06016F;
	Fri, 14 Nov 2025 10:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5859C16AAE;
	Fri, 14 Nov 2025 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763116600;
	bh=L2b6ovufuyOt5g32IaXTrP6gxb4p0lvhYk/QMzL7CJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D34ygwUkaO6WppRI8fXcJ3A6BLaqCr0fNnDObMD8fJrTRPxTM7uWoU8ibS7b48U6h
	 QoMwQvDWY8pG7VgK1eTSn6R/AjU54XduoGsAnBLwX11YIroehRNgdl3jNE1jZu+gzr
	 fkm35KnnUiLtpAH2DYW3mt1t5EQg6f8EJkjQy+wZHrhwbXYEremTOlk/YdJJWy7tAq
	 RoQLFjUwt3P2iGp5QLOKVwNsAPliSgfqaE015PrF1GD8ye19//iE/3DP4qom4JLWir
	 sXB1McFrxuaPiaHkEtWoXPHDtF6v6s4QLPJuinyg1qXN3XdzLE2n106PGDu3TUgEaf
	 qQluzMKzcqB6Q==
Date: Fri, 14 Nov 2025 10:36:33 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: namcao@linutronix.de, vadim.fedorenko@linux.dev,
	jacob.e.keller@intel.com, christian.koenig@amd.com,
	sumit.semwal@linaro.org, sdf@fomichev.me, john.fastabend@gmail.com,
	hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net-next v5 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
Message-ID: <aRcGMTRzDFwe23NV@horms.kernel.org>
References: <20251111101523.3160680-1-m-malladi@ti.com>
 <20251111101523.3160680-2-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111101523.3160680-2-m-malladi@ti.com>
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

On Tue, Nov 11, 2025 at 03:45:18PM +0530, Meghana Malladi wrote:

...

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 57a7d1ceab08..b66ffbfb499c 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -735,6 +735,114 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
>  	return 0;
>  }
>  
> +static void prueth_destroy_txq(struct prueth_emac *emac)
> +{
> +	int ret, i;
> +
> +	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
> +	/* ensure new tdown_cnt value is visible */
> +	smp_mb__after_atomic();
> +	/* tear down and disable UDMA channels */
> +	reinit_completion(&emac->tdown_complete);
> +	for (i = 0; i < emac->tx_ch_num; i++)
> +		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
> +
> +	ret = wait_for_completion_timeout(&emac->tdown_complete,
> +					  msecs_to_jiffies(1000));
> +	if (!ret)
> +		netdev_err(emac->ndev, "tx teardown timeout\n");
> +
> +	for (i = 0; i < emac->tx_ch_num; i++) {
> +		napi_disable(&emac->tx_chns[i].napi_tx);
> +		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
> +		k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
> +					  &emac->tx_chns[i],
> +					  prueth_tx_cleanup);
> +		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
> +	}
> +}
> +
> +static void prueth_destroy_rxq(struct prueth_emac *emac)
> +{
> +	int i, ret;
> +
> +	/* tear down and disable UDMA channels */
> +	reinit_completion(&emac->tdown_complete);
> +	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
> +
> +	/* When RX DMA Channel Teardown is initiated, it will result in an
> +	 * interrupt and a Teardown Completion Marker (TDCM) is queued into
> +	 * the RX Completion queue. Acknowledging the interrupt involves
> +	 * popping the TDCM descriptor from the RX Completion queue via the
> +	 * RX NAPI Handler. To avoid timing out when waiting for the TDCM to
> +	 * be popped, schedule the RX NAPI handler to run immediately.
> +	 */
> +	if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
> +		if (napi_schedule_prep(&emac->napi_rx))
> +			__napi_schedule(&emac->napi_rx);
> +	}
> +
> +	ret = wait_for_completion_timeout(&emac->tdown_complete,
> +					  msecs_to_jiffies(1000));
> +	if (!ret)
> +		netdev_err(emac->ndev, "rx teardown timeout\n");
> +
> +	for (i = 0; i < PRUETH_MAX_RX_FLOWS; i++) {
> +		napi_disable(&emac->napi_rx);
> +		hrtimer_cancel(&emac->rx_hrtimer);

Hi Meghana,

Is it intentional that the napi_disable() and hrtimer_cancel()
are made once for each (possible) flow, rather than just once
as was the case before this patch?

Maybe the tx code, which does the same, was used as a template here
in error?

Flagged by Claude Code with https://github.com/masoncl/review-prompts/

> +		k3_udma_glue_reset_rx_chn(emac->rx_chns.rx_chn, i,
> +					  &emac->rx_chns,
> +					  prueth_rx_cleanup);
> +	}
> +
> +	prueth_destroy_xdp_rxqs(emac);
> +	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
> +}

...

> @@ -905,32 +988,8 @@ static int emac_ndo_stop(struct net_device *ndev)
>  	else
>  		__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
>  
> -	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
> -	/* ensure new tdown_cnt value is visible */
> -	smp_mb__after_atomic();
> -	/* tear down and disable UDMA channels */
> -	reinit_completion(&emac->tdown_complete);
> -	for (i = 0; i < emac->tx_ch_num; i++)
> -		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
> -
> -	ret = wait_for_completion_timeout(&emac->tdown_complete,
> -					  msecs_to_jiffies(1000));
> -	if (!ret)
> -		netdev_err(ndev, "tx teardown timeout\n");
> -
> -	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
> -	for (i = 0; i < emac->tx_ch_num; i++) {
> -		napi_disable(&emac->tx_chns[i].napi_tx);
> -		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
> -	}
> -
> -	max_rx_flows = PRUETH_MAX_RX_FLOWS;
> -	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
> -
> -	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
> -	prueth_destroy_xdp_rxqs(emac);
> -	napi_disable(&emac->napi_rx);
> -	hrtimer_cancel(&emac->rx_hrtimer);
> +	prueth_destroy_txq(emac);
> +	prueth_destroy_rxq(emac);
>  
>  	cancel_work_sync(&emac->rx_mode_work);
>  
> @@ -943,10 +1002,10 @@ static int emac_ndo_stop(struct net_device *ndev)
>  
>  	free_irq(emac->tx_ts_irq, emac);
>  
> -	free_irq(emac->rx_chns.irq[rx_flow], emac);
> +	free_irq(emac->rx_chns.irq[PRUETH_RX_FLOW_DATA], emac);
>  	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
>  
> -	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
> +	prueth_cleanup_rx_chns(emac, &emac->rx_chns, PRUETH_MAX_RX_FLOWS);
>  	prueth_cleanup_tx_chns(emac);
>  
>  	prueth->emacs_initialized--;

...

