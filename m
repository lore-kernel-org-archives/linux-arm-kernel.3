Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB44DCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuVbAyLZAEOmGbshQeNziA8N4YaVeGOgucBjBDGUMSo=; b=EULbYRFOX8cunUwqYfJI/IMSqN
	QZEz3B/MsI9BsBA7Yb8UMdvHuL7FlZPmvQ2iKiempbsIR6udUb2Kssz9R6d3S8DRSzPAr9er3FCMW
	e0ezo5YsUQDe5l+i5p8D4HPGYyVO1HvuPCA9v3Fbqx4E9QNkT0Ws0B4PcsaHY54XHvB4z1q+++Ruy
	GSOAx+lX6nrUotixH/K3fktS1kZzAKyapxuIiV2tXTnICyNNOlom+WAbmL021YNKZKUkaZRWEMZzg
	us7tpStvqenBThtUxrDhW8cdRLrVkuJj08kaQKpeQduLxoDyT+DzuNtw/+jaALD/cf36+orJISRww
	IpXhfnvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWlo-00000007vgx-2mGy;
	Sat, 09 May 2026 01:46:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWlh-00000007vcW-2soT;
	Sat, 09 May 2026 01:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65C7843B9E;
	Sat,  9 May 2026 01:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2AAC2BCB0;
	Sat,  9 May 2026 01:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778291173;
	bh=mp2ZQVuKoI/GitBcxUoDpxVotzf5sy1ZjJulzPRcuwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjVuPyO9ncYs0l6zVPbbKV/DTduE3RsKesmJDF6T7SV/bfhLjE00B+jQwNVp1otva
	 i5sTt6KebQFf5Kr6vs5DDzlNic100P7oN9o/4JFT98h3lLD+JGdBupcKuK5x8i50vr
	 +UEGTakwnKCvd9aYhTinzu9V6/nZ5R2u3J27AfRAehbFn8wjfLqrc+ksi2h7iRUuki
	 lAWdYyFBbG/rmwHOjIta67gve1hcmuhEEk8G0oKn04vuJ26vQc/7Z/4O5dhkqobSne
	 M2/ug2+nSKZlg4FdzbtU1i4jB00h7BxYdxDBV26+En8cAq/Dst9AhIV+6mRFbb+Vg3
	 1OM7nrFNGldQw==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 07/10] net: airoha: Support multiple net_devices for a single FE GDM port
Date: Fri,  8 May 2026 18:46:11 -0700
Message-ID: <20260509014611.3558060-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-7-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-7-af613b61ae02@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_184613_866119_78C4F659 
X-CRM114-Status: GOOD (  19.70  )
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
---
net: airoha: Support multiple net_devices for a single FE GDM port

This commit introduces support for multiple net_devices connected to the
same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hardware
arbiter on EN7581 or AN7583 SoCs, and adds a get_dev_from_sport callback
to differentiate between the net_devices attached to each port.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 786bc677af3c..0253919714e0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -3188,14 +3257,23 @@ static int airoha_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port = eth->ports[i];
> -		struct airoha_gdm_dev *dev;
> +		int j;
>  
>  		if (!port)
>  			continue;
>  
> -		dev = port->dev;
> -		if (dev && dev->dev->reg_state == NETREG_REGISTERED)
> -			unregister_netdev(dev->dev);
> +		for (j = 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *dev = port->devs[j];
> +			struct net_device *netdev;
> +
> +			if (!dev)
> +				continue;
> +
> +			netdev = dev->dev;
> +			of_node_put(netdev->dev.of_node);
> +			if (netdev->reg_state == NETREG_REGISTERED)
> +				unregister_netdev(netdev);
> +		}
>  		airoha_metadata_dst_free(port);
>  	}
>  	airoha_hw_cleanup(eth);

[Medium]
Is the ordering of of_node_put() and unregister_netdev() here correct?

airoha_alloc_gdm_device() now does:

	netdev->dev.of_node = of_node_get(np);

so the netdev holds its own reference to the of_node for its entire
registered lifetime. In this error unwind the of_node_put() runs before
unregister_netdev(), and netdev->dev.of_node is not cleared, so any
subsequent access to netdev->dev.of_node during unregistration (netdev
notifiers, sysfs, overlay-aware code) would be looking at a node whose
reference count has already been dropped.

Other drivers (e.g., drivers/net/ethernet/hisilicon/hns/hns_enet.c in
hns_nic_dev_remove()) put the node only after unregister_netdev().

Would swapping the order to call unregister_netdev() first, then
of_node_put(), be more appropriate here?

> @@ -3216,14 +3294,22 @@ static void airoha_remove(struct platform_device *pdev)
>  
>  	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
>  		struct airoha_gdm_port *port = eth->ports[i];
> -		struct airoha_gdm_dev *dev;
> +		int j;
>  
>  		if (!port)
>  			continue;
>  
> -		dev = port->dev;
> -		if (dev)
> -			unregister_netdev(dev->dev);
> +		for (j = 0; j < ARRAY_SIZE(port->devs); j++) {
> +			struct airoha_gdm_dev *dev = port->devs[j];
> +			struct net_device *netdev;
> +
> +			if (!dev)
> +				continue;
> +
> +			netdev = dev->dev;
> +			of_node_put(netdev->dev.of_node);
> +			unregister_netdev(netdev);
> +		}
>  		airoha_metadata_dst_free(port);
>  	}
>  	airoha_hw_cleanup(eth);

[Medium]
Same question in airoha_remove(): the of_node_put() fires before
unregister_netdev(), while netdev->dev.of_node is still assigned. Would
this be safer with the unregister first and the put afterwards?

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index 3e93919a175c..207c75152fde 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h

[ ... ]

> @@ -542,14 +543,15 @@ struct airoha_qdma {
>  struct airoha_gdm_dev {
>  	struct airoha_gdm_port *port;
>  	struct airoha_qdma *qdma;
> -	struct net_device *dev;
>  	struct airoha_eth *eth;
> +	struct net_device *dev;
> +
> +	int nbq;
>  };
>  
>  struct airoha_gdm_port {
> -	struct airoha_gdm_dev *dev;
> +	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
>  	int id;
> -	int nbq;
>  
>  	struct airoha_hw_stats stats;

[Medium]
With multiple airoha_gdm_dev instances now sharing a single
airoha_gdm_port, do the per-netdev statistics need to become per-netdev
rather than per-port?

airoha_dev_get_stats64(), airoha_ethtool_get_mac_stats() and
airoha_ethtool_get_rmon_stats() all read from dev->port->stats, and the
underlying hardware counters at REG_FE_GDM_*_CNT(port->id) are per-GDM
port rather than per-netdev. When two netdevs share a port (for example
PCIE0/PCIE1 on EN7581 GDM3, or ETH/USB on GDM4), both netdevs would
report identical port-wide counters via rtnl_link_stats64 (ip -s link
show) and via the get_eth_mac_stats/get_rmon_stats ethtool callbacks,
and summing across the two netdevs would double-count.

Would it make sense to maintain per-netdev software counters in the
xmit/RX paths for the multi-dev case so each netdev reports its own
traffic through the standard uAPI?

