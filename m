Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99FBCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=; b=xuu8eR+uKSPa3v2UCioG/GEkXH
	fAczwAyNa7QpwJoIkP3VhXUTDMIgV0jv8vMCsVSbyMmlAIZfibZl3p/ZD7eL6qo0vCG13zCjOOfRc
	AgV/DS1aTFWsJSagZzqDk4sBP5LuqDSE8NEDJqaBo5/uOQBBg3ywemQxKtOoBxu9yabj+a1LvMrVG
	MbNWRXPnZHQNLRIcZ5YzyRrPwOMQq77fLr6geFRC++yiVUV5os311AXoPB22lk7rqr8xOtvOpUIDm
	KuNzf4ov1uoYlsh5NyG1mVePB48XvBk4J78+kgHRwS2WcRlxc8qQhHSC+al2duXwPR76u8QwNdAQy
	1FyH0wUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAa-000000051oH-1P28;
	Thu, 14 May 2026 09:15:52 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAW-000000051jg-1mWF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3331913a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750148; x=1779354948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=ioe7H6PiBCqg5xr2VU40kuybNdMSLkJdmRvFtl4+8uGnqDU79lXlztpVhMBtlFHeK4
         4PZ1wqUmPaprgxdXkPE1YX9yFD3oxCLmPhsXeEtAi1ufeHDXTmdReCFsyvJl/qOXNcqK
         PSNhkaAVumRtVvrTXJf/dgp6Yu1IqY3nX5DzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750148; x=1779354948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=NK3dK+KObGzyogIXb76C6/FqsarRfavAH9V1pgM+UTz6aWU96KfN62/MrVVBXmY5Kx
         hVNUgIMU6eSuw1GJbi2wkvd3NpCmHLSstVhCz2NLJTijx0W2WQU09DnHGkwaJvQqlrtr
         QN2/H/QqxCsKf8i5yhbjY8X6iQhU7J3WwdCsQwS4GhWfSXCzcUnhxC3rfinF5wH8cmPb
         W1Gzrtt6HLH7E7Jpdeyncztk5HofKKByuLn+ormpbFdYkQhu1FJc8AXqaKKWkxnKa0oG
         V3nWVnylotCjMgfZKZQ2C0WLWk8VaYvWpXszgjKhf1GMrCK2Nht1eVc1/7iMe10jgxki
         NjWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ch9vb4qCeytmbGvyEcYBJpMIQP5s/1yEe8vFP0blRLNrx0Gzl1e246Eq5qdD/lcRjqJDWhRacd6PHb89tvi1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGaNfqarjS8k0a6Nt1tBnx3u5UlnntE0RM9VJVzRMF19Y9p0y
	Goq+et7s+EPX7iXXZyBgi2B8WmNDfBrTimadw6SqUks0/ogEnr5WtATOxMYDetAzIw==
X-Gm-Gg: Acq92OGZEFtAcMOJORUzxmjDbMt/i5CTGER0TzEQQszFgy64GzMdgGUCiOdJJ/vpb2z
	X7+WERq5J1o2YDQKn4wPNn4yp9YgcfNbz9mUty76ct1W9wF627yD4BpHNJZYjVwseHMgd6aP4Qx
	xwY9sIF5WVGaFMoNAbR60oyw8bn0vA6714/8Pp4603LKxjSP5pAOakyhcshuEsL8QmBFONZVW1d
	2+7QmUp+O8kV16Xzrm6xUld6QWmFP3DSM2JmL2XRFT/4UzhSSciq1FX+GeAKDbQt5v0V6w/muGn
	4OzZW5OBPMQ7lRpUEJ1jDE2WKSVc0jnvEutcYvpyuYQJYM/EpCc4FraKxNlE+vTlcaPMuRjVph1
	CyK/nndV8J8ZqqrX4+kgcrEKm7EaF0jodnUAR1yWSEzhThjtpS/3wgOIzWynHI7hD2G6aYY+ceu
	ezjitpi/n97YZbD9oeaQpZxikZqBNcZ6cLsjFevs049Da79/UcaGnKQCi9dBp1pIGxTM4sLTSsW
	fUqCF+zHfFOU1TDmvA=
X-Received: by 2002:a05:6a21:9995:b0:3aa:c99b:5c64 with SMTP id adf61e73a8af0-3afb1a0aa29mr7653595637.42.1778750147593;
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
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
Subject: [PATCH v4 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Thu, 14 May 2026 17:15:17 +0800
Message-ID: <20260514091520.2718987-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021548_695521_25182426 
X-CRM114-Status: GOOD (  17.18  )
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


