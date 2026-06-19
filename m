Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF19CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+2frUvJgyuU1DhxH6tVVVczOdx415NKr3b/JAICXF4=; b=hLfXMdmHuZiAltCyy3ztxXEGPF
	X8QufkVDMihl5st99aBNlqmvj5b7tuqVRcrelzB1rMahKtwOcbaylcOxHpjDJRTF+yh9MmB2gnkMt
	5k/7/40nzEYrbt6Jp+xuG0N+p+ZwS4OR7D5drvdKGCRb35eulk+omqZMZmvcxbbRULk7di9zOwhAR
	92a4GKY6+ncbQEkKv/KO0kZUCmzJ9D/ogldJfw0Sz0FNHmCwtVb2ZNrL0ohmKjRFzmWobIgTlqfAr
	Zzc6EzD4Wyubyot3mUTzoiHl3eI8x+L/jBWyqcSFaTVBj6Slokrb3FXgZShJ2DeHzpgoFEZLuFnQo
	QqrEaBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVdP-00000002EVQ-3bg7;
	Fri, 19 Jun 2026 09:35:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVdO-00000002EVB-3VYp;
	Fri, 19 Jun 2026 09:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04A47601E1;
	Fri, 19 Jun 2026 09:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AA61F000E9;
	Fri, 19 Jun 2026 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781861733;
	bh=5+2frUvJgyuU1DhxH6tVVVczOdx415NKr3b/JAICXF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nse81hVraxu2A6OSRWpKQJEIGXFRP2qifVav3Ziipg5rdn2/t0CZ2pAmWemSBgQH3
	 0JhGdoSNPIMFDpfIBsyvg55s+s0VEK1z+nBGTsZhfzv5CczW/jAOmnye/RSrW2RjiD
	 tYvjVH6zuytfF+GrAZeWK5vTT1FyZyKSrMWwEabWeiM5XIz+7RDb1uThtqHZDhvIF0
	 Q3raaGck5eafPQgaWaVfb/3LWWidW14r9o/jABA2rVPsTk73WnoCMjunVbQKvCXlza
	 jdZvZotA8gY/OWVfW6EaoEI4TY2kuV/SDhEeXE5+ufc5qXpQqdJQG2ovj6IDfi/lcc
	 eA0yoLFHa1YyA==
Date: Fri, 19 Jun 2026 10:35:29 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: airoha: fix netif_set_real_num_tx_queues
 for sparse QoS channels
Message-ID: <20260619093529.GV827683@horms.kernel.org>
References: <20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org>
 <20260618-airoha-qos-fixes-v1-2-37192652157f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-airoha-qos-fixes-v1-2-37192652157f@kernel.org>
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

On Thu, Jun 18, 2026 at 08:00:30AM +0200, Lorenzo Bianconi wrote:
> airoha_tc_htb_alloc_leaf_queue() assigns queue IDs based on the channel
> index (opt->qid = AIROHA_NUM_TX_RING + channel), but updates
> real_num_tx_queues with a simple increment (num_tx_queues + 1). When QoS
> channels are allocated sparsely (e.g., channels 0 and 3 without 1 and
> 2), the returned qid can exceed real_num_tx_queues, causing out-of-bounds
> accesses in the networking stack.
> For example, allocating channel 0 then channel 3 results in
> real_num_tx_queues = 34 but qid = 35, which is out of range [0, 34).
> Fix this by computing real_num_tx_queues based on the highest active
> channel index rather than using a simple counter, in both the allocation
> and deletion paths.
> 
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c

...

> @@ -2806,7 +2806,10 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
>  	if (err)
>  		goto error;
>  
> -	err = netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
> +	if (num_tx_queues <= netdev->real_num_tx_queues)
> +		goto set_qos_sq_bmap;
> +
> +	err = netif_set_real_num_tx_queues(netdev, num_tx_queues);
>  	if (err) {
>  		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
>  					      opt->quantum);
> @@ -2815,6 +2818,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
>  		goto error;
>  	}
>  
> +set_qos_sq_bmap:

I would prefer if this could be achieved without a goto.

>  	set_bit(channel, dev->qos_sq_bmap);
>  	opt->qid = AIROHA_NUM_TX_RING + channel;
>  

...

