Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E254CD35666
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/4UwNbI6ySSh/4psOwMQX+Rw2dMnfnNiffSZBYZMgY=; b=jvHMR6hHiWtbmmy/s8/uD/S4WK
	NO8xMDM0S71cmlpviQYGqN2ZhtfxTfiiwfuC3mkQ+6vymwkqsKCcuqjprcj8EFwXxigJ73oFGMe/T
	11Y5sn3BtgYzjV9X3FvIsQ6R31ZcUZPO2gDlHRw1gck5apgMdHQir26+Rs3moPhCD4LFihtUp5yh0
	l272mOIYeyg5Pu2y83HtUP4WTroae9Rn/KAO4mwbEKuJKE4P8YcgkHWWEk9k3g+T8TfiEID0je3KU
	b4WmZ2oIuuPM9jwhFU7lx4fLFoxA1N15uZMdYix3DqGBsuerYvwtd8QzG7Apcj5+z62kWRebasMFn
	ir8HOa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFs-0000000FJAd-10XR;
	Wed, 28 Jan 2026 02:26:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvFn-0000000FJ9S-0hiy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5087643C82;
	Wed, 28 Jan 2026 02:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321C6C116C6;
	Wed, 28 Jan 2026 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769567158;
	bh=1fMfmkSAk2FmGtHJNUwOGGC3405qV/fBN6ZwGBNp60A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bU+7UPiQao2Uv+KInv+Huemi8CQCdoEi3gTJNXH/8bNhnAEKTirqHbgS8pLRFIKMS
	 VXebTqtj8c5B25y1BO1y9l97mL7hpz/4gaZDvqTuBGbPP39JXwGbI4BztjdXFRk5Bs
	 bJgDELrDuzfn4mOhes927UBeueifCUxLw2KWOIQYbRLFE4fI//ctySSp6YYQ8N4n5n
	 MQqfbmI4m+o7/zJSgkoKmEbVqaUhek7W6BM3cG5/qMAezhtxCb3KQM9UVVGicqWiYI
	 OeBgO+BEqymmNv9lqZ7LMjEv6b1QoWRPf0+R4fhKEzTUlEuWeHW9C8OSzJNVn+7Spq
	 FFaKY7NfPLdlg==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	horms@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wahrenst@gmx.net,
	pabeni@redhat.com,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	andrew@lunn.ch
Subject: Re: [net-next,v20,3/7] net: mtip: Add buffers management functions to the L2 switch driver
Date: Tue, 27 Jan 2026 18:25:54 -0800
Message-ID: <20260128022554.4151421-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126103400.1683125-4-lukasz.majewski@mailbox.org>
References: <20260126103400.1683125-4-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_182559_246335_CC36C720 
X-CRM114-Status: GOOD (  16.86  )
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

This patch adds buffer management functions for the MTIP L2 switch
driver, implementing mtip_free_buffers(), mtip_create_page_pool(), and
mtip_alloc_buffers() for RX page pool and TX bounce buffer handling.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 03c5163d6508..9c21a3d29c1c 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -888,11 +888,96 @@ static void mtip_get_drvinfo(struct net_device *dev,
>
>  static void mtip_free_buffers(struct net_device *dev)
>  {
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	int i;
> +
> +	for (i = 0; i < RX_RING_SIZE; i++) {
> +		page_pool_put_full_page(fep->page_pool,
> +					fep->page[i], false);

Can fep->page[i] be NULL here?  When mtip_alloc_buffers() fails partway
through the RX allocation loop, it calls mtip_free_buffers() via the
error path.  At that point, only some fep->page[] entries have been
allocated - the rest remain NULL from the kzalloc initialization.

The call chain page_pool_put_full_page()->page_pool_put_netmem()->
page_pool_unref_and_test()->page_pool_unref_netmem()->
netmem_get_pp_ref_count_ref() will attempt to access &NULL->pp_ref_count
when passed a NULL page, causing a NULL pointer dereference.

Should there be a NULL check before calling page_pool_put_full_page()?

> +		fep->page[i] = NULL;
> +	}
> +
> +	page_pool_destroy(fep->page_pool);
> +	fep->page_pool = NULL;
> +
> +	for (i = 0; i < TX_RING_SIZE; i++)
> +		kfree(fep->tx_bounce[i]);
>  }

[ ... ]

> +static int mtip_alloc_buffers(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct cbd_t *bdp;
> +	struct page *page;
> +	int i, ret;
> +
> +	ret = mtip_create_page_pool(fep, RX_RING_SIZE);
> +	if (ret < 0) {
> +		dev_err(&fep->pdev->dev, "Failed to create page pool\n");
> +		return ret;
> +	}
> +
> +	bdp = fep->rx_bd_base;
> +	for (i = 0; i < RX_RING_SIZE; i++) {
> +		page = page_pool_dev_alloc_pages(fep->page_pool);
> +		if (!page) {
> +			dev_err(&fep->pdev->dev,
> +				"Failed to allocate page for rx buffer\n");
> +			goto err;
> +		}

[ ... ]

> + err:
> +	mtip_free_buffers(dev);

When this error path is taken, fep->page[] may contain NULL entries for
pages that were never allocated.

> +	return -ENOMEM;
>  }

