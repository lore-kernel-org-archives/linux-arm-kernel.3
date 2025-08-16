Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA74CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 01:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64Xj++CBsikyJkz7f0F8LNXyalRkwNwmeOuv8EbKZuA=; b=i0dlsruEIG0lFxO2cpKAHGwZCj
	VuDXs4VmgIbiVpNl7QUnRcPPJ0vzbJwJqxzQfzMeR9Ps440LlcJiPpWlJyMFnM43Nhm3lvV/Rvptt
	DN6I4Z+SMa3XzDKH5yB2AmK1hpXpwHuLEBdIJJ6aez/h3UpYjGnRuapaS3lOM2l1f8ryC3aN9EUmT
	ZIKAi0+aqZUkvXr8TNFGKBl9jp2KnxguGQ/f2o7oJTbIgvPVVzcX2S5dHi2KR5CIVNK2YrB3al52c
	gXg/O1Y5yoYsHLS5qDyEbiJ3dvg8+73mW3aJB7Yh/XACeQH6tMCxD9iR+MUXU7WLjKKRUOX+fd+r8
	uWkIRVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5qd-00000003sHr-3xsg;
	Sat, 16 Aug 2025 01:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5o1-00000003s9N-2nC2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 01:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B716141C;
	Sat, 16 Aug 2025 01:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC64FC4CEEB;
	Sat, 16 Aug 2025 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755308040;
	bh=QAU67ghT7uJFx7o0i6RFgiTCA5x0lDgncw00VvbV1wE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iTpMemuTse99V3Ddi/QFoLd7riwysF0dE0pOZPaMpZdDhuP/IWagkgtbjkiOoUCmt
	 1ILIFUJGphVjvIwAfjTfK4V1lTkYRlFpYSuLe7htGRazss0dBeVtsAUZ3GDm0QfCmD
	 BkvrBs/yEeDIxh81jESYEEJYjmNPi7ENJJ4vXsmm9SNls79hUEo/aWOpLFcsQbUoMR
	 2ACHvrbLIYRGP9+XgCOog1olZujzz+BD6VcRb7tLVg3Ijoj4rK9923gTmkJgPwOCrl
	 ywmkSHvfwBqGiZU/zQXJmpLgVRGv7hzhrX1UVBttpNg/ejMqYYxaFjWsYdFLnV72DG
	 zUJg9Do1WGv2A==
Date: Fri, 15 Aug 2025 18:33:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v18 5/7] net: mtip: Add mtip_switch_{rx|tx} functions
 to the L2 switch driver
Message-ID: <20250815183359.352a0ecb@kernel.org>
In-Reply-To: <20250813070755.1523898-6-lukasz.majewski@mailbox.org>
References: <20250813070755.1523898-1-lukasz.majewski@mailbox.org>
	<20250813070755.1523898-6-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 13 Aug 2025 09:07:53 +0200 Lukasz Majewski wrote:
> +		page = fep->page[bdp - fep->rx_bd_base];
> +		/* Process the incoming frame */
> +		pkt_len = bdp->cbd_datlen;
> +
> +		dma_sync_single_for_cpu(&fep->pdev->dev, bdp->cbd_bufaddr,
> +					pkt_len, DMA_FROM_DEVICE);
> +		net_prefetch(page_address(page));
> +		data = page_address(page);
> +
> +		if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +			swap_buffer(data, pkt_len);
> +
> +		eth_hdr = (struct ethhdr *)data;
> +		mtip_atable_get_entry_port_number(fep, eth_hdr->h_source,
> +						  &rx_port);
> +		if (rx_port == MTIP_PORT_FORWARDING_INIT)
> +			mtip_atable_dynamicms_learn_migration(fep,
> +							      mtip_get_time(),
> +							      eth_hdr->h_source,
> +							      &rx_port);
> +
> +		if ((rx_port == 1 || rx_port == 2) && fep->ndev[rx_port - 1])
> +			pndev = fep->ndev[rx_port - 1];
> +		else
> +			pndev = dev;
> +
> +		*port = rx_port;
> +
> +		/* This does 16 byte alignment, exactly what we need.
> +		 * The packet length includes FCS, but we don't want to
> +		 * include that when passing upstream as it messes up
> +		 * bridging applications.
> +		 */
> +		skb = netdev_alloc_skb(pndev, pkt_len + NET_IP_ALIGN);
> +		if (unlikely(!skb)) {
> +			dev_dbg(&fep->pdev->dev,
> +				"%s: Memory squeeze, dropping packet.\n",
> +				pndev->name);
> +			page_pool_recycle_direct(fep->page_pool, page);
> +			pndev->stats.rx_dropped++;
> +			return -ENOMEM;
> +		}
> +
> +		skb_reserve(skb, NET_IP_ALIGN);
> +		skb_put(skb, pkt_len);      /* Make room */
> +		skb_copy_to_linear_data(skb, data, pkt_len);
> +		skb->protocol = eth_type_trans(skb, pndev);
> +		skb->offload_fwd_mark = fep->br_offload;
> +		napi_gro_receive(&fep->napi, skb);

The rx buffer circulation is very odd. You seem to pre-allocate buffers
for the full ring from a page_pool. And then copy the data out of those
pages. The normal process is that after packet is received a new page is
allocated to give to HW, and old is attached to an skb, and sent up the
stack.

Also you are releasing the page to be recycled without clearing it from
the ring. I think you'd free it again on shutdown, so it's a
double-free.
-- 
pw-bot: cr

