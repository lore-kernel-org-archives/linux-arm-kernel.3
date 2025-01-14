Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F463E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9y9THO3YGyTevXlUAOQxK2U1NAtOu/fcfdt10LFF+wI=; b=EkKB0hm3NBjhr1D91g7b0yJCm3
	YEjhqaxoVy4ETfPEVEJh2aIjI6XwSPHzrZiduics6YbN9yFFP3LNBHvC+nYaH639fMiniLuNUsgyq
	R2QQYQzARDXUYxNrwX4yTgg01jgL0g4jBse0ELLZ8h6EIom/Fhe6V0iZnCEkGRA4FLbZ++TiV0Oix
	AyxB46zlYd1yu4l00CoFbVj/V5xrLH4KCANLEZpUUd4QXvhwnDVJfsNDdqgIgB1owpyOVmTaPzhXd
	oZbfqcg4I6Hy2mtX1tV457Q8rFuALgm3/KRvyjfGcjPCEqgKwKJfOrQj/XknkyeuImT5+QftcY6Wa
	ZvVRGtmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXhf-00000007M5u-2kzQ;
	Tue, 14 Jan 2025 03:34:55 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXgP-00000007LtP-2jD2;
	Tue, 14 Jan 2025 03:33:39 +0000
X-UUID: 53a0b1e6d22811ef9048ed6ed365623b-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9y9THO3YGyTevXlUAOQxK2U1NAtOu/fcfdt10LFF+wI=;
	b=s67+htHC/VRh5hdl4uDuYTP34L6SdZ5yYzs6KSFOPHVvQmHjbWbIS81pihr/amGQwuzmvdCuA/NueDfVDjKVbxhZBO8PudNX1HrRinAy4J+m9L9jBOt9mW5Vndgj0nCPwc5L6/wSXR4IJtF2k6UaTAk4aCfIr1gwMAWmssGRJIA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0af5614e-8b35-4189-a4cf-862b7ff8ac2c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:6c267513-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 53a0b1e6d22811ef9048ed6ed365623b-20250113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1305615122; Mon, 13 Jan 2025 20:33:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 11:33:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 11:33:28 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <yenchia.chen@mediatek.com>, <yj.chiang@mediatek.com>,
	<tbergstrom@nvidia.com>, <yujiaoliang@vivo.com>,
	<u.kleine-koenig@baylibre.com>, <treapking@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] serial: 8250_mtk: Add ACPI support
Date: Tue, 14 Jan 2025 11:33:21 +0800
Message-ID: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_193337_691106_6CC2DD99 
X-CRM114-Status: GOOD (  17.14  )
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

Add ACPI support to 8250_mtk driver. This makes it possible to
use uart with edk2 UEFI firmware.

Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index b44de2ed7413..a4f1c30f77b0 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -19,6 +19,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/acpi.h>
 
 #include "8250.h"
 
@@ -519,6 +520,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct mtk8250_data *data;
 	struct resource *regs;
 	int irq, err;
+	acpi_handle hdl = ACPI_HANDLE(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -545,8 +547,12 @@ static int mtk8250_probe(struct platform_device *pdev)
 		err = mtk8250_probe_of(pdev, &uart.port, data);
 		if (err)
 			return err;
-	} else
-		return -ENODEV;
+	} else {
+		if (!hdl) {
+			dev_err(&pdev->dev, "no device\n");
+			return -ENODEV;
+		}
+	}
 
 	spin_lock_init(&uart.port.lock);
 	uart.port.mapbase = regs->start;
@@ -560,16 +566,22 @@ static int mtk8250_probe(struct platform_device *pdev)
 	uart.port.private_data = data;
 	uart.port.shutdown = mtk8250_shutdown;
 	uart.port.startup = mtk8250_startup;
-	uart.port.set_termios = mtk8250_set_termios;
-	uart.port.uartclk = clk_get_rate(data->uart_clk);
+	if (hdl) {
+		uart.port.uartclk = 26000000;
+	} else {
+		uart.port.set_termios = mtk8250_set_termios;
+		uart.port.uartclk = clk_get_rate(data->uart_clk);
+	}
 #ifdef CONFIG_SERIAL_8250_DMA
 	if (data->dma)
 		uart.dma = data->dma;
 #endif
 
-	/* Disable Rate Fix function */
-	writel(0x0, uart.port.membase +
+	if (!hdl) {
+		/* Disable Rate Fix function */
+		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));
+	}
 
 	platform_set_drvdata(pdev, data);
 
@@ -647,11 +659,18 @@ static const struct of_device_id mtk8250_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk8250_of_match);
 
+static const struct acpi_device_id mtk8250_acpi_match[] = {
+	{ "MTKI0511", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, mtk8250_acpi_match);
+
 static struct platform_driver mtk8250_platform_driver = {
 	.driver = {
 		.name		= "mt6577-uart",
 		.pm		= &mtk8250_pm_ops,
 		.of_match_table	= mtk8250_of_match,
+		.acpi_match_table = ACPI_PTR(mtk8250_acpi_match),
 	},
 	.probe			= mtk8250_probe,
 	.remove			= mtk8250_remove,
-- 
2.45.2


