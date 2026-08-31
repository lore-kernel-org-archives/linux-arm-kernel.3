Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11674C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/4pCNbo+upZ0k4TXQBP77fIXcguXQOHsC6hBkuc0Xw=; b=Ym4MfE6IJyV175KrWlse3YDZbN
	/QzRMRU+Bmf8r9O8LW/HlJzUEKSYOXrqO1u+RdUV01cZiS3yw9kWvSefXQOHfdtShslj/7YuGlTPh
	eoQYWIZ/NFuMP+Vdmb/tbJZ91wrurgCvmjox4EQsRVAKceZunC8mSbGpV77ajRHDZq2BrxNhXCC6m
	yeGj01aepHUjwKTVuaVELq8P6siXuMJq34msCTMtVycR++WeeVTjNHwh4S2Lh/3QHe4D97qU2dKXJ
	8yuWi4T54NW+SDwemkt6XF/20nFoWUjo7BL7y5qgUSsx8WjXlCRvJYJGrfRQ4E6xjXCwnjM3oYmfk
	VAbXwd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BCl-0000000AdO9-1vUf;
	Mon, 31 Aug 2026 23:14:19 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BCh-0000000AdMr-0OMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:14:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8FB711C9C7;
	Tue, 01 Sep 2026 01:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218049; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=G/4pCNbo+upZ0k4TXQBP77fIXcguXQOHsC6hBkuc0Xw=;
	b=YgUWpuZGHTshL6IDcQat5bRGu7CykG7AwTpDVquTxx4NpMuWvVnUwXx5+fKTPpjSbUNj65
	+C2Cz035Fxhmc95azaWcpGb9fQNmFQs34IuVPjNwE8w09xOAY1SkyjledBxBSiu6G6gyow
	sc+p9lHD6aI72xm0fEhB7eF9LUuLoB9nq3px97u9Zc438OOKiwbi+z7XNcPAzBuNmOpAhz
	AtLrz5E+ckVhbr3v53sh9QjKsHYdQ5TXsmR4msbNsLiUt9yEh20S7hES5eahy53ic0/kaT
	6YmGRv30Pqzz+LK7llHNpVz0vyw1VH7pIrKsseFiXtSK/ktazSgOG+wPnb2U0w==
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
Subject: [PATCH v5 2/2] soc: st: Add STM32MP2 SYSCFG driver
Date: Tue,  1 Sep 2026 01:13:25 +0200
Message-ID: <20260831231359.136475-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831231359.136475-1-marex@nabladev.com>
References: <20260831231359.136475-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_161415_415834_AE43D0E8 
X-CRM114-Status: GOOD (  18.76  )
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
V5: No change
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


