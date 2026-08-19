Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B95C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=; b=EkXbMuqgoYdW0pBdxjjsiGe2yJ
	0mGdBorXIXdiJ1Vw2BTsqmh7DGMg95odUr/fn6NGrC63GTBnbUgczdVVvepCiF1CiZeL9IqtbeSfC
	WTOoF3NAZ3CEufuNFcfoo1NsGF7in0s77q7vqtixUOCG9YV85e4EKD+5FdntRV4xhsoZhDXR9AtS6
	EHEGyYNFyinU4LresV/9u111DYEH8LQLuS2DTwgsLL7kfRAFYovnF9OFvGic5Y0Vs3DIYut46uMHR
	9uTsUy9yxjgKJoUCYNM+U8PJnsguWvaqPAgEow1Yly5zgLlJFbOWeRtf010k8yccE5DFSdEy/TFq3
	TIOJHjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOx-00000009WSn-2Dw9;
	Wed, 19 Aug 2026 10:20:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOH-00000009Vvf-2VRo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=; b=YuULBfTEPB9m/QfvjPhs8tr4oB
	fZxukh+a0cuIH1Mnq9/TG95lBC8Ax+8amC5EpNOzoYSKvIlF2f5EWhTMpo9gLRMhItfEg/ftsNOuc
	32b2Ca54YBMVvL/T72Agh/cD0OizNnvbXvvUrbCrDJ3I8Phns49Lcv+zvyJYl6APjOhzDjJXbBtes
	ntSepn8RlIZs8QGT1hu2KLLWpWZ0j2MLfI4FUUp0XwOP0pEM4LCFYiUgciyJfXQMhnZdv1p6tTlJT
	mzW1j2OWwUaOW3yUQYnHixvUIN/ZAMWGABDw27wIYU966PDfQ97f7rNwI1o/vy1MnsRWpZ/6RwVwI
	TdE01BjQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOE-0000000DUc2-3TFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so8778915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134761; x=1787739561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=;
        b=hh4IJTkFYIWfD/iUuRjaCM+2k91Dg4eokU2A86lMsy42zeeCM4yPxr83jQLfcUx1iW
         Ls/tVUXKYDqY0AQsqng+rDWOcNwePYsjbT2MFNhnoAJjNR5rTkD7AzPJCUteA95yRR+a
         nTt5OKLivqweOOBPlxaTnz0eHxSSw1KW8f5K6i9W70PFpsQ9K+inEGzWXasnl6bY0hnc
         ocbM32pbOlEDZ58BP0vV0JANcwdJLltzjiM57opJXZpn+rZPxeHDzaHIJZOYuKd+ILbE
         GTq2UpImU29gcyeTiD1Tg7NqPsuIzqs/DAM22BZC6y3CaWMo2BcszWxkgZ3FDdyTk2Zx
         2ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134761; x=1787739561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=;
        b=pw8pKtQXbhinUBED/Ij/ht/4SbktRVYm/wHA2ktEmfimlUQcWo/uHqNTa2VAd//vBl
         i2LLH3E+MiAkIBP6D9AZaa/hrxRcvTtstBhR/osOlMXeUJbU069LJKCZsWnxWXW/II5y
         IvI8eJgYHlFJdbFyqxDP7rTPA+04LsFqQdrcPzZ0tT/ZwTtW2VRB6z0loNDQuMLrblGW
         7/BCjNeYOxZwae0wJ9qdp3YGToVtD+hMBzyf8jxMtjH4XkDiKPupRCq2OZNftqgiwydz
         g15fXvt4HyjNnpq9E/Tg5ZLo2aZpGZaC1/i7inekfMiCpzEY28dc0lKn93BCVSc2z1bj
         rZYw==
X-Forwarded-Encrypted: i=1; AHgh+RoWWp/Yn0hyKL5VEzAdhH/cIpYHKGdR+yr/GAGsGUQDSHL1vLgNIrKZBHz3cXWoqXS285LQpiYJ1VgGK1EFAst/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FLqjO0HMSluHcbsgKK2mucGXVlwF9LqFFW2FF2Y6L3PuESUT
	krAP+0C7LxJmW2d2Yq7FJs7QsjvUyMS/41gtvNjik9PmprhfSu41/r+N
X-Gm-Gg: AR+sD11O9S/+O5D9izuXm+dSKV3E+aurIAFTWvolkTYQ0XNZn+GQsc7FfzfW0MAZSYy
	pPt3nibQfe6Q8Ilw63RkHglVbNDEq1diiDc1Ff2QO0RGtr0nZNUtscgr/SarAhXiOyfW4Q0lYyg
	VOWKa4KMfHOkIPk14j2e1eVBw7BQeCFsttwVVEeEIJnlhPR3cfFNH/QFGrSv/PXJCEB3YbvCfhg
	gl8ZYSAUl/fgLdZqLR2A/9Y7muj+62gD/1tQGazERI78rNltdrtfD3VR+2OYciz9b/k+puhsJ7W
	gwO+8WQHbRsG4I6SQClVlIDUkP07OvHrgJgoa2y+UTSUS871/KqGEt/z5+Xx5YQqZRIgeYuEWze
	nt3wh1Xbv8fihW7FKD3E+lD0nUbiTRijCVc2AcBBOnA3uVmlhsXgK7EQBoUFccTwy9hjmo6Z/Vc
	phSKj7DbzEv9akU7AEPeetLp7keBnCsqqgHMXEoAcUCkaq8Cd4UWN9UA==
