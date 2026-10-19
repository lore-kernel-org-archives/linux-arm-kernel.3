Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17651CCF2D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 00:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTrxHZaNJB/8wFejFSbIssAMAHd8tsnsHj4KiMewDzg=; b=XyHEKiQ4LGcuW9y50woNR23IYx
	KvBojLgCckLSuR4ZOdXhATwbLkf+ylspich9Kj+seKfDG6qfyl4KuC3Mz/0WnTL1dy6qNTYRZsxLU
	y1XTTMix8RdywXsHReDl2qGSPLTT8Wv21MKwayQYSxRSFMlFNwZ5Y0VsrU8VwYRJ2RBOpVLLvTVeE
	Xk1ePYzC+wahMuoXX8da8mY+wOrGzluRg+jiYUCQDE1WaAaYeMcOamwB76EaGNDgdWKwYhagsuWvi
	li6wA2kuV/z0JCnaXXoEKnjxKE/JYcOKUhaKNtflkr/CfHtHW4seWrIEJdfAJS38t/CUwGYJRAsBZ
	aIbecRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQk-00000006LGF-1OVp;
	Mon, 19 Oct 2026 00:40:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIbQi-00000006LDo-2zaQ;
	Mon, 19 Oct 2026 00:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0FF644814;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C7ECC4AF14;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792370443;
	bh=Okf9cZqs2tuosAZqVM6N50l4ODVk87pJ02XFJIFdg1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r/Nfzld2+qEsmWbQyzk8NdmH0r752Fwkre3gsPIK4FBZvjzlq7Uib8a+lG6MAB3La
	 PHr9ciU9U9G/cLtgahLCHkkT1Ako0xdvrhZ3mi+fnLyWwQts/nN0RglsARc5c/lSOy
	 7dbjPBFb58SKtIaeEwZhVTg/NkilkUOdlvVkU8BQy35MF0s4vkAuL8t241SpzvVl/5
	 ItWb6yyTXi36iLk7xNSV1+/+mAwTJ6uySiTJE6N4tNDaQOpH9J84jXOJZOgej2AG2t
	 rQ2Eek0edwyMXO+DkjkMxXIp5wzgBbGoVgwQuBrU9BtNkPWDXfAbHx55NJ4gDZRFST
	 HDVQBg5vjyAEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69935CCF2D4;
	Mon, 19 Oct 2026 00:40:43 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Mon, 19 Oct 2026 01:40:02 +0100
Subject: [PATCH 6/8] watchdog: mediatek: Add support for MT8163 TOPRGU/WDT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792370441; l=1544;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=/XTNZ0sJc5waPCmXjLC0TBnLTxhdHSp17UVgQTVrcOk=;
 b=9D6DQ5YEYoCFOvrvWp1BbWcmknxj8b+1B1kqQkshIu/XlI0b7gwW+LxkowQ591ZAtqpzpaqJl
 4sxYm6Pi5RSBHAy8FNOmRMon9XRZGxzEgy00AXgppSlSwETOELBdjXj
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
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
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ben Grisdale <bengris32@protonmail.ch>

Add support for the Top Reset Generation Unit (TOPRGU) and watchdog
timer on the MediaTek MT8163 SoC, which provides 15 software resets.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..0c6efa2e851d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -70,6 +70,7 @@
 
 #define MT6589_TOPRGU_SW_RST_NUM	12
 #define MT7988_TOPRGU_SW_RST_NUM	24
+#define MT8163_TOPRGU_SW_RST_NUM	15
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
@@ -117,6 +118,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8163_data = {
+	.toprgu_sw_rst_num = MT8163_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -597,6 +602,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8163-wdt", .data = &mt8163_data },
 	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },

-- 
2.56.0



