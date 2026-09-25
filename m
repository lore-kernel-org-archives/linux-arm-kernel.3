Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D75DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cppdBQoCb8bN1cmIysHAU9UTT/fw4ZboMtHQ8fzju74=; b=hL15kBNr/qoLgNhwsfhQa+HhVG
	E1Kss9YwOGHR826mQnSEiLMDJQXjb0xj6A+/bC6RQ/Wnr3orhuvnwawl9zB1okSjB4GJvfgVtwds4
	AkpkHCRrv0qQo/ppJhRnR1KrTaeyE5AKnnelJuo9bckjPPuaf0pdmRVTu5gb82f0JOFIVuQGvWJpO
	Kvocjsg8Cw+7mdzFa6PU6tqcR2mV3IERSY2RlgXECT0nKHetFVhN1dleV388qwOd3OWSeUxlsfj2x
	eYU1ZWsEPjMZXD5twgTfsEsgCp5C7CJ26ork++6RRZD3DnUObX4iUgSTFjn+hbTaOX9iXYogO4Yoo
	wbPg0iSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8xe-0000000Dy7m-172a;
	Fri, 25 Sep 2026 16:39:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8xc-0000000Dy72-1oj2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:39:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 315D441533;
	Fri, 25 Sep 2026 16:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9132A1F00898;
	Fri, 25 Sep 2026 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354384;
	bh=cppdBQoCb8bN1cmIysHAU9UTT/fw4ZboMtHQ8fzju74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G+B2oGu+tkA3M+a0whMu6w4BjGSf7tYcTyar5mf5fxaInlCj5dVBNfp3Q+Rcm8R9x
	 n/mvz0d3+GvcmFH/o1+oKiLQdQSZTkfvcSVkdQVth0Y6IWAPBwWDP0M+bDQJMa08+W
	 2oZCqpmpZNH+w3dijvCEevMzMdk5wZ+XcJwRtujThHRS1nvBnu3DyePOiWnz8xUFBc
	 qKVj+/VvhpETOdE1wQUM0WaMhgb1c5ckIBgl/nxYU1zvcAn4e3b+9xp+ponjvDWsgU
	 W9lGKf41qmMkZq7uzbCUVO4oTroHYBWO2sCG5MciQ6VqGEVYwvRuN+VikvzxrzNG1q
	 JLEKckGvts/Bw==
From: Simon Horman <horms@kernel.org>
To: parvathi@couthit.com
Cc: Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	pmohan@couthit.com,
	afd@ti.com,
	vadim.fedorenko@linux.dev,
	haokexin@gmail.com,
	basharath@couthit.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v4 2/3] net: ti: icssm-prueth: Add priority based RX IRQ handlers
Date: Fri, 25 Sep 2026 17:39:33 +0100
Message-ID: <20260925163933.721156-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921134343.200426-3-parvathi@couthit.com>
References: <20260921134343.200426-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260921134343.200426-4-parvathi@couthit.com?part=2
---
Subject: net: ti: icssm-prueth: Add priority based RX IRQ handlers

This commit adds support for priority-based interrupt handling for the STP/RSTP
Switch, HSR, and PRP protocols to address port dominance. It records an IEP
hardware timestamp into the receive buffer to guarantee frames are delivered in
wire-arrival order. The patch also converts statistics counters to atomic64_t
and adds a firmware revision field to support different timestamp wraparound
behaviors.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 6c8888d9d66a6..4a37935b8d352 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
[ ... ]
> @@ -1071,11 +1083,25 @@ static int icssm_emac_ndo_open(struct net_device *ndev)
>  			goto iep_exit;
>  	}
>  
> -	ret = icssm_emac_request_irqs(emac);
> -	if (ret)
> -		goto rproc_shutdown;
> +	if (PRUETH_IS_EMAC(prueth)) {
> +		napi_enable(&emac->napi);
> +	} else {
> +		if (!prueth->emac_configured &&
> +		    (PRUETH_IS_SWITCH(prueth) || prueth_is_lre(prueth))) {
> +			napi_enable(&prueth->napi_hpq);
> +			napi_enable(&prueth->napi_lpq);

[Severity: High]
Does this code risk a NULL pointer dereference?

If MII0 is missing (e.g., absent from the device tree), the shared NAPI
structures napi_hpq and napi_lpq are not initialized in
icssm_prueth_netdev_init(). If the MII1 interface is later placed into SWITCH
mode and brought up, it appears icssm_emac_ndo_open() will unconditionally call
napi_enable() on these zero-initialized structures, causing a NULL pointer
dereference on n->dev.

> +		}
> +	}
[ ... ]
> @@ -1780,9 +1820,25 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  
>  	netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
>  
> +	if ((prueth->support_lre || fw_data->support_switch) &&
> +	    emac->port_id == PRUETH_PORT_MII0) {
> +		netif_napi_add(ndev, &prueth->napi_hpq,
> +			       icssm_prueth_common_napi_poll_hpq);
> +		netif_napi_add(ndev, &prueth->napi_lpq,
> +			       icssm_prueth_common_napi_poll_lpq);
> +	}
> +
>  	hrtimer_setup(&emac->tx_hrtimer, &icssm_emac_tx_timer_callback,
>  		      CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
>  
> +	if ((prueth->support_lre || fw_data->support_switch) &&
> +	    emac->port_id == PRUETH_PORT_MII0) {
> +		prueth->hp->ndev = ndev;
> +		prueth->hp->priority = 0;
> +		prueth->lp->ndev = ndev;
> +		prueth->lp->priority = 1;
> +	}
> +
>  	return 0;
[ ... ]
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> new file mode 100644
> index 0000000000000..9b7b876240b5f
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
[ ... ]
> +static irqreturn_t icssm_prueth_common_emac_rx_hardirq(int irq, void *dev_id)
> +{
> +	struct prueth_ndev_priority *ndev_prio;
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	struct prueth *prueth;
> +
> +	ndev_prio = (struct prueth_ndev_priority *)dev_id;
> +	ndev = ndev_prio->ndev;

[Severity: High]
Similarly, can this IRQ handler dereference an uninitialized pointer?

If MII0 is missing and these priority structures were skipped during
initialization, it looks like the registered IRQ handler will dereference the
zero-initialized ndev_prio->ndev here when an interrupt occurs.

> +	emac = netdev_priv(ndev);
> +	prueth = emac->prueth;

[Severity: Medium]
This is a pre-existing issue, but can the transmission path read out of bounds?

In drivers/net/ethernet/ti/icssm/icssm_prueth.c:icssm_prueth_get_tx_queue_id():

    err = vlan_get_tag(skb, &vlan_tci);

icssm_emac_ndo_start_xmit() calls icssm_prueth_get_tx_queue_id() before
validating the length of the transmitted skb or padding it. Because the device
lacks NETIF_F_HW_VLAN_CTAG_TX, vlan_get_tag() falls back to __vlan_get_tag(),
which reads the VLAN TCI at offset 14. If a raw socket transmits a packet
smaller than 18 bytes (e.g., exactly 14 bytes) with h_vlan_proto ==
ETH_P_8021Q, this reads unallocated memory past the buffer.

