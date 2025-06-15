Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044AC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4C7Q4t/AU34WzARp/njtbql1AFFLroVS9AUe++T/xw=; b=vvPilm3UqADzfJ+OD5uoq6RGel
	UQPTRZ6tupq+WKVX6hfC0tkHYU3hKV+2dKhJGjPlZZF3QDVP5XbqSqSZQGCkRrP5f2765ywLtghdt
	BB8OGOxG6OAG7tJNx5WLsaTUbmIfNWT/Lc7Nul3fG0gtqfctg6uCVotqMHtY6vvYMbON/Gr/kkLyG
	Q5P3Y0yE8zIySczgGFQg+leTaRSkoLmBv/8yXJqRWwimrGGqyNj9thri+V1qSzbJxV54YzUX4IGpd
	RCu6VijFNkBa2Wnf3IfEfmnM+KkvT62rljkrMZaWO5xRGjAyC2wsjmjnYug52kqc4gYYGdDhboeGG
	SvawYl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQejA-00000002D2A-0ZVY;
	Sun, 15 Jun 2025 04:12:16 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVk-00000002BsG-3NJf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:25 +0000
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
Subject: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
Date: Sun, 15 Jun 2025 11:58:00 +0800
Message-ID: <20250615035803.3752235-6-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205824_841863_D982C353 
X-CRM114-Status: UNSURE (   9.85  )
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

Platform data might be null.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 2bdd93a3f91f..22dde915e51b 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -241,7 +241,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	struct sdhci_pltfm_host *pltfm_host;
 	unsigned long parent, bus;
 	struct aspeed_sdhci *sdhci;
-	int div;
+	int div = 1;
 	u16 clk;
 
 	pltfm_host = sdhci_priv(host);
@@ -257,6 +257,9 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	if (WARN_ON(clock > host->max_clk))
 		clock = host->max_clk;
 
+	if (sdhci->pdata)
+		div = sdhci->pdata->clk_div_start;
+
 	/*
 	 * Regarding the AST2600:
 	 *
@@ -273,7 +276,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * supporting the value 0 in (EMMC12C[7:6], EMMC12C[15:8]), and capture
 	 * the 0-value capability in clk_div_start.
 	 */
-	for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
+	for (; div < 256; div *= 2) {
 		bus = parent / div;
 		if (bus <= clock)
 			break;
-- 
2.34.1


