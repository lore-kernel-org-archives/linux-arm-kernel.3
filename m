Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB98D42BB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3/LWbqaZazKEq6VjLV38cT+A/nEiHKr3Hh/DPkJ5IA=; b=dwj6CQWNBZW+QpRth2/KvYy/Kr
	gvN0yiNLajdzLOUDJJaHQIqQN+yuTvjGbrE3X6n8kJZkfcmI/7bxqNBC8MmU4WHwgqr0rCG+/RqHZ
	5YsiiNmu870mbdT4adzK7tPRwf3c+jqgRJCmijlxLxzmSYgXtVNHnXcs2JjY60xNrh9wUv+eIlX8N
	uVQBi/t8gzJCz+TBPx+1LBYV/ltnS/WtYsJnjEWMI4JYnq0C9+WoVNkkvO9Es4uyzrrsaN1Q00EWP
	xmhw9VjOg+L467c3pYqetVl0tVRdosNG1Vfv6mZOxBMQGRMl9GKWUI92HtyZG4bL5in/Pm6+dJbsZ
	g5t/YrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAudQ-00000004M92-104r;
	Tue, 12 Nov 2024 17:25:00 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuM7-00000004I9b-0eKb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:07:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFC7BE0009;
	Tue, 12 Nov 2024 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731431225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3/LWbqaZazKEq6VjLV38cT+A/nEiHKr3Hh/DPkJ5IA=;
	b=OUusYAzLhJIGjnOTUZrSSirN0cK3O4T/9HfKDJBniYnd0ror2gkJQf/iVT+ab/jc1OgY3T
	RjtVl1v5/Bju7bcnFAm2ib6YYHJi6VDGYw9wRpnsrCkjRaqW/5cyIc4Ha5SxT60iQvZ245
	loAJHMu0ZxTPnuBt1hREMPKeyei4wnc1SwFBbChoqpKKdFZ+8SRFNa/8AbjtXlQXQuXbg9
	KRbWJ2FG6xSTKQHs3OVwVZUAM30QaLAGji2AsTOakjrHp8r41r7x8pkqDTEDOSRSFnTmY+
	QitpLUMhfAXbSQ8ueo42d3RtZG9FSdSjNP7h5s6W6ayuBpRz3U+lSScc/ct64w==
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
Subject: [PATCH net-next v4 4/9] net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
Date: Tue, 12 Nov 2024 18:06:52 +0100
Message-ID: <20241112170658.2388529-5-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
References: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090707_562265_99F75F41 
X-CRM114-Status: GOOD (  19.86  )
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

The PTP configuration for GMAC3_X differs from the other implementations
in several ways :

 - There's only one external snapshot trigger
 - The snapshot configuration is done through the PTP_TCR register,
   whereas the other dwmac variants have a dedicated ACR (auxiliary
   control reg) for that purpose
 - The layout for the PTP_TCR register also differs, as bits 24/25 are
   used for the snapshot configuration. These bits are reserved on other
   variants.

On GMAC3_X, we also can't discover the number of snapshot triggers
automatically.

The GMAC3_X has one PPS output, however it's configuration isn't
supported yet so report 0 n_per_out for now.

Introduce a dedicated set of ptp_clock_info ops and configuration
parameters to reflect these differences specific to GMAC3_X.

This was tested on dwmac_socfpga.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V4: Moved waiting for the FIFO drain within the mutex

 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  5 +++
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 45 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 18 ++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  6 +++
 6 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 4a0a1708c391..6f68a6b298c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -552,6 +552,7 @@ extern const struct stmmac_hwtimestamp stmmac_ptp;
 extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
 
 extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
 
 struct mac_link {
 	u32 caps;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 4296ddda8aaa..01eafeb1272f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -329,5 +329,10 @@ enum rtc_control {
 #define GMAC_MMC_RX_CSUM_OFFLOAD   0x208
 #define GMAC_EXTHASH_BASE  0x500
 
+/* PTP and timestamping registers */
+
+#define GMAC_PTP_TCR_ATSFC	BIT(24)
+#define GMAC_PTP_TCR_ATSEN0	BIT(25)
+
 extern const struct stmmac_dma_ops dwmac1000_dma_ops;
 #endif /* __DWMAC1000_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d413d76a8936..a14509d88fe7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -18,6 +18,7 @@
 #include <linux/io.h>
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
@@ -551,3 +552,47 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+
+/* DWMAC 1000 ptp_clock_info ops */
+
+int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
+			 struct ptp_clock_request *rq, int on)
+{
+	struct stmmac_priv *priv =
+	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
+	void __iomem *ptpaddr = priv->ptpaddr;
+	int ret = -EOPNOTSUPP;
+	u32 tcr_val;
+
+	switch (rq->type) {
+	case PTP_CLK_REQ_EXTTS:
+		mutex_lock(&priv->aux_ts_lock);
+		tcr_val = readl(ptpaddr + PTP_TCR);
+
+		if (on) {
+			tcr_val |= GMAC_PTP_TCR_ATSEN0;
+			tcr_val |= GMAC_PTP_TCR_ATSFC;
+			priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
+		} else {
+			tcr_val &= ~GMAC_PTP_TCR_ATSEN0;
+			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
+		}
+
+		netdev_dbg(priv->dev, "Auxiliary Snapshot %s.\n",
+			   on ? "enabled" : "disabled");
+		writel(tcr_val, ptpaddr + PTP_TCR);
+
+		/* wait for auxts fifo clear to finish */
+		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
+					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
+					 10, 10000);
+
+		mutex_unlock(&priv->aux_ts_lock);
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 47458cbcbc94..1f508843fb5a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -135,7 +135,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac100_dma_ops,
 		.mac = &dwmac100_ops,
 		.hwtimestamp = &stmmac_ptp,
-		.ptp = &stmmac_ptp_clock_ops,
+		.ptp = &dwmac1000_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
@@ -154,7 +154,7 @@ static const struct stmmac_hwif_entry {
 		.dma = &dwmac1000_dma_ops,
 		.mac = &dwmac1000_ops,
 		.hwtimestamp = &stmmac_ptp,
-		.ptp = &stmmac_ptp_clock_ops,
+		.ptp = &dwmac1000_ptp_clock_ops,
 		.mode = NULL,
 		.tc = NULL,
 		.mmc = &dwmac_mmc_ops,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 8ea2b4226234..430905f591b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -282,6 +282,24 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.getcrosststamp = stmmac_getcrosststamp,
 };
 
+/* structure describing a PTP hardware clock */
+const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
+	.owner = THIS_MODULE,
+	.name = "stmmac ptp",
+	.max_adj = 62500000,
+	.n_alarm = 0,
+	.n_ext_ts = 1,
+	.n_per_out = 0,
+	.n_pins = 0,
+	.pps = 0,
+	.adjfine = stmmac_adjust_freq,
+	.adjtime = stmmac_adjust_time,
+	.gettime64 = stmmac_get_time,
+	.settime64 = stmmac_set_time,
+	.enable = dwmac1000_ptp_enable,
+	.getcrosststamp = stmmac_getcrosststamp,
+};
+
 /**
  * stmmac_ptp_register
  * @priv: driver private structure
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index fce3fba2ffd2..fa4611855311 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -94,4 +94,10 @@ enum aux_snapshot {
 	AUX_SNAPSHOT3 = 0x80,
 };
 
+struct ptp_clock_info;
+struct ptp_clock_request;
+
+int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
+			 struct ptp_clock_request *rq, int on);
+
 #endif	/* __STMMAC_PTP_H__ */
-- 
2.47.0


