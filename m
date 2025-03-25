Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1593C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubaMGPnEjTcNFDPrGhYRxcSYj8cS6K7uRbqA7+I2BAk=; b=OR9rVeC/gDU4O82qgi8aK/BJJR
	j7WhRHUvSYtdnUlbg+beddFfw4u3eoc079zLcVPnjKzkeF2hBTvH5bCw3dj8aRUJZ7dRx+7/yec1m
	3kXjt8jaSs2rZ8o1DC+P6IvaKamqjIdNKPVBc6nnGXVp+IwSPJbca94jBiL/QQjpfg/0u6MAp6Fc4
	zm+VyiYwGBnvzHmHrydNJgTGRDL8RgWzMXVKtMEjOUd9rbTTN6wmNjC+Z7HQS6K+usH5/JOdUPb3E
	Vo4Qw6N5IQ5Wh9FreSxevjyKz2s6vG7AF8Ho/m+jHCEXV4h9Kh0CLl2jMc8Q3ppcZcTssSusNCl90
	q84jX1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2Gs-00000005cN2-0EnJ;
	Tue, 25 Mar 2025 11:16:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx27l-00000005aX4-0MSf;
	Tue, 25 Mar 2025 11:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900831;
	bh=EJdSzfZwZOBB292ZrpiQmJ4cVNNUO5nAe/Se63pMDy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niYJ4u3P3G3wTwMoAVUcd7MHoT4qsho6sK5tOVJov8s5GKYEDAbGU9ghFiD11eR/I
	 AZVC3R7j+4xIjZjFK7M1rqOwh99H34X4ayll5Wm0MsteSxrBBc28qz/LUw47RO+t2m
	 +yRa9+ZIXS0XcEMaQhXCMp6KvvDITgASaQCv/TYOW9TQJK/ynDSobjnCDKnaK6mzs6
	 CI7SqIaFfQGKGWsBT4Ihq5LlimlKaDA79ZwG3plyKTFV+Z4lCG5JsMgAjqwfQriMCv
	 rX5K87+qCXd++dDpbmGwLhvnQ2YXLljaeWJBMxZTVRhK7yBJuP9tFRVnUiReFlW4hM
	 yBNokt/pl655Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 218D017E0A80;
	Tue, 25 Mar 2025 12:07:11 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chaotian.jing@mediatek.com
Cc: ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	axe.yang@mediatek.com
Subject: [PATCH 2/4] mmc: mtk-sd: Aggregate writes for MSDC_PATCH_BIT1/2 setup
Date: Tue, 25 Mar 2025 12:06:59 +0100
Message-ID: <20250325110701.52623-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040713_277169_8A93C6A7 
X-CRM114-Status: GOOD (  16.67  )
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

Instead of continuously reading and writing to the patch bit 1/2
registers, prepare the final values to write to those and write
just once per register during the setup phase.

This makes the driver slightly smaller and also slightly improves
the execution time of the msdc_init_hw function, called not only
at probe time, but also when resuming from system suspend.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 85 +++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 04471a7ef078..dd3f7468d32c 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1831,7 +1831,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 
 static void msdc_init_hw(struct msdc_host *host)
 {
-	u32 val, pb1_val;
+	u32 val, pb1_val, pb2_val;
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 	struct mmc_host *mmc = mmc_from_priv(host);
 
@@ -1885,6 +1885,13 @@ static void msdc_init_hw(struct msdc_host *host)
 	writel(0, host->base + MSDC_IOCON);
 	sdr_set_field(host->base + MSDC_IOCON, MSDC_IOCON_DDLSEL, 0);
 
+	/*
+	 * Patch bit 0 and 1 are completely rewritten, but for patch bit 2
+	 * defaults are retained and, if necessary, only some bits are fixed
+	 * up: read the PB2 register here for later usage in this function.
+	 */
+	pb2_val = readl(host->base + MSDC_PATCH_BIT2);
+
 	/* Enable odd number support for 8-bit data bus */
 	val = MSDC_PATCH_BIT_ODDSUPP;
 
@@ -1902,6 +1909,8 @@ static void msdc_init_hw(struct msdc_host *host)
 
 	/* Set CKGEN delay to one stage */
 	val |= FIELD_PREP(MSDC_CKGEN_MSDC_DLY_SEL, 1);
+
+	/* First MSDC_PATCH_BIT setup is done: pull the trigger! */
 	writel(val, host->base + MSDC_PATCH_BIT);
 
 	/* Set wr data, crc status, cmd response turnaround period for UHS104 */
@@ -1917,58 +1926,54 @@ static void msdc_init_hw(struct msdc_host *host)
 	pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |
 		   MSDC_PB1_AHB_GDMA_HCLK | MSDC_PB1_MSDC_CLK_ENFEAT;
 
-	/* Enable R1b command busy check */
-	pb1_val |= MSDC_PB1_BUSY_CHECK_SEL;
-	writel(pb1_val, host->base + MSDC_PATCH_BIT1);
-
-	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
+	/* If needed, enable R1b command busy check at controller init time */
+	if (!host->dev_comp->busy_check)
+		pb1_val |= MSDC_PB1_BUSY_CHECK_SEL;
 
 	if (host->dev_comp->stop_clk_fix) {
 		if (host->dev_comp->stop_dly_sel)
-			sdr_set_field(host->base + MSDC_PATCH_BIT1,
-				      MSDC_PATCH_BIT1_STOP_DLY,
-				      host->dev_comp->stop_dly_sel);
+			pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_STOP_DLY,
+					      host->dev_comp->stop_dly_sel);
 
-		if (host->dev_comp->pop_en_cnt)
-			sdr_set_field(host->base + MSDC_PATCH_BIT2,
-				      MSDC_PB2_POP_EN_CNT,
-				      host->dev_comp->pop_en_cnt);
+		if (host->dev_comp->pop_en_cnt) {
+			pb2_val &= ~MSDC_PB2_POP_EN_CNT;
+			pb2_val |= FIELD_PREP(MSDC_PB2_POP_EN_CNT,
+					      host->dev_comp->pop_en_cnt);
+		}
 
-		sdr_clr_bits(host->base + SDC_FIFO_CFG,
-			     SDC_FIFO_CFG_WRVALIDSEL);
-		sdr_clr_bits(host->base + SDC_FIFO_CFG,
-			     SDC_FIFO_CFG_RDVALIDSEL);
+		sdr_clr_bits(host->base + SDC_FIFO_CFG, SDC_FIFO_CFG_WRVALIDSEL);
+		sdr_clr_bits(host->base + SDC_FIFO_CFG, SDC_FIFO_CFG_RDVALIDSEL);
 	}
 
