Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436FFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwhgtaFHZBv6S2V+tLcwlykVpBF/0Cpnjkf79Sh1jqU=; b=NZQduKnTRhEzffdcxYr0SfoBeP
	kekULfJnfv5RRMBI7PdCCnyQ6cus1YjzUpaWfmCHQNKiJkva3IiO5VqKt1dpPXGaatdgirUZPrX28
	JmetWe+l9tGFstkN31jvfSibPg9QFbdNGBg5p8tfPCfQH9GvSSfeese6cSGYnZofWwD9wO9yMJht9
	n6TCL/JPSAy4Orlkus0+DXancMPL3kkIx1Ax55oBM+VwNxGq3d93tDcrwrMha4gzdPDVl9xr3S75p
	6ZY1CVp/Hr82GrrUyp24rIfOJ7lj3KDjeHFG2zhw9FPXEUZrd/XLi988GJOko5npyOt+rslU83EmU
	gXgDnNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMiu-0000000BywA-0LZb;
	Thu, 03 Jul 2025 16:23:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKfM-0000000BcFo-1X6f;
	Thu, 03 Jul 2025 14:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751551914;
	bh=UyGSrh+bqCgx44EgcazYx/KXVGxuMfBfqGmo1Uuq3Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GevzCcViJtqqI+CSSlDnjBug0AoNGNZLWLxYUOmhyiea/JksV0EUu8Mrmksf92K1a
	 MIq669lhSyQNM6zduSyaPljRX2Z0/eCUBfGC+cypGKOcbKYMwWvicZNpG2sw2Q0sNZ
	 Mi8rYiabz6jrwKPS+txAwy0nKXAgNVbTmPGOEriCRHmg7B6LeRO2OnjcXgxGoQgqhC
	 v1iIXbXQnuclJOjFJGHCi6dnKR7yftT2OACFEp2qqTZEkLLfI/W76iQm03YGHRf22x
	 EZN3HJS3ksvgEypaMy8zXAf5zXG9UDcHpMQfNfjtLOqYgVLiAFyKFiud6NnhEMJLr0
	 GGUUq+1rokwRQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2159617E0676;
	Thu,  3 Jul 2025 16:11:54 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 6/6] iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC
Date: Thu,  3 Jul 2025 16:11:46 +0200
Message-ID: <20250703141146.171431-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071156_547341_656013F1 
X-CRM114-Status: GOOD (  11.96  )
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

MediaTek MT6373 is a PMIC found on MT8196/MT6991 board designs
and communicates with the SoC over SPMI.

This PMIC integrates an Auxiliary ADC (AUXADC) which has a grand
total of 54 channels, of which usually only 9 are used as this
is usually paired with MT6363 on the same board.

For the Auxiliary ADC part, this reuses the same register layout
as the MT6363 PMIC, but exposes only a subset of the ADC chans.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 50 +++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 38c635cd0cd7..e640eeb49406 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -50,6 +50,7 @@
 #define MT6363_EXT_CHAN_MASK		GENMASK(2, 0)
 #define MT6363_EXT_PURES_MASK		GENMASK(4, 3)
   #define MT6363_PULLUP_RES_100K	0
+  #define MT6363_PULLUP_RES_30K		1
   #define MT6363_PULLUP_RES_OPEN	3
 
 enum mtk_pmic_auxadc_regs {
@@ -412,6 +413,43 @@ static const u16 mt6363_auxadc_regs[] = {
 	[PMIC_AUXADC_IMP1]	= 0x1209,
 };
 
+static const struct iio_chan_spec mt6373_auxadc_channels[] = {
+	MTK_PMIC_IIO_CHAN(MT6363, chip_temp, CHIP_TEMP, 4, 12, IIO_TEMP),
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
+};
+
+static const struct mtk_pmic_auxadc_chan mt6373_auxadc_ch_desc[] = {
+	MTK_PMIC_ADC_CHAN(CHIP_TEMP, PMIC_AUXADC_RQST0, 4, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VCORE_TEMP, PMIC_AUXADC_RQST3, 0, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VPROC_TEMP, PMIC_AUXADC_RQST3, 1, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+	MTK_PMIC_ADC_CHAN(VGPU_TEMP, PMIC_AUXADC_RQST3, 2, PMIC_AUXADC_ADC0, 15, 32, 1, 1),
+
+	MTK_PMIC_ADC_EXT_CHAN(VIN1,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 1, MT6363_PULLUP_RES_30K, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN2,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 2, MT6363_PULLUP_RES_OPEN, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN3,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 3, MT6363_PULLUP_RES_OPEN, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN4,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 4, MT6363_PULLUP_RES_OPEN, 32, 1, 1),
+	MTK_PMIC_ADC_EXT_CHAN(VIN5,
+			      PMIC_AUXADC_RQST1, 4, PMIC_AUXADC_ADC0, 15,
+			      PMIC_AUXADC_SDMADC_CON0, 5, MT6363_PULLUP_RES_OPEN, 32, 1, 1),
+};
+
 static void mt6358_stop_imp_conv(struct mt6359_auxadc *adc_dev)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
@@ -554,6 +592,17 @@ static const struct mtk_pmic_auxadc_info mt6363_chip_info = {
 	.vref_mv = 1840,
 };
 
+static const struct mtk_pmic_auxadc_info mt6373_chip_info = {
+	.model_name = "MT6373",
+	.channels = mt6373_auxadc_channels,
+	.num_channels = ARRAY_SIZE(mt6373_auxadc_channels),
+	.desc = mt6373_auxadc_ch_desc,
+	.regs = mt6363_auxadc_regs,
+	.is_spmi = true,
+	.no_reset = true,
+	.vref_mv = 1840,
+};
+
 static void mt6359_auxadc_reset(struct mt6359_auxadc *adc_dev)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
@@ -840,6 +889,7 @@ static const struct of_device_id mt6359_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt6358-auxadc", .data = &mt6358_chip_info },
 	{ .compatible = "mediatek,mt6359-auxadc", .data = &mt6359_chip_info },
 	{ .compatible = "mediatek,mt6363-auxadc", .data = &mt6363_chip_info },
+	{ .compatible = "mediatek,mt6373-auxadc", .data = &mt6373_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6359_auxadc_of_match);
-- 
2.49.0


