Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5933CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ZJVgwaOEmWuvAFUsMPU8nXNUNjwYPv3DJJE1+Lxz7I=; b=2KnxB2gvJeZiwgjtMG70q5MgWZ
	QEyc8E0m8KH6Jrlx/zd7TcXtnQtyo7PAbePTkCH0wkuiGqCZFv+nPNsgXoklNCPs+DwsgJdJzeAnE
	TfXjVCapilTmmE/iMH01Lw2iLMpdiEr3jcJEN5fhLCimVGrSpfJqIassfMQYz8zycs1XsBRbSBIY3
	G/AT6vX0rg7YOIcpvaF//9AII6rTzi50UPnYPYWe/7IyCbfcnMQ2hG6sO6573J8ratgg8IVz0xpBu
	fdw5CvYHL+C+U0Xy9sofku+icabshSpZJV9ujq3Q9um//Ws7J60U5R7x25PVNGoTDVGLcaJSEaUz2
	zLh9Lg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylBr-0000000AH4G-1pmR;
	Wed, 17 Sep 2025 05:58:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylBo-0000000AH31-40aC;
	Wed, 17 Sep 2025 05:58:50 +0000
X-UUID: 5e180be0938b11f09f706fa2197c6ceb-20250916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9ZJVgwaOEmWuvAFUsMPU8nXNUNjwYPv3DJJE1+Lxz7I=;
	b=KTt3DBv4FvARppbruW1UeGOiaJ8IYvz+FSAnFAsuqOCcM/x+34JbHq40bF8KNPcE2o7+hpdKrFT/bAaY+qwDyz8u9JZ7lkNbZl+I2ix1Pg2NmzRlemAnvNv5RuPttsjI3ZBaHaAEmf4I5OYYMT/rBAaUUa0ooexYZQQu5G3ZHhY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:32ec768c-c574-4193-873d-05c879b833af,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:8452a46c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836,TC:-5,Content:0|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5e180be0938b11f09f706fa2197c6ceb-20250916
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1029000484; Tue, 16 Sep 2025 22:58:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 17 Sep 2025 13:58:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 17 Sep 2025 13:58:40 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Steven Liu <Steven.Liu@mediatek.com>, Sky Huang <Skylake.Huang@mediatek.com>,
	Tim Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH v2] spi: mt65xx: add dual and quad mode for standard spi device
Date: Wed, 17 Sep 2025 13:58:39 +0800
Message-ID: <20250917055839.500615-1-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_225849_004677_7A9B3B8E 
X-CRM114-Status: GOOD (  13.14  )
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

From: "Tim Kuo" <Tim.Kuo@mediatek.com>

Mediatek SPI hardware natively supports dual and quad modes, and these
modes are already enabled for SPI flash devices under spi-mem framework
in MTK SPI controller spi-mt65xx. However, other SPI devices, such as
touch panels, are limited to single mode because spi-mt65xx lacks SPI
mode argument parsing from SPI framework for these SPI devices outside
spi-mem framework.

This patch adds dual and quad mode support for these SPI devices by
introducing a new API, mtk_spi_set_nbits, for SPI mode argument parsing.

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
v2: remove ret and change to use fallthrough in switch

 drivers/spi/spi-mt65xx.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8a3c00c3af42..4b40985af1ea 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -563,6 +563,22 @@ static void mtk_spi_setup_packet(struct spi_controller *host)
 	writel(reg_val, mdata->base + SPI_CFG1_REG);
 }
 
+inline u32 mtk_spi_set_nbit(u32 nbit)
+{
+	switch (nbit) {
+	default:
+		pr_warn_once("unknown nbit mode %u. Falling back to single mode\n",
+			     nbit);
+		fallthrough;
+	case SPI_NBITS_SINGLE:
+		return 0x0;
+	case SPI_NBITS_DUAL:
+		return 0x1;
+	case SPI_NBITS_QUAD:
+		return 0x2;
+	}
+}
+
 static void mtk_spi_enable_transfer(struct spi_controller *host)
 {
 	u32 cmd;
@@ -729,10 +745,16 @@ static int mtk_spi_transfer_one(struct spi_controller *host,
 
 	/* prepare xfer direction and duplex mode */
 	if (mdata->dev_comp->ipm_design) {
-		if (!xfer->tx_buf || !xfer->rx_buf) {
+		if (xfer->tx_buf && xfer->rx_buf) {
+			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_EN;
+		} else if (xfer->tx_buf) {
+			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
+			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= mtk_spi_set_nbit(xfer->tx_nbits);
+		} else {
 			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
-			if (xfer->rx_buf)
-				reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
+			reg_val |= mtk_spi_set_nbit(xfer->rx_nbits);
 		}
 		writel(reg_val, mdata->base + SPI_CFG3_IPM_REG);
 	}
-- 
2.45.2


