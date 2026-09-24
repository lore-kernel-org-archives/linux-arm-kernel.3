Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA7DC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7zrIxbqvpQcbuim4BEUFLfn10HVeBYRdYw/jutG/Kc=; b=MRnfB1khsx49XBiqZO1RF+q4Im
	S87Zsa4/xPcA2gln8l54RrDWoabQu3qzs1GcXxQyBEu1TueihZH/fAIow6IoHebjUmmReL/mI3H+w
	z8E7kEHurYwhN3nOoQz7z2DyCTqICU1eiixC+nko01f7U9CPIMaVSEOjTKzgGr4PUV2s/maPWKSyi
	ML2xv7MKS6B2BhJ4iykP79vokbOOvS7hI36KtFBxVTY4paSOQhc9SAgOFWJHFakztPMOQ/i0jTNot
	U82XvQxE8y04frGJdB45dwRSiXwtx8ETJAjrlN15n0lHAMidyxXpiAkvvWdTmKksBJ8KWCXMMXQT1
	3zejwzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eI3-0000000ALt6-35cC;
	Thu, 24 Sep 2026 07:54:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eHu-0000000ALqR-1JBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:54:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 158ED43345;
	Thu, 24 Sep 2026 07:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75D01F000FF;
	Thu, 24 Sep 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236478;
	bh=n7zrIxbqvpQcbuim4BEUFLfn10HVeBYRdYw/jutG/Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b9NDb5AtehBzrGBwGjs7uWwXUN9aQDYGM3IG7UGphZSzxL4Np4ke4WEejRt91Z3J/
	 wrytGQVbkj94K6UHvhV5AwDX9z9lP2laJNQJcIT34G0SlWYQKBgG7ApEwWmFLQZWUF
	 hMkAOQbpNKewnJ1KxzvszA+MaV4bWwENCi6drCd4gGF2HnAJxBeCHU/sGMe59viqdf
	 54B1ZeG85USo5bhvXLZIXwzdVpO8vt0AL6A69ATYjLQErq11/R+9cvsx3w7ZyJaVVF
	 wefak25V5wgjYp+xiuouMu7sF9EmBPpOEW5BkItcgLVX7S/18/6vJnp5IygdteQlHM
	 xsWtBV0cLww/A==
Subject: Re: [PATCH net 3/3] net: stmmac: close the interface after failed
 hardware resume
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 qiangqing.zhang@nxp.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ansuelsmth@gmail.com,
 yangtiezhu@loongson.cn, chenhuacai@kernel.org, richard.genoud@bootlin.com,
 alastair@d-silva.org, mripard@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Sep 2026 07:54:36 +0000
Message-ID: <179023647622.2160803.3867238093611682904@kernel.org>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-3-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-3-87a4e431ee00@gmail.com>
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

Critical: 0 · High: 2 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: the double-napi_disable() hang that the commit
  claims to eliminate is still reachable from three other PM paths.
- [High] A failed MTU reopen can leave the MAC enabled and TX/RX DMA
  running over descriptor memory that has already been freed, because…

Pre-existing issues:
- [High] The XDP program attach/detach path performs the same data-path
  teardown as __stmmac_release() but does not participate in either half…

--

net: stmmac: close the interface after failed hardware resume

On stmmac_hw_setup() failure in stmmac_resume(), the patch stops DMA,
disables the MAC, releases the suspended data path via a new napi_disabled
argument to __stmmac_release(), then closes and reattaches the netdev while
keeping RTNL held. The intent is to avoid a second napi_disable() on a
still-up interface whose NAPI was already disabled by suspend.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 44b59d0f56b5b..87cb0978ed6ad 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4245,7 +4245,7 @@ static int stmmac_open(struct net_device *dev)
>  	return ret;
>  }
>  
> -static void __stmmac_release(struct net_device *dev)
> +static void __stmmac_release(struct net_device *dev, bool napi_disabled)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u8 chan;
> @@ -4258,7 +4258,9 @@ static void __stmmac_release(struct net_device *dev)
>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
>  
> -	stmmac_disable_all_queues(priv);
> +	/* Suspend has already disabled NAPI when hardware resume fails. */
> +	if (!napi_disabled)
> +		stmmac_disable_all_queues(priv);

[Severity: High]
This isn't a bug introduced by this patch, but does the XDP attach/detach
path have the same problem that the new napi_disabled argument and the
priv->opened bookkeeping are meant to prevent?

stmmac_xdp_release() performs the same teardown as __stmmac_release() -
netif_tx_disable(), stmmac_disable_all_queues(), stmmac_free_irq(dev,
REQ_IRQ_ERR_ALL, 0), stmmac_stop_all_dma() and
free_dma_desc_resources(priv, &priv->dma_conf) - but never clears
priv->opened.

stmmac_xdp_open() re-enables NAPI only at its end, and its
dma_desc_error/init_error/irq_error labels return with NAPI still disabled
and priv->dma_conf's rings already freed. stmmac_xdp_set_prog() discards
that return value:

	if (if_running && need_update)
		stmmac_xdp_open(dev);

A later link-down then enters __stmmac_release(dev, false) with
priv->opened still true, so it skips the early return and calls
stmmac_disable_all_queues() on already-disabled NAPI, which spins in
napi_disable_locked():

net/core/dev.c:napi_disable_locked() {
	...
	while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
		usleep_range(20, 200);
		val = READ_ONCE(n->state);
	}
	...
}

