Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC77C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfUBJDYJ2I6crEayuJt5YmTaQirmf4oh1DOphkDbxAI=; b=lsuuKNQRm1FY7ho1uSGToNFM0j
	RWMq3WorAhZVmmxrsIIqrv8P87lGCRii8NpWtAPhvusEVjJYW7GmfpWqOaOQo8R9PABWNrZutqd9a
	rubHy0tSCeK08RG9/sjrKMS9wJUDYu0GILR+IVUtBXgaJlQzUm4Evdga8ucAu9pG2TJ9p5oe2C5+x
	P7bNuYByjrkxpGPjWkigeyvD0K55YqXFcLf0CKXKOr4YWd33GB4UBx83DJLnJKW7G8+8lWcbJtTdl
	ThGCN1ZCRHcDDke2ByCfsxW3ODhjv4AWURxUSFfAWDfsV4d1p1Sx2ULlXkw1nDVIIVMSp0beg6Wg4
	jtAE0AZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeek-00000002CnT-31FK;
	Sun, 15 Jun 2025 04:07:42 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVi-00000002BsG-0kbr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:23 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:03 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:03 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register missing after top reset
Date: Sun, 15 Jun 2025 11:57:58 +0800
Message-ID: <20250615035803.3752235-4-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205822_214828_6CB5FFDC 
X-CRM114-Status: UNSURE (   8.11  )
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

HOST_CONTROL2 register will be cleared after top reset,
it needs to be saved/resotred while reset.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 5e5ae1894456..10160a706334 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -336,14 +336,15 @@ static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
 	struct sdhci_pltfm_host *pltfm_priv;
 	struct aspeed_sdhci *aspeed_sdhci;
 	struct aspeed_sdc *aspeed_sdc;
-	u32 save_array[7];
+	u32 save_array[8];
 	u32 reg_array[] = {SDHCI_DMA_ADDRESS,
 			SDHCI_BLOCK_SIZE,
 			SDHCI_ARGUMENT,
 			SDHCI_HOST_CONTROL,
 			SDHCI_CLOCK_CONTROL,
 			SDHCI_INT_ENABLE,
-			SDHCI_SIGNAL_ENABLE};
+			SDHCI_SIGNAL_ENABLE,
+			SDHCI_AUTO_CMD_STATUS};
 	int i;
 	u16 tran_mode;
 	u32 mmc8_mode;
-- 
2.34.1


