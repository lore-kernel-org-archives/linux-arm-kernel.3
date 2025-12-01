Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB27FD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPwuuXGeA202YbNXOMhzLEU9b0G2gVwcXETAuq6Vgqk=; b=Cu39kChJFl1iQp8zY8jzLTUKW4
	7IiiTIagURK0ME2vo+yrHXWtFJB6dJRMW07kc+Glr8b/hnyyLoN6a1AP/Bv84zPJG5y2KQBV885Z4
	ZTQc8cnjLCDVXMzdmpuViDYS8u50ptESmVkYCykzGKhO0LKynWLGKgoYzQeqhe5Q4veG0JiS8xjaw
	yfvoauDPCpZc+gy1wDJn4JEx1Js7cbDVgVmZ1wmArbfdx5Px7O5lYf/ctb6CU3YILAp0sqr45Tkew
	H4QWZuugYR2xqGEawlJyTrHbxmwwGA0+x/SO16zn9W+0USDiiKg3hI/cIq0pRW0hWQJvUcZrK4DrA
	sTOZJn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7Ri-00000004L2w-3dGx;
	Mon, 01 Dec 2025 17:12:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7Rf-00000004L1O-3fRn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:12:17 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQ7RX-0002dz-FK; Mon, 01 Dec 2025 18:12:07 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Dec 2025 18:12:07 +0100
Subject: [PATCH 3/3] pmdomain: imx93-blk-ctrl: add support for optional
 subnodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
References: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
In-Reply-To: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_091215_933469_49C0EC93 
X-CRM114-Status: GOOD (  11.41  )
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

This particular block can have DT subnodes describing the LVDS LDB, MIPI
DSI and parallel DPI bridge.

Scan for possible sub-devices within the driver, instead of misusing the
simple-bus to perform the scan.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 13b0de6dd689cf944e034f7666a4e97b0118e3bd..8f79cabe07face872cb396bfb7329c230c4a97fe 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -311,6 +312,10 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add genpd_provider release callback\n");
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to populate blk-ctrl sub-devices\n");
+
 	return 0;
 }
 

-- 
2.47.3


