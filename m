Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6CCCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAKBMQWFUgDFSqyxXh+KYuXbbvV+LZoZ1IOhw0GteFU=; b=jqCMiejYwTUgb13gA4dMj+qMog
	a5XagK++Lrhbp8CnEgNnr7cZJHxx8jxi3+WyhsUBt9MdQeowyIYtm2jNHYALb79VgAYqRbwKmFS/9
	HbxdqzcGQAaJB1nHIoIrRXFkDYqm26Faab6Qs5AEJsaqKBWTnxv/GMO+h5Bdqy39szmI2CAPl13QX
	HukV+E47T9nUjHy76U/fuc1NG3/NgOgQjWA5StULzTzj9jr6Up1us1GUln6loBy4qKkKk9FyzhS/c
	E9ph4flOM/0TSA6Orj0eacnLN9zooWrNArU7HTK0vxUZjJWo7wv80/5F6gdwt7FmF50qRBHKiJTfQ
	noCRVAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXlz-0000000Apsi-1V3t;
	Fri, 02 Oct 2026 07:33:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXly-0000000ApsG-0u7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:33:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3BA040BDC;
	Fri,  2 Oct 2026 07:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428DC1F00893;
	Fri,  2 Oct 2026 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926417;
	bh=BAKBMQWFUgDFSqyxXh+KYuXbbvV+LZoZ1IOhw0GteFU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mdeyXZII2M0CeXzirpTOBXbqwOBNV02BfeaF94rIuWt/OCiw64WFQZ3DiLXcvpxry
	 S9lBM8NL54xLQFUxUct8w7IvnIco9lNqP5/FrOZgRRWEZ7oaTZnznEJQHDxbuIHnK9
	 36D2fm+yp73pMbrdtqTrZt1PCJZT3RcV4nHS2cQWkvhas++9WQlLbyRLNGi8qHfts8
	 gmOvtKlFZkaSmEEfUHkWeCzzABuLCWt5xpWoyiUPNX+m8kOor8JWMbClydiXlRRQIR
	 4p9HFPMZk0sIA0VhZhU+ux/WuzlLoGtJKenaIj6hxgRyS25OfueF/KKMULwKQXifwe
	 JEO1t1/ie1vUA==
Subject: Re: [PATCH net-next v9 10/15] net: lan966x: add shutdown callback to
 stop the FDMA on reboot
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 02 Oct 2026 07:33:35 +0000
Message-ID: <179092641582.434549.9865305729619927838@kernel.org>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-10-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-10-a17caf60f89a@microchip.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern: lan966x_shutdown() disables lan966x->napi and then
  releases rtnl.
- [Low] Concern: lan966x_fdma_rx_disable() and lan966x_fdma_tx_disable()
  ignore the return value of readx_poll_timeout_atomic() on…
- [Low] Concern: after lan966x_shutdown(), a devmap or bpf_redirect from
  another NIC could reach lan966x_xdp_xmit() -> lan966x_fdma_xmit_xdpf()…

--

net: lan966x: add shutdown callback to stop the FDMA on reboot

This commit adds a platform shutdown callback for the PCIe instance of
lan966x. The callback frees the irqs, masks the analyzer interrupt,
disables NAPI, detaches the netdevs, stops both FDMA channels and unmaps
the outbound ATU windows. It also restores the full FDMA_INTR_ENA enable
in lan966x_fdma_rx_start(), because that register persists across a warm
reboot.

> NAPI is skipped when fdma_ndev is unset (a probed switch with no
> usable port never adds one), and XDP attach cannot re-enter the FDMA
> either: on PCIe, lan966x_xdp_setup() returns before the page pool
> reload, which is the only point where it touches the FDMA.

[Severity: Low]
Is this accurate at this point in the series? At this commit,
lan966x_xdp_setup() checks only lan966x->fdma before the reload:

lan966x_xdp.c:lan966x_xdp_setup() {
	if (!lan966x->fdma) {
		NL_SET_ERR_MSG_MOD(xdp->extack,
				   "Allow to set xdp only when using fdma");
		return -EOPNOTSUPP;
	}
	...
	err = lan966x_fdma_reload_page_pool(lan966x);
	...
}

Suppose lan966x_shutdown() has called napi_disable() and dropped rtnl.
An XDP attach or detach would then reach:

  lan966x_xdp_setup()
    lan966x_fdma_reload_page_pool()
      lan966x_fdma_reload()
        napi_synchronize(&lan966x->napi);
        napi_disable(&lan966x->napi);

