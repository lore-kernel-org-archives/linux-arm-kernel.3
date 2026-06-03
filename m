Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EF5CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBYTSeXQapsOuHzeBt9LtaLn+b+KZK8UfNhCrwV35RE=; b=ONKzPzAw/I6OKwWn36Dx9AeXsT
	5ZWvPtLPzd4sCOg7NW7ZsQj3lOa/tRYXlKg4EODG06R/OU4R4Zz3izBBaP35VpV5mAOG+mU8KZYer
	Q929QB0ZuNoIYkSgbEH4y1vG1nQPjDZUNQ9iZ3LhJ5pGzfNJJQNH7bOhaFUoymNidd6pPixFabeya
	QoVTHt0PORvwWv9mIWeWI0gpqqzDGzZqkdyWl1L3lKaOaqknKfzGxGY9E4YxYdM/Ha/CgjAohutYL
	bwAxYt3CwdZcqh5dsiL8UiXYJnjBjs07JKSFYC99KU3+WWIa4j4uDCovk/SX0rS4RHN8MIKcUHMNt
	W4eOYf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZuK-0000000E0mJ-1C9T;
	Wed, 03 Jun 2026 00:56:32 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZuI-0000000E0lo-0mRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 00:56:31 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5175b6c4e19so23569681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 17:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780448189; x=1781052989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBYTSeXQapsOuHzeBt9LtaLn+b+KZK8UfNhCrwV35RE=;
        b=AaVOxEs+iepImi4BRUqC/14tGD7fbkzJfqUb1jqHt3ODj5NhU/QzSmZ4vS7HLPrL+B
         X4P+hDMUfGnw+cS+Bdkd0N7MzEgGz5P5udmynsf9zt3+uOjSJTTtb5exzERCilAKV7dM
         t3WoXKxDGfa2TRdI0YZMX2goHwlV6MaHRE9NRd6uoiOas9zHUzrE3OjlkER+Iwdj28Af
         +uzBodwqh+rNsmGoKyqdtJIU8sJ0748PY2MJzDsB6v75NLH1oRQ+BneXlu++LLWGGzmL
         +t8JprBYGY6/jHb6QO+tZIwPvJA1QKYeyz3zW4QeGPvaxVXqn+Yal67BHaUY34dovmAH
         NwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448189; x=1781052989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBYTSeXQapsOuHzeBt9LtaLn+b+KZK8UfNhCrwV35RE=;
        b=Lwkiv1YSv0D6kbn/EO2JgO4rJUGvL/4YjypPcsgKFDTT9HCseI1WkEhLTkwQMkYpWK
         ORX8ur0XxvYCaQE56rOv5xU1wfknWN+DBD5ZrPRy0PwORvJ5CF+48bcUCmx3y2UihsuA
         U7+sHXhzTOHCMiAejq8rY0xqi/VDBVYAQMNVOalCgmHCwchhVulgny3YkbETR/XeKxSY
         AiBjmq7uqQUKRSxOo8ZVoqzkGaa9ISlqeZAm5JzEBePfbA1+SQ5xUECGX8opsGINbFQY
         igCmRCxwVyIsgf0R7IZqVWBo2p0QCNGDD1rTaGziF8fi2cPzJEyZQ8RQdfCaQKJIAHw9
         B1vA==
X-Forwarded-Encrypted: i=1; AFNElJ+PjOfpByLJp4/Ji+WbIzM6y8kBl5kZIEcx6d+K61yyB/k7d8f/3PIy+jAO4YGz3/h2jGdjhyzBSw8TqgvGByOC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2enzuSeyt88kdkGgOEaeSuzlSP95ZXuS186IbhrxemT0/MYWS
	BKbfIFTzdYWBuksrl2FmDg9tbFDZZoRW74fUZN+y28kRnAkry/KCRWuI
X-Gm-Gg: Acq92OFtPEwy0XkVrm+rM2zB3aBX3J+Hh+UMZQx0zRICjBdnXE6DjcxXoc5adad39FN
	ebI3r29M1dfHSuW2FgJeJK1P5z3eIZ5pzCNq9YnnQx7COd1Tg6MLpA0ktLmlu3vyXkt8Cg47/zR
	JeC8prOo1F8xrf07pkQ6GKUFY7bVob8zWpxw6g77kKyHSqTfrcPCYyNb/BWoq2ShbZe5IyDlH6n
	mTuWs6q/W+lUwUTPXqjOJeacmiVaf06uLMVJQOFMFCZqL/mXNFtg02zo79YoF2GBvdy3tWNsVVV
	w0bKh0PBmV2yebzyO5JqGeu6RLXN+bzwSf/TxAiSecYpJcVXly09lVwjoECM94FeyC5r5Df1AOP
	0LlyCCkcacHraqZY9rNDsypq0nZthQJJkMZgrNaDs5pFK2P2R4JU6Db/UOAEw2K6QUHWKsJmH36
	rgXDLjhG0SGZC7CPTCCJ7qpAcIjWbMMfEw7XrQEavqrNncEJuny2c8n1gt9iuuOZ2Gha+TNvcdZ
	JJ0+h1q0chYz5lk3nZ+WxHPGnOkAw6ZiEkntSeuJzvM0g==
X-Received: by 2002:a05:620a:6403:b0:914:9ecb:9adb with SMTP id af79cd13be357-9158a834e25mr269631485a.50.1780448188737;
        Tue, 02 Jun 2026 17:56:28 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00ac5esm99574885a.6.2026.06.02.17.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:56:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/samsung: Use platform_get_irq() in exynos_tmu
Date: Tue,  2 Jun 2026 17:56:08 -0700
Message-ID: <20260603005608.227153-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_175630_227913_FC8CC468 
X-CRM114-Status: GOOD (  12.75  )
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

Replace deprecated irq_of_parse_and_map() with platform_get_irq() for IRQ
retrieval in exynos_tmu, and change error handling to propagate the error
code directly. This improves maintainability and aligns with standard
driver practices. irq_of_parse_and_map() requires irq_dispose_mapping(),
which is missing.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..ff81b81b4532 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -846,10 +846,10 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	if (!data || !pdev->dev.of_node)
 		return -ENODEV;
 
-	data->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (data->irq <= 0) {
+	data->irq = platform_get_irq(pdev, 0);
+	if (data->irq < 0) {
 		dev_err(&pdev->dev, "failed to get IRQ\n");
-		return -ENODEV;
+		return data->irq;
 	}
 
 	if (of_address_to_resource(pdev->dev.of_node, 0, &res)) {
-- 
2.54.0


