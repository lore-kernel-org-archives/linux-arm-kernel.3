Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A251B10854CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 02:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfEcXbWidBDubbY0qO5s+3aa6iNxWPJIg3WqJFm8IMM=; b=ZM93q4XCJXZ9ZEj+OEW7bUFrYV
	DdEjDPvRMAee/aGFCcZ1GCoJoT+fuyilB4nZfdsVzrRtbons4dRlIjUAb0hyYtEqzbVl9Eb+/zxov
	DUuJ9Fn7NHT7EKz+4bGW77WnsYd2ptDIF3dl6Q2UlIV8KHzyrf9FU9HjAueasFCAFfJ2OPqi9ji83
	d/uF2ZMxJ6pff8Pd+avqwWuHk51ew3ql6QQy0O80ZZ32kPom3PQAttV+p9p0Rpczsa01Mub61Zkxu
	dhhZVYntAuTuv7PXddGpcV7fNYy8/oNAwF6cHNwbaz8TSDMziszRdLrGOiAh5hYVUF+PAnaoituPs
	AZKFg4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpz-00000007d1s-1RQx;
	Wed, 18 Mar 2026 02:40:47 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2gpd-00000007cSr-09ys;
	Wed, 18 Mar 2026 02:40:26 +0000
X-UUID: ca247bee227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:db6aecef-6bf7-4efc-a7fe-a597a8f1e5fc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:ed94ccb7dde8ac94044c8db9edffc78e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca247bee227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 556156718; Wed, 18 Mar 2026 10:40:13 +0800
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
Subject: [PATCH v4 05/17] spi: imx: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:39:55 +0800
Message-Id: <554b3a088ac453f50df9b040e3506c807efb5dd6.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773801401.git.xiaopei01@kylinos.cn>
References: <cover.1773801401.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_194025_395279_650AC311 
X-CRM114-Status: UNSURE (   9.79  )
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

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for both "ipg" and "per" clocks. This reduces
boilerplate code and error handling, as the managed API automatically
disables the clocks when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error paths.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-imx.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 64c6c09e1e7b..a01c466818de 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -2323,26 +2323,18 @@ static int spi_imx_probe(struct platform_device *pdev)
 		goto out_controller_put;
 	}
 
-	spi_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+	spi_imx->clk_ipg = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(spi_imx->clk_ipg)) {
 		ret = PTR_ERR(spi_imx->clk_ipg);
 		goto out_controller_put;
 	}
 
-	spi_imx->clk_per = devm_clk_get(&pdev->dev, "per");
+	spi_imx->clk_per = devm_clk_get_enabled(&pdev->dev, "per");
 	if (IS_ERR(spi_imx->clk_per)) {
 		ret = PTR_ERR(spi_imx->clk_per);
 		goto out_controller_put;
 	}
 
-	ret = clk_prepare_enable(spi_imx->clk_per);
-	if (ret)
-		goto out_controller_put;
-
-	ret = clk_prepare_enable(spi_imx->clk_ipg);
-	if (ret)
-		goto out_put_per;
-
 	pm_runtime_set_autosuspend_delay(spi_imx->dev, MXC_RPM_TIMEOUT);
 	pm_runtime_use_autosuspend(spi_imx->dev);
 	pm_runtime_get_noresume(spi_imx->dev);
@@ -2386,9 +2378,6 @@ static int spi_imx_probe(struct platform_device *pdev)
 	pm_runtime_disable(spi_imx->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 
-	clk_disable_unprepare(spi_imx->clk_ipg);
-out_put_per:
-	clk_disable_unprepare(spi_imx->clk_per);
 out_controller_put:
 	spi_controller_put(controller);
 
-- 
2.25.1


