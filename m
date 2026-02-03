Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C70E73165
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 01:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWs3Pa+JF9iOgbHRY4yvpUtzTTCYGVJIFmGlZPxDsQI=; b=LG8v1Rj+W10KxS4bz6ySldYA0u
	1Bku4u8uD6iAa3PRYxlTSG+x9ZGEpkmcZAz7QfVkJTrWnyjxOFojwuTvSYpBBN5nasGJkckfUXTBS
	hlseoc30ACso882Z6VVTwCSujVjWvixx26G7GBlRZkSvD4OuLyvnFqVrWwCsjZlRxmU7QPB/zdnPe
	X94I24tDU/nHW0vLMEDd12v57C0NWcStc2nqS5Nux0L4VbZFdW0nwBbhIhf40jMmdifA+lcPYdpKY
	XfUdZEmgKgsqE8G0DDlAK+pSGoDjlCO/JjGeBgYG/iZVfpOGcQzv/PAr5EjKxATyqkiytoTMi/B36
	l+B/Yb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5Sa-00000005rcT-0ywG;
	Tue, 03 Feb 2026 01:44:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5SZ-00000005rcL-1zpR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 01:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86873600B0;
	Tue,  3 Feb 2026 01:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B55EC116C6;
	Tue,  3 Feb 2026 01:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770083046;
	bh=Qjhb1uOmk8zQdQk9UtlBXnrX95dGDnTVIYt+n3+66Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eksgF6KeSDnB22KMtBo4iJ1Lw6l5LB0Idkr5dSU5b4hvPfdIKuaJM59ukY1kKP0iY
	 tbZ0t6e+vv0TpkmZjnQErC5DJil6gKCSVdLJheYCRy8eX8JdQxYkwlIok9TBoz4RMc
	 qPzAk69z8z4HMVrVlazeKNepwvKCB9T54+IeUnA2uX8nwZJCpG9lKosv+Kg/Ly+eB1
	 +lrjojCZ1j3P6QWeKWumZk3muazz2C4xRQsF57BiL4uNX99XXD5+X1yPYaMpuoNJIi
	 hUxcZDpZQINEQ1McfRcwYPmxnUBu0Su2WzWixKw9dI5lUuRRGfzNvNeBaLJShsKOyn
	 MV83gK3DiXOJg==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	shawnguo@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	edumazet@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	conor+dt@kernel.org,
	horms@kernel.org,
	richardcochran@gmail.com,
	robh@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	wahrenst@gmx.net,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [net-next,v22,4/7] net: mtip: Add net_device_ops functions to the L2 switch driver
Date: Mon,  2 Feb 2026 17:42:48 -0800
Message-ID: <20260203014247.824561-2-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131233459.1625279-5-lukasz.majewski@mailbox.org>
References: <20260131233459.1625279-5-lukasz.majewski@mailbox.org>
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
net: mtip: Add net_device_ops functions to the L2 switch driver

This patch adds net_device_ops callbacks for the MTIP L2 switch driver,
including transmit, multicast configuration, MAC address handling, and
timeout recovery functions.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c

[ ... ]

> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	unsigned int index;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock_bh(&fep->hw_lock);

[ ... ]

> +	/* Save skb pointer. */
> +	fep->tx_skbuff[index] = skb;

mtip_start_xmit_port() stores sk_buffs in fep->tx_skbuff[index] and creates
DMA mappings, but mtip_switch_tx() which should complete TX operations is
empty:

static void mtip_switch_tx(struct switch_enet_private *fep)
{
}

The NAPI poll handler mtip_rx_napi() calls mtip_switch_tx() to reclaim
transmitted buffers. Since it does nothing, won't every transmitted packet
leak the skb and DMA mapping? Also, dirty_tx is never advanced, so the TX
ring will fill (cur_tx == dirty_tx) and stop accepting packets.

jakub: maybe add a TODO comment transiently here, since later patch implements
       the cleanup?

> +static void mtip_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +
> +	dev->stats.tx_errors++;

Jakub Kicinski noted in v16 review that tx_errors are already counted by
the network stack, and the statistic is exposed per-queue in sysfs. Does
incrementing tx_errors here double-count timeout events?

https://lore.kernel.org/all/20250725151618.0bc84bdb@kernel.org/

> +	DO_ONCE(mtip_print_hw_state, dev);
> +
> +	schedule_work(&priv->tx_timeout_work);
> +}

