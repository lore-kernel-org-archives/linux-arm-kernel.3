Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F9FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM+v370wtickq5V8CQzPOHaBm83ZWdcg4XkbnFyIoGI=; b=Q5qWL7unI1y8/r8oqmtKzRE73v
	uIAakaKg71MbRrnRa1O16oeYW1CONzXRm/Nnd5fayA20OH6avqLDfy3KWT5TGO2dcTivGJr90CAMe
	1KYm54AnLsYWRAYBNDzIRRheek88wzPAq6GC5AQjqK+b7buFOKof8uO3o95n/3+6hu4XAvPmpyOG8
	v99rM/ALJRELYUThtuCFxxxIoTULXd1QSKyUsJhKoBruVvJ6Q9JYYSc9OhEyl3fUIxvsa5sNHUZx0
	nzxoTf+F9ZEZazJxul9CWtLDLFGls0FHeGQzeUGyKlio69Cx5nqn+L3XiPMrGEYXn5UOS4Y1tBqXE
	LpfW9JOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf59j-00000008fEs-2TSM;
	Thu, 24 Jul 2025 23:15:19 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Vj-00000008baj-3fBC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:34:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD94510391E87;
	Fri, 25 Jul 2025 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753396437; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hM+v370wtickq5V8CQzPOHaBm83ZWdcg4XkbnFyIoGI=;
	b=VBQeiAWGFaEgDpAEadMAlG/AGpg4LOTVWxtyeX5ETxFrAkcyuF0J+0MQY/nL78s/ZXC2/d
	R7yYFhbM4hIN4hWjF0bgmeI6egxTChBipr/Z3iD4AF/3dpkHparIVz7nVBq6gV7Zey0oN/
	2aKLKvix+3ZIfKRXAMxKDj4r+k4FUi5GavcO8ZTrG+cb1Rv0y5pz/bk2CkHSga2hTer+k4
	p3e6i7Eh/kbQ0WsH3Rpzjztjbi626EUXzVAQa57DLrEv45rJzGXimaXpv2vKdxULrVhsrk
	04Hpfx7tb7s5I/abaM9pn870hdIiGinfl9Bepzsdp93OgOnMD6tAfy26i9Em6A==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v16 05/12] net: mtip: Add buffers management functions to the L2 switch driver
Date: Fri, 25 Jul 2025 00:33:11 +0200
Message-Id: <20250724223318.3068984-6-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724223318.3068984-1-lukma@denx.de>
References: <20250724223318.3068984-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_153400_063059_2B8A2AD3 
X-CRM114-Status: GOOD (  15.82  )
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

This patch provides buffers management funcions' content for MTIP
L2 switch.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
Changes for v14:
- New patch - created by excluding some code from large (i.e. v13
  and earlier) MTIP driver

Changes for v15 - v16:
- None
---
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
index 3a37d7308712..a4668047ed11 100644
--- a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
+++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
@@ -870,11 +870,96 @@ static void mtip_get_drvinfo(struct net_device *dev,
 
 static void mtip_free_buffers(struct net_device *dev)
 {
+	struct mtip_ndev_priv *priv = netdev_priv(dev);
+	struct switch_enet_private *fep = priv->fep;
+	int i;
+
+	for (i = 0; i < RX_RING_SIZE; i++) {
+		page_pool_put_full_page(fep->page_pool,
+					fep->page[i], false);
+		fep->page[i] = NULL;
+	}
+
+	page_pool_destroy(fep->page_pool);
+	fep->page_pool = NULL;
+
+	for (i = 0; i < TX_RING_SIZE; i++)
+		kfree(fep->tx_bounce[i]);
+}
+
+static int mtip_create_page_pool(struct switch_enet_private *fep, int size)
+{
+	struct page_pool_params pp_params = {
+		.order = 0,
+		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
+		.pool_size = size,
+		.nid = dev_to_node(&fep->pdev->dev),
+		.dev = &fep->pdev->dev,
+		.dma_dir = DMA_FROM_DEVICE,
+		.offset = 0,
+		.max_len = MTIP_SWITCH_RX_FRSIZE,
+	};
+	int ret = 0;
+
+	fep->page_pool = page_pool_create(&pp_params);
+	if (IS_ERR(fep->page_pool)) {
+		ret = PTR_ERR(fep->page_pool);
+		fep->page_pool = NULL;
+	}
+
+	return ret;
 }
 
 static int mtip_alloc_buffers(struct net_device *dev)
 {
+	struct mtip_ndev_priv *priv = netdev_priv(dev);
+	struct switch_enet_private *fep = priv->fep;
+	struct cbd_t *bdp;
+	struct page *page;
+	int i, ret;
+
+	ret = mtip_create_page_pool(fep, RX_RING_SIZE);
+	if (ret < 0) {
+		dev_err(&fep->pdev->dev, "Failed to create page pool\n");
+		return ret;
+	}
+
+	bdp = fep->rx_bd_base;
+	for (i = 0; i < RX_RING_SIZE; i++) {
+		page = page_pool_dev_alloc_pages(fep->page_pool);
+		if (!page) {
+			dev_err(&fep->pdev->dev,
+				"Failed to allocate page for rx buffer\n");
+			goto err;
+		}
+
+		bdp->cbd_bufaddr = page_pool_get_dma_addr(page);
+		fep->page[i] = page;
+
+		bdp->cbd_sc = BD_ENET_RX_EMPTY;
+		bdp++;
+	}
+
+	mtip_set_last_buf_to_wrap(bdp);
+
+	bdp = fep->tx_bd_base;
+	for (i = 0; i < TX_RING_SIZE; i++) {
+		fep->tx_bounce[i] = kmalloc(MTIP_SWITCH_TX_FRSIZE, GFP_KERNEL);
+		if (!fep->tx_bounce[i])
+			goto err;
+
+		bdp->cbd_sc = 0;
+		bdp->cbd_bufaddr = 0;
+		bdp++;
+	}
+
+	mtip_set_last_buf_to_wrap(bdp);
+
 	return 0;
+
+ err:
+	mtip_free_buffers(dev);
+	return -ENOMEM;
 }
 
 static int mtip_rx_napi(struct napi_struct *napi, int budget)
-- 
2.39.5


