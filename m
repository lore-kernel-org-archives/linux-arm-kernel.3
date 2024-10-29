Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB55CD2AB35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGCWRSOQMmjS9ZFY7AhKJ0VNqkvKkp9FxTzYgROnlPc=; b=eyUd158/UnaOwdhKA2SUF6Tapu
	nQ3rYrrIeCgFjt0EHCWOC0uJB0A2R6766hWPUnJiLpqIcTraNwiqCFyL4Vg+KQL101tEp5VTSrDdl
	5YokNWNTalBIo6YArMjKIx/0MhroKhXxp7bA/xPvgX5ydPQtIW47jPGF+r6vwlNmxQE9MZmxGMh/5
	eswl18I45wspO+tFcPrDNNl33uiBJBIt8Z/4+HMuasnybovkyHvjn68rlcZGmn3YgkRzEXs8etVkL
	1BpswvtJdrSmB5zurhsmI9AiqciKtcY0VftMVzLfjUv//yuVNuQc2t3C41LF0NGkdSwDG2u2SrYzM
	xcs/XFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lMG-0000000EPNk-04bf;
	Tue, 29 Oct 2024 12:30:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5knu-0000000EIoS-1bl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:54:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D65541C000A;
	Tue, 29 Oct 2024 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730202863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGCWRSOQMmjS9ZFY7AhKJ0VNqkvKkp9FxTzYgROnlPc=;
	b=Uj/zZ6Rl3V4q/IJ6WB/HHZutLTeFS1axCbwn50wEuAeNuxJNuViSCjiCNRUu6k+FY3XAM6
	BvVqKw1NqcEjRtLhEUaaV17nma4xx26/wvwFuDzOuc8W5VaiOImCbY9xxuM1Q1h2dAvxCD
	4bqyKXDedHQG67rVYSFgnxrtERGXWXUeI3aWYIBRxHdNUP9wIaWgdS5vN9MHmhv4g2H7vv
	hnLM66SRFtFVFkoAOnmLsSEnCe6qWzFisCQfO2we6xv9mptZidTcCAUh5KvpoiSVQh6Dwd
	TcVyF3pkhh/FRFNxY3OfkTPoZSGfSXcm+jklgGIhtUVglZG5rQFMOmJ0lIeQAQ==
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
Subject: [PATCH net-next 1/7] net: stmmac: Don't modify the global ptp ops directly
Date: Tue, 29 Oct 2024 12:54:09 +0100
Message-ID: <20241029115419.1160201-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_045430_631925_25174339 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

The stmmac_ptp_clock_ops are copied into the stmmac_priv structure
before being registered to the PTP core. Some adjustments are made prior
to that, such as the number of snapshots or max adjustment parameters.

Instead of modifying the global definition, then copying into the local
private data, let's first copy then modify the local parameters.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index a6b1de9a251d..11ab1d6b916a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -298,20 +298,21 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 		priv->pps[i].available = true;
 	}
 
-	if (priv->plat->ptp_max_adj)
-		stmmac_ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
-
 	/* Calculate the clock domain crossing (CDC) error if necessary */
 	priv->plat->cdc_error_adj = 0;
 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
 		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
 
-	stmmac_ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
-	stmmac_ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
+	priv->ptp_clock_ops = stmmac_ptp_clock_ops;
+
+	priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
+	priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
+
+	if (priv->plat->ptp_max_adj)
+		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
 
 	rwlock_init(&priv->ptp_lock);
 	mutex_init(&priv->aux_ts_lock);
-	priv->ptp_clock_ops = stmmac_ptp_clock_ops;
 
 	priv->ptp_clock = ptp_clock_register(&priv->ptp_clock_ops,
 					     priv->device);
-- 
2.47.0


