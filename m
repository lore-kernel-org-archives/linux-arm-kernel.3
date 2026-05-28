Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F1CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdkMSexsyMB1hw8szrf3taKS9p1kvVYpBmWW3eaAw/8=; b=FhOCqCluBe6rphQ6r9qRCXfc0p
	xfjCcfpiEdGXzj68BHDhZikcaUk2QxnhelZRlIUHPgbiyVQOzh96zDiUk/etKPpP0Sq2EDd0ahdsv
	B2J3aRV6fcXcfla2rKCWb0Sq6mGkP61GJ20MCeE6/gUVpFyuYuJg8LECO37LKA8V8JEOXF+9/SkXZ
	RA5DNHLRHBNLfxE4uyvcLOsWwe1+Qu90E3oE9cUWl4HlmUPyHvr9JWwsE8tWyYTTzZM48C5/pqKBZ
	qbzYdNYuC9Nb/3g5W7E0Mc604dS3zyevmsuEbtJDg/GRNPG2qQj/jKnJsqY5T8OMe7CrhMCla+OxU
	kzXuUEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkaL-00000006YfX-2hIt;
	Thu, 28 May 2026 23:56:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkaI-00000006YeZ-1mxc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:56:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bcd730e090so106551565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 16:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780012577; x=1780617377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdkMSexsyMB1hw8szrf3taKS9p1kvVYpBmWW3eaAw/8=;
        b=hh7grpQrtbRTHPoneiDfbbI1YCOKuwXfHfBOCsDz+XhNKMB36nB2bFYOOgbhKiX1ns
         YiqeOryceqGkZGcLJE2oDMEoPyOiXvfSlhda78yGg4kw+mdeCg5+kcoRluQDQS1xuY2l
         Uy+pEAisJrVeQzJ9sXNtsPksQyycXm7ovGEvSuXcHoOCY8O985K1RJ3vPa+qjEOy0/mY
         hryUGX5+UPKByXxlaBlUsmpTxvaB+cosAksrc0FIAMO3fgnQwC8YvkVnFMH7vWD8dnQB
         e/YXziPdPDAjVd2nEpOBrKZ8bwVFaL03RKxq4YGTv1mYAqpb3EVCJ97hGWIgNzdQPitf
         z7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780012577; x=1780617377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdkMSexsyMB1hw8szrf3taKS9p1kvVYpBmWW3eaAw/8=;
        b=TXvHxWNiK1C7Kv2dHOZgV1u1gqzZhICsyzjHEt/FFEFsScyfOWyoSz5YEZ0w1f3v5U
         RjPuRHcXFu03tOuDRnKrW22jgDytWA/Uiy0zSmbQsLvPiGzDt+lcygOFKNJBdcH95dfO
         eIgWArvYKKRT6BvDHOF0iS8wTd/PsQ1JfcIQmx1rq+eDMY7b7pLMfvKe+A6WBqkRwVJe
         wVywZaPQ0wlLmzJUcrDftKhx9S8tl8HI9U5cF6sbmdkXNGfDEbHAdRWZjaLiRNsM0RhJ
         XcwM68gkElxm4dsvHhWInlttJObxv08TAb4AvtMcJnL/L8N2Sr3XUrhIuyTkcmLd5Rdw
         T+MA==
X-Forwarded-Encrypted: i=1; AFNElJ8BxQBu8NKYpLCplG+2H+7VdsQNM5tpA/fkkBfSKS/OpA0mefE4lt0E+V8iafw0WL7SEK0sSECmZbuzBc5D5BbV@lists.infradead.org
X-Gm-Message-State: AOJu0YziCVISTXa68RtUF54XyDppdnmxXseAvfUedJjQQjQKuIYLG+En
	KWJRa5Ju5uG504fyIVQwtRo3pV5RnkJoGlGsBYmtkm0u+ckml3o7ISML
X-Gm-Gg: Acq92OEFieR+CRn5atrPnwH1VrU0l88MgSAmfqQ/XjQFGQ0WCXfpmc0vgP8DsuZvrbC
	n7hKjBpjWWbgZ4Hok4a5EYtQW1yeAQYs99/HAKTq3xe1XhHOYG+EqmempRw2eZ7eSttMkft3xhm
	dW/azdHVl1IBH16jxiRsmVMCYYnKp/PM45ZW72N9BHZ3fUC+3BVCj4E9HB0z+jK7NkoULCaCu4n
	9wHbRrLX4F01xf+JulGZVS47yGCDyexYzGPlBKTahA7evQSqTol2ITORjsqpjJxUF7eJcxkT6c9
	IKrD4qi3i8D/zi5qvc3htbePyaviS7jH641IcAWua9a1cBam29qPEwn6IpQ+Zb1eIeaoroYSq36
	RMUtvUTLBlbtUyC89fMNDqtf2FffJYwt2SCoxfZhB9JkxaL35cEoP0LfhwhBG/ecf7zV2g7jNqz
	yWkE7SjIMAJKh9Ugmhk9xietJ/G1bYNPtvACzNLLM/Gw6nN0+MOoqsJWCG2s9QKu/LKlh9FI283
	FPhHulN/2Fk9qgvIKN0+5+4AJEvgozKF7+T3Jv1gEQQRwW8yAKpIf21
