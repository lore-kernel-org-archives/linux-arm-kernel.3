Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEB2qZQP1vgBSTn1nqZtDocIOuk7rNyBBa6jmD2cv7g=; b=hiQYOtAnYxdcxts8GPhl0ZGrRa
	mFCxqDLIMqyW2RG+f3bi4O5/tsbWN1ipPBWnewbaGlfcOt3DZUsxVMJje1S4EdjkzWVR1GctnlIxy
	Bk1/Ibzk7nFPFLo+2SZyEqKvunDWgxjsRWKcHZ2FITyMPBS1x0BS41Mi8nnRQ4Ht/U1kJPYFNz0m1
	QzwB767kz0LcMcgWMySSrM4bqfdpYXAAvwxgqBWRKnW149dKVUt8kL7zplHDmI8P8EHma6SVBGxQF
	jh5hQ+kWocGBEc5usTmRRIUouZKMoceQxU+RlyXetj38Ee0GiqfqDYKDddEJkDn1ljpqkK8n7u3Yy
	Buz5TS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn2A-00000009fe1-43ww;
	Sat, 08 Aug 2026 19:48:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1z-00000009fSO-0qg1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:48:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9374A60054;
	Sat,  8 Aug 2026 19:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B5C1F000E9;
	Sat,  8 Aug 2026 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786218510;
	bh=CEB2qZQP1vgBSTn1nqZtDocIOuk7rNyBBa6jmD2cv7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rqaz2ASBTy8kJ13VwT06OblZeBQ/srhn9Z7xNKXPrN0TBvLRd9BkgqJ4i4jhELogg
	 2E6DnxZlJAwROXe9EdnxEwXzk30AbjZekYlq20/tudpe8o+ZxaZv+DdV/VEdql+PeM
	 HFfLhI8ccwkOj6V9Om5T/nlf3fNQXs2mxTRpdZtv7zWjurE6FrVxLYE568ZBoqpv0G
	 ZvWN2Ch5UiF3xl4Fr0zHTHDTAoJh6rWHGfdegTHZHVRuR+HaNv3BNjcZyw60JY+yfT
	 SK5ubtacR/1NmciNjbzffB22rsuT6yGvmACQxlRFK9RD8pBozjN/g64+DcZnlT6fcu
	 pnffwJfqxttAg==
From: Jakub Kicinski <kuba@kernel.org>
To: nagadheeraj.rottela@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	srinivas.neeli@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	michal.simek@amd.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	git-dev@amd.com
Subject: Re: [PATCH 12/20] net: dsa: xilinx: register per-MAC MDIO buses
Date: Sat,  8 Aug 2026 12:48:29 -0700
Message-ID: <20260808194829.133109-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807104431.157230-13-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-13-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
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
net: dsa: xilinx: register per-MAC MDIO buses

This adds one MDIO bus per MAC, using the controller block at +0x500 inside
each MAC register window, registered under the mdio-mac1 / mdio-mac2 DT
children.  A new struct xlnx_tsn_mac holds the per-MAC register window, the
mii_bus pointer and a back-pointer to the switch, and the MDC divisor is
derived from the wrapper node's s_axi clock rate.

A few questions below.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx/xilinx_tsn.c
> index 020b1622670c..542b74514ed3 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> @@ -95,6 +102,190 @@ static int xlnx_tsn_set_port_state(struct xlnx_tsn *sw, int port,
>  	return 0;
>  }
>
> +static int xlnx_tsn_mdio_wait_ready(struct xlnx_tsn_mac *m)
> +{
> +	u32 val;
> +
> +	return readl_poll_timeout(m->regs + TSN_MDIO_MCR_OFFSET, val,
> +				  val & TSN_MDIO_MCR_READY, 1,
> +				  TSN_MDIO_READY_TIMEOUT_US);
> +}
> +

[ ... xlnx_tsn_mdio_read() / xlnx_tsn_mdio_write() snipped ... ]

> +/* Round up so the MDC frequency stays at or below TSN_MDIO_MAX_FREQ_HZ,
> + * then clamp to the 6-bit field maximum so the value stays within the
> + * field and does not corrupt TSN_MDIO_MC_MDIOEN.
> + */
> +static u32 xlnx_tsn_mdio_clk_div(struct xlnx_tsn *sw, unsigned long host_hz)
> +{
> +	u32 div;
> +
> +	if (!host_hz) {
> +		dev_warn(sw->dev,
> +			 "s_axi clock rate unknown; clamping MDIO divisor to max\n");
> +		return TSN_MDIO_MC_CLOCK_DIVIDE_MAX;
> +	}
> +
> +	div = DIV_ROUND_UP(host_hz, TSN_MDIO_MAX_FREQ_HZ * 2) - 1;
> +
> +	/* HW ignores MDIO Enable when Clock Divide is 0 */
> +	if (!div)
> +		div = 1;
> +
> +	if (div > TSN_MDIO_MC_CLOCK_DIVIDE_MAX) {
> +		dev_warn(sw->dev,
> +			 "MDIO divisor %u exceeds max %u, clamping\n",
> +			 div, TSN_MDIO_MC_CLOCK_DIVIDE_MAX);
> +		div = TSN_MDIO_MC_CLOCK_DIVIDE_MAX;
> +	}
> +
> +	return div;
> +}

