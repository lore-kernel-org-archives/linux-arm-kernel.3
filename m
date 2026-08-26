Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTVcRgoXd0TFMDrwAr5pQLfwrpfb1OOBZimTG7wdi+M=; b=U/TfjIel0QaOGE1iD9U3QU5+aW
	YQCOblgC4sIqQnsFd4zavOQqlKf1hCtx36owpb2Bgd9Jtl62+hTnweHDTGKu7fsf8KRTOwC30dR9i
	tkLhDXTTuj7UifXdjmSf57Z9lvgvzHdx3SwIWaVTiBhEiH53RsfosLHprGE1bHFjIMDk0eGxS5fOC
	U8qVdH+3X33RxtVSWoRehn3KLJEH0pjDfuJVhuA4kte9K8XHDqr7+TGcGPqD94QQ65FdSqWQvoU5w
	HKrZHvKFv6f7yzTL2ad7CESxgl3it1C3HjQvOXj/T5JKm6Xd1AHRwPtOBeqSzY1wMH4QsRZys99lw
	AJJic0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEGv-00000002ZH8-1df1;
	Wed, 26 Aug 2026 14:06:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEGJ-00000002Z69-1rgA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:05:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDB354E413AA;
	Wed, 26 Aug 2026 14:05:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCE6604EC;
	Wed, 26 Aug 2026 14:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8E2A11C781D1;
	Wed, 26 Aug 2026 16:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787753152; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jTVcRgoXd0TFMDrwAr5pQLfwrpfb1OOBZimTG7wdi+M=;
	b=zp0sb5Nt85Pq6RP/Ym6FrPpaDzguuEsnYxVVPvL+ulOlg1aLgPa9KW3NPK6WK85aYJy2vy
	ablvBwqdiC3GztzLTVEPNMfMI/KtY+wNyLG1T601BN1NEew7FKVmd77r6SA9qBRAP4I93i
	HzVjaXSX+/dvAK7AQKQVFXD3ovoIdxkk9lBl5yRBoCN101V1FHWrsglr/u2aMMz6fKn1Cp
	XSuKpEumd2duW6r3AYZ2EEJgV0e5fy5+KzHnr4qxDbjlOWBX0I9pnamJDt7wy2ZPOWOSTQ
	GUMBm1wd05uWg54xX0dHWhUtnJ8+TKoUd9QVAo3LvhXvN1lLE4IEF9p4J/jn9g==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net 6/6] net: stmmac: selftests: Don't test flow control for small rx fifos
Date: Wed, 26 Aug 2026 16:04:58 +0200
Message-ID: <20260826140500.616466-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_070556_266547_4B80D25A 
X-CRM114-Status: GOOD (  11.54  )
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

On dwmac1000, dwmac4 and dwxgmac, we only emit pause frames if there's
at least 4096 bytes in each queue's fifo.

The phylink mac capabilities are still MAC_ASYM_PAUSE | MAC_SYM_PAUSE as
otherwise we won't be able to negotiate 'rx on' pause. ASYM only will
prevent negotiating 'rx off tx on', while SYM only doesn't really
matche the reality (not symmetric if we can only do RX pause).

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../ethernet/stmicro/stmmac/stmmac_selftests.c   | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index ae236a264e74..6372ec7c3f31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -739,12 +739,24 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
 	struct mac_device_info *mac = priv->hw;
 	struct stmmac_test_priv *tpriv;
+	unsigned int rx_fifo_size;
 	unsigned int pkt_count;
 	int i, ret = 0;
 
 	if (!(mac->link.caps & MAC_SYM_PAUSE))
 		return -EOPNOTSUPP;
 
+	rx_fifo_size = priv->plat->rx_fifo_size;
+	if (!rx_fifo_size)
+		rx_fifo_size = priv->dma_cap.rx_fifo_size;
+
+	/* No pause frame is emitted if we don't have at least 4096 bytes per
+	 * queue, except on dwmac100.
+	 */
+	if (priv->plat->core_type != DWMAC_CORE_MAC100 &&
+	    rx_fifo_size / priv->plat->rx_queues_to_use < 4096)
+		return -EOPNOTSUPP;
+
 	tpriv = kzalloc_obj(*tpriv);
 	if (!tpriv)
 		return -ENOMEM;
@@ -758,9 +770,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	dev_add_pack(&tpriv->pt);
 
 	/* Compute minimum number of packets to make FIFO full */
-	pkt_count = priv->plat->rx_fifo_size;
-	if (!pkt_count)
-		pkt_count = priv->dma_cap.rx_fifo_size;
+	pkt_count = rx_fifo_size;
 	pkt_count /= 1400;
 	pkt_count *= 2;
 
-- 
2.55.0


