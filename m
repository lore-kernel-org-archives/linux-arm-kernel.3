Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73925606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fcpHRZq;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JtEYmq/F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bwf4WuvizE5NsoXFdTXjETdYXegFLEL7OxtAZ9dSDUQ=; b=4fcpHRZqJNg/yp
	MUtrojdy3TgqnPTH1NPiou5UKVC6sw1DWbzNRfBI6MKVyabNxdYDrbdLCiGkQZLRP8JOnVQRourVy
	y9hgcqqNyRLZL73LsYCxExLkgGU5b1YLpaw55AGmdWzQQfL4Hcfs6zj7EG7/obrljdyoequBDvAaY
	ky6zrjIjfkC2YsqS34N4kMbF3/weztv0hSHJ06Nrp3JM6NKq/qkIm1y17N2p0IXmXZaw+LIy8kaPu
	zgrxSOenYZ7mHovgn8d2A0DBYg8gQkJ4SURmaiudIFTbgxMsgD+xW80WY3QhtY2s36VJZh/VKmIB2
	8JTZJNpy17VK6onv0sbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxK-0000000HXFc-1mT5;
	Sat, 24 Oct 2026 07:14:18 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxD-0000000HXC2-2NGA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bw
	f4WuvizE5NsoXFdTXjETdYXegFLEL7OxtAZ9dSDUQ=; b=JtEYmq/FkqR93/oeFm
	90LoplFrYwebjoUWMJzB9ZmYDocDPplo3FBqlySLPiiDtvESuVFPAKAQOsbiXFaS
	P7tM99kXQghzPaK91qd4UQTyDIT7VxwWivzLaNQ6GxaWaDIM8jgfApKIMZq3DF93
	8VgUl8RA4CZnMLkwC2FlRjvag=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD310ySWtxq_y0rCg--.41124S5;
	Sat, 24 Oct 2026 15:13:42 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net-next v6 3/4] net: stmmac: release descriptor resources through priv->dma_conf on open failure
Date: Sat, 24 Oct 2026 15:13:17 +0800
Message-Id: <20261024071319.875921-4-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024071319.875921-1-dinghui1111@163.com>
References: <20261024071319.875921-1-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD310ySWtxq_y0rCg--.41124S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry7Cr45ur1kZw1kZryUAwb_yoW5uFykpr
	Wxua98JryDArn3Jws8Ar4UXFyFyaySyF45Gw1xJ3yfAay5WrZIqrWYqryjvF1UCFWFvw1S
	qrWYyryUC3WDXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bjQ6XUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8waRvWrcWqZjZwAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001412_002665_E8E11D7D 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

__stmmac_open() copies the temporary dma_conf passed by its callers
into the long-lived priv->dma_conf before setting up the hardware.
When the open fails after this copy, the descriptor resources now
belong to priv->dma_conf, but the error path returns without
releasing them and leaves stale pointers behind. The callers then
free the already-copied resources through the temporary dma_conf,
which aliases priv->dma_conf after the memcpy.

Fix this by making __stmmac_open() release the descriptor resources
through priv->dma_conf on failure. Callers of __stmmac_open() only
need to free the temporary dma_conf container in that case, while
failures before the call (PHY setup, serdes power up) still release
the resources through the temporary dma_conf via the existing
err_dma_resources path in stmmac_open().

stmmac_open() no longer jumps to the serdes label chain after
__stmmac_open() fails, as that chain would double-release the
descriptor resources and double-put the runtime PM reference, so the
cleanup is done inline instead.

The resource release is merged with the error unwinding that stops
the DMA engines and the MAC: failures after the hardware setup
first stop the DMA engines and the MAC, and then fall through to
the common init_error label that releases the descriptor resources,
while a stmmac_hw_setup() failure jumps to init_error directly as
the engines were never started.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a8401b04d79f..b093119e752f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4246,7 +4246,7 @@ static int __stmmac_open(struct net_device *dev,
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		return ret;
+		goto init_error;
 	}
 
 	ret = stmmac_setup_ptp(priv);
@@ -4282,6 +4282,8 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_stop_all_dma(priv);
 	stmmac_mac_set(priv, priv->ioaddr, false);
 
+init_error:
+	free_dma_desc_resources(priv, &priv->dma_conf);
 	return ret;
 }
 
@@ -4314,8 +4316,13 @@ static int stmmac_open(struct net_device *dev)
 	}
 
 	ret = __stmmac_open(dev, dma_conf);
-	if (ret)
-		goto err_serdes;
+	if (ret) {
+		stmmac_legacy_serdes_power_down(priv);
+		phylink_disconnect_phy(priv->phylink);
+		pm_runtime_put(priv->device);
+		kfree(dma_conf);
+		return ret;
+	}
 
 	kfree(dma_conf);
 
@@ -4324,8 +4331,6 @@ static int stmmac_open(struct net_device *dev)
 
 	return ret;
 
-err_serdes:
-	stmmac_legacy_serdes_power_down(priv);
 err_disconnect_phy:
 	phylink_disconnect_phy(priv->phylink);
 err_runtime_pm:
@@ -6343,7 +6348,6 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
-			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
-- 
2.34.1


