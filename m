Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A38CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 04:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=; b=n1/JoFhdBeId3RV+EMGSYHfGSp
	zlq8Eag332hAtXU3G0SV5cZZUYUifXx9LoXWl/pVobRbHRYSKatp9Uy5y137Anxk1eDdZTdO9uJms
	e7PHwkyBZsk5n30z3fapxcXHNLE89dDZZSQQ6NXmcTkCpURhCp1G8UIo47fFvKQUyPrijJ87mmgqI
	G9CjrU4v5yin/s5hgY7ROcfoEgLueu2olfvoNQhfhvEraQqYuuX3BJwlbUPlZiu54MP9PHfsjBje6
	g+RkVPFK5nNpWpmkGrJjoltulr1QBeZ36OSk+TynWj+rDw/YZpRxohg+mlrVy733iR5WV7GVRvm5m
	saNejp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTX-0000000E94u-3r7g;
	Mon, 18 May 2026 04:21:07 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpTV-0000000E93H-2YUD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 04:21:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso555037a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 21:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779078064; x=1779682864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=;
        b=IY3HwRLjN4HN6qXWpO0Trq2X3i7W2oz/FIL+ZWS8x5aRkpeM7nY8BFnkHEtkGCWKED
         BWkpejkjZI4qJT2OaD0NJkpuhN4JgjhQk5Of+Cf3W1DSbgMs8iOt8Ivan/+3aDSR8MPQ
         dK90rI2CH3zP7tdno97/KFDYE/Cq4H76a7WXYmq5v4MmG2BCaLSMGtkZ6RztNccQNgGY
         tR+08pE4POatt9VQCLD8vG80Gf4UBsS1pINo+V37J+MH+XZ7L/LhK+I/SgeCIbmwnw3e
         BrU6gMHPrsZfyyoRaTF7F6ptWu8SMoFgfZO9DXx1SHpxDIbtQnSBJV9HbTlBf/F7aFCE
         kYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078064; x=1779682864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1NeYPzkew/lg8N5iZf3wRciXirvXJuukKHofoQ/xo4=;
        b=JNMFhXtgKRfpx/uHuVONqRa10S0fSAL+EZItxr7BCV/9G7MJmtjhWj7MhIJu9u6Wtd
         FE3o3tllvfymx9izlOAraCt33YhO6bHauNfy3Tplo0Fl1KK9jJpP6phJ9QgLUa24YJUu
         QpDnkVsOpSBknBvqOTgJgxu7COjyqDRwbTdBNyBURmol+IpjZ8kaX8DjCkzeGbV0IH9b
         XeEAvr1j/7hAXNNF8bR4m/CfW+P+hFuOKuFanV46cpJ1A09iX7OoWzHMwLtFzU+8TNcv
         Z6TMsZVlV3Hr9fnXgv2dIomXHRqbtHUYvVmDr2pqmm9++pZZT5FDeF/9xR07P1cNitRy
         WbbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1xs2CkqtVtmv+lFBfdSJw+ON0ixtVehXWOmX9v4+mdhYLUWOUsO/OF+6x9xw1YU4cw9Zp8IkvQ8GJQ2SXAA09@lists.infradead.org
X-Gm-Message-State: AOJu0YzgjHaaGkx1WR200GELwH7ps9bjqvpfQb4YFgyBwXnhG6CYXF3M
	lKH6RM26IuhKIqlIBpke9LNmQmRaBkJ6zccYpmeWuBqz/4J0mozNNKHd1j1GIwLw
X-Gm-Gg: Acq92OE0NntncrpKcHxHPFCWz26o66g13KBjbZ2PGkeZFlKuDTrwGn5NFO+tGD3OGIv
	1L6YWye+hDlde4glGSjtWwuTJQkbHW1vd2VMmkzBmyI1yi29Zj75qygZjZegYZuwBqDWNe7WzFJ
	L8cz6KhoYT3frs3ZjuR7q5nFxV0Zw+Qjfkg5xiJMR8lRHQK9Sb2TISllBupAUnNHf4xyCHD5MBg
	TqggTL6QmQFgCayJ9QUDkiQG2B/7MnaArZ5M8bcdG0rtx4TePXtdFkfWvy+u6PtCMz+F4RTngI5
	BM5mGoYFU0dQHECV69kvgRq/fLjoEv27Yc4Cu4I8oGk3zRqS5mQD4ZIroXJpb3qgAa/O99Stqr7
	Ea9mdQGxXHM29IYxjE0sOyyf+FH2vB8I7jX/Guuw9sVzJC9xsmFR1mxDNJitwBGzkYbqFTaHVXn
	cPzmJv4njMzPBKEQj+OS6DVR4bg4lWyfPZAEDXVgFNClfCVg1RLUgHmfrADXzXkSzlFHW7R60Kw
	7JOVtuRcJJ9nnjHMvIC1JwcKtGWm4Y5jQ4=
X-Received: by 2002:a17:902:c194:b0:2ba:6013:eeaf with SMTP id d9443c01a7336-2bd7e8fbda6mr106088815ad.19.1779078064386;
        Sun, 17 May 2026 21:21:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm130747005ad.2.2026.05.17.21.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:21:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] Input: mtk-pmic-keys - use of_device_get_match_data()
Date: Sun, 17 May 2026 21:20:46 -0700
Message-ID: <20260518042046.981861-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_212105_642087_011F363B 
X-CRM114-Status: GOOD (  12.09  )
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

Use of_device_get_match_data() to fetch the PMIC key register data directly instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
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
2.54.0


