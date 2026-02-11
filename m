Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F12E9E311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jlZ+WLsAP4dfOcz06Izv7LZZ69lNoh9OB4/JpyJu788=; b=eYc77Uv8/Agg0YQmSyrNKFI/tw
	V/lu5Xr7VyNDrngJy3TWhB8B0TD2qE76ZquZB9XZ5xgH01PR11+NE8fpRjaBilEPoLuZgxnXLwena
	h4InUYcHuiqHFIbZBRtsEWJRiAdGfaBDQASLtRuYff+nWZa/daS81ZW38ohp8xC2SoRDvi83C12yk
	AgC1If7WccQXAUwIIwlXA8TJalTXBYmGlAbxHx/f0UWg3fEw0YqqKFoKRTLA+rFNA6vA0/Kb43bSa
	bbEsmTwc94YH6an8b1iNHkwID0PR8JARqXjGpv4ZUuqZibtN5bV6zl/uxhSSI3Ky2456XWC2Ul+V0
	L52F+sjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB7r-00000000j5x-2ePQ;
	Wed, 11 Feb 2026 14:23:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB7p-00000000j5N-45Y8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 14:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2C584171F;
	Wed, 11 Feb 2026 14:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC5C4CEF7;
	Wed, 11 Feb 2026 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770819808;
	bh=N/7eEnN+HiyL9etKEOczHnkDOPiApMWEXth+P0IHcyU=;
	h=From:To:Cc:Subject:Date:From;
	b=IreDnOfU8XisToO2yxhMcnkzvWqHUyoBViMpgE/9jal42Kn+ZUIEAgi2nKXkW/88/
	 dRdj8ELyE8z/Y6GuzzYVbexVNmWWdAst6GzenJsYlfOq1K2hFoKv/aVCpJK/FOiqJo
	 AIOKpIo5VMhditCBAGF8TCgBvR9vtKIlV1EZeWxLKqmNcxq/t/0bk+h34VFvYJ7mG9
	 2Pll2apcmkgt5zRGa8UfmgalkIEZu24yyA1yUWeMPKU+C2beE9gCwplHt24QNz5VeP
	 X2bG8nczKZYsHio7irZnwhA6nWoTGqO/iSaQO4CzqOnYuZXEF/3gXWb+Z79bWk6d1B
	 wrSAOMzLbkbcg==
From: Danilo Krummrich <dakr@kernel.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
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
Subject: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 11 Feb 2026 15:23:16 +0100
Message-ID: <20260211142321.55404-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_062330_058237_FA18E33B 
X-CRM114-Status: GOOD (  16.36  )
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

Additionally, nothing seems to unregister the imx_clk_scu_driver once
the corresponding driver module is unloaded, which leaves the
driver-core with a dangling pointer.

Hence, register the imx_clk_scu_driver from module_init() and unregister
it in module_exit().

Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as modules")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
I plan to send the driver-core PR for 7.0-rc1 soon, which will also contain
commit dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()").

It also contains an IOMMU commit similar to this one:
https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org

The commit was originally scheduled for 6.19-rc7, but was deferred to 7.0-rc1 in
case more of those cases pop up (which now happened).
---
 drivers/clk/imx/clk-imx8qxp.c | 24 +++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.c     | 12 +++++++++++-
 drivers/clk/imx/clk-scu.h     |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 3ae162625bb1..d89a2f40771e 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver = {
 	},
 	.probe = imx8qxp_clk_probe,
 };
-module_platform_driver(imx8qxp_clk_driver);
+
+static int __init imx8qxp_init(void)
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
+module_init(imx8qxp_init);
+
+static void __exit imx8qxp_exit(void)
+{
+	imx_clk_scu_module_exit();
+	platform_driver_unregister(&imx8qxp_clk_driver);
+}
+module_exit(imx8qxp_exit);
 
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
2.52.0


