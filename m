Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98612CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hASnv+sShbpSN84lIK0vwzCccQ7DGFNvDbQRK1Twa1E=; b=TUOywfr37WOk3C0E2uCgGyFFSG
	h5tEe0oF2MABKGFlW1iYOPflJC2kpIVfjSgXdL9wUg2W0btKCdgL9twEuFPzUmkWVR1Llz+OhqUeB
	H+PHqNVQVD9qwsVSaCCCTM4DwnLQOtnZnAJEa5cr58VrvvgbfOeXIlriafBgpproFa0ali9evGaKy
	iOTv8eHlPqaiylibXfUtC+2nAj6Mg787fv07YnS8NeFcmH9ZqDmg/mbXIwpvxghL+ZskXTXptNApk
	sL1W+4W/mZi0HjhKrJkOlOrQ4hxV+fSnrB+HQgNbN6jXm4dRjOSvN81GvnVGLYn8jnEGyIu7rmRFZ
	UJv8UJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIllt-00000007JJ0-1VWm;
	Mon, 19 Oct 2026 11:43:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIllr-00000007JIl-0meg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E058601FB;
	Mon, 19 Oct 2026 11:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439891F000C4;
	Mon, 19 Oct 2026 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410193;
	bh=hASnv+sShbpSN84lIK0vwzCccQ7DGFNvDbQRK1Twa1E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gHr3iv6CinGvRkRBuYrfe0QaAgH6mesatPs+ujwnE3VoJm/pdD+RxcNReTK1GJfPb
	 uHSe4BGdl/C+3cWW37GvSB9/iYq1qBBtjMPTiXL4HM0/epWdc86S5ag7UvAceYxqzz
	 y+kziKBI1yrL7eLJy8Poey0rW4rY50gCqd2CmTIZYa4h7hch1OMpOjMD7QH9vuRpCH
	 nqBrUp7afUy7HtFSSTUWM3/E9UrvNN/i0cyTV5DpdBVjmwLM4OTQFGiSKFJ/9Vd2/F
	 tBQul50vkCrz8pAnF/5tzvSiKHmyIjRtKl6nucDSf1Dt4VNbYYj4U9wlDnU44GdwIZ
	 B7IdNxgwtQsyg==
Subject: Re: [PATCH] net: stmmac: remove STMMAC_DOWN check to avoid irq storm
From: netdev-bot+sashiko@kernel.org
To: chuanx2070@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Oct 2026 11:43:12 +0000
Message-ID: <179241019282.3135.17755153635935720256@kernel.org>
In-Reply-To: <20261015112415.437900-1-chuanx2070@163.com>
References: <20261015112415.437900-1-chuanx2070@163.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch moves the STMMAC_DOWN check so it runs after the
  hardware interrupt status has been read and cleared.
- [Low] The commit fixes a user-visible bug: an interrupt storm (a hard-
  IRQ livelock on UP, or on the CPU running the stmmac_wq reset worker)…

--

net: stmmac: remove STMMAC_DOWN check to avoid irq storm

This patch removes the early STMMAC_DOWN return from the stmmac interrupt
handlers, so the device status registers are always read and cleared. The
STMMAC_DOWN check now sits inside stmmac_safety_feat_interrupt() and
stmmac_napi_check(), after the status has been read, and events are dropped
while the bit is set. The goal is to avoid an interrupt storm on
level-triggered IRQ lines during an adapter reset.

[ ... ]

> is re-entered forever. Since the handler returns IRQ_HANDLED,
> note_interrupt() never flags the IRQ as spurious and never disables it,
> resulting in an interrupt storm.
>
> Signed-off-by: Xiaochuan Li <chuanx2070@163.com>

[Severity: Low]
Should this have a Fixes: tag? The STMMAC_DOWN early return in
stmmac_interrupt() was added by:

34877a15f787 ("net: stmmac: Rework and fix TX Timeout code")

The same check was later copied into stmmac_mac_interrupt(),
stmmac_safety_interrupt(), stmmac_msi_intr_tx() and stmmac_msi_intr_rx() by:

8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")

