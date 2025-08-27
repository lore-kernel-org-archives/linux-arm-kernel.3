Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20C5CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykD/lLpLQIzYGQYMP84WIByvSzZo73XHE+OWuN4k9e8=; b=m5PzCXnotYyrrGNXduxz3v/tfL
	rpPWd9GsAoLvFRkVSc5FSCEjJqeqfMoUSCdq04V21mf5Vfy75F+eEpd8XByt17rZkKV3pJzzvBXyF
	Cr9sCNmL6Be9GoCCTtxrPXgMRXvuKufnSLMS3qfZiXDdgLM19mNzRKmNhQHShN0SQBXKpwjlGErrF
	jij5SiPEm3a3hBcjss8i73pDiuCdHSOFEHf4o0XJZv+h2NC+zNoy7y4ru/dkwmmZh9atmdYRkMhg4
	BRFu4hBxLq5+Qy7HuEkgJrLVG40i53nYwQ6/Z2B+P2jtxQF5E/ZhWebKWomkao06DNoI/ZwQFjxtA
	XJY+N18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urM37-0000000GefR-3JIF;
	Wed, 27 Aug 2025 19:43:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urI1T-0000000Fv1i-32HX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20F4360263;
	Wed, 27 Aug 2025 15:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC01C4CEEB;
	Wed, 27 Aug 2025 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756308314;
	bh=kfwViz7xFBzpp18djq1NxXlwY0FdLit/f4wL7ogsZY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RtMkxQuQXfDVIND2OpDItTfeBrBVaErNTzfPbgeIc6qMJjRlaFluCRBKsGF8z7LSi
	 MotoQwLj4l5RJV2zdYk50WTDMlSmUvnZC2qu5oxAJAUkouHRpxJd42kHFtJpMHNxp7
	 5zu/Q96pPUJYvUvT3FhjrogvmGsGEVVt3zYFlxsCPHM+q2ip+ePuv9C23M08bQBqpm
	 9BRue8DRHRqir8Sie/TVZex4vS46w2DV3lYfQtOtYF5mzvPXlbpE7Jr6NDrK/p1/pQ
	 owiq44x+kz8ivAEdHOdEZjlSBs6spCFpmuv5v2A2gWLY5cIWTGk7yqFJzSGDo3fCzY
	 D8tqZ7JO/vLEw==
Date: Wed, 27 Aug 2025 08:25:12 -0700
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
Subject: Re: [net-next v19 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250827082512.438fd68a@kernel.org>
In-Reply-To: <20250824220736.1760482-5-lukasz.majewski@mailbox.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
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

On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote:
> +	/* Set buffer length and buffer pointer */
> +	bufaddr = skb->data;

You can't write (swap) skb->data if the skb is a clone..

> +	bdp->cbd_datlen = skb->len;
> +
> +	/* On some FEC implementations data must be aligned on
> +	 * 4-byte boundaries. Use bounce buffers to copy data
> +	 * and get it aligned.spin
> +	 */
> +	if ((unsigned long)bufaddr & MTIP_ALIGNMENT) {

add 
	.. ||
	(fep->quirks & FEC_QUIRK_SWAP_FRAME && skb_cloned(skb))

here to switch to the local buffer for clones ?

> +		unsigned int index;
> +
> +		index = bdp - fep->tx_bd_base;
> +		memcpy(fep->tx_bounce[index], skb->data, skb->len);
> +		bufaddr = fep->tx_bounce[index];
> +	}
> +
> +	if (fep->quirks & FEC_QUIRK_SWAP_FRAME)
> +		swap_buffer(bufaddr, skb->len);

> +	if (unlikely(dma_mapping_error(&fep->pdev->dev, bdp->cbd_bufaddr))) {
> +		dev_err(&fep->pdev->dev,
> +			"Failed to map descriptor tx buffer\n");

All per-packet prints must be rate limited

> +		/* Since we have freed up a buffer, the ring is no longer
> +		 * full.
> +		 */
> +		if (fep->tx_full) {
> +			fep->tx_full = 0;
> +			if (netif_queue_stopped(dev))
> +				netif_wake_queue(dev);
> +		}

I must say I'm still quite confused by the netdev management in this
driver. You seem to have 2 netdevs, one per port. There's one
set of queues and one NAPI. Whichever netdev gets up first gets the
NAPI. What makes my head spin is that you seem to record which
netdev/port was doing Rx _last_ and then pass that netdev to
mtip_switch_tx(). Why? Isn't the dev that we're completing Tx for is
best read from skb->dev packet by packet? Also this wake up logic looks
like it will wake up _one_ netdev's queue and then set tx_full = 0, so
presumably it will not wake the other port if both ports queues were
stopped. Why keep tx_full state in the first place? Just check if the
queues is stopped..?

