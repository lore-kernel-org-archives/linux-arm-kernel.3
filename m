Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA09D1BDD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SPSBRQipSII7hd35ejo1FRCOBIsfi2Df67vBJxKStA=; b=CSY+lXbf6PBMA9AA8R27bLRuR4
	etFySA7bMCifvpMJfZvEI2FJD6RZjXQvJAS4s0KxnuSaoKhwXO4UKYTJFAdQHKazr4qG3+cp1ZGDb
	V92VXeRCbwIjgg/+sx96w0Plx2FklxRCsUHGUZ7+DCIDrN7C18lyDRQocpfIUMNGdCSuRVeU4p0Um
	7V2JMj7zTUOY0pptYyGYjvg1EFfINdBcsoFF265MeZ7ZYyLGMXl8yS64cNUsSl39KSbKtM7s7m/mh
	wHQcnewwjvsFBlljRqhmNiLbLcUBHoPoYVTncEbbd8/NqmXzdMGB9bCegGJxUDCLzyyriAYjYvXMm
	pWmoYIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80y6-0000000EYAQ-1aWM;
	Mon, 04 Nov 2024 17:34:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tl-0000000ERzR-0M7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67A0260003;
	Mon,  4 Nov 2024 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/SPSBRQipSII7hd35ejo1FRCOBIsfi2Df67vBJxKStA=;
	b=P/ylVa50a+BLdkHAgE7RjPYnPZ2RVCr9fPAnphAuuCYjYTKraswaYmWf0aDEbPzaYSLzrm
	XsFpX1Fl0SPyWabDsuWUXldUhR8/MIbP3DTaB9Q1cabYNyxOLeKeOwLUmsbcIGXWH1xCwn
	ZhK9tofPBP/dFq5TX9mBsdbyYNAdxVBZ6UczkW6HnnlFmRa56RJZeCPmZHH8qtUtt5RMLI
	2/8BcVWO0ERuUpFB4OHm6NKrj+xIKToRjV5E1IVg2o4b46eFNHSDj6FzsHRoxBjsMI2EnA
	SBX2dSDqxbVKNqRgRnDrd1L9+QB3y5PvPqI2tYPADfiNX8B1Qqsr5P8GHvc9+g==
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
Subject: [PATCH net-next v2 3/9] net: stmmac: Only update the auto-discovered PTP clock features
Date: Mon,  4 Nov 2024 18:02:43 +0100
Message-ID: <20241104170251.2202270-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090301_397114_DB4607F2 
X-CRM114-Status: GOOD (  12.43  )
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

Some DWMAC variants such as dwmac1000 don't support discovering the
number of output pps and auxiliary snapshots. Allow these parameters to
be defined in default ptp_clock_info, and let them be updated only when
the feature discovery yielded a result.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: No changes

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 41581f516ea9..8ea2b4226234 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -303,8 +303,14 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
 		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
 
-	priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
-	priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
+	/* Update the ptp clock parameters based on feature discovery, when
+	 * available
+	 */
+	if (priv->dma_cap.pps_out_num)
+		priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
+
+	if (priv->dma_cap.aux_snapshot_n)
+		priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
 
 	if (priv->plat->ptp_max_adj)
 		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
-- 
2.47.0


