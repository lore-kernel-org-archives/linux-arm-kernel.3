Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994BEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=; b=PA3S69W/DNztLeE4aKKNQhaL0w
	zB4+uQ7sxJYEtVniOkXa/N2K39slO5CzSJ7zy0nH/qkTYd0YSGUqbNqz0EPr76VWFmoI79xbECxzN
	86DnkYBr6LIL7rQIRrmuqjDUeEbx6iTylyK02Q5H/BXtyYSo0Nnh0WnTIrHCA8mde4CZm+RjHZ6ad
	TNIB7qgz/cGgEdTfRWa5vYQns96Eyv12PaRooAmt7F4d6o9PWqGAWf4v7RpB8jhA/6Army9sGdAaa
	u16YSjs2mUxmSLfL5WThvExpKPuLgyDLCc1M0JPitz0RUDK/gD2RJ4z0V5B/t82vOOrB+APwyFOec
	0yOasK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fzL-00000005r0f-3ZJx;
	Tue, 15 Apr 2025 13:06:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fqP-00000005paU-3ayF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:56:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so48125115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721812; x=1745326612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
        b=ncLW0vTiMOKyJmh8reqMbkNmkhyzIiOGcm+ov0Zi1U/qBOgMDySKNpBfE9ZUdtnuPC
         WNfGcZ0WdnxAmm5TEb0ek2ts/IsX4/+FbB7TQpHKNSmssui3/7K5i/EGNQg4/QMA+RZK
         SEEoRmo2E0KF6Ilcj0IWo5tL3iHwcmd6n1bGORrWRdQeBpQe6Oy+kGpGMQ6T5mUrmlEL
         AWVxpcfcbQNRLj8M/DEZHDmvBNyBztur5JlimktVO9q+bmLYyMYwpexcQHWCaS/pAplN
         6xOJ6oE8SeG5dbzOZHh0Fhd4wc9hx+pUOSMvbeqU/5D9+TNIvIOrZuNQicRDWIhqjest
         mYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721812; x=1745326612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
        b=ZIBuRSF0uCNXVDJypyoAOOPus7WIj9k8aoKxz3lHoZFh4WiFlgTlHx2vxMLZytcKbI
         vqazHb0BzxRFhwbpbDNxhujxm38XpDC3CjwE4dC0VbM4LeMt1PKvaVrz1pNW9K8am63c
         WVFhjQBXJlrcV4berfKZnExEMjJbV4wZLRqXvsGVuHAk/iB8iGgLkkg2/eO9RBFCMFnz
         hp94Oa8bgO/qf2qMo7mB1IH1xvwnIX0VhQ1smRIr8uRvXXiVS610o+vGE5Eneokgp0vr
         NvgBgIN12DjgzXEydK6RnpFKErO04xO34RoplxgG9/elGc5d3cnpgqP0SqrvarpQYjxv
         MKfw==
X-Forwarded-Encrypted: i=1; AJvYcCVoYcFrWXzUcOrctNA5QjAQxNBqHr2nrYJYVi/HyPSGoEutAhKFMz+4tDRE3+pe8CSJubsFFvFBt16ISeyflsN8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6dKvuGLM9kLfTEXsMXLNOr3zYomb9YOQ8pIhtqDHJaz3x0WDs
	NAoQCYpPx36kto2o+L8Dc2K4X7SmIMpARyl9qbXcW0ahpqUT6Wryv4Jgs8RJ
X-Gm-Gg: ASbGncvdOwgEovvDdbvNgV+9oCLZ6UhZaosKrJ2Ky/4vYG5yqf5qdGORbbmLgHS72zv
	xaABaolAboxIqpJjQsxi8YS4kzw+E8EmctPPzo7s7ixBAKbVgX+xsciXBBPNPYQFMeQ8paB9abl
	7g/y3wdrBRpCqxPHev5wxOk8Pdmk27o2K+dsgjHqayiBwgl3awp7/1yOS+ySFI/0fSu4wuZmyLx
	pz9iQaaruBhs7dRsfnrycnWO2xVjxXmZHYAkcNpFyIweL7k22oEMCpLOGRW7kZ2fnYbJONrirbz
	cd81VPJSUmx8hLO3l+oWhFDqIdZe/U8XQYUfDm9ShcZmG3CK/7XLB5ZbMv8P0elj
