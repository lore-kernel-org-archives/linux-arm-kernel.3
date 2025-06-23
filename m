Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE59C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wvukqt6WPdDilocTVu880/Y2Tl917XePP4Ut+N6+44=; b=x0beUXeU3KpmyATOwEEN71cb2Q
	W0Fphn8N6DLYmtAjgcGiafbzPdwfKVisdSrqnLE2oNH90IkOrUoDr5aMLUz8i5cruzUuMyFwPfIFK
	Hgu3rdNhm/t4b8oHuFYMv6RY2tICBGQ+B0ZW2Y5wjXbLX5prbiRUmQ9WKxWPoIuAMDGtEvvdRYmE9
	LhDW5mUFZmyjLPF5Cwp1KBJA6Bb98DIArL1u52W61+pagUCqJKMl06HAbMtuzvEoknyawhcyqKIdJ
	8pmMNPePcpVHT27Vp9RHHuS5kqhRHLqCzGhKk4kLFRpmwS1TQyAkZApE0E3N0FfXuRMqoKoPox1Pz
	5SFxEtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThRY-00000002uHe-3YWF;
	Mon, 23 Jun 2025 13:42:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqm-00000002adl-434E;
	Mon, 23 Jun 2025 12:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680035;
	bh=WdgRym+rs2N8cx2EBLq0NFaaKh9pfeQf1rK27XSLT/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8gbgihnPR/z9b6f+HcS1fUqJfzmDv6PJeKKRt1KoOXViS9+DttsVnz7a780IeqNN
	 YyBVV6ecR347YysfAsyDhGI2xvxFFNWCuwIkTh+5ZfkYpM63sHMu63ByKuXqP5jhCn
	 5L72yweadIWU/f6v08ep86ngGZOFNt4lv3PRjtec36RfivB3sOCePJYt80ygQvjHnt
	 7rXKPoeUb7FBq6aNoffrbVRUP6vcCf98nPYPxK2iR4ZW30eTlJI7aWk29OyZaA4O2N
	 w2etsDlPmiPw28QkE8uQ9xzIxY1h5C4o95Z02EkbV/difEE3bJJhtLrd4XjXUeTebl
	 NNq7ksOHk0Tyg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A92A217E0202;
	Mon, 23 Jun 2025 14:00:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/5] iio: adc: mt6359: Add ready register index and mask to channel data
Date: Mon, 23 Jun 2025 14:00:26 +0200
Message-ID: <20250623120028.108809-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050037_184348_CA1C0FEF 
X-CRM114-Status: GOOD (  15.96  )
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

In preparation for adding support for the AUXADC block found in
the MT6363 PMIC, add the ready register index and mask to the
mtk_pmic_auxadc_chan structure, populate those in the channel
description for all of the already supported SoCs and make use
of them in the .read_imp() callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 118 ++++++++++++++++++--------------
 1 file changed, 65 insertions(+), 53 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index eecf88b05c6f..ae7b65f5f551 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -101,12 +101,16 @@ struct mt6359_auxadc {
  * struct mtk_pmic_auxadc_chan - PMIC AUXADC channel data
  * @req_idx:       Request register number
  * @req_mask:      Bitmask to activate a channel
+ * @rdy_idx:       Readiness register number
+ * @rdy_mask:      Bitmask to determine channel readiness
  * @num_samples:   Number of AUXADC samples for averaging
  * @r_ratio:       Resistance ratio fractional
  */
 struct mtk_pmic_auxadc_chan {
 	u8 req_idx;
 	u16 req_mask;
+	u8 rdy_idx;
+	u16 rdy_mask;
 	u16 num_samples;
 	struct u8_fract r_ratio;
 };
@@ -130,13 +134,17 @@ struct mtk_pmic_auxadc_info {
 	const u16 *regs;
 	u16 sec_unlock_key;
 	u8 imp_adc_num;
-	int (*read_imp)(struct mt6359_auxadc *adc_dev, int *vbat, int *ibat);
+	int (*read_imp)(struct mt6359_auxadc *adc_dev,
+			const struct iio_chan_spec *chan, int *vbat, int *ibat);
 };
 
-#define MTK_PMIC_ADC_CHAN(_ch_idx, _req_idx, _req_bit, _samples, _rnum, _rdiv)	\
+#define MTK_PMIC_ADC_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
+			  _samples, _rnum, _rdiv)				\
 	[PMIC_AUXADC_CHAN_##_ch_idx] = {					\
 		.req_idx = _req_idx,						\
 		.req_mask = BIT(_req_bit),					\
+		.rdy_idx = _rdy_idx,						\
+		.rdy_mask = BIT(_rdy_bit),					\
 		.num_samples = _samples,					\
 		.r_ratio = { _rnum, _rdiv }					\
 	}