-	if (host->dev_comp->busy_check)
-		sdr_clr_bits(host->base + MSDC_PATCH_BIT1, BIT(7));
-
 	if (host->dev_comp->async_fifo) {
-		sdr_set_field(host->base + MSDC_PATCH_BIT2,
-			      MSDC_PB2_RESPWAIT, 3);
-		if (host->dev_comp->enhance_rx) {
-			if (host->top_base)
-				sdr_set_bits(host->top_base + EMMC_TOP_CONTROL,
-					     SDC_RX_ENH_EN);
-			else
-				sdr_set_bits(host->base + SDC_ADV_CFG0,
-					     SDC_RX_ENHANCE_EN);
+		/* Set CMD response timeout multiplier to 65 + (16 * 3) cycles */
+		pb2_val &= ~MSDC_PB2_RESPWAIT;
+		pb2_val |= FIELD_PREP(MSDC_PB2_RESPWAIT, 3);
+
+		/* eMMC4.5: Select async FIFO path for CMD resp and CRC status */
+		pb2_val &= ~MSDC_PATCH_BIT2_CFGRESP;
+		pb2_val |= MSDC_PATCH_BIT2_CFGCRCSTS;
+
+		if (!host->dev_comp->enhance_rx) {
+			/* eMMC4.5: Delay 2T for CMD resp and CRC status EN signals */
+			pb2_val &= ~(MSDC_PB2_RESPSTSENSEL | MSDC_PB2_CRCSTSENSEL);
+			pb2_val |= FIELD_PREP(MSDC_PB2_RESPSTSENSEL, 2);
+			pb2_val |= FIELD_PREP(MSDC_PB2_CRCSTSENSEL, 2);
+		} else if (host->top_base) {
+			sdr_set_bits(host->top_base + EMMC_TOP_CONTROL, SDC_RX_ENH_EN);
 		} else {
-			sdr_set_field(host->base + MSDC_PATCH_BIT2,
-				      MSDC_PB2_RESPSTSENSEL, 2);
-			sdr_set_field(host->base + MSDC_PATCH_BIT2,
-				      MSDC_PB2_CRCSTSENSEL, 2);
+			sdr_set_bits(host->base + SDC_ADV_CFG0, SDC_RX_ENHANCE_EN);
 		}
-		/* use async fifo, then no need tune internal delay */
-		sdr_clr_bits(host->base + MSDC_PATCH_BIT2,
-			     MSDC_PATCH_BIT2_CFGRESP);
-		sdr_set_bits(host->base + MSDC_PATCH_BIT2,
-			     MSDC_PATCH_BIT2_CFGCRCSTS);
 	}
 
 	if (host->dev_comp->support_64g)
-		sdr_set_bits(host->base + MSDC_PATCH_BIT2,
-			     MSDC_PB2_SUPPORT_64G);
+		pb2_val |= MSDC_PB2_SUPPORT_64G;
+
+	/* Patch Bit 1/2 setup is done: pull the trigger! */
+	writel(pb1_val, host->base + MSDC_PATCH_BIT1);
+	writel(pb2_val, host->base + MSDC_PATCH_BIT2);
+	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
+
 	if (host->dev_comp->data_tune) {
 		if (host->top_base) {
 			sdr_set_bits(host->top_base + EMMC_TOP_CONTROL,
-- 
2.48.1


