Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E/DbInB0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiKYLVMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQPIuEpvWD+B7zD+vc2FJ+857BaEpzNPJt644Gt/XNE=; b=E/DbInB0jRdsAYSlGImkBc+pmg
	6prTBV6X05w4BePEuatJ0ZOf2DC85K5fJlj/h7gkp++olA/M+iM7j5dDx0TvBRqpSzQ/uxc/i/YOH
	AsWhLVtLV3krEOJkrntbB0oqXsDWrci0zyqRm5rzE6nxIzmSquTx/h68/aWACGQ4RZSqEQ5jDUKUC
	Hvz4ry+H/wMmIBXgpri5w9zwAY8QGH6RmrAzNrElJZjAuTeMbzPBCYWtMqXzl0xZJ+z4ZcCU0qlDq
	f/AUgjKPfz/Zq7v21l4GMR/HrZiB0Z2qBSRXFnd/sjkiUzSVb4wbML2rN6GFNEoYmsQG2uSJf4t5O
	nw+ezc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6o6-00000009OhC-1Bdz;
	Tue, 20 Oct 2026 10:10:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6nt-00000009Oc9-0XI1;
	Tue, 20 Oct 2026 10:10:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54476605EF;
	Tue, 20 Oct 2026 10:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3597D1F000C7;
	Tue, 20 Oct 2026 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491044;
	bh=fQPIuEpvWD+B7zD+vc2FJ+857BaEpzNPJt644Gt/XNE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KiKYLVMCggbH067ZJKEdACaWtrYZoeoYJIiN8o2ZTZiVzEvR1SG87a6QsRgDmlicX
	 ZrOPC6gY5TuT4NaWhoJmspYcKGvMSgLEOmBpZqyCm0aE5+M6oGwch+bDrY5p/4uGLL
	 3QLoqlcm8b7uV0qOycg+6oZYgL9FGjGbmFEhLsZbxZhrfYOM8bXhTHxsLt3rplfYLl
	 FD99Iayp8OzeZVj3Ox5G4ZboMDWB+HzdU7yQO40G/rdaR894bXxbF4bdRgIKpxWYXQ
	 r8NbuPQMuWE7nkKlPoJwYkDoeL4rrIgqUYe438K7lnNjZcGb+aZ4ybstVrmEN26uXP
	 5QP4mxOqoSJxQ==
Subject: Re: [PATCH net v5 3/5] net: ethernet: mtk_wed: free up rings during detach
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Tue, 20 Oct 2026 10:10:42 +0000
Message-ID: <179249104276.3135.12420565113536395663@kernel.org>
In-Reply-To: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com>
X-sashiko-severity: High
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Copy-paste bug in the new rx_ring cleanup loop in
  mtk_wed_free_rx_rings()…
- [Medium] The new flag gating in mtk_wed_free_tx_rings() causes a leak
  on partial setup failure.
- [Medium] The patch now frees the rx_ring descriptor memory in
  __mtk_wed_detach() → mtk_wed_free_rx_rings(), but WED never disables…

--

net: ethernet: mtk_wed: free up rings during detach