X-Google-Smtp-Source: AGHT+IHM99iCt9uGoM1ut7bwj22u5iPsrbMzCmzAjPLvhvpnLXPGkQlOQNK8dR5lm5kw+uFojdnLkg==
X-Received: by 2002:a05:600c:674a:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43f4da84f37mr86587135e9.14.1744721812206;
        Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Tue, 15 Apr 2025 13:56:41 +0100
Message-ID: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055653_900370_9EF66099 
X-CRM114-Status: GOOD (  25.20  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 3c820ef56775..2c99b23f0faa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
 	  This selects the Qualcomm ETHQOS glue layer support for the
 	  stmmac device driver.
 
+config DWMAC_RENESAS_GBETH
+	tristate "Renesas RZ/V2H(P) GBETH support"
+	default ARCH_RENESAS
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	help
+	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
+	  RZ/V2H(P) SoCs.
+
+	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
+	  for the stmmac device driver.
+
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 594883fb4164..91050215511b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
+obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
new file mode 100644
index 000000000000..8674b7605d83
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
+ *
+ * The Rx and Tx clocks are supplied as follows for the GBETH IP.
+ *
+ *                         Rx / Tx
+ *   -------+------------- on / off -------
+ *          |
+ *          |            Rx-180 / Tx-180
+ *          +---- not ---- on / off -------
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "stmmac_platform.h"
+
+struct renesas_gbeth {
+	struct plat_stmmacenet_data *plat_dat;
+	struct reset_control *rstc;
+	struct device *dev;
+	void __iomem *regs;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool enabled)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+	if (enabled) {
+		ret = reset_control_deassert(gbeth->rstc);
+		if (ret) {
+			dev_err(gbeth->dev, "Reset deassert failed\n");
+			return ret;
+		}
+
+		ret = clk_bulk_prepare_enable(plat_dat->num_clks,
+					      plat_dat->clks);
+		if (ret)
+			reset_control_assert(gbeth->rstc);
+	} else {
+		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
+		ret = reset_control_assert(gbeth->rstc);
+		if (ret)
+			dev_err(gbeth->dev, "Reset assert failed\n");
+	}
+
+	return ret;
+}
+
+static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
+{
+	return renesas_gbeth_clks_config(priv, true);
+}
+
+static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
+{
+	renesas_gbeth_clks_config(priv, false);
+}
+
+static int renesas_gbeth_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct renesas_gbeth *gbeth;
+	unsigned int i;
+	int err;
+
+	err = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
+	if (!gbeth)
+		return -ENOMEM;
+
+	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
+				      sizeof(*plat_dat->clks), GFP_KERNEL);
+	if (!plat_dat->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < plat_dat->num_clks; i++)
+		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+
+	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
+	if (err < 0)
+		return err;
+
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
+	if (!plat_dat->clk_tx_i)
+		return dev_err_probe(dev, -EINVAL,
+				     "error finding tx clock\n");
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->regs = stmmac_res.addr;
+	gbeth->plat_dat = plat_dat;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->init = renesas_gbeth_init;
+	plat_dat->exit = renesas_gbeth_exit;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
+
+static struct platform_driver renesas_gbeth_driver = {
+	.probe  = renesas_gbeth_probe,
+	.driver = {
+		.name		= "renesas-gbeth",
+		.of_match_table	= renesas_gbeth_match,
+	},
+};
+module_platform_driver(renesas_gbeth_driver);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
+MODULE_LICENSE("GPL");
-- 
2.49.0


