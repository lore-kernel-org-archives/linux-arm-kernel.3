Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1D3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tvm+drxaFLk25NxNGK6leQFz6UBSeg5ou+cb6osDu1M=; b=s3s4r8T8E4H5b2LmZyoZbO6NS0
	zWWUTBlyNH1mrwgdX5hWmEUCW/r0S+OQ2TnJJlQwAO7Nv2eZz71zfwX5IWasTSxAWY6/Lq7Tq+7iE
	6uqoPwlloGJUtBkZA7JTwQlZxtO7TqlFzVqZnx3WBcTPfKCjNjZ/F/aMH56EDS1igZTrFbVN1akDB
	rxyoOcxUnxRzR2iEHN3XcGjn4oRKLisa1AyGNyLQy5kuiVC4VuE5Ew+dkx5wq3hxUtmwDUnJE61Do
	Z5LM6f1T/CurSl+Rd93GbFyg0gkmuKhnUA4/BmgY9v0kIOLwjNjLon02WPNUbz+ekL6j21tYESrFa
	g41Gxaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nKC-00000009l0p-0d0W;
	Thu, 10 Apr 2025 08:31:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mj2-00000009dMp-0cY1;
	Thu, 10 Apr 2025 07:53:29 +0000
X-UUID: df02cfde15e011f083f2a1c9db70dae0-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tvm+drxaFLk25NxNGK6leQFz6UBSeg5ou+cb6osDu1M=;
	b=MZhgFVaZA4LfxPGca9jXrpLBNGPxDIGUR/fdehXTmMQ8KFzpTSlax7L+ECgI/atLDTR5hQM6s97gVjl0FzNfuq1VvL1lMwIBFZ8Fm6UE1us4Qa0RxQ1gFY9HMTLPJezGY21jRzblIDHhJ/pNmKt6Rh5FY4HcHCbPe1Yp77AcPvs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:57ba4899-2c96-4fea-a015-5b9c42b08dae,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:2413e9a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: df02cfde15e011f083f2a1c9db70dae0-20250410
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1560231312; Thu, 10 Apr 2025 00:53:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 15:53:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 15:53:17 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<yong.mao@mediatek.com>, <qingliang.li@mediatek.com>,
	<andy-ld.lu@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Axe Yang <axe.yang@mediatek.com>
Subject: [PATCH v2] mmc: mtk-sd: Add condition to enable 'single' burst type
Date: Thu, 10 Apr 2025 15:52:47 +0800
Message-ID: <20250410075314.6439-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_005328_188939_36D50544 
X-CRM114-Status: GOOD (  13.17  )
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

This change add a condition for 'single' burst type selection.

Read AXI_LEN field from EMMC50_CFG2(AHB2AXI wrapper) register, if the
value is not 0, it means the HWIP is using AXI as AMBA bus, which do
not support 'single' burst type.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
This change dependents on 'mmc: mtk-sd: Cleanups for register R/W':

https://patchwork.kernel.org/project/linux-mediatek/cover/20250325110701.52623-1-angelogioacchino.delregno@collabora.com/
---
 drivers/mmc/host/mtk-sd.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index ceeae1aeac94..2e4bd5166c17 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -84,6 +84,7 @@
 #define EMMC51_CFG0	 0x204
 #define EMMC50_CFG0      0x208
 #define EMMC50_CFG1      0x20c
+#define EMMC50_CFG2      0x21c
 #define EMMC50_CFG3      0x220
 #define SDC_FIFO_CFG     0x228
 #define CQHCI_SETTING	 0x7fc
@@ -306,7 +307,10 @@
 /* EMMC50_CFG1 mask */
 #define EMMC50_CFG1_DS_CFG        BIT(28)  /* RW */
 
-#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)  /* RW */
+/* EMMC50_CFG2 mask */
+#define EMMC50_CFG2_AXI_SET_LEN   GENMASK(27, 24) /* RW */
+
+#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)   /* RW */
 
 #define SDC_FIFO_CFG_WRVALIDSEL   BIT(24)  /* RW */
 #define SDC_FIFO_CFG_RDVALIDSEL   BIT(25)  /* RW */
@@ -1917,9 +1921,13 @@ static void msdc_init_hw(struct msdc_host *host)
 	pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_CMDTA, 1);
 	pb1_val |= MSDC_PB1_DDR_CMD_FIX_SEL;
 
-	/* Set single burst mode, auto sync state clear, block gap stop clk */
-	pb1_val |= MSDC_PB1_SINGLE_BURST | MSDC_PB1_RSVD20 |
-		   MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
+	/* Support 'single' burst type only when AXI_LEN is 0 */
+	sdr_get_field(host->base + EMMC50_CFG2, EMMC50_CFG2_AXI_SET_LEN, &val);
+	if (!val)
+		pb1_val |= MSDC_PB1_SINGLE_BURST;
+
+	/* Set auto sync state clear, block gap stop clk */
+	pb1_val |= MSDC_PB1_RSVD20 | MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
 
 	/* Set low power DCM, use HCLK for GDMA, use MSDC CLK for everything else */
 	pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |
-- 
2.46.0


