Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE100CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0WX9a65FT7I3YmuYFU3o9W3IqBTUvZx06xTfPHk6hRA=; b=K+Lqar423fca1XXvQPk5JNHpN1
	ks2aG6Nwi+httB3Q/ukRg72eXh8GpN3stBAspGziZ3Fq6f6egcrqrpQL5bCL3aRKu6Gpgvo2xLlgL
	EplIdZ0NjV6EMxzQ6D6WDcLc3zZVg+usRkYWJmHrxXd/A+ngIuJVmMdhtqCq44crt4BKTdh3Abb5h
	gt4FXX9zDyQWkg8o3LFYiy7K7pTOb0WmFIl+u0SZQs6F47RY6/xeO0W3D4rAQBIVEosVsjL69RNFU
	rLiJElrXMhDCefAVbkA7oBRhKwdXusvPAjnzY1bO66eODWsqDM/SvPVpFqM7Bg7hvCgaOkSvKLMgi
	Zbc+n1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t9k-0000000CzYz-0TWc;
	Thu, 25 Sep 2025 21:05:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1t9g-0000000CzXX-1FT3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0WX9a65FT7I3Ym
	uYFU3o9W3IqBTUvZx06xTfPHk6hRA=; b=b1imPhxMcicLMtlDKRo9wRxh29b79J
	oPgdT+pC67JuAh1tPplNjRzFhyp9NXS4xf8G5Dt/DBnhy24leAJGvygiwk/BiCXx
	RmtCqfBnlKvIlSOs8utlbBFY8J+iQeluzICK+Egb6TodaqrZhOyKhS6jvKj/OF37
	83sUaPJnTniMnEByvBNQYzbieIfq2Oh9/kULuxhkJ27Q213GcuBpB+g216I5kJXQ
	9ocSTU1T+DppHWCwp4zcTRur+7TmIOWml2nNK0zytyiZ++SRG/A5pD8XMxSUVkDk
	1utiatuM5bxdX0obi2lswGIQ9RysFGnp25F6Ew27Zhx+nG47o3CmShFg==
Received: (qmail 2015295 invoked from network); 25 Sep 2025 23:05:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:05:27 +0200
X-UD-Smtp-Session: l3s3148p1@IdZNh6Y/1qQujntx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] i2c: mt65xx: convert set_speed function to void
Date: Thu, 25 Sep 2025 23:05:18 +0200
Message-ID: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_140532_609351_5960639B 
X-CRM114-Status: GOOD (  11.09  )
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

cppcheck rightfully reports:
drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]

Make the function void and simplify the code.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index dee40704825c..aefdbee1f03c 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -868,7 +868,7 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	return 0;
 }
 
-static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
+static void mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 {
 	unsigned int clk_src;
 	unsigned int step_cnt;
@@ -938,9 +938,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 
 		break;
 	}
-
-
-	return 0;
 }
 
 static void i2c_dump_register(struct mtk_i2c *i2c)
@@ -1460,11 +1457,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	strscpy(i2c->adap.name, I2C_DRV_NAME, sizeof(i2c->adap.name));
 
-	ret = mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to set the speed.\n");
-		return -EINVAL;
-	}
+	mtk_i2c_set_speed(i2c, clk_get_rate(i2c->clocks[speed_clk].clk));
 
 	if (i2c->dev_comp->max_dma_support > 32) {
 		ret = dma_set_mask(&pdev->dev,
-- 
2.47.2


