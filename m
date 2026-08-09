Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46589C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=; b=MTTetmduLN+VUb4pGUun/kDY3a
	h0zyh+qfXQd2qJlTfiBofv5rneSJWjX+GJccnl34NFgJYTPv7dFg3mZiiQGL+HH8Ry3MhYnidkkFw
	J/Rmwy/X7RcmHLgskXb545i3TxyH3nea47tyJ6G8aXAmMF8GY993DqRUhYtgccSkjUGDycdJ3PaZq
	YnoG/HWdO3SpCWHDKnAbzRKHWQMtHdUwRumJX3LGTHNfKDiWncsz5u0gSTTvRzCnzCeTER6loUxGP
	P91zuzP9t8hN2LA1wwQCVp8Q4JT2g49c5/5fODN8O/EF75cVnB1eQVJq6Eal/MyUBmgsuI1jgcArl
	mWJUuVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63M-0000000ATDY-0nKk;
	Sun, 09 Aug 2026 16:07:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63J-0000000ATAC-07Bx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49802c418b5so9947675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291627; x=1786896427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=Dgy3wc7iVFt5ufhvkVWfPpw2/Io+VXi2mpELwXjRI8/Xhdo2jz0douq7KK/WxI59Xp
         2glR1FUN+RjeNcdy4hBFOyfMQJ6oEP/swlTL9kVPJ19X6NCnpZvVwjpCeD0Yleix2lsT
         i5uFXT28Qi1M30Xu/EtNaDmvjllmfsU1C+vYdUiN/wcGxqNTEtb2/BpA/PdNECJZGO8h
         G54Y9eDheN5UiGsPgqIWf/OZcyOM3zcJQduHDHrfxUGXn1KG/FWXe5Uv0v0DHgYVd3RY
         0E+P2WnRAutuw4hEYVlvY3wyKwNfb+RwysBnC0WIWdijz9uusOjRdm9bY8IUirUvhXt2
         1QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291627; x=1786896427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=VLZnAUaxb+daKrRPy1DODkWvOJZJIDptHmBxS5LRIk3mAUZkIZO6e4fu6Q3IATT4RY
         L5nC6HcCXlSrbgU6YF1d4hRQRft5D1Up9yuyql1jPozHrtkBnelYpIY0OsPZDxd9kDic
         bslfEjy0MviaKAJY2ELuoGZJA/IAxU5yf4oUB+G6RnbXwFQng4t4Q35LpWB6ybC0UZnQ
         YuUfA2vjqp0i1VdCtZ6fdMj8dPEpLO18A52fVo/8nHcOBdJl00V4fKBnoBl3qfiT3FAy
         2kHQsl648556WdYEpqXEtCLdNbe2XVgskNv8RiJZHklusnWCMOTdLsa49mxYo1h1DJAm
         m8DA==
X-Forwarded-Encrypted: i=1; AHgh+RrrEzfxaVaoRFy2fUhStdhze7/AuBxpieuktSYWJGD8tjqk3c9kJQvPqKNVt+fM3F3iqZw5BbYzjGIw/ev6TVZU@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTgL7gf3+EAQEPLuPmp3x6whS+qv88M2vjTLq9dkF7JtlmlaE
	Zb8ANZ9S0l8irBxPkAQ0EaA0OCZOCLgRPCo+d5XEe4WkMIj652ogjb+s
X-Gm-Gg: AR+sD12rFgnSYcfDjV9YgwD90PJ+us54uiUzjVWcDwP3ucBFEbsZ894+eg+WB57/1c+
	eWgyuNNTKkR+xwrw0xeopI5vQHRrQeqLYF65F7ve4EocRFlRTHRT14+PimXLTl710PNWfgy7f5/
	4vUh3kvI7OcrlQ/nAC3R19clQBcKKxx2RWdgqlRpP2jJTtlgHtxlUF+MeqR6+cEzkQoudxJORC5
	aluEM76UfDs/go+MktWSPiYj826PwPyeCfdho3aJCQrxNjALXBubKvPDCTHsxUAWGukRP8fZ9U+
	Aa2Rl7G8i9r6xaPw8koSXaupyb6BKwFBsiBjMzpt2wL7PAcA8tuSW3wTUWdCAbgJzCrDmiONTRU
	Kas0+MUvBDamIl1B2jWJcf1WW1paYEwFl8IKagI/shXmPOMhwRIWr/b95YA/O1s415EqD32jU+p
	30uY5/zjZHwMbq5vV/+YmdSuBL1PzEIk9TXNMR0LJ+4T0wlc9mZbSzkw==
X-Received: by 2002:a05:600c:3b88:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-4996194e24bmr211098485e9.1.1786291627278;
        Sun, 09 Aug 2026 09:07:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/8] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Sun,  9 Aug 2026 18:03:26 +0200
Message-ID: <20260809160643.33991-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090709_080641_1C27525B 
X-CRM114-Status: GOOD (  14.10  )
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

According to Android sources, MT6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..e61f6ae74327 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


