Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB0A606E722
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUec7pI2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMi+t1Ff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k9sMhNFN8pOnQFMDY6q9oFH8xW41MAWGt8ZsO6lOl84=; b=OUec7pI2ywZTycOZoZab+SBlb/
	+apvKakYShB4knxip/l4egQ5dcGvpdyan4OwPuNJjNQjfIxC6oaGUgWJoL+3dlWpATGPVdFs2bq/B
	becA6FpdvE9ZzB4hI36F3Cent6XM6zLNUiWvenVRZaqKqBD9xjQj/kYyIt0y4NutbZa4M7T0Aqs20
	nqx+AXkuWLEZUTaG9m5B1u/nuPEfVy16BNPqonbUgT0XANqwLYvix8nySMVWYwA+z8ZkkUvjYsROs
	CRNAMoK77WcvQ6nFU5G2QI1rsIud4tARrsKzUe6BDJwwwNiTRwr4NS/vK/Rq8t5hMNgo73RH8vqN7
	kz/yVrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIbC-00000002KdL-0pDm;
	Mon, 26 Oct 2026 11:10:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIb9-00000002KWO-2SxJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:10:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C511A444FC;
	Mon, 26 Oct 2026 11:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BCE1F01346;
	Mon, 26 Oct 2026 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013038;
	bh=k9sMhNFN8pOnQFMDY6q9oFH8xW41MAWGt8ZsO6lOl84=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iMi+t1FfCEegigLJ9CuoGz3CSAN+cfgqvwzs7L/SqFHfrcFlgcwdNWxScd1sKwkPU
	 l5kOoCpcHPtSEvJTFXADtdsNcBefGldeTCd9CIxFt1ZHR1WKMbd217EhkZ8wQZrvhj
	 mqENI6fMi38hrFLC6ZEfRxq5IRqXgXLlFA2DWovxVc0ZUcX4Dz9BpLbMZiL3DVJm3v
	 rG23D4MT5ar93ux9Z23URNnPvVZHZnjFVulOfy5L3mLg/3bAY/G4+C2I1FerFem5nQ
	 W48X2hjHFIq0JNHi9cn1pYo3ri6yucJEel9dzMadss/grFM05ToPrbHGSL4QtFAy8m
	 AJxvRDz1VAycw==
Subject: Re: [PATCH net v5 2/2] net: stmmac: restore RX descriptor buffer
 addresses on resume
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com, zhoujing3@lixiang.com, fujiahui@lixiang.com
Date: Mon, 26 Oct 2026 11:10:37 +0000
Message-ID: <179301303716.3134.2346618514026272618@kernel.org>
In-Reply-To: <20261025100636.613670-3-dinghui1111@163.com>
References: <20261025100636.613670-3-dinghui1111@163.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On cores with legacy enhanced/normal descriptors (DWMAC100,
  DWMAC1000, DWMAC 3.x: enh_desc_ops and ndesc_ops), an XSK RX slot with…
- [High] On GMAC4/XGMAC, the XSK 'leave CPU-owned holes' approach puts
  unfilled slots in the middle of the ring, inside the region the RX…
- [Medium] The patch adds an allocation-dependent way for stmmac_resume()
  to fail, and that failure leaves the netdev unrecoverable.
- [Low] stmmac_reinit_rx_descriptors() publishes every restored
  descriptor with stmmac_set_rx_owner(priv, p, false), so…

Pre-existing issues:
- [Low] stmmac_reinit_rx_descriptors() can attach XSK buffers to slots
  that had none at open or pool-enable time, but it never updates…

--

net: stmmac: restore RX descriptor buffer addresses on resume

This patch restores RX descriptor buffer addresses in stmmac_resume() after
stmmac_clear_descriptors(). On GMAC4/XGMAC, hardware writeback can overwrite
those addresses for descriptors that completed but were not refilled before
suspend. It moves buffer setup into stmmac_prepare_rx_buffer() and
stmmac_prepare_rx_buffer_zc(), which the refill paths also use, allocates
missing pages with GFP_KERNEL, and leaves XSK slots that have no buffer
CPU-owned.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f5ae12208e85b..e56f5d044fc8a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -1688,32 +1722,98 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,