Without a Fixes: tag, or a Cc: stable, stable maintainers can't easily tell
that this is a fix or which trees need it.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b837e8e27a352..ec7ca45a9ba61 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3063,6 +3063,13 @@ static bool stmmac_safety_feat_interrupt(struct stmmac_priv *priv)
>  
>  	ret = stmmac_safety_feat_irq_status(priv, priv->dev,
>  			priv->ioaddr, priv->dma_cap.asp, &priv->sstats);
> +
> +	/* Status is read/cleared; do not escalate to a global error reset
> +	 * while the interface is going down.
> +	 */
> +	if (test_bit(STMMAC_DOWN, &priv->state))
> +		return false;
> +
>  	if (ret && (ret != -EINVAL)) {
>  		stmmac_global_err(priv);
>  		return true;
> @@ -3085,6 +3092,12 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
>  	rx_napi = rx_q->xsk_pool ? &ch->rxtx_napi : &ch->rx_napi;
>  	tx_napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
>  
> +	/* Status was already read (and clear) above, so the irq line is
> +	 * deasserted, Drop the event while the interface is going down.
> +	 */
> +	if (test_bit(STMMAC_DOWN, &priv->state))
> +		return 0;
> +

[Severity: High]
Is "while the interface is going down" accurate here? STMMAC_DOWN is set and
cleared only in stmmac_reset_subtask(), and it stays set across dev_open()
as well as dev_close():

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_reset_subtask() {
    ...
	set_bit(STMMAC_DOWN, &priv->state);
	dev_close(priv->dev);
	dev_open(priv->dev, NULL);
	clear_bit(STMMAC_DOWN, &priv->state);
    ...
}

By the time dev_open() returns, __stmmac_open() has already set up DMA,
called phylink_start(), requested the IRQs, enabled NAPI and the TX queues,
and called stmmac_enable_all_dma_irq(). The NETDEV_UP notifiers also run
before clear_bit().

Can interrupts from the reopened, running hardware in that window be
acknowledged and then lost? stmmac_dma_interrupt_status() has already
written the W1C status, for example in dwmac4_dma_interrupt():

	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));

Then stmmac_napi_check() returns 0 without scheduling NAPI. Before this
patch, the status stayed latched and was serviced once STMMAC_DOWN was
cleared.

Here are some of the cases.

If RI is dropped and the RX ring fills inside the window, RX DMA suspends
with RBU. dwmac4_dma_interrupt() only counts RBU in rx_buf_unav_irq and
never returns handle_rx. Does RX then stay stalled, because
stmmac_rx_refill() never runs, until the next ifdown/up or reset?

If TI is dropped and tx_coal_timer is 0, stmmac_tx_timer_arm() returns
early. What reclaims those TX descriptors in that case?

Because the status is 0, stmmac_dma_interrupt() and stmmac_msi_intr_tx()
also skip this for a stopped TX DMA channel:

	if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
		stmmac_bump_dma_threshold(priv, chan);
	} else if (unlikely(status[chan] == tx_hard_error)) {
		stmmac_tx_err(priv, chan);

That leaves recovery to the netdev watchdog.

In stmmac_safety_feat_interrupt(), an uncorrectable ASP error reported by
the reinitialised hardware never reaches stmmac_global_err(). In
stmmac_interrupt(), the false return also falls through into
stmmac_common_interrupt() and stmmac_dma_interrupt() on hardware that has
just reported a fatal error.

On the close side, __stmmac_release() calls stmmac_disable_all_queues()
(napi_disable) before stmmac_free_irq(), so napi_schedule_prep() already
fails there. That suggests the new check only changes behaviour during the
reopen half of the reset.

Would it work to clear STMMAC_DOWN, or use a separate close-only state,
before the DMA IRQs are re-enabled? Or to keep handling events normally and
rely on napi_disable() during close?

>  	if ((status & handle_rx) && (chan < priv->plat->rx_queues_to_use)) {
>  		if (napi_schedule_prep(rx_napi)) {
>  			spin_lock_irqsave(&ch->lock, flags);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261015112415.437900-1-chuanx2070%40163.com

