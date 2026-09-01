Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A4BC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EHkAvHsm3tXJRfW61V9Nwz5YfGUf7x0btwCQ7xmRF0=; b=UplHCSdkkmjwxRVfv5ff0ucGy6
	U0miC439Sf7CBpDisK6XEKFszX43LCpLDJsCEdOgVdIGzmPdP11rz8bueKhK5puPHoAqJDqpKaZgy
	3XN6gH3cZCPYQJCIqFU4wLz+0Y+ucMP2dwouVr40qSXpiuSY8/m+8ASF5xxBaZEOPzw7y0Qo5YqS7
	pprFnC3iDXqJhroJWYKMu6K04N2h+gWOpuL6z3Wy6qVVe1AFzrEtrGJoTLleT4cNhfOh1BhzHw2JU
	hDrop7rdyAA+vEN83reuG4yz/nhIEl777zKAro+qZbXyE7+tpH/499QBLdYnbq2uFsy+0zy/0PTQf
	u4Jh+geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DJL-0000000Anmy-3OPK;
	Tue, 01 Sep 2026 01:29:15 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DJJ-0000000Anlq-2XjN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 01:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=2EHkAvHsm3tXJRfW61V9Nwz5YfGUf7x
	0btwCQ7xmRF0=; b=KBkcCBkG9VsHVa8XNuLh9WPCvBc6BB7Tpo1dYo+9QdWuqcL
	08TAAVhsjvSeKXtoHX1SpPiPsV2vJ+/xK23RkhYofOVbmrSBWerijNuJmC9vuoq6
	H+pn0tktOMbKqOAfaO6KyUYrJ+BVgJyjbtXNUBTzSylWS5wBTMWfc5++pLgE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwYZKpZqvx0AAA--.111S5;
	Tue, 01 Sep 2026 09:28:16 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 01 Sep 2026 09:27:32 +0800
Subject: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
In-Reply-To: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226062; l=4740;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=4YyHBLtGG2LcOMI+6YmjTZoaUhIKtIkM8GqV6DWeWXc=;
 b=UpCbbLEtk7hKeyhrK14ul4CdIYSq10f/Mr88NothDO802DPLg6yEMnu2KR9q5fozs18x2La9+
 9KK40M/+V3YCD0D+IAfSJY+9+/444t/hyTIlgwYxCDK1quoPNfUi/gM
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDnrwYZKpZqvx0AAA--.111S5
X-Coremail-Antispam: 1UD129KBjvJXoWxJw43XF45CF18tr4UKF47XFb_yoW7JrW7pF
	WDCa43Ar97Jr43Ka1fJw4kuF9Ygay8trWYga4fKw1SqFsIyryYqr1DK3yUAF1DGrWDXa4a
	yr4UCwnrCan0v37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7sRiuWl3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAFQAHsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_182913_991046_91768D1F 
X-CRM114-Status: GOOD (  21.41  )
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

The DP1000 GMAC integration provides fixed TX and RX RGMII clock delays
that cannot be disabled. For boards without PCB delays, "rgmii-id"
describes the link, but passing that mode unchanged to the PHY would enable
a second set of delays.

Use phy_fix_phy_mode_for_mac_delays() to translate "rgmii-id" to "rgmii"
before attaching the PHY. Reject other RGMII modes because the fixed MAC
delays cannot be combined with them without duplicating or omitting a
delay.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS                                        |  1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 +++++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 54 ++++++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b96ff0734e6..aacbab369b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28008,6 +28008,7 @@ ULTRARISC DP1000 DWMAC GLUE LAYER
 M:	Jia Wang <wangjia@ultrarisc.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
 
 ULTRARISC DP1000 PINCTRL DRIVER
 M:	Jia Wang <wangjia@ultrarisc.com>
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e3dd5adda5ac..ab3c4cf96423 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -319,6 +319,17 @@ config DWMAC_THEAD
 	  the stmmac device driver. This driver is used for T-HEAD TH1520
 	  ethernet controller.
 
+config DWMAC_ULTRARISC
+	tristate "UltraRISC DWMAC support"
+	default ARCH_ULTRARISC
+	depends on OF && (ARCH_ULTRARISC || COMPILE_TEST)
+	help
+	  Support for the Ethernet controller on the UltraRISC DP1000 SoC.
+
+	  This selects the UltraRISC platform specific glue layer support
+	  for the stmmac device driver. This driver is used for the DP1000
+	  GMAC Ethernet controller.
+
 config DWMAC_IMX8
 	tristate "NXP IMX8 DWMAC support"
 	default ARCH_MXC
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index a1cea2f57252..b16a456b730e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
 obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
 obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
+obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
 obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
 obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
new file mode 100644
index 000000000000..4bdda2665338
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UltraRISC DWMAC platform driver
+ *
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+
+static int ultrarisc_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat), "failed to parse DT parameters\n");
+
+	plat_dat->phy_interface =
+		phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface, true, true);
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+		return dev_err_probe(dev, -EINVAL, "unsupported phy interface mode\n");
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id ultrarisc_dwmac_match[] = {
+	{ .compatible = "ultrarisc,dp1000-gmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ultrarisc_dwmac_match);
+
+static struct platform_driver ultrarisc_dwmac_driver = {
+	.probe = ultrarisc_dwmac_probe,
+	.driver = {
+		.name = "ultrarisc-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = ultrarisc_dwmac_match,
+	},
+};
+module_platform_driver(ultrarisc_dwmac_driver);
+
+MODULE_DESCRIPTION("UltraRISC DWMAC platform driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


