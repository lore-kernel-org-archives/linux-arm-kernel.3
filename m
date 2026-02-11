Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C02DECD6E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=; b=ccUkDVQ2EoOO4NO8khenKIGpZL
	77xFD2hPf9OkH6wNPEJC89ObtdA4ucTLkZh3lXJeic5yQhLxpdGP6Gfz7+uk4nX6SYj7RkoQHJzdM
	YFrVWdc1k4mpasrmFKf4aiqgEf1DHE94TWztLZWNuYhoUcF2Tt38G0UQRU8t6yY5Z3+Rnd57lZ/nv
	ZNuXlyhliM2idCraH2Tf43YJQhS1kFqf2IfjGhyu8Sfjnh6QNtYHcNhHfNbAOrtiT+3nh1HuMYVZM
	T2RbB7Ppr+sGt2GjLaFfqNPOtjz8+aVoQknymKyZJg5y/LPYIvUMRwbsjcBoZJeJEOcgSmJvYltgk
	X0ukV7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXi-00000000xUa-2Fcg;
	Wed, 11 Feb 2026 19:06:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXg-00000000xRW-32aA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-436e87589e8so3382816f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836787; x=1771441587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=ZuAmbML7ZbXpag+DaeVObdRAzWlmKxPvAVzhAno2tKQCf8jySqQAynPqTr8atPa2pD
         nsr1dYNjR3xpOViP5LvtpgF4CbWAMErD5e6VVCQQU+4cX8nXV4HZ/2Pn2KiAO38m0kIL
         7ZIONz3f4qSdDZ+PHziHQnmlCt7D2J3his3+yQ++U73Rjb7Rs+5D8XFccT7msL+DCKLH
         iW2Uj/NvK58U0d+V2hxl/noWxTqUnmoSQGO2DqtoH5Ow2Egxsh25qAcgqJdYjL1xNHHt
         u3YIruM2b0pRB+JX/3dcu68ynp1bnxX0hmqkNkiidZaYU21B5IwYTFGqj+fR+gaurufS
         5PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836787; x=1771441587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=vyHhWaevqXNH9K/YRd/5xLirmKqCOmS9Hl6V4vrDYmkNAjigjBaZbmh9SIxuH7i+/d
         xPWZVtx1g1uU+qncI17DgHOhhNle2E+grlAGo4Z+cr+KUQLOZyWLIAeNX5RnC49p07V8
         1cJZTTbT240LxcKdZ1q+R4IX0n1UyKJfZvDLZ1dJ2iqBN6eWQUsj4lOjvXHp960Qp3jV
         9YptCdbMKopXxYPmzBhCu6u5rccZXTcZ7PMZxluc0I4pIDR03mSmP3c19MdgQngGkX9z
         OQnK/KV0orWLDVR1djJbHAUMQo9eLVKf81u2/vUn4WeATDIw2WS3zB/9DkGY8SNzLB2D
         KWvA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Hgus9WJXTtAjkuYq3eF2oFUq9UgOYrk2P2tltXJAEpfI1TvwPKK0dQnPj2MshqkeyQYBh+y0eF/MAFNAIrTx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxff+fEq+Vjm62RKozPO2KfiGcp2/YvlwNbRyciBI/azdC6u+//
	2QE0d5Y5sqddq6GrZVDBVaohuQ5ecy7wWK+aC1W8qzHft9NH1TjBiDf8
X-Gm-Gg: AZuq6aKan5k6uTsDti6Qp2yzizQplSG5hDleAyLT/7b4lbEsRiAXOWIpiqrp7dKgrte
	XPQx8X0d/ExIq2L5dLh1cA66W2iR34bKxyktHQIN0Rrs9lZuzyRyNqIb0E9ICwkvI1BnIblMDW6
	L0PRFeeuU7DO/DX0Ggx/JV+a17pYYDtutFqxP0gYe3x8HO//wEr+h927AOKDLex30w6zguxWQ0c
	Z6quv7ob5PiQeC68+E17k37segVnzXErdbvP4U3bkrHrsZLDx7n40WvwcP95aWKTpUgUtt/2lZX
	SaE/4yvFmjFcFXDktMbhzr9atIXc7Bs+8K3aMDTmepfu1XSTQbkZ/j6ALc61s5IDcqUNLiiz8Fh
	oKBO+w4E2fxk9iOnOODSDDS86jRWtkWPdgCh0pOwfYNx7NfX5pVKi3jCEPsq8ON+EGtSAlDocio
	Orn/MeloyMrdO51GZ7x90=
X-Received: by 2002:a05:6000:2888:b0:436:3267:3edd with SMTP id ffacd0b85a97d-4378acf76ddmr638334f8f.22.1770836786611;
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
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
Subject: [PATCH 3/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Wed, 11 Feb 2026 19:03:24 +0000
Message-ID: <77434edba7ab5050f5c0fd03302bf9eb4b1c60ca.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110628_779658_30EBE11F 
X-CRM114-Status: GOOD (  12.40  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..ded16173105b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
 #include <dt-bindings/reset/mt8188-resets.h>
@@ -105,6 +106,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -498,6 +503,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