Would that same pass also re-run free_dma_desc_resources() over rings
already freed? __free_dma_rx_desc_resources() and
__free_dma_tx_desc_resources() do not clear dma_rx/dma_tx/buf_pool/
tx_skbuff after freeing them.

Would a driver-tracked "data path already released / NAPI already disabled"
state, consulted by __stmmac_release() itself, cover this call site too
instead of a per-caller boolean?

[ ... ]

> @@ -6174,7 +6176,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
>  			return PTR_ERR(dma_conf);
>  		}
>  
> -		__stmmac_release(dev);
> +		__stmmac_release(dev, false);
>  
>  		ret = __stmmac_open(dev, dma_conf);
>  		if (ret) {

[Severity: High]
Can this leave the MAC enabled and DMA running over freed descriptor
memory when __stmmac_open() fails late?

__stmmac_open() copies dma_conf into priv->dma_conf and calls
stmmac_hw_setup(), which enables the MAC and starts every channel:

	/* Enable the MAC Rx/Tx */
	stmmac_mac_set(priv, priv->ioaddr, true);
	...
	/* Start the ball rolling... */
	stmmac_start_all_dma(priv);

If stmmac_request_irq() then fails, the irq_error label only stops phylink,
cancels the txtimers and releases PTP, and returns before priv->opened is
set back to true:

irq_error:
	phylink_stop(priv->phylink);

	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);

	stmmac_release_ptp(priv);
init_error:
	return ret;

stmmac_change_mtu() then frees the very rings the live DMA is programmed
with and calls netif_close(dev), but the close path returns immediately:

__stmmac_release() {
	/* A failed MTU reopen has already released the data path. */
	if (!priv->opened)
		return;
	...
}

so stmmac_stop_all_dma() is never reached. If phylink_stop() ran before the
link ever resolved up, no mac_link_down() occurs either, so would inbound
frames keep being written into memory already returned by
dma_free_coherent()?

Should the partial-open unwind in __stmmac_open() stop DMA and disable the
MAC, rather than having the close path treat every opened == false state as
fully released?

> @@ -8356,10 +8358,7 @@ int stmmac_resume(struct device *dev)
>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -		stmmac_legacy_serdes_power_down(priv);
> -		mutex_unlock(&priv->lock);
> -		rtnl_unlock();
> -		return ret;
> +		goto error_stop_dma;
>  	}
>  
>  	stmmac_init_timestamping(priv);
> @@ -8386,6 +8385,20 @@ int stmmac_resume(struct device *dev)
>  	netif_device_attach(ndev);
>  
>  	return 0;
> +
> +error_stop_dma:
> +	stmmac_stop_all_dma(priv);
> +	stmmac_mac_set(priv, priv->ioaddr, false);
> +	mutex_unlock(&priv->lock);
> +	/* Release the suspended data path before ndo_stop(), which must not
> +	 * disable NAPI or free these resources a second time.
> +	 */
> +	__stmmac_release(ndev, true);
> +	netif_close(ndev);
> +	netif_device_attach(ndev);
> +	rtnl_unlock();
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_resume);

[Severity: High]
Is the hang described in the commit message still reachable from the
sibling PM error exits that were not converted?

stmmac_suspend() disables NAPI on every channel whenever
netif_running(ndev) is true, and leaves IFF_UP set:

	netif_device_detach(ndev);

	stmmac_disable_all_queues(priv);

stmmac_resume() still has two plain returns taken after that state exists.
The platform resume hook:

	if (priv->plat->resume) {
		ret = priv->plat->resume(dev, priv->plat->bsp_priv);
		if (ret)
			return ret;
	}

which stmmac_pci_plat_resume() can reach by propagating a
pci_enable_device() failure, and the serdes power-up:

	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
		ret = stmmac_legacy_serdes_power_up(priv);
		if (ret < 0)
			return ret;
	}

where intel_serdes_powerup() returns -ETIMEDOUT from serdes_status_poll().
Only dwmac-tegra sets STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP, so the Intel
path does execute here, and this point is only reached when
netif_running() was true, i.e. NAPI is already disabled.

There is a third case on the suspend side:

suspend_bsp:
	if (priv->plat->suspend)
		return priv->plat->suspend(dev, priv->plat->bsp_priv);

stmmac_pci_plat_suspend() can fail on pci_save_state() after NAPI was
already disabled. device_resume() in drivers/base/power/main.c then bails
out early:

	if (!dev->power.is_suspended)
		goto Complete;

since is_suspended is only set when the suspend callback returned 0, so
stmmac_resume() - and therefore the new error_stop_dma recovery - never
runs for that case at all.

In all three cases priv->opened stays true, so a later
"ip link set dev X down" reaches __stmmac_release(dev, false) ->
stmmac_disable_all_queues() -> napi_disable(), which spins indefinitely in
napi_disable_locked() because nothing clears NAPIF_STATE_SCHED/NPSVC, with
RTNL held:

net/core/dev.c:napi_disable_locked() {
	...
	while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
		usleep_range(20, 200);
		val = READ_ONCE(n->state);
	}
	...
}

The new napi_disabled argument is passed true from exactly one call site,
so it does not generalize to these paths. Would a driver-level state flag
recording that the data path is suspended with NAPI disabled, checked
inside __stmmac_release(), cover all of them?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00%40gmail.com

