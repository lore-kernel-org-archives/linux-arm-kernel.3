Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sH+xZkZrlWCLVn5PSU/HsI1mSFzFtZNw1J3UtaFtBck=; b=L++Yz+3pYst4BLgTnCg7YrspOE
	fZCzmYX6SN0WF2Y7brRiFjtWvY6PC6ibnJhdXPH2cvx0uAymMD8cs+E5Z6xoKHkApi21UCI/O1ojZ
	t9990CDY3WaWdIbNxdEHY3opWkO9J1OOYKaQB7/cmKrfhTsJx/0H2O+GHoVMkCIgpyxCYixx+/AQJ
	uDGH/1wGEH/LQcn3lKDoujKFySbP4eLqOIL7ylj0JbMcidzhHnoyawOfewiXYfostJg3Ri04nWSS5
	NvTnCBCOHeED2LegJNx6xTTGYeCJPB10U34rAnTkxPtbtvuYOlsndKZPX3aHhCfUzrSrSoNMq+gXo
	Apcwl/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VA8-00000007CNj-3KRS;
	Tue, 15 Sep 2026 15:33:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9D-00000007Arl-1wqc;
	Tue, 15 Sep 2026 15:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sH+xZkZrlWCLVn5PSU/HsI1mSFzFtZNw1J3UtaFtBck=; b=lP0/Mx7eEOKPfOvzVDd+o+sxKz
	hHgEWefZfjaA569Tmb6CVza5EP050zlZ6UtcRwVrjx+VdTuISWQPpf9T+2pr6gN3sMmvXh8LZJzyA
	Dg+YhSJVznd/uW3KA3ekd5dL7B42NXUwej4FvVjsQCNVn80zaYmaz0LqjaOasqeh1yfZ6vev5KG6R
	xyX3ypjlMFoBG9XJupmN7XL9q6yRXKNEsORVvlCFoAyoO6mCqN1j3zZZMt+IY5i4saP0BOtOKGPRn
	U/7keWUxQIk6IL5umMWctAhDaC0Z/bclWjvgofgEEXWW91/y4nEXC1Va206ii2Mh202fTPoq/Dxmb
	7/zNZ+IA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V9A-00000006waN-1yiG;
	Tue, 15 Sep 2026 15:32:38 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153235euoutp01d106056cfad8e886be50a81efdaf1885~ViFvqP_nM0097300973euoutp01h;
	Tue, 15 Sep 2026 15:32:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260915153235euoutp01d106056cfad8e886be50a81efdaf1885~ViFvqP_nM0097300973euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486355;
	bh=sH+xZkZrlWCLVn5PSU/HsI1mSFzFtZNw1J3UtaFtBck=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=kqKPeHRF5yePqxPIuK6+gdKzJtT615Mg4WBfQgoClJYIyVITWHhQJRe0geV1/3Gme
	 ul0hz5bpi7t/9IoC9vdt9Hr2zoh4FLHq0AvoIxuY4FpsDtGuHL8vBrO9ia/tICwm8k
	 9yTPSpzuUCaKG58VDEFrxgyx5fK3lZHars1KnJHE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153234eucas1p221dd53b5f1bccb6228c0a5a7d0be8394~ViFvOwGKD1216312163eucas1p2Z;
	Tue, 15 Sep 2026 15:32:34 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153233eusmtip1b6ab608f7a1bbd071a84d43106b84560~ViFtoQCVP0419704197eusmtip12;
	Tue, 15 Sep 2026 15:32:33 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:20 +0200
Subject: [PATCH v4 12/20] soc: starfive: Add jh7110-hdmi-subsystem driver
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-12-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153234eucas1p221dd53b5f1bccb6228c0a5a7d0be8394
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153234eucas1p221dd53b5f1bccb6228c0a5a7d0be8394
X-EPHeader: CA
X-CMS-RootMailID: 20260915153234eucas1p221dd53b5f1bccb6228c0a5a7d0be8394
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153234eucas1p221dd53b5f1bccb6228c0a5a7d0be8394@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163236_690849_29F6C358 
X-CRM114-Status: GOOD (  23.20  )
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