X-Received: by 2002:a05:600c:3f19:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499aa1499ecmr71419155e9.1.1787134761155;
        Wed, 19 Aug 2026 03:19:21 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:20 -0700 (PDT)
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
Subject: [PATCH v4 5/7] watchdog: mediatek: Add support for mt8167 toprgu/watchdog
Date: Wed, 19 Aug 2026 12:16:26 +0200
Message-ID: <20260819101853.44681-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111922_927938_B79F8B27 
X-CRM114-Status: GOOD (  18.79  )
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

Since according to its data sheet mt8167 toprgu reset bits are not
contiguous, add support for a reset table to the driver. This lets us
define reset identifiers as contiguous indexes in the binding headers.

Also address a preexisting Sashiko finding that noticed that the
has_swsysrst_en configuration was set after the reset controller
registration.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 47 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index f8208fb0f723..fa522fd80dd4 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -78,11 +79,14 @@ struct mtk_wdt_dev {
 	bool disable_wdt_extrst;
 	bool reset_by_toprgu;
 	bool has_swsysrst_en;
+	const u8 *toprgu_sw_rst_tb;
+	int toprgu_sw_rst_num;
 };
 
 struct mtk_wdt_data {
-	int toprgu_sw_rst_num;
-	bool has_swsysrst_en;
+	const u8 *toprgu_sw_rst_tb;
+	const int toprgu_sw_rst_num;
+	const bool has_swsysrst_en;
 };
 
 static const struct mtk_wdt_data mt2712_data = {
@@ -130,6 +134,29 @@ static const struct mtk_wdt_data mt8195_data = {
 	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
 };
 
+static const u8 mt8167_toprgu_sw_rst_tb[] = {
+	[MT8167_TOPRGU_DDRPHY_FLASH_RST]	= 0,
+	[MT8167_TOPRGU_AUD_PAD_RST]		= 1,
+	[MT8167_TOPRGU_MM_RST]			= 2,
+	[MT8167_TOPRGU_MFG_RST]			= 3,
+	[MT8167_TOPRGU_MDSYS_RST]		= 4,
+	[MT8167_TOPRGU_CONN_RST]		= 5,
+	[MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST]	= 6,
+	[MT8167_TOPRGU_DIG_MIPI_TX_RST]		= 7,
+	[MT8167_TOPRGU_SPI_PAD_MACRO_RST]	= 8,
+	/* The data sheet describes bit 9 as "reserved, unused" */
+	[MT8167_TOPRGU_APMIXED_RST]		= 10,
+	[MT8167_TOPRGU_VDEC_RST]		= 11,
+	[MT8167_TOPRGU_CONN_MCU_RST]		= 12,
+	[MT8167_TOPRGU_EFUSE_RST]		= 13,
+	[MT8167_TOPRGU_PWRAP_SPICTL_RST]	= 14
+};
+
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_tb = mt8167_toprgu_sw_rst_tb,
+	.toprgu_sw_rst_num = ARRAY_SIZE(mt8167_toprgu_sw_rst_tb),
+};
+
 /**
  * toprgu_reset_sw_en_unlocked() - enable/disable software control for reset bit
  * @data: Pointer to instance of driver data.
@@ -160,6 +187,15 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 	struct mtk_wdt_dev *data =
 		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
 
+	if (data->toprgu_sw_rst_tb) {
+		if (id >= data->toprgu_sw_rst_num) {
+			dev_err(rcdev->dev, "Invalid reset ID: %lu (>=%u)\n",
+				id, data->toprgu_sw_rst_num);
+			return -EINVAL;
+		}
+		id = data->toprgu_sw_rst_tb[id];
+	}
+
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (assert && data->has_swsysrst_en)
@@ -457,12 +493,14 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	wdt_data = of_device_get_match_data(dev);
 	if (wdt_data) {
+		mtk_wdt->toprgu_sw_rst_num = wdt_data->toprgu_sw_rst_num;
+		mtk_wdt->toprgu_sw_rst_tb = wdt_data->toprgu_sw_rst_tb;
+		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
+
 		err = toprgu_register_reset_controller(pdev,
 						       wdt_data->toprgu_sw_rst_num);
 		if (err)
 			return err;
-
-		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
 	mtk_wdt->disable_wdt_extrst =
@@ -503,6 +541,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