@@ -177,21 +185,21 @@ static const struct iio_chan_spec mt6357_auxadc_channels[] = {
 };
 
 static const struct mtk_pmic_auxadc_chan mt6357_auxadc_ch_desc[] = {
-	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(ISENSE, PMIC_AUXADC_RQST0, 0, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, 128, 1, 1),
-	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, 256, 1, 1),
-	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, 16, 1, 1),
-	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 5, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 6, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
+	MTK_PMIC_ADC_CHAN(ISENSE, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
+	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, PMIC_AUXADC_IMP0, 8, 128, 1, 1),
+	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, PMIC_AUXADC_IMP0, 8, 256, 1, 1),
+	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, PMIC_AUXADC_IMP0, 8, 16, 1, 1),
+	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 5, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 6, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 
 	/* Battery impedance channels */
-	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 128, 3, 1),
+	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 0, 0, 128, 3, 1),
 };
 
 static const u16 mt6357_auxadc_regs[] = {
@@ -224,22 +232,22 @@ static const struct iio_chan_spec mt6358_auxadc_channels[] = {
 };
 
 static const struct mtk_pmic_auxadc_chan mt6358_auxadc_ch_desc[] = {
-	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, 128, 3, 1),
-	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, 8, 2, 1),
-	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VDCXO, PMIC_AUXADC_RQST0, 6, 8, 3, 2),
-	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, 128, 1, 1),
-	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, 256, 1, 1),
-	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, 16, 1, 1),
-	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, 8, 2, 1),
-	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 8, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 9, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST1, 10, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 128, 3, 1),
+	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_IMP0, 8, 8, 2, 1),
+	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VDCXO, PMIC_AUXADC_RQST0, 6, PMIC_AUXADC_IMP0, 8, 8, 3, 2),
+	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, PMIC_AUXADC_IMP0, 8, 128, 1, 1),
+	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, PMIC_AUXADC_IMP0, 8, 256, 1, 1),
+	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, PMIC_AUXADC_IMP0, 8, 16, 1, 1),
+	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, PMIC_AUXADC_IMP0, 8, 8, 2, 1),
+	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 8, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 9, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST1, 10, PMIC_AUXADC_IMP0, 8, 8, 1, 1),
 
 	/* Battery impedance channels */
-	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 128, 7, 2),
+	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 0, 0, 128, 7, 2),
 };
 
 static const u16 mt6358_auxadc_regs[] = {
@@ -272,22 +280,22 @@ static const struct iio_chan_spec mt6359_auxadc_channels[] = {
 };
 
 static const struct mtk_pmic_auxadc_chan mt6359_auxadc_ch_desc[] = {
-	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, 128, 7, 2),
-	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, 8, 5, 2),
-	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VDCXO, PMIC_AUXADC_RQST0, 6, 8, 3, 2),
-	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, 128, 1, 1),
-	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, 256, 1, 1),
-	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, 16, 1, 1),
-	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, 8, 5, 2),
-	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 8, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 9, 8, 1, 1),
-	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST1, 10, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_IMP1, 15, 128, 7, 2),
+	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_IMP1, 15, 8, 5, 2),
+	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_IMP1, 15, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(ACCDET, PMIC_AUXADC_RQST0, 5, PMIC_AUXADC_IMP1, 15 ,8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VDCXO, PMIC_AUXADC_RQST0, 6, PMIC_AUXADC_IMP1, 15, 8, 3, 2),
+	MTK_PMIC_ADC_CHAN(TSX_TEMP, PMIC_AUXADC_RQST0, 7, PMIC_AUXADC_IMP1, 15, 128, 1, 1),
+	MTK_PMIC_ADC_CHAN(HPOFS_CAL, PMIC_AUXADC_RQST0, 9, PMIC_AUXADC_IMP1, 15, 256, 1, 1),
+	MTK_PMIC_ADC_CHAN(DCXO_TEMP, PMIC_AUXADC_RQST0, 10, PMIC_AUXADC_IMP1, 15, 16, 1, 1),
+	MTK_PMIC_ADC_CHAN(VBIF, PMIC_AUXADC_RQST0, 11, PMIC_AUXADC_IMP1, 15, 8, 5, 2),
+	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST1, 8, PMIC_AUXADC_IMP1, 15, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST1, 9, PMIC_AUXADC_IMP1, 15, 8, 1, 1),
+	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST1, 10, PMIC_AUXADC_IMP1, 15, 8, 1, 1),
 
 	/* Battery impedance channels */