[Severity: Medium]
Should the clamp path bring the bus up at all?  For this block the rate is
f_MDC = f_HOST / ((1 + CLOCK_DIVIDE) * 2), so with div clamped to 0x3f the
resulting MDC is host_hz / 128, which is above 2.5 MHz for any s_axi rate
over 320 MHz:

	320000000 / (2 * 2500000) - 1 = 63 = 0x3f

Past that point the divisor cannot satisfy the clause-22 MDC maximum that
DIV_ROUND_UP(host_hz, TSN_MDIO_MAX_FREQ_HZ * 2) - 1 exists to enforce, yet
xlnx_tsn_mdio_register_one() still OR's the clamped value with
TSN_MDIO_MC_MDIOEN and enables the bus.  Nothing in the IP flags a failed
transaction: MCR.READY asserts and MRD is latched, so xlnx_tsn_mdio_read()
hands whatever the PHY drove at the over-clocked rate back to the PHY core
as a valid register value.

The driver for the same register block treats this as fatal instead:

drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:axienet_mdio_enable() {
	...
	if (clk_div & ~XAE_MDIO_MC_CLOCK_DIVIDE_MAX) {
		netdev_warn(lp->ndev, "MDIO clock divisor overflow\n");
		return -EOVERFLOW;
	}
	...
}

Would returning an error here rather than clamping match that behaviour?
The comment above the function only justifies the clamp as keeping the value
inside the field, and makes no claim that the resulting MDC rate is legal.

The same question applies to the !host_hz case, which also returns the max
divisor and enables the bus with an unknown MDC rate.

> +
> +static int xlnx_tsn_mdio_register_one(struct xlnx_tsn *sw, int port,
> +				      const char *child_name,
> +				      unsigned long host_hz)
> +{
> +	struct xlnx_tsn_mac *m = &sw->mac[port];
> +	struct device_node *mdio_np;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	mdio_np = of_get_child_by_name(sw->dev->of_node, child_name);
> +	if (!mdio_np)
> +		return 0;
> +
> +	bus = devm_mdiobus_alloc(sw->dev);
> +	if (!bus) {
> +		of_node_put(mdio_np);
> +		return -ENOMEM;
> +	}

[Severity: Medium]
Can the devres allocation here be mixed with the manual registration below?
This is the pattern commit f53a2ce893b2c ("net: dsa: mv88e6xxx: don't use
devres for mdiobus") warns about: "either use devres for both the mdiobus
allocation and registration, or don't use devres at all".

devm_mdiobus_alloc() ties the free to driver unbind, but of_mdiobus_register()
and mdiobus_unregister() run on the DSA setup/teardown cycle, and there is no
matching mdiobus_free()/devm_mdiobus_free() anywhere.

Two consequences look possible.  First, xlnx_tsn_shutdown() clears drvdata:

	dsa_switch_shutdown(&sw->ds);
	platform_set_drvdata(pdev, NULL);

so a later unbind hits the early return in xlnx_tsn_remove():

	sw = platform_get_drvdata(pdev);
	if (!sw)
		return;

dsa_unregister_switch() is then never called, ds->ops->teardown() (the only
mdiobus_unregister() site) never runs, and devres_release_all() reaches
mdiobus_free() with the bus still registered:

drivers/net/phy/mdio_bus_provider.c:mdiobus_free() {
	...
	WARN(bus->state != MDIOBUS_UNREGISTERED,
	     "%s: not in UNREGISTERED state\n", bus->id);
	...
}

At that point the bus is put_device()d while its child mdio devices, and the
"mac1"/"mac2" window its read/write callbacks touch, are still live.

Second, dsa_switch_teardown() resets ds->setup = false, so ds->ops->setup()
can run again on a still-bound device (a multi-switch tree torn down and
re-set-up).  xlnx_tsn_mdio_register_one() then calls devm_mdiobus_alloc()
again, since m->mii_bus was set to NULL by the teardown, and the previous
allocation is only freed at unbind.  Does this accumulate mii_bus objects
across setup cycles?

mv88e6xxx also registers its buses from ->setup and uses plain
mdiobus_alloc()/mdiobus_free() for exactly this reason.

> +
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s:%s",
> +		 dev_name(sw->dev), child_name);
> +	bus->name = "Xilinx TSN MDIO";
> +	bus->priv = m;
> +	bus->parent = sw->dev;
> +	bus->read = xlnx_tsn_mdio_read;
> +	bus->write = xlnx_tsn_mdio_write;
> +
> +	mac_iow(m, TSN_MDIO_MC_OFFSET,
> +		xlnx_tsn_mdio_clk_div(sw, host_hz) | TSN_MDIO_MC_MDIOEN);
> +
> +	ret = xlnx_tsn_mdio_wait_ready(m);
> +	if (ret) {
> +		dev_err(sw->dev, "%s: MDIO controller not ready: %d\n",
> +			child_name, ret);
> +		goto err_put_np;
> +	}
> +
> +	ret = of_mdiobus_register(bus, mdio_np);
> +	if (ret) {
> +		dev_err(sw->dev, "%s: failed to register MDIO bus: %d\n",
> +			child_name, ret);
> +		goto err_put_np;
> +	}
> +
> +	m->mii_bus = bus;
> +	of_node_put(mdio_np);
> +	return 0;
> +
> +err_put_np:
> +	of_node_put(mdio_np);
> +	return ret;
> +}
> +
> +static void xlnx_tsn_mdio_unregister_all(struct xlnx_tsn *sw)
> +{
> +	int port;
> +
> +	for (port = XLNX_TSN_PORT_MAC1; port <= XLNX_TSN_PORT_MAC2; port++) {
> +		struct xlnx_tsn_mac *m = &sw->mac[port];
> +
> +		if (m->mii_bus) {
> +			mdiobus_unregister(m->mii_bus);
> +			m->mii_bus = NULL;
> +		}
> +
> +		/* clear the enable bit even when no bus was registered (failed probe) */
> +		mac_iow(m, TSN_MDIO_MC_OFFSET, 0);
> +	}
> +}
> +