X-Received: by 2002:a17:902:d2c9:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bf2051107cmr7138865ad.1.1780012577571;
        Thu, 28 May 2026 16:56:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf21e2b72dsm1543595ad.69.2026.05.28.16.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:56:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] Input: mtk-pmic-keys: Count available keys during probe instead of pre-counting
Date: Thu, 28 May 2026 16:56:00 -0700
Message-ID: <20260528235600.312045-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_165618_469561_A3CEDE58 
X-CRM114-Status: GOOD (  17.93  )
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

Replace the separate of_get_available_child_count() pre-count and
validation step with a single pass through for_each_child_of_node_scoped().
Skip unavailable child nodes and bail out if more than
MTK_PMIC_MAX_KEY_COUNT available keys are found. Set nkeys after the
loop so suspend/resume iterate only over initialized entries.

Also use a key variable in the loop for clarity.

Use of_device_get_match_data() to fetch the PMIC key register data directly
instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: OpenCode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 53 ++++++++++++--------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..e34856693ee2 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -16,7 +16,6 @@
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -147,6 +146,7 @@ struct mtk_pmic_keys {
 	struct input_dev *input_dev;
 	struct device *dev;
 	struct regmap *regmap;
+	unsigned int nkeys;
 	struct mtk_pmic_keys_info keys[MTK_PMIC_MAX_KEY_COUNT];
 };
 
@@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
 	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
 	int index;
 
-	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
+	for (index = 0; index < keys->nkeys; index++) {
 		if (keys->keys[index].wakeup) {
 			enable_irq_wake(keys->keys[index].irq);
 			if (keys->keys[index].irq_r > 0)
@@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
 	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
 	int index;
 
-	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
+	for (index = 0; index < keys->nkeys; index++) {
 		if (keys->keys[index].wakeup) {
 			disable_irq_wake(keys->keys[index].irq);
 			if (keys->keys[index].irq_r > 0)
@@ -325,24 +325,23 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl);
 static int mtk_pmic_keys_probe(struct platform_device *pdev)
 {
 	int error, index = 0;
-	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
+	struct mtk_pmic_keys_info *key;
 	struct input_dev *input_dev;
-	const struct of_device_id *of_id =
-		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;
-
 	keys->dev = &pdev->dev;
 	keys->regmap = pmic_chip->regmap;
-	mtk_pmic_regs = of_id->data;
+	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
+	if (!mtk_pmic_regs)
+		return -EINVAL;
 
 	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
 	if (!input_dev) {
@@ -356,31 +355,26 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.product = 0x0001;
 	input_dev->id.version = 0x0001;
 
-	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
-	    keycount > ARRAY_SIZE(irqnames)) {
-		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
-		return -EINVAL;
-	}
+	for_each_available_child_of_node_scoped(node, child) {
+		if (index >= MTK_PMIC_MAX_KEY_COUNT) {
+			dev_err(&pdev->dev, "too many keys defined\n");
+			return -EINVAL;
+		}
 
-	for_each_child_of_node_scoped(node, child) {
-		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
+		key = &keys->keys[index];
+		key->regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq =
-			platform_get_irq_byname(pdev, irqnames[index]);
-		if (keys->keys[index].irq < 0)
-			return keys->keys[index].irq;
+		key->irq = platform_get_irq_byname(pdev, irqnames[index]);
+		if (key->irq < 0)
+			return key->irq;
 
 		if (mtk_pmic_regs->key_release_irq) {
-			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
-									  irqnames_r[index]);
-
-			if (keys->keys[index].irq_r < 0)
-				return keys->keys[index].irq_r;
+			key->irq_r = platform_get_irq_byname(pdev, irqnames_r[index]);
+			if (key->irq_r < 0)
+				return key->irq_r;
 		}
 
-		error = of_property_read_u32(child,
-			"linux,keycodes", &keys->keys[index].keycode);
+		error = of_property_read_u32(child, "linux,keycodes", &key->keycode);
 		if (error) {
 			dev_err(keys->dev,
 				"failed to read key:%d linux,keycode property: %d\n",
@@ -389,14 +383,15 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		}
 
 		if (of_property_read_bool(child, "wakeup-source"))
-			keys->keys[index].wakeup = true;
+			key->wakeup = true;
 
-		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
+		error = mtk_pmic_key_setup(keys, key);
 		if (error)
 			return error;
 
 		index++;
 	}
+	keys->nkeys = index;
 
 	error = input_register_device(input_dev);
 	if (error) {
-- 
2.54.0


