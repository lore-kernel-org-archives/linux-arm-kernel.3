Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79606D0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEkMkOoeysYlj2KcLEx7PgbymfxkS+ZogQhGsMWtRJg=; b=ipczzfjAtwaN9Ncml3mizEd7ZV
	a4PAPGmjM3Ecve0Df92Hv2HPi3RKstitM4H8SDM0hq+r1FOG5eVfJjzLfrqU32ybCl9fH2ToOZKYl
	UXjMgpNqhRhky9ct/rORlaum60QCO4WmaTf+X0s9CVvC9M6/yJuQvACJNPX2Jnl3UUVwIdfQDgQ0q
	o2ap+HCOsUu0w3NQsqq0/zGDFVaW6l3wZgDpAJiZeIaeJoCums559Kf+wfzwPL8LFTRN7nn7kxU8A
	kVds6Fmuic/1MtM3rgTnUqj9wnYxvpWWua3YKD+aSDscf49mCQdB6Ck/dzR0rUEB/1FYq36zUZ3c+
	IyIh6BEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rkJ-0000000GzSO-0DQF;
	Thu, 24 Oct 2024 06:54:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rgV-0000000GyXj-1q5m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 47074A0642;
	Thu, 24 Oct 2024 08:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=oEkMkOoeysYlj2KcLEx7
	PgbymfxkS+ZogQhGsMWtRJg=; b=Bl5t6sXlV7X7dFZwUX7P84yQLLobWyw7Phyu
	nSrBStmsWPT3XVu1X/e3SQQcSNCwni+VYLTYRx0VqE9vb5mHbTVOBDw9MWGeo1+H
	eShqSzLPp8JIf9rSONfy5rMnz5PpviAoNab/1JGqPQiIpCWzMUsg/Qx/UOCRWDlO
	cc7yBgoA4FKpNJX5FK7YXtszRsUiBoZt35nRdYI9JWfSFlFhQl1Q4rNu5HJ95QsH
	es7ToRb1//C48ozqxsqGQzLftikhVmd3YM44GsFPYmlIBZVnafjobrTBWhwO27HG
	fg01OM9FZTuBldilzijhWw5Rh+wXHcYx6hQtrd/OogQGBeQDQ9L+S7D3KvYBkz5x
	YAhQ8XiYptVXqGDmquyoroWqkQWcC03U13FVWakAm7NFOsvzgQjYWTcPeQ9govol
	q5L6dJ2iwrLOF65uPr7jzkPXhpic1YS3AWbNpvNnLTItsV2SYJJSASDNEjuuUW94
	VCNL3XjyFz24X41tJ1pXgCPAKZ7F9Xlm3Ts7fCbkEVE6Nk2kqOeGqrEJg7Udej0s
	wru7pNVPI1CJJ0XcZxRM5pKYH3GME9njP0ROuKcZLwMZrk8a7F5iY81j/a07/UbY
	F1zBSa8IaVHuHoYdwA/cEKvID8TynioDTcIrtp0vJRZ8v8v+PkXxyn5PRXcPHb7L
	2402iN0=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 02/10] dma-engine: sun4i: Add has_reset option to quirk
Date: Thu, 24 Oct 2024 08:49:23 +0200
Message-ID: <20241024064931.1144605-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752650;VERSION=7978;MC=1474290725;ID=135549;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235104_022042_2143A40D 
X-CRM114-Status: GOOD (  14.58  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
has this bit but in order to support suniv we need to add it. So add
support for reset bit.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 drivers/dma/sun4i-dma.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 5efbed7c546f..0b99b3884971 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -15,6 +15,7 @@
 #include <linux/of_dma.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -159,6 +160,7 @@ struct sun4i_dma_config {
 	u8 ddma_drq_sdram;
 
 	u8 max_burst;
+	bool has_reset;
 };
 
 struct sun4i_dma_pchan {
@@ -208,6 +210,7 @@ struct sun4i_dma_dev {
 	int				irq;
 	spinlock_t			lock;
 	const struct sun4i_dma_config *cfg;
+	struct reset_control *rst;
 };
 
 static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
@@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	if (priv->cfg->has_reset) {
+		priv->rst = devm_reset_control_get_exclusive(&pdev->dev,
+							       NULL);
+		if (IS_ERR(priv->rst)) {
+			dev_err(&pdev->dev, "Failed to get reset control\n");
+			return PTR_ERR(priv->rst);
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 	spin_lock_init(&priv->lock);
 
@@ -1287,6 +1299,16 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Deassert the reset control */
+	if (priv->rst) {
+		ret = reset_control_deassert(priv->rst);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to deassert the reset control\n");
+			goto err_clk_disable;
+		}
+	}
+
 	/*
 	 * Make sure the IRQs are all disabled and accounted for. The bootloader
 	 * likes to leave these dirty
@@ -1356,6 +1378,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.ddma_drq_sdram		= SUN4I_DDMA_DRQ_TYPE_SDRAM,
 
 	.max_burst		= SUN4I_MAX_BURST,
+	.has_reset		= false,
 };
 
 static const struct of_device_id sun4i_dma_match[] = {
-- 
2.34.1



