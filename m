Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7461606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNZ7sZ9D;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVuy9JUJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oS0FmMc7AlJVVVUeRFYj25Bo+BdWrMabkFQ8UmhHdq4=; b=HNZ7sZ9DR95xaMPRMj8uY929r7
	dqE5uXYiymv5l91V5Bq6bJwkF20wAwW2C/pZ7GCh60gSwSPiQYnctChlCLtP088l/8DrrkVfukh7M
	aepxLQy2kvKYqMYFMV2gku2etmgl4wB5tojTtj+gJUF7X5WwEgimzXV4vqRqmlX0H8gFIswRS8zWZ
	nD6TKz57Ymm7oXTBl8f9eFmLKVEwIID6OPVLXFWblKudNCzpydfSftVdpIRtdBZ/j4KMPo4W6/FZP
	z0xyPGhBVHCwta11zx5IcJtCuWN3LGHvWiezrMr9SSB8IGPsJMMKBMAbgzuwCOJK0nIMkmcux2EEa
	P5hgISUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEUp-000000087iQ-3Ju8;
	Thu, 29 Oct 2026 00:59:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEUo-000000087i5-1Xwl;
	Thu, 29 Oct 2026 00:59:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 71E7A600D1;
	Thu, 29 Oct 2026 00:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8D31F01825;
	Thu, 29 Oct 2026 00:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793235597;
	bh=oS0FmMc7AlJVVVUeRFYj25Bo+BdWrMabkFQ8UmhHdq4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WVuy9JUJvVpnxgRolTlrO1MIZj20fkCl0H3mXHHgjQXpD2liErU9VCyFiPf8gewhV
	 llC0VAnh+/2o13ZitUeepntk7dWSQmy6SHXnGnZ+Mx2N3a+MAhP+TidwG9FZS2CVsi
	 8zNOIViOZL1WKKL7Mytanwerah70JXEq1PmuVYwgj5czZGj3EBYTFCGQOppEv1QN8p
	 hAnUtMkfbOvQ5auIukcnf7AfJpGa6dCcUN8jWWfGYIFPgwpo/hx0UPCScJxnsgM24P
	 E/8y72dp8s85s7iphCPWgVhP1Yw7HK/HiIpU96nhcQynvyTGBShEIzljYkA+HZKIMe
	 /yky4ATwXN6Ow==
Subject: Re: [PATCH net v6 3/4] net: ethernet: mtk_wed: free up rings during detach
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sashiko-bot@kernel.org
Date: Thu, 29 Oct 2026 00:59:55 +0000
Message-ID: <179323559576.3134.3581964797425462358@kernel.org>
In-Reply-To: <20261026-wedfix-v6-3-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-3-a52f6b15d2fc@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] After this patch, mtk_wed_free_rx_rings()
  (drivers/net/ethernet/mediatek/mtk_wed.c:954-958) calls…

--

net: ethernet: mtk_wed: free up rings during detach

This commit makes mtk_wed_free_rx_rings() also free the rx_ring[] and
tx_wdma[] descriptor rings. Before this, __mtk_wed_detach() leaked them.
The change comes from mtk-openwrt-feeds and was modified to check
ring->desc instead of an extra flag.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Link: https://sashiko.dev/#/message/179000700034.2160803.10594281691384015089%40kernel.org

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 3f0be70c3f145..3044a7a8ea03e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -949,6 +949,14 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
>  static void
>  mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
>  {
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
> +		mtk_wed_free_ring(dev, &dev->rx_ring[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
> +		mtk_wed_free_ring(dev, &dev->tx_wdma[i]);

[Severity: Low]
Could the WDMA engine still be writing to the tx_wdma[] descriptors when
they are freed here?

In __mtk_wed_detach(), these rings are freed right after
mtk_wed_wo_reset(), which returns void:

__mtk_wed_detach()
    mtk_wed_wo_reset(dev);
        mtk_wdma_tx_reset(dev);
    mtk_wed_free_rx_rings(dev);
        dma_free_coherent(..., tx_wdma[i].desc, ...)

If the TX_DMA_BUSY poll in mtk_wdma_tx_reset() times out, the timeout is
only logged:

mtk_wdma_tx_reset() {
    ...
	wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_TX_DMA_EN);
	if (readx_poll_timeout(mtk_wdma_read_reset, dev, status,
			       !(status & mask), 0, 10000))
		dev_err(dev->hw->dev, "tx reset failed\n");
    ...
	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
		wdma_w32(dev,
			 MTK_WDMA_RING_TX(i) + MTK_WED_RING_OFS_CPU_IDX, 0);
}

mtk_wdma_v3_tx_reset() handles timeouts in its prefetch and writeback
BUSY polls the same way.

Only the CPU_IDX registers are cleared. The MTK_WDMA_RING_TX(i) BASE
registers and the WED WDMA_RING_TX BASE registers still point at
desc_phys.

If the engine has not gone idle, can a late descriptor fetch or
writeback land in coherent memory that has already gone back to the
allocator? Before this patch the rings were leaked, so such a write
could only reach memory that nothing else was using.

This depends on a hardware timeout, and I could not confirm from the
code that a late writeback really happens. TX_DMA_EN has already been
cleared in mtk_wed_dma_disable(), and MTK_WED_RESET_WED has been
asserted.

The same function already frees rx_wdma[] in mtk_wed_free_tx_rings()
right after mtk_wdma_rx_reset(), whose -ETIMEDOUT return is ignored, so
this follows an existing pattern in the driver. Would it be worth either
skipping the free on a reset timeout or clearing the ring BASE registers
before freeing?

> +
>  	mtk_wed_free_rx_buffer(dev);
>  	mtk_wed_free_ring(dev, &dev->rro.ring);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261026-wedfix-v6-0-a52f6b15d2fc%40gmail.com

