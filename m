Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549FDFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=; b=fGj6YmB+PIrvrNWbTidCA9VPs3
	ELWOFpi/mr7DoKBaITZPNtbYGrO0OSQfrv3SVUx5Xw7oFXlniIoMPQK9YV2yBWd4tShX7tpxTAPYr
	rh5QhXzTwr1/LEkCYyvQvGDnofYqMVIwlvZLo2FbN2zanLsxjPsYug7JJeY0ReORZG06LerMeO12N
	L2gwxmnakxkQ4AeiWiVUA1zNweeBL7f08sHh3MRC15KLZ5QJ+ojcovZyvyvV7WHRCv3/7/mt8Po4w
	go3OuAsZOc4HJbGeJkReXceYaEKtMk5w7tJB+ggQdsMmWs4haBQ6hNGh/qglXXwENNE8gvxxeLm95
	oEJ/Q4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYI-00000003AtH-2skt;
	Wed, 29 Apr 2026 07:41:46 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYD-00000003AoJ-1zAI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35d965648a2so10957525a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448500; x=1778053300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=lN5QYxv8lK3Wurg2DLUyWn4UIB6VYvb5b4q6aVpUte8r37D4p9Yo/k7Nk0L7KPyFCE
         TOMjJscw3yzIyUelMT0xMJhEN5VIOZFMFxJ0LNUl81NTszBAEz2LbKMOqXZNEgxdc+LP
         Ha/1IvCW73rPuFg6QZ9ez+M5rRr9U7iii4+VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448500; x=1778053300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=obyMQqlMUxKBnIRaY801PrbFJtLgd77iRQe+caXM0lkv4GQnnWsk3VxN9Nqz4crvJM
         OqaxXWUUzXifHTxpX1XuqdEc9QX5KeGRckn3ToYi/b6mD4un1aX7tGvIoNtj3HiqE5Rn
         o+g4P2uZy4NsHOOlVKmYD9WWWKprNEkoOPenrmj0eDvfSK3K7Q58iPoq8onNw9ZtvY/q
         k7e9FJEdIQW5rf1BUN1pPCA3Scz4ZVPrJYM3T3XSEoIvOOGyK8BJj6U/cKHpEnfJyiwa
         cB7a0KhzPTnZGNmBmKYsOSB3EGhC9XHQgR3Q+eo5KolsVMRGNmQj3srVEbNjcBKp1Sag
         S/Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+k66UntZAmPrUt82Fh+fI45XbON3d9AVfeCmFSWTqHvwQLc6xf7ov2e9AzISZyQiPWTD3atdVFCEHvpsA5hBvr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9DUxZW15ExebGski0rqy7ZBH7Q4MDx8gjSAiJL5nH7Hkvqh/t
	u/9+ysUsh5sh5rOJsLrdahcqnmRd2x64FRCiDhs4xnFfHUe2s641mTRQr+KsJQ4W4A==
X-Gm-Gg: AeBDievnJIZ7Ea/wkHK1hWFdHPLZ8kVI1YkD2TegtRngbuxUfqbtjlr0BuItYgYCoKP
	b71s+6BztU463unpofWRgFJsWkLHrltc6dYUQvu5lMJ+qIYSE4fsLI8TgQqtYZZqBWAncCp16KZ
	vrd4sqiTQUphyOcPonzGplK3M4DFqY/cz9zkK2JhoTsmXl+guUaiywhHJOEaD5exAuOg2D5R2Tx
	U/e07fVvV0aPXFjEBNZastf8kKJmnwERfvrM97bMPdvas9o+sYm/2cwWzdMJ1MaEVPkZKvX3NRZ
	y3niSu09YbEDud4wWKdVL1KApjbEOcdzGnOUg3EX/oeXc81JhIr1XXsO0zBlCPz1HEcbC6ByJyT
	RiMjeFphPY2CuKxMtlVGlTCW5UVQ0yTWZjGie+gg3LoHVV2qnYHiuYRzPuE5A8gCwdc4IaiJxyt
	AxFgNCuf60u0ExN4dKS12vnai3KXN7m5LdksYURkqecx7SJXCrMq26hh6GW/xl3Ue77nSWMt1aR
	jdrSOtA9GUYjbNRLDU=
X-Received: by 2002:a17:90b:3c05:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-364a0b1d676mr3078321a91.8.1777448500621;
        Wed, 29 Apr 2026 00:41:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Wed, 29 Apr 2026 15:41:10 +0800
Message-ID: <20260429074113.3720271-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004141_520750_0E42B204 
X-CRM114-Status: GOOD (  18.10  )
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

The regulator descriptions and extended descriptions don't change at
runtime. The only reason they are not const is that the regulator
driver data is non-const.

Const-ify the descriptions and all references to them. For the driver
data, explicitly cast it to non-const void *.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch

This is included in the series as it touches the same context.

 drivers/regulator/mt6359-regulator.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index c8a788858824..bcf9a476a34e 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -251,7 +251,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 {
 	int ret;
 	u32 regval;
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret != 0) {
@@ -267,7 +267,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 
 static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret, regval;
 
 	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
@@ -299,7 +299,7 @@ static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret = 0, val;
 	int curr_mode;
 
@@ -354,7 +354,7 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 					u32 sel)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -393,7 +393,7 @@ static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 
 static int mt6359p_vemc_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -469,7 +469,7 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 };
 
 /* The array is indexed by id(MT6359_ID_XXX) */
-static struct mt6359_regulator_info mt6359_regulators[] = {
+static const struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -705,7 +705,7 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
 };
 
-static struct mt6359_regulator_info mt6359p_regulators[] = {
+static const struct mt6359_regulator_info mt6359p_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -950,7 +950,7 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
-	struct mt6359_regulator_info *mt6359_info;
+	const struct mt6359_regulator_info *mt6359_info;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
@@ -965,7 +965,8 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
 	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
-		config.driver_data = mt6359_info;
+		/* drop const here, but all uses in the driver are const */
+		config.driver_data = (void *)mt6359_info;
 		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
-- 
2.54.0.545.g6539524ca2-goog