Add the parent driver for the monolithic JH7110 HDMI IP block.

This driver binds to the starfive,jh7110-hdmi-subsystem node. It maps the
shared register block, creates a regmap, and calls
devm_of_platform_populate() to create its hdmi_phy and hdmi_controller
child devices, which retrieve the shared regmap from this parent.

The NoC display bus clock and reset that gate access to this region, and
the PD_VOUT power domain it sits in, are held by the video output
subsystem parent for as long as this device exists, so there is nothing
for this driver to bring up itself.

Co-developed-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Dominique Belhachemi <db@domibel.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/soc/Kconfig                          |  1 +
 drivers/soc/Makefile                         |  1 +
 drivers/soc/starfive/Kconfig                 | 28 +++++++++++
 drivers/soc/starfive/Makefile                |  2 +
 drivers/soc/starfive/jh7110-hdmi-subsystem.c | 73 ++++++++++++++++++++++++++++
 5 files changed, 105 insertions(+)

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb8052c0ac5a6b60bf33fa9c644701bb..b3b01fc38139d98076c14f626a42ae3b7ef7c5d6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb759384f690c2b65a82b3cb451c74..009f85ff891a15e0455f92c5d5a4059d8b1fcd3f 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..e738638ab0f755fbbabca259264abb56f3b6101f
--- /dev/null
+++ b/drivers/soc/starfive/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Starfive SoC drivers
+#
+
+if ARCH_STARFIVE || COMPILE_TEST
+menu "Starfive SoC drivers"
+
+config SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM
+	tristate "StarFive JH7110 HDMI subsystem driver"
+	depends on OF
+	select REGMAP_MMIO
+	help
+	  This option enables the parent driver
+	  for the monolithic StarFive JH7110 HDMI peripheral.
+
+	  The JH7110 HDMI IP block contains both the digital controller
+	  (DRM bridge) and the analog PHY (clock/phy provider) logic within
+	  a single shared register space.
+
+	  This driver acts as a wrapper. Its only job is to map the
+	  shared registers and create separate logical child devices
+	  for the "PHY" and the "controller". This is required to
+	  correctly manage resources and break a circular clock dependency
+	  between the PHY and the VOUT clock generator at probe time.
+
+endmenu
+endif
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..be89d8119212b7a7038817c2f0e8eac1984ada88
--- /dev/null
+++ b/drivers/soc/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM) += jh7110-hdmi-subsystem.o
diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
new file mode 100644
index 0000000000000000000000000000000000000000..e64a22263045935ae69541cf8a144f6128170c11
--- /dev/null
+++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the StarFive JH7110 HDMI subsystem
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * This driver binds to the monolithic HDMI block and creates separate
+ * logical platform devices for the HDMI Controller (bridge) and the
+ * HDMI PHY (clock/phy provider), allowing them to share a single regmap
+ * and breaking the probing circular dependency.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+static const struct regmap_config starfive_hdmi_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.max_register = 0x3fff,
+};
+
+static int starfive_hdmi_subsys_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *regs;
+	int ret;
+
+	/*
+	 * The NoC display bus clock and reset that gate access to this region,
+	 * and the PD_VOUT power domain it sits in, are held by the video
+	 * output subsystem parent for as long as this device exists.
+	 */
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	regmap = devm_regmap_init_mmio(dev, regs,
+				       &starfive_hdmi_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to init shared regmap\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to populate child devices\n");
+
+	return 0;
+}
+
+static const struct of_device_id starfive_hdmi_subsys_of_match[] = {
+	{ .compatible = "starfive,jh7110-hdmi-subsystem", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_subsys_of_match);
+
+static struct platform_driver starfive_hdmi_subsys_driver = {
+	.probe = starfive_hdmi_subsys_probe,
+	.driver = {
+		.name = "starfive-hdmi-subsystem",
+		.of_match_table = starfive_hdmi_subsys_of_match,
+	},
+};
+module_platform_driver(starfive_hdmi_subsys_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive JH7110 HDMI subsystem Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


