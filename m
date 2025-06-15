Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF787C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27GsQHQT/FiRpIjnk0QogelmG/F5tQ0Uf+x20DOStik=; b=S/NT+AN7/GcURcmPJmIHaT06Rn
	TBOZ+W/DLKQBPIp3qOhTEO8iKS3SKqr/KogeEVQmXN6BGx+LGj6ySYQU+u3csJpjA0kmnaMbRq+Du
	aOZpJPCqJp1t7GsUIpsBCvZgNrwO00lfwpkp5njplSF4RYhr0zEGQ0xz2zA6B9pLxkahAKIFlNDfH
	yHrhF9BK0D2N5OJUOm7eKYVbcU0JNui51sMXC9v07qdOq3zODAZctioU32qggIGcvHaSaTiqeKlgF
	CEStYr7iDMJifXCS/HBYIY63ovtsTaOc7A0N16SV+uh0Yg9S61EBWnil+sKir91doQuJfn0IfYWfx
	N37KkNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQelM-00000002D8B-3ntn;
	Sun, 15 Jun 2025 04:14:32 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVm-00000002BsG-0gh9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:27 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:04 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:04 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 6/8] mmc: sdhci-of-aspeed: Add output timing phase tuning
Date: Sun, 15 Jun 2025 11:58:01 +0800
Message-ID: <20250615035803.3752235-7-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205826_202593_0ECD692A 
X-CRM114-Status: GOOD (  11.78  )
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

Enhance auto tuning with input and output calibration.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 48 ++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 22dde915e51b..92687fc30d1d 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -25,6 +25,7 @@
 #define   ASPEED_SDC_S1_PHASE_IN	GENMASK(25, 21)
 #define   ASPEED_SDC_S0_PHASE_IN	GENMASK(20, 16)
 #define   ASPEED_SDC_S0_PHASE_IN_SHIFT  16
+#define   ASPEED_SDC_S0_PHASE_OUT_SHIFT 3
 #define   ASPEED_SDC_S1_PHASE_OUT	GENMASK(15, 11)
 #define   ASPEED_SDC_S1_PHASE_IN_EN	BIT(10)
 #define   ASPEED_SDC_S1_PHASE_OUT_EN	GENMASK(9, 8)
@@ -422,7 +423,7 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 		}
 
 		window = right - left;
-		dev_info(dev, "tuning window = %d\n", window);
+		dev_dbg(dev, "tuning window[%d][%d~%d] = %d\n", edge, left, right, window);
 
 		if (window > oldwindow) {
 			oldwindow = window;
@@ -433,7 +434,50 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 	val = (out_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_IN_SHIFT));
 	writel(val, sdc->regs + ASPEED_SDC_PHASE);
 
-	dev_info(dev, "tuning result=%x\n", val);
+	dev_dbg(dev, "input tuning result=%x\n", val);
+
+	inverted = 0;
+	out_phase = val & ~ASPEED_SDC_S0_PHASE_OUT;
+	in_phase = out_phase;
+	oldwindow = 0;
+
+	for (edge = 0; edge < 2; edge++) {
+		if (edge == 1)
+			inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
+
+		val = (in_phase | enable_mask | (inverted << ASPEED_SDC_S0_PHASE_OUT_SHIFT));
+
+		/* find the left boundary */
+		for (left = 0; left < ASPEED_SDHCI_NR_TAPS + 1; left++) {
+			out_phase = val | (left << ASPEED_SDC_S0_PHASE_OUT_SHIFT);
+			writel(out_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (!mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		/* find the right boundary */
+		for (right = left + 1; right < ASPEED_SDHCI_NR_TAPS + 1; right++) {
+			out_phase = val | (right << ASPEED_SDC_S0_PHASE_OUT_SHIFT);
+			writel(out_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		window = right - left;
+		dev_info(dev, "tuning window[%d][%d~%d] = %d\n", edge, left, right, window);
+
+		if (window > oldwindow) {
+			oldwindow = window;
+			center = (((right - 1) + left) / 2) | inverted;
+		}
+	}
+
+	val = (in_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_OUT_SHIFT));
+	writel(val, sdc->regs + ASPEED_SDC_PHASE);
+
+	dev_dbg(dev, "output tuning result=%x\n", val);
 
 	return mmc_send_tuning(host->mmc, opcode, NULL);
 }
-- 
2.34.1


