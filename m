Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBOkOGzq9eAsyuyfHS58FV6MWzBTMyrTjqjkESaOapk=; b=rGT6VZ0ThAlDoX1/GQHVm79deW
	iZaR05tKGgJP9OvRZZDnNu2iScQ+34zFXoWdJT19JE8rYcIY5/kut0WKmetgaWXsf/bNFqN3BR6au
	Z+eLhY2r7mbUk7XIMyyx29K60LWLcydO/qNBgcBXrQbgnbBxoAcqGFc6vJDO7B+CXM2KIngxHauHN
	6BkFR1eHLS4Dax2bdAxGen650uMg35gxdpWLAhwoR2TZ8wgWeL66ADP94O733Vqwf0JxpDet4k6yy
	YjuDcjdQ86On+mHGyGbzNnbH4ufJjsCBxVD3/WAKeyqne88MNBIlvdrCM+0+nIeJy49wKQVUcve/h
	CuETFffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2FB-00000005c4x-04R8;
	Tue, 25 Mar 2025 11:14:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx27k-00000005aX0-2F7W;
	Tue, 25 Mar 2025 11:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900830;
	bh=QrIl5wujkzjcHPNDdXMNdK1OJ8wNlQoBT9FNXDmGYlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0+Lksckft3pLt4+45W+sFn5rnMgtOuXkzhaPgsUpKT1ynvVwpZjwLJ+vt1qVyn11
	 BR2fcsZ2CTcaxgc3MMUO76m9gqRzYWDvrQJTSgcLD0ZFhFcndx/oyHGi8zr85fazSo
	 KLThF238LGBZP7yKEi2MFhT7ubh6F9MOiCe504G7/mx6dKaG8MZiJFSOPLDAYWDmAO
	 /GTbHMqaS8U8mGw/GT5ebXk6wFxOt9T9NcPv5IjCEwHlH8y6SU/8Dgek2JhdNzn+qB
	 bnHMVeNuiWzdld7A5CJx2Fl4fRSvlJ63fSVocP0y4Nk08etQg0erliH7bHggXSUx+V
	 VeiQd+sBmESHA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6032917E0A5C;
	Tue, 25 Mar 2025 12:07:10 +0100 (CET)
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
Subject: [PATCH 1/4] mmc: mtk-sd: Clarify patch bit register initialization and layout
Date: Tue, 25 Mar 2025 12:06:58 +0100
Message-ID: <20250325110701.52623-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040712_721987_15DD2256 
X-CRM114-Status: GOOD (  15.40  )
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

In preparation for cleaning up the msdc_init_hw register setting
for the patch bit registers, add the necessary definitions for
bits in the MSDC_PATCH_BIT and MSDC_PATCH_BIT1 registers and use
them in place of "magic numbers" writes during initialization.

This commit brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 61 +++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 345ea91629e0..04471a7ef078 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -233,7 +234,9 @@
 
 /* MSDC_PATCH_BIT mask */
 #define MSDC_PATCH_BIT_ODDSUPP    BIT(1)	/* RW */
+#define MSDC_PATCH_BIT_DIS_WRMON  BIT(2)	/* RW */
 #define MSDC_PATCH_BIT_RD_DAT_SEL BIT(3)	/* RW */
+#define MSDC_PATCH_BIT_DESCUP_SEL BIT(6)	/* RW */
 #define MSDC_INT_DAT_LATCH_CK_SEL GENMASK(9, 7)
 #define MSDC_CKGEN_MSDC_DLY_SEL   GENMASK(14, 10)
 #define MSDC_PATCH_BIT_IODSSEL    BIT(16)	/* RW */
@@ -246,10 +249,22 @@
 #define MSDC_PATCH_BIT_SPCPUSH    BIT(29)	/* RW */
 #define MSDC_PATCH_BIT_DECRCTMO   BIT(30)	/* RW */
 
-#define MSDC_PATCH_BIT1_CMDTA     GENMASK(5, 3)    /* RW */
+/* MSDC_PATCH_BIT1 mask */
+#define MSDC_PB1_WRDAT_CRC_TACNTR GENMASK(2, 0)     /* RW */
+#define MSDC_PATCH_BIT1_CMDTA     GENMASK(5, 3)     /* RW */
 #define MSDC_PB1_BUSY_CHECK_SEL   BIT(7)    /* RW */
 #define MSDC_PATCH_BIT1_STOP_DLY  GENMASK(11, 8)    /* RW */
