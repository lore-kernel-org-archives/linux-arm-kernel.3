Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E560A2626
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDvDh6Bk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DdSxsoJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxvIhudppg/9jn0Jz/7UvjFFVFLiDA9D1Q4sZu2AKRE=; b=ZDvDh6Bk90oXLCCfpTPtd8Fsp2
	0t4l0exFmKvS8R+XswrgWcFZBlxQEpLb3XYmK4xes/WtE86GRVrdm7amGVJIuE10QkPlUryoRm/fx
	MiLozi9yY/waAdnUnWPIfVIHolDCS7WVxokmt/yrt09U1qDW6RYFiIVJPT2v9NRLkgdnFJjpYtBRs
	fLkdxrLZUAWLt9piG9sTlA1zRNO1bSJZuAOS2+Bi+mf/+TESNWz7SS6frkDVBcYQdZ2ERaqgDm5Gz
	czxeMdZ012Xjx8sJVBLfgEx5ytv+APHN6vGj+Q54onOZuPnf2dTNuIGnHqXeuUpFqnf4CkoQyO+Of
	CfG+EnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6oJ-00000009Op4-289I;
	Tue, 20 Oct 2026 10:11:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6nw-00000009OdR-0PS8;
	Tue, 20 Oct 2026 10:10:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FDD660DA9;
	Tue, 20 Oct 2026 10:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F03A1F000C9;
	Tue, 20 Oct 2026 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491047;
	bh=LxvIhudppg/9jn0Jz/7UvjFFVFLiDA9D1Q4sZu2AKRE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DdSxsoJwNpRWU14cbsY3Mk+cwugpbScrotQJeaF9kx7D9fJPYt9h366fGv7uJruMt
	 Eaqq8+09HQkd2atwNomoyz7w/ghFtHPKRAaMiaKcCW8r2EBlOZlJkduSNaWdHsn/Du
	 78qXReDRJGnDLGmUUc+6dZqCn3QEs9rGlf9QTRn4zdBZ5A29C9IgxnD5K0csoIwUVz
	 +wyUixpg90ZMXjAoul7KlD2UaItjwHh/spX6PPd0jfF2pBBp0xWq9pYBhLKx8YbT/8
	 SWuESYoisQq4m8tJjvvw4nYW2nQw1wA/+MQhYLf2XbVLnT0i8gdvpkCtpHfacMLcXo
	 qjUk9nvR36FNw==
Subject: Re: [PATCH net v5 5/5] net: ethernet: mtk_wed: bail out when failed
 to set up rings in wed_start
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Tue, 20 Oct 2026 10:10:45 +0000
Message-ID: <179249104567.3135.3150268582386164073@kernel.org>
In-Reply-To: <20261016-wedfix-v5-5-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-5-8b02e78fd34f@gmail.com>
X-sashiko-severity: Medium
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 (1) · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new bail-outs in mtk_wed_start()
  (drivers/net/ethernet/mediatek/mtk_wed.c) log a dev_err() and return,…
- [Medium] net: ethernet: mtk_wed: memory leak on ring setup error paths
- [Low] The commit fixes error handling for two calls in mtk_wed_start()
  but has no Fixes: tag.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but it is a
  double free in the same reset -> start lifecycle.

--

net: ethernet: mtk_wed: bail out when failed to set up rings in wed_start

This commit checks the return values of mtk_wed_wdma_rx_ring_setup() and
mtk_wed_wdma_tx_ring_setup() in mtk_wed_start(). When either one fails, it
prints an error and returns early.

Link: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

> Add error message and return when fail to set up tx/rx wdma rings.
>
> This is suggested by Sashiko.

[Severity: Low]
Should this patch have a Fixes: tag?

The previous patch in this series, "net: ethernet: mtk_wed: setup
WDMA_RING_TX(0) for non-DBDC MT7986", added the
mtk_wed_wdma_tx_ring_setup(dev, 0, ...) call checked here, and that patch
carries Fixes: 4c5de09eb0d0. Without a tag on this patch, a stable
backport of the earlier one could land without its error check.

The unchecked mtk_wed_wdma_rx_ring_setup() call comes from commit
23dca7a90017 ("net: ethernet: mtk_wed: add reset to tx_ring_setup
callback").

Every other patch in this series has a Fixes: tag. The line "This is
suggested by Sashiko." is free text and does not say which bug is being
fixed.

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 3a7c2bb33691f..86845893ae20f 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -2353,14 +2353,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
>  
>  	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
>  		if (!dev->rx_wdma[i].desc)
> -			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> +			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
> +				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
> +				return;
> +			}

[Severity: Medium]
Does the caller ever find out that start failed here? The same question
applies to the tx_wdma[0] return below.

mtk_wed_start() is static void and is installed as the .start op. In
include/linux/soc/mediatek/mtk_wed.h the op is declared as:

	void (*start)(struct mtk_wed_device *dev, u32 irq_mask);