-	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 128, 7, 2),
-	MTK_PMIC_ADC_CHAN(IBAT, 0, 0, 128, 7, 2),
+	MTK_PMIC_ADC_CHAN(VBAT, 0, 0, 0, 0, 128, 7, 2),
+	MTK_PMIC_ADC_CHAN(IBAT, 0, 0, 0, 0, 128, 7, 2),
 };
 
 static const u16 mt6359_auxadc_regs[] = {
@@ -313,9 +321,10 @@ static void mt6358_stop_imp_conv(struct mt6359_auxadc *adc_dev)
 	regmap_clear_bits(regmap, cinfo->regs[PMIC_AUXADC_DCM_CON], MT6358_DCM_CK_SW_EN);
 }
 
-static int mt6358_start_imp_conv(struct mt6359_auxadc *adc_dev)
+static int mt6358_start_imp_conv(struct mt6359_auxadc *adc_dev, const struct iio_chan_spec *chan)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
+	const struct mtk_pmic_auxadc_chan *desc = &cinfo->desc[chan->scan_index];
 	struct regmap *regmap = adc_dev->regmap;
 	u32 val;
 	int ret;
@@ -323,8 +332,8 @@ static int mt6358_start_imp_conv(struct mt6359_auxadc *adc_dev)
 	regmap_set_bits(regmap, cinfo->regs[PMIC_AUXADC_DCM_CON], MT6358_DCM_CK_SW_EN);
 	regmap_set_bits(regmap, cinfo->regs[PMIC_AUXADC_IMP1], MT6358_IMP1_AUTOREPEAT_EN);
 
-	ret = regmap_read_poll_timeout(adc_dev->regmap, cinfo->regs[PMIC_AUXADC_IMP0],
-				       val, val & MT6358_IMP0_IRQ_RDY,
+	ret = regmap_read_poll_timeout(regmap, cinfo->regs[desc->rdy_idx],
+				       val, val & desc->rdy_mask,
 				       IMP_POLL_DELAY_US, AUXADC_TIMEOUT_US);
 	if (ret) {
 		mt6358_stop_imp_conv(adc_dev);
@@ -334,7 +343,8 @@ static int mt6358_start_imp_conv(struct mt6359_auxadc *adc_dev)
 	return 0;
 }
 
-static int mt6358_read_imp(struct mt6359_auxadc *adc_dev, int *vbat, int *ibat)
+static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
+			   const struct iio_chan_spec *chan, int *vbat, int *ibat)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
 	struct regmap *regmap = adc_dev->regmap;
@@ -342,7 +352,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev, int *vbat, int *ibat)
 	u32 val_v;
 	int ret;
 
-	ret = mt6358_start_imp_conv(adc_dev);
+	ret = mt6358_start_imp_conv(adc_dev, chan);
 	if (ret)
 		return ret;
 
@@ -359,17 +369,19 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev, int *vbat, int *ibat)
 	return 0;
 }
 
-static int mt6359_read_imp(struct mt6359_auxadc *adc_dev, int *vbat, int *ibat)
+static int mt6359_read_imp(struct mt6359_auxadc *adc_dev,
+			   const struct iio_chan_spec *chan, int *vbat, int *ibat)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
+	const struct mtk_pmic_auxadc_chan *desc = &cinfo->desc[chan->scan_index];
 	struct regmap *regmap = adc_dev->regmap;
 	u32 val, val_v, val_i;
 	int ret;
 
 	/* Start conversion */
 	regmap_write(regmap, cinfo->regs[PMIC_AUXADC_IMP0], MT6359_IMP0_CONV_EN);
-	ret = regmap_read_poll_timeout(regmap, cinfo->regs[PMIC_AUXADC_IMP1],
-				       val, val & MT6359_IMP1_IRQ_RDY,
+	ret = regmap_read_poll_timeout(regmap, cinfo->regs[desc->rdy_idx],
+				       val, val & desc->rdy_mask,
 				       IMP_POLL_DELAY_US, AUXADC_TIMEOUT_US);
 
 	/* Stop conversion regardless of the result */
@@ -506,10 +518,10 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 	scoped_guard(mutex, &adc_dev->lock) {
 		switch (chan->scan_index) {
 		case PMIC_AUXADC_CHAN_IBAT:
-			ret = adc_dev->chip_info->read_imp(adc_dev, NULL, val);
+			ret = adc_dev->chip_info->read_imp(adc_dev, chan, NULL, val);
 			break;
 		case PMIC_AUXADC_CHAN_VBAT:
-			ret = adc_dev->chip_info->read_imp(adc_dev, val, NULL);
+			ret = adc_dev->chip_info->read_imp(adc_dev, chan, val, NULL);
 			break;
 		default:
 			ret = mt6359_auxadc_read_adc(adc_dev, chan, val);
-- 
2.49.0


