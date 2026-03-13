Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33932106FD85
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiW5q2G1vXl0hLSZeQ2QqS/0mPtL26pvw1MIr3hdQk8=; b=H2i/RYOlNysoehFofTS72zdIX4
	c/ikjITGeLarNxfxgGjWcYRyJHIsaRIekx+CIxTLwvK7ysxLWA+r6XSJ3Byu9VoxTuDp1vdtaYfQg
	8W9Jc6DJFqwNr3RkngRRZdFcTxgoWe+Rrgresj3JTjzEcfrmzV54TJ7qvfMy9CyPpB3cUHhayE8ob
	+uZwSqRrOikPV8B/8uzfPEy/fdXaeCwEMGMsJUtSo2JS23scg9svLJAARzI1FhX5srTwy8asKOj/l
	I0wFpeLQZbh6iN6N3KdYJVemc5iCm5fBO9GQJWoy9ZBAocK2HaHqrUtDhq+dTnbe8dAXny1lXmdrv
	0cNoyaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vhw-0000000Gk91-1NO3;
	Fri, 13 Mar 2026 06:09:12 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vhr-0000000Gk0Q-1ojH;
	Fri, 13 Mar 2026 06:09:08 +0000
X-UUID: 1fe8e6f21ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8d63eaf2-305a-4d95-be4d-8b65b9655fbe,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a3a255a6ae58be441847b8384e29cf43,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1fe8e6f21ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 694140106; Fri, 13 Mar 2026 14:08:58 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 03/17] spi: bcmbca-hsspi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:19 +0800
Message-Id: <787804e2e2c70c515ab980455454fbef84c73b7a.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230907_779504_11B01697 
X-CRM114-Status: GOOD (  10.28  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-bcmbca-hsspi.c | 47 ++++++++++++----------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hsspi.c
index ece22260f570..08d12606e91d 100644
--- a/drivers/spi/spi-bcmbca-hsspi.c
+++ b/drivers/spi/spi-bcmbca-hsspi.c
@@ -452,39 +452,30 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(spim_ctrl))
 		return PTR_ERR(spim_ctrl);
 
-	clk = devm_clk_get(dev, "hsspi");
+	clk = devm_clk_get_enabled(dev, "hsspi");
 	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get hsspi clock\n");
 
 	rate = clk_get_rate(clk);
 	if (!rate) {
-		pll_clk = devm_clk_get(dev, "pll");
+		pll_clk = devm_clk_get_enabled(dev, "pll");
 
 		if (IS_ERR(pll_clk)) {
-			ret = PTR_ERR(pll_clk);
-			goto out_disable_clk;
+			return dev_err_probe(dev, PTR_ERR(pll_clk),
+					     "Failed to get pll clock\n");
 		}
 
-		ret = clk_prepare_enable(pll_clk);
-		if (ret)
-			goto out_disable_clk;
-
 		rate = clk_get_rate(pll_clk);
-		if (!rate) {
-			ret = -EINVAL;
-			goto out_disable_pll_clk;
-		}
+		if (!rate)
+			return dev_err_probe(dev, -EINVAL,
+					     "Failed to get pll clock rate\n");
 	}
 
 	host = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
-	if (!host) {
-		ret = -ENOMEM;
-		goto out_disable_pll_clk;
-	}
+	if (!host)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed alloc spi host\n");
 
 	bs = spi_controller_get_devdata(host);
 	bs->pdev = pdev;
@@ -535,18 +526,16 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, irq, bcmbca_hsspi_interrupt, IRQF_SHARED,
 			       pdev->name, bs);
 		if (ret)
-			goto out_disable_pll_clk;
+			return dev_err_probe(dev, ret, "Failed request irq\n");
 	}
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
-		goto out_disable_pll_clk;
+		return dev_err_probe(dev, ret, "Failed pm runtime enable\n");
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &bcmbca_hsspi_group);
-	if (ret) {
-		dev_err(&pdev->dev, "couldn't register sysfs group\n");
-		goto out_disable_pll_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't register sysfs group\n");
 
 	/* register and we are done */
 	ret = devm_spi_register_controller(dev, host);
@@ -559,10 +548,6 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 
 out_sysgroup_disable:
 	sysfs_remove_group(&pdev->dev.kobj, &bcmbca_hsspi_group);
-out_disable_pll_clk:
-	clk_disable_unprepare(pll_clk);
-out_disable_clk:
-	clk_disable_unprepare(clk);
 	return ret;
 }
 
-- 
2.25.1