-
+#define MSDC_PB1_DDR_CMD_FIX_SEL  BIT(14)           /* RW */
+#define MSDC_PB1_SINGLE_BURST     BIT(16)           /* RW */
+#define MSDC_PB1_RSVD20           GENMASK(18, 17)   /* RW */
+#define MSDC_PB1_AUTO_SYNCST_CLR  BIT(19)           /* RW */
+#define MSDC_PB1_MARK_POP_WATER   BIT(20)           /* RW */
+#define MSDC_PB1_LP_DCM_EN        BIT(21)           /* RW */
+#define MSDC_PB1_RSVD3            BIT(22)           /* RW */
+#define MSDC_PB1_AHB_GDMA_HCLK    BIT(23)           /* RW */
+#define MSDC_PB1_MSDC_CLK_ENFEAT  GENMASK(31, 24)   /* RW */
+
+/* MSDC_PATCH_BIT2 mask */
 #define MSDC_PATCH_BIT2_CFGRESP   BIT(15)   /* RW */
 #define MSDC_PATCH_BIT2_CFGCRCSTS BIT(28)   /* RW */
 #define MSDC_PB2_SUPPORT_64G      BIT(1)    /* RW */
@@ -1816,7 +1831,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 
 static void msdc_init_hw(struct msdc_host *host)
 {
-	u32 val;
+	u32 val, pb1_val;
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 	struct mmc_host *mmc = mmc_from_priv(host);
 
@@ -1869,9 +1884,43 @@ static void msdc_init_hw(struct msdc_host *host)
 	}
 	writel(0, host->base + MSDC_IOCON);
 	sdr_set_field(host->base + MSDC_IOCON, MSDC_IOCON_DDLSEL, 0);
-	writel(0x403c0046, host->base + MSDC_PATCH_BIT);
-	sdr_set_field(host->base + MSDC_PATCH_BIT, MSDC_CKGEN_MSDC_DLY_SEL, 1);
-	writel(0xffff4089, host->base + MSDC_PATCH_BIT1);
+
+	/* Enable odd number support for 8-bit data bus */
+	val = MSDC_PATCH_BIT_ODDSUPP;
+
+	/* Disable SD command register write monitor */
+	val |= MSDC_PATCH_BIT_DIS_WRMON;
+
+	/* Issue transfer done interrupt after GPD update */
+	val |= MSDC_PATCH_BIT_DESCUP_SEL;
+
+	/* Extend R1B busy detection delay (in clock cycles) */
+	val |= FIELD_PREP(MSDC_PATCH_BIT_BUSYDLY, 15);
+
+	/* Enable CRC phase timeout during data write operation */
+	val |= MSDC_PATCH_BIT_DECRCTMO;
+
+	/* Set CKGEN delay to one stage */
+	val |= FIELD_PREP(MSDC_CKGEN_MSDC_DLY_SEL, 1);
+	writel(val, host->base + MSDC_PATCH_BIT);
+
+	/* Set wr data, crc status, cmd response turnaround period for UHS104 */
+	pb1_val = FIELD_PREP(MSDC_PB1_WRDAT_CRC_TACNTR, 1);
+	pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_CMDTA, 1);
+	pb1_val |= MSDC_PB1_DDR_CMD_FIX_SEL;
+
+	/* Set single burst mode, auto sync state clear, block gap stop clk */
+	pb1_val |= MSDC_PB1_SINGLE_BURST | MSDC_PB1_RSVD20 |
+		   MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
+
+	/* Set low power DCM, use HCLK for GDMA, use MSDC CLK for everything else */
+	pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |
+		   MSDC_PB1_AHB_GDMA_HCLK | MSDC_PB1_MSDC_CLK_ENFEAT;
+
+	/* Enable R1b command busy check */
+	pb1_val |= MSDC_PB1_BUSY_CHECK_SEL;
+	writel(pb1_val, host->base + MSDC_PATCH_BIT1);
+
 	sdr_set_bits(host->base + EMMC50_CFG0, EMMC50_CFG_CFCSTS_SEL);
 
 	if (host->dev_comp->stop_clk_fix) {
-- 
2.48.1


