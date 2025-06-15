Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3724CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riNJCfLsCpG+ZXEQyizH4dM9JJQUu6bLADOK0GpAsts=; b=CXzJwc4UMtGwzHZmjHvGfoBOzt
	dMEjblT7HkmQjSGLKF4oONyWv76t7Qt19lDX04M4YASt4zqwU8CCSKPlFUeMKBQ/5K7pcRrptpydi
	K7shA5r6CgC8L9WpWoE5AOkBeSNhCzbXrieVi6tTBilMh8/gbk4Xa/heKfdyu39jZE4qA4tU4Xa3M
	BawJIKgfL64TEHmsEcTS+Qx5No+/Cs63YRCfgPCbbCV/oBL9IxtLyMEMEThphIT9I3091ySiXoFlx
	zlOwFFLHH9779yq0SA1NLZErJKvn85eRken8eAD+1wqjCxwEbAJthSiC1l1ASJs30icnGVHZGAzkD
	DlDRlD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQepm-00000002DLP-1Hvc;
	Sun, 15 Jun 2025 04:19:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVo-00000002BsG-3vis
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:29 +0000
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
Subject: [PATCH 8/8] mmc: sdhci-of-aspeed: Add sdr50 support
Date: Sun, 15 Jun 2025 11:58:03 +0800
Message-ID: <20250615035803.3752235-9-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205828_984176_CD003570 
X-CRM114-Status: UNSURE (   9.14  )
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

Add support for SDR50 mode in the Aspeed SDHCI driver by setting
capability shadow register.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 365c02215273..ec6833295b6a 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -41,6 +41,7 @@
 #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
 /* SDIO{14,24} */
 #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
+#define ASPEED_SDC_CAP2_SDR50		(1 * 32 + 0)
 
 struct aspeed_sdc {
 	struct clk *clk;
@@ -427,11 +428,17 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	sdhci_get_of_property(pdev);
 
 	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
+	    of_property_read_bool(np, "sd-uhs-sdr50") ||
 	    of_property_read_bool(np, "sd-uhs-sdr104")) {
 		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP1_1_8V,
 					       true, slot);
 	}
 
+	if (of_property_read_bool(np, "sd-uhs-sdr50")) {
+		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR50,
+					       true, slot);
+	}
+
 	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
 		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR104,
 					       true, slot);
-- 
2.34.1


