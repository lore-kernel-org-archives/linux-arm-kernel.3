Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C4106FD88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWr3UpL72gEY0ThjpzFd6EFwY6zHsa+dAASz/B2/zTg=; b=OUzCvGIJ5iHgBfxPwDiCDVEB5M
	YODXOd4uiWrPbyi5/cskLAdDeAJPf20+J8c4781kYA3UBqIMGoDl0gJL/9Uv5xZprVPB9vGSEa8Ii
	+nV+XbORRBQSIGbdinrER9gcbb6I/SVolIuIBgYx8hFS5Td3ZDh+9gFfScGuyDq2n1dcH88gWqIm/
	xkifxb0gBMLDatc7Xps5Jr3lYAiAiLiB/q0HYKy2aTmEqN22fVhvZiS9blDLEk9ieAlS6aikz8k0K
	7aA4Qy/frBCwxHC0WHv1yCEpriH93YvTltSWRXVtDdx04aNUnXd4WH/Xq9zRpA4791HE9+LWIZILV
	Jks8m7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vjZ-0000000GmH1-49Yp;
	Fri, 13 Mar 2026 06:10:53 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vhw-0000000Gk5r-1lfl;
	Fri, 13 Mar 2026 06:09:15 +0000
X-UUID: 2025a7e01ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d89ac4ec-369b-4d47-846d-ed976b4fdb08,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:fd8bf85eeab97c9d96b48752536a9aa3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2025a7e01ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1216968440; Fri, 13 Mar 2026 14:08:59 +0800
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
Subject: [PATCH v2 04/17] spi: img-spfi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:20 +0800
Message-Id: <8e188ff7513f1a57e6b9b973d231b0eb8f317253.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230913_227007_8A564019 
X-CRM114-Status: UNSURE (   9.11  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-img-spfi.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
index 902fb64815c9..a227cff5da70 100644
--- a/drivers/spi/spi-img-spfi.c
+++ b/drivers/spi/spi-img-spfi.c
@@ -557,24 +557,17 @@ static int img_spfi_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_spi;
 
-	spfi->sys_clk = devm_clk_get(spfi->dev, "sys");
+	spfi->sys_clk = devm_clk_get_enabled(spfi->dev, "sys");
 	if (IS_ERR(spfi->sys_clk)) {
 		ret = PTR_ERR(spfi->sys_clk);
 		goto put_spi;
 	}
-	spfi->spfi_clk = devm_clk_get(spfi->dev, "spfi");
+	spfi->spfi_clk = devm_clk_get_enabled(spfi->dev, "spfi");
 	if (IS_ERR(spfi->spfi_clk)) {
 		ret = PTR_ERR(spfi->spfi_clk);
 		goto put_spi;
 	}
 
-	ret = clk_prepare_enable(spfi->sys_clk);
-	if (ret)
-		goto put_spi;
-	ret = clk_prepare_enable(spfi->spfi_clk);
-	if (ret)
-		goto disable_pclk;
-
 	spfi_reset(spfi);
 	/*
 	 * Only enable the error (IACCESS) interrupt.  In PIO mode we'll
@@ -655,9 +648,6 @@ static int img_spfi_probe(struct platform_device *pdev)
 		dma_release_channel(spfi->rx_ch);
 	if (spfi->tx_ch)
 		dma_release_channel(spfi->tx_ch);
-	clk_disable_unprepare(spfi->spfi_clk);
-disable_pclk:
-	clk_disable_unprepare(spfi->sys_clk);
 put_spi:
 	spi_controller_put(host);
 
-- 
2.25.1


