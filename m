Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158E0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2Bv2KlL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcZCBphX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OYzYidSp1VSxcpHdr/miQGxFM0jYNG8Wpj6ohdU34G4=; b=f2Bv2KlLjTF0KIntiYjOpipy9a
	Sc8vEsH4EZT4mtpTfT9gGcJ2GJx7P6N0E2tyOG1r70z6ReO5i4X2HBFbh4+rQ97w1dOFjVyLF/Zaa
	G9Ve5Gsgj69G62iW08VCXmWWUuCCPkvR7C2RsIYRSSGNPC8JSZjymWuUZwOsGm1DgP9vmLFGipbjq
	LhtaDmk5JETSoBwJeMdFFgK/LHMnzAV3TBfvI3cIjw7fID7VsIYpl1AG6WJRLTe0iwubpUrpT5cvR
	2pAn2e9PKXheBowQzVN97Hv+nrASQC4IRa/5V0GMVN3BiIapDp9bPm/y/Ot/v2V1DcObd3Om69ey6
	uuvkIWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpCo-0000000G9pv-46Cz;
	Mon, 02 Nov 2026 10:23:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpCn-0000000G9ph-1Uk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD39E43CEC;
	Mon,  2 Nov 2026 10:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C950F1F00919;
	Mon,  2 Nov 2026 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615036;
	bh=OYzYidSp1VSxcpHdr/miQGxFM0jYNG8Wpj6ohdU34G4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FcZCBphX5SYCXJPpx/xz10gWVQ9TtSazqMuitqro3fzwcKduPbLrUOmT1Xk9jaZll
	 pGlPOSTeopVHmiRM2bBbL4vvIGAiGXvMW7oeaFZOwner6BmHBbkl1WOnwU/vzE0jNl
	 gMOC5Cw8O8lKvlxYlLoX3UEB3CWWiuvr1adrOVVQjjpuMucf0OjCfzumvy0RLsCiIm
	 LqrFvR+pHWn+G8btlWJZXxClkkFqnJNcdMQ5EEDh8WPi8uiHXK8FHWE4mZFSZBVJ0l
	 YivXt7SAjlt+/kIDaTQtjk79vcfj0P0ir2R7p91vKacq05IVqo6tE1VjFJthfAzNKO
	 MdjyUdLGfkjug==
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel interrupts
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com,
 ovidiu.panait.rb@renesas.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Nov 2026 10:23:55 +0000
Message-ID: <179361503537.3131.1099699821303752523@kernel.org>
In-Reply-To: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
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

- [High] The new common-MSI error path runs stmmac_tx_err() without any
  synchronization against TX NAPI or the transmit path for the same…
- [Medium] In multi-MSI mode the patch adds new callers of
  stmmac_tx_err() for a channel, and nothing serializes them.
- [Medium] Use-after-free of the TX ring during AF_XDP pool
  setup/teardown while the device is up.

--

net: stmmac: Clear DMA errors for multi-channel interrupts

On dwmac4, the multi-MSI MAC interrupt handler now clears the per-channel
DMA error status bits (AIS, FBE, RPS, RBU) through a new DMA_DIR_ERR
direction. This avoids interrupt storms. The TX error handling is also
factored out into stmmac_dma_tx_error(), and the new
stmmac_dma_err_interrupt() path calls it as well.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9ded31150fbe6..2068b57df8d52 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -3165,13 +3175,24 @@ static void stmmac_dma_interrupt(struct stmmac_priv *priv)

[ ... ]

> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 tx_channel_count = priv->plat->tx_queues_to_use;
> +	u8 channels_to_check = max(priv->plat->rx_queues_to_use,
> +				   tx_channel_count);
> +	int status;
> +	u8 chan;
> +
> +	for (chan = 0; chan < channels_to_check; chan++) {
> +		status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (chan < tx_channel_count)
> +			stmmac_dma_tx_error(priv, chan, status);

[Severity: High]
Can this race with TX NAPI or stmmac_xmit() on the same queue?

DMA_DIR_ERR masks out RI/TI/TBU. A latched FBE with AIS therefore makes
dwmac4_dma_interrupt() return exactly tx_hard_error, and the MAC IRQ goes
straight into the recovery path:

stmmac_mac_interrupt()
  stmmac_dma_err_interrupt()
    stmmac_dma_tx_error()
      stmmac_tx_err()
        netif_tx_stop_queue()
        stmmac_stop_tx_dma()
        dma_free_tx_skbufs()
        stmmac_clear_tx_descriptors()
        stmmac_reset_tx_queue()

stmmac_tx_err() does not take the txq lock and does not quiesce NAPI. At
the same time, TX NAPI for that queue may be in stmmac_tx_clean() on
another CPU, walking and freeing the same tx_skbuff[] entries under:

	__netif_tx_lock_bh(netdev_get_tx_queue(priv->dev, queue));

While NAPI runs, dwmac4_disable_dma_irq() only clears
DMA_CHAN_INTR_ENA_TIE, so the AIE/FBE-driven MAC line is not blocked.
The TX MSI affinity is set with cpumask_of(i % num_online_cpus()), so
NAPI for queue i will usually run on a different CPU from the MAC IRQ.

netif_tx_stop_queue() also does not wait for a stmmac_xmit() that is
already filling the ring.

Could this cause a double free or use-after-free of skbs and xdp_frames,
duplicate DMA unmaps, or corrupted cur_tx/dirty_tx?

Before this patch, stmmac_tx_err() could only be reached in multi-MSI
mode from stmmac_msi_intr_tx(). That handler is TI-driven, and its source
is masked while NAPI is active.

The single-IRQ path has the same unsynchronized stmmac_tx_err(). Taking
the BH-only txq lock from hardirq context would deadlock. Would it be
better to defer this recovery, for example to the service task or a
reset?

[Severity: Medium]
What happens here if an AF_XDP pool change on a running interface has
freed the TX queue's ring?

stmmac_xdp_enable_pool() and stmmac_xdp_disable_pool() call
stmmac_disable_tx_queue():

stmmac_disable_tx_queue() {
	spin_lock_irqsave(&ch->lock, flags);
	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, 0, 1);
	spin_unlock_irqrestore(&ch->lock, flags);

	stmmac_stop_tx_dma(priv, queue);
	__free_dma_tx_desc_resources(priv, &priv->dma_conf, queue);
}

Only TIE is masked. __free_dma_tx_desc_resources() then frees the
descriptor ring and does the following, without clearing the pointers:

	kfree(tx_q->tx_skbuff_dma);
	kfree(tx_q->tx_skbuff);

During this window the MAC IRQ stays requested, AIE/FBE stay enabled,
and STMMAC_DOWN is not set. stmmac_dma_err_interrupt() walks every
channel below tx_queues_to_use without checking whether its ring is
allocated.

Suppose FBE is latched on that channel before stmmac_enable_tx_queue()
reallocates the ring. Would stmmac_tx_err() then read tx_skbuff_dma[i]
and tx_skbuff[i] from freed memory in stmmac_free_tx_buffer()? And would
stmmac_clear_tx_descriptors() write into freed coherent DMA memory?

Before this patch, no IRQ path touched the TX ring in this window in
multi-MSI mode.

>  	}
>  }

[ ... ]

> @@ -6466,6 +6487,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
>  
> +	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);
> +

[Severity: Medium]
Can stmmac_tx_err() now run on the same channel from two CPUs at once?

In multi-MSI mode, stmmac_request_irq_multi_msi() installs
stmmac_mac_interrupt() on dev->irq. When wol_irq is a different line, it
installs the same handler there too:

	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
		...
		ret = request_irq(priv->wol_irq,
				  stmmac_mac_interrupt,
				  0, int_name, dev);

dwmac-intel, for example, sets res->wol_irq to a separate MSI vector.

stmmac_msi_intr_tx() can also reach tx_hard_error on the same channel,
because FBE and AIS are part of DMA_CHAN_STATUS_MSK_TX through
DMA_CHAN_STATUS_MSK_COMMON.

dwmac4_dma_interrupt() reads the status first and clears it later:

	u32 intr_status = readl(ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));
	...
	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));

Two of these handlers could both see FBE before either one clears it,
and both would then call stmmac_tx_err() on the same tx_q.
stmmac_free_tx_buffer() does an unlocked check-then-free:

	if (tx_q->tx_skbuff[i] &&
	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
		tx_q->tx_skbuff[i] = NULL;
	}

Could this double free the skb or xdp_frame and double unmap
tx_skbuff_dma[i].buf? Could it also race on descriptor clearing, ring
reset and TX DMA channel reprogramming?

In INTM=1 the TX MSI normally fires with TI set. That gives
tx_hard_error | handle_tx, which fails the == tx_hard_error check, so the
TX MSI case probably needs a status snapshot without TI. The MAC plus
WoL case needs the WoL vector to fire at the same moment at runtime.

The single-IRQ path already has a similar MAC plus WoL race, since
stmmac_interrupt() is also requested on wol_irq there. In multi-MSI mode,
this patch is what introduces it.

>  	return IRQ_HANDLED;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030102251.208929-1-maxime.chevallier%40bootlin.com

