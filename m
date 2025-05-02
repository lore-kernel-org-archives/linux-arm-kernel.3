Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7813C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WjZ/X+9NMMif7OyiK71JbAQs+u2dkiGWcjzAyUuvLBE=; b=kUqmIb+69U02S/Zhw3ft8Ngjih
	wKLpEoxy5zy8dX+/kaeDBPYzD2cxlMZKNDGl/ikfGQyxK3sAMIfe5rQpvbP/7MPmrwCiPyNHzWFar
	gc4F2dvlYIg1D+4+oAt6bfGNuQa/aREqU0Afe5ApoLFsg57cfiyXhmuvv9XlxKHNGYkXsxsSIixj3
	gHFdV2xAY5XHFwf1BsCjriqfEOPCbJ7s4I24j53xJv3WtevD7SAl0phFtWV+Fn4iS5D3Z1EHnEOV/
	YCQnYzZMHA7YpH7ubm2qEzAYJuPh65gIebCFSi88i7M1uFBv1zNtMAZvMqzg2ofGKMJLXHMe4wQhj
	JxeTdQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArx3-00000002Gqi-1BaZ;
	Fri, 02 May 2025 15:05:21 +0000
Received: from smtp-72.smtpout.orange.fr ([80.12.242.72] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArjw-00000002FR3-1vLn;
	Fri, 02 May 2025 14:51:51 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ArjhuI7RsSMUrArjkuJEbc; Fri, 02 May 2025 16:51:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746197498;
	bh=WjZ/X+9NMMif7OyiK71JbAQs+u2dkiGWcjzAyUuvLBE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=sjMryabDPp3Mn5I/w6t+4ZGxjGnRvLA5GTEcOeCkqKLheOAxYapN5MAMkZERbzquh
	 TkCOBHPRIJY0b0AdgrebihxkMK9OS5ca+C3UAruXgUiU8tyCtQIr5b/HqjiU5yOrvG
	 096tcr91wUm/QjeEqQNG+V9DXmZiZX8DIaBeJkNYUg/PMGF6E1Nu5wT1tHKWfilj7B
	 lX+LtLMti9wgy+KcXXg+PTOrfu/koKViCBjKbeeUzzAB9AEqIoEzqeQUvxifp6aXsf
	 JixqSrCg5LUJA9LSqN4VgX3WQ78XEVSeRikJSXAOwLkzBgb7haJwUjNA5/WMDJYeNi
	 snSrYBV9RGG9w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 02 May 2025 16:51:38 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] leds: rgb: leds-mt6370-rgb: Improve definition of some struct linear_range
Date: Fri,  2 May 2025 16:51:22 +0200
Message-ID: <1ce4245107e0a51dce502a007a69899bda018d5f.1746197460.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_075148_626282_845A1685 
X-CRM114-Status: GOOD (  10.58  )
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

Use LINEAR_RANGE() instead of hand-writing it. It is more robust, should
the layout of the structure change one day.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index ebd3ba878dd5..c5927d0eb830 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -199,17 +199,17 @@ static const struct reg_field mt6372_reg_fields[F_MAX_FIELDS] = {
 
 /* Current unit: microamp, time unit: millisecond */
 static const struct linear_range common_led_ranges[R_MAX_RANGES] = {
-	[R_LED123_CURR]	= { 4000, 1, 6, 4000 },
-	[R_LED4_CURR]	= { 2000, 1, 3, 2000 },
-	[R_LED_TRFON]	= { 125, 0, 15, 200 },
-	[R_LED_TOFF]	= { 250, 0, 15, 400 },
+	[R_LED123_CURR]	= LINEAR_RANGE(4000, 1, 6, 4000),
+	[R_LED4_CURR]	= LINEAR_RANGE(2000, 1, 3, 2000),
+	[R_LED_TRFON]	= LINEAR_RANGE(125, 0, 15, 200),
+	[R_LED_TOFF]	= LINEAR_RANGE(250, 0, 15, 400),
 };
 
 static const struct linear_range mt6372_led_ranges[R_MAX_RANGES] = {
-	[R_LED123_CURR]	= { 2000, 1, 14, 2000 },
-	[R_LED4_CURR]	= { 2000, 1, 14, 2000 },
-	[R_LED_TRFON]	= { 125, 0, 15, 250 },
-	[R_LED_TOFF]	= { 250, 0, 15, 500 },
+	[R_LED123_CURR]	= LINEAR_RANGE(2000, 1, 14, 2000),
+	[R_LED4_CURR]	= LINEAR_RANGE(2000, 1, 14, 2000),
+	[R_LED_TRFON]	= LINEAR_RANGE(125, 0, 15, 250),
+	[R_LED_TOFF]	= LINEAR_RANGE(250, 0, 15, 500),
 };
 
 static const unsigned int common_tfreqs[] = {
-- 
2.49.0


