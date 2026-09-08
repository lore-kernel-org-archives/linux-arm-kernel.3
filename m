Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9551EC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDZxGaJw3VHG9TEwz+w10G3uJpNDZbfnCjCXATUC2n4=; b=eTBd5Agg0BF4w6T2kOd9zlf6KS
	iTkI/v+gXatZnRDhDxWE+TKENjxXuXf2fy2CNZr0rfNliWoOGoCOKQBGHY0Alv9yxqQfTe8uGcQlA
	floX4X/reCjsQwsKM8UFBxkFJF8K01NyFcTXjTAwIqOXA+P6IeO7f/HQHm3tMOGuDS60H3p/JoHIj
	AMHt2LNPPztwEflA6kQOwcN5Dvy1vifbrFOdWS+jPvPnHhgDTKBmQilv/X+1klmHQ4NHteLd8MiiS
	zjIZmPT5etKv5CWAs+Ab7nD5YMwTUaPSQmXQOrETgH9P6zm9z+btnYG03JN1p+eBWymGLrE9Ie23a
	xVFKTU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs4-00000009ry1-2sb5;
	Tue, 08 Sep 2026 17:44:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs1-00000009rth-3Il1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48436251906so5526163f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889472; x=1789494272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDZxGaJw3VHG9TEwz+w10G3uJpNDZbfnCjCXATUC2n4=;
        b=Du2LZ0AjL79/v9gTCq76sWWY+MBAEY9wR6YW0BN6//6jiUfM9Mi2hldVmCegWjzT8o
         RTUZ+cAmX63T3uM2IKeDSviRV1X0EQQKFU7k2qNwVZCMULfD6shrT3m2EqeT946/GS1a
         2jYj7zjCuR8TUN/RhtzAhCPM3e4wPgXC/HBKDraW5lOQaaA3ckqGwA4ebZg7b5DXNgqO
         hD6RfnAsoHQuCMm41vEv3kPcYT5izWnCt8iXlL52jKfjxyzGzYV/OzjngRJl/4AB+KYD
         aJsRkxPfCYcl+KtW2K8/nSVCOYykzng4A8m77EJTTMHLroSV0Iu2rAwA0kSXu8tFQYKu
         +58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889472; x=1789494272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDZxGaJw3VHG9TEwz+w10G3uJpNDZbfnCjCXATUC2n4=;
        b=ZYUbUr1bc4JBUXXeFZ9GPM1ll++KVP1HaHr5dL4iiF5AxClUh7YFFpyLlOnU7c5GsU
         OKyZOfFpKzK/HsCbT/7/QafZR1WQGMgKfG1z/Z/tg9zKiC9SRNQdl+kDgDRncwjIMTnj
         +5LBb+VfkC/zbtwH0ql3gDczdMdT67rltzNNOu6sbJL3M4tpynJsAR9z3jYRCDa3N+4E
         99saMCpPZQwVF5YGf+H1mvFJ91PwHqr+SMIPXCi1aT/qH4+GXDVJuaw8N0F2PnwYLfC5
         5QkVn6CjTUeDF4UobghC/KXRrMoBLBn4ZJsUJT3G4tQkZyiunF42aRaU0IdqSxUyxqrY
         t5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2kqPX7HzdrV0RD50tKGq60YXY//nwoFZGOb5Mplc7ZrZ6+h2e/5ukB+kFvBX7GAKRMxWQGOHa4mnsh0/LCZKB@lists.infradead.org
X-Gm-Message-State: AFuF++lIAMa3bwSD+QpHzR7+d2tFaM6DXpB9UlWmPOD+ylxBXJk/5tAk
	CASj9CDrdreNFh1CtxlGTaZv+Q8E+h9BgPOMZyEV5hwNoFCIPOnqOWkTXNIMn/Ib
X-Gm-Gg: AYBFou3xkUSblv03/GGIFtMRAxAk6S0goMCc5uw5TKjLGgcjLC0tqplAFr4kE34gw3R
	vBru/s4XRp0e6sXXTM+IvOrHN2orbc5rENSEUYnb8+a4eAMWTT00R9UimXe+m9IIp8i3C/0/u7y
	YgtXo6sSdXBSzIsm0+40Qrzq/jg0vmEdusi83HcWT5AJb5RoGcXNL5Vxe+2FSirP4RXZMNVvhX/
	8pwHfLpDpg1rWvWKcZqV/7HapaRdZ/ErUusgnGhidjpvNbEozAGy9t1ud3Wry/oIUrvGhNAG8CV
	VPPQBbUkBqKsMGnWR3uVcTxb9WVBFNPbJmOW/RmKCprp+gVv6Rv9ledpZNfqFIp2YM/cCH5esLv
	cGRKqjdGEIgtPyfobSO0XiptC7gt4YBBoWwLD9aLhh9TkUa2i1xtTEJPJhy+lcfsxDoUkknDL0q
	tTudELV0Pa4Z25LxuvAQqeOLnWOTVgBebTf9XrZyyypfHrg+xzhSbIOZQ6
X-Received: by 2002:a05:600c:1990:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49cf82524a2mr465943505e9.14.1788889471625;
        Tue, 08 Sep 2026 10:44:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:31 -0700 (PDT)
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
Subject: [PATCH v5 4/8] watchdog: mediatek: Add support for mt8167 toprgu/watchdog
Date: Tue,  8 Sep 2026 19:38:31 +0200
Message-ID: <20260908174259.9009-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104434_490026_CF92F74D 
X-CRM114-Status: GOOD (  21.01  )
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
index d609f0fa35e3..abe58ed6a504 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset/mt2712-resets.h>
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