This commit adds frees for rx_ring and tx_wdma in mtk_wed_free_rx_rings()
during __mtk_wed_detach(). It also sets MTK_WED_RING_CONFIGURED in the
tx/rx ring and wdma tx/rx ring setup paths, and only frees rings that have
that flag set.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 3f0be70c3f145..b8264435acbe5 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -949,6 +949,16 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
>  static void
>  mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
>  {
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
> +		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> +			mtk_wed_free_ring(dev, &dev->rx_ring[i]);

[Severity: High]
Should this check dev->rx_ring[i].flags instead of dev->tx_ring[i].flags?

The flag on rx_ring[idx] is set in mtk_wed_rx_ring_setup(), and that
function never touches tx_ring[idx]. The existing reader in
mtk_wed_dma_enable() also tests the flag on the rx ring itself:

	for (i = 0; i < MTK_WED_RX_QUEUES; i++) {
		struct mtk_wed_ring *ring = &dev->rx_ring[i];
		...
		if (!(ring->flags & MTK_WED_RING_CONFIGURED))
			continue; /* queue is not configured by mt76 */

TX and RX rings are set up separately, so their flags can differ. Take
MT7992 with a second HIF:

- mt7996_dma_init() puts band1 RX on the primary WED's rx_ring[1].
- mt7996_register_phy() sends band1 TX to wed_hif2.
- mt7996_init_tx_queues() then uses MT_WED_Q_TX(0) on wed_hif2.

So the primary WED's tx_ring[1] is never configured.

In that case, is the rx_ring[1] descriptor memory still leaked on every
detach? This loop skips it, and the pointer is then lost to the
memset(dev, 0, sizeof(*dev)) at the end of __mtk_wed_detach(). That looks
like the same leak the commit message says it fixes.

mtk_wed_free_ring() already returns early when ring->desc is NULL. Would
dropping the flag check here be enough?

> +
> +	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
> +		if ((dev->tx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> +			mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
> +
>  	mtk_wed_free_rx_buffer(dev);
>  	mtk_wed_free_ring(dev, &dev->rro.ring);
>  }

[Severity: Medium]
Can rx_ring[i] be freed here while the WLAN chip's WFDMA RX engine still
points at it?

mtk_wed_rx_ring_setup() writes ring->desc_phys into the WLAN chip's PDMA
RX ring registers through wpdma_rx_w32(). mtk_wed_dma_enable() then turns
on the chip's RX DMA:

		val = wifi_r32(dev,
			       dev->wlan.wpdma_rx_glo -
			       dev->wlan.phy_base) | MTK_WFMDA_RX_DMA_EN;
		wifi_w32(dev,
			 dev->wlan.wpdma_rx_glo - dev->wlan.phy_base,
			 val);

mtk_wed_dma_disable() never clears MTK_WFMDA_RX_DMA_EN. On normal teardown
mt7915/mt7996 disable DMA before mt76_dma_cleanup() detaches WED. The
mt7915 probe error path does not seem to do that:

mt7915_init_hardware()
  mt7915_dma_init()
    mt7915_dma_enable()
      mt7915_dma_start()
        mtk_wed_device_start()     <- WFDMA RX enabled
  mt7915_mcu_init()                <- fails, returns without DMA disable

The probe error label in mt7915/pci.c or mt7915/soc.c then runs:

mtk_wed_device_detach()
  __mtk_wed_detach()
    mtk_wed_free_rx_rings()
      mtk_wed_free_ring(dev, &dev->rx_ring[i])
        dma_free_coherent()

If the chip writes back an RX descriptor after this point, would that
corrupt memory that has since been reused? Before this patch the ring
leaked, so such writes landed in memory that was still allocated.

The error path leaving DMA armed predates this patch, and the RX packet
buffers were already freed in this window. Whether the chip really writes
descriptors after MCU init fails depends on hardware behaviour. Freeing
the descriptor ring here is the new part.

> @@ -959,9 +969,11 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
> -		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
> +		if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> +			mtk_wed_free_ring(dev, &dev->tx_ring[i]);

[Severity: Medium]
Does this leak the tx_ring[idx] descriptor buffer when
mtk_wed_tx_ring_setup() fails partway?

mtk_wed_tx_ring_setup() allocates the descriptor before it sets the flag:

	if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE,
					 sizeof(*ring->desc), true))
		return -ENOMEM;

	if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
				       reset))
		return -ENOMEM;

	ring->reg_base = MTK_WED_RING_TX(idx);
	ring->wpdma = regs;
	ring->flags |= MTK_WED_RING_CONFIGURED;

If the rx_wdma dma_alloc_coherent() fails, tx_ring[idx].desc stays
allocated but the flag is never set. The -ENOMEM travels up:

mt76_wed_dma_setup()
  mt76_dma_alloc_queue()
    mt7915/mt7996 dma init
      probe error path
        mtk_wed_device_detach()

Before this patch, mtk_wed_free_tx_rings() freed the ring because
mtk_wed_free_ring() only checks ring->desc. With the new check the ring
is skipped, and the memset in __mtk_wed_detach() then drops the pointer.

mtk_wed_rx_ring_setup() uses the same order. A failure in
mtk_wed_wdma_tx_ring_setup() returns before rx_ring[idx].flags is set, so
the flag-gated rx_ring free in mtk_wed_free_rx_rings() cannot reclaim
that ring either.

Since mtk_wed_free_ring() already guards on ring->desc, what does the
MTK_WED_RING_CONFIGURED check add in these free loops? The commit message
does not explain why the frees are gated.

>  	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> -		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> +		if ((dev->rx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> +			mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

