Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A0EC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Y2ZyGTQmSSDnhgpeXztWXterlCb8p1VI1fd4ZlKGko=; b=uWiFKKJsh61rQbvIlkwIaoNOz5
	BEUXpDPySxRIDZ8/tQTJ2/QRJm4wDn45lRQgZRIu5wN1t21tcmycBRXIDMYWNbuoX6zWujJOQ8Dy9
	apsQEwhy3PI3OIP9p4C+QoLanmaNZz8NXhHm+XwDAClnYq6dBmrGDgceEzgd3Nn+cYLmtU0MJr4jl
	beObkn48JI8pinc9vWoNb5MJP5pfubdkymW/vP52FuZhrpUJDUaPPdyu49dXIMsrfxg89tYZe6fmJ
	IjfhQd/rR4xt4q0Up30Tr1Tmp23ZB+Y64FtJhnkvLt77rm6RXSXFrJK5iy8GMKNp62fWJjdGL01MA
	hvamV/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taruz-0000000BtvM-3956;
	Thu, 23 Jan 2025 07:46:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarte-0000000Btkv-2iXr;
	Thu, 23 Jan 2025 07:45:03 +0000
X-UUID: f0a3fa5cd95d11ef82ff63e91e7eb18c-20250123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2Y2ZyGTQmSSDnhgpeXztWXterlCb8p1VI1fd4ZlKGko=;
	b=lGyADgYPxHJ7/qCbXHQYMFk/R6kf1t2HPiuuYfHB8PWlPYgEpMB/luRgWnQQH/ekXPJC6/hPruRR/nhyJvclXKnnanjb87IIuWttLOKCszAYiC/YsffRt5Y27u89m35HshLvSplOOk4tX39nTN7ejCE6n7H9luTOsy7HHlClKUU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:fefd1767-9520-44e4-9253-0b49728985c0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:984a933d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f0a3fa5cd95d11ef82ff63e91e7eb18c-20250123
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2122581583; Thu, 23 Jan 2025 00:44:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 Jan 2025 15:44:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 23 Jan 2025 15:44:53 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH] mmc: mtk-sd: optimize register settings for hs400(es) mode
Date: Thu, 23 Jan 2025 15:44:32 +0800
Message-ID: <20250123074442.1617-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_234502_711536_E9375074 
X-CRM114-Status: GOOD (  14.85  )
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

For hs400(es) mode, the 'hs400-ds-delay' is typically configured in the
dts. However, some projects may only define 'mediatek,hs400-ds-dly3',
which can lead to initialization failures in hs400es mode. CMD13 reported
response crc error in the mmc_switch_status() just after switching to
hs400es mode.

[    1.914038][   T82] mmc0: mmc_select_hs400es failed, error -84
[    1.914954][   T82] mmc0: error -84 whilst initialising MMC card

Currently, the hs400_ds_dly3 value is set within the tuning function. This
means that the PAD_DS_DLY3 field is not configured before tuning process,
which is the reason for the above-mentioned CMD13 response crc error.

Move the PAD_DS_DLY3 field configuration into msdc_prepare_hs400_tuning(),
and add a value check of hs400_ds_delay to prevent overwriting by zero when
the 'hs400-ds-delay' is not set in the dts. In addition, since hs400(es)
only tune the PAD_DS_DLY1, the PAD_DS_DLY2_SEL bit should be cleared to
bypass it.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4b6e91372526..4e3e31ddf84b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -273,6 +273,7 @@
 #define MSDC_PAD_TUNE_CMD2_SEL	  BIT(21)   /* RW */
 
 #define PAD_DS_TUNE_DLY_SEL       BIT(0)	  /* RW */
+#define PAD_DS_TUNE_DLY2_SEL      BIT(1)	  /* RW */
 #define PAD_DS_TUNE_DLY1	  GENMASK(6, 2)   /* RW */
 #define PAD_DS_TUNE_DLY2	  GENMASK(11, 7)  /* RW */
 #define PAD_DS_TUNE_DLY3	  GENMASK(16, 12) /* RW */
@@ -317,9 +318,10 @@
 #define PAD_CMD_TX_DLY          GENMASK(16, 12)	/* RW */
 
 /* EMMC50_PAD_DS_TUNE mask */
-#define PAD_DS_DLY_SEL		BIT(16)	/* RW */
-#define PAD_DS_DLY1		GENMASK(14, 10)	/* RW */
-#define PAD_DS_DLY3		GENMASK(4, 0)	/* RW */
+#define PAD_DS_DLY_SEL          BIT(16) /* RW */
+#define PAD_DS_DLY2_SEL         BIT(15) /* RW */
+#define PAD_DS_DLY1             GENMASK(14, 10) /* RW */
+#define PAD_DS_DLY3             GENMASK(4, 0)   /* RW */
 
 /* LOOP_TEST_CONTROL mask */
 #define TEST_LOOP_DSCLK_MUX_SEL        BIT(0)	/* RW */
@@ -2504,13 +2506,23 @@ static int msdc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 static int msdc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct msdc_host *host = mmc_priv(mmc);
+
 	host->hs400_mode = true;
 
-	if (host->top_base)
-		writel(host->hs400_ds_delay,
-		       host->top_base + EMMC50_PAD_DS_TUNE);
-	else
-		writel(host->hs400_ds_delay, host->base + PAD_DS_TUNE);
+	if (host->top_base) {
+		if (host->hs400_ds_dly3)
+			sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
+				      PAD_DS_DLY3, host->hs400_ds_dly3);
+		if (host->hs400_ds_delay)
+			writel(host->hs400_ds_delay,
+			       host->top_base + EMMC50_PAD_DS_TUNE);
+	} else {
+		if (host->hs400_ds_dly3)
+			sdr_set_field(host->base + PAD_DS_TUNE,
+				      PAD_DS_TUNE_DLY3, host->hs400_ds_dly3);
+		if (host->hs400_ds_delay)
+			writel(host->hs400_ds_delay, host->base + PAD_DS_TUNE);
+	}
 	/* hs400 mode must set it to 0 */
 	sdr_clr_bits(host->base + MSDC_PATCH_BIT2, MSDC_PATCH_BIT2_CFGCRCSTS);
 	/* to improve read performance, set outstanding to 2 */
@@ -2530,14 +2542,11 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
 	if (host->top_base) {
 		sdr_set_bits(host->top_base + EMMC50_PAD_DS_TUNE,
 			     PAD_DS_DLY_SEL);
-		if (host->hs400_ds_dly3)
-			sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
-				      PAD_DS_DLY3, host->hs400_ds_dly3);
+		sdr_clr_bits(host->top_base + EMMC50_PAD_DS_TUNE,
+			     PAD_DS_DLY2_SEL);
 	} else {
 		sdr_set_bits(host->base + PAD_DS_TUNE, PAD_DS_TUNE_DLY_SEL);
-		if (host->hs400_ds_dly3)
-			sdr_set_field(host->base + PAD_DS_TUNE,
-				      PAD_DS_TUNE_DLY3, host->hs400_ds_dly3);
+		sdr_clr_bits(host->base + PAD_DS_TUNE, PAD_DS_TUNE_DLY2_SEL);
 	}
 
 	host->hs400_tuning = true;
-- 
2.46.0


