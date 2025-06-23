Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D9DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4GX5rlRwhxZPfUKOpyuGC46aOP+upjXPQWyAvs3ujs=; b=gS/RaYpQsU26/yIl74hp9au22w
	ksozojnN5ILVgQ7LiPh8iwFSX4lqygVUFihTQifxe7V9lZm0C8a3AE+hsr6UwC/QDYRHNLD4PF07+
	LKQG1MtMMzQjNngO30BM5gpQQcrq5F6gAqfPD+kkPlTf/knyL8zSltQZ+1jwY+uAUlUnxMG12GtzB
	jJuHm1kUNXqvybWP3kFwIBM5WrgLwKg+ZoE4CZ2LrcP5sFo2+NcB3ttsUsQocrlmt7++AyL6gzC29
	sLl0hj++YVZMIVowo2p9aB8xV1yLEx3ktrlPSJtCz7Tyv9QEmyfzO+QE8ek4iauCSpVLcUb1YhQOW
	aLSLV0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThWD-00000002v1f-1ldV;
	Mon, 23 Jun 2025 13:47:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqo-00000002aem-3jgn;
	Mon, 23 Jun 2025 12:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680037;
	bh=hwpThepsWhMf6cvFRx2LaoZ30WrXd8SgI7HAfBuuR6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eMTwXSBiY0cidzZpzlKGIzGqjiEhdJwpGelh7DoIkXO5ViA7lNUJ7XCP/JrRdHNDD
	 crWUWyDvzcfxDmmmWEb2NsEDAfgKPcnAbL1scjYf0+H2tEPnUtzeTfP21PR2KH5533
	 qWJ/FXExYN0sRN7Mveb9J55gsbsyQHBxYf0KH9pn+0XJs7qmL2vGI68PG30Nhw3sLn
	 9mi859CQAUzFrJ8/cBVSrqt7qAaYVl3YkYLxvfFKGPlNtVb7fbWXPwLU5VPN/1ap2k
	 Gctm2PrUIOB/b8yJKtwZUuH4o0wx+9UYZUakIeHR6Maqtfe2mCfzwmBuhpVifrXcv6
	 rOk5gTvRb96TQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91C0417E156E;
	Mon, 23 Jun 2025 14:00:36 +0200 (CEST)
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
Subject: [PATCH v1 5/5] iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC
Date: Mon, 23 Jun 2025 14:00:28 +0200
Message-ID: <20250623120028.108809-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050039_107129_BDBF0B9D 
X-CRM114-Status: GOOD (  12.32  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iio/adc/mt6359-auxadc.c | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index f49b0b6e78da..909586282c1e 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -51,6 +51,7 @@
 #define MT6363_EXT_CHAN_MASK		GENMASK(2, 0)
 #define MT6363_EXT_PURES_MASK		GENMASK(4, 3)
  #define MT6363_PULLUP_RES_100K		0
+ #define MT6363_PULLUP_RES_30K		1
  #define MT6363_PULLUP_RES_OPEN		3
 
 #define MTK_AUXADC_HAS_FLAG(pdata, msk)	((pdata)->flags & (MTK_PMIC_AUXADC_##msk))
@@ -419,6 +420,43 @@ static const u16 mt6363_auxadc_regs[] = {
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
@@ -560,6 +598,16 @@ static const struct mtk_pmic_auxadc_info mt6363_chip_info = {
 	.vref_mv = 1840,
 };
 
+static const struct mtk_pmic_auxadc_info mt6373_chip_info = {
+	.model_name = "MT6373",
+	.channels = mt6373_auxadc_channels,
+	.num_channels = ARRAY_SIZE(mt6373_auxadc_channels),
+	.desc = mt6373_auxadc_ch_desc,
+	.regs = mt6363_auxadc_regs,
+	.flags = MTK_PMIC_AUXADC_IS_SPMI | MTK_PMIC_AUXADC_NO_RESET,
+	.vref_mv = 1840,
+};
+
 static void mt6359_auxadc_reset(struct mt6359_auxadc *adc_dev)
 {
 	const struct mtk_pmic_auxadc_info *cinfo = adc_dev->chip_info;
@@ -796,6 +844,7 @@ static const struct of_device_id mt6359_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt6358-auxadc", .data = &mt6358_chip_info },
 	{ .compatible = "mediatek,mt6359-auxadc", .data = &mt6359_chip_info },
 	{ .compatible = "mediatek,mt6363-auxadc", .data = &mt6363_chip_info },
+	{ .compatible = "mediatek,mt6373-auxadc", .data = &mt6373_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6359_auxadc_of_match);
-- 
2.49.0


