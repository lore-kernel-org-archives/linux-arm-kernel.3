Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8762FCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWRX1guDUtiYzEj6sqbgOMmKkrZT3ka3uUjnBjPdBQ4=; b=kP0mIeBOXyDK9AXtoSQGE2kIuA
	dAWlLvw/1Y2NN9g479XY6FVYLWzg+cpda0LYQVClsY/n9mv7/QHAOb+iBEx6faLhuDa1SHa5CFIhv
	GS+fbjJgGQxE6JzjR2tXm0GS/5cjjelMcQbo37VZ6DZu5zW7Qprfro5N1K6JZOQflMErhpIAmOQxf
	NxfIMtAM73rdKLbZRyeJI8icTVQplXtN0jzg0nN1UaJ5/yI9JPolHf4XFyJv+GHQ7Ic3xFSMUXIrS
	ZE/4NuJC2+ZKZ6KMt6f/rMdUC45Gwt3WlwulsxYISIvZMsIB3bzYYrLdpkKFqirX1IHqlvfBQZa2+
	KxAetkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFX-0000000Bm3i-1Mdt;
	Fri, 02 Oct 2026 14:28:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFQ-0000000Bm2A-47sW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:28:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76E9C4E41105;
	Fri,  2 Oct 2026 14:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B729603DC;
	Fri,  2 Oct 2026 14:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37EE9103281F4;
	Fri,  2 Oct 2026 16:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790951305; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uWRX1guDUtiYzEj6sqbgOMmKkrZT3ka3uUjnBjPdBQ4=;
	b=Lj+ADOhN2GKYALhPLe4C5duvntTxMETY7dyfubWGrZVISLVxeD8xqYUrSFYrdg5wXw8eTl
	j8CiC3eO4ZfwvvYyO2K5wKwQv6LLieW4wvhVbPPnj5GE2jWiG9m+u8V4mU5mTpww76HF0C
	skjY8UPdu6X0PcJW6KwJgC8bq1fpllgKJJ9ZXhvbKKEP7P1mwGz7ufC2TRJ2rPCvojwzEk
	Q/5fHLqaxysNhpfy8L1cjFPKZLCQ+jOUuJh1KZ4GRGMvMSXBb+SKs3e4vLQjNk+M0h1ni0
	4v6YFhuEj6omnQVXw/VAnlcPi7llYIF/4JJ9l0l1KlaRES/hT9Jbg/ZmCVs8Eg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v3 2/3] net: stmmac: Introduce a helper to check RSS support
Date: Fri,  2 Oct 2026 16:28:02 +0200
Message-ID: <20261002142806.1299041-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_072829_188149_9E2711DB 
X-CRM114-Status: GOOD (  13.48  )
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

The RSS feature is only available in stmmac if the hardware reports it
through the DMA caps and if the platform glue sets rss_en.

Introduce a helper that checks both.

For now, no platform sets rss_en, but there's interest in the topic so
leave the door open instead of dropping the feature altogether.

No functional changes intended.

Suggested-by: Nicolai Buchwitz <nb@tipi-net.de>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..17991572fd2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -440,6 +440,11 @@ struct timespec64 stmmac_calc_tas_basetime(ktime_t old_base_time,
 					   ktime_t current_time,
 					   u64 cycle_time);
 
+static inline bool stmmac_rss_is_supported(const struct stmmac_priv *priv)
+{
+	return priv->dma_cap.rssen && priv->plat->rss_en;
+}
+
 #if IS_ENABLED(CONFIG_STMMAC_SELFTESTS)
 void stmmac_selftest_run(struct net_device *dev,
 			 struct ethtool_test *etest, u64 *buf);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0c381ae0d0ff..76f9f5d35253 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3571,7 +3571,7 @@ static void stmmac_mac_config_rx_queues_routing(struct stmmac_priv *priv)
 
 static void stmmac_mac_config_rss(struct stmmac_priv *priv)
 {
-	if (!priv->dma_cap.rssen || !priv->plat->rss_en) {
+	if (!stmmac_rss_is_supported(priv)) {
 		priv->rss.enable = false;
 		return;
 	}
@@ -8100,7 +8100,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	for (i = 0; i < ARRAY_SIZE(priv->rss.table); i++)
 		priv->rss.table[i] = ethtool_rxfh_indir_default(i, rxq);
 
-	if (priv->dma_cap.rssen && priv->plat->rss_en)
+	if (stmmac_rss_is_supported(priv))
 		ndev->features |= NETIF_F_RXHASH;
 
 	ndev->vlan_features |= ndev->features;
-- 
2.55.0


