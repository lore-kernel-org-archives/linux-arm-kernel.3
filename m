Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB6DD1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q0nQf1p3aEQdaIekpf69KA9b+oSlJsiJVdZh+xBY4k=; b=0Q10Mj8UvEpuHyFuiwswRtbj4c
	UP1xEaRu//ZmozNBXPNx9UaqjNzhOcheYb8P8eTAPypeURhS5Adjr50NDGo/Kj7gO7y8WLxmrPa+9
	Fe90kzwc9TiqmUnvX6mbDEpvKiQFlYkvK7+uUO5lUDtDQ7xUkNBXf2h1+M1FHPDOHbzSTtCZBq+rN
	IFI17wl2N0BJDAQdR1Ul1x6tVToVAfhBvCWU/Q6y6f6+ZCAIV9D/rEWa9w5mp2LzrucXWZUbxKDKW
	YFZ5AUxXkNHmm9R8UZnGtfGXjb2EZ/qnJ42xL20AZcWwNCvu3RfaTga3wQtA2gNi5uICs0nHw0+ox
	l0NjkEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81Gb-0000000Ebd1-1Jab;
	Mon, 04 Nov 2024 17:53:29 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tk-0000000ERzM-23Wv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A18160009;
	Mon,  4 Nov 2024 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Q0nQf1p3aEQdaIekpf69KA9b+oSlJsiJVdZh+xBY4k=;
	b=jY2BFzvLc1owNblIdY6rrlkicCZj0lfJRmf0oZZnrjAQuWDhfXHNumDYHtXAZtTxcK3sYH
	uuko9DYYI03drvyKUAWILR3Z93+fXKYxo6hsEwGFAD0/t5WpUUorPoEZujOrmuEDGhLbRE
	WCFww3F/ssEgoQUVW2aHHz6Co8Pvi1L0b9J8P+JNAz+DnIeFOWDbd37RL5U4WdjYZzcjZs
	yE2bpFG5Zy6j3r8sFaqccVjJqoKmtTCdDxhv3dule+U/jeMzWyHFAB5M9VqkL4JYjRMSWU
	wtv6DI4mdU0yOpPquKw1AHx2JrRee+SNJEWEYcwDhuqUIKoAV14cjb2YDS7fGQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/9] net: stmmac: Use per-hw ptp clock ops
Date: Mon,  4 Nov 2024 18:02:42 +0100
Message-ID: <20241104170251.2202270-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090300_866577_0E14161E 
X-CRM114-Status: GOOD (  12.29  )
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

The auxiliary snapshot configuration was found to differ depending on
the dwmac version. To prepare supporting this, allow specifying the
ptp_clock_info ops in the hwif array

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: No changes

 drivers/net/ethernet/stmicro/stmmac/common.h     |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.c       | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c |  4 +---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..4a0a1708c391 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -551,6 +551,8 @@ struct mac_device_info;
 extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
 
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 88cce28b2f98..9b6d817e8f1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -112,6 +112,7 @@ static const struct stmmac_hwif_entry {
 	const void *dma;
 	const void *mac;
 	const void *hwtimestamp;
+	const void *ptp;
 	const void *mode;
 	const void *tc;
 	const void *mmc;
@@ -133,6 +134,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac100_dma_ops,
 		.mac = &dwmac100_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
@@ -151,6 +153,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac1000_dma_ops,
 		.mac = &dwmac1000_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
@@ -170,6 +173,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac4_dma_ops,
 		.mac = &dwmac4_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwmac4_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -190,6 +194,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac4_dma_ops,
 		.mac = &dwmac410_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -210,6 +215,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac410_dma_ops,
 		.mac = &dwmac410_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -230,6 +236,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac410_dma_ops,
 		.mac = &dwmac510_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = &dwmac4_ring_mode_ops,
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
@@ -251,6 +258,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxgmac210_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
@@ -272,6 +280,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwxgmac210_dma_ops,
 		.mac = &dwxlgmac2_ops,
 		.hwtimestamp = &stmmac_ptp,
+		.ptp = &stmmac_ptp_clock_ops,
 		.mode = NULL,
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
@@ -355,6 +364,8 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		priv->hw = mac;
 		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
 		priv->mmcaddr = priv->ioaddr + entry->regs.mmc_off;
+		memcpy(&priv->ptp_clock_ops, entry->ptp,
+		       sizeof(struct ptp_clock_info));
 		if (entry->est)
 			priv->estaddr = priv->ioaddr + entry->regs.est_off;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 11ab1d6b916a..41581f516ea9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -265,7 +265,7 @@ static int stmmac_getcrosststamp(struct ptp_clock_info *ptp,
 }
 
 /* structure describing a PTP hardware clock */
-static struct ptp_clock_info stmmac_ptp_clock_ops = {
+const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.owner = THIS_MODULE,
 	.name = "stmmac ptp",
 	.max_adj = 62500000,
@@ -303,8 +303,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
 		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
 
-	priv->ptp_clock_ops = stmmac_ptp_clock_ops;
-
 	priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
 	priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
 
-- 
2.47.0


