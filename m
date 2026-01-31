Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C1BE6BF33
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vd2mm4s0IP61jdZGKspsuhJixS/5f7gEQZBLocrqqDs=; b=PMMBS50aOeaM8RmZrRmNP532sc
	hM21bWyHSj0z0Ksn5PD5Jmc/RQF9O/PVsBf5TVRtMLvpFiQ5BTYWd038jP253h3BCP0kqyozl+e/4
	TovUbKGvhK/o8I2yrpMBv87bVQyfR1pE/V4AXawIY638c62pkK7gaUe8C8pkMW2jhXkTYFX9bS/Wm
	zNyoHwRE0ONBuXYDTOsk1PR0Oi9Tobpjtq6K74Wg/0xlgBY0Jof8ov+6O6crl6Cttad4RwFTDayjm
	S0pXgZWeijp0sfiqPGdcp+BUuLjEiNH5zxcpzLdI/LAvHsrm6HQC6NPbrpNzw7lq99jWKAr1KTqay
	C5kZNhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0CE-00000002D3R-24p9;
	Sat, 31 Jan 2026 01:54:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0C6-00000002D19-0fXm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBBAB440F3;
	Sat, 31 Jan 2026 01:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EB1C19421;
	Sat, 31 Jan 2026 01:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824477;
	bh=PZiP7hTRN8O92xfwMW2wC0dfQY9Tq13ZCF+jHPKg+BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SiGWsRAFbu9Eos8oeV9+LiUDHXRkt15ysjnmqZfOyJI2q7QXFWBnrHjMV0FaJr96C
	 5HbsjyxurBTd+6dJ6pvlVO6dpkjOd52tXTLefRkPsLfrqeolWPNPidlKFznDVusIZ9
	 ofJIwNWN2AsXUcoQkeaqfJuHuHkqKMDBJ64jpRSpgDSf4Fnto1rDN9mpN//MOUaBbn
	 tdjMl7Jlsh5mNuWSicBaCRrougl5neZiYh7SYdjGdeFDdb5uw+kR8GH0BkoiTuvNKM
	 oGE2WKRMs2MkcFioQZ8kK0xJpsqYddfxflKQPcjvxQSREc7uDDFNppX6S2yrk6MAkf
	 9l/JJ1h9r0deQ==
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
Subject: Re: [net-next,v21,3/7] net: mtip: Add buffers management functions to the L2 switch driver
Date: Fri, 30 Jan 2026 17:54:35 -0800
Message-ID: <20260131015435.972356-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129110154.1699976-4-lukasz.majewski@mailbox.org>
References: <20260129110154.1699976-4-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_175438_215224_01565A6B 
X-CRM114-Status: GOOD (  12.31  )
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
net: mtip: Add buffers management functions to the L2 switch driver

This patch adds buffer allocation and deallocation functions for the
MTIP L2 switch driver, including page pool management for RX buffers
and bounce buffer allocation for TX.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -888,11 +888,99 @@ static void mtip_get_drvinfo(struct net_device *dev,
>
> static void mtip_free_buffers(struct net_device *dev)
> {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	int i;
> +
> +	for (i = 0; i < RX_RING_SIZE; i++) {
> +		if (!fep->page[i])
> +			continue;
> +
> +		page_pool_put_full_page(fep->page_pool,
> +					fep->page[i], false);
> +		fep->page[i] = NULL;
> +	}
> +
> +	page_pool_destroy(fep->page_pool);
> +	fep->page_pool = NULL;
> +
> +	for (i = 0; i < TX_RING_SIZE; i++)
> +		kfree(fep->tx_bounce[i]);

Should fep->tx_bounce[i] be set to NULL after kfree() here? The RX path
above correctly sets fep->page[i] = NULL after releasing the page, but
the TX path does not NULL out the bounce buffer pointers.

If mtip_alloc_buffers() is called again after a partial allocation
failure (e.g., mtip_open() fails and user retries), the stale pointers
in tx_bounce[] from the previous failed allocation could lead to a
double-free when mtip_free_buffers() is called on the retry failure
path.

Consider the sequence: first mtip_open() allocates tx_bounce[0..5] then
fails at index 6. mtip_free_buffers() frees tx_bounce[0..5] but leaves
stale pointers. Second mtip_open() allocates tx_bounce[0..2] then fails
at index 3. mtip_free_buffers() will kfree() the stale pointers at
tx_bounce[3..5].

[ ... ]