[ ... ]

> +static int stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
> +					struct stmmac_dma_conf *dma_conf,
> +					u32 queue)
> +{
> +	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
> +	struct stmmac_rx_buffer *buf;
> +	struct dma_desc *p;
> +	int i, ret;
> +
> +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +		buf = &rx_q->buf_pool[i];
> +		p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +		if (rx_q->xsk_pool) {
> +			ret = stmmac_prepare_rx_buffer_zc(priv, rx_q, buf, p);

[Severity: Low]
This is a pre-existing issue, not one introduced by this patch, but
rx_q->buf_alloc_num is not updated when this loop attaches XSK buffers to
slots that had none at open time.

stmmac_hw_setup()->stmmac_init_dma_engine() programs the RX tail from it:

	stmmac_set_queue_rx_tail_ptr(priv, rx_q, chan,
				     rx_q->buf_alloc_num);

Also, stmmac_set_queue_rx_buf_size() uses the XSK frame size only when
buf_alloc_num is non-zero.

If the fill ring was short at open, slots filled here at index
buf_alloc_num or above may lie beyond the programmed tail. If
buf_alloc_num is 0, the buffer size falls back to dma_buf_sz.

The open path uses the same stale value, and so did the code before this
patch, so this is only a bookkeeping mismatch.

> +			if (ret) {
> +				/* An empty fill ring must not prevent TX-only use. */
> +				stmmac_clear_desc(priv, p);
> +				continue;
> +			}

[Severity: High]
On cores with the legacy enh_desc_ops or ndesc_ops, does this leave the
slot DMA-owned with a buffer address of 0?

stmmac_clear_descriptors() has just run init_rx_desc on every RX
descriptor, and that sets OWN in des0:

enh_desc_init_rx_desc() {
    ...
	p->des0 |= cpu_to_le32(RDES0_OWN);
    ...
}

On these cores, the ->clear op only clears des2:

static void enh_desc_clear(struct dma_desc *p)
{
	p->des2 = 0;
}

static void ndesc_clear(struct dma_desc *p)
{
	p->des2 = 0;
}

The final loop below skips this slot when !buf->xdp, but nothing clears
OWN. These DMA engines have no RX tail pointer, so the DMA keeps walking
the ring while OWN is set. The next frame that lands in this slot would be
written to bus address 0.

XSK zero-copy is advertised on every core (NETDEV_XDP_ACT_XSK_ZEROCOPY in
xdp_features), and stmmac_xdp_enable_pool() has no descriptor-format
check, so these cores can reach this path.

Before this patch, des2 here still held the previous, still-mapped UMEM
chunk address. The commit message says such a slot "must not receive an
invalid buffer address".

Could OWN be cleared explicitly here, for example RDES0_OWN in des0 on
enh/ndesc? Only dwmac4 and xgmac zero the whole descriptor in ->clear.

[Severity: High]
On GMAC4/XGMAC, can a CPU-owned hole in the middle of the ring stall RX on
this queue permanently?

stmmac_reset_queues_param() has set cur_rx = dirty_rx = 0, so a hole at
slot D sits in the region the RX path treats as hardware-owned. The DMA
fills slots 0 to D-1 and stops at D with an RBU event.

In stmmac_rx_zc(), dwmac4_wrback_get_rx_status() does not report a fully
zeroed descriptor as dma_own. So cur_rx moves to D+1 before the missing
buffer is noticed:

stmmac_rx_zc() {
    ...
	rx_q->cur_rx = next_entry;
    ...
	if (!buf->xdp)
		break;
    ...
}

stmmac_rx_zc() is the only caller of the refill, and only once the dirty
count reaches STMMAC_RX_FILL_BATCH:

	if (dirty >= STMMAC_RX_FILL_BATCH) {
		failure = failure ||
			  !stmmac_rx_refill_zc(priv, queue, dirty);

If D < 15, dirty stays at D+1, the hole is never refilled, and the DMA
stays stopped at D. stmmac_xsk_wakeup() only schedules NAPI, so refilling
the fill ring from userspace does not recover the queue.

If D >= 15, a later refill fills D and moves the tail. Software has already
moved past D, though, so that frame would be consumed a full ring later
and out of order.

Could the holes be placed in the dirty region instead, for example by
setting dirty_rx and the tail to the first unfilled slot?

> +		} else {
> +			ret = stmmac_init_rx_buffers(priv, dma_conf, p, i,
> +						     GFP_KERNEL, queue);
> +			if (ret)
> +				return ret;
> +		}
>  	}

[ ... ]

> +	/* GMAC4/XGMAC secondary address writes overwrite the OWN bit. */
> +	dma_wmb();
> +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +		buf = &rx_q->buf_pool[i];
> +		if (rx_q->xsk_pool && !buf->xdp)
> +			continue;
> +
> +		p = stmmac_get_rx_desc(priv, rx_q, i);
> +		stmmac_set_rx_owner(priv, p, false);

[Severity: Low]
Should the disable_rx_ic argument here follow priv->use_riwt instead of
always being false?

stmmac_clear_rx_descriptors() passes priv->use_riwt as disable_rx_ic. On
GMAC4/XGMAC that choice is lost, because dwmac4_set_sec_addr() assigns
des3 outright:

	p->des2 = cpu_to_le32(lower_32_bits(addr));
	p->des3 = cpu_to_le32(upper_32_bits(addr));

This loop then always sets IOC through dwmac4_set_rx_owner():

	if (!disable_rx_ic)
		flags |= RDES3_INT_ON_COMPLETION_EN;

With RIWT coalescing enabled, every descriptor in the first ring pass
after resume would raise a completion interrupt. That continues until
stmmac_rx_refill() or stmmac_rx_refill_zc() re-arm the descriptors using
stmmac_rx_need_ic().

> +	}
>  
>  	return 0;
>  }

