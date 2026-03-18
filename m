Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE3810854CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 02:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/SLOlpgGhPIhcH8YX7bM5l9dez/nWTnXFljshb/5Y4=; b=4cBOoUrM7e18TyyS4b66Q33sBm
	87kQvStT9NtoNDd7hx0Y+nKqymWU49V4SXKnGmuT/S3oqSlSFdqOkmxN4pDgTUKhSydRXMFHUmmq+
	IW7+7AgFv5h3zOaN8wU0LBeB69uTpwzGjY/PJF+TFkd57leKOW+jnyF7HURZ4qjsg8uvH8W5U8lzt
	R/pC2/NdHw0xspqyPSWI5lSMQHU6Pr5kWFjOzbLnGiZv4HQbhYfC80gruO0iNm985KEziQr0CE3Qa
	rOiwf9yO4ujAlk+zHKQG7gi9gqyRojz91YSXHN2Iqv+jmpBCZVf+NnxZ+gKCnLV2Smg1lsknXvTXU
	IK9U9dgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gr7-00000007eV4-3GDP;
	Wed, 18 Mar 2026 02:41:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpe-00000007cSB-3eXt;
	Wed, 18 Mar 2026 02:40:29 +0000
X-UUID: ca971ee2227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d9e97be1-124f-4d3a-a45c-2368c3a4dcc4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:3b2f4b064189b9f3c1b8772177ca50ab,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca971ee2227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1661901577; Wed, 18 Mar 2026 10:40:14 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 07/17] spi: orion: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:39:57 +0800
Message-Id: <753e8d3343b4f880fc08628bbf8d3043c27fae5f.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773801401.git.xiaopei01@kylinos.cn>
References: <cover.1773801401.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_194027_286219_A99E3673 
X-CRM114-Status: GOOD (  12.32  )
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

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for the "axi" clock. This reduces
boilerplate code and error handling, as the managed API automatically
disables the clock when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() call from the
probe error path and the remove callback. Adjust error handling labels
accordingly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-orion.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index 7a2186b51b4c..d884a18c95a6 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -695,13 +695,11 @@ static int orion_spi_probe(struct platform_device *pdev)
 	}
 
 	/* The following clock is only used by some SoCs */
-	spi->axi_clk = devm_clk_get(&pdev->dev, "axi");
+	spi->axi_clk = devm_clk_get_enabled(&pdev->dev, "axi");
 	if (PTR_ERR(spi->axi_clk) == -EPROBE_DEFER) {
 		status = -EPROBE_DEFER;
 		goto out;
 	}
-	if (!IS_ERR(spi->axi_clk))
-		clk_prepare_enable(spi->axi_clk);
 
 	tclk_hz = clk_get_rate(spi->clk);
 
@@ -726,7 +724,7 @@ static int orion_spi_probe(struct platform_device *pdev)
 	spi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
 	if (IS_ERR(spi->base)) {
 		status = PTR_ERR(spi->base);
-		goto out_rel_axi_clk;
+		goto out;
 	}
 
 	for_each_available_child_of_node(pdev->dev.of_node, np) {
@@ -764,7 +762,7 @@ static int orion_spi_probe(struct platform_device *pdev)
 		if (!dir_acc->vaddr) {
 			status = -ENOMEM;
 			of_node_put(np);
-			goto out_rel_axi_clk;
+			goto out;
 		}
 		dir_acc->size = PAGE_SIZE;
 
@@ -788,8 +786,6 @@ static int orion_spi_probe(struct platform_device *pdev)
 
 out_rel_pm:
 	pm_runtime_disable(&pdev->dev);
-out_rel_axi_clk:
-	clk_disable_unprepare(spi->axi_clk);
 out:
 	spi_controller_put(host);
 	return status;
@@ -802,7 +798,6 @@ static void orion_spi_remove(struct platform_device *pdev)
 	struct orion_spi *spi = spi_controller_get_devdata(host);
 
 	pm_runtime_get_sync(&pdev->dev);
-	clk_disable_unprepare(spi->axi_clk);
 
 	spi_unregister_controller(host);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1


