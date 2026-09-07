Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B28C79FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atDrDIj1PcjKidTFHnL55UaKYtXCuL3hBASpWFdruY8=; b=hvuPUIh54hV5ZDNaO0xE0xCJm9
	oOYinR59ERpR41PBUy64uk/PDyVdxFI17GgNHUvoRcTB5uS0SOM11q4vTFd/yNJhlzQPUc/C4EByx
	g4sbvOEAw9n+OiTCnGBn5HJNlsWdLkxsoDhKV+7zHe1vRYxm4Xc83vRebDCWSaQfawZ5VmqQQrbdo
	/5JunmyPzV4ZqthNz7exLi0ve8Xu1JorpKN7gKXt7ShK4DpICub5pbmzI1EwzpoDAT7XjfUfqdgGI
	JX6iIYNWRPYle14aIR+QshBBzwlkzidvsbhRe2R0gu6hrXOCNsD1+EkKtlq0A4OQ5Y0NMrMAae78M
	DUAyl0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAm-00000006CHb-3j8h;
	Mon, 07 Sep 2026 07:53:48 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UAc-00000006CE1-3axJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=atDrDIj1PcjKidTFHnL55UaKYtXCuL3
	hBASpWFdruY8=; b=qQMDxo0uhM2xATPD9kUqsI4XafS8ffqKSBddZagzdL0h2d2
	6P7SY7IchW58qpVRciRM+eTJsooa30zDKgCwwTid4xQmmgcGLwxJvwV2VVJ2oqe0
	G/FMFMP9DrxNJR1kJmHof6c5zFcpHnrDhnwoZ55Zpvt8B02ESsmCEqmNC1dg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAf_a55qnlUAAA--.364S7;
	Mon, 07 Sep 2026 15:47:26 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 07 Sep 2026 15:46:54 +0800
Subject: [PATCH net-next v2 5/5] net: stmmac: Add UltraRISC DP1000 GMAC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-dwmac-ultrarisc-v2-5-9a39bf8db313@ultrarisc.com>
References: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
In-Reply-To: <20260907-dwmac-ultrarisc-v2-0-9a39bf8db313@ultrarisc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Jia Wang <wangjia@ultrarisc.com>, 
 sophgo@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788767221; l=4434;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=yTRJ3O2vGzuKktzCTO2ExXjbMgtp5fK54GThI+QzDJk=;
 b=wDw1qcKWmwEtubwcSkYU+uZyIRt7R2Vkdkz38DrQgy66mEEWAge3zp5nn9c9vAPbSQU5CpG/I
 kgS/iquNGGWBE+DZWk4Stnw5XECEOF0zPWM0Aa6MW2Q7u19Dye9CpZv
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwDHQAf_a55qnlUAAA--.364S7
X-Coremail-Antispam: 1UD129KBjvJXoWxZr43JFy7CFWrtF4xZw15CFg_yoWruF4DpF
	WDCa43Zr97Jr43Ka1fJw1kuF95tay8trW7WFyfKwnaqFZ0yryYqr9rK3y5AF1DGrWDXFy2
	yr4UCwnrCan0v37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRiF4iUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQACEWqdDaQAAQAVsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_005344_183916_C99A0E5E 
X-CRM114-Status: GOOD (  20.80  )
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

The UltraRISC DP1000 GMAC provides fixed internal delays on both TX and RX
RGMII clock paths.

Add a platform glue driver and describe both delay capabilities through
the common stmmac platform data. This lets the common RGMII delay handling
adjust the interface mode passed to the PHY and reject incompatible RGMII
modes.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS                                        |  1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        | 11 +++++
 drivers/net/ethernet/stmicro/stmmac/Makefile       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c  | 52 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01597d1df270..d6fb876227e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27999,6 +27999,7 @@ ULTRARISC DP1000 DWMAC GLUE LAYER
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
index 000000000000..0b62a75b782a
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UltraRISC DWMAC platform driver
+ *
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include <linux/module.h>
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
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	plat_dat->has_internal_tx_delay = true;
+	plat_dat->has_internal_rx_delay = true;
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


