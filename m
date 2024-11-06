Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807A5D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yOD67QmwjZdiHTTDroIrCKnheoQt6SF0kW3Ac+U+wM=; b=QwD9Zl9i2l0gw9HuKbhbwKUGIk
	qtH3u79Cgc/CXYNtDhj2qaWmQ2iP/Ifm9qaqyiqyiRlxXBLTVK49KZG6/5Xdl9VWmYaEUTJOXccwL
	5PgyfXjkYRbxdgeHw0WERWg3Ip5lWAUXMP3I5do7Q33QK7uomukAnh+3RMuzf/Zr9DUQ8/1y5c+q3
	X0nJDgh+xnRCl56PMmSDjgXhzdWHv7+G8YRUjBmpWTPYcqwOXHR7kwlakvMkL31GWuh6gMtU8sKr/
	SQ+pzvw+5Qra9ZOh7dsGUsxzhrFpGaQ3B2RWzd6e8KnvCoASBmw0cr7+tiIRoV0/tpPwXmNG2I7mg
	MAOn5YBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cCc-00000002UN8-0zSm;
	Wed, 06 Nov 2024 09:19:50 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bwz-00000002OTB-1XBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 295AEC0008;
	Wed,  6 Nov 2024 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yOD67QmwjZdiHTTDroIrCKnheoQt6SF0kW3Ac+U+wM=;
	b=iZ81FDdDo2xrqAH5pXI0Kj8agNSI06Li7NNfIrbvMXeP9fbuOYVE4csnnQqs9jXfYwG9YG
	2QPo/yzXDdNq4Hn+q1meQUFVFVU+TaH8BiL+kMjFAge5k7laxUwog+ue00dGV8vyuw/fbI
	ioDROv2nzeFHH8oHKw4gX62shpeiB3D+BN/t4fDB46UYXgwtBiPh1PxNXEtthNwWRqHMv7
	SkXt+4XI7o4nZ1LCeoc9CgzGd+uSXUrAg1oAqWvAOI7DVoPLLq2AFooVykM3KdVB5pw+OG
	M53VzEIg3u5U/I+HoeZOfKHp8j4EGpc22gSJNwB6VkovMYXmmzjDbxwxmyC2Sg==
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
Subject: [PATCH net-next v3 5/9] net: stmmac: Introduce dwmac1000 timestamping operations
Date: Wed,  6 Nov 2024 10:03:26 +0100
Message-ID: <20241106090331.56519-6-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010341_697317_62682FBF 
X-CRM114-Status: GOOD (  19.24  )
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

In GMAC3_X, the timestamping configuration differs from GMAC4 in the
layout of the registers accessed to grab the number of snapshots in FIFO
as well as the register offset to grab the aux snapshot timestamp.

Introduce dedicated ops to configure timestamping on dwmac100 and
dwmac1000. The latency correction doesn't seem to exist on GMAC3, so its
corresponding operation isn't populated.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  7 ++++
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 40 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 11 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  4 ++
 6 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 6f68a6b298c9..1367fa5c9b8e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -549,6 +549,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
 struct mac_device_info;
 
 extern const struct stmmac_hwtimestamp stmmac_ptp;
+extern const struct stmmac_hwtimestamp dwmac1000_ptp;
 extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
 
 extern const struct ptp_clock_info stmmac_ptp_clock_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 01eafeb1272f..600fea8f712f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -331,8 +331,15 @@ enum rtc_control {
 
 /* PTP and timestamping registers */
 
+#define GMAC3_X_ATSNS       GENMASK(19, 16)
+#define GMAC3_X_ATSNS_SHIFT 16
+
 #define GMAC_PTP_TCR_ATSFC	BIT(24)
 #define GMAC_PTP_TCR_ATSEN0	BIT(25)
 
+#define GMAC3_X_TIMESTAMP_STATUS	0x28
+#define GMAC_PTP_ATNR	0x30
+#define GMAC_PTP_ATSR	0x34
+
 extern const struct stmmac_dma_ops dwmac1000_dma_ops;
 #endif /* __DWMAC1000_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index b6930009ea06..dbbd834f9fc8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -553,6 +553,46 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	return 0;
 }
 
+/* DWMAC 1000 HW Timestaming ops */
+
+void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
+{
+	u64 ns;
+
+	ns = readl(ptpaddr + GMAC_PTP_ATNR);
+	ns += readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
+
+	*ptp_time = ns;
+}
+
+void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv)
+{
+	struct ptp_clock_event event;
+	u32 ts_status, num_snapshot;
+	unsigned long flags;
+	u64 ptp_time;
+	int i;
+
+	/* Clears the timestamp interrupt */
+	ts_status = readl(priv->ptpaddr + GMAC3_X_TIMESTAMP_STATUS);
+
+	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
+		return;
+
+	num_snapshot = (ts_status & GMAC3_X_ATSNS) >> GMAC3_X_ATSNS_SHIFT;
+
+	for (i = 0; i < num_snapshot; i++) {
+		read_lock_irqsave(&priv->ptp_lock, flags);
+		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
+		read_unlock_irqrestore(&priv->ptp_lock, flags);
+
+		event.type = PTP_CLOCK_EXTTS;
+		event.index = 0;
+		event.timestamp = ptp_time;
+		ptp_clock_event(priv->ptp_clock, &event);
+	}
+}
+
 /* DWMAC 1000 ptp_clock_info ops */
 
 int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 1f508843fb5a..a72d336a8350 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -134,7 +134,7 @@ static const struct stmmac_hwif_entry {
 		.desc = NULL,
 		.dma = &dwmac100_dma_ops,
 		.mac = &dwmac100_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwmac1000_ptp,
 		.ptp = &dwmac1000_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
@@ -153,7 +153,7 @@ static const struct stmmac_hwif_entry {
 		.desc = NULL,
 		.dma = &dwmac1000_dma_ops,
 		.mac = &dwmac1000_ops,
-		.hwtimestamp = &stmmac_ptp,
+		.hwtimestamp = &dwmac1000_ptp,
 		.ptp = &dwmac1000_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 5ef52ef2698f..a94829ef8cfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -269,3 +269,14 @@ const struct stmmac_hwtimestamp stmmac_ptp = {
 	.timestamp_interrupt = timestamp_interrupt,
 	.hwtstamp_correct_latency = hwtstamp_correct_latency,
 };
+
+const struct stmmac_hwtimestamp dwmac1000_ptp = {
+	.config_hw_tstamping = config_hw_tstamping,
+	.init_systime = init_systime,
+	.config_sub_second_increment = config_sub_second_increment,
+	.config_addend = config_addend,
+	.adjust_systime = adjust_systime,
+	.get_systime = get_systime,
+	.get_ptptime = dwmac1000_get_ptptime,
+	.timestamp_interrupt = dwmac1000_timestamp_interrupt,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index fa4611855311..4cc70480ce0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -96,8 +96,12 @@ enum aux_snapshot {
 
 struct ptp_clock_info;
 struct ptp_clock_request;
+struct stmmac_priv;
 
 int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 			 struct ptp_clock_request *rq, int on);
 
+void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
+void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
+
 #endif	/* __STMMAC_PTP_H__ */
-- 
2.47.0


