Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24015C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97z+nGMjpObnX+kHQEl/mwC7gPI6pvLkyhFQtl49zRI=; b=F8aNSdW00lW9Deag+stkhTGU+y
	+af+MutxDklcPUGuIMxQXTZFeOGhvduEs8hbHD/JVhDVn6CekkMmJhO9KodPBSVuBtvNoJnIWGw3p
	lmgAQwGm7JwUwFaSGPKPwHJBnGe+5SI4QAlvqiG2yxE0L0/CMV+RjH26ARlE6h9nv3ocdv51q01p4
	K/Z3mdpXzxORnfNYO6zrbHhlj9lIsVx83s5HR3xse0TRztcXLiitpqDv/kgb7sLqofEMoY8w5joX/
	XWq9jmfwKxFi+No08LqDSH+g3Z6ZdBlQ9H6e/6b5HJ0isjztKVjEI5ElD5sV8pfjOQ4L1Q62VZjUX
	XArAunpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfI-0000000DKwW-0kOM;
	Sun, 28 Jun 2026 19:59:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfD-0000000DKuO-24u7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso10150885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676774; x=1783281574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97z+nGMjpObnX+kHQEl/mwC7gPI6pvLkyhFQtl49zRI=;
        b=Z5qiOSCAiZ2UsiwgcN1SIZxJfe8+gg6q6OJZ4KdQwU7uV9ulv1aFLmlKDy4FlpheD2
         xnsT71UsfHtaR47gLmQINPrg6W90YpR+teVsu8XtvhwMmLPwFyHBJrOwoCI3s9bn0t0f
         3n6up0Xm0lkcn4jOnfmMUjTJJmI4A+voxfSgJcod6G9SiLLACY4w7Abdl1WONqA1ESwp
         1pIGojc4tJYMY0UxA7YpRfQEQc2w45MGX1bpY5GX9lddsuACZlILNFrD9A1hyn0e0r6h
         +GZMI7MedJ6WT9v+bRzh0+p8PBbEy0ynSY8HYGbVTRWIOeP0ueB5iTTyA0repahuRqdT
         UNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676774; x=1783281574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=97z+nGMjpObnX+kHQEl/mwC7gPI6pvLkyhFQtl49zRI=;
        b=esqPbpB+WjYgtY7Yw3WlmX5PGH5/1EyAO5jRwF9qxtwMIBhTF16UfcvF0APj7IZ7Kq
         fgjFKpddUqPuRpe3A/w0Jx080xffEq2JA1qAHSGb6xjAeSH3oiguoAALI4t4zPD2abmC
         7LFU/0daUXKcOQZuIU4UCQXsxs/SQptvkKmQmZDps7f74Fv76+vJlVhxTKTVPCRpF3Z+
         aBmwhexWwG8Wv8dRSQTZd80LOFKWVYnOsPm0ij2Lp/6h4LpF54NL7YPBNhk5bcy2HR1z
         zcr4u0295tmFLLSz+kshb5jS3NCFj80kevyExvlzUysMPMvxEnmwXlrNeLpotg4G44pW
         hpjg==
X-Forwarded-Encrypted: i=1; AFNElJ8GcDMbugDQPiP3AQlKYfYa3auvcYyFz8dkUG5SVykQ/zBsmCINhMplW1IHWYJbclYOwILKmAPVx7g4ZkU57X9U@lists.infradead.org
X-Gm-Message-State: AOJu0YxVnJLc1ECsvBUVaGi7dzZA1txSu9Mud2I+XIKWld7/eEmym4vc
	fMkJ0Pa/auTB0KITsn3FmknB4R64LJdLZCTdc06O9gTkXHxibo1PMcf0
X-Gm-Gg: AfdE7cmNw7m5SGewpp4U9iyJPdwZCGwX/vebzp8A6DvnFW9ZiDypJEcnPolREnqTtqy
	0W/MJxJS1E9njOCIxR0WO0FOlnVfHszDz8xbYpNneCoguVGFXFui1u2YGcJTVdyqVBxROlS9ab5
	TLN0zhuqZVZmYVmbWXjlBeCNxVotU1MozrGSOxhwEjqoU0QCeDbfUSjVluyZ9BEFo3OFpzqVQnA
	P131jNE0wVKYupYXH5GqwTtEsf68lPHn1+l0GuFS45dC7xDTWcfdAyu3KVbGCvOuEvTEMndKWC1
	2rmNpgKAyT+RYxF+CaSVYXYLtjKDuMUzh+kFqfbiFg7AZgz6Dgkyt0GLFOhVs0Uyw5MOv9uCpmk
	hAxWg+f7tEpXJYHMTpxArHwI6RJMAmIpkb1r9+ElfQgKtDtGqndR4b58ziyvhzkRUtPQTgJeyar
	EYKEnaC/1I3STfRG/UsILC5VukT8ciwAg6rA==
