Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9343CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLSKKc0L9MVV3Oz8KV9EygqwnLI1eukPS4Z58uIwLAs=; b=JOEhH73AaRI6BuOX3Xf6JnIoQG
	BsO80d/JZgwBMQL1IqWWVut2mxZKj2B7LfZziK5a73QyRQJuMwiYopDP7q7aGDnBxY2OezlyItZGj
	ykr8ZQ3uuMgHy2QjWFbSvqt3zyJh+BGsw3YAsBUYmeBLWWtSmJ2STZlh1ha0NbWXPJBbnY9xyWy+K
	jb++Ufnz090xt/+tsKr/lO2QboAN+T9KPP33CAIr9elrA3lASMH4Dm2jZEmYz8o94c4a4AQu5urSo
	D+pPp0yZXWLsLJxZTXt1VK7eQOM0oQyrAot179iYeTf0EvhEYaKlBtjht4ZYRDc2mAq7BpLejrJAY
	6gPMvv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfZ4-0000000FZ7t-0Fg6;
	Tue, 12 May 2026 05:21:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYr-0000000FYmY-1VW2;
	Tue, 12 May 2026 05:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CFD44452E;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11AA7C2BCC7;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563300;
	bh=8k3Ry7tv0dQbgo90fMf9Q0Yy4yOBcyjqMV8YWMZPeGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MBbLoxkF4b9m63D0nPRXcI8KIyApEVZqLK168kVHeLTX0WhT8WmvDJSHQ/gNwdKlM
	 OLRg491TYRb673tEOhrTCn9uUoA7uZszvHjSbiD5jePASwsE6RnX9VPitsndE/ePdI
	 DmdIYi2V2SefOQI0wjyqy0xhF1Hxke59F+t8K4W9CgUY8ocigs+uO274iFoJNIr9Qu
	 jLqy6NN4vCxeOUo7kSPpEAfRx9dE8Rut9rEGQglWeTPvEWOnf8+b8UIhFGJvDYzwx9
	 eOf02vjNt6jvZrDB9ikVn8GBmhVoUcq57amm/wEiXHo41Af34LhoOPyW7uqbGz+If7
	 Ux8LRL3MVUbIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EACCD4F23;
	Tue, 12 May 2026 05:21:40 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 12 May 2026 08:18:20 +0300
Subject: [PATCH v2 06/16] nvmem: add mt6323 PMIC EFUSE driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-mt6323-v2-6-3efcba579e88@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778563297; l=4414;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=vvT2pOB1ZGhmW+qcNnHLmWiasppjohd7DkMPQD+D54k=;
 b=6zp8lOnE5vSeBKSiFPMWfYFxRC6c1Yd0n9Py1YTHo1tE+IQ7guQBNjYOD+P9E68yetu0Al/xR
 zCamuetNLs1DaccUTpFQdHeDd4rFHxwUEOxREvyR7Sog53CiDlxJDT4
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_222141_477526_C797FFF6 
X-CRM114-Status: GOOD (  20.29  )
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
index 000000000000..52db62784add
--- /dev/null
+++ b/drivers/nvmem/mt6323-efuse.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2026 Roman Vivchar <rva333@protonmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <linux/mfd/mt6323/registers.h>
+
+#define MT6323_EFUSE_DOUT_BASE	MT6323_EFUSE_DOUT_0_15
+#define MT6323_EFUSE_SIZE	24
+
+static int mt6323_efuse_read(void *context, unsigned int offset, void *val,
+			     size_t bytes)
+{
+	struct regmap *map = context;
+	u32 tmp;
+	u16 *buf = val;
+	int ret;
+
+	/*
+	 * Manual regmap_read with loop is needed, because PWRAP is not
+	 * a continuous MMIO space, but rather FSM which doesn't implement
+	 * necessary read callback for the regmap_read_raw and regmap_read_bulk
+	 * functions.
+	 */
+	for (size_t i = 0; i < bytes; i += sizeof(*buf)) {
+		ret = regmap_read(map, MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
+		if (ret)
+			return ret;
+
+		*buf++ = (u16)tmp;
+	}
+
+	return 0;
+}
+
+static int mt6323_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.name = "mt6323-efuse",
+		.stride = 2,
+		.word_size = 2,
+		.size = MT6323_EFUSE_SIZE,
+		.reg_read = mt6323_efuse_read,
+	};
+	struct nvmem_device *nvmem;
+	struct regmap *regmap;
+
+	/* efuse -> mfd -> pwrap */
+	regmap = dev_get_regmap(dev->parent->parent, NULL);
+	if (!regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	config.dev = dev;
+	config.priv = regmap;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id mt6323_efuse_of_match[] = {
+	{ .compatible = "mediatek,mt6323-efuse" },
+	{ }
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
2.54.0



