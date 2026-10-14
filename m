Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C409BCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 18:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvWOaTUlMXOEn3tnxgA4QdZqJ3etpFx5xwMvPC1gXq4=; b=l3MQ40UqaCGfMoN9D4BpxDjMXb
	EdSYInjMENbAzqZXCYPdaNCjOmasz7PptS434P1wNQenCNm+cVAE7kExq3p77/uVrnFxoXU0dQDmQ
	npUYPwHPP6Vup5AGgoZTNWuDO6LEBqE0i9uD22GX/cKjyByDJRbE53wKUtFEnxuT85oLIq9bxDOSq
	bhnlPluFw7c4Pz7/ImTnUelRWk/nBM3TgfreLjeHUHFBau8Qk+mKZSsHHmoTRvYd3BYhDVNdl7Yxv
	8lUQqRPWSMHMAcD+YWNAdmLKBnPPEXRt8zceexW0X9+yhLa314A6yWtG00xeiCHeyX5Ep+kA3lW5g
	odlG96aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4AG-0000000GBAI-1pqZ;
	Wed, 14 Oct 2026 18:57:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4AF-0000000GBA8-0ZB0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 18:57:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20DD660229;
	Wed, 14 Oct 2026 18:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314031F000C4;
	Wed, 14 Oct 2026 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792004241;
	bh=CvWOaTUlMXOEn3tnxgA4QdZqJ3etpFx5xwMvPC1gXq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4F521D7LiiIZZCqQVxHOB/nZBiu4tBxIrJQIPczjUHE+9a4ljcAa5OTOC19AOt/M
	 rGoKmaMxA+wiyvhsWOZZEmMlyGxP3Fht7DONoGYHa8rKGnJNPOBU7hqGwasqMppiDD
	 lj4CXohfxWrglWa+txVDNBw+bPCOdgEhQTckY2zfH0ZHgR0L/WNgTXn5Zeh/5QgqxV
	 NQTLBjMv2/0kf0itpRvtcPZcdOJMQYdLblZtfduOYIvb2NT7t0hKKaPc4AedK6EZLm
	 sCYsf901oGif3DjXDGjJHt6feyuSnqKqJoGw1fNebhvxz0Rnprqy5WN4zEg1AFqjcX
	 mLR9Es3GE/qkw==
Date: Wed, 14 Oct 2026 19:57:16 +0100
From: Simon Horman <horms@kernel.org>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	daniel@iogearbox.net, jacob.e.keller@intel.com, joe@dama.to,
	suraj.gupta2@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <20261014185716.GD83879@horms.kernel.org>
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
 <20261007034620.1360542-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007034620.1360542-1-maimon.sagi@gmail.com>
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

On Wed, Oct 07, 2026 at 06:46:20AM +0300, Sagi Maimon wrote:
> axienet_dma_bd_release() walks the RX ring to unmap and free every
> receive buffer before releasing it, but frees the TX descriptor ring
> with dma_free_coherent() alone.  Any descriptor that
> axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> its streaming DMA mapping, and both are lost.
> 
> axienet_stop() disables TX NAPI and stops the DMA engine before calling
> it, so nothing reclaims those descriptors afterwards.  Bringing the
> interface down while frames are in flight therefore leaks up to
> lp->tx_bd_num skbs and mappings each time.
> 
> axienet_dma_err_handler() already walks the TX ring this way before it
> restarts the DMA engine: it unmaps every descriptor whose cntrl is still
> set - axienet_free_tx_chain() clears it on reclaim - frees any skb still
> attached, and clears the descriptor.  Move that loop into a helper,
> axienet_free_tx_bufs(), and call it from axienet_dma_bd_release() too.
> This relies on axienet_stop() having stopped the DMA engine first, as
> the RX walk in the same function already does.  The helper frees the
> skbs with dev_kfree_skb_any(), as drops: in the error handler, which
> runs from a workqueue, that frees them directly rather than deferring
> them to softirq as dev_kfree_skb_irq() did.
> 
> The walk must not run on a ring that is not there.  axienet_open() does
> not check the result of the reset that runs axienet_dma_bd_init(), so
> when that reset fails tx_bd_v is either still NULL or, after an earlier
> close, points at the ring that close freed.  Clear tx_bd_v and rx_bd_v
> once their rings are freed, and skip the walk when tx_bd_v is NULL.
> That also ends the second dma_free_coherent() of a stale ring which the
> same path already did.  On the axienet_dma_bd_init() error path the TX
> ring has just been allocated zeroed, so the walk does nothing.
> 
> This was reported by the Sashiko AI review bot.
> 
> Tested on the AXI Ethernet MAC of an ADVA TimeCard X2 (PCIe card, with
> the built-in AXI DMA): traffic passes, and after each of ten down/up
> cycles and five module reloads, all made with traffic running and each
> running axienet_dma_bd_release(), traffic resumes and nothing is logged.
> The leak itself was not measured, and neither the failed-reset paths nor
> axienet_dma_err_handler() were exercised.
> 
> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
> Reviewed-by: Joe Damato <joe@dama.to>
> Assisted-by: LLM sparse
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

In future please post new patch revisions as new email threads,
not as a reply to an earlier revision.

Thanks!


