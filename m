Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B55ACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=; b=cJFQyb42JHYKceiQcAccyorWnL
	GLHRhsooeY/9LzeItGCnn0DHeC7nEjwxN2C17Sc/BXcnCVi800Aoj3hkCvJ+Is0w6lgf3vX2qZKbV
	JvQAxL5dV5qJayKr5m3QkZpLcpxc2BnegHAUrwgHSkZEN4xCBtdaH7KQBwH5+m0blYStIRYPHxlfu
	VYQd2eNkjvUqu1qDcSlBYPo/4G1BQN0AHGdIPK5dfpxgzleYw77P4CxqLW06qekhhDHHBYJuCpGLW
	a9qB9TmwTQIBa12xqfdPLmga4IBz+XYy+ekuPCIUfhi/eYMJHZgptOBaZS8WLYzz7RfHNCVicB+zz
	Qx9gtYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisq-0000000G9MM-3TUl;
	Tue, 12 May 2026 08:54:33 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisn-0000000G9Gc-0t6n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso2110009a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576068; x=1779180868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=HFIyFBBBOIty+9glkLIqQ5ewGlTnOVVAf2yrS9rSEXBh+1GigXOzejJ1kh+R8b1BDR
         WL82jG6ocSlmKzF1w4Of8sVdmFJsDhA3O8RsgKS6OX7EXYT4y7gauymSjdAuEk3F9kbY
         Zka1Lc+BXfbhpq1vCQ9wj5rvu6Ms8G3G2yCr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576068; x=1779180868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=PWR0Moddnt2cP3RJxjRc/G2gvos26MYVuNh6WvDtICkWLXXiH7gfwKc39GxVGElZus
         RNraxdPZFDwCzYlDVn/SOVocHZaV0Ss6V3cUakDCTEYeJxxuHJiYX3JulFardNxy+mjP
         NzWYY+1+I/WzOxSftsjO3v9UH/hREyqu/eyBM/R6JtACj3rKI02tM9eUfGIoNn5CnJ1p
         A3/X/rMnG6yo0nAYm0Rmg2tywPrV1znmWiCtILaEa7N+KaCfLCpjRaIURkSF1kMNZPuY
         4bX2yvQE/QSDCJcsW1Z1RZv1kuN8909EeRMHLGci4MZufaH58H4VYdxms435S1Eu8NjV
         hdaw==
X-Forwarded-Encrypted: i=1; AFNElJ8yHHMJjk7ZeHu7hMPEV+CvWvpHmUANMw8J9ZGrfOWLqIQNwVL+1ub/fEy9Swcl+BLdTXIwXsgTLLvjX40unE/e@lists.infradead.org
X-Gm-Message-State: AOJu0YxDOsGk+nSG1fWzS9iHOzj+jsJM8InY4DnZ+qFzqoMk5JSl3qlN
	KyFkjeEm5zZ1uz8vps5khk2VuxfAntViyMJMLyh3uCXbZoBMBvxc0ljptR30EPiMpg==
X-Gm-Gg: Acq92OHHbPZlXarKYVT3Q6RSHLaBwWjWROdZ1JCxmVK5GPkS0MRyUbnOpAQrAeFu2jf
	9udMEIYV8yAbmjd/m35kWRLKWclidDQOQycyqPL0t5uGh6ZsRqEwoirz0yEzH9tgU0MToq/Mn3s
	v+eT2WbvYCD5vW/mvoHnT2aqxYlJYNcowJssofy2ZmdQ0OlecYmmkge6kvUaS2I41nDxZsMHnxe
	MuL75wphegMKIuoy3L1eJROqrkWa0ULJ/mwsWsif1oNLcwNrMyMddKrNBoj8nJ/lPGxSvxFJLu+
	CHLctxzM4DcrKD+a3D7DJoj+/bNDpODpTQQO7WsrIqhjgJM+ESut/6OGhHu3SyBMjGJ4Dny5U+J
	zSC+SFJML/hTmy4fUFgSMczHAVLPsE1WoHk82TJ0pZyqvpRaf+QoO5JSuYdEZ/ts/VGYZMjNB+X
	zgImLuKLj6wqsFXyt9yJnQuRJ9NrDT2Ax5zE+jfL7Goe5/aKbcZnGGJkoDufUhnCNT2XeFubNWk
	6WY+YFz
X-Received: by 2002:a05:6a21:e082:b0:39c:787:f197 with SMTP id adf61e73a8af0-3aab17186femr19074564637.36.1778576068336;
        Tue, 12 May 2026 01:54:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Tue, 12 May 2026 16:53:52 +0800
Message-ID: <20260512085358.1693208-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015429_258386_919B6FFB 
X-CRM114-Status: GOOD (  17.73  )
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
2.54.0.563.g4f69b47b94-goog