X-Received: by 2002:a05:600c:4f8f:b0:493:a75e:cf2e with SMTP id 5b1f17b1804b1-493a75ed171mr46238335e9.25.1782676773558;
        Sun, 28 Jun 2026 12:59:33 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:33 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:58:59 +0300
Subject: [PATCH RFC v5 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-4-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5289;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=NUB48ndcBSC7Ql+9ErLJGKl+bUYndI+kIo+Q247H8Ac=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UuQcg/a4haB0tB3jD0iCDi5CETg6CWFhq8
 ijdX/m3GjWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKvFQ/+Nv+IW2StkA6RatscGBd/vKf6OWHd5Vt
 Hq3Rzdkm0a2H00bW/NSmvPrAu97MVixe8HJR1jR8SVW4oqwzCn064HHGh0HwrofFuMo/5QXo5Lh
 rzbRaGLvui1TrRiclgs17eGWkysnAolqYs9GaXXqBuWvAHTJyK/fzCGuFlY4Mf04vrP+eA8F7ux
 CeN8Ij2ebsypJsKyZuVtaMBIcLQYSHfmJhn4Nl41Czbwn5kU4DObbGQPf4u9VZq/CdeUI9KafsZ
 EcQew9xYFEp0POiEwd4dx2dZ04sF+0VQhELx6mxTeIFIdQaZxKKxVwidi//RPaa0ApyrnnxEXjY
 WvKINXr6XUAdyB1smw2ADnlL3Au6JF+//Q6VtsAJkipoqz1L7zSDZmFRnaB5bUDqv0WK/aJs/8p
 jGN8DGCQs6LiF9xBMM3emViQbeH6rXQIMVZO1EFqZv2TE3f7Tl+ICuSgte9zsLYNvCgQdaHla+M
 LARCN0UAl9tTVtRFr06YYPV+dONXq71xfraKGJK04drYmnWCxkjxSWtaik9AtJSoAde1hHFcWFE
 m47rvGJlunRTFIf2KLjeElqb1krXzVjzDGl5G74bcnrmKMstSJy5x+Vtxv64aygFz8ulT0aPWha
 4UDRJ4mkXINFG3RH64eCAdA45htv2yW+LCxwRxnfemEsN1Sc5Gvw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125935_571120_DEEFE38D 
X-CRM114-Status: GOOD (  20.06  )
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

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |  1 +
 drivers/soc/Kconfig              |  1 +
 drivers/soc/Makefile             |  1 +
 drivers/soc/zte/Kconfig          | 20 +++++++++++
 drivers/soc/zte/Makefile         |  3 ++
 drivers/soc/zte/zx297520v3-crm.c | 76 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 102 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee585982b859..57af566030db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3871,6 +3871,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..5cc1ade4ce52 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -31,5 +31,6 @@ source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/vt8500/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
+source "drivers/soc/zte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..63b3f340256c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
 obj-y				+= vt8500/
 obj-y				+= xilinx/
+obj-y				+= zte/
diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig
new file mode 100644
index 000000000000..1016fb99cf73
--- /dev/null
+++ b/drivers/soc/zte/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_ZTE || COMPILE_TEST
+
+menu "ZTE SoC drivers"
+
+config ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	select MFD_CORE
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset submodule drivers.
+
+endmenu
+
+endif
diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
new file mode 100644
index 000000000000..090ba8aa06c1
--- /dev/null
+++ b/drivers/soc/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_ZTE_ZX297520V3_CRM) += zx297520v3-crm.o
diff --git a/drivers/soc/zte/zx297520v3-crm.c b/drivers/soc/zte/zx297520v3-crm.c
new file mode 100644
index 000000000000..bf5a71bc7706
--- /dev/null
+++ b/drivers/soc/zte/zx297520v3-crm.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/platform_device.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+struct zx297520v3_crm_data {
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static const struct mfd_cell zx297520v3_topcrm_devs[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-toprst",
+	},
+	{
+		.name = "zx297520v3-reboot",
+		.of_compatible = "syscon-reboot",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_topcrm_data = {
+	zx297520v3_topcrm_devs,
+	ARRAY_SIZE(zx297520v3_topcrm_devs),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_devs[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixrst",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_matrixcrm_data = {
+	zx297520v3_matrixcrm_devs,
+	ARRAY_SIZE(zx297520v3_matrixcrm_devs),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	const struct zx297520v3_crm_data *data;
+
+	data = of_device_get_match_data(&pdev->dev);
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, data->cells,
+				    data->num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = &zx297520v3_topcrm_data },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = &zx297520v3_matrixcrm_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
+
+static struct platform_driver zx297520v3_crm = {
+	.probe = zx297520v3_crm_probe,
+	.driver = {
+		.name = "zx297520v3-crm",
+		.of_match_table = of_match_zx297520v3_crm,
+	},
+};
+
+module_platform_driver(zx297520v3_crm);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


