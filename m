Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F04C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 02:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7IFbZVIyPVKWadnXb+iToLnqdSwPcwtFdqT4vEhn9U=; b=3YDsyocyGBprIodZZWWPxSOh4a
	MiPyf2Q5qVstTz7iqufo2rCkXfKUVEun7WccY+rf4d2tACrc0xSCSoe5QkY0dWacaNkriIh5F/aRz
	86ObF5XmG0Th91WzZ4xr11CesXtMc/l+OF3/n/nWAAzpBVvSsWLax0XEJ6qgwIQKpnH20Wha5l4HJ
	6++L3aHC+tb4OXPGXOIpqphsVfn0UQ7FqlqQcOHRctLcr62yEnNIvVUXB3IVaEazX+njxu3B3tEGS
	1co8flEmkyGeTtIm5Me2ISu5106b2EKTo/PsJvpiPHN8D4Q9oKVOpEOKobxDe/JeyQrI6pOVgMwc6
	AA1nNf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaX0-0000000Ae4j-3ts3;
	Mon, 05 Jan 2026 02:41:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaWw-0000000Ae3I-3QBq;
	Mon, 05 Jan 2026 02:41:16 +0000
X-UUID: fcb9af42e9df11f09f706fa2197c6ceb-20260104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=V7IFbZVIyPVKWadnXb+iToLnqdSwPcwtFdqT4vEhn9U=;
	b=Cm0NCZ5/0ilpflUNGGR2WF66zLHr3A46xiCnnCnfAVh6Bs+3GG62x273OExg9jdY7jHmDHVCi+6vAkZPMAN1EhnOHiT5J6lFhD3Cthxfag9ErotfcPxscQH+g/mVlHhRP6AwB1D02ZiKUU4TF1MfqHDYZ2I6rdgconSgq6AKJSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:487ceb38-55d3-4846-b122-a486fbf1bfd4,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:5047765,CLOUDID:88a3e4aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fcb9af42e9df11f09f706fa2197c6ceb-20260104
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1293559071; Sun, 04 Jan 2026 19:41:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:41:05 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 5 Jan 2026 10:41:05 +0800
Received: by mediatek.com (Postfix, from userid 10007317)
	id 0A1A6200C5; Mon,  5 Jan 2026 10:41:05 +0800 (CST)
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <jirislaby@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <zhiyong.tao@mediatek.com>,
	<fred2599@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Digits_Upstream_Group@mediatek.com>,
	<liguo.zhang@mediatek.com>, <Vasanth.Reddy@mediatek.com>, Yenchia Chen
	<yenchia.chen@mediatek.com>
Subject: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Date: Mon, 5 Jan 2026 10:39:55 +0800
Message-ID: <20260105024103.2027085-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
References: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_184114_916674_BADAC828 
X-CRM114-Status: GOOD (  17.38  )
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

From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>

Add ACPI support to 8250_mtk driver. This makes it possible to
use UART on ARM-based desktops with EDK2 UEFI firmware.

Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 5875a7b9b4b1..e6a56cf54ae0 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -19,6 +19,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/units.h>
 
 #include "8250.h"
 
@@ -521,6 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev)
 	struct mtk8250_data *data;
 	struct resource *regs;
 	int irq, err;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -543,12 +545,13 @@ static int mtk8250_probe(struct platform_device *pdev)
 
 	data->clk_count = 0;
 
-	if (pdev->dev.of_node) {
+	if (is_of_node(fwnode)) {
 		err = mtk8250_probe_of(pdev, &uart.port, data);
 		if (err)
 			return err;
-	} else
+	} else if (!fwnode) {
 		return -ENODEV;
+	}
 
 	spin_lock_init(&uart.port.lock);
 	uart.port.mapbase = regs->start;
@@ -564,14 +567,18 @@ static int mtk8250_probe(struct platform_device *pdev)
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
+	if (is_of_node(fwnode)) {
+		/* Disable Rate Fix function */
+		writel(0x0, uart.port.membase +
 			(MTK_UART_RATE_FIX << uart.port.regshift));
+	}
 
 	platform_set_drvdata(pdev, data);
 
@@ -649,11 +656,19 @@ static const struct of_device_id mtk8250_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk8250_of_match);
 
+static const struct acpi_device_id mtk8250_acpi_match[] = {
+	{ "MTKI0511" },
+	{ "NVDA0240" },
+	{}
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


