Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB197F8A16F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=; b=WWqGXqBUDyD8ihiVeFXiMzcjPN
	kreKvi+s1dEdQDw94qF2eFCSQvPmOnBT8DJ4B7sTv9SsNnb+7uxjKxcMfuSmK7sEFDtTuhwZXyzCv
	LDy/nMVpslXJb5HyHRJJw4xLe0dmh7+BXO7M1WJbyVWLd0u+7sRlzg/G/CKIvzrCEw+7zKU4GIANm
	sAHSWv169ThqUoXgAl4bideQiS51vB/+n4GHiNBo2luS1ZrNa+WSmJ1qf2aD2CvLiLTnc43T9yToP
	9lYkx1TKD6NkXg/EwW/d3LV5s6tbdcivIwqwzQSNx4JM08cg5lEBWRUvLkdJ0wY5cdn4B+EkVZgp4
	wKj8D7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMKN-00000002Ss8-1nK7;
	Thu, 16 Apr 2026 13:00:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMKK-00000002SqS-1lRk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:00:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso400690b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 06:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776344411; x=1776949211; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=;
        b=WLpkf8mpvhsFHzqnIkB7GtpwdlOdm1yhzYO5ERbq/SCSBD88Cc932LhIs90dF2dOX7
         glguBmhYjAuPvsXOT5/PDX2BvRPtfXz+ciCBXCHL2HW7NvQrswYWXhUrMe0IAiaQDUHU
         9u1zhyEJXdGjGGhNfzo0/xJErjAO4zLh/xfg1EltbJ9wh/CFK6XQ1WhFAFFsC8Vq+g0l
         /WvjkyB4LvbXJ5tKFTAG6MSjwMaastII5HOEPldOHztB0X6hknsrYu9wddcsFNd5dkV5
         UU3MoOAwmntJiSD6+7HbxS/xMoBX2gORg3Qii5IxSi/4CaaljDsMlZ0U++/qUxbsqvjZ
         DK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344411; x=1776949211;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17r2Zj41sTJHtEDMLkRaAXUCQQ2ej07SXH4WFnjsKcE=;
        b=E5m6DwS80VhwNjp3cjM2sCjz/VObrTIWIaDSLzReoLZ5spufg6QhN+FOdQT5hOU1pw
         re0vs00NRUFOSauPcN68xUzRsWE2/sEzqqajI+Yx5xv3AMPPI90dxx7Hzpd9L2eiPxhl
         pWhd1NW7XpP/q+dc5XCrhmRkXyYLsOFzsN9eqyNMnsBARUPCHsmnYdcBIC1qpFliCaa3
         6FyHCih44o/isxKzJ48+sPLR9ScH4ktTB2fgPzsU7Zmm2vOMyovHbo6w2qeelsLcOn8/
         77pxcBHfY11AWUT/qgLx5jpWQqClVLTW1qpjYvluqBKUlm/hSB/kQG8hJQ5bov9sj3mu
         X7Vw==
X-Forwarded-Encrypted: i=1; AFNElJ8zQxv44oBzLXdHAUVoHKlrrAVAR8fnY9ojdncP7jBWoLvWdewJav9IjgB05xRjKO6dOiijyCGIXqCyHEl6/xa2@lists.infradead.org
X-Gm-Message-State: AOJu0YygX5o+VOLOHZwgG+T71p+s9IsD10pDrs+gr9KwujWZIG/OGMl0
	+J2ReHygZTrRQWPLJ301Q8Jp35rc/MtBHZzENYR9Z8b5CKFcTYzi2zEN
X-Gm-Gg: AeBDieujPrNO8WXBe/rZ4qo2sP8UtLzhqewKIxzHAp81Bqma5Haly7bdhyzWauWu7nu
	s0WNe3g212cx7B/XAd+ZAi/XptRMzAA+JRhBcc8783xRsgcBbLumBQ6KCQMivvG7aSRvNJHSDe/
	FZySITQUY+l+7t2E2gij0yFGVXZ8AJ63sWgZPc3NWtrKlSQ5um6/GZVjq1SvRLORcD8g2oZqlNt
	pOMOaqohkpS1FDJxyp4Qn++r5UiPFKh0FtJijsehb/de+2RLtZi1+jkbvQVD8ztyx7kp3PgbDyO
	xF7C4o2Role+BLmkgJn588yfXYuKmIdZqQb/D0pp3IhgFIIgFeU4SEkSBqIE/3WQFmbXkadjAC5
	70h1QE0sJd/5J4rdFlfFPsSdbh9UALKbyEZjXX1MY/26KZONGQYI+lbWwzynHSdWAjFn/QIy1Nf
	X9v/+ypyZoN9veGj8crDahafubTKPQ7+PufndmiC9haSkvc7Vdj0Tl0vPUHRKOMvkP6MoQ95ckd
	WI/jgn+Va64nIrVijfoMx86oZe2urg6cxcYvTVyjg==
X-Received: by 2002:a05:6a00:4b4f:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-82f7edb955emr1537377b3a.6.1776344411297;
        Thu, 16 Apr 2026 06:00:11 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744c923sm5260199b3a.52.2026.04.16.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:00:10 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 16 Apr 2026 21:00:08 +0800
Subject: [PATCH v2] spi: mtk-snfi: fix memory leak in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-mtk-snfi-v2-1-3f487689dacb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFfd4GkC/0XMQQrDIBCF4auEWdeikojpqvcoWVjjJEOrCRqkJ
 Xj32kDp8n88vh2Si+QSXJodosuUaAk15KkBO5swOUZjbZBcKt6KjvntwVJAYqoTptct5/JuoN7
 X6JBeB3Ubas+UtiW+DzmL7/pD1B/JggmGBq3FUWqN/XXyhp5nu3gYSikfnCK+3aAAAAA=
X-Change-ID: 20260415-mtk-snfi-651a984002ba
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776344408; l=1691;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XkYW2/z4LPsF75ss8CCVDNVzt3DbKPrtELWOw2qUNpY=;
 b=hvqwwc8rcn4/DHqZxkGuqafbHwwzm216tkjP8vosgvZYpH2kNLzP/08UlMoon7Cbdmk3csCV9
 2O2P1E4mabXD2roZXFjRAoh6MQB/XqRSgyNA6jP0ZBdKRjQIYEwkB0X
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_060012_757190_E5D3F6CC 
X-CRM114-Status: GOOD (  13.03  )
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

ms->buf is allocated in mtk_snand_setup_pagefmt() but was not freed on
the following error paths.

Fixes: 2b1e19811a8e ("spi: mtk-snfi: Change default page format to setup default setting")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Mark's comment.
- Link to v1: https://lore.kernel.org/r/20260416-mtk-snfi-v1-1-fafccfd288f9@gmail.com
---
 drivers/spi/spi-mtk-snfi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 73fa84475f0e..e616e6800e92 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1447,14 +1447,14 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = nand_ecc_register_on_host_hw_engine(&ms->ecc_eng);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ecc engine.\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
 				       &ms->ecc_eng);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "failed to add ECC unregister action\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	ctlr->num_chipselect = 1;
@@ -1465,10 +1465,12 @@ static int mtk_snand_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed.\n");
-		goto release_ecc;
+		goto free_buf;
 	}
 
 	return 0;
+free_buf:
+	kfree(ms->buf);
 release_ecc:
 	mtk_ecc_release(ms->ecc);
 	return ret;

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-mtk-snfi-651a984002ba

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


