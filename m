Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CDBC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyxVPRe7gA0YmUL0zoIVLzWkneqc4zMa83/hw+4DcV0=; b=jIkI8AmyUcMXwrzW7A0dcesmKv
	w4QWbEOaYWezJa9ppszLCSI5cxSMwIS6JMe7vaGOEflNGZAp0TxPsO81oA7WL5uSaLPu/3PkGfEC5
	OvKBNTRxsQiKe7Gfh25Xv/cKyVot9ApscXQsG/1zBok6+xFZknfhrHUhishOLDQHCr0rDLTfp0qae
	5l6BBxpp0NHrfC3WkdPGTtSpKr5fl9W3as5kj3kXQZzIIz80qm4lYh8Od/tGr6PpA303REUG6LOt/
	tWzJp2VxAyhHgpUd58565hgpneyf7a5yqV+YVdnPKNx/oFB+C+yx1bRPT6+Kf6Vr/82jyvVSesKok
	YSjOFsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyFu-000000064H2-2qI8;
	Fri, 28 Aug 2026 15:12:34 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyFq-000000064Fm-1ZkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:12:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D962E11D12B;
	Fri, 28 Aug 2026 17:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929944; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dyxVPRe7gA0YmUL0zoIVLzWkneqc4zMa83/hw+4DcV0=;
	b=Wwk7fU7LguQo8ewDDjKRagfTfYPLHCaqbMoT6KP3qy1NZwGY2DAXBxjC439dtiRVkMbtgO
	jX3SabyJ/yGvHZEgSxjS8F7JyA41c5DruInjz85DDzHnAYqq6ZlBvMBkXzLzbwMTHktg0O
	ncqGT30979CJww8dOtsk5O9hApqPJKwm6yY3yqX/UdtvFYAl3KyzeZTujDybf0RDu/gDs9
	K3WKlWPPwoM8kvNRRNqhexlprPq0WfU/UwcL6jYJsFCOPGWKE4F9U0IlBeL3NlcsYkzPZF
	HJ9iw08iRGdXL7YdTHaMYK30LBkDMWvmSTz1XEBXjzZrjKs2m1Vz1/SLMXQo+w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 2/2] soc: st: Add STM32MP2 SYSCFG driver
Date: Fri, 28 Aug 2026 17:11:15 +0200
Message-ID: <20260828151216.175020-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828151216.175020-1-marex@nabladev.com>
References: <20260828151216.175020-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_081231_286814_DFE240B4 
X-CRM114-Status: GOOD (  18.05  )
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

Add trivial SYSCFG driver for ST STM32MP25xx, which binds drivers
to its subnodes. This is currently used to bind USB PHY drivers to
subnodes described in the SYSCFG DT node.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V4: New patch
---
 drivers/soc/Kconfig              |  1 +
 drivers/soc/Makefile             |  1 +
 drivers/soc/st/Kconfig           | 12 ++++++++++++
 drivers/soc/st/Makefile          |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 33 ++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 drivers/soc/st/Kconfig
 create mode 100644 drivers/soc/st/Makefile
 create mode 100644 drivers/soc/st/stm32mp2-syscfg.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb805..dfe5cec592626 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/st/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb7..894bd6ebaaa4d 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= st/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
new file mode 100644
index 0000000000000..2a9d6a77be450
--- /dev/null
+++ b/drivers/soc/st/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ST SoC drivers"
+
+config SOC_STM32MP2
+	tristate "STM32MP2 SoC family support"
+	depends on ARCH_STM32 || COMPILE_TEST
+	default ARCH_STM32 && ARM64
+	select SOC_BUS
+	help
+	  If you say yes here, you get support for the ST STM32MP2 family
+
+endmenu
diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
new file mode 100644
index 0000000000000..5ca313476ca93
--- /dev/null
+++ b/drivers/soc/st/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SOC_STM32MP2) += stm32mp2-syscfg.o
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
new file mode 100644
index 0000000000000..102430f258606
--- /dev/null
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static int stm32mp2_syscfg_probe(struct platform_device *pdev)
+{
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id stm32mp2_syscfg_ids[] = {
+	{ .compatible = "st,stm32mp23-syscfg" },
+	{ .compatible = "st,stm32mp25-syscfg" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp2_syscfg_ids);
+
+static struct platform_driver stm32mp2_syscfg_driver = {
+	.driver = {
+		.name	= "stm32mp2_syscfg",
+		.of_match_table = stm32mp2_syscfg_ids,
+	},
+	.probe = stm32mp2_syscfg_probe,
+};
+module_platform_driver(stm32mp2_syscfg_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@nabladev.com>");
+MODULE_DESCRIPTION("ST STM32MP2 SYSCFG driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


