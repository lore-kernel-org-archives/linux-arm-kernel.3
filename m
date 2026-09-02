Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCAEC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MlWIf/rhQtWIeK3PR/Jn68vrbe6t2nijYn3wmvqbXE=; b=tt4xsl49GkYXjvm7JMRbaabccF
	0yLBiZPOXQVhDO5tmoz8tM0nAv6MV2Io0JWd6kZOn/jdqTVZbtR12Dy0RDoQkYASD8OkZe0DVYXuL
	X3z9OUp5AR51X2F+uM8qcCeUBZ6Ik1Ljbfq6Xk3+6UpsX9t94t3aAH8Pc+nHLPi362SyfO2RDx9qH
	IOOfBAXysxU1pslesY06wS900A6mfkGkuzL38MqkQUtTK0bIUaCHTuRvJYDJqSD2DTNyCLOyDKih7
	dd+nXASGKDom+xXFocZg5dstXbtCpuugJK6hkfrRKSLYYNypUpypmecPVzFgcDnLVZ+N+jt/UZP67
	bgNSp31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGa-0000000EhNI-0BRW;
	Wed, 02 Sep 2026 12:40:36 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kGX-0000000EhML-1TyS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:40:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9927911CE7D;
	Wed, 02 Sep 2026 14:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788352827; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0MlWIf/rhQtWIeK3PR/Jn68vrbe6t2nijYn3wmvqbXE=;
	b=ie/xkNW5efq5r94PiyZTboE9/pa9CusF4qknKZjXw1AcHaaOHX+cU9AUad5IqbqpwZlV2K
	hth3ZSv+LK0bc7veslnXVEOL+mwwgMaaRLJ+CjFwDufmP6slSoyIbeoN/mCrpdGNSFEPX6
	8xwPL3fIcjI+Uv4J5vtTdpTetbUYhL5cX+mR3so4mp0NCCKySbtxQyRX2uUbhrqlsFikfh
	/qBtg6K1w5e0PkiPW9txEDqUAtbahHhY2de+IEs2ce2GIPAZsojg9Vjtl6HOizOYgkGApJ
	ouzNMMpyc3aV55Su9ZwuAI5dv4o+d5zd8BXCTzCvacu05Glr+/kQAVNkQh0hSw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
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
Subject: [PATCH v6 2/2] soc: st: Add STM32MP2 SYSCFG driver
Date: Wed,  2 Sep 2026 14:39:50 +0200
Message-ID: <20260902124018.606544-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
References: <20260902124018.606544-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_054033_670411_E04D534F 
X-CRM114-Status: GOOD (  19.28  )
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

Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
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
V6: - Fix up the SPDX-License-Identifier
    - Add AB/TB from Fabrice
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
index 0000000000000..770321a4a6f71
--- /dev/null
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only
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


