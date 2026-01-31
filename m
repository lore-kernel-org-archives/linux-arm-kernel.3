Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EB7D46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evev4YsBH3tV4mXP3ljOgs60+egGQwWm4PtMNDvIr4E=; b=LUlKQmlwCO0uzeKJ22kEF7aKMw
	6wtgR135PyqC5Dns1DCOCCjDPWWGGTKRJv9NyTi76/jp0vXkKSiqjrWpKATQ3yjP8ntFr+MqHZT4l
	f9JxWJwbPOGuqv2wPnQlr0NBKQ0JWQ0MuEobe+WoEozfZJ1iaMHMUsH3sjB4qVF2We2uYCgWv5yn8
	9HwexjBhPGtaL6v0y3KFtDNgdgPcVK/6EjVDZgJ2G3+th4KXJw8JzGs9vFK5B52NSFGnlOQiWodnf
	lDvwYWpHmqt2upJ8GRum9J1FfsroNcVXew4GYRUD1T+sSYZjsgaEQF94lhb1kYPSfiiYcke48Oytj
	fKY7sI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0C8-00000002D1b-0ti5;
	Sat, 31 Jan 2026 01:54:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0C5-00000002D0q-0lJE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C191943A43;
	Sat, 31 Jan 2026 01:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE728C4CEF7;
	Sat, 31 Jan 2026 01:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824475;
	bh=7tL9q9XKleen5Up+Wt+oyqqMgj2ZPmG6LNTIPku7R04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfUWlX/W8vsQ9Rp4Mg0R0DastRitiVLxPKfoYmAnRuLm8TJRoCo7SE/th3F992qDw
	 irU13ZKqJ8fNgT6BTlZ8ZFL40IH64qCvTJZfUPkWY8K9s96tncqVChLF2nF9pG0QPp
	 j4+vZfeTSLAOGUCh9XW1vIDeU3d4pf+xpyTfwmlEH7ugdpMCOrHwAOWZW7rIflnY/+
	 n1Fw9g8rN6gHQDC8Bs5MG4MZv6yf+Kvg3ncwUtp9AJpRTXX+cYiBxNsUkLWquPzy0q
	 LQPu3LjL1MIvIb9UPmT2j7mikYQHAnb1ObHq0i5aZKs8zHMgr3wKiqxWl83EhVHiUr
	 oOM65obkeZ/+w==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	richardcochran@gmail.com,
	shawnguo@kernel.org,
	edumazet@google.com,
	linux-arm-kernel@lists.infradead.org,
	andrew+netdev@lunn.ch,
	pabeni@redhat.com,
	wahrenst@gmx.net,
	davem@davemloft.net,
	festevam@gmail.com,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	andrew@lunn.ch,
	robh@kernel.org
Subject: Re: [net-next,v21,2/7] net: mtip: The L2 switch driver for imx287
Date: Fri, 30 Jan 2026 17:54:33 -0800
Message-ID: <20260131015433.972337-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129110154.1699976-3-lukasz.majewski@mailbox.org>
References: <20260129110154.1699976-3-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_175437_261690_217E1472 
X-CRM114-Status: GOOD (  16.35  )
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

This patch introduces support for the MTIP L2 switch embedded in the
imx287 SoC. It provides the core driver infrastructure including DMA
initialization, PHY/MDIO handling, and net device operations.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> new file mode 100644
> index 000000000000..7b61ba9642e3
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static int mtip_mii_probe(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev = NULL;
> +	int port_idx = priv->portnum - 1;
> +
> +	if (fep->phy_np[port_idx]) {
> +		phy_dev = of_phy_connect(dev, fep->phy_np[port_idx],
> +					 &mtip_adjust_link, 0,
> +					 fep->phy_interface[port_idx]);
> +		if (!phy_dev) {
> +			netdev_err(dev, "Unable to connect to phy\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	phy_set_max_speed(phy_dev, 100);

If fep->phy_np[port_idx] is NULL (no phy-handle in device tree), the
if block is skipped entirely. In that case phy_dev remains NULL from
initialization, and phy_set_max_speed() is called with a NULL pointer.

phy_set_max_speed() dereferences phydev->supported via __set_phy_supported(),
which would cause a NULL pointer dereference crash when the interface
is opened.

Should phy_set_max_speed() and the subsequent accesses to
fep->phy_dev[port_idx] be moved inside the if block, or should the
function return an error when phy_np is NULL?

> +	fep->phy_dev[port_idx] = phy_dev;
> +	fep->link[port_idx] = 0;
> +	fep->full_duplex[port_idx] = 0;
> +
> +	dev_dbg(&dev->dev,
> +		"MTIP PHY driver [%s] (mii_bus:phy_addr=%s, irq=%d)\n",
> +		fep->phy_dev[port_idx]->drv->name,

This debug print also dereferences fep->phy_dev[port_idx]->drv->name,
which would crash if phy_dev is NULL.

> +		phydev_name(fep->phy_dev[port_idx]),
> +		fep->phy_dev[port_idx]->irq);
> +
> +	return 0;
> +}
-- 
pw-bot: cr

