Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1350FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuY99vSObz5VCLlTZfK8leLOWS0j6nbGxEccw6x7Zt8=; b=fjds15z8xwsl8K3fPCQ6KqBQu2
	kNmlWimFLhAFc8mXEdExihm97EoOyjaCZVWy8lHgT9TI+OD/1mxMKQg1lXSMW3yEbMknqUeZti4PB
	6Yru5klQ3Gz84EqFyvMgjRUudf50TEI1S4ek1HQiJCouONG6oU676YrNgGoa19E8c1f/nzDEOlxte
	H7iIyvl95xzq6uvETtxsBZyuhbN/XYDZ+OofbhuVeg8YHKSgIN/YVaXuUIvtaKQvGCwJIHQCVMG6G
	+qbh1ccK9YNNgM0mggPP6oFqMQK5mGOqRtbiRy4Vrtz2nOpQlJIkcH+ArGEBKvEhnFlXYvHGANkrW
	WhVaLZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyj-0000000DyXq-1cGA;
	Mon, 04 May 2026 18:25:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyX-0000000DyEx-2Eq6;
	Mon, 04 May 2026 18:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0103944577;
	Mon,  4 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0621C2BCFF;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777919098;
	bh=SFyDTRyWZjDxmsFtAqwCPfeazjDIIWp9P+6ztku6jaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s2UAt5ovqGlDNFbvBTOq9Ul3dNhnc8+V4nJQ46Am+zdgmiXhdKT+g0jZ0Q8ix3IZj
	 O2/VeKbMqjR3qc7N/pLMAiC2vLZfx7v8A1TDWEPO7mzEnMe6iuLR7Z4bt08xQVfoqx
	 +g47+4YP6+SaIvYJik8QeCbV86R+KhJVsfZ3acj9IqauGEuo4Cay6pSTSurvHmG4B9
	 QQeAEpk0E8PmMKb919W7ExNurr5gq0+GVF3tu4NTCGHVbztRVypUfhSjcX5p9Ep2rv
	 HV/8B4b4aqHbekZ7A70x8he6Tad6ccU5VeYc2vGLY+ywBYgrIP3JgX8TRtqqoz+iFt
	 l14GrneLJz23A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DBDCD3427;
	Mon,  4 May 2026 18:24:58 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 04 May 2026 21:24:57 +0300
Subject: [PATCH 05/13] nvmem: add mt6323 PMIC EFUSE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-mt6323-v1-5-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919095; l=4311;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=1nnD8x2/YfoddlKavtCr39AhwjwKkPATibCGf0JcRFk=;
 b=CI5X+E7LWYk0XH+OzSwni+MoWgPTu5HtndpDXnOqF9faEAkuaULlKcmd0lygCathpvFdBASrg
 4bDRnzyx1tNB1bkDi+UHEUCBKymKHiNPndUPXJqGBcyuGzcbcrQiVoC
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112501_733670_37E1F0E8 
X-CRM114-Status: GOOD (  20.14  )
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
thermal sensor calibration values.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/Kconfig        | 11 ++++++
 drivers/nvmem/Makefile       |  2 ++
 drivers/nvmem/mt6323-efuse.c | 86 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..db248a3c4e87 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -227,6 +227,17 @@ config NVMEM_MTK_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called efuse-mtk.
 
+config NVMEM_MT6323_EFUSE
+	tristate "Mediatek MT6323 PMIC EFUSE support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MFD_MT6397
+	help
+	  This is a driver to access hardware related data like sensor
+	  calibration, etc.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called efuse-mt6323.
+
 config NVMEM_MXS_OCOTP
 	tristate "Freescale MXS On-Chip OTP Memory Support"
 	depends on ARCH_MXS || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..0e2b73f42b25 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -48,6 +48,8 @@ obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
 nvmem-microchip-otpc-y			:= microchip-otpc.o
 obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
 nvmem_mtk-efuse-y			:= mtk-efuse.o
+obj-$(CONFIG_NVMEM_MT6323_EFUSE)		+= nvmem_mt6323-efuse.o
+nvmem_mt6323-efuse-y			:= mt6323-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
 nvmem-mxs-ocotp-y			:= mxs-ocotp.o
 obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
diff --git a/drivers/nvmem/mt6323-efuse.c b/drivers/nvmem/mt6323-efuse.c
new file mode 100644
index 000000000000..0c1b405fbc89
--- /dev/null
+++ b/drivers/nvmem/mt6323-efuse.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mfd/mt6323/registers.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MT6323_EFUSE_DOUT_BASE MT6323_EFUSE_DOUT_0_15
+#define MT6323_EFUSE_SIZE 24
+
+struct mt6323_efuse {
+	struct regmap *regmap;
+};
+
+static int mt6323_efuse_read(void *context, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	struct mt6323_efuse *efuse = context;
+	u32 tmp;
+	u16 *buf = val;
+	int i, ret;
+
+	for (i = 0; i < bytes; i += 2) {
+		ret = regmap_read(efuse->regmap,
+				  MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
+		if (ret)
+			return ret;
+		buf[i / 2] = tmp;
+	}
+	return 0;
+}
+
+static int mt6323_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6323_efuse *priv;
+	struct nvmem_config config = {
+		.name = "mt6323-efuse",
+		.stride = 2,
+		.word_size = 2,
+		.size = MT6323_EFUSE_SIZE,
+		.reg_read = mt6323_efuse_read,
+	};
+	struct nvmem_device *nvmem;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* efuse -> mfd -> pwrap */
+	priv->regmap = dev_get_regmap(dev->parent->parent, NULL);
+	if (!priv->regmap)
+		return -ENODEV;
+
+	config.dev = dev;
+	config.priv = priv;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id mt6323_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6323-efuse" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6323_efuse_of_match);
+
+static struct platform_driver mt6323_efuse_driver = {
+	.probe = mt6323_efuse_probe,
+	.driver = {
+		.name = "mt6323-efuse",
+		.of_match_table = mt6323_efuse_of_match,
+	},
+};
+module_platform_driver(mt6323_efuse_driver);
+
+MODULE_DESCRIPTION("Mediatek MT6323 PMIC EFUSE driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0



