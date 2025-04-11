Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBF6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5tqHLMKf7g8Wxc9Q71D/XsmV0B59emr8eOs+ci5NQI=; b=4Z4qBOyEgFvTkGE3ghfzbVHVMC
	36paPcdDfC1ZljzmB3vMeZ7DlkIgAjzrSVlBWPztVrq9id3dKenElLQjwkqHm8uWF31s+9ub/42vD
	LjWQUkhVvXmDq2QcDC360g0iMNlcGk0zhBTSRghUb1oE/yrtku9dmpMLMdGt995lmQsUH9kAsREq8
	chwZmATYKUU3a/uOVaAG0pBirKd8trk3uFlfKmKNJA+i9xf95eTsSmlzopdBtsOQpw5P33yHI1n3F
	hV8EgFX03VVrsZqmitRUknUTtKaDITkAN8IwAlqjpDnGnweGj20lmCfxDo5b0m+CkKkKF+BwZCd82
	2hjTnXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37YW-0000000Cfbh-2X9S;
	Fri, 11 Apr 2025 06:08:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3797-0000000CZWP-2Iic;
	Fri, 11 Apr 2025 05:41:47 +0000
X-UUID: a4fad3f6169711f0a1e849db4cc18d44-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B5tqHLMKf7g8Wxc9Q71D/XsmV0B59emr8eOs+ci5NQI=;
	b=ZGSORI51ENGs8HTKctwhcJLU9SjYQXPhMCKsU0P5/Dp9cS32kGG1T0AKhZNeskanlGGicOVSESf9z9DJViPw3ROYboFuRqEYJ6qvWUxkGCImhqVR8WJG6d+6YBxW3fxPu7ixwrXQ1JCk3kX8HQ1ux5YmSgVmFbmfxrzzweaaVWY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:24edb5f2-bb47-4614-8789-180b6418674e,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:a00b1f8b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: a4fad3f6169711f0a1e849db4cc18d44-20250410
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1899495937; Thu, 10 Apr 2025 22:41:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 13:41:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 13:41:37 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<yong.mao@mediatek.com>, <qingliang.li@mediatek.com>,
	<andy-ld.lu@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Axe Yang <axe.yang@mediatek.com>
Subject: [RESEND v2] mmc: mtk-sd: Add condition to enable 'single' burst type
Date: Fri, 11 Apr 2025 13:40:25 +0800
Message-ID: <20250411054134.31822-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_224145_603361_83340699 
X-CRM114-Status: GOOD (  13.00  )
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

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


