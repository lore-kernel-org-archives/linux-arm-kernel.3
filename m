Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W4sLIw4RFIUe78F3DSloPGw4bbSM10/3iJ2Qj03udfo=; b=OtuBXR+iXKF/xvEyiS86LPpbE+
	0T0Rlw1/73Jxhhtr1miSfSjAU+C+5gRx9M+Jd33ruSXx0y+qbwYZokYW+9t51KSZTNZJF8/JH0+pv
	UOmjomwrN43QUco9pIsf7GRSYxkw9whd+96zOgLkQdsty+VghkhYcEPXdRAKxQrnHTQ8WO5vsXeCc
	+NidKrRersa/2SwYeu8V+II3G8oRCG2VcyBRu568GBcMqqHQ/84354Fl3qSlGNnOjras9EI5xmkUI
	TpVrDfRu2cWYMXwFTzi44PWVCl1UXN17BLoWtb+vdzfWwKjkCnpnv4WZ96VUdUKbMx0Ex8crZ+0Du
	EKW5VW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Dx-0000000H189-3d7T;
	Thu, 03 Sep 2026 09:59:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Dw-0000000H17q-1yRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:59:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9884601DB;
	Thu,  3 Sep 2026 09:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1018A1F000E9;
	Thu,  3 Sep 2026 09:59:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
Date: Thu,  3 Sep 2026 11:59:06 +0200
Message-ID: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use the of_machine_device_match() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/soc/atmel/soc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index d89f9dcade7d2689..7e60c5681ad0d848 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -404,9 +404,7 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 
 static int __init atmel_soc_device_init(void)
 {
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	if (!of_match_node(at91_soc_allowed_list, np))
+	if (!of_machine_device_match(at91_soc_allowed_list))
 		return 0;
 
 	at91_soc_init(socs);
-- 
2.43.0


