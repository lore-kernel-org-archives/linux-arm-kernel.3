Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB8A1073C8B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Mcp2VVLUGnPTEj2GsB+4ZjUZBijimmIcUWLoFty35I=; b=gk4rX9tY2MeZVVc9pYc1PvZwAO
	WYszl1LKSYYJ+kYyBt1VDbLKQso8M2++QFCJfjjRGE+1MC0I9pvcEJpdd6SMijfY3v8rUbi1gZGcL
	PQtKPefjNmpAAmMnt09LZPJnrW3FYFULtjDGGO09WRK9+BfRjCCkYzRsoX9v70bLfjpHSOv9Ue/Ze
	4yUkNKAOPcW9TcDNI6W9TxPU30gRnwaI1OVrkipElYlq86ceYer+Fpd940VCpf1hWPtivdFmAcvrW
	J9GlwCz+7Fg3Hm9Xezmskafnj8MwHmQo5WaMOrgiTuu82IIZXRG0uKLRVPQagnMWNAsTQi/TaDN2L
	YaioBwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ0E-00000008frk-351T;
	Wed, 08 Apr 2026 10:19:18 +0000
Received: from mail.prodrive-technologies.com ([212.61.153.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ0C-00000008frN-2D7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:19:17 +0000
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP02.bk.prodrive.nl
 (10.1.0.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 12:19:09 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Wed, 8 Apr 2026 12:19:09 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAQ05-008rKV-1h;
	Wed, 08 Apr 2026 12:19:09 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <srini@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <gregkh@linuxfoundation.org>,
	<p.zabel@pengutronix.de>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>, Paul Geurts
	<paul.geurts@prodrive-technologies.com>
Subject: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
Date: Wed, 8 Apr 2026 12:19:01 +0200
Message-ID: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_031916_588837_E621EFF9 
X-CRM114-Status: GOOD (  11.95  )
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

The i.MX OCOTP driver is implemented as module_platform_driver();,
which makes it initialize in device_initcall(). This means that all
drivers referencing the clock driver nodes in the device tree are
deferred by fw_devlink.

As the OCOTP driver is arch specific, but dependent on the i.MX clock
driver, which is also initialized in arch_initcall(), explicitly
initialize the driver in subsys_initcall(). This makes sure the drivers
depending on fuses defined by OCOTP, which are initialized in
device_initcall() are not deferred.

Fixes: 3edba6b47e42 ("nvmem: imx-ocotp: Add i.MX6 OCOTP driver")
Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/nvmem/imx-ocotp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 108d78d7f6cb..9b1e7bb14ced 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -638,7 +638,18 @@ static struct platform_driver imx_ocotp_driver = {
 		.of_match_table = imx_ocotp_dt_ids,
 	},
 };
-module_platform_driver(imx_ocotp_driver);
+
+static int __init imx_ocotp_init(void)
+{
+	return platform_driver_register(&imx_ocotp_driver);
+}
+subsys_initcall(imx_ocotp_init);
+
+static void __exit imx_ocotp_exit(void)
+{
+	platform_driver_unregister(&imx_ocotp_driver);
+}
+module_exit(imx_ocotp_exit);
 
 MODULE_AUTHOR("Philipp Zabel <p.zabel@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX6/i.MX7 OCOTP fuse box driver");
-- 
2.39.2


