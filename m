Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7691C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCXBVtZ/l2ZXHjeQnAgRMZ/2gT+RJ5Cf3b+H9jHVEP4=; b=JuZsFebyaBVa+WD3kOmqi0pyRI
	klb7jtIG6ZisUAhK+bJYhlWy/7YIqgDm4BZj+tlZx+ggRvU50JZT43fuB3nEAxNhDuW4rir5nLCDf
	EFQcqTMQJuLRWO+22edf1puGkjT5HKkZDOAxft/Wfrarpa/8i9hibfd+NMuZSTzL2pg8aslByTkbp
	5LpsozuQx+bdmtwVreG66SHuaq91m/tcYoMZSzBrkVjpkohOUSizKXzyZMiUA8exesR7JPlN0YouV
	hpOjiQEtXG2GVho7sc2Dplmqk5Tkn9xIwb/h7FXa/1e/GOF0tEmdo1+5k4KY0uWVolbx41hWJAO4G
	fQ+1j0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThTt-00000002ufs-0xgP;
	Mon, 23 Jun 2025 13:45:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqn-00000002aeB-335L;
	Mon, 23 Jun 2025 12:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680036;
	bh=MGp+k0PKQqNRfxNWKGxTdkDYd+P6UlL3S+uxTJqydfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a98Rn0FPEgfkr0fDgKL+97eLws4Cx7zQ6c9ETAjCrZ7JvOntqnzTg5P7Q38CJAmHA
	 Dh6EcHky+n0Ey+sdgfhmVTHGyd910OhWO2sxf0563rqZKIBEjJonLOX1NTzRsQrBc2
	 5gP96Z55ROnhW00TVFxWBJ/VoRuFx08ChmD2RfzrJQofp6++88qqgxFTxGeGkdQkW8
	 iYxgCk/s7cqnzDSTdM7PU6dYYoHx3BHXDu5B5oh4BmaFNFApW1Lx4s2vjESFJZ+9lS
	 18VTN8JlJfGNjSQyreIb4bp8btClVIfe//gqrNy9nzQV7hmsA31zh598vLdIqCt8YD
	 ElfvseKrGpYVw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D3DC17E156D;
	Mon, 23 Jun 2025 14:00:35 +0200 (CEST)
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
Subject: [PATCH v1 4/5] iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
Date: Mon, 23 Jun 2025 14:00:27 +0200
Message-ID: <20250623120028.108809-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050038_059649_85E001B6 
X-CRM114-Status: GOOD (  26.20  )
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

MediaTek MT6363 is a PMIC found on MT8196/MT6991 board designs
and communicates with the SoC over SPMI.

This PMIC integrates an Auxiliary ADC (AUXADC) which has a grand
total of 54 ADC channels: 49 PMIC-internal channels, 2 external
NTC thermistor channels and 2 generic ADC channels (mapped to 7
PMIC ADC external inputs).

To use a generic ADC channel it is necessary to enable one of
the PMIC ADC inputs at a time and only then start the reading,
so in this case it is possible to read only one external input
for each generic ADC channel.

Due to the lack of documentation, this implementation supports
using only one generic ADC channel, hence supports reading only
one external input at a time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 238 +++++++++++++++++++++++++++++---
 1 file changed, 217 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index ae7b65f5f551..f49b0b6e78da 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -7,6 +7,7 @@
  * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
@@ -24,6 +25,7 @@
 #include <dt-bindings/iio/adc/mediatek,mt6357-auxadc.h>
 #include <dt-bindings/iio/adc/mediatek,mt6358-auxadc.h>
 #include <dt-bindings/iio/adc/mediatek,mt6359-auxadc.h>
+#include <dt-bindings/iio/adc/mediatek,mt6363-auxadc.h>
 
 #define AUXADC_AVG_TIME_US		10
 #define AUXADC_POLL_DELAY_US		100
@@ -46,6 +48,18 @@
 #define MT6359_IMP0_CONV_EN		BIT(0)
 #define MT6359_IMP1_IRQ_RDY		BIT(15)
 
