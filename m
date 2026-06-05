Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08FBCD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrkc0GhW/oOLTIoJH9JhkWhKT+HfutzlNHyT1CCjAik=; b=Bg68fm0EeeaomPG7ztksY4dFLn
	dBYHSdUAoiPb45DLh03hDlRM1xj5WKgAS31L7LG8JwUvqOXGbqLl7VcNyYO3AWWul2uWrpAzSGPYs
	ORRVFKTJ9dhmM8rIgAj3DyIRDxFDAC+G+PhVdqRkJV6S4kEFyjg8yeEdEdMC12maE0XFFVVZxL1kp
	yjR55mzwQuzCwr8NV2b6w0ZwQAKRZitcEPnsMhv1oZbQB8/WlAWma4cJeVi6NERvhPHs0FyLGJeff
	6mhZ8dcWWOKe/vD/JornqUXxNprxpzozhjRWpgRuyR1EGLnggjwchJEk4TPRLCzxigDOumC2U8fAL
	q2z1ZTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9A-0000000HZBF-0isx;
	Fri, 05 Jun 2026 02:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK98-0000000HZB8-2t0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 02:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E5560052;
	Fri,  5 Jun 2026 02:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF451F00893;
	Fri,  5 Jun 2026 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625933;
	bh=zrkc0GhW/oOLTIoJH9JhkWhKT+HfutzlNHyT1CCjAik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LDH7CrjPBywNb5+Ib4MCEv1AFUn00S8nOW+ftRhXJJhioCBG5hqazwHg9IOKuYSRD
	 /A0FMMNNR6RfVSVMzDROQgX1w8jYZVKhoNivSRAFXeaSR7qYUR/qVWXKtZWQXYvLiq
	 6o2Fs8ND+iEg0xeYrCHaOE8Wb5dtijvMPq4V6TaXRVwYHgrTwDjbKVoY24lQpeedyH
	 9Q2n/puXqSZv27B2JgobYSZXokPBtcSDcFlGbXSUO7eMTxVmPm+1oz+UT7Tmytr6qw
	 tr815FEcG8SL1+fDUhPunnodaP4qz7knWTNXkeSkKstoRU74sdZXXVGUfzvkStWdQD
	 7PpvB5GX59R4g==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	lgirdwood@gmail.com,
	nathan@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	krzk+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org
Subject: Re: [net-next v24 2/7] net: mtip: The L2 switch driver for imx287
Date: Thu,  4 Jun 2026 19:18:50 -0700
Message-ID: <20260605021851.3594517-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601112437.2216043-3-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-3-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: mtip: The L2 switch driver for imx287

This patch adds a new driver for the MoreThanIP L2 switch embedded in
the i.MX287 SoC.  The two-port switch sits between uDMA[01] and the
MAC-NET[01] blocks and can be used as an alternative to the existing
FEC driver.

A few questions inline below.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> new file mode 100644
> index 000000000000..1d1005a42306
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static void mtip_switch_restart(struct net_device *dev, int duplex0,
> +				int duplex1)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	int i;
> +
> +	 /* Perform a reset. We should wait for this. */
> +	writel(MCF_ESW_MODE_SW_RST, fep->hwp + ESW_MODE);

[High]
Should this routine hold a lock?  fep->hw_lock is declared and
initialised in mtip_sw_probe() with the comment "/* Lock for HW
configuration */" but neither mtip_switch_restart() nor mtip_adjust_link()
acquire it.

The two ports each get their own phy_device via of_phy_connect(), and
phylib serialises adjust_link callbacks per phy_device, not across them.
If both ports' state machines fire mtip_adjust_link() at the same time,
both CPUs end up inside mtip_switch_restart() in parallel, racing on
ESW_MODE_SW_RST, ESW_BMPC, ESW_ISR, ESW_RDSR/ESW_TDSR, fep->cur_tx /
cur_rx / dirty_tx, and fep->full_duplex[].

> +	/* Reset SKB transmit buffers */
> +	for (i = 0; i <= TX_RING_MOD_MASK; i++) {
> +		if (fep->tx_skbuff[i]) {
> +			dev_kfree_skb_any(fep->tx_skbuff[i]);
> +			fep->tx_skbuff[i] = NULL;
> +		}
> +	}

[High]
Can two concurrent invocations of this loop double-free a tx_skbuff[i]
entry?  Both CPUs read the same non-NULL pointer, both call
dev_kfree_skb_any() on it, and only then race on the NULL store.

