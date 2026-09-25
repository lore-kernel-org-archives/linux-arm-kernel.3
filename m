Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D72C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmyhYylWORRrsIGDw2qMDbsX+gU3arid6ksSQ/SrjKM=; b=nUZzBn6EDUqygzCbkdeBull0WH
	tjjNEYGhIjwJ00MDkiYYumVesXmtsg7kPt779hYdD4hm7Bmw+uPEpcrLhdjgHTeqsNc2BZTVRJViW
	4YL4kMh/Xl4Fv1T/bMYnmxsq1MoHF2lTtlzjlBk9emm99i3BpfRrRi1ujVWbDlX7sfWn7Irm6wp/d
	diFBACQoxoxQRRyy+t+vQDujgZ6A9VH9pIWTcCYXVCVx+DmKVDknxu681LYCPtIgvGQFyuiKnRPPm
	uaMNC8/ng15go2xvN8QMtpfCEyG+8U0tOtoEcsKZ6VOX1BLOcMrRCkW7okgpf4q9CgyP32N963jCF
	QsLlu5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABL9-0000000EESJ-1dg6;
	Fri, 25 Sep 2026 19:12:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABL5-0000000EERL-3DH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3645F60235;
	Fri, 25 Sep 2026 19:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E236A1F00898;
	Fri, 25 Sep 2026 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363526;
	bh=OmyhYylWORRrsIGDw2qMDbsX+gU3arid6ksSQ/SrjKM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ka6e/kK43r9clvAmWkMsif6JOvSNBWXnSCW5iSX5mM9CFgU9n/E638ozbxxydcSf3
	 FGAlIQI/vGiKzv8nPBVHDtoeEat0A/NzTHeF3kB1oVU15X8WQLZBXFyZfXA8FLndnP
	 z5v9PUkDWLl0DPkJP7tiEUaofYNe5qQfRMlfYBi6FcrN1h1Zy0hlJ90JS13U0rhIQ/
	 7ype8kZcInQ/kjU67bzrcAJPd+M5gE5Ncu4CafotgHf6iN9pIbk6GsnbvzTCF2IFS3
	 hzh8HFoTVmadoZ2pr8lyO2h1FHo2Vvu7W3VyErpQ2cq0oxrfsH5GL6KdGjZJp3DHAY
	 UZInXZgUEjP3g==
Subject: Re: [PATCH net v3 07/10] net: stmmac: account for failed live XDP reopening
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 qiangqing.zhang@nxp.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ansuelsmth@gmail.com,
 yangtiezhu@loongson.cn, chenhuacai@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, fancer.lancer@gmail.com, quic_jsuraj@quicinc.com,
 richardcochran@gmail.com, Joao.Pinto@synopsys.com, vladimir.oltean@nxp.com,
 boon.leong.ong@intel.com, weifeng.voon@intel.com, yoong.siang.song@intel.com,
 richard.genoud@bootlin.com, alastair@d-silva.org, mripard@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 zhaojinming@uniontech.com, lorenzo.bianconi@oss.qualcomm.com,
 dinghui1111@163.com
Date: Fri, 25 Sep 2026 19:12:04 +0000
Message-ID: <179036352450.2160803.6163494216878477708@kernel.org>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-7-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-7-c031e3f3a282@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch makes every live XDP program attach or detach take
  the physical link down and renegotiate it, even when the reopen…
- [Medium] The EEE software LPI timer (priv->eee_ctrl_timer) can be re-
  armed after phylink cancels it, so it escapes the quiescence that this…

--

net: stmmac: account for failed live XDP reopening

This patch changes the live XDP release/open pair to track datapath
ownership state. The pair now detaches the netdev and stops/starts
phylink around the swap, and stmmac_xdp_open() gets proper error
unwinding. stmmac_xdp_set_prog() now holds the old program reference
until the reopen succeeds, and restores it when an attach fails.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ce598b5757637..467f471874cf7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -7244,19 +7252,15 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
>  void stmmac_xdp_release(struct net_device *dev)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
> -	u8 chan;
> -
> -	/* Ensure tx function is not running */
> -	netif_tx_disable(dev);
>  
> -	/* Disable NAPI process */
> -	stmmac_disable_all_queues(priv);
> -
> -	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
> -		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
> +	netif_device_detach(dev);
> +	phylink_stop(priv->phylink);
> +	stmmac_quiesce(priv);
> +	priv->datapath = STMMAC_DATAPATH_DOWN;

