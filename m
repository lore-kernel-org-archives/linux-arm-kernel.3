Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A41073C85
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqqWjMXn1A2S2/N7J6M83jpdZVRbGax7As3gwVsN9AU=; b=G9QtvKaeN6y9Dab4zR7A9eEbUu
	+B6XfvQSQCGar2XZeyVfoTO+zBfUh5DOYaSWmRQc8MH6nWvAXRBupJwX+Z/VhbsfcLuVR+7vQdWjd
	lcnVwrFmuW/fWZY/6CeLAGQvflC0LcpUA8aTDDMHu/QOStI1doaXi3/yRYoBU0s42WaAeO/RUETdj
	APj+TbSJuNxjGMuC+BrTtdC2vmYU+ydUwE62r2u4nOeqfRbCug2sc7Q/rsP9zvFYB2viHs7cQF19h
	2FEENq4ntmFzf6ygKXsyA+IWKoRVUDqaPwkMSLw7eJluCShAHP7lFdb51dF6MIaK3L9lUB9NzEhDE
	qI5xRItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPuh-00000008fI7-1sBC;
	Wed, 08 Apr 2026 10:13:35 +0000
Received: from mail.prodrive-technologies.com ([212.61.153.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPue-00000008fHj-1Zwm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:13:33 +0000
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 12:13:26 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Wed, 8 Apr 2026 12:13:26 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAPuY-008joX-22;
	Wed, 08 Apr 2026 12:13:26 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <shawnguo@kernel.org>,
	<linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>, Paul Geurts
	<paul.geurts@prodrive-technologies.com>
Subject: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Date: Wed, 8 Apr 2026 12:13:13 +0200
Message-ID: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_031332_414791_4D36C091 
X-CRM114-Status: GOOD (  12.26  )
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

The i.MX8MM clock driver is implemented as module_platform_driver();,
which makes it initialize in device_initcall(). This means that all
drivers referencing the clock driver nodes in the device tree are
deferred by fw_devlink, which are most of the i.MX8M platform drivers.

Explicitly initialize the clock driver in arch_initcall(), to make sure
the clock driver is ready when the rest of the drivers are probed.

Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/clk/imx/clk-imx8mm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 319af4deec01..7b2cf867b920 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -636,7 +636,19 @@ static struct platform_driver imx8mm_clk_driver = {
 		.of_match_table = imx8mm_clk_of_match,
 	},
 };
-module_platform_driver(imx8mm_clk_driver);
+
+static int __init imx8mm_clk_init(void)
+{
+	return platform_driver_register(&imx8mm_clk_driver);
+}
+arch_initcall(imx8mm_clk_init);
+
+static void __exit imx8mm_clk_exit(void)
+{
+	platform_driver_unregister(&imx8mm_clk_driver);
+}
+module_exit(imx8mm_clk_exit);
+
 module_param(mcore_booted, bool, S_IRUGO);
 MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
 
-- 
2.39.2