> +
> +	fep->full_duplex[0] = duplex0;
> +	fep->full_duplex[1] = duplex1;
> +
> +	mtip_configure_enet_mii(fep, 1);
> +	mtip_configure_enet_mii(fep, 2);
> +
> +	/* And last, enable the transmit and receive processing */
> +	writel(MCF_ESW_RDAR_R_DES_ACTIVE, fep->hwp + ESW_RDAR);
> +
> +	/* Enable interrupts we wish to service */
> +	writel(0xFFFFFFFF, fep->hwp + ESW_ISR);
> +	writel(MCF_ESW_IMR_TXF | MCF_ESW_IMR_RXF,
> +	       fep->hwp + ESW_IMR);
> +
> +	mtip_config_switch(fep);
> +}
> +
> +static irqreturn_t mtip_interrupt(int irq, void *ptr_fep)
> +{
> +	struct switch_enet_private *fep = ptr_fep;
> +	irqreturn_t ret = IRQ_NONE;
> +	u32 int_events, int_imask;
> +
> +	/* Get the interrupt events that caused us to be here */
> +	int_events = readl(fep->hwp + ESW_ISR);
> +	writel(int_events, fep->hwp + ESW_ISR);
> +
> +	if (int_events & (MCF_ESW_ISR_RXF | MCF_ESW_ISR_TXF)) {
> +		ret = IRQ_HANDLED;
> +		/* Disable the RX interrupt */
> +		if (napi_schedule_prep(&fep->napi)) {
> +			int_imask = readl(fep->hwp + ESW_IMR);
> +			int_imask &= ~MCF_ESW_IMR_RXF;
> +			writel(int_imask, fep->hwp + ESW_IMR);
> +			__napi_schedule(&fep->napi);
> +		}
> +	}
> +
> +	return ret;
> +}

[Medium]
Should this also clear MCF_ESW_IMR_TXF here?  The condition above
schedules NAPI on either RXF or TXF, and the NAPI poll re-enables both
bits together:

	writel(MCF_ESW_IMR_RXF | MCF_ESW_IMR_TXF,
	       fep->hwp + ESW_IMR);

With only RXF masked here, every TX completion while NAPI is running
re-asserts the IRQ line; mtip_interrupt() runs again, napi_schedule_prep()
returns false because NAPI is already scheduled, and the handler returns
IRQ_HANDLED having done nothing useful.  Once mtip_switch_tx() is filled
in by the later patch in the series, would this turn into a sustained
IRQ storm on TX-busy workloads?

[ ... ]

