Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BB6EF8FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W4sLIw4RFIUe78F3DSloPGw4bbSM10/3iJ2Qj03udfo=; b=KWhx9Z6hxaV2weDotZR0LKcew5
	fZ/626Micv5vV+FE0v1j162a8Ip3fkxrWkr1mldBu72T0B5Nz/0T81sjWyINlNBc9X1MFD9Qoq9Np
	A5Fv4aWZ5B7Egvt4J38cUBofkqqE3Ish2HHLlWK5QRoJfGXOzhE1j8/du/zToAEsCGGCW6/jFanXz
	HXm2gE5s9Hbl45rWYJPeugMBvCic6dBA6+Kps4UuIEiHHWf8W9Ui4PZ7KvjonB7j4KyEAU/6ViR0c
	/kG/8nQoouyHvoZbAi5uDaQ+Vr1gM0SqZN1ea5PT28oU1BE8v0G10D6LiRxfy4SQZpEppF1kcysMV
	1ADrmudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtk-0000000HKhF-2seT;
	Wed, 04 Mar 2026 14:08:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtj-0000000HKgd-1gx4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D46726132B;
	Wed,  4 Mar 2026 14:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48039C4CEF7;
	Wed,  4 Mar 2026 14:08:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: atmel: Convert to of_machine_device_match()
Date: Wed,  4 Mar 2026 15:08:17 +0100
Message-ID: <7bb2f2896c6038829119b92123a3b55c99886b25.1772633067.git.geert+renesas@glider.be>
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