[ ... ]

> +	ret = xlnx_tsn_mdio_register_one(sw, XLNX_TSN_PORT_MAC1, "mdio-mac1",
> +					 host_hz);
> +	if (ret)
> +		goto err_unregister;
> +
> +	ret = xlnx_tsn_mdio_register_one(sw, XLNX_TSN_PORT_MAC2, "mdio-mac2",
> +					 host_hz);
> +	if (ret)
> +		goto err_unregister;

[Severity: Low]
Do the hardcoded "mdio-mac1" / "mdio-mac2" child names pass dtschema?  The
binding added earlier in the series documents both nodes with
'$ref: /schemas/net/mdio.yaml#', and that schema constrains the node name it
is applied to:

Documentation/devicetree/bindings/net/mdio.yaml:
  properties:
    $nodename:
      pattern: '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'

After "mdio" only -bus, -external, @<addr> or -<digits> are accepted, so
"mdio-mac1" and "mdio-mac2" do not match, and the binding's own example uses
those names.  The '-external' entry in that whitelist exists precisely
because mv88e6xxx needed a non-default name for a nested mdio node; every
other in-tree binding that $ref's mdio.yaml (qca8k.yaml, realtek.yaml,
renesas,rzn1-a5psw.yaml, renesas,etheravb.yaml and others) just names the
child "mdio".

The reverse also holds: a schema-conforming spelling such as mdio-1 / mdio-2
or mdio@<offset> makes the lookup in xlnx_tsn_mdio_register_one() fail and
the function return success with no bus registered:

	mdio_np = of_get_child_by_name(sw->dev->of_node, child_name);
	if (!mdio_np)
		return 0;

Was dt_binding_check run on the binding example with these names?

[ ... ]

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.h b/drivers/net/dsa/xilinx/xilinx_tsn.h
> index 1064cf1ce66e..025645a83992 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.h
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.h

[ ... ]

> @@ -45,19 +46,66 @@ enum tsn_port_state {

[ ... register offset definitions snipped ... ]

> +/**
> + * struct xlnx_tsn_mac - per-MAC switch-side state
> + * @sw: back-pointer to the parent switch (for dev_* logging in
> + *	bus callbacks)

[Severity: Low]
Is the "for dev_* logging in bus callbacks" part accurate?  The bus callbacks
added here, xlnx_tsn_mdio_wait_ready(), xlnx_tsn_mdio_read() and
xlnx_tsn_mdio_write(), only touch m->regs through mac_ior()/mac_iow() and
emit no log messages at all.  Every dev_err()/dev_warn() added by this patch
sits in xlnx_tsn_mdio_clk_div() and xlnx_tsn_mdio_register_one(), which are
handed a struct xlnx_tsn *sw explicitly.

The commit message makes the same claim:

    A new struct xlnx_tsn_mac groups the per-MAC register window and
    the back-pointer to the parent switch. MDIO callbacks and log
    helpers pull what they need from it.

In this commit m->sw is only written, in xlnx_tsn_probe():

	sw->mac[XLNX_TSN_PORT_MAC1].sw = sw;
	sw->mac[XLNX_TSN_PORT_MAC2].sw = sw;

With the rest of the series applied the only reader is
xlnx_tsn_ptp_rx_isr() in drivers/net/dsa/xilinx/xilinx_tsn_ptp.c, where it
serves as the IRQ-handler back-pointer rather than for logging, and the
wording here is unchanged at the end of the series.  Could this be reworded,
for example "back-pointer used by the per-MAC IRQ handlers"?

> + * @regs: per-MAC register window, from reg-name "macN"
> + * @mii_bus: MDIO bus registered under the "mdio-macN" DT child,
> + *	     or NULL if absent
> + */
> +struct xlnx_tsn_mac {
> +	struct xlnx_tsn *sw;
> +	void __iomem *regs;
> +	struct mii_bus *mii_bus;
> +};

[ ... ]