> +static int mtip_mii_init(struct switch_enet_private *fep,
> +			 struct platform_device *pdev)
> +{
> +	struct device_node *node;
> +	int err = -ENXIO;
> +
> +	/* Clear MMFR to avoid to generate MII event by writing MSCR.
> +	 * MII event generation condition:
> +	 * - writing MSCR:
> +	 *      - mmfr[31:0]_not_zero & mscr[7:0]_is_zero &
> +	 *        mscr_reg_data_in[7:0] != 0
> +	 * - writing MMFR:
> +	 *      - mscr[7:0]_not_zero
> +	 */
> +	writel(0, fep->hwp + MCF_FEC_MII_DATA);
> +	/* Clear any pending transaction complete indication */
> +	writel(MCF_ENET_MII, fep->enet_addr + MCF_FEC_EIR);

[Medium]
Is the base address for the MMFR clear correct here?

fep->hwp is the switch base (fep->enet_addr + ENET_SWI_PHYS_ADDR_OFFSET,
i.e. enet_addr + 0x8000), while MCF_FEC_MII_DATA (0x040) is an offset
within the MAC register space.  At offset 0x040 from fep->hwp the header
defines:

	#define ESW_MCR             (0x040)

So this writel() goes to the switch's Mirror Configuration Register
rather than to MMFR.  The very next line correctly uses fep->enet_addr +
MCF_FEC_EIR for the EIR clear, and mtip_mdio_read()/mtip_mdio_write()
also use fep->enet_addr + MCF_FEC_MII_DATA for the actual MDIO accesses.
Should this writel() also use fep->enet_addr?

[ ... ]

> +static int mtip_open(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	int ret, port_idx = priv->portnum - 1;
> +
> +	if (fep->usage_count == 0) {
> +		ret = clk_enable(fep->clk_ipg);

[ ... ]

> +	ret = mtip_mii_probe(dev);
> +	if (ret)
> +		goto mtip_mii_probe_err;
> +
> +	phy_start(fep->phy_dev[port_idx]);
> +
> +	if (fep->usage_count == 0) {
> +		napi_enable(&fep->napi);
> +		mtip_switch_restart(dev, 1, 1);
> +
> +		netif_start_queue(dev);
> +	}

[High]
Can phy_start() race with the mtip_switch_restart() call below it?
Once phy_start() returns, the phylib state machine workqueue may invoke
mtip_adjust_link() on another CPU, which calls mtip_switch_restart() on
link-up.  That can run concurrently with the mtip_switch_restart(dev,
1, 1) here, and both paths walk fep->tx_skbuff[] freeing entries and
reprogram switch HW registers without synchronisation.

Would it be safer to start the PHY only after the switch HW has been
configured (and to take a lock around mtip_switch_restart())?

[ ... ]

> +static int mtip_parse_of(struct switch_enet_private *fep,
> +			 struct device_node *np)
> +{
> +	struct device_node *p;
> +	unsigned int port_num;
> +	int ret = 0;
> +
> +	p = of_get_child_by_name(np, "ethernet-ports");
> +
> +	for_each_available_child_of_node_scoped(p, port) {
> +		if (of_property_read_u32(port, "reg", &port_num))
> +			continue;

[Medium]
If of_get_child_by_name() returns NULL (no "ethernet-ports" node), the
for_each_available_child_of_node_scoped() loop is skipped entirely, ret
stays 0, and mtip_parse_of() returns success with no ports parsed.
Similarly, if every child fails the "reg" read above, the continue keeps
ret at 0.

After such a "success" return, mtip_ndev_init() calls
alloc_netdev(sizeof(struct mtip_ndev_priv), fep->ndev_name[i],
NET_NAME_USER, ether_setup) with fep->ndev_name[i] still NULL.
alloc_netdev_mqs() then calls strscpy_pad() on a NULL name and oopses.

Should missing "ethernet-ports", missing "reg", or having no parsed
ports be treated as errors here?

[ ... ]

> +		fep->phy_np[port_num - 1] = of_parse_phandle(port,
> +							     "phy-handle", 0);
> +		if (!fep->phy_np[port_num - 1]) {
> +			dev_err(&fep->pdev->dev,
> +				"%s: PHY handle not defined!\n", __func__);
> +			ret = -ENODEV;
> +			goto of_get_err;
> +		}
> +	}
> +
> + of_get_err:
> +	mtip_parse_of_cleanup(fep);
> +	of_node_put(p);
> +
> +	return ret;
> +}

[High]
Does the success path fall through into of_get_err: unconditionally?

There is no return ret; (or success label) before the of_get_err label,
so on a successful parse mtip_parse_of_cleanup(fep) runs and calls
of_node_put() on every fep->phy_np[i] just acquired by
of_parse_phandle().  mtip_parse_of_cleanup() also does not NULL the
slots:

	static void mtip_parse_of_cleanup(struct switch_enet_private *fep)
	{
		int i;

		for (i = 0; i < SWITCH_EPORT_NUMBER; i++)
			if (fep->phy_np[i])
				of_node_put(fep->phy_np[i]);
	}

After probe, mtip_open()->mtip_mii_probe() then passes the same
fep->phy_np[i] pointers to of_phy_connect() — does this dereference an
OF node the driver no longer holds a reference on?

The error and remove paths (the of_free_references label, the explicit
cleanup after devm_request_irq() failure, and mtip_sw_remove() ->
mtip_parse_of_cleanup()) call mtip_parse_of_cleanup() again on the same
non-NULL pointers, which would underflow the OF refcount on each.

Should there be a return ret; before of_get_err: and a NULL-out of the
slot in mtip_parse_of_cleanup() after each of_node_put()?

[ ... ]

> +static int mtip_sw_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret = devm_request_irq(&pdev->dev, fep->irq, mtip_interrupt, 0,
> +			       dev_name(&pdev->dev), fep);
> +	if (ret) {
> +		mtip_parse_of_cleanup(fep);
> +		return dev_err_probe(&pdev->dev, ret, "Could not alloc IRQ\n");
> +	}

[Medium]
Can a stale IRQ here dereference an uninitialised napi struct?

netif_napi_add(dev, &fep->napi, mtip_rx_napi) is only called from
mtip_open(), so between this devm_request_irq() and the first ndo_open
fep->napi is zero-initialised (no poll, no dev, no state).  Probe also
doesn't write 0 to ESW_IMR before requesting the IRQ — it relies on the
register's reset value.

If the bootloader or a warm reset left the switch with IMR set and
events pending in ESW_ISR, mtip_interrupt() can fire immediately on
enable, see RXF/TXF, call napi_schedule_prep(&fep->napi) (which sets
NAPIF_STATE_SCHED unconditionally and returns true), and queue the
zero-initialised napi struct.  net_rx_action() would then call
n->poll == NULL.

Would it help to either mask all interrupts (writel(0, fep->hwp +
ESW_IMR)) before request_irq, or defer request_irq until after
netif_napi_add()?
-- 
pw-bot: cr