[ ... ]

> @@ -8503,6 +8577,18 @@ int stmmac_resume(struct device *dev)
>  	stmmac_free_tx_skbufs(priv);
>  	stmmac_clear_descriptors(priv, &priv->dma_conf);
>  
> +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
> +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf, queue);
> +		if (ret) {
> +			netdev_err(ndev, "Failed to restore RX queue %u: %d\n",
> +				   queue, ret);
> +			stmmac_legacy_serdes_power_down(priv);
> +			mutex_unlock(&priv->lock);
> +			rtnl_unlock();
> +			return ret;
> +		}
> +	}

[Severity: Medium]
If stmmac_reinit_rx_descriptors() returns -ENOMEM here, what state is the
netdev left in?

This early return skips stmmac_enable_all_queues(), phylink_resume() and
netif_device_attach(). NAPI stays disabled from stmmac_suspend(), the
device stays detached, and phylink_prepare_resume() is never matched by
phylink_resume(). netif_running() is still true.

A later close then runs:

dev_close()
  stmmac_release()
    __stmmac_release()
      stmmac_disable_all_queues()
        napi_disable()

on NAPI instances that are already disabled. napi_disable_locked() waits
for NAPIF_STATE_SCHED to clear, but that bit is still set from the first
disable, so the close would hang with RTNL held.

The existing stmmac_hw_setup() failure path has the same problem. This
patch adds a new trigger that depends on a GFP_KERNEL allocation
succeeding during system resume.

The XSK branch already tolerates missing buffers. Could the page_pool
branch do the same, for example by leaving the slot CPU-owned for the
refill path to retry, instead of failing the whole resume?

>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261025100636.613670-1-dinghui1111%40163.com