That would hang on the already disabled NAPI with rtnl held. It could
also re-arm RX through lan966x_fdma_rx_start().

In practice this doesn't look reachable at this revision.
lan966x_probe() sets lan966x->fdma only when an "fdma" interrupt exists.
The in-tree lan966x_pci.dtso overlay doesn't declare one until the last
patch of the series ("misc: lan966x-pci: dts: add fdma interrupt to
overlay"). So lan966x_shutdown() returns before napi_disable(), and XDP
attach returns -EOPNOTSUPP.

The lan966x_is_pci() early return in lan966x_xdp_setup() is added later
by "net: lan966x: add PCIe FDMA support" and "net: lan966x: add PCIe
FDMA XDP support". Could the commit message describe the state at this
revision, or say that the early return is added later in the series?

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 259d81e75907..024ce9f9916c 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1324,9 +1324,65 @@ static void lan966x_remove(struct platform_device *pdev)
>  	debugfs_remove_recursive(lan966x->debugfs_root);
>  }
>  
> +static void lan966x_shutdown(struct platform_device *pdev)
> +{
> +	struct lan966x *lan966x = platform_get_drvdata(pdev);
> +

[ ... ]

> +	if (!lan966x->fdma)
> +		return;
> +
> +	rtnl_lock();
> +
> +	if (lan966x->fdma_ndev)
> +		napi_disable(&lan966x->napi);
> +
> +	for (int p = 0; p < lan966x->num_phys_ports; p++) {
> +		if (!lan966x->ports[p] || !lan966x->ports[p]->dev)
> +			continue;
> +
> +		netif_tx_disable(lan966x->ports[p]->dev);
> +		netif_device_detach(lan966x->ports[p]->dev);
> +	}
> +
> +	lan966x_fdma_rx_disable(&lan966x->rx);
> +	lan966x_fdma_tx_disable(&lan966x->tx);

[Severity: Low]
Can anything re-arm the TX channel after this point?
lan966x_fdma_tx_disable() clears tx->activated without taking tx_lock.
A later devmap or bpf_redirect from another NIC would then go:

  lan966x_xdp_xmit()
    lan966x_fdma_xmit_xdpf()
      lan966x_fdma_tx_start()
        lan966x->tx.activated = true;
        lan966x_fdma_tx_activate(tx);

As far as I can tell this path is blocked:

- At this commit, PCIe instances have lan966x->fdma == false with the
  in-tree overlay, so shutdown never reaches this code.

- At the end of the series, lan966x_probe_port() adds
  NETDEV_XDP_ACT_REDIRECT and NETDEV_XDP_ACT_NDO_XMIT only when
  !lan966x_is_pci(). __xdp_enqueue() in kernel/bpf/devmap.c rejects
  devices that lack NETDEV_XDP_ACT_NDO_XMIT.

- Regular xmit is drained by netif_tx_disable() above. The PCIe XDP_TX
  path runs only from NAPI, which is disabled first.

Is the xdp_features gate the intended guarantee that nothing re-arms
this channel after shutdown?

> +
> +	lan_wr(0, lan966x, FDMA_INTR_ENA);
> +	lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
> +
> +#if IS_ENABLED(CONFIG_MCHP_LAN966X_PCI)
> +	fdma_pci_atu_region_unmap(lan966x->rx.fdma.atu_region);
> +	fdma_pci_atu_region_unmap(lan966x->tx.fdma.atu_region);
> +#endif

[Severity: Low]
This isn't a bug, but lan966x_fdma_rx_disable() and
lan966x_fdma_tx_disable() both discard the result of the FDMA_CH_ACTIVE
poll:

	readx_poll_timeout_atomic(lan966x_fdma_channel_active, lan966x,
				  val, !(val & BIT(fdma->channel_id)),
				  READL_SLEEP_US, READL_TIMEOUT_US);

So the ATU windows are unmapped here even if a channel never went idle,
and nothing is logged. READL_TIMEOUT_US is 100 s, so a timeout means the
engine is stuck. Unmapping the windows is still the right step in that
case.

A stale FDMA error carried into the next kernel is not a concern either.
lan966x_reset_switch() clears FDMA_ERRORS, FDMA_INTR_ERR and
FDMA_INTR_DB before lan966x_probe() requests the fdma irq.

Would a warning on timeout help make a stuck FDMA visible at shutdown?
The disable helpers themselves predate this patch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com

