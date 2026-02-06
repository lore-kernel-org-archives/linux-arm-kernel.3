Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A10ECD9BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+be054obZKj56/mjIgwlYgwKhGQYj76T4kJ+P+or5Q=; b=lf/v/zqI89ATzq4djuVTq4fQkE
	59SFlCrRWgJiIne9btyQD3dtmpjQW8BrAgEtlSzww6Do+peiPTvh6Q2VvElfJWhtdlKxryta66/1l
	XdWp6oMGsboZPyihfBn2utrtwXEjBC0aWGagDEM7sfHjaDXnrXoMV+JX2Ubb3tLjSTIBa+l1ezAmB
	gqy/NDWBMIlEGUZ55XOUsB6vA9hpPICD5fvhua9MIQup/cedKXh/C9KwV3Yg17MIDOMgme7rGhcmT
	EqzYM59jDHABRayuu1XX6EJb5RV9ZB+LCJ7ACIOmXx3rrmen+7ajiXqiHxyWkCivWqVHbbMy6tM+e
	r2xu6u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYy-0000000Al8s-3R5b;
	Fri, 06 Feb 2026 02:27:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBYw-0000000Al8L-02T8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F9EB60010;
	Fri,  6 Feb 2026 02:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9857C4CEF7;
	Fri,  6 Feb 2026 02:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770344802;
	bh=BGxa4AkQjOf9KjNL+3M9JW6M3qf5DIia81SBTdQjZEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sfpNsewMoN7NeiErvzWr4YM0gimRQzHAzsFtl0FtyddxtbpHaim1GNN+9lzxfabgW
	 GyfINDqZa20XmUVpjvxy+B2XGeXYvWa4xJwyRh0WcINTGu6De1eHKpd6ZjA/mYYpWL
	 w2/cVjD9V9/WJ9MFQbofhTr+k+U+CrU9y8GAhAuENocSvKY8qIR0SdD/7sUbMAZhxl
	 xRfpM9OYyf/8vmxBvGm6c8eKQ4RTRl2xLn3JYct2jlOJ53ZAc/nTzW5UBdwoEt3s1Q
	 dhsQd8qtVu9VwwBU7l7nW5dLXLOItnJx5RsTiR6Yq/I59aoJKJYuPCOKPDfVEY3ipN
	 k1KLv2n5GtU1w==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	imx@lists.linux.dev,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org,
	davem@davemloft.net,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	festevam@gmail.com,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	pabeni@redhat.com,
	shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wahrenst@gmx.net,
	richardcochran@gmail.com,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	edumazet@google.com,
	robh@kernel.org
Subject: Re: [net-next,v23,2/7] net: mtip: The L2 switch driver for imx287
Date: Thu,  5 Feb 2026 18:26:40 -0800
Message-ID: <20260206022640.3197138-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204232135.1024665-3-lukasz.majewski@mailbox.org>
References: <20260204232135.1024665-3-lukasz.majewski@mailbox.org>
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: The L2 switch driver for imx287

This patch provides support for More Than IP L2 switch embedded in the
imx287 SoC, a two port switch placed between uDMA[01] and MAC-NET[01]
for offloading network traffic.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/Kconfig b/drivers/net/ethernet/freescale/mtipsw/Kconfig
> new file mode 100644
> index 000000000000..7767bd7c707b
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config FEC_MTIP_L2SW
> +	tristate "MoreThanIP L2 switch support to FEC driver"