[Severity: Medium]
Does this make every live XDP attach or detach drop the physical link and
renegotiate it, even when stmmac_xdp_open() succeeds?

stmmac_xdp_set_prog() calls the release/open pair each time XDP is
toggled on a RUNNING datapath. Before this patch the pair only called
netif_carrier_off() and netif_carrier_on(). Now it does this:

stmmac_xdp_release()
  phylink_stop()
    sfp_upstream_stop()
    phy_stop()  -> PHY_HALTED -> phy_link_down(), then phy_suspend()
    (PCS disabled)

stmmac_xdp_open()
  phylink_start()
    phylink_mac_initial_config()
    phy_start()  -> autonegotiation restarts

As a result, both the link partner and the host would see the link go
down and come back up. The link stays down for the whole negotiation.

The commit in the Fixes: tag, ac746c8520d9, was written to avoid exactly
this. Its message says the old close/open would "tear down the PHY device
and causes undesirable autonegotiation which causes a delay whenever
AFXDP ZC is setup".

As far as I can tell, phylink only has to be stopped on the failure path.
__stmmac_release() returns early for STMMAC_DATAPATH_DOWN, so otherwise
nothing would ever stop phylink. On success, could the link stay up as
it did before?

A smaller related point: stmmac_xdp_open() now enables the MAC and starts
DMA while the PHY is powered down, so its RX clock may be stopped. stmmac
sets mac_requires_rxc, but stmmac_xdp_open() does not call
phylink_prepare_resume() the way __stmmac_open() does. This path does no
DMA software reset, so the effect may be harmless.

This behaviour is still present at the end of the series. The later XSK
pool patch also sends pool changes through the same release/open pair.

>  
>  	/* Free the IRQ lines */
>  	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
> +	stmmac_stop_tx_queues(priv);

[Severity: Medium]
Can priv->eee_ctrl_timer be re-armed after phylink cancels it, so that
this drain misses it?

phylink_stop() now runs before stmmac_quiesce() disables NAPI. It cancels
the EEE timer through this chain:

phylink_stop()
  phylink_link_down()
    phylink_deactivate_lpi()
      stmmac_mac_disable_tx_lpi()
        priv->eee_sw_timer_en = false;
        timer_delete_sync(&priv->eee_ctrl_timer);

That runs under priv->lock. A NAPI poll on another CPU in stmmac_tx_clean()
holds only the TX queue lock, and it may already have passed this check:

stmmac_tx_clean() {
    ...
	if (priv->eee_sw_timer_en && !priv->tx_path_in_lpi_mode)
		stmmac_restart_sw_lpi_timer(priv);
    ...
}

If so, its mod_timer() can run after timer_delete_sync(). Nothing later
catches it:

- netif_device_detach() does not drain NAPI.
- stmmac_quiesce() and stmmac_stop_tx_queues() only cancel the per-queue
  txtimer hrtimers.

The re-armed timer calls stmmac_eee_ctrl_timer() and then
stmmac_try_to_start_sw_lpi(), which does not check eee_sw_timer_en. It
would either force LPI on a MAC where phylink has disabled EEE, or re-arm
itself while dirty_tx != cur_tx.

Suppose stmmac_xdp_open() then fails before stmmac_reset_queues_param(),
for example in alloc_dma_desc_resources(). cur_tx and dirty_tx are never
reset, so the timer could keep re-arming while the device is DOWN.
Nothing deletes eee_ctrl_timer on close or remove, so could it fire on
freed priv once the device is removed?

The ordinary release path has had the same phylink_stop()-before-NAPI
ordering since before this series. This patch adds that ordering to the
XDP swap path.

The last patch in the series adds timer_delete_sync(&priv->eee_ctrl_timer)
after stmmac_quiesce() in stmmac_reconfigure_mtu(). stmmac_xdp_release()
still does not have it at the end of the series. Is the same cancellation
needed here?

>  
>  	/* Stop TX/RX DMA channels */
>  	stmmac_stop_all_dma(priv);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282%40gmail.com