The early return therefore skips mtk_wed_hw_init(),
mtk_wed_configure_irq(), mtk_wed_set_ext_int(), the v1 PCIe mirror map
write, mtk_wed_rro_cfg(), mtk_wed_amsdu_init(), mtk_wed_dma_enable() and
dev->running = true, and nothing is reported back.

mtk_wed_device_active() only checks the ops pointer:

#define mtk_wed_device_active(_dev) !!(_dev)->ops

so mt76 still treats WED as active. mt7915_dma_start() has already put
WFDMA into WED mode and written MT_INT_WED_MASK_CSR before it gets here:

		mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
	}

	irq_mask = reset ? MT_INT_MCU_CMD : irq_mask;

	mt7915_irq_enable(dev, irq_mask);

It then returns 0, even though it returns int and could pass an error up.
mt7996_dma_start() does the same after writing MT_INT_MASK_CSR.

On WED v3 with hw_rro, mt76 later calls mtk_wed_start_hw_rro(). That
function has no init or running check. It writes MTK_WED_WPDMA_INT_MASK
and MTK_WED_INT_MASK and sets MTK_WED_RRO_MSDU_PG_DRV_EN. Because of the
early return, mtk_wed_hw_init() never programmed MTK_WED_RX_BM_BASE or
MTK_WED_RRO_PG_BM_BASE.

Can this leave a half-initialized WED that the wlan driver keeps using as
if it had started, with only the dev_err() to show anything went wrong?

Would it be better to have ->start return an int, so that mtk_wed_start()
and the mt76 callers can propagate the error and unwind?

>  
>  	/*
>  	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
>  	 * but tx_wdma[0] is also needed for WED to function.
>  	 */
>  	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> -		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
> +		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
> +			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
> +			return;
> +		}

[Severity: Medium]
This is outside the lines changed here. It is the same ring setup
error handling this patch is tightening, though, so it seems worth
raising.

In mtk_wed_rx_ring_setup(), mtk_wed_ring_alloc() first allocates the
descriptor memory for dev->rx_ring[idx]. If the following
mtk_wed_wdma_tx_ring_setup() call fails, the function returns -ENOMEM
without setting MTK_WED_RING_CONFIGURED on that ring.

mtk_wed_tx_ring_setup() has the same shape. dev->tx_ring[idx] is
allocated, and a failure from mtk_wed_wdma_rx_ring_setup() returns
without setting the flag.

The teardown helpers only free rings that have
MTK_WED_RING_CONFIGURED set. In both cases the coherent DMA buffer
for the wlan-facing ring is therefore never released by
mtk_wed_free_tx_rings() or mtk_wed_free_rx_rings(). If setup is
later retried with reset == false, mtk_wed_ring_alloc() overwrites
ring->desc and the old buffer is lost for good.

mtk_wed_free_rx_rings() also looks like it tests the wrong array. It
frees dev->rx_ring[i] based on dev->tx_ring[i].flags. Whether an rx
ring is freed or skipped then depends on the tx ring with the same
index, not on the rx ring itself. That makes the rx side leak more
easily still.

Should the error paths in mtk_wed_rx_ring_setup() and
mtk_wed_tx_ring_setup() free the ring they just allocated? Or should
the free helpers key off ring->desc instead of the flag? And should
the check in mtk_wed_free_rx_rings() test dev->rx_ring[i].flags?

[ ... ]

[Severity: Critical]
This isn't a bug introduced by this patch, but it sits in the same reset
and start lifecycle. mtk_wed_rx_reset() does:

	mtk_wed_free_rx_buffer(dev);
	mtk_wed_hwrro_free_buffer(dev);

When dev->rx_buf_ring.desc is non-NULL, mtk_wed_free_rx_buffer() already
ends with its own call:

	dev->wlan.release_rx_buf(dev);
	dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*desc),
			  desc, dev->rx_buf_ring.desc_phys);

	mtk_wed_hwrro_free_buffer(dev);

mtk_wed_hwrro_free_buffer() frees everything but never clears
dev->hw_rro.pages or dev->hw_rro.desc:

	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
			  desc, dev->hw_rro.desc_phys);

free_pagelist:
	kfree(page_list);

Does the second call in mtk_wed_rx_reset() then read page_list[] from
freed memory? It would also __free_page() the hw_rro pages,
dma_free_coherent() hw_rro.desc and kfree() the page list a second time.

This looks reachable on every SER/DMA reset on WED v3 with wlan.hw_rro
set, which mt7996 does for the primary WED:

mt7996_dma_reset()
  mtk_wed_device_dma_reset()
    mtk_wed_reset_dma()
      mtk_wed_rx_reset()
        mtk_wed_free_rx_buffer()
          mtk_wed_hwrro_free_buffer()
        mtk_wed_hwrro_free_buffer()

There is a second, separate issue: mtk_wed_free_rx_buffer() leaves
dev->rx_buf_ring.desc pointing at freed memory. Suppose the next
mtk_wed_start()->mtk_wed_rx_buffer_alloc() fails at dma_alloc_coherent()
before that pointer is reassigned. Could a later
__mtk_wed_detach()->mtk_wed_free_rx_rings()->mtk_wed_free_rx_buffer() then
free it again?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