This isn't a bug, but the vendor name formatting is inconsistent between
the description line ("MoreThanIP") and the help text below ("MoreThan
IP"). The vendor should be consistently named throughout the file.

> +	depends on OF
> +	depends on NET_SWITCHDEV
> +	depends on BRIDGE
> +	depends on SOC_IMX28 || COMPILE_TEST
> +	help
> +	  This enables support for the MoreThan IP L2 switch on i.MX
> +	  SoCs (e.g. iMX287). It offloads bridging to this IP block's

The SoC name "iMX287" should be "i.MX287" to match NXP's standard naming
convention used throughout the kernel for i.MX SoCs.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> new file mode 100644
> index 000000000000..0a193a12e160
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static void mtip_mgnt_timer(struct timer_list *t)
> +{
> +	struct switch_enet_private *fep = timer_container_of(fep, t,
> +							     timer_mgnt);

Does this code cause undefined behavior? The timer_container_of macro
expands to container_of(t, typeof(*fep), timer_mgnt), which dereferences
the uninitialized 'fep' variable in the typeof() expression. This is the
first statement in the function where 'fep' is being declared and assigned
simultaneously.

Looking at how other timer callbacks use this macro, shouldn't this be:

	struct switch_enet_private *fep = container_of(t,
		struct switch_enet_private, timer_mgnt);

This will cause a crash when the timer fires at the mod_timer() call site
in mtip_config_switch().

[ ... ]

> +static void mtip_switch_tx(struct switch_enet_private *fep)
> +{
> +}
> +
> +static int mtip_switch_rx(struct net_device *dev, int budget)
> +{
> +	return -ENOMEM;
> +}

Can the driver actually send or receive packets with these implementations?

Looking at the call chain:
  mtip_interrupt() schedules NAPI on RX interrupt ->
  mtip_rx_napi() calls mtip_switch_rx() ->
  mtip_switch_rx() always returns -ENOMEM

This means all receive interrupts are treated as out-of-memory conditions
and no packets are ever delivered to the network stack. Similarly,
mtip_switch_tx() is an empty stub that does nothing.

The commit message states "It can be used interchangeably with current
FEC driver" which suggests a functional driver, but the network interface
cannot actually send or receive packets. Should the commit message clarify
this is an incomplete implementation, or are these functions missing their
implementation?

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
> +
> +		if (!(port_num == 1 || port_num == 2)) {
> +			dev_err(&fep->pdev->dev,
> +				"%s: The switch supports up to %d ports!\n",
> +				__func__, SWITCH_EPORT_NUMBER);
> +			goto of_get_err;
> +		}
> +
> +		fep->n_ports = port_num;
> +		ret = of_get_mac_address(port, &fep->mac[port_num - 1][0]);
> +		if (ret)
> +			dev_dbg(&fep->pdev->dev,
> +				"of_get_mac_address(%pOF) failed (%d)!\n",
> +				port, ret);
> +
> +		ret = of_property_read_string(port, "label",
> +					      &fep->ndev_name[port_num - 1]);
> +		if (ret < 0) {
> +			dev_err(&fep->pdev->dev,
> +				"%s: Cannot get ethernet port name (%d)!\n",
> +				__func__, ret);
> +			goto of_get_err;
> +		}
> +
> +		ret = of_get_phy_mode(port, &fep->phy_interface[port_num - 1]);
> +		if (ret < 0) {
> +			dev_err(&fep->pdev->dev,
> +				"%s: Cannot get PHY mode (%d)!\n", __func__,
> +				ret);
> +			goto of_get_err;
> +		}
> +
> +		fep->phy_np[port_num - 1] = of_parse_phandle(port,
> +							     "phy-handle", 0);

Can this code leak OF node references?

If the first port (port_num=1) successfully obtains its PHY handle via
of_parse_phandle() and stores the reference in phy_np[0], but a
subsequent port fails during of_property_read_string() for the 'label'
property or of_get_phy_mode(), the error path jumps to of_get_err which
only releases the parent node 'p'. The PHY handle reference obtained for
the first port is never released.

The error path returns to mtip_sw_probe() which returns error without
calling mtip_parse_of_cleanup(), leaking the phy_np[0] reference. Note
that line 1191 correctly calls mtip_parse_of_cleanup(fep) before goto,
showing the cleanup is needed for these earlier error paths too.

> +		if (!fep->phy_np[port_num - 1]) {
> +			mtip_parse_of_cleanup(fep);
> +			dev_err(&fep->pdev->dev,
> +				"%s: PHY handle not defined!\n", __func__);
> +			ret = -ENODEV;
> +			goto of_get_err;
> +		}
> +	}
> +
> + of_get_err:
> +	of_node_put(p);
-- 
pw-bot: cr

