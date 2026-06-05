Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77BFCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 02:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/YFoK1DlLyiD3rD9Jae9zwSGdB8zFmwUT4o+JkNbQI=; b=G96/zoZfj3qOr1mu2a5i6N6ail
	wAzok6l9MWSu1cK8iHQeJTnO5h03QlWs5gtbxOUbmc83cIOma+7ne4WW/1h8oGjTr8Nn9GDV0zv7A
	kQil3vX456RuC2M3UgGLigEzZyxJn0HGds6Tn3NFfa0Rw0PJp/xVFgzm15/3l5/eyRolb4sTfya68
	iX4RvgZcB/bl1avd4I10oA7ykQXWAQsN0EyJhcOMkErQJVF2dTZMTSRfFCRCKpjG94zdX7EBeaxNE
	scn//F19oNC7xYnhyTStbhQiOX1MSDZYXc75MPavX858E6upk1j3OyxdP+KHXV8gzTX4ZA75xNZUk
	1WKQv1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9C-0000000HZBv-1azm;
	Fri, 05 Jun 2026 02:18:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVK9A-0000000HZBG-3plv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 02:18:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02E23600AA;
	Fri,  5 Jun 2026 02:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA281F00898;
	Fri,  5 Jun 2026 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625935;
	bh=Z/YFoK1DlLyiD3rD9Jae9zwSGdB8zFmwUT4o+JkNbQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O++CaLF8v8wrssJuowzuKTiK6q8AhGFjieZh0Sx7fWLDdO9jbhs33tdFsXwH2fOP/
	 Qgt0hQUOSpCO0XDgBEFu8XgcCweOoOl6khQoBWJF0iIwf3pgXC8GojWK91wnrWKr1g
	 v7I2X9G4lGqCaUNHocPPgP9ViDeDF7iYqhNymnHMcR58lopXWw0GyHsSJzsHP0ejx8
	 ajkkk4nyNlt43GFBbKXfO3ystJy80PDX+WvT4mOLLEO/EwDFI3waTsF6i2i49KXCUR
	 yV5XsPl4vZeZi/T5jY5H+413t6Z1mSLIXOh4cYtb3KQm/EqwCiKcxtM0riH5EPvWgr
	 5IfFIJ6DE4pHQ==
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
Subject: Re: [net-next v24 3/7] net: mtip: Add buffers management functions to the L2 switch driver
Date: Thu,  4 Jun 2026 19:18:53 -0700
Message-ID: <20260605021853.3594553-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601112437.2216043-4-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-4-lukasz.majewski@mailbox.org>
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
net: mtip: Add buffers management functions to the L2 switch driver

This patch fills in mtip_alloc_buffers() and mtip_free_buffers() for the
MTIP L2 switch driver, replacing the previously empty stubs with real
page_pool setup/teardown and tx_bounce buffer allocation/free.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> index 1d1005a42306..5b5229ee411d 100644
> --- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
> @@ -892,11 +892,101 @@ static void mtip_get_drvinfo(struct net_device *dev,
>  
>  static void mtip_free_buffers(struct net_device *dev)
>  {
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
> +	for (i = 0; i < TX_RING_SIZE; i++) {
> +		kfree(fep->tx_bounce[i]);
> +		fep->tx_bounce[i] = NULL;
> +	}
> +}

[High]
Now that mtip_free_buffers() is no longer an empty stub, can the
mtip_open() error path tear down buffers that another active port is
still using?

Looking at mtip_open():

	if (fep->usage_count == 0) {
		...
		ret = mtip_alloc_buffers(dev);
		if (ret)
			goto mtip_alloc_buffers_err;
	}
	...
	ret = mtip_mii_probe(dev);
	if (ret)
		goto mtip_mii_probe_err;
	...
 mtip_mii_probe_err:
	mtip_free_buffers(dev);
 mtip_alloc_buffers_err:
	if (fep->usage_count == 0) {
		netif_napi_del(&fep->napi);
		clk_disable(fep->clk_ipg);
	}
	return ret;

mtip_alloc_buffers() only runs when fep->usage_count == 0, so the
page_pool, fep->page[] and fep->tx_bounce[] are shared across switch
ports and only allocated on first open. mtip_close() reflects this and
only calls mtip_free_buffers() when fep->usage_count == 1.

When a second port is opened (fep->usage_count > 0) and mtip_mii_probe()
fails, the mtip_mii_probe_err label still calls mtip_free_buffers()
unconditionally, which destroys the page_pool and frees the tx_bounce
buffers that the first, still-active port is using.

Should the mtip_mii_probe_err teardown also be guarded by
fep->usage_count == 0 (or the labels reordered) so buffers are only
freed for the last user, similar to mtip_close()?

After this change the previously harmless call becomes a real teardown,
so the surviving port's NAPI path (mtip_switch_rx() and the later
mtip_update_cbd() refill) would dereference a freed fep->page_pool and
NULL fep->page[] / fep->tx_bounce[] entries whenever the second port's
PHY probe fails while the first port is up.

>  
> +static int mtip_create_page_pool(struct switch_enet_private *fep, int size)
> +{
[ ... ]
> +}
>  
>  static int mtip_alloc_buffers(struct net_device *dev)
>  {
[ ... ]
>  	return 0;
> +
> + err:
> +	mtip_free_buffers(dev);
> +	return -ENOMEM;
>  }
>

