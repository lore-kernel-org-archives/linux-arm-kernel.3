Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B11C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WybDfgc0VE0aEGQYbP8Mz6EKmsA36v7iBgjxM9zphZs=; b=B2flDp9XGgv+5kPpZUfXg+tg2B
	+aCEDPf732kIY2vSeGsydEwrrA9X6hZ2OxUtPoQGU27xRiSX342alD0TJ9x6+3m3p6FtkGmYYk7g9
	bRHXWvrTxjpqwXIbJpdfS1799aYvK2I7KpSlAmeFjUxs7fI/+wbTo+AM1K9r64R+QjJKwYnT8pa/e
	MydDou4CXDQ/60R6pyQmbcTthv05hDF5FBzrXQIz0Ol65OiF1VAiBiIFk20ffeWSguqcF1sRREKDk
	DSL9KDAohS+SNQJCRPKAo88gLRQd/16KarXF1PCxspaCKATpfW/qX08P+fuvIhlcj9xSurdqJGk9f
	XJtf0PzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2KG-00000005cn7-1ZQd;
	Tue, 25 Mar 2025 11:20:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx27m-00000005aY5-3Dt5;
	Tue, 25 Mar 2025 11:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742900833;
	bh=tQdqC3X/w6Ew7CJsG7Mg8Rjon894mVM5eCrZJ+b+ETk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QmByxQk8kS9IT0dTWY5RsURyRDWudypZFoLsYt8y4lxb09ejm44kEWdATNUdb27x7
	 rGaZCQje0IBK2monEAqbMgpmVpFkZW3Ip6VUnE2aQUiLud/KHH9TPv2fP4s4WHOQfQ
	 cRDng2Spse7Xm0uwigQPOuIfxtLvrg8curOxeY+ETMZEJb5ahA9jH4kuBrugSeAEMR
	 N94MoFIlyfzGmmbOhu0BXIql/+6SBuoGbzu+W0see4aIuQOWOJKL7PIUQ4DmKaq6k+
	 qliaRRU340r0Dolvh+/1m8uTLLXUJQZG/096I8+q4V7JwYx0jWp5KWTRe5FMdeQeEU
	 PczIurXzbt+7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F25C17E0FD1;
	Tue, 25 Mar 2025 12:07:12 +0100 (CET)
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
Subject: [PATCH 4/4] mmc: mtk-sd: Aggregate R/W for top_base iospace case where possible
Date: Tue, 25 Mar 2025 12:07:01 +0100
Message-ID: <20250325110701.52623-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040715_166325_44A181C7 
X-CRM114-Status: GOOD (  12.49  )
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

In case the controller uses the top_base iospace, most register
read/writes can be changed from multiple RWs to a single read
and a single write.

Where possible, and where it makes sense, aggregate the multiple
reads and writes to just one.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 52 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index e9e84b9a65f0..ceeae1aeac94 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1975,18 +1975,19 @@ static void msdc_init_hw(struct msdc_host *host)
 
 	if (host->dev_comp->data_tune) {
 		if (host->top_base) {
-			sdr_set_bits(host->top_base + EMMC_TOP_CONTROL,
-				     PAD_DAT_RD_RXDLY_SEL);
-			sdr_clr_bits(host->top_base + EMMC_TOP_CONTROL,
-				     DATA_K_VALUE_SEL);
-			sdr_set_bits(host->top_base + EMMC_TOP_CMD,
-				     PAD_CMD_RD_RXDLY_SEL);
+			u32 top_ctl_val = readl(host->top_base + EMMC_TOP_CONTROL);
+			u32 top_cmd_val = readl(host->top_base + EMMC_TOP_CMD);
+
+			top_cmd_val |= PAD_CMD_RD_RXDLY_SEL;
+			top_ctl_val |= PAD_DAT_RD_RXDLY_SEL;
+			top_ctl_val &= ~DATA_K_VALUE_SEL;
 			if (host->tuning_step > PAD_DELAY_HALF) {
-				sdr_set_bits(host->top_base + EMMC_TOP_CONTROL,
-					     PAD_DAT_RD_RXDLY2_SEL);
-				sdr_set_bits(host->top_base + EMMC_TOP_CMD,
-					     PAD_CMD_RD_RXDLY2_SEL);
+				top_cmd_val |= PAD_CMD_RD_RXDLY2_SEL;
+				top_ctl_val |= PAD_DAT_RD_RXDLY2_SEL;
 			}
+
+			writel(top_ctl_val, host->top_base + EMMC_TOP_CONTROL);
+			writel(top_cmd_val, host->top_base + EMMC_TOP_CMD);
 		} else {
 			sdr_set_bits(host->base + tune_reg,
 				     MSDC_PAD_TUNE_RD_SEL |
@@ -2196,15 +2197,17 @@ static inline void msdc_set_cmd_delay(struct msdc_host *host, u32 value)
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 
 	if (host->top_base) {
+		u32 regval = readl(host->top_base + EMMC_TOP_CMD);
+
+		regval &= ~(PAD_CMD_RXDLY | PAD_CMD_RXDLY2);
+
 		if (value < PAD_DELAY_HALF) {
-			sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY, value);
-			sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY2, 0);
+			regval |= FIELD_PREP(PAD_CMD_RXDLY, value);
 		} else {
-			sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY,
-				      PAD_DELAY_HALF - 1);
-			sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY2,
-				      value - PAD_DELAY_HALF);
+			regval |= FIELD_PREP(PAD_CMD_RXDLY, PAD_DELAY_HALF - 1);
+			regval |= FIELD_PREP(PAD_CMD_RXDLY2, value - PAD_DELAY_HALF);
 		}
+		writel(regval, host->top_base + EMMC_TOP_CMD);
 	} else {
 		if (value < PAD_DELAY_HALF) {
 			sdr_set_field(host->base + tune_reg, MSDC_PAD_TUNE_CMDRDLY, value);
@@ -2224,17 +2227,18 @@ static inline void msdc_set_data_delay(struct msdc_host *host, u32 value)
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 
 	if (host->top_base) {
+		u32 regval = readl(host->top_base + EMMC_TOP_CONTROL);
+
+		regval &= ~(PAD_DAT_RD_RXDLY | PAD_DAT_RD_RXDLY2);
+
 		if (value < PAD_DELAY_HALF) {
-			sdr_set_field(host->top_base + EMMC_TOP_CONTROL,
-				      PAD_DAT_RD_RXDLY, value);
-			sdr_set_field(host->top_base + EMMC_TOP_CONTROL,
-				      PAD_DAT_RD_RXDLY2, 0);
+			regval |= FIELD_PREP(PAD_DAT_RD_RXDLY, value);
+			regval |= FIELD_PREP(PAD_DAT_RD_RXDLY2, value);
 		} else {
-			sdr_set_field(host->top_base + EMMC_TOP_CONTROL,
-				      PAD_DAT_RD_RXDLY, PAD_DELAY_HALF - 1);
-			sdr_set_field(host->top_base + EMMC_TOP_CONTROL,
-				      PAD_DAT_RD_RXDLY2, value - PAD_DELAY_HALF);
+			regval |= FIELD_PREP(PAD_DAT_RD_RXDLY, PAD_DELAY_HALF - 1);
+			regval |= FIELD_PREP(PAD_DAT_RD_RXDLY2, value - PAD_DELAY_HALF);
 		}
+		writel(regval, host->top_base + EMMC_TOP_CONTROL);
 	} else {
 		if (value < PAD_DELAY_HALF) {
 			sdr_set_field(host->base + tune_reg, MSDC_PAD_TUNE_DATRRDLY, value);
-- 
2.48.1


