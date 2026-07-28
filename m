Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5241C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=; b=v3asdCbztcwkupLyDF5+CP+YQn
	WkZSPMHgJktIonNU9kGR2P4eIy4uoYxGlEcqULPnvAKIAjpjI6q+4eWclZLaoI/8npWnicInd2Gd5
	le2mQ+zxMU3Kvlk3/Bw1B+sTjDXyJRj3b6LmYtxQyt1OAaLLGSr8vV+t7KdkljEa6T981Y10ILQIA
	BbitU1KX25JsX3OQqQIgYHJOsZx9C6rAbJEKPMt9kHl1dduWb2J1ZNgHvTSeSbWpHA2Zu/fcUJBva
	jiKnG1d83v1VJHlTo5PYTQKxbvSO61KoNzgTXt0pTgsxau8Cq7kASmgxhAwxQcbrPFn/3KW2h2Glr
	7uGh8qDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopID-00000006JVB-14Af;
	Tue, 28 Jul 2026 21:24:53 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI5-00000006JQP-1I4B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:24:46 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-848d21bbaffso322521b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273884; x=1785878684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=;
        b=gHWA8h5s/Kj9mIpLglvYI3VdExma4PEvqG7y8C7+C9FMUvzTzyyaLzOVKWCGAkX12q
         AW+IYcLQhS8ikAKfWKdGjCs099d5+tgiO2g3fxId6ycqLURIFnRkiyWXaCCTChMCrHyI
         tvI89nlarWUqdNWusr/h8xl7HcbNEtV0ZRQPa0b/JfDhEEjnkDR+3WDIfyFCvpyQvyTK
         Mw/80sYH4pxMvG6ERS03ckYaoFFNWuD+mDQpeWABaOAcxSUzXdecGterqYtWmKn/8pX1
         g7pL6EVQdgcGMMekfWsS/O+5CNCuSmZCKv3Ran3TfpYcsw8yRPU9flHttN1qXXOFN/3D
         RE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273884; x=1785878684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhOoxyY9XuY/7ZJoPHMRfd57Gx1dlBIuWfd2YjK3Wy4=;
        b=snhT3QKfpE2NRhJaOVmg9uPZ8v9Za9wYzYmUG7g6Pg36akvORq4vRJtahQXKc2f3+c
         XQbjcwFsH0f/P4bfK2FfF8J8poGUEi9H8wSDqYe5AfH1TjesdiVUsnJj6/9aQzkmk1Oj
         0plsXnqSBuQ9kpYVmnpEHp5TDfXfXNz1+FKZYFlla23n1J/TFDJIlDqwZGccwyXqlpaC
         Cyr/s9Ce8X6q3Dijc3qLw0i8Wdu71Du43FCLDLbcLlhyCRitFfkwBTfnREHe8baQ1PI2
         iddDC2lokwor4rcg7E5ChKXL+fs9QcV0duzz/Nhtg0PCp01E07TYhWkP3wM9lB4ib0SR
         KfQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy89/6eHZNb6TFxs5IStBpjWK0NnH5p1Xg2CKGyanwRyYGLcIO8B7JIXC2luJGQoEf+RcdonsK1j6LLl7FOPyt@lists.infradead.org
X-Gm-Message-State: AOJu0YwXHh/hPpWOqCFIXraeKZEFsHusnSFakrFXKTMVBeU8p5fNqQBP
	HaObJRoUnzHa8XXtUDzyGl15VSQeLaGpejCsD7JV2002i8Vfdu0bZOrt
X-Gm-Gg: AR+sD1354h85zuHfP8guIBaeOY4U1TZREbcNKgWr43JsXB7QVaxMnXnAY8DvV10sl7q
	o6+iARFeO34PPfXEbHUznEu7BjwxU2lDRdbENG9bhH5iMHhVY3wKXyg6r6jzxbpThtb7bJ9bxhe
	J2nwYOnK5MCNRV5J9Afonw49IRGNQqOsVUHYb6A5GNFSvN5n9aFwh3oZK6ULYvAkbg3V2+Vp6vn
	Uk+czNKyIXelrOLx6yQ+WcyjoWykc+/3MdOGpoFwm59Bdr1w/Jr/Gcmz7Z4gVGWsvYirrZJiK2w
	R5nqmJebzYxAsAs8YEWnnpsQhetcg6iRzlCozVvEzzGkXMCXK8+s670uldxsVgHuNW1yY2zeLQ3
	NRGo4hCOpZSWmJgSHem0zwtYY2aiI0cuu9Pk1/heW9nsBJIQadxb5r5Ys9vEpBNqvvfEroLIQHt
	byLA1xiwaRTDdSEK6pcHmNARPuVa/fM8e4IifgIAlvAa97eBcMdURIKlTtBBL5E0jm/se27CXeK
	NlkZ3rngW5k7Plyl3/hkrAZ26ygwLxorLE1jgKrjkbYgJffsmK/QsxEkpBN63dY70Ya4bzSFVjW
	TzmlDxS6Pyw25oYZvNpdf4qZvuVypBD7oi7tfmY0wupbSgR9
X-Received: by 2002:a05:6a00:10c6:b0:848:2f84:730 with SMTP id d2e1a72fcca58-84e932e462emr3887694b3a.67.1785273884409;
        Tue, 28 Jul 2026 14:24:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm80892a12.14.2026.07.28.14.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:24:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 1/2] Input: mtk-pmic-keys: use of_device_get_match_data()
Date: Tue, 28 Jul 2026 14:24:37 -0700
Message-ID: <20260728212438.54078-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728212438.54078-1-rosenp@gmail.com>
References: <20260728212438.54078-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142445_352285_C0C1F6D5 
X-CRM114-Status: GOOD (  13.42  )
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

Instead of open coding it, use the proper function.

All entries have a corresponding data entry so a NULL check is not
applied here.

Remove of_device.h as a result.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..fd684ac16938 100644
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
@@ -333,8 +332,6 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
-	const struct of_device_id *of_id =
-		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
@@ -342,7 +339,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 
 	keys->dev = &pdev->dev;
 	keys->regmap = pmic_chip->regmap;
-	mtk_pmic_regs = of_id->data;
+	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
 
 	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
 	if (!input_dev) {
-- 
2.55.0


