Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213A9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldWYjAq3x6Tt0epgSToehaUvZ4JC3VKI8OdUZeG/niw=; b=16V+bZK+hIPf7Vc5kh0ONe3nh5
	/PcNNnKvMzAiQgf2OYox04DqyLdo6BqV7eugt019lUEgsMYDa5qeqcwZLbhyakqpsrq6d77Kw1NO7
	nWJAap647l3sV6S2meqS+j3AhDCK8fon6enciYc42gQx6xn6UfiWqh1ObBJZmOwEn4gOIPVbjiioW
	NQuYwawSFP2462TRcG8mbpkE/0bd3FFKq0cigo+xykQy+pArtHg14DsUYPxt7Xo7x9Kt35tQ19Qon
	qwvxeE6KfW2ljbTIqCSntzM/ke+m6lSHdC0N+K4v7EhPE/YG1mAzVcVRgmNZgE3nHFzmMqNWSTtXe
	DKhgS9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTim3-0000000D7tK-1Qx2;
	Fri, 03 Jan 2025 14:35:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTijq-0000000D7aR-3KRy;
	Fri, 03 Jan 2025 14:33:23 +0000
X-UUID: ac7af228c9df11ef9048ed6ed365623b-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ldWYjAq3x6Tt0epgSToehaUvZ4JC3VKI8OdUZeG/niw=;
	b=KfHcPbqd4UMTsu72sbkwAIkKeR9ZWgapwgkuqS12hhPflkST6ooLJG8yI6FNGw4DQsdJZZj5QvLHTrFXAFJ8gmeQtMag/+W66QBn7d84xXM6yyko1VWHs/9u4eGr046RVGEI5PnlDC/y6UYOsWGxIZ/khdT750g5LvRXSlNxnXc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:63f24cc0-053e-485c-9ba8-53249409d0f8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:a9e74a19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ac7af228c9df11ef9048ed6ed365623b-20250103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1515042844; Fri, 03 Jan 2025 07:33:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 22:33:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 22:33:15 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<teddy.chen@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [PATCH v3 1/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 3 Jan 2025 22:32:34 +0800
Message-ID: <20250103143250.1521287-2-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103143250.1521287-1-zoie.lin@mediatek.com>
References: <20250103143250.1521287-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_063322_834683_60058D02 
X-CRM114-Status: GOOD (  18.00  )
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

This commit introduces support for runtime PM operations in
the I2C driver, enabling runtime suspend and resume functionality.

Although in the most platforms, the bus power of i2c are always
on, some platforms disable the i2c bus power in order to meet
low power request.

This implementation includes bus regulator control to facilitate
proper handling of the bus power based on platform requirements.

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 75 +++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5bd342047d59..307598a5f80e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -1245,8 +1246,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	int left_num = num;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
-	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
-	if (ret)
+	ret = pm_runtime_resume_and_get(i2c->dev);
+	if (ret < 0)
 		return ret;
 
 	i2c->auto_restart = i2c->dev_comp->auto_restart;
@@ -1299,7 +1300,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 	ret = num;
 
 err_exit:
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	pm_runtime_mark_last_busy(i2c->dev);
+	pm_runtime_put_sync(i2c->dev);
+
 	return ret;
 }
 
@@ -1370,6 +1373,40 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	return 0;
 }
 
+static int mtk_i2c_runtime_suspend(struct device *dev)
+{
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (i2c->adap.bus_regulator)
+		regulator_disable(i2c->adap.bus_regulator);
+
+	return 0;
+}
+
+static int mtk_i2c_runtime_resume(struct device *dev)
+{
+	int ret = 0;
+	struct mtk_i2c *i2c = dev_get_drvdata(dev);
+
+	if (i2c->adap.bus_regulator) {
+		ret = regulator_enable(i2c->adap.bus_regulator);
+		if (ret) {
+			dev_err(dev, "enable regulator failed!\n");
+			return ret;
+		}
+	}
+
+	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (ret) {
+		if (i2c->adap.bus_regulator)
+			regulator_disable(i2c->adap.bus_regulator);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mtk_i2c_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1472,13 +1509,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 	if (ret) {
-		dev_err(&pdev->dev, "clock enable failed!\n");
 		return ret;
 	}
+
+	platform_set_drvdata(pdev, i2c);
+
+	ret = mtk_i2c_runtime_resume(i2c->dev);
+	if (ret < 0)
+		goto err_clk_bulk_unprepare;
 	mtk_i2c_init_hw(i2c);
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	mtk_i2c_runtime_suspend(i2c->dev);
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
 			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
@@ -1486,19 +1528,20 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-		goto err_bulk_unprepare;
+		goto err_clk_bulk_unprepare;
 	}
+	pm_runtime_enable(&pdev->dev);
 
 	i2c_set_adapdata(&i2c->adap, i2c);
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto err_bulk_unprepare;
-
-	platform_set_drvdata(pdev, i2c);
+		goto err_pm_runtime_disable;
 
 	return 0;
 
-err_bulk_unprepare:
+err_pm_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+err_clk_bulk_unprepare:
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return ret;
@@ -1510,6 +1553,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
+	pm_runtime_disable(&pdev->dev);
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 }
 
@@ -1518,6 +1562,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
 	struct mtk_i2c *i2c = dev_get_drvdata(dev);
 
 	i2c_mark_adapter_suspended(&i2c->adap);
+
+	if (!pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_suspend(dev);
+
 	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
 
 	return 0;
@@ -1536,7 +1584,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 
 	mtk_i2c_init_hw(i2c);
 
-	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
+	if (pm_runtime_status_suspended(dev))
+		mtk_i2c_runtime_resume(dev);
 
 	i2c_mark_adapter_resumed(&i2c->adap);
 
@@ -1546,6 +1595,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
 static const struct dev_pm_ops mtk_i2c_pm = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
 				  mtk_i2c_resume_noirq)
+	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
+			   NULL)
 };
 
 static struct platform_driver mtk_i2c_driver = {
-- 
2.45.2


