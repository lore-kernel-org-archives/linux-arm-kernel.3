Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28FED42BB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZw9t9ICWMYTWiUjhgkRGFqANmNYJTvr2/KWvvFKqHo=; b=ccWms8+7wlKavY3EMWsCNlWCi0
	csTp+YZTEshwsh+3fjCSt8Z0ECVyqh1FwIa8u9g5wdc8Q0RjH7SWawOUUa7y8GY4kKdEQ6NqRgVxF
	PLi+PNjz7rqcRjXz1HsinP55E60VLacIXDnVSz+k/cKhclxH6K2VZqO3NGPpufr3mQXsik3ip3SHK
	YATrbBsYTcQQKvxDPlXV9jklsy4U9V58KuIbqP3rbqEZG9F92LBDSm40xtbyQpeyzKZ3HN50Tdg40
	d+DLaZMMB7Dt+dGghyba19s4HgFvxedKVVGkR8atIwashfTHJ5SDSUsQG17pSB7YHtWq+W/UBEhpL
	Zb24WRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAutm-00000004PTI-09ax;
	Tue, 12 Nov 2024 17:41:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuM4-00000004I7b-2yAV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:07:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F093E0004;
	Tue, 12 Nov 2024 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731431223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZw9t9ICWMYTWiUjhgkRGFqANmNYJTvr2/KWvvFKqHo=;
	b=ZdRuqB6L+RSgkn6gJdetR5a//9ZEmm5dAtN5Y6Hzy52DpESNjKNM55X63uMNNMpHOmryNP
	b8IzA/heHgjBiJtwmoGiQshyNtHJIxc7/Dvrr8c2f3/9S2YYnabTrnPD3e4f6WxFumiM2s
	0KyBM4wzec6A6nwUawnFC4JPukLkZlbza/iJaGaTvbrjXm5twEE+Wc/J78h15bNyfJgQND
	gg4LbUGSSp4conVDdSjRQWHVg8sfAKaI5EAd/UrDHmiCzFV4iaROc2/nCd17iXAG1Fn/RU
	EQ2AQBCtQQQzdmjPVAOvnsy8+KAEP8MTlNaaII8X4RjtblkApLYxCxP0sx32gg==
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
	Daniel Machon <daniel.machon@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/9] net: stmmac: Don't modify the global ptp ops directly
Date: Tue, 12 Nov 2024 18:06:49 +0100
Message-ID: <20241112170658.2388529-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090704_913684_DFE3D1DD 
X-CRM114-Status: UNSURE (   9.80  )
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

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
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


