Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77E2EEA86E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 23:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1Nqfpj2jXaGCqSf1ITx5DygIFjRqFQZ1dG216YZ/w8=; b=jWTvBZtYlmXIGG+lIvilH1QSSj
	uEnD4Y1WSrCwYpX3I77UQhgqQFsgVAhoE7IUu5jHTWv4YQV37TRzX/3dKsrn34i579HEtbQZQ/x2o
	hpVn0OHzdxASQIt0v6EwNh5Bfvi02o16vmJlKIa+EuPikb/D3OzMgs4gEpjudZDGkyrhmAuOTiG56
	+zjyKpJ5tRabKzKaXvfWRqHWP0YOzd8htZnOxkoKh9uRkPaZdTLD9QWMMujxROh8YKN0wkQXyHOqA
	iugqI9HlReiO31feKEi6DM9hQnHPYyEN563YlkARuiyeUTCTiEWU3xntXVFoeHY10fHuAS+opHvhb
	gWhSaV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgaC-00000002kIm-2T32;
	Thu, 12 Feb 2026 23:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgaB-00000002kIg-2QA5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 23:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C68460018;
	Thu, 12 Feb 2026 23:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1DCC4CEF7;
	Thu, 12 Feb 2026 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770940730;
	bh=PSdEnJFZUekkW4mxLl10WRiKBAEZWcD3+p/6dcf11yM=;
	h=From:To:Cc:Subject:Date:From;
	b=U3K4/DkheRkd/e/QGs2FW/3TZ47pSmFDOjL2JGU+tQR+2SKUCgjSqDeSDJp6gdTvn
	 oZVRY7h15Qj2Y0N2615Jp056hgTSqgyOozdBa6UAnE9Tie7DTOlDEgLsuB0gWkJhhY
	 g0JIGTr7W6KQhUdYHLzuh0LzTWRevIAGWSbsny5+L1pcop8PukOlQB1U1LipOnSb1h
	 +ydOeyjTzlshjYzW3O9ZHbUK81x9ZUvXuQebIvvP90zP5N5DeEkMJfuBXbE9s25HP6
	 9zGkmhr7l/ldDqWFVeQ/31xT5eBFAmQj/x7Y96Q1IT96VmmUGBn8CY4wpj90nr1Yjt
	 CBEgcTb1TbJng==
From: Danilo Krummrich <dakr@kernel.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	daniel.baluta@oss.nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Date: Fri, 13 Feb 2026 00:58:11 +0100
Message-ID: <20260212235842.85934-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
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

imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
called from IMX driver's probe() callbacks.

However, it neither makes sense to register drivers from probe()
callbacks of other drivers, nor does the driver core allow registering
drivers with a device lock already being held.

The latter was revealed by commit dc23806a7c47 ("driver core: enforce
device_lock for driver_match_device()") leading to a deadlock condition
described in [1].

Besides that, nothing seems to unregister the imx_clk_scu_driver once
the corresponding driver module is unloaded, which leaves the
driver-core with a dangling pointer.

Also, if there are multiple matching devices for the imx8qxp_clk_driver,
imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
any subsequent call after the first one will fail, since the driver-core
does not allow to register the same struct platform_driver multiple
times.

Hence, register the imx_clk_scu_driver from module_init() and unregister
it in module_exit().

Note that we first register the imx8qxp_clk_driver and then call
imx_clk_scu_module_init() to avoid having to call
imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().

Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa8x
Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2:
  - Expand commit message, mentioning a third bug fixed by this patch and noting
    the order of platform_driver_register() and imx_clk_scu_module_init() in
    imx8qxp_clk_init().
  - Rename imx8qxp_{init,exit} to imx8qxp_clk_{init,exit}.
  - Link to v1: https://lore.kernel.org/driver-core/20260211142321.55404-1-dakr@kernel.org/
---
 drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
 drivers/clk/imx/clk-scu.h     |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 3ae162625bb1..c781425a005e 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver = {
 	},
 	.probe = imx8qxp_clk_probe,
 };
-module_platform_driver(imx8qxp_clk_driver);
+
+static int __init imx8qxp_clk_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&imx8qxp_clk_driver);
+	if (ret)
+		return ret;
+
+	ret = imx_clk_scu_module_init();
+	if (ret)
+		platform_driver_unregister(&imx8qxp_clk_driver);
+
+	return ret;
+}
+module_init(imx8qxp_clk_init);
+
+static void __exit imx8qxp_clk_exit(void)
+{
+	imx_clk_scu_module_exit();
+	platform_driver_unregister(&imx8qxp_clk_driver);
+}
+module_exit(imx8qxp_clk_exit);
 
 MODULE_AUTHOR("Aisheng Dong <aisheng.dong@nxp.com>");
 MODULE_DESCRIPTION("NXP i.MX8QXP clock driver");
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 34c9dc1fb20e..c90d21e05f91 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -191,6 +191,16 @@ static bool imx_scu_clk_is_valid(u32 rsrc_id)
 	return p != NULL;
 }
 
+int __init imx_clk_scu_module_init(void)
+{
+	return platform_driver_register(&imx_clk_scu_driver);
+}
+
+void __exit imx_clk_scu_module_exit(void)
+{
+	return platform_driver_unregister(&imx_clk_scu_driver);
+}
+
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data)
 {
@@ -215,7 +225,7 @@ int imx_clk_scu_init(struct device_node *np,
 		rsrc_table = data;
 	}
 
-	return platform_driver_register(&imx_clk_scu_driver);
+	return 0;
 }
 
 /*
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index af7b697f51ca..ca82f2cce897 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -25,6 +25,8 @@ extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8dxl;
 extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
 extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
 
+int __init imx_clk_scu_module_init(void);
+void __exit imx_clk_scu_module_exit(void);
 int imx_clk_scu_init(struct device_node *np,
 		     const struct imx_clk_scu_rsrc_table *data);
 struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,

base-commit: 192c0159402e6bfbe13de6f8379546943297783d
-- 
2.53.0