+#define MT6363_EXT_CHAN_MASK		GENMASK(2, 0)
+#define MT6363_EXT_PURES_MASK		GENMASK(4, 3)
+ #define MT6363_PULLUP_RES_100K		0
+ #define MT6363_PULLUP_RES_OPEN		3
+
+#define MTK_AUXADC_HAS_FLAG(pdata, msk)	((pdata)->flags & (MTK_PMIC_AUXADC_##msk))
+
+enum mtk_pmic_auxadc_flags {
+	MTK_PMIC_AUXADC_IS_SPMI = BIT(0),
+	MTK_PMIC_AUXADC_NO_RESET = BIT(1),
+};
+
 enum mtk_pmic_auxadc_regs {
 	PMIC_AUXADC_ADC0,
 	PMIC_AUXADC_DCM_CON,
@@ -54,6 +68,8 @@ enum mtk_pmic_auxadc_regs {
 	PMIC_AUXADC_IMP3,
 	PMIC_AUXADC_RQST0,
 	PMIC_AUXADC_RQST1,
+	PMIC_AUXADC_RQST3,
+	PMIC_AUXADC_SDMADC_CON0,
 	PMIC_HK_TOP_WKEY,
 	PMIC_HK_TOP_RST_CON0,
 	PMIC_FGADC_R_CON0,
@@ -75,7 +91,17 @@ enum mtk_pmic_auxadc_channels {
 	PMIC_AUXADC_CHAN_TSX_TEMP,
 	PMIC_AUXADC_CHAN_HPOFS_CAL,
 	PMIC_AUXADC_CHAN_DCXO_TEMP,
+	PMIC_AUXADC_CHAN_VTREF,
 	PMIC_AUXADC_CHAN_VBIF,
+	PMIC_AUXADC_CHAN_IMIX_R,
+	PMIC_AUXADC_CHAN_VSYSSNS,
+	PMIC_AUXADC_CHAN_VIN1,
+	PMIC_AUXADC_CHAN_VIN2,
+	PMIC_AUXADC_CHAN_VIN3,
+	PMIC_AUXADC_CHAN_VIN4,
+	PMIC_AUXADC_CHAN_VIN5,
+	PMIC_AUXADC_CHAN_VIN6,
+	PMIC_AUXADC_CHAN_VIN7,
 	PMIC_AUXADC_CHAN_IBAT,
 	PMIC_AUXADC_CHAN_VBAT,
 	PMIC_AUXADC_CHAN_MAX
@@ -103,6 +129,9 @@ struct mt6359_auxadc {
  * @req_mask:      Bitmask to activate a channel
  * @rdy_idx:       Readiness register number
  * @rdy_mask:      Bitmask to determine channel readiness
+ * @ext_sel_idx:   PMIC GPIO channel register number
+ * @ext_sel_ch:    PMIC GPIO number
+ * @ext_sel_pu:    PMIC GPIO channel pullup resistor selector
  * @num_samples:   Number of AUXADC samples for averaging
  * @r_ratio:       Resistance ratio fractional
  */
@@ -111,6 +140,9 @@ struct mtk_pmic_auxadc_chan {
 	u16 req_mask;
 	u8 rdy_idx;
 	u16 rdy_mask;
+	s8 ext_sel_idx;
+	u8 ext_sel_ch;
+	u8 ext_sel_pu;
 	u16 num_samples;
 	struct u8_fract r_ratio;
 };
@@ -123,7 +155,9 @@ struct mtk_pmic_auxadc_chan {
  * @desc:           PMIC AUXADC channel data
  * @regs:           List of PMIC specific registers
  * @sec_unlock_key: Security unlock key for HK_TOP writes
+ * @vref_mv:        AUXADC Reference Voltage (VREF) in millivolts
  * @imp_adc_num:    ADC channel for battery impedance readings
+ * @flags:          Feature flags
  * @read_imp:       Callback to read impedance channels
  */
 struct mtk_pmic_auxadc_info {
@@ -133,22 +167,33 @@ struct mtk_pmic_auxadc_info {
 	const struct mtk_pmic_auxadc_chan *desc;
 	const u16 *regs;
 	u16 sec_unlock_key;
+	u16 vref_mv;
 	u8 imp_adc_num;
+	u8 flags;
 	int (*read_imp)(struct mt6359_auxadc *adc_dev,
 			const struct iio_chan_spec *chan, int *vbat, int *ibat);
 };
 
-#define MTK_PMIC_ADC_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
-			  _samples, _rnum, _rdiv)				\
+#define MTK_PMIC_ADC_EXT_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
+			      _ext_sel_idx, _ext_sel_ch, _ext_sel_pu,		\
+			      _samples, _rnum, _rdiv)				\
 	[PMIC_AUXADC_CHAN_##_ch_idx] = {					\
 		.req_idx = _req_idx,						\
 		.req_mask = BIT(_req_bit),					\
 		.rdy_idx = _rdy_idx,						\
 		.rdy_mask = BIT(_rdy_bit),					\
+		.ext_sel_idx = _ext_sel_idx,					\
+		.ext_sel_ch = _ext_sel_ch,					\
+		.ext_sel_pu = _ext_sel_pu,					\
 		.num_samples = _samples,					\
 		.r_ratio = { _rnum, _rdiv }					\
 	}
 
+#define MTK_PMIC_ADC_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
+			  _samples, _rnum, _rdiv)				\
+	MTK_PMIC_ADC_EXT_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
+			      -1, 0, 0, _samples, _rnum, _rdiv)
+
 #define MTK_PMIC_IIO_CHAN(_model, _name, _ch_idx, _adc_idx, _nbits, _ch_type)	\
 {										\
 	.type = _ch_type,							\
@@ -310,6 +355,70 @@ static const u16 mt6359_auxadc_regs[] = {
 	[PMIC_AUXADC_IMP3]	= 0x120e,
 };
 
+static const struct iio_chan_spec mt6363_auxadc_channels[] = {
+	MTK_PMIC_IIO_CHAN(MT6363, bat_adc, BATADC, 0, 15, IIO_RESISTANCE),
+	MTK_PMIC_IIO_CHAN(MT6363, cdt_v, VCDT, 2, 12, IIO_TEMP),/**/
+	MTK_PMIC_IIO_CHAN(MT6363, batt_temp, BAT_TEMP, 3, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, sys_sns_v, VSYSSNS, 6, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, tref_v, VTREF, 11, 12, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, vcore_temp, VCORE_TEMP, 38, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, vproc_temp, VPROC_TEMP, 39, 12, IIO_TEMP),
+	MTK_PMIC_IIO_CHAN(MT6363, vgpu_temp, VGPU_TEMP, 40, 12, IIO_TEMP),
+
+	/* For VIN, ADC12 holds the result depending on which GPIO was activated */
+	MTK_PMIC_IIO_CHAN(MT6363, in1_v, VIN1, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in2_v, VIN2, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in3_v, VIN3, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in4_v, VIN4, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in5_v, VIN5, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in6_v, VIN6, 45, 15, IIO_VOLTAGE),
+	MTK_PMIC_IIO_CHAN(MT6363, in7_v, VIN7, 45, 15, IIO_VOLTAGE),
+};
+
+static const struct mtk_pmic_auxadc_chan mt6363_auxadc_ch_desc[] = {
+	MTK_PMIC_ADC_CHAN(BATADC, PMIC_AUXADC_RQST0, 0, PMIC_AUXADC_ADC0, 15, 64, 4, 1),
+	MTK_PMIC_ADC_CHAN(VCDT, PMIC_AUXADC_RQST0, 2, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(BAT_TEMP, PMIC_AUXADC_RQST0, 3, PMIC_AUXADC_ADC0, 15, 32, 3, 2),
+	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VSYSSNS, PMIC_AUXADC_RQST1, 6, PMIC_AUXADC_ADC0, 15, 64, 3, 1),
+	MTK_PMIC_ADC_CHAN(VTREF, PMIC_AUXADC_RQST1, 3, PMIC_AUXADC_ADC0, 15, 32, 3, 2),
+	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST3, 0, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST3, 1, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST3, 2, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+
+	MTK_PMIC_ADC_EXT_CHAN(VIN1,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 1, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN2,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 2, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN3,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 3, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN4,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 4, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN5,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 5, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN6,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 6, MT6363_PULLUP_RES_100K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN7,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 7, MT6363_PULLUP_RES_100K, 32, 1, 1),
+};
+
+static const u16 mt6363_auxadc_regs[] = {
+	[PMIC_AUXADC_RQST0]	= 0x1108,
+	[PMIC_AUXADC_RQST1]	= 0x1109,
+	[PMIC_AUXADC_RQST3]	= 0x110c,
+	[PMIC_AUXADC_ADC0]	= 0x1088,
+	[PMIC_AUXADC_IMP0]	= 0x1208,
+	[PMIC_AUXADC_IMP1]	= 0x1209,
+};
+
 static void mt6358_stop_imp_conv(struct mt6359_auxadc *adc_dev)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
@@ -379,13 +488,13 @@ static int mt6359_read_imp(struct mt6359_auxadc *adc_dev,
 	int ret;
 
 	/* Start conversion */
-	regmap_write(regmap, cinfo->regs[PMIC_AUXADC_IMP0], MT6359_IMP0_CONV_EN);
+	regmap_write(regmap, cinfo->regs[desc->req_idx], desc->req_mask);
 	ret = regmap_read_poll_timeout(regmap, cinfo->regs[desc->rdy_idx],
 				       val, val & desc->rdy_mask,
 				       IMP_POLL_DELAY_US, AUXADC_TIMEOUT_US);
 
 	/* Stop conversion regardless of the result */
-	regmap_write(regmap, cinfo->regs[PMIC_AUXADC_IMP0], 0);
+	regmap_write(regmap, cinfo->regs[desc->req_idx], 0);
 	if (ret)
 		return ret;
 
@@ -416,6 +525,7 @@ static const struct mtk_pmic_auxadc_info mt6357_chip_info = {
 	.regs = mt6357_auxadc_regs,
 	.imp_adc_num = MT6357_IMP_ADC_NUM,
 	.read_imp = mt6358_read_imp,
+	.vref_mv = 1800,
 };
 
 static const struct mtk_pmic_auxadc_info mt6358_chip_info = {
@@ -426,6 +536,7 @@ static const struct mtk_pmic_auxadc_info mt6358_chip_info = {
 	.regs = mt6358_auxadc_regs,
 	.imp_adc_num = MT6358_IMP_ADC_NUM,
 	.read_imp = mt6358_read_imp,
+	.vref_mv = 1800,
 };
 
 static const struct mtk_pmic_auxadc_info mt6359_chip_info = {
@@ -436,6 +547,17 @@ static const struct mtk_pmic_auxadc_info mt6359_chip_info = {
 	.regs = mt6359_auxadc_regs,
 	.sec_unlock_key = 0x6359,
 	.read_imp = mt6359_read_imp,
+	.vref_mv = 1800,
+};
+
+static const struct mtk_pmic_auxadc_info mt6363_chip_info = {
+	.model_name = "MT6363",
+	.channels = mt6363_auxadc_channels,
+	.num_channels = ARRAY_SIZE(mt6363_auxadc_channels),
+	.desc = mt6363_auxadc_ch_desc,
+	.regs = mt6363_auxadc_regs,
+	.flags = MTK_PMIC_AUXADC_IS_SPMI | MTK_PMIC_AUXADC_NO_RESET,
+	.vref_mv = 1840,
 };
 
 static void mt6359_auxadc_reset(struct mt6359_auxadc *adc_dev)
@@ -464,27 +586,74 @@ static int mt6359_auxadc_read_adc(struct mt6359_auxadc *adc_dev,
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
 	const struct mtk_pmic_auxadc_chan *desc = &cinfo->desc[chan->scan_index];
 	struct regmap *regmap = adc_dev->regmap;
-	u32 val;
+	u32 reg, rdy_mask, val, lval;
+	u8 ext_sel;
 	int ret;
 
+	if (desc->ext_sel_idx >= 0) {
+		ext_sel = FIELD_PREP(MT6363_EXT_PURES_MASK, desc->ext_sel_pu);
+		ext_sel |= FIELD_PREP(MT6363_EXT_CHAN_MASK, desc->ext_sel_ch);
+
+		ret = regmap_update_bits(regmap, cinfo->regs[desc->ext_sel_idx],
+					 MT6363_EXT_PURES_MASK | MT6363_EXT_CHAN_MASK,
+					 ext_sel);
+		if (ret)
+			return ret;
+	}
+
 	/* Request to start sampling for ADC channel */
 	ret = regmap_write(regmap, cinfo->regs[desc->req_idx], desc->req_mask);
 	if (ret)
-		return ret;
+		goto end;
 
 	/* Wait until all samples are averaged */
 	fsleep(desc->num_samples * AUXADC_AVG_TIME_US);
 
-	ret = regmap_read_poll_timeout(regmap,
-				       cinfo->regs[PMIC_AUXADC_ADC0] + (chan->address << 1),
-				       val, val & PMIC_AUXADC_RDY_BIT,
+	reg = cinfo->regs[PMIC_AUXADC_ADC0] + (chan->address << 1);
+	rdy_mask = PMIC_AUXADC_RDY_BIT;
+
+	/*
+	 * Even though for both PWRAP and SPMI cases the ADC HW signals that
+	 * the data is ready by setting AUXADC_RDY_BIT, for SPMI the register
+	 * read is only 8 bits long: for this case, the check has to be done
+	 * on the ADC(x)_H register (high bits) and the rdy_mask needs to be
+	 * shifted to the right by the same 8 bits.
+	 */
+	if (MTK_AUXADC_HAS_FLAG(cinfo, IS_SPMI)) {
+		rdy_mask >>= 8;
+		reg += 1;
+	}
+
+	ret = regmap_read_poll_timeout(regmap, reg, val, val & rdy_mask,
 				       AUXADC_POLL_DELAY_US, AUXADC_TIMEOUT_US);
-	if (ret)
-		return ret;
+	if (ret) {
+		dev_dbg(adc_dev->dev, "ADC read timeout for chan %lu\n", chan->address);
+		goto end;
+	}
+
+	if (MTK_AUXADC_HAS_FLAG(cinfo, IS_SPMI)) {
+		/* If the previous read succeeded, this can't fail */
+		regmap_read(regmap, reg - 1, &lval);
+		val = (val << 8) | lval;
+	}
 
-	/* Stop sampling */
+end:
+	/* Stop sampling unconditionally... */
 	regmap_write(regmap, cinfo->regs[desc->req_idx], 0);
 
+	/* ...and deactivate the ADC GPIO if previously done */
+	if (desc->ext_sel_idx >= 0) {
+		ext_sel = FIELD_PREP(MT6363_EXT_PURES_MASK, MT6363_PULLUP_RES_OPEN);
+
+		regmap_update_bits(regmap, cinfo->regs[desc->ext_sel_idx],
+				   MT6363_EXT_PURES_MASK, ext_sel);
+	}
+
+	/* Check if we reached this point because of an error or regular flow */
+	if (ret)
+		return ret;
+
+	/* Everything went fine, give back the ADC reading */
 	*out = val & GENMASK(chan->scan_type.realbits - 1, 0);
 	return 0;
 }
@@ -505,7 +674,7 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	if (mask == IIO_CHAN_INFO_SCALE) {
-		*val = desc->r_ratio.numerator * AUXADC_VOLT_FULL;
+		*val = desc->r_ratio.numerator * (u32)cinfo->vref_mv;
 
 		if (desc->r_ratio.denominator > 1) {
 			*val2 = desc->r_ratio.denominator;
@@ -518,9 +687,15 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 	scoped_guard(mutex, &adc_dev->lock) {
 		switch (chan->scan_index) {
 		case PMIC_AUXADC_CHAN_IBAT:
+			if (!adc_dev->chip_info->read_imp)
+				return -EOPNOTSUPP;
+
 			ret = adc_dev->chip_info->read_imp(adc_dev, chan, NULL, val);
 			break;
 		case PMIC_AUXADC_CHAN_VBAT:
+			if (!adc_dev->chip_info->read_imp)
+				return -EOPNOTSUPP;
+
 			ret = adc_dev->chip_info->read_imp(adc_dev, chan, val, NULL);
 			break;
 		default:
@@ -535,7 +710,8 @@ static int mt6359_auxadc_read_raw(struct iio_dev *indio_dev,
 		 * AUXADC is stuck: perform a full reset to recover it.
 		 */
 		if (ret == -ETIMEDOUT) {
-			if (adc_dev->timed_out) {
+			if (!MTK_AUXADC_HAS_FLAG(cinfo, NO_RESET) &&
+			    adc_dev->timed_out) {
 				dev_warn(adc_dev->dev, "Resetting stuck ADC!\r\n");
 				mt6359_auxadc_reset(adc_dev);
 			}
@@ -555,15 +731,36 @@ static const struct iio_info mt6359_auxadc_iio_info = {
 
 static int mt6359_auxadc_probe(struct platform_device *pdev)
 {
+	const struct mtk_pmic_auxadc_info *chip_info;
 	struct device *dev = &pdev->dev;
-	struct device *mt6397_mfd_dev = dev->parent;
+	struct device *mfd_dev = dev->parent;
 	struct mt6359_auxadc *adc_dev;
 	struct iio_dev *indio_dev;
+	struct device *regmap_dev;
 	struct regmap *regmap;
 	int ret;
 
+	chip_info = device_get_match_data(dev);
+	if (!chip_info)
+		return -EINVAL;
+	/*
+	 * The regmap for this device has to be acquired differently for
+	 * SoC PMIC Wrapper and SPMI PMIC cases:
+	 *
+	 * If this is under SPMI, the regmap comes from the direct parent of
+	 * this driver: this_device->parent(mfd).
+	 *                            ... or ...
+	 * If this is under the SoC PMIC Wrapper, the regmap comes from the
+	 * parent of the MT6397 MFD: this_device->parent(mfd)->parent(pwrap)
+	 */
+	if (MTK_AUXADC_HAS_FLAG(chip_info, IS_SPMI))
+		regmap_dev = mfd_dev;
+	else
+		regmap_dev = mfd_dev->parent;
+
+
 	/* Regmap is from SoC PMIC Wrapper, parent of the mt6397 MFD */
-	regmap = dev_get_regmap(mt6397_mfd_dev->parent, NULL);
+	regmap = dev_get_regmap(regmap_dev, NULL);
 	if (!regmap)
 		return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
 
@@ -574,14 +771,12 @@ static int mt6359_auxadc_probe(struct platform_device *pdev)
 	adc_dev = iio_priv(indio_dev);
 	adc_dev->regmap = regmap;
 	adc_dev->dev = dev;
-
-	adc_dev->chip_info = device_get_match_data(dev);
-	if (!adc_dev->chip_info)
-		return -EINVAL;
+	adc_dev->chip_info = chip_info;
 
 	mutex_init(&adc_dev->lock);
 
-	mt6359_auxadc_reset(adc_dev);
+	if (!MTK_AUXADC_HAS_FLAG(chip_info, NO_RESET))
+		mt6359_auxadc_reset(adc_dev);
 
 	indio_dev->name = adc_dev->chip_info->model_name;
 	indio_dev->info = &mt6359_auxadc_iio_info;
@@ -600,6 +795,7 @@ static const struct of_device_id mt6359_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt6357-auxadc", .data = &mt6357_chip_info },
 	{ .compatible = "mediatek,mt6358-auxadc", .data = &mt6358_chip_info },
 	{ .compatible = "mediatek,mt6359-auxadc", .data = &mt6359_chip_info },
+	{ .compatible = "mediatek,mt6363-auxadc", .data = &mt6363_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6359_auxadc_of_match);
-- 
2.49.0


