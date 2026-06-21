Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0FDCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=MEk4hQwI6NtpI78S3j43CZI0ZY
	mb92esNoBgTTJcWWF5AcURYHh5mixWhtQodOM0Lg0LCxFlyWgfqItn23+1evqG1vpIHLHZ0ChyEQn
	JwVjWX4MYZR6PMYDOv2j3QOhTGNvuf38YHRwtBK7IFPqxaJ0FN4FfQ4X4gLL/NjCjU8uouju45vgj
	sxjpxK0m3jAeW8uuei0YM9fQuoYEKOCK6cwL/J2fzSo7sbSn/lh9ydh9yQwdK4KO5r/S6S8bqA/45
	mA2n8bVxAx+BhBpuJhsV8xStSi4W9SjuaBIeTWyFfirRAIsg6+zms+6cRdQWAu2wy0ChvJZ596oW3
	X3mJD8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDNl-00000003q7p-1mYS;
	Sun, 21 Jun 2026 08:18:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbDNi-00000003q5D-3o6o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 08:18:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b3637b90so25452715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029897; x=1782634697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=m5ouFtHhMhiCxqujRaH+uBSpmUJetoZcc+w8DJICUvKMcL9N9mwlVkYs6MGnXzRRNq
         BSrfEstDTO4IA9ZO4aGGaT2pTqvZUX7E/ezY3ztLcUvHHcxoqAUWaTpQWOJIUwvYyc1K
         HGop32ruIB6W2Db9JckK30o3S0ECWyXlz7Bb/GigfQ67XVIC3+0rfNBBS790c9rVN9zL
         ypxYgBuUuYmpsH4gaAasDSCZricqbcI5F/jyL/i7nMO3ZEG1PDhq6HdGGy+EtG/3gS1z
         T78/4zKwoKyTeHZ7P2di8423EaKyedQLOj6/CDA/T5d2EZR8RNoxcvNU1a8tgDn6STlv
         0ZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029897; x=1782634697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=k6SCjIJIsdb97ABJv34S8cW/TJSL5/U+PKE09o15e7BykP0Q5bSeqbCOLMaxUfhob4
         z6OJWaxLzoWUGqY+cEyBI/GE+B0bsoh9inrI3dCZnnDXaMBdBdTYgA0lrwG48ybt4B5R
         Oe3v5zygTfSMftP3VA65tvdrVTIwjbqo0LbwiTovAxXtPv582a6le8Ump4F2oOn0Nwre
         vKQrwxdWB7GssA9rLtBfEDUMyB+dygZytOdLCK/NgbJQUnCZ1hjFpcbw17nD9qKF76EP
         pYXrkHrideB4+OcXmUqRlmbkyFm9ZDjgRGFFDcHU8W6RgfID0pE2yYHImjbTFTXFzcEP
         LK4w==
X-Forwarded-Encrypted: i=1; AFNElJ8iW+dfkyT79Bk32v83TOSRjSo77U+GbX8+EDGPJpg6ZIBG6w/SyCnwRzXl23hVzpITRQHxDdOmhMIevYQQLxPv@lists.infradead.org
X-Gm-Message-State: AOJu0YzRX1Rjg5bOjtVegR778XnVJ+0gqpZgMnWNEOYVbk4S0qPxKURm
	v+UZLOtjmfRT0KFALa1YMZg421LLnE9eD7xN0eioT4u/3CvMaBndmGr6
X-Gm-Gg: AfdE7cnDGzS2kA6DTGg4O8D9EuREl8dTVI7u0sLNBqnK0IqjlJJsQa5J74huiNl00py
	9B56BpPJb9VAp8VCZkjHF5jm665iKdBO7xLVbseDLbpQAG9SqMwP3ztjc1gdvjSvc22DSVaYSSN
	JYxmEn+vzy0JN8Qhjw4bSWsBWAqFsypY4tjEcUk5gQETTz6rFUlKFdHbuB1MfpvQeZad5feITgi
	gBaXinv9QIYByd3jNprb0LJtE2U5sx+KyYDF0jTAbYX8Cmgy3fvXRulasU/GUXwqi3hE49KGLyv
	Gq8fhxmHO2tzSBWirMqeWT+msr2YzJ1ypEdH5cHrU1lWazWNm5zINjpQNituxTgancmHfyZecaC
	gsvEsIiihh5wVVXxXClxZaEZZyvQsyBvguTFAmdd/0y3Pe6iFr20jK8NZNcDI76qFvSe5Rq1NL7
	fl+Z+Hkw==
X-Received: by 2002:a05:600c:45d2:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4923f596bbbmr163549115e9.37.1782029897128;
        Sun, 21 Jun 2026 01:18:17 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:18:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sun, 21 Jun 2026 10:13:31 +0200
Message-ID: <20260621081634.467858-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_011819_043455_73C02978 
X-CRM114-Status: GOOD (  12.68  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


