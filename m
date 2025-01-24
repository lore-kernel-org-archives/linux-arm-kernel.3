Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hr2q/zEtH+pKoNV7Cfvrk2hAQt7KerJaGg3/YZVmNBc=; b=MOuhUNqvGRlBUVKpgk39nRe5tf
	hP/EVA+qtF87sBQnulcIi49tzXpGLTcMhg776cZ3FWgEo3xmVKGWyZO+RSspAuUfZRXHHr8tjZlwv
	bCRNx/4/GO5++MpXr31P/tb9QFiO451Ddvbr8aqLTKnJVU7X8kXRIY/ZHQWl6CIpyYPepJ3+Xa82P
	xD+L4R0N4xHPqpsn8IuZvcBtcZLgKsgJDlVgcaP6nx0Ec2NmlJK33n8aS2iDUrvTUK8ypMKA52pGm
	3V9QRD45B7s4DNUbsDbitqSwcup+R4PlLmwp2K2bKrSFLhbyDKb53Dj1/7vDaGBEo0fCbgevlc67P
	dgRpcwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAEq-0000000Dnba-2gTV;
	Fri, 24 Jan 2025 03:20:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbADX-0000000DnKR-1G0w;
	Fri, 24 Jan 2025 03:18:48 +0000
X-UUID: ea0e0bdeda0111ef82ff63e91e7eb18c-20250123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hr2q/zEtH+pKoNV7Cfvrk2hAQt7KerJaGg3/YZVmNBc=;
	b=lj5869yk+EjoNmLbvS3O66wRPTd8/36VP1Aw6QgzDe4wN6MDNT73R2OoGxMlTB1e7AwQjj3XyyvvG5hqqKCQGGO4ebbHnpkpWlGNbsxO52ARt/nfiusZGzFNmah0KJT8lDOQBs+33TCVGL6Ogn4H72eJv5djvLU82h3tyt1JyDY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5295c14a-0fa1-4c8b-afe0-0e0ee10dc183,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:9089a47e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ea0e0bdeda0111ef82ff63e91e7eb18c-20250123
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1195928283; Thu, 23 Jan 2025 20:18:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 11:18:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 11:18:39 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <yenchia.chen@mediatek.com>, <yj.chiang@mediatek.com>,
	<tbergstrom@nvidia.com>, <treapking@chromium.org>,
	<andriy.shevchenko@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
	<yujiaoliang@vivo.com>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] serial: 8250_mtk: Add ACPI support
Date: Fri, 24 Jan 2025 11:18:32 +0800
Message-ID: <20250124031835.1788995-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_191847_349461_923EDB9C 
X-CRM114-Status: GOOD (  17.00  )
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
use UART on ARM-based desktops with EDK2 UEFI firmware.

Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index b44de2ed7413..d06952081191 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2014 MundoReader S.L.
  * Author: Matthias Brugger <matthias.bgg@gmail.com>
  */
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_reg.h>
+#include <linux/units.h>
 #include <linux/console.h>
 #include <linux/dma-mapping.h>
 #include <linux/tty.h>
@@ -519,6 +521,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct mtk8250_data *data;
 	struct resource *regs;
 	int irq, err;
+	acpi_handle acpi_dev_handle = ACPI_HANDLE(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -545,8 +548,9 @@ static int mtk8250_probe(struct platform_device *pdev)
 		err = mtk8250_probe_of(pdev, &uart.port, data);
 		if (err)
 			return err;
-	} else
+	} else if (!acpi_dev_handle) {
 		return -ENODEV;
+	}
 
 	spin_lock_init(&uart.port.lock);
 	uart.port.mapbase = regs->start;
@@ -562,14 +566,18 @@ static int mtk8250_probe(struct platform_device *pdev)
 	uart.port.startup = mtk8250_startup;
 	uart.port.set_termios = mtk8250_set_termios;
 	uart.port.uartclk = clk_get_rate(data->uart_clk);
+	if (!uart.port.uartclk)
+		uart.port.uartclk = 26 * HZ_PER_MHZ;
 #ifdef CONFIG_SERIAL_8250_DMA
 	if (data->dma)
 		uart.dma = data->dma;
 #endif
 
-	/* Disable Rate Fix function */
-	writel(0x0, uart.port.membase +
+	if (!acpi_dev_handle) {
+		/* Disable Rate Fix function */
+		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));
+	}
 
 	platform_set_drvdata(pdev, data);
 
@@ -647,11 +655,18 @@ static const struct of_device_id mtk8250_of_match[] = {
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
+		.acpi_match_table = mtk8250_acpi_match,
 	},
 	.probe			= mtk8250_probe,
 	.remove			= mtk8250_remove,
-- 
2.45.2


